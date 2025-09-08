import kaitai_struct_nim_runtime
import options

type
  Id3v24* = ref object of KaitaiStruct
    `tag`*: Id3v24_Tag
    `parent`*: KaitaiStruct
  Id3v24_Footer* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `versionMajor`*: uint8
    `versionRevision`*: uint8
    `flags`*: Id3v24_Footer_Flags
    `size`*: Id3v24_U4beSynchsafe
    `parent`*: Id3v24_Tag
  Id3v24_Footer_Flags* = ref object of KaitaiStruct
    `flagUnsynchronization`*: bool
    `flagHeaderex`*: bool
    `flagExperimental`*: bool
    `flagFooter`*: bool
    `reserved`*: uint64
    `parent`*: Id3v24_Footer
  Id3v24_Frame* = ref object of KaitaiStruct
    `id`*: string
    `size`*: Id3v24_U4beSynchsafe
    `flagsStatus`*: Id3v24_Frame_FlagsStatus
    `flagsFormat`*: Id3v24_Frame_FlagsFormat
    `data`*: seq[byte]
    `parent`*: Id3v24_Tag
    `isInvalidInst`: bool
    `isInvalidInstFlag`: bool
  Id3v24_Frame_FlagsFormat* = ref object of KaitaiStruct
    `reserved1`*: bool
    `flagGrouping`*: bool
    `reserved2`*: uint64
    `flagCompressed`*: bool
    `flagEncrypted`*: bool
    `flagUnsynchronisated`*: bool
    `flagIndicator`*: bool
    `parent`*: Id3v24_Frame
  Id3v24_Frame_FlagsStatus* = ref object of KaitaiStruct
    `reserved1`*: bool
    `flagDiscardAlterTag`*: bool
    `flagDiscardAlterFile`*: bool
    `flagReadOnly`*: bool
    `reserved2`*: uint64
    `parent`*: Id3v24_Frame
  Id3v24_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `versionMajor`*: uint8
    `versionRevision`*: uint8
    `flags`*: Id3v24_Header_Flags
    `size`*: Id3v24_U4beSynchsafe
    `parent`*: Id3v24_Tag
  Id3v24_Header_Flags* = ref object of KaitaiStruct
    `flagUnsynchronization`*: bool
    `flagHeaderex`*: bool
    `flagExperimental`*: bool
    `flagFooter`*: bool
    `reserved`*: uint64
    `parent`*: Id3v24_Header
  Id3v24_HeaderEx* = ref object of KaitaiStruct
    `size`*: Id3v24_U4beSynchsafe
    `flagsEx`*: Id3v24_HeaderEx_FlagsEx
    `data`*: seq[byte]
    `parent`*: Id3v24_Tag
  Id3v24_HeaderEx_FlagsEx* = ref object of KaitaiStruct
    `reserved1`*: bool
    `flagUpdate`*: bool
    `flagCrc`*: bool
    `flagRestrictions`*: bool
    `reserved2`*: uint64
    `parent`*: Id3v24_HeaderEx
  Id3v24_Padding* = ref object of KaitaiStruct
    `padding`*: seq[byte]
    `parent`*: Id3v24_Tag
  Id3v24_Tag* = ref object of KaitaiStruct
    `header`*: Id3v24_Header
    `headerEx`*: Id3v24_HeaderEx
    `frames`*: seq[Id3v24_Frame]
    `padding`*: Id3v24_Padding
    `footer`*: Id3v24_Footer
    `parent`*: Id3v24
  Id3v24_U1beSynchsafe* = ref object of KaitaiStruct
    `padding`*: bool
    `value`*: uint64
    `parent`*: Id3v24_U2beSynchsafe
  Id3v24_U2beSynchsafe* = ref object of KaitaiStruct
    `byte0`*: Id3v24_U1beSynchsafe
    `byte1`*: Id3v24_U1beSynchsafe
    `parent`*: Id3v24_U4beSynchsafe
    `valueInst`: int
    `valueInstFlag`: bool
  Id3v24_U4beSynchsafe* = ref object of KaitaiStruct
    `short0`*: Id3v24_U2beSynchsafe
    `short1`*: Id3v24_U2beSynchsafe
    `parent`*: KaitaiStruct
    `valueInst`: int
    `valueInstFlag`: bool

proc read*(_: typedesc[Id3v24], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v24
proc read*(_: typedesc[Id3v24_Footer], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Footer
proc read*(_: typedesc[Id3v24_Footer_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Footer): Id3v24_Footer_Flags
proc read*(_: typedesc[Id3v24_Frame], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Frame
proc read*(_: typedesc[Id3v24_Frame_FlagsFormat], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Frame): Id3v24_Frame_FlagsFormat
proc read*(_: typedesc[Id3v24_Frame_FlagsStatus], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Frame): Id3v24_Frame_FlagsStatus
proc read*(_: typedesc[Id3v24_Header], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Header
proc read*(_: typedesc[Id3v24_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Header): Id3v24_Header_Flags
proc read*(_: typedesc[Id3v24_HeaderEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_HeaderEx
proc read*(_: typedesc[Id3v24_HeaderEx_FlagsEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_HeaderEx): Id3v24_HeaderEx_FlagsEx
proc read*(_: typedesc[Id3v24_Padding], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Padding
proc read*(_: typedesc[Id3v24_Tag], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24): Id3v24_Tag
proc read*(_: typedesc[Id3v24_U1beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_U2beSynchsafe): Id3v24_U1beSynchsafe
proc read*(_: typedesc[Id3v24_U2beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_U4beSynchsafe): Id3v24_U2beSynchsafe
proc read*(_: typedesc[Id3v24_U4beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v24_U4beSynchsafe

proc isInvalid*(this: Id3v24_Frame): bool
proc value*(this: Id3v24_U2beSynchsafe): int
proc value*(this: Id3v24_U4beSynchsafe): int


##[
@see <a href="http://id3.org/id3v2.4.0-structure">Source</a>
@see <a href="http://id3.org/id3v2.4.0-frames">Source</a>
]##
proc read*(_: typedesc[Id3v24], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v24 =
  template this: untyped = result
  this = new(Id3v24)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagExpr = Id3v24_Tag.read(this.io, this.root, this)
  this.tag = tagExpr

proc fromFile*(_: typedesc[Id3v24], filename: string): Id3v24 =
  Id3v24.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Footer], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Footer =
  template this: untyped = result
  this = new(Id3v24_Footer)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(3))
  this.magic = magicExpr
  let versionMajorExpr = this.io.readU1()
  this.versionMajor = versionMajorExpr
  let versionRevisionExpr = this.io.readU1()
  this.versionRevision = versionRevisionExpr
  let flagsExpr = Id3v24_Footer_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let sizeExpr = Id3v24_U4beSynchsafe.read(this.io, this.root, this)
  this.size = sizeExpr

proc fromFile*(_: typedesc[Id3v24_Footer], filename: string): Id3v24_Footer =
  Id3v24_Footer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Footer_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Footer): Id3v24_Footer_Flags =
  template this: untyped = result
  this = new(Id3v24_Footer_Flags)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagUnsynchronizationExpr = this.io.readBitsIntBe(1) != 0
  this.flagUnsynchronization = flagUnsynchronizationExpr
  let flagHeaderexExpr = this.io.readBitsIntBe(1) != 0
  this.flagHeaderex = flagHeaderexExpr
  let flagExperimentalExpr = this.io.readBitsIntBe(1) != 0
  this.flagExperimental = flagExperimentalExpr
  let flagFooterExpr = this.io.readBitsIntBe(1) != 0
  this.flagFooter = flagFooterExpr
  let reservedExpr = this.io.readBitsIntBe(4)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Id3v24_Footer_Flags], filename: string): Id3v24_Footer_Flags =
  Id3v24_Footer_Flags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Frame], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Frame =
  template this: untyped = result
  this = new(Id3v24_Frame)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.id = idExpr
  let sizeExpr = Id3v24_U4beSynchsafe.read(this.io, this.root, this)
  this.size = sizeExpr
  let flagsStatusExpr = Id3v24_Frame_FlagsStatus.read(this.io, this.root, this)
  this.flagsStatus = flagsStatusExpr
  let flagsFormatExpr = Id3v24_Frame_FlagsFormat.read(this.io, this.root, this)
  this.flagsFormat = flagsFormatExpr
  let dataExpr = this.io.readBytes(int(this.size.value))
  this.data = dataExpr

proc isInvalid(this: Id3v24_Frame): bool = 
  if this.isInvalidInstFlag:
    return this.isInvalidInst
  let isInvalidInstExpr = bool(this.id == "\000\000\000\000")
  this.isInvalidInst = isInvalidInstExpr
  this.isInvalidInstFlag = true
  return this.isInvalidInst

proc fromFile*(_: typedesc[Id3v24_Frame], filename: string): Id3v24_Frame =
  Id3v24_Frame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Frame_FlagsFormat], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Frame): Id3v24_Frame_FlagsFormat =
  template this: untyped = result
  this = new(Id3v24_Frame_FlagsFormat)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(1) != 0
  this.reserved1 = reserved1Expr
  let flagGroupingExpr = this.io.readBitsIntBe(1) != 0
  this.flagGrouping = flagGroupingExpr
  let reserved2Expr = this.io.readBitsIntBe(2)
  this.reserved2 = reserved2Expr
  let flagCompressedExpr = this.io.readBitsIntBe(1) != 0
  this.flagCompressed = flagCompressedExpr
  let flagEncryptedExpr = this.io.readBitsIntBe(1) != 0
  this.flagEncrypted = flagEncryptedExpr
  let flagUnsynchronisatedExpr = this.io.readBitsIntBe(1) != 0
  this.flagUnsynchronisated = flagUnsynchronisatedExpr
  let flagIndicatorExpr = this.io.readBitsIntBe(1) != 0
  this.flagIndicator = flagIndicatorExpr

proc fromFile*(_: typedesc[Id3v24_Frame_FlagsFormat], filename: string): Id3v24_Frame_FlagsFormat =
  Id3v24_Frame_FlagsFormat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Frame_FlagsStatus], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Frame): Id3v24_Frame_FlagsStatus =
  template this: untyped = result
  this = new(Id3v24_Frame_FlagsStatus)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(1) != 0
  this.reserved1 = reserved1Expr
  let flagDiscardAlterTagExpr = this.io.readBitsIntBe(1) != 0
  this.flagDiscardAlterTag = flagDiscardAlterTagExpr
  let flagDiscardAlterFileExpr = this.io.readBitsIntBe(1) != 0
  this.flagDiscardAlterFile = flagDiscardAlterFileExpr
  let flagReadOnlyExpr = this.io.readBitsIntBe(1) != 0
  this.flagReadOnly = flagReadOnlyExpr
  let reserved2Expr = this.io.readBitsIntBe(4)
  this.reserved2 = reserved2Expr

proc fromFile*(_: typedesc[Id3v24_Frame_FlagsStatus], filename: string): Id3v24_Frame_FlagsStatus =
  Id3v24_Frame_FlagsStatus.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Header], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Header =
  template this: untyped = result
  this = new(Id3v24_Header)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(3))
  this.magic = magicExpr
  let versionMajorExpr = this.io.readU1()
  this.versionMajor = versionMajorExpr
  let versionRevisionExpr = this.io.readU1()
  this.versionRevision = versionRevisionExpr
  let flagsExpr = Id3v24_Header_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let sizeExpr = Id3v24_U4beSynchsafe.read(this.io, this.root, this)
  this.size = sizeExpr

proc fromFile*(_: typedesc[Id3v24_Header], filename: string): Id3v24_Header =
  Id3v24_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Header): Id3v24_Header_Flags =
  template this: untyped = result
  this = new(Id3v24_Header_Flags)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagUnsynchronizationExpr = this.io.readBitsIntBe(1) != 0
  this.flagUnsynchronization = flagUnsynchronizationExpr
  let flagHeaderexExpr = this.io.readBitsIntBe(1) != 0
  this.flagHeaderex = flagHeaderexExpr
  let flagExperimentalExpr = this.io.readBitsIntBe(1) != 0
  this.flagExperimental = flagExperimentalExpr
  let flagFooterExpr = this.io.readBitsIntBe(1) != 0
  this.flagFooter = flagFooterExpr
  let reservedExpr = this.io.readBitsIntBe(4)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Id3v24_Header_Flags], filename: string): Id3v24_Header_Flags =
  Id3v24_Header_Flags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_HeaderEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_HeaderEx =
  template this: untyped = result
  this = new(Id3v24_HeaderEx)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = Id3v24_U4beSynchsafe.read(this.io, this.root, this)
  this.size = sizeExpr
  let flagsExExpr = Id3v24_HeaderEx_FlagsEx.read(this.io, this.root, this)
  this.flagsEx = flagsExExpr
  let dataExpr = this.io.readBytes(int(this.size.value - 5))
  this.data = dataExpr

proc fromFile*(_: typedesc[Id3v24_HeaderEx], filename: string): Id3v24_HeaderEx =
  Id3v24_HeaderEx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_HeaderEx_FlagsEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_HeaderEx): Id3v24_HeaderEx_FlagsEx =
  template this: untyped = result
  this = new(Id3v24_HeaderEx_FlagsEx)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(1) != 0
  this.reserved1 = reserved1Expr
  let flagUpdateExpr = this.io.readBitsIntBe(1) != 0
  this.flagUpdate = flagUpdateExpr
  let flagCrcExpr = this.io.readBitsIntBe(1) != 0
  this.flagCrc = flagCrcExpr
  let flagRestrictionsExpr = this.io.readBitsIntBe(1) != 0
  this.flagRestrictions = flagRestrictionsExpr
  let reserved2Expr = this.io.readBitsIntBe(4)
  this.reserved2 = reserved2Expr

proc fromFile*(_: typedesc[Id3v24_HeaderEx_FlagsEx], filename: string): Id3v24_HeaderEx_FlagsEx =
  Id3v24_HeaderEx_FlagsEx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Padding], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_Tag): Id3v24_Padding =
  template this: untyped = result
  this = new(Id3v24_Padding)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paddingExpr = this.io.readBytes(int(Id3v24(this.root).tag.header.size.value - this.io.pos))
  this.padding = paddingExpr

proc fromFile*(_: typedesc[Id3v24_Padding], filename: string): Id3v24_Padding =
  Id3v24_Padding.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_Tag], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24): Id3v24_Tag =
  template this: untyped = result
  this = new(Id3v24_Tag)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Id3v24_Header.read(this.io, this.root, this)
  this.header = headerExpr
  if this.header.flags.flagHeaderex:
    let headerExExpr = Id3v24_HeaderEx.read(this.io, this.root, this)
    this.headerEx = headerExExpr
  block:
    var i: int
    while true:
      let it = Id3v24_Frame.read(this.io, this.root, this)
      this.frames.add(it)
      if  ((this.io.pos + it.size.value > this.header.size.value) or (it.isInvalid)) :
        break
      inc i
  if not(this.header.flags.flagFooter):
    let paddingExpr = Id3v24_Padding.read(this.io, this.root, this)
    this.padding = paddingExpr
  if this.header.flags.flagFooter:
    let footerExpr = Id3v24_Footer.read(this.io, this.root, this)
    this.footer = footerExpr

proc fromFile*(_: typedesc[Id3v24_Tag], filename: string): Id3v24_Tag =
  Id3v24_Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_U1beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_U2beSynchsafe): Id3v24_U1beSynchsafe =
  template this: untyped = result
  this = new(Id3v24_U1beSynchsafe)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paddingExpr = this.io.readBitsIntBe(1) != 0
  this.padding = paddingExpr
  let valueExpr = this.io.readBitsIntBe(7)
  this.value = valueExpr

proc fromFile*(_: typedesc[Id3v24_U1beSynchsafe], filename: string): Id3v24_U1beSynchsafe =
  Id3v24_U1beSynchsafe.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_U2beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v24_U4beSynchsafe): Id3v24_U2beSynchsafe =
  template this: untyped = result
  this = new(Id3v24_U2beSynchsafe)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let byte0Expr = Id3v24_U1beSynchsafe.read(this.io, this.root, this)
  this.byte0 = byte0Expr
  let byte1Expr = Id3v24_U1beSynchsafe.read(this.io, this.root, this)
  this.byte1 = byte1Expr

proc value(this: Id3v24_U2beSynchsafe): int = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int(this.byte0.value shl 7 or this.byte1.value)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Id3v24_U2beSynchsafe], filename: string): Id3v24_U2beSynchsafe =
  Id3v24_U2beSynchsafe.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v24_U4beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v24_U4beSynchsafe =
  template this: untyped = result
  this = new(Id3v24_U4beSynchsafe)
  let root = if root == nil: cast[Id3v24](this) else: cast[Id3v24](root)
  this.io = io
  this.root = root
  this.parent = parent

  let short0Expr = Id3v24_U2beSynchsafe.read(this.io, this.root, this)
  this.short0 = short0Expr
  let short1Expr = Id3v24_U2beSynchsafe.read(this.io, this.root, this)
  this.short1 = short1Expr

proc value(this: Id3v24_U4beSynchsafe): int = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int(this.short0.value shl 14 or this.short1.value)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Id3v24_U4beSynchsafe], filename: string): Id3v24_U4beSynchsafe =
  Id3v24_U4beSynchsafe.read(newKaitaiFileStream(filename), nil, nil)

