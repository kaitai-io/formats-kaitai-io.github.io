import kaitai_struct_nim_runtime
import options

type
  SshPublicKey* = ref object of KaitaiStruct
    `keyName`*: SshPublicKey_Cstring
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
  SshPublicKey_Bignum2* = ref object of KaitaiStruct
    `len`*: uint32
    `body`*: seq[byte]
    `parent`*: KaitaiStruct
    `lengthInBitsInst`: int
    `lengthInBitsInstFlag`: bool
  SshPublicKey_Cstring* = ref object of KaitaiStruct
    `len`*: uint32
    `value`*: string
    `parent`*: KaitaiStruct
  SshPublicKey_EllipticCurve* = ref object of KaitaiStruct
    `len`*: uint32
    `body`*: seq[byte]
    `parent`*: SshPublicKey_KeyEcdsa
  SshPublicKey_KeyDsa* = ref object of KaitaiStruct
    `dsaP`*: SshPublicKey_Bignum2
    `dsaQ`*: SshPublicKey_Bignum2
    `dsaG`*: SshPublicKey_Bignum2
    `dsaPubKey`*: SshPublicKey_Bignum2
    `parent`*: SshPublicKey
  SshPublicKey_KeyEcdsa* = ref object of KaitaiStruct
    `curveName`*: SshPublicKey_Cstring
    `ec`*: SshPublicKey_EllipticCurve
    `parent`*: SshPublicKey
  SshPublicKey_KeyEd25519* = ref object of KaitaiStruct
    `lenPk`*: uint32
    `pk`*: seq[byte]
    `parent`*: SshPublicKey
  SshPublicKey_KeyRsa* = ref object of KaitaiStruct
    `rsaE`*: SshPublicKey_Bignum2
    `rsaN`*: SshPublicKey_Bignum2
    `parent`*: SshPublicKey
    `keyLengthInst`: int
    `keyLengthInstFlag`: bool

proc read*(_: typedesc[SshPublicKey], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SshPublicKey
proc read*(_: typedesc[SshPublicKey_Bignum2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SshPublicKey_Bignum2
proc read*(_: typedesc[SshPublicKey_Cstring], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SshPublicKey_Cstring
proc read*(_: typedesc[SshPublicKey_EllipticCurve], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey_KeyEcdsa): SshPublicKey_EllipticCurve
proc read*(_: typedesc[SshPublicKey_KeyDsa], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyDsa
proc read*(_: typedesc[SshPublicKey_KeyEcdsa], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyEcdsa
proc read*(_: typedesc[SshPublicKey_KeyEd25519], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyEd25519
proc read*(_: typedesc[SshPublicKey_KeyRsa], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyRsa

proc lengthInBits*(this: SshPublicKey_Bignum2): int
proc keyLength*(this: SshPublicKey_KeyRsa): int


##[
SSH public keys are encoded in a special binary format, typically represented
to end users as either one-liner OpenSSH format or multi-line PEM format
(commerical SSH). Text wrapper carries extra information about user who
created the key, comment, etc, but the inner binary is always base64-encoded
and follows the same internal format.

This format spec deals with this internal binary format (called "blob" in
openssh sources) only. Buffer is expected to be raw binary and not base64-d.
Implementation closely follows code in OpenSSH.

@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L1970">Source</a>
]##
proc read*(_: typedesc[SshPublicKey], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SshPublicKey =
  template this: untyped = result
  this = new(SshPublicKey)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyNameExpr = SshPublicKey_Cstring.read(this.io, this.root, this)
  this.keyName = keyNameExpr
  block:
    let on = this.keyName.value
    if on == "ecdsa-sha2-nistp256":
      let bodyExpr = SshPublicKey_KeyEcdsa.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == "ssh-dss":
      let bodyExpr = SshPublicKey_KeyDsa.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == "ssh-ed25519":
      let bodyExpr = SshPublicKey_KeyEd25519.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == "ssh-rsa":
      let bodyExpr = SshPublicKey_KeyRsa.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[SshPublicKey], filename: string): SshPublicKey =
  SshPublicKey.read(newKaitaiFileStream(filename), nil, nil)


##[
Big integers serialization format used by ssh, v2. In the code, the following
routines are used to read/write it:

* sshbuf_get_bignum2
* sshbuf_get_bignum2_bytes_direct
* sshbuf_put_bignum2
* sshbuf_get_bignum2_bytes_direct

@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L35
https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L431
">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_Bignum2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SshPublicKey_Bignum2 =
  template this: untyped = result
  this = new(SshPublicKey_Bignum2)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4be()
  this.len = lenExpr
  let bodyExpr = this.io.readBytes(int(this.len))
  this.body = bodyExpr

proc lengthInBits(this: SshPublicKey_Bignum2): int = 

  ##[
  Length of big integer in bits. In OpenSSH sources, this corresponds to
`BN_num_bits` function.

  ]##
  if this.lengthInBitsInstFlag:
    return this.lengthInBitsInst
  let lengthInBitsInstExpr = int((this.len - 1) * 8)
  this.lengthInBitsInst = lengthInBitsInstExpr
  this.lengthInBitsInstFlag = true
  return this.lengthInBitsInst

proc fromFile*(_: typedesc[SshPublicKey_Bignum2], filename: string): SshPublicKey_Bignum2 =
  SshPublicKey_Bignum2.read(newKaitaiFileStream(filename), nil, nil)


##[
A integer-prefixed string designed to be read using `sshbuf_get_cstring`
and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
obscure misnomer, as typically "C string" means a null-terminated string.

@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_Cstring], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SshPublicKey_Cstring =
  template this: untyped = result
  this = new(SshPublicKey_Cstring)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4be()
  this.len = lenExpr
  let valueExpr = encode(this.io.readBytes(int(this.len)), "ASCII")
  this.value = valueExpr

proc fromFile*(_: typedesc[SshPublicKey_Cstring], filename: string): SshPublicKey_Cstring =
  SshPublicKey_Cstring.read(newKaitaiFileStream(filename), nil, nil)


##[
Elliptic curve dump format used by ssh. In OpenSSH code, the following
routines are used to read/write it:

* sshbuf_get_ec
* get_ec

@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_EllipticCurve], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey_KeyEcdsa): SshPublicKey_EllipticCurve =
  template this: untyped = result
  this = new(SshPublicKey_EllipticCurve)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4be()
  this.len = lenExpr
  let bodyExpr = this.io.readBytes(int(this.len))
  this.body = bodyExpr

proc fromFile*(_: typedesc[SshPublicKey_EllipticCurve], filename: string): SshPublicKey_EllipticCurve =
  SshPublicKey_EllipticCurve.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_KeyDsa], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyDsa =
  template this: untyped = result
  this = new(SshPublicKey_KeyDsa)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dsaPExpr = SshPublicKey_Bignum2.read(this.io, this.root, this)
  this.dsaP = dsaPExpr
  let dsaQExpr = SshPublicKey_Bignum2.read(this.io, this.root, this)
  this.dsaQ = dsaQExpr
  let dsaGExpr = SshPublicKey_Bignum2.read(this.io, this.root, this)
  this.dsaG = dsaGExpr
  let dsaPubKeyExpr = SshPublicKey_Bignum2.read(this.io, this.root, this)
  this.dsaPubKey = dsaPubKeyExpr

proc fromFile*(_: typedesc[SshPublicKey_KeyDsa], filename: string): SshPublicKey_KeyDsa =
  SshPublicKey_KeyDsa.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_KeyEcdsa], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyEcdsa =
  template this: untyped = result
  this = new(SshPublicKey_KeyEcdsa)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let curveNameExpr = SshPublicKey_Cstring.read(this.io, this.root, this)
  this.curveName = curveNameExpr
  let ecExpr = SshPublicKey_EllipticCurve.read(this.io, this.root, this)
  this.ec = ecExpr

proc fromFile*(_: typedesc[SshPublicKey_KeyEcdsa], filename: string): SshPublicKey_KeyEcdsa =
  SshPublicKey_KeyEcdsa.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_KeyEd25519], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyEd25519 =
  template this: untyped = result
  this = new(SshPublicKey_KeyEd25519)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenPkExpr = this.io.readU4be()
  this.lenPk = lenPkExpr
  let pkExpr = this.io.readBytes(int(this.lenPk))
  this.pk = pkExpr

proc fromFile*(_: typedesc[SshPublicKey_KeyEd25519], filename: string): SshPublicKey_KeyEd25519 =
  SshPublicKey_KeyEd25519.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028">Source</a>
]##
proc read*(_: typedesc[SshPublicKey_KeyRsa], io: KaitaiStream, root: KaitaiStruct, parent: SshPublicKey): SshPublicKey_KeyRsa =
  template this: untyped = result
  this = new(SshPublicKey_KeyRsa)
  let root = if root == nil: cast[SshPublicKey](this) else: cast[SshPublicKey](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Public key exponent, designated `e` in RSA documentation.
  ]##
  let rsaEExpr = SshPublicKey_Bignum2.read(this.io, this.root, this)
  this.rsaE = rsaEExpr

  ##[
  Modulus of both public and private keys, designated `n` in RSA
documentation. Its length in bits is designated as "key length".

  ]##
  let rsaNExpr = SshPublicKey_Bignum2.read(this.io, this.root, this)
  this.rsaN = rsaNExpr

proc keyLength(this: SshPublicKey_KeyRsa): int = 

  ##[
  Key length in bits
  ]##
  if this.keyLengthInstFlag:
    return this.keyLengthInst
  let keyLengthInstExpr = int(this.rsaN.lengthInBits)
  this.keyLengthInst = keyLengthInstExpr
  this.keyLengthInstFlag = true
  return this.keyLengthInst

proc fromFile*(_: typedesc[SshPublicKey_KeyRsa], filename: string): SshPublicKey_KeyRsa =
  SshPublicKey_KeyRsa.read(newKaitaiFileStream(filename), nil, nil)

