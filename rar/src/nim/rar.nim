import kaitai_struct_nim_runtime
import options

type
  Rar* = ref object of KaitaiStruct
    `magic`*: Rar_MagicSignature
    `blocks`*: seq[KaitaiStruct]
    `parent`*: KaitaiStruct
  Rar_BlockTypes* = enum
    marker = 114
    archive_header = 115
    file_header = 116
    old_style_comment_header = 117
    old_style_authenticity_info_76 = 118
    old_style_subblock = 119
    old_style_recovery_record = 120
    old_style_authenticity_info_79 = 121
    subblock = 122
    terminator = 123
  Rar_Oses* = enum
    ms_dos = 0
    os_2 = 1
    windows = 2
    unix = 3
    mac_os = 4
    beos = 5
  Rar_Methods* = enum
    store = 48
    fastest = 49
    fast = 50
    normal = 51
    good = 52
    best = 53
  Rar_BlockV5* = ref object of KaitaiStruct
    `parent`*: Rar
  Rar_Block* = ref object of KaitaiStruct
    `crc16`*: uint16
    `blockType`*: Rar_BlockTypes
    `flags`*: uint16
    `blockSize`*: uint16
    `addSize`*: uint32
    `body`*: KaitaiStruct
    `addBody`*: seq[byte]
    `parent`*: Rar
    `rawBody`*: seq[byte]
    `hasAddInst`*: bool
    `headerSizeInst`*: int8
    `bodySizeInst`*: int
  Rar_BlockFileHeader* = ref object of KaitaiStruct
    `lowUnpSize`*: uint32
    `hostOs`*: Rar_Oses
    `fileCrc32`*: uint32
    `fileTime`*: Rar_DosTime
    `rarVersion`*: uint8
    `method`*: Rar_Methods
    `nameSize`*: uint16
    `attr`*: uint32
    `highPackSize`*: uint32
    `fileName`*: seq[byte]
    `salt`*: uint64
    `parent`*: Rar_Block
  Rar_MagicSignature* = ref object of KaitaiStruct
    `magic1`*: seq[byte]
    `version`*: uint8
    `magic3`*: seq[byte]
    `parent`*: Rar
  Rar_DosTime* = ref object of KaitaiStruct
    `time`*: uint16
    `date`*: uint16
    `parent`*: Rar_BlockFileHeader
    `monthInst`*: int
    `secondsInst`*: int
    `yearInst`*: int
    `minutesInst`*: int
    `dayInst`*: int
    `hoursInst`*: int

proc read*(_: typedesc[Rar], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Rar
proc read*(_: typedesc[Rar_BlockV5], io: KaitaiStream, root: KaitaiStruct, parent: Rar): Rar_BlockV5
proc read*(_: typedesc[Rar_Block], io: KaitaiStream, root: KaitaiStruct, parent: Rar): Rar_Block
proc read*(_: typedesc[Rar_BlockFileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Rar_Block): Rar_BlockFileHeader
proc read*(_: typedesc[Rar_MagicSignature], io: KaitaiStream, root: KaitaiStruct, parent: Rar): Rar_MagicSignature
proc read*(_: typedesc[Rar_DosTime], io: KaitaiStream, root: KaitaiStruct, parent: Rar_BlockFileHeader): Rar_DosTime

proc hasAdd*(this: Rar_Block): bool
proc headerSize*(this: Rar_Block): int8
proc bodySize*(this: Rar_Block): int
proc month*(this: Rar_DosTime): int
proc seconds*(this: Rar_DosTime): int
proc year*(this: Rar_DosTime): int
proc minutes*(this: Rar_DosTime): int
proc day*(this: Rar_DosTime): int
proc hours*(this: Rar_DosTime): int


##[
RAR is a archive format used by popular proprietary RAR archiver,
created by Eugene Roshal. There are two major versions of format
(v1.5-4.0 and RAR v5+).

File format essentially consists of a linear sequence of
blocks. Each block has fixed header and custom body (that depends on
block type), so it's possible to skip block even if one doesn't know
how to process a certain block type.

@see <a href="http://acritum.com/winrar/rar-format"></a>
]##
proc read*(_: typedesc[Rar], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Rar =
  template this: untyped = result
  this = new(Rar)
  let root = if root == nil: cast[Rar](this) else: cast[Rar](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  File format signature to validate that it is indeed a RAR archive
  ]##
  let magicExpr = Rar_MagicSignature.read(this.io, this.root, this)
  this.magic = magicExpr

  ##[
  Sequence of blocks that constitute the RAR file
  ]##
  block:
    var i: int
    while not this.io.isEof:
      block:
        let on = this.magic.version
        if on == 0:
          let it = Rar_Block.read(this.io, this.root, this)
          this.blocks.add(it)
        elif on == 1:
          let it = Rar_BlockV5.read(this.io, this.root, this)
          this.blocks.add(it)
      inc i

proc fromFile*(_: typedesc[Rar], filename: string): Rar =
  Rar.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rar_BlockV5], io: KaitaiStream, root: KaitaiStruct, parent: Rar): Rar_BlockV5 =
  template this: untyped = result
  this = new(Rar_BlockV5)
  let root = if root == nil: cast[Rar](this) else: cast[Rar](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Rar_BlockV5], filename: string): Rar_BlockV5 =
  Rar_BlockV5.read(newKaitaiFileStream(filename), nil, nil)


##[
Basic block that RAR files consist of. There are several block
types (see `block_type`), which have different `body` and
`add_body`.

]##
proc read*(_: typedesc[Rar_Block], io: KaitaiStream, root: KaitaiStruct, parent: Rar): Rar_Block =
  template this: untyped = result
  this = new(Rar_Block)
  let root = if root == nil: cast[Rar](this) else: cast[Rar](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  CRC16 of whole block or some part of it (depends on block type)
  ]##
  let crc16Expr = this.io.readU2le()
  this.crc16 = crc16Expr
  let blockTypeExpr = Rar_BlockTypes(this.io.readU1())
  this.blockType = blockTypeExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr

  ##[
  Size of block (header + body, but without additional content)
  ]##
  let blockSizeExpr = this.io.readU2le()
  this.blockSize = blockSizeExpr

  ##[
  Size of additional content in this block
  ]##
  if this.hasAdd:
    let addSizeExpr = this.io.readU4le()
    this.addSize = addSizeExpr
  block:
    let on = this.blockType
    if on == rar.file_header:
      let rawBodyExpr = this.io.readBytes(int(this.bodySize))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Rar_BlockFileHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.bodySize))
      this.body = bodyExpr

  ##[
  Additional content in this block
  ]##
  if this.hasAdd:
    let addBodyExpr = this.io.readBytes(int(this.addSize))
    this.addBody = addBodyExpr

proc hasAdd(this: Rar_Block): bool = 

  ##[
  True if block has additional content attached to it
  ]##
  if this.hasAddInst != nil:
    return this.hasAddInst
  let hasAddInstExpr = bool((this.flags and 32768) != 0)
  this.hasAddInst = hasAddInstExpr
  if this.hasAddInst != nil:
    return this.hasAddInst

proc headerSize(this: Rar_Block): int8 = 
  if this.headerSizeInst != nil:
    return this.headerSizeInst
  let headerSizeInstExpr = int8((if this.hasAdd: 11 else: 7))
  this.headerSizeInst = headerSizeInstExpr
  if this.headerSizeInst != nil:
    return this.headerSizeInst

proc bodySize(this: Rar_Block): int = 
  if this.bodySizeInst != nil:
    return this.bodySizeInst
  let bodySizeInstExpr = int((this.blockSize - this.headerSize))
  this.bodySizeInst = bodySizeInstExpr
  if this.bodySizeInst != nil:
    return this.bodySizeInst

proc fromFile*(_: typedesc[Rar_Block], filename: string): Rar_Block =
  Rar_Block.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rar_BlockFileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Rar_Block): Rar_BlockFileHeader =
  template this: untyped = result
  this = new(Rar_BlockFileHeader)
  let root = if root == nil: cast[Rar](this) else: cast[Rar](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
  ]##
  let lowUnpSizeExpr = this.io.readU4le()
  this.lowUnpSize = lowUnpSizeExpr

  ##[
  Operating system used for archiving
  ]##
  let hostOsExpr = Rar_Oses(this.io.readU1())
  this.hostOs = hostOsExpr
  let fileCrc32Expr = this.io.readU4le()
  this.fileCrc32 = fileCrc32Expr

  ##[
  Date and time in standard MS DOS format
  ]##
  let fileTimeExpr = Rar_DosTime.read(this.io, this.root, this)
  this.fileTime = fileTimeExpr

  ##[
  RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
  ]##
  let rarVersionExpr = this.io.readU1()
  this.rarVersion = rarVersionExpr

  ##[
  Compression method
  ]##
  let methodExpr = Rar_Methods(this.io.readU1())
  this.method = methodExpr

  ##[
  File name size
  ]##
  let nameSizeExpr = this.io.readU2le()
  this.nameSize = nameSizeExpr

  ##[
  File attributes
  ]##
  let attrExpr = this.io.readU4le()
  this.attr = attrExpr

  ##[
  Compressed file size, high 32 bits, only if 64-bit header flag is present
  ]##
  if (this.parent.flags and 256) != 0:
    let highPackSizeExpr = this.io.readU4le()
    this.highPackSize = highPackSizeExpr
  let fileNameExpr = this.io.readBytes(int(this.nameSize))
  this.fileName = fileNameExpr
  if (this.parent.flags and 1024) != 0:
    let saltExpr = this.io.readU8le()
    this.salt = saltExpr

proc fromFile*(_: typedesc[Rar_BlockFileHeader], filename: string): Rar_BlockFileHeader =
  Rar_BlockFileHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
8-byte magic (and pretty different block format) for v5+. This
type would parse and validate both versions of signature. Note
that actually this signature is a valid RAR "block": in theory,
one can omit signature reading at all, and read this normally,
as a block, if exact RAR version is known (and thus it's
possible to choose correct block format).

]##
proc read*(_: typedesc[Rar_MagicSignature], io: KaitaiStream, root: KaitaiStruct, parent: Rar): Rar_MagicSignature =
  template this: untyped = result
  this = new(Rar_MagicSignature)
  let root = if root == nil: cast[Rar](this) else: cast[Rar](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Fixed part of file's magic signature that doesn't change with RAR version
  ]##
  let magic1Expr = this.io.readBytes(int(6))
  this.magic1 = magic1Expr

  ##[
  Variable part of magic signature: 0 means old (RAR 1.5-4.0)
format, 1 means new (RAR 5+) format

  ]##
  let versionExpr = this.io.readU1()
  this.version = versionExpr

  ##[
  New format (RAR 5+) magic contains extra byte
  ]##
  if this.version == 1:
    let magic3Expr = this.io.readBytes(int(1))
    this.magic3 = magic3Expr

proc fromFile*(_: typedesc[Rar_MagicSignature], filename: string): Rar_MagicSignature =
  Rar_MagicSignature.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Rar_DosTime], io: KaitaiStream, root: KaitaiStruct, parent: Rar_BlockFileHeader): Rar_DosTime =
  template this: untyped = result
  this = new(Rar_DosTime)
  let root = if root == nil: cast[Rar](this) else: cast[Rar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let timeExpr = this.io.readU2le()
  this.time = timeExpr
  let dateExpr = this.io.readU2le()
  this.date = dateExpr

proc month(this: Rar_DosTime): int = 
  if this.monthInst != nil:
    return this.monthInst
  let monthInstExpr = int(((this.date and 480) shr 5))
  this.monthInst = monthInstExpr
  if this.monthInst != nil:
    return this.monthInst

proc seconds(this: Rar_DosTime): int = 
  if this.secondsInst != nil:
    return this.secondsInst
  let secondsInstExpr = int(((this.time and 31) * 2))
  this.secondsInst = secondsInstExpr
  if this.secondsInst != nil:
    return this.secondsInst

proc year(this: Rar_DosTime): int = 
  if this.yearInst != nil:
    return this.yearInst
  let yearInstExpr = int((((this.date and 65024) shr 9) + 1980))
  this.yearInst = yearInstExpr
  if this.yearInst != nil:
    return this.yearInst

proc minutes(this: Rar_DosTime): int = 
  if this.minutesInst != nil:
    return this.minutesInst
  let minutesInstExpr = int(((this.time and 2016) shr 5))
  this.minutesInst = minutesInstExpr
  if this.minutesInst != nil:
    return this.minutesInst

proc day(this: Rar_DosTime): int = 
  if this.dayInst != nil:
    return this.dayInst
  let dayInstExpr = int((this.date and 31))
  this.dayInst = dayInstExpr
  if this.dayInst != nil:
    return this.dayInst

proc hours(this: Rar_DosTime): int = 
  if this.hoursInst != nil:
    return this.hoursInst
  let hoursInstExpr = int(((this.time and 63488) shr 11))
  this.hoursInst = hoursInstExpr
  if this.hoursInst != nil:
    return this.hoursInst

proc fromFile*(_: typedesc[Rar_DosTime], filename: string): Rar_DosTime =
  Rar_DosTime.read(newKaitaiFileStream(filename), nil, nil)

