import kaitai_struct_nim_runtime
import options

type
  BitcoinTransaction* = ref object of KaitaiStruct
    `version`*: uint32
    `numVins`*: uint8
    `vins`*: seq[BitcoinTransaction_Vin]
    `numVouts`*: uint8
    `vouts`*: seq[BitcoinTransaction_Vout]
    `locktime`*: uint32
    `parent`*: KaitaiStruct
  BitcoinTransaction_Vin* = ref object of KaitaiStruct
    `txid`*: seq[byte]
    `outputId`*: uint32
    `lenScript`*: uint8
    `scriptSig`*: BitcoinTransaction_Vin_ScriptSignature
    `endOfVin`*: seq[byte]
    `parent`*: BitcoinTransaction
    `rawScriptSig`*: seq[byte]
  BitcoinTransaction_Vin_ScriptSignature* = ref object of KaitaiStruct
    `lenSigStack`*: uint8
    `derSig`*: BitcoinTransaction_Vin_ScriptSignature_DerSignature
    `sigType`*: BitcoinTransaction_Vin_ScriptSignature_SighashType
    `lenPubkeyStack`*: uint8
    `pubkey`*: BitcoinTransaction_Vin_ScriptSignature_PublicKey
    `parent`*: BitcoinTransaction_Vin
  BitcoinTransaction_Vin_ScriptSignature_SighashType* = enum
    sighash_all = 1
    sighash_none = 2
    sighash_single = 3
    sighash_anyonecanpay = 80
  BitcoinTransaction_Vin_ScriptSignature_DerSignature* = ref object of KaitaiStruct
    `sequence`*: seq[byte]
    `lenSig`*: uint8
    `sep1`*: seq[byte]
    `lenSigR`*: uint8
    `sigR`*: seq[byte]
    `sep2`*: seq[byte]
    `lenSigS`*: uint8
    `sigS`*: seq[byte]
    `parent`*: BitcoinTransaction_Vin_ScriptSignature
  BitcoinTransaction_Vin_ScriptSignature_PublicKey* = ref object of KaitaiStruct
    `type`*: uint8
    `x`*: seq[byte]
    `y`*: seq[byte]
    `parent`*: BitcoinTransaction_Vin_ScriptSignature
  BitcoinTransaction_Vout* = ref object of KaitaiStruct
    `amount`*: uint64
    `lenScript`*: uint8
    `scriptPubKey`*: seq[byte]
    `parent`*: BitcoinTransaction

proc read*(_: typedesc[BitcoinTransaction], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BitcoinTransaction
proc read*(_: typedesc[BitcoinTransaction_Vin], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction): BitcoinTransaction_Vin
proc read*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction_Vin): BitcoinTransaction_Vin_ScriptSignature
proc read*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature_DerSignature], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction_Vin_ScriptSignature): BitcoinTransaction_Vin_ScriptSignature_DerSignature
proc read*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature_PublicKey], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction_Vin_ScriptSignature): BitcoinTransaction_Vin_ScriptSignature_PublicKey
proc read*(_: typedesc[BitcoinTransaction_Vout], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction): BitcoinTransaction_Vout



##[
@see <a href="https://bitcoin.org/en/developer-guide#transactions
https://en.bitcoin.it/wiki/Transaction
">Source</a>
]##
proc read*(_: typedesc[BitcoinTransaction], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BitcoinTransaction =
  template this: untyped = result
  this = new(BitcoinTransaction)
  let root = if root == nil: cast[BitcoinTransaction](this) else: cast[BitcoinTransaction](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Version number.

  ]##
  let versionExpr = this.io.readU4le()
  this.version = versionExpr

  ##[
  Number of input transactions.

  ]##
  let numVinsExpr = this.io.readU1()
  this.numVins = numVinsExpr

  ##[
  Input transactions.
An input refers to an output from a previous transaction.

  ]##
  for i in 0 ..< int(this.numVins):
    let it = BitcoinTransaction_Vin.read(this.io, this.root, this)
    this.vins.add(it)

  ##[
  Number of output transactions.

  ]##
  let numVoutsExpr = this.io.readU1()
  this.numVouts = numVoutsExpr

  ##[
  Output transactions.

  ]##
  for i in 0 ..< int(this.numVouts):
    let it = BitcoinTransaction_Vout.read(this.io, this.root, this)
    this.vouts.add(it)
  let locktimeExpr = this.io.readU4le()
  this.locktime = locktimeExpr

proc fromFile*(_: typedesc[BitcoinTransaction], filename: string): BitcoinTransaction =
  BitcoinTransaction.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BitcoinTransaction_Vin], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction): BitcoinTransaction_Vin =
  template this: untyped = result
  this = new(BitcoinTransaction_Vin)
  let root = if root == nil: cast[BitcoinTransaction](this) else: cast[BitcoinTransaction](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Previous transaction hash.

  ]##
  let txidExpr = this.io.readBytes(int(32))
  this.txid = txidExpr

  ##[
  ID indexing an ouput of the transaction refered by txid.
This output will be used as an input in the present transaction.

  ]##
  let outputIdExpr = this.io.readU4le()
  this.outputId = outputIdExpr

  ##[
  ScriptSig's length.

  ]##
  let lenScriptExpr = this.io.readU1()
  this.lenScript = lenScriptExpr

  ##[
  ScriptSig.

  @see <a href="https://en.bitcoin.it/wiki/Transaction#Input
https://en.bitcoin.it/wiki/Script
">Source</a>
  ]##
  let rawScriptSigExpr = this.io.readBytes(int(this.lenScript))
  this.rawScriptSig = rawScriptSigExpr
  let rawScriptSigIo = newKaitaiStream(rawScriptSigExpr)
  let scriptSigExpr = BitcoinTransaction_Vin_ScriptSignature.read(rawScriptSigIo, this.root, this)
  this.scriptSig = scriptSigExpr

  ##[
  Magic number indicating the end of the current input.

  ]##
  let endOfVinExpr = this.io.readBytes(int(4))
  this.endOfVin = endOfVinExpr

proc fromFile*(_: typedesc[BitcoinTransaction_Vin], filename: string): BitcoinTransaction_Vin =
  BitcoinTransaction_Vin.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction_Vin): BitcoinTransaction_Vin_ScriptSignature =
  template this: untyped = result
  this = new(BitcoinTransaction_Vin_ScriptSignature)
  let root = if root == nil: cast[BitcoinTransaction](this) else: cast[BitcoinTransaction](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenSigStackExpr = this.io.readU1()
  this.lenSigStack = lenSigStackExpr

  ##[
  DER-encoded ECDSA signature.

  @see <a href="https://en.wikipedia.org/wiki/X.690#DER_encoding
https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
">Source</a>
  ]##
  let derSigExpr = BitcoinTransaction_Vin_ScriptSignature_DerSignature.read(this.io, this.root, this)
  this.derSig = derSigExpr

  ##[
  Type of signature.

  ]##
  let sigTypeExpr = BitcoinTransaction_Vin_ScriptSignature_SighashType(this.io.readU1())
  this.sigType = sigTypeExpr
  let lenPubkeyStackExpr = this.io.readU1()
  this.lenPubkeyStack = lenPubkeyStackExpr

  ##[
  Public key (bitcoin address of the recipient).

  ]##
  let pubkeyExpr = BitcoinTransaction_Vin_ScriptSignature_PublicKey.read(this.io, this.root, this)
  this.pubkey = pubkeyExpr

proc fromFile*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature], filename: string): BitcoinTransaction_Vin_ScriptSignature =
  BitcoinTransaction_Vin_ScriptSignature.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature_DerSignature], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction_Vin_ScriptSignature): BitcoinTransaction_Vin_ScriptSignature_DerSignature =
  template this: untyped = result
  this = new(BitcoinTransaction_Vin_ScriptSignature_DerSignature)
  let root = if root == nil: cast[BitcoinTransaction](this) else: cast[BitcoinTransaction](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sequenceExpr = this.io.readBytes(int(1))
  this.sequence = sequenceExpr
  let lenSigExpr = this.io.readU1()
  this.lenSig = lenSigExpr
  let sep1Expr = this.io.readBytes(int(1))
  this.sep1 = sep1Expr

  ##[
  'r' value's length.

  ]##
  let lenSigRExpr = this.io.readU1()
  this.lenSigR = lenSigRExpr

  ##[
  'r' value of the ECDSA signature.

  @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
  ]##
  let sigRExpr = this.io.readBytes(int(this.lenSigR))
  this.sigR = sigRExpr
  let sep2Expr = this.io.readBytes(int(1))
  this.sep2 = sep2Expr

  ##[
  's' value's length.

  ]##
  let lenSigSExpr = this.io.readU1()
  this.lenSigS = lenSigSExpr

  ##[
  's' value of the ECDSA signature.

  @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
  ]##
  let sigSExpr = this.io.readBytes(int(this.lenSigS))
  this.sigS = sigSExpr

proc fromFile*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature_DerSignature], filename: string): BitcoinTransaction_Vin_ScriptSignature_DerSignature =
  BitcoinTransaction_Vin_ScriptSignature_DerSignature.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature_PublicKey], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction_Vin_ScriptSignature): BitcoinTransaction_Vin_ScriptSignature_PublicKey =
  template this: untyped = result
  this = new(BitcoinTransaction_Vin_ScriptSignature_PublicKey)
  let root = if root == nil: cast[BitcoinTransaction](this) else: cast[BitcoinTransaction](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = this.io.readU1()
  this.type = typeExpr

  ##[
  'x' coordinate of the public key on the elliptic curve.

  ]##
  let xExpr = this.io.readBytes(int(32))
  this.x = xExpr

  ##[
  'y' coordinate of the public key on the elliptic curve.

  ]##
  let yExpr = this.io.readBytes(int(32))
  this.y = yExpr

proc fromFile*(_: typedesc[BitcoinTransaction_Vin_ScriptSignature_PublicKey], filename: string): BitcoinTransaction_Vin_ScriptSignature_PublicKey =
  BitcoinTransaction_Vin_ScriptSignature_PublicKey.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BitcoinTransaction_Vout], io: KaitaiStream, root: KaitaiStruct, parent: BitcoinTransaction): BitcoinTransaction_Vout =
  template this: untyped = result
  this = new(BitcoinTransaction_Vout)
  let root = if root == nil: cast[BitcoinTransaction](this) else: cast[BitcoinTransaction](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of Satoshis to be transfered.

  ]##
  let amountExpr = this.io.readU8le()
  this.amount = amountExpr

  ##[
  ScriptPubKey's length.

  ]##
  let lenScriptExpr = this.io.readU1()
  this.lenScript = lenScriptExpr

  ##[
  ScriptPubKey.

  @see <a href="https://en.bitcoin.it/wiki/Transaction#Output
https://en.bitcoin.it/wiki/Script
">Source</a>
  ]##
  let scriptPubKeyExpr = this.io.readBytes(int(this.lenScript))
  this.scriptPubKey = scriptPubKeyExpr

proc fromFile*(_: typedesc[BitcoinTransaction_Vout], filename: string): BitcoinTransaction_Vout =
  BitcoinTransaction_Vout.read(newKaitaiFileStream(filename), nil, nil)

