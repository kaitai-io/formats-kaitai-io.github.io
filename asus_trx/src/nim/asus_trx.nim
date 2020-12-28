import kaitai_struct_nim_runtime
import options

type
  AsusTrx* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `headerInst`*: AsusTrx_Header
    `tailInst`*: AsusTrx_Tail
  AsusTrx_Revision* = ref object of KaitaiStruct
    `major`*: uint8
    `minor`*: uint8
    `parent`*: AsusTrx_Tail_HwCompInfo
  AsusTrx_Version* = ref object of KaitaiStruct
    `major`*: uint8
    `minor`*: uint8
    `patch`*: uint8
    `tweak`*: uint8
    `parent`*: AsusTrx_Tail
  AsusTrx_Tail* = ref object of KaitaiStruct
    `version`*: AsusTrx_Version
    `productId`*: string
    `compHw`*: seq[AsusTrx_Tail_HwCompInfo]
    `reserved`*: seq[byte]
    `parent`*: AsusTrx
  AsusTrx_Tail_HwCompInfo* = ref object of KaitaiStruct
    `min`*: AsusTrx_Revision
    `max`*: AsusTrx_Revision
    `parent`*: AsusTrx_Tail
  AsusTrx_Header* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `len`*: uint32
    `crc32`*: uint32
    `version`*: uint16
    `flags`*: AsusTrx_Header_Flags
    `partitions`*: seq[AsusTrx_Header_Partition]
    `parent`*: AsusTrx
  AsusTrx_Header_Partition* = ref object of KaitaiStruct
    `offset`*: uint32
    `idx`*: uint8
    `parent`*: AsusTrx_Header
    `presentInst`*: bool
    `isLastInst`*: bool
    `sizeInst`*: int
    `partitionInst`*: seq[byte]
  AsusTrx_Header_Flags* = ref object of KaitaiStruct
    `flags`*: seq[bool]
    `parent`*: AsusTrx_Header

proc read*(_: typedesc[AsusTrx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AsusTrx
proc read*(_: typedesc[AsusTrx_Revision], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Tail_HwCompInfo): AsusTrx_Revision
proc read*(_: typedesc[AsusTrx_Version], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Tail): AsusTrx_Version
proc read*(_: typedesc[AsusTrx_Tail], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx): AsusTrx_Tail
proc read*(_: typedesc[AsusTrx_Tail_HwCompInfo], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Tail): AsusTrx_Tail_HwCompInfo
proc read*(_: typedesc[AsusTrx_Header], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx): AsusTrx_Header
proc read*(_: typedesc[AsusTrx_Header_Partition], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Header, idx: any): AsusTrx_Header_Partition
proc read*(_: typedesc[AsusTrx_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Header): AsusTrx_Header_Flags

proc header*(this: AsusTrx): AsusTrx_Header
proc tail*(this: AsusTrx): AsusTrx_Tail
proc present*(this: AsusTrx_Header_Partition): bool
proc isLast*(this: AsusTrx_Header_Partition): bool
proc size*(this: AsusTrx_Header_Partition): int
proc partition*(this: AsusTrx_Header_Partition): seq[byte]


##[
Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.

@see <a href="https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c">Source</a>
]##
proc read*(_: typedesc[AsusTrx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AsusTrx =
  template this: untyped = result
  this = new(AsusTrx)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent


proc header(this: AsusTrx): AsusTrx_Header = 
  if this.headerInst != nil:
    return this.headerInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let headerInstExpr = AsusTrx_Header.read(this.io, this.root, this)
  this.headerInst = headerInstExpr
  this.io.seek(pos)
  if this.headerInst != nil:
    return this.headerInst

proc tail(this: AsusTrx): AsusTrx_Tail = 
  if this.tailInst != nil:
    return this.tailInst
  let pos = this.io.pos()
  this.io.seek(int((this.io.size - 64)))
  let tailInstExpr = AsusTrx_Tail.read(this.io, this.root, this)
  this.tailInst = tailInstExpr
  this.io.seek(pos)
  if this.tailInst != nil:
    return this.tailInst

proc fromFile*(_: typedesc[AsusTrx], filename: string): AsusTrx =
  AsusTrx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AsusTrx_Revision], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Tail_HwCompInfo): AsusTrx_Revision =
  template this: untyped = result
  this = new(AsusTrx_Revision)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU1()
  this.major = majorExpr
  let minorExpr = this.io.readU1()
  this.minor = minorExpr

proc fromFile*(_: typedesc[AsusTrx_Revision], filename: string): AsusTrx_Revision =
  AsusTrx_Revision.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AsusTrx_Version], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Tail): AsusTrx_Version =
  template this: untyped = result
  this = new(AsusTrx_Version)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU1()
  this.major = majorExpr
  let minorExpr = this.io.readU1()
  this.minor = minorExpr
  let patchExpr = this.io.readU1()
  this.patch = patchExpr
  let tweakExpr = this.io.readU1()
  this.tweak = tweakExpr

proc fromFile*(_: typedesc[AsusTrx_Version], filename: string): AsusTrx_Version =
  AsusTrx_Version.read(newKaitaiFileStream(filename), nil, nil)


##[
A safeguard against installation of firmware to an incompatible device
]##
proc read*(_: typedesc[AsusTrx_Tail], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx): AsusTrx_Tail =
  template this: untyped = result
  this = new(AsusTrx_Tail)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  1.9.2.7 by default
  ]##
  let versionExpr = AsusTrx_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let productIdExpr = encode(this.io.readBytes(int(12)).bytesTerminate(0, false), "utf-8")
  this.productId = productIdExpr

  ##[
  0.02 - 2.99
  ]##
  for i in 0 ..< int(4):
    let it = AsusTrx_Tail_HwCompInfo.read(this.io, this.root, this)
    this.compHw.add(it)
  let reservedExpr = this.io.readBytes(int(32))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[AsusTrx_Tail], filename: string): AsusTrx_Tail =
  AsusTrx_Tail.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AsusTrx_Tail_HwCompInfo], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Tail): AsusTrx_Tail_HwCompInfo =
  template this: untyped = result
  this = new(AsusTrx_Tail_HwCompInfo)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minExpr = AsusTrx_Revision.read(this.io, this.root, this)
  this.min = minExpr
  let maxExpr = AsusTrx_Revision.read(this.io, this.root, this)
  this.max = maxExpr

proc fromFile*(_: typedesc[AsusTrx_Tail_HwCompInfo], filename: string): AsusTrx_Tail_HwCompInfo =
  AsusTrx_Tail_HwCompInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AsusTrx_Header], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx): AsusTrx_Header =
  template this: untyped = result
  this = new(AsusTrx_Header)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr

  ##[
  Length of file including header
  ]##
  let lenExpr = this.io.readU4le()
  this.len = lenExpr

  ##[
  CRC from `version` (??? todo: see the original and disambiguate) to end of file
  ]##
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr
  let versionExpr = this.io.readU2le()
  this.version = versionExpr
  let flagsExpr = AsusTrx_Header_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  Offsets of partitions from start of header
  ]##
  block:
    var i: int
    while true:
      let it = AsusTrx_Header_Partition.read(this.io, this.root, this, i)
      this.partitions.add(it)
      if  ((i >= 4) or (not(it.present))) :
        break
      inc i

proc fromFile*(_: typedesc[AsusTrx_Header], filename: string): AsusTrx_Header =
  AsusTrx_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AsusTrx_Header_Partition], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Header, idx: any): AsusTrx_Header_Partition =
  template this: untyped = result
  this = new(AsusTrx_Header_Partition)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint8(idx)
  this.idx = idxExpr

  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr

proc present(this: AsusTrx_Header_Partition): bool = 
  if this.presentInst != nil:
    return this.presentInst
  let presentInstExpr = bool(this.offset != 0)
  this.presentInst = presentInstExpr
  if this.presentInst != nil:
    return this.presentInst

proc isLast(this: AsusTrx_Header_Partition): bool = 
  if this.isLastInst != nil:
    return this.isLastInst
  if this.present:
    let isLastInstExpr = bool( ((this.idx == (len(this.parent.partitions) - 1)) or (not(this.parent.partitions[(this.idx + 1)].present))) )
    this.isLastInst = isLastInstExpr
  if this.isLastInst != nil:
    return this.isLastInst

proc size(this: AsusTrx_Header_Partition): int = 
  if this.sizeInst != nil:
    return this.sizeInst
  if this.present:
    let sizeInstExpr = int((if this.isLast: (AsusTrx(this.root).io.size - this.offset) else: this.parent.partitions[(this.idx + 1)].offset))
    this.sizeInst = sizeInstExpr
  if this.sizeInst != nil:
    return this.sizeInst

proc partition(this: AsusTrx_Header_Partition): seq[byte] = 
  if this.partitionInst.len != 0:
    return this.partitionInst
  if this.present:
    let io = AsusTrx(this.root).io
    let pos = io.pos()
    io.seek(int(this.offset))
    let partitionInstExpr = io.readBytes(int(this.size))
    this.partitionInst = partitionInstExpr
    io.seek(pos)
  if this.partitionInst.len != 0:
    return this.partitionInst

proc fromFile*(_: typedesc[AsusTrx_Header_Partition], filename: string): AsusTrx_Header_Partition =
  AsusTrx_Header_Partition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AsusTrx_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: AsusTrx_Header): AsusTrx_Header_Flags =
  template this: untyped = result
  this = new(AsusTrx_Header_Flags)
  let root = if root == nil: cast[AsusTrx](this) else: cast[AsusTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(16):
    let it = this.io.readBitsIntLe(1) != 0
    this.flags.add(it)

proc fromFile*(_: typedesc[AsusTrx_Header_Flags], filename: string): AsusTrx_Header_Flags =
  AsusTrx_Header_Flags.read(newKaitaiFileStream(filename), nil, nil)

