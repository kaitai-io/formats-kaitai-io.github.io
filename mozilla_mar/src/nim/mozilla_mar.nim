import kaitai_struct_nim_runtime
import options

type
  MozillaMar* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ofsIndex`*: uint32
    `fileSize`*: uint64
    `lenSignatures`*: uint32
    `signatures`*: seq[MozillaMar_Signature]
    `lenAdditionalSections`*: uint32
    `additionalSections`*: seq[MozillaMar_AdditionalSection]
    `parent`*: KaitaiStruct
    `indexInst`: MozillaMar_MarIndex
    `indexInstFlag`: bool
  MozillaMar_BlockIdentifiers* = enum
    product_information = 1
  MozillaMar_SignatureAlgorithms* = enum
    rsa_pkcs1_sha1 = 1
    rsa_pkcs1_sha384 = 2
  MozillaMar_AdditionalSection* = ref object of KaitaiStruct
    `lenBlock`*: uint32
    `blockIdentifier`*: MozillaMar_BlockIdentifiers
    `bytes`*: KaitaiStruct
    `parent`*: MozillaMar
    `rawBytes`*: seq[byte]
  MozillaMar_IndexEntries* = ref object of KaitaiStruct
    `indexEntry`*: seq[MozillaMar_IndexEntry]
    `parent`*: MozillaMar_MarIndex
  MozillaMar_IndexEntry* = ref object of KaitaiStruct
    `ofsContent`*: uint32
    `lenContent`*: uint32
    `flags`*: uint32
    `fileName`*: string
    `parent`*: MozillaMar_IndexEntries
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
  MozillaMar_MarIndex* = ref object of KaitaiStruct
    `lenIndex`*: uint32
    `indexEntries`*: MozillaMar_IndexEntries
    `parent`*: MozillaMar
    `rawIndexEntries`*: seq[byte]
  MozillaMar_ProductInformationBlock* = ref object of KaitaiStruct
    `marChannelName`*: string
    `productVersion`*: string
    `parent`*: MozillaMar_AdditionalSection
  MozillaMar_Signature* = ref object of KaitaiStruct
    `algorithm`*: MozillaMar_SignatureAlgorithms
    `lenSignature`*: uint32
    `signature`*: seq[byte]
    `parent`*: MozillaMar

proc read*(_: typedesc[MozillaMar], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MozillaMar
proc read*(_: typedesc[MozillaMar_AdditionalSection], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar): MozillaMar_AdditionalSection
proc read*(_: typedesc[MozillaMar_IndexEntries], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar_MarIndex): MozillaMar_IndexEntries
proc read*(_: typedesc[MozillaMar_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar_IndexEntries): MozillaMar_IndexEntry
proc read*(_: typedesc[MozillaMar_MarIndex], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar): MozillaMar_MarIndex
proc read*(_: typedesc[MozillaMar_ProductInformationBlock], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar_AdditionalSection): MozillaMar_ProductInformationBlock
proc read*(_: typedesc[MozillaMar_Signature], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar): MozillaMar_Signature

proc index*(this: MozillaMar): MozillaMar_MarIndex
proc body*(this: MozillaMar_IndexEntry): seq[byte]


##[
Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
Test files can be found on Mozilla's FTP site, for example:

<http://ftp.mozilla.org/pub/firefox/nightly/partials/>

@see <a href="https://wiki.mozilla.org/Software_Update:MAR">Source</a>
]##
proc read*(_: typedesc[MozillaMar], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MozillaMar =
  template this: untyped = result
  this = new(MozillaMar)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let ofsIndexExpr = this.io.readU4be()
  this.ofsIndex = ofsIndexExpr
  let fileSizeExpr = this.io.readU8be()
  this.fileSize = fileSizeExpr
  let lenSignaturesExpr = this.io.readU4be()
  this.lenSignatures = lenSignaturesExpr
  for i in 0 ..< int(this.lenSignatures):
    let it = MozillaMar_Signature.read(this.io, this.root, this)
    this.signatures.add(it)
  let lenAdditionalSectionsExpr = this.io.readU4be()
  this.lenAdditionalSections = lenAdditionalSectionsExpr
  for i in 0 ..< int(this.lenAdditionalSections):
    let it = MozillaMar_AdditionalSection.read(this.io, this.root, this)
    this.additionalSections.add(it)

proc index(this: MozillaMar): MozillaMar_MarIndex = 
  if this.indexInstFlag:
    return this.indexInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsIndex))
  let indexInstExpr = MozillaMar_MarIndex.read(this.io, this.root, this)
  this.indexInst = indexInstExpr
  this.io.seek(pos)
  this.indexInstFlag = true
  return this.indexInst

proc fromFile*(_: typedesc[MozillaMar], filename: string): MozillaMar =
  MozillaMar.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MozillaMar_AdditionalSection], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar): MozillaMar_AdditionalSection =
  template this: untyped = result
  this = new(MozillaMar_AdditionalSection)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenBlockExpr = this.io.readU4be()
  this.lenBlock = lenBlockExpr
  let blockIdentifierExpr = MozillaMar_BlockIdentifiers(this.io.readU4be())
  this.blockIdentifier = blockIdentifierExpr
  block:
    let on = this.blockIdentifier
    if on == mozilla_mar.product_information:
      let rawBytesExpr = this.io.readBytes(int((this.lenBlock - 4) - 4))
      this.rawBytes = rawBytesExpr
      let rawBytesIo = newKaitaiStream(rawBytesExpr)
      let bytesExpr = MozillaMar_ProductInformationBlock.read(rawBytesIo, this.root, this)
      this.bytes = bytesExpr
    else:
      let bytesExpr = this.io.readBytes(int((this.lenBlock - 4) - 4))
      this.bytes = bytesExpr

proc fromFile*(_: typedesc[MozillaMar_AdditionalSection], filename: string): MozillaMar_AdditionalSection =
  MozillaMar_AdditionalSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MozillaMar_IndexEntries], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar_MarIndex): MozillaMar_IndexEntries =
  template this: untyped = result
  this = new(MozillaMar_IndexEntries)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MozillaMar_IndexEntry.read(this.io, this.root, this)
      this.indexEntry.add(it)
      inc i

proc fromFile*(_: typedesc[MozillaMar_IndexEntries], filename: string): MozillaMar_IndexEntries =
  MozillaMar_IndexEntries.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MozillaMar_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar_IndexEntries): MozillaMar_IndexEntry =
  template this: untyped = result
  this = new(MozillaMar_IndexEntry)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsContentExpr = this.io.readU4be()
  this.ofsContent = ofsContentExpr
  let lenContentExpr = this.io.readU4be()
  this.lenContent = lenContentExpr

  ##[
  File permission bits (in standard unix-style format).
  ]##
  let flagsExpr = this.io.readU4be()
  this.flags = flagsExpr
  let fileNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.fileName = fileNameExpr

proc body(this: MozillaMar_IndexEntry): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  let io = MozillaMar(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsContent))
  let bodyInstExpr = io.readBytes(int(this.lenContent))
  this.bodyInst = bodyInstExpr
  io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[MozillaMar_IndexEntry], filename: string): MozillaMar_IndexEntry =
  MozillaMar_IndexEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MozillaMar_MarIndex], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar): MozillaMar_MarIndex =
  template this: untyped = result
  this = new(MozillaMar_MarIndex)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenIndexExpr = this.io.readU4be()
  this.lenIndex = lenIndexExpr
  let rawIndexEntriesExpr = this.io.readBytes(int(this.lenIndex))
  this.rawIndexEntries = rawIndexEntriesExpr
  let rawIndexEntriesIo = newKaitaiStream(rawIndexEntriesExpr)
  let indexEntriesExpr = MozillaMar_IndexEntries.read(rawIndexEntriesIo, this.root, this)
  this.indexEntries = indexEntriesExpr

proc fromFile*(_: typedesc[MozillaMar_MarIndex], filename: string): MozillaMar_MarIndex =
  MozillaMar_MarIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MozillaMar_ProductInformationBlock], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar_AdditionalSection): MozillaMar_ProductInformationBlock =
  template this: untyped = result
  this = new(MozillaMar_ProductInformationBlock)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let marChannelNameExpr = encode(this.io.readBytes(int(64)).bytesTerminate(0, false), "UTF-8")
  this.marChannelName = marChannelNameExpr
  let productVersionExpr = encode(this.io.readBytes(int(32)).bytesTerminate(0, false), "UTF-8")
  this.productVersion = productVersionExpr

proc fromFile*(_: typedesc[MozillaMar_ProductInformationBlock], filename: string): MozillaMar_ProductInformationBlock =
  MozillaMar_ProductInformationBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MozillaMar_Signature], io: KaitaiStream, root: KaitaiStruct, parent: MozillaMar): MozillaMar_Signature =
  template this: untyped = result
  this = new(MozillaMar_Signature)
  let root = if root == nil: cast[MozillaMar](this) else: cast[MozillaMar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let algorithmExpr = MozillaMar_SignatureAlgorithms(this.io.readU4be())
  this.algorithm = algorithmExpr
  let lenSignatureExpr = this.io.readU4be()
  this.lenSignature = lenSignatureExpr
  let signatureExpr = this.io.readBytes(int(this.lenSignature))
  this.signature = signatureExpr

proc fromFile*(_: typedesc[MozillaMar_Signature], filename: string): MozillaMar_Signature =
  MozillaMar_Signature.read(newKaitaiFileStream(filename), nil, nil)

