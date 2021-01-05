import kaitai_struct_nim_runtime
import options

type
  Id3v23* = ref object of KaitaiStruct
    `tag`*: Id3v23_Tag
    `parent`*: KaitaiStruct
  Id3v23_U1beSynchsafe* = ref object of KaitaiStruct
    `padding`*: bool
    `value`*: uint64
    `parent`*: Id3v23_U2beSynchsafe
  Id3v23_U2beSynchsafe* = ref object of KaitaiStruct
    `byte0`*: Id3v23_U1beSynchsafe
    `byte1`*: Id3v23_U1beSynchsafe
    `parent`*: Id3v23_U4beSynchsafe
    `valueInst`*: int
  Id3v23_Tag* = ref object of KaitaiStruct
    `header`*: Id3v23_Header
    `headerEx`*: Id3v23_HeaderEx
    `frames`*: seq[Id3v23_Frame]
    `padding`*: seq[byte]
    `parent`*: Id3v23
  Id3v23_U4beSynchsafe* = ref object of KaitaiStruct
    `short0`*: Id3v23_U2beSynchsafe
    `short1`*: Id3v23_U2beSynchsafe
    `parent`*: Id3v23_Header
    `valueInst`*: int
  Id3v23_Frame* = ref object of KaitaiStruct
    `id`*: string
    `size`*: uint32
    `flags`*: Id3v23_Frame_Flags
    `data`*: seq[byte]
    `parent`*: Id3v23_Tag
    `isInvalidInst`*: bool
  Id3v23_Frame_Flags* = ref object of KaitaiStruct
    `flagDiscardAlterTag`*: bool
    `flagDiscardAlterFile`*: bool
    `flagReadOnly`*: bool
    `reserved1`*: uint64
    `flagCompressed`*: bool
    `flagEncrypted`*: bool
    `flagGrouping`*: bool
    `reserved2`*: uint64
    `parent`*: Id3v23_Frame
  Id3v23_HeaderEx* = ref object of KaitaiStruct
    `size`*: uint32
    `flagsEx`*: Id3v23_HeaderEx_FlagsEx
    `paddingSize`*: uint32
    `crc`*: uint32
    `parent`*: Id3v23_Tag
  Id3v23_HeaderEx_FlagsEx* = ref object of KaitaiStruct
    `flagCrc`*: bool
    `reserved`*: uint64
    `parent`*: Id3v23_HeaderEx
  Id3v23_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `versionMajor`*: uint8
    `versionRevision`*: uint8
    `flags`*: Id3v23_Header_Flags
    `size`*: Id3v23_U4beSynchsafe
    `parent`*: Id3v23_Tag
  Id3v23_Header_Flags* = ref object of KaitaiStruct
    `flagUnsynchronization`*: bool
    `flagHeaderex`*: bool
    `flagExperimental`*: bool
    `reserved`*: uint64
    `parent`*: Id3v23_Header

proc read*(_: typedesc[Id3v23], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v23
proc read*(_: typedesc[Id3v23_U1beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_U2beSynchsafe): Id3v23_U1beSynchsafe
proc read*(_: typedesc[Id3v23_U2beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_U4beSynchsafe): Id3v23_U2beSynchsafe
proc read*(_: typedesc[Id3v23_Tag], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23): Id3v23_Tag
proc read*(_: typedesc[Id3v23_U4beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Header): Id3v23_U4beSynchsafe
proc read*(_: typedesc[Id3v23_Frame], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Tag): Id3v23_Frame
proc read*(_: typedesc[Id3v23_Frame_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Frame): Id3v23_Frame_Flags
proc read*(_: typedesc[Id3v23_HeaderEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Tag): Id3v23_HeaderEx
proc read*(_: typedesc[Id3v23_HeaderEx_FlagsEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_HeaderEx): Id3v23_HeaderEx_FlagsEx
proc read*(_: typedesc[Id3v23_Header], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Tag): Id3v23_Header
proc read*(_: typedesc[Id3v23_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Header): Id3v23_Header_Flags

proc value*(this: Id3v23_U2beSynchsafe): int
proc value*(this: Id3v23_U4beSynchsafe): int
proc isInvalid*(this: Id3v23_Frame): bool


##[
@see <a href="https://id3.org/id3v2.3.0">Source</a>
]##
proc read*(_: typedesc[Id3v23], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Id3v23 =
  template this: untyped = result
  this = new(Id3v23)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagExpr = Id3v23_Tag.read(this.io, this.root, this)
  this.tag = tagExpr

proc fromFile*(_: typedesc[Id3v23], filename: string): Id3v23 =
  Id3v23.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v23_U1beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_U2beSynchsafe): Id3v23_U1beSynchsafe =
  template this: untyped = result
  this = new(Id3v23_U1beSynchsafe)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paddingExpr = this.io.readBitsIntBe(1) != 0
  this.padding = paddingExpr
  let valueExpr = this.io.readBitsIntBe(7)
  this.value = valueExpr

proc fromFile*(_: typedesc[Id3v23_U1beSynchsafe], filename: string): Id3v23_U1beSynchsafe =
  Id3v23_U1beSynchsafe.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v23_U2beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_U4beSynchsafe): Id3v23_U2beSynchsafe =
  template this: untyped = result
  this = new(Id3v23_U2beSynchsafe)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let byte0Expr = Id3v23_U1beSynchsafe.read(this.io, this.root, this)
  this.byte0 = byte0Expr
  let byte1Expr = Id3v23_U1beSynchsafe.read(this.io, this.root, this)
  this.byte1 = byte1Expr

proc value(this: Id3v23_U2beSynchsafe): int = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = int(((this.byte0.value shl 7) or this.byte1.value))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[Id3v23_U2beSynchsafe], filename: string): Id3v23_U2beSynchsafe =
  Id3v23_U2beSynchsafe.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "Section 3. ID3v2 overview"
]##
proc read*(_: typedesc[Id3v23_Tag], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23): Id3v23_Tag =
  template this: untyped = result
  this = new(Id3v23_Tag)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Id3v23_Header.read(this.io, this.root, this)
  this.header = headerExpr
  if this.header.flags.flagHeaderex:
    let headerExExpr = Id3v23_HeaderEx.read(this.io, this.root, this)
    this.headerEx = headerExExpr
  block:
    var i: int
    while true:
      let it = Id3v23_Frame.read(this.io, this.root, this)
      this.frames.add(it)
      if  (((this.io.pos + it.size) > this.header.size.value) or (it.isInvalid)) :
        break
      inc i
  if this.header.flags.flagHeaderex:
    let paddingExpr = this.io.readBytes(int((this.headerEx.paddingSize - this.io.pos)))
    this.padding = paddingExpr

proc fromFile*(_: typedesc[Id3v23_Tag], filename: string): Id3v23_Tag =
  Id3v23_Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v23_U4beSynchsafe], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Header): Id3v23_U4beSynchsafe =
  template this: untyped = result
  this = new(Id3v23_U4beSynchsafe)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let short0Expr = Id3v23_U2beSynchsafe.read(this.io, this.root, this)
  this.short0 = short0Expr
  let short1Expr = Id3v23_U2beSynchsafe.read(this.io, this.root, this)
  this.short1 = short1Expr

proc value(this: Id3v23_U4beSynchsafe): int = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = int(((this.short0.value shl 14) or this.short1.value))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[Id3v23_U4beSynchsafe], filename: string): Id3v23_U4beSynchsafe =
  Id3v23_U4beSynchsafe.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "Section 3.3. ID3v2 frame overview"
]##
proc read*(_: typedesc[Id3v23_Frame], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Tag): Id3v23_Frame =
  template this: untyped = result
  this = new(Id3v23_Frame)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.id = idExpr
  let sizeExpr = this.io.readU4be()
  this.size = sizeExpr
  let flagsExpr = Id3v23_Frame_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let dataExpr = this.io.readBytes(int(this.size))
  this.data = dataExpr

proc isInvalid(this: Id3v23_Frame): bool = 
  if this.isInvalidInst != nil:
    return this.isInvalidInst
  let isInvalidInstExpr = bool(this.id == "\000\000\000\000")
  this.isInvalidInst = isInvalidInstExpr
  if this.isInvalidInst != nil:
    return this.isInvalidInst

proc fromFile*(_: typedesc[Id3v23_Frame], filename: string): Id3v23_Frame =
  Id3v23_Frame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v23_Frame_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Frame): Id3v23_Frame_Flags =
  template this: untyped = result
  this = new(Id3v23_Frame_Flags)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagDiscardAlterTagExpr = this.io.readBitsIntBe(1) != 0
  this.flagDiscardAlterTag = flagDiscardAlterTagExpr
  let flagDiscardAlterFileExpr = this.io.readBitsIntBe(1) != 0
  this.flagDiscardAlterFile = flagDiscardAlterFileExpr
  let flagReadOnlyExpr = this.io.readBitsIntBe(1) != 0
  this.flagReadOnly = flagReadOnlyExpr
  let reserved1Expr = this.io.readBitsIntBe(5)
  this.reserved1 = reserved1Expr
  let flagCompressedExpr = this.io.readBitsIntBe(1) != 0
  this.flagCompressed = flagCompressedExpr
  let flagEncryptedExpr = this.io.readBitsIntBe(1) != 0
  this.flagEncrypted = flagEncryptedExpr
  let flagGroupingExpr = this.io.readBitsIntBe(1) != 0
  this.flagGrouping = flagGroupingExpr
  let reserved2Expr = this.io.readBitsIntBe(5)
  this.reserved2 = reserved2Expr

proc fromFile*(_: typedesc[Id3v23_Frame_Flags], filename: string): Id3v23_Frame_Flags =
  Id3v23_Frame_Flags.read(newKaitaiFileStream(filename), nil, nil)


##[
ID3v2 extended header
@see "Section 3.2. ID3v2 extended header"
]##
proc read*(_: typedesc[Id3v23_HeaderEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Tag): Id3v23_HeaderEx =
  template this: untyped = result
  this = new(Id3v23_HeaderEx)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4be()
  this.size = sizeExpr
  let flagsExExpr = Id3v23_HeaderEx_FlagsEx.read(this.io, this.root, this)
  this.flagsEx = flagsExExpr
  let paddingSizeExpr = this.io.readU4be()
  this.paddingSize = paddingSizeExpr
  if this.flagsEx.flagCrc:
    let crcExpr = this.io.readU4be()
    this.crc = crcExpr

proc fromFile*(_: typedesc[Id3v23_HeaderEx], filename: string): Id3v23_HeaderEx =
  Id3v23_HeaderEx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v23_HeaderEx_FlagsEx], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_HeaderEx): Id3v23_HeaderEx_FlagsEx =
  template this: untyped = result
  this = new(Id3v23_HeaderEx_FlagsEx)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagCrcExpr = this.io.readBitsIntBe(1) != 0
  this.flagCrc = flagCrcExpr
  let reservedExpr = this.io.readBitsIntBe(15)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Id3v23_HeaderEx_FlagsEx], filename: string): Id3v23_HeaderEx_FlagsEx =
  Id3v23_HeaderEx_FlagsEx.read(newKaitaiFileStream(filename), nil, nil)


##[
ID3v2 fixed header
@see "Section 3.1. ID3v2 header"
]##
proc read*(_: typedesc[Id3v23_Header], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Tag): Id3v23_Header =
  template this: untyped = result
  this = new(Id3v23_Header)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(3))
  this.magic = magicExpr
  let versionMajorExpr = this.io.readU1()
  this.versionMajor = versionMajorExpr
  let versionRevisionExpr = this.io.readU1()
  this.versionRevision = versionRevisionExpr
  let flagsExpr = Id3v23_Header_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let sizeExpr = Id3v23_U4beSynchsafe.read(this.io, this.root, this)
  this.size = sizeExpr

proc fromFile*(_: typedesc[Id3v23_Header], filename: string): Id3v23_Header =
  Id3v23_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Id3v23_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Id3v23_Header): Id3v23_Header_Flags =
  template this: untyped = result
  this = new(Id3v23_Header_Flags)
  let root = if root == nil: cast[Id3v23](this) else: cast[Id3v23](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagUnsynchronizationExpr = this.io.readBitsIntBe(1) != 0
  this.flagUnsynchronization = flagUnsynchronizationExpr
  let flagHeaderexExpr = this.io.readBitsIntBe(1) != 0
  this.flagHeaderex = flagHeaderexExpr
  let flagExperimentalExpr = this.io.readBitsIntBe(1) != 0
  this.flagExperimental = flagExperimentalExpr
  let reservedExpr = this.io.readBitsIntBe(5)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Id3v23_Header_Flags], filename: string): Id3v23_Header_Flags =
  Id3v23_Header_Flags.read(newKaitaiFileStream(filename), nil, nil)

