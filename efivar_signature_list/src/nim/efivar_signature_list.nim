import kaitai_struct_nim_runtime
import options

type
  EfivarSignatureList* = ref object of KaitaiStruct
    `varAttributes`*: EfivarSignatureList_EfiVarAttr
    `signatures`*: seq[EfivarSignatureList_SignatureList]
    `parent`*: KaitaiStruct
  EfivarSignatureList_SignatureList* = ref object of KaitaiStruct
    `signatureType`*: seq[byte]
    `lenSignatureList`*: uint32
    `lenSignatureHeader`*: uint32
    `lenSignature`*: uint32
    `header`*: seq[byte]
    `signatures`*: seq[EfivarSignatureList_SignatureData]
    `parent`*: EfivarSignatureList
    `rawSignatures`*: seq[seq[byte]]
    `isCertSha512X509Inst`: bool
    `isCertSha512X509InstFlag`: bool
    `isCertSha224Inst`: bool
    `isCertSha224InstFlag`: bool
    `isCertX509Inst`: bool
    `isCertX509InstFlag`: bool
    `isCertSha256X509Inst`: bool
    `isCertSha256X509InstFlag`: bool
    `isCertRsa2048KeyInst`: bool
    `isCertRsa2048KeyInstFlag`: bool
    `isCertSha512Inst`: bool
    `isCertSha512InstFlag`: bool
    `isCertSha384Inst`: bool
    `isCertSha384InstFlag`: bool
    `isCertSha1Inst`: bool
    `isCertSha1InstFlag`: bool
    `isCertRsa2048Sha1Inst`: bool
    `isCertRsa2048Sha1InstFlag`: bool
    `isCertSha256Inst`: bool
    `isCertSha256InstFlag`: bool
    `isCertSha384X509Inst`: bool
    `isCertSha384X509InstFlag`: bool
    `isCertRsa2048Sha256Inst`: bool
    `isCertRsa2048Sha256InstFlag`: bool
    `isCertDerPkcs7Inst`: bool
    `isCertDerPkcs7InstFlag`: bool
  EfivarSignatureList_SignatureData* = ref object of KaitaiStruct
    `owner`*: seq[byte]
    `data`*: seq[byte]
    `parent`*: EfivarSignatureList_SignatureList
  EfivarSignatureList_EfiVarAttr* = ref object of KaitaiStruct
    `enhancedAuthenticatedAccess`*: bool
    `appendWrite`*: bool
    `timeBasedAuthenticatedWriteAccess`*: bool
    `authenticatedWriteAccess`*: bool
    `hardwareErrorRecord`*: bool
    `runtimeAccess`*: bool
    `bootserviceAccess`*: bool
    `nonVolatile`*: bool
    `reserved1`*: uint64
    `parent`*: EfivarSignatureList

proc read*(_: typedesc[EfivarSignatureList], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): EfivarSignatureList
proc read*(_: typedesc[EfivarSignatureList_SignatureList], io: KaitaiStream, root: KaitaiStruct, parent: EfivarSignatureList): EfivarSignatureList_SignatureList
proc read*(_: typedesc[EfivarSignatureList_SignatureData], io: KaitaiStream, root: KaitaiStruct, parent: EfivarSignatureList_SignatureList): EfivarSignatureList_SignatureData
proc read*(_: typedesc[EfivarSignatureList_EfiVarAttr], io: KaitaiStream, root: KaitaiStruct, parent: EfivarSignatureList): EfivarSignatureList_EfiVarAttr

proc isCertSha512X509*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha224*(this: EfivarSignatureList_SignatureList): bool
proc isCertX509*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha256X509*(this: EfivarSignatureList_SignatureList): bool
proc isCertRsa2048Key*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha512*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha384*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha1*(this: EfivarSignatureList_SignatureList): bool
proc isCertRsa2048Sha1*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha256*(this: EfivarSignatureList_SignatureList): bool
proc isCertSha384X509*(this: EfivarSignatureList_SignatureList): bool
proc isCertRsa2048Sha256*(this: EfivarSignatureList_SignatureList): bool
proc isCertDerPkcs7*(this: EfivarSignatureList_SignatureList): bool


##[
Parse UEFI variables db and dbx that contain signatures, certificates and
hashes. On a Linux system using UEFI, these variables are readable from
/sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f,
/sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c,
/sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f and
/sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c.
("d719b2cb-3d3a-4596-a3bc-dad00e67656f" is defined as
EFI_IMAGE_SECURITY_DATABASE_GUID and "8be4df61-93ca-11d2-aa0d-00e098032b8c"
as EFI_GLOBAL_VARIABLE).
Each file contains an EFI attribute (32-bit integer) followed by a list of
EFI_SIGNATURE_LIST structures.

@see <a href="https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf">Source</a>
]##
proc read*(_: typedesc[EfivarSignatureList], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): EfivarSignatureList =
  template this: untyped = result
  this = new(EfivarSignatureList)
  let root = if root == nil: cast[EfivarSignatureList](this) else: cast[EfivarSignatureList](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Attributes of the UEFI variable
  ]##
  let varAttributesExpr = EfivarSignatureList_EfiVarAttr.read(this.io, this.root, this)
  this.varAttributes = varAttributesExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = EfivarSignatureList_SignatureList.read(this.io, this.root, this)
      this.signatures.add(it)
      inc i

proc fromFile*(_: typedesc[EfivarSignatureList], filename: string): EfivarSignatureList =
  EfivarSignatureList.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "EFI_SIGNATURE_LIST"
]##
proc read*(_: typedesc[EfivarSignatureList_SignatureList], io: KaitaiStream, root: KaitaiStruct, parent: EfivarSignatureList): EfivarSignatureList_SignatureList =
  template this: untyped = result
  this = new(EfivarSignatureList_SignatureList)
  let root = if root == nil: cast[EfivarSignatureList](this) else: cast[EfivarSignatureList](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Type of the signature as a GUID
  ]##
  let signatureTypeExpr = this.io.readBytes(int(16))
  this.signatureType = signatureTypeExpr

  ##[
  Total size of the signature list, including this header
  ]##
  let lenSignatureListExpr = this.io.readU4le()
  this.lenSignatureList = lenSignatureListExpr

  ##[
  Size of the signature header which precedes the array of signatures
  ]##
  let lenSignatureHeaderExpr = this.io.readU4le()
  this.lenSignatureHeader = lenSignatureHeaderExpr

  ##[
  Size of each signature
  ]##
  let lenSignatureExpr = this.io.readU4le()
  this.lenSignature = lenSignatureExpr

  ##[
  Header before the array of signatures
  ]##
  let headerExpr = this.io.readBytes(int(this.lenSignatureHeader))
  this.header = headerExpr

  ##[
  An array of signatures
  ]##
  if this.lenSignature > 0:
    for i in 0 ..< int((((this.lenSignatureList - this.lenSignatureHeader) - 28) div this.lenSignature)):
      let buf = this.io.readBytes(int(this.lenSignature))
      this.rawSignatures.add(buf)
      let rawSignaturesIo = newKaitaiStream(buf)
      let it = EfivarSignatureList_SignatureData.read(rawSignaturesIo, this.root, this)
      this.signatures.add(it)

proc isCertSha512X509(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
  @see "EFI_CERT_X509_SHA512_GUID"
  ]##
  if this.isCertSha512X509InstFlag:
    return this.isCertSha512X509Inst
  let isCertSha512X509InstExpr = bool(this.signatureType == @[99'u8, 191'u8, 109'u8, 68'u8, 2'u8, 37'u8, 218'u8, 76'u8, 188'u8, 250'u8, 36'u8, 101'u8, 210'u8, 176'u8, 254'u8, 157'u8])
  this.isCertSha512X509Inst = isCertSha512X509InstExpr
  this.isCertSha512X509InstFlag = true
  return this.isCertSha512X509Inst

proc isCertSha224(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA-224 hash
  @see "EFI_CERT_SHA224_GUID"
  ]##
  if this.isCertSha224InstFlag:
    return this.isCertSha224Inst
  let isCertSha224InstExpr = bool(this.signatureType == @[51'u8, 82'u8, 110'u8, 11'u8, 92'u8, 166'u8, 201'u8, 68'u8, 148'u8, 7'u8, 217'u8, 171'u8, 131'u8, 191'u8, 200'u8, 189'u8])
  this.isCertSha224Inst = isCertSha224InstExpr
  this.isCertSha224InstFlag = true
  return this.isCertSha224Inst

proc isCertX509(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  X.509 certificate
  @see "EFI_CERT_X509_GUID"
  ]##
  if this.isCertX509InstFlag:
    return this.isCertX509Inst
  let isCertX509InstExpr = bool(this.signatureType == @[161'u8, 89'u8, 192'u8, 165'u8, 228'u8, 148'u8, 167'u8, 74'u8, 135'u8, 181'u8, 171'u8, 21'u8, 92'u8, 43'u8, 240'u8, 114'u8])
  this.isCertX509Inst = isCertX509InstExpr
  this.isCertX509InstFlag = true
  return this.isCertX509Inst

proc isCertSha256X509(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
  @see "EFI_CERT_X509_SHA256_GUID"
  ]##
  if this.isCertSha256X509InstFlag:
    return this.isCertSha256X509Inst
  let isCertSha256X509InstExpr = bool(this.signatureType == @[146'u8, 164'u8, 210'u8, 59'u8, 192'u8, 150'u8, 121'u8, 64'u8, 180'u8, 32'u8, 252'u8, 249'u8, 142'u8, 241'u8, 3'u8, 237'u8])
  this.isCertSha256X509Inst = isCertSha256X509InstExpr
  this.isCertSha256X509InstFlag = true
  return this.isCertSha256X509Inst

proc isCertRsa2048Key(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
  @see "EFI_CERT_RSA2048_GUID"
  ]##
  if this.isCertRsa2048KeyInstFlag:
    return this.isCertRsa2048KeyInst
  let isCertRsa2048KeyInstExpr = bool(this.signatureType == @[232'u8, 102'u8, 87'u8, 60'u8, 156'u8, 38'u8, 52'u8, 78'u8, 170'u8, 20'u8, 237'u8, 119'u8, 110'u8, 133'u8, 179'u8, 182'u8])
  this.isCertRsa2048KeyInst = isCertRsa2048KeyInstExpr
  this.isCertRsa2048KeyInstFlag = true
  return this.isCertRsa2048KeyInst

proc isCertSha512(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA-512 hash
  @see "EFI_CERT_SHA512_GUID"
  ]##
  if this.isCertSha512InstFlag:
    return this.isCertSha512Inst
  let isCertSha512InstExpr = bool(this.signatureType == @[174'u8, 15'u8, 62'u8, 9'u8, 196'u8, 166'u8, 80'u8, 79'u8, 159'u8, 27'u8, 212'u8, 30'u8, 43'u8, 137'u8, 193'u8, 154'u8])
  this.isCertSha512Inst = isCertSha512InstExpr
  this.isCertSha512InstFlag = true
  return this.isCertSha512Inst

proc isCertSha384(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA-384 hash
  @see "EFI_CERT_SHA384_GUID"
  ]##
  if this.isCertSha384InstFlag:
    return this.isCertSha384Inst
  let isCertSha384InstExpr = bool(this.signatureType == @[7'u8, 83'u8, 62'u8, 255'u8, 208'u8, 159'u8, 201'u8, 72'u8, 133'u8, 241'u8, 138'u8, 213'u8, 108'u8, 112'u8, 30'u8, 1'u8])
  this.isCertSha384Inst = isCertSha384InstExpr
  this.isCertSha384InstFlag = true
  return this.isCertSha384Inst

proc isCertSha1(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA-1 hash
  @see "EFI_CERT_SHA1_GUID"
  ]##
  if this.isCertSha1InstFlag:
    return this.isCertSha1Inst
  let isCertSha1InstExpr = bool(this.signatureType == @[18'u8, 165'u8, 108'u8, 130'u8, 16'u8, 207'u8, 201'u8, 74'u8, 177'u8, 135'u8, 190'u8, 1'u8, 73'u8, 102'u8, 49'u8, 189'u8])
  this.isCertSha1Inst = isCertSha1InstExpr
  this.isCertSha1InstFlag = true
  return this.isCertSha1Inst

proc isCertRsa2048Sha1(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  RSA-2048 signature of a SHA-1 hash
  @see "EFI_CERT_RSA2048_SHA1_GUID"
  ]##
  if this.isCertRsa2048Sha1InstFlag:
    return this.isCertRsa2048Sha1Inst
  let isCertRsa2048Sha1InstExpr = bool(this.signatureType == @[79'u8, 68'u8, 248'u8, 103'u8, 67'u8, 135'u8, 241'u8, 72'u8, 163'u8, 40'u8, 30'u8, 170'u8, 184'u8, 115'u8, 96'u8, 128'u8])
  this.isCertRsa2048Sha1Inst = isCertRsa2048Sha1InstExpr
  this.isCertRsa2048Sha1InstFlag = true
  return this.isCertRsa2048Sha1Inst

proc isCertSha256(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA-256 hash
  @see "EFI_CERT_SHA256_GUID"
  ]##
  if this.isCertSha256InstFlag:
    return this.isCertSha256Inst
  let isCertSha256InstExpr = bool(this.signatureType == @[38'u8, 22'u8, 196'u8, 193'u8, 76'u8, 80'u8, 146'u8, 64'u8, 172'u8, 169'u8, 65'u8, 249'u8, 54'u8, 147'u8, 67'u8, 40'u8])
  this.isCertSha256Inst = isCertSha256InstExpr
  this.isCertSha256InstFlag = true
  return this.isCertSha256Inst

proc isCertSha384X509(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
  @see "EFI_CERT_X509_SHA384_GUID"
  ]##
  if this.isCertSha384X509InstFlag:
    return this.isCertSha384X509Inst
  let isCertSha384X509InstExpr = bool(this.signatureType == @[110'u8, 135'u8, 118'u8, 112'u8, 194'u8, 128'u8, 230'u8, 78'u8, 170'u8, 210'u8, 40'u8, 179'u8, 73'u8, 166'u8, 134'u8, 91'u8])
  this.isCertSha384X509Inst = isCertSha384X509InstExpr
  this.isCertSha384X509InstFlag = true
  return this.isCertSha384X509Inst

proc isCertRsa2048Sha256(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  RSA-2048 signature of a SHA-256 hash
  @see "EFI_CERT_RSA2048_SHA256_GUID"
  ]##
  if this.isCertRsa2048Sha256InstFlag:
    return this.isCertRsa2048Sha256Inst
  let isCertRsa2048Sha256InstExpr = bool(this.signatureType == @[144'u8, 97'u8, 179'u8, 226'u8, 155'u8, 135'u8, 61'u8, 74'u8, 173'u8, 141'u8, 242'u8, 231'u8, 187'u8, 163'u8, 39'u8, 132'u8])
  this.isCertRsa2048Sha256Inst = isCertRsa2048Sha256InstExpr
  this.isCertRsa2048Sha256InstFlag = true
  return this.isCertRsa2048Sha256Inst

proc isCertDerPkcs7(this: EfivarSignatureList_SignatureList): bool = 

  ##[
  DER-encoded PKCS #7 version 1.5 [RFC2315]
  @see "EFI_CERT_TYPE_PKCS7_GUID"
  ]##
  if this.isCertDerPkcs7InstFlag:
    return this.isCertDerPkcs7Inst
  let isCertDerPkcs7InstExpr = bool(this.signatureType == @[157'u8, 210'u8, 175'u8, 74'u8, 223'u8, 104'u8, 238'u8, 73'u8, 138'u8, 169'u8, 52'u8, 125'u8, 55'u8, 86'u8, 101'u8, 167'u8])
  this.isCertDerPkcs7Inst = isCertDerPkcs7InstExpr
  this.isCertDerPkcs7InstFlag = true
  return this.isCertDerPkcs7Inst

proc fromFile*(_: typedesc[EfivarSignatureList_SignatureList], filename: string): EfivarSignatureList_SignatureList =
  EfivarSignatureList_SignatureList.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "EFI_SIGNATURE_DATA"
]##
proc read*(_: typedesc[EfivarSignatureList_SignatureData], io: KaitaiStream, root: KaitaiStruct, parent: EfivarSignatureList_SignatureList): EfivarSignatureList_SignatureData =
  template this: untyped = result
  this = new(EfivarSignatureList_SignatureData)
  let root = if root == nil: cast[EfivarSignatureList](this) else: cast[EfivarSignatureList](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  An identifier which identifies the agent which added the signature to the list
  ]##
  let ownerExpr = this.io.readBytes(int(16))
  this.owner = ownerExpr

  ##[
  The format of the signature is defined by the SignatureType.
  ]##
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[EfivarSignatureList_SignatureData], filename: string): EfivarSignatureList_SignatureData =
  EfivarSignatureList_SignatureData.read(newKaitaiFileStream(filename), nil, nil)


##[
Attributes of a UEFI variable
]##
proc read*(_: typedesc[EfivarSignatureList_EfiVarAttr], io: KaitaiStream, root: KaitaiStruct, parent: EfivarSignatureList): EfivarSignatureList_EfiVarAttr =
  template this: untyped = result
  this = new(EfivarSignatureList_EfiVarAttr)
  let root = if root == nil: cast[EfivarSignatureList](this) else: cast[EfivarSignatureList](root)
  this.io = io
  this.root = root
  this.parent = parent

  let enhancedAuthenticatedAccessExpr = this.io.readBitsIntBe(1) != 0
  this.enhancedAuthenticatedAccess = enhancedAuthenticatedAccessExpr
  let appendWriteExpr = this.io.readBitsIntBe(1) != 0
  this.appendWrite = appendWriteExpr
  let timeBasedAuthenticatedWriteAccessExpr = this.io.readBitsIntBe(1) != 0
  this.timeBasedAuthenticatedWriteAccess = timeBasedAuthenticatedWriteAccessExpr
  let authenticatedWriteAccessExpr = this.io.readBitsIntBe(1) != 0
  this.authenticatedWriteAccess = authenticatedWriteAccessExpr
  let hardwareErrorRecordExpr = this.io.readBitsIntBe(1) != 0
  this.hardwareErrorRecord = hardwareErrorRecordExpr
  let runtimeAccessExpr = this.io.readBitsIntBe(1) != 0
  this.runtimeAccess = runtimeAccessExpr
  let bootserviceAccessExpr = this.io.readBitsIntBe(1) != 0
  this.bootserviceAccess = bootserviceAccessExpr
  let nonVolatileExpr = this.io.readBitsIntBe(1) != 0
  this.nonVolatile = nonVolatileExpr

  ##[
  Reserved (unused) bits
  ]##
  let reserved1Expr = this.io.readBitsIntBe(24)
  this.reserved1 = reserved1Expr

proc fromFile*(_: typedesc[EfivarSignatureList_EfiVarAttr], filename: string): EfivarSignatureList_EfiVarAttr =
  EfivarSignatureList_EfiVarAttr.read(newKaitaiFileStream(filename), nil, nil)

