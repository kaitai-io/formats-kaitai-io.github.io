import kaitai_struct_nim_runtime
import options

type
  BroadcomTrx* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `headerInst`: BroadcomTrx_Header
    `headerInstFlag`: bool
    `tailInst`: BroadcomTrx_Tail
    `tailInstFlag`: bool
  BroadcomTrx_Revision* = ref object of KaitaiStruct
    `major`*: uint8
    `minor`*: uint8
    `parent`*: BroadcomTrx_Tail_HwCompInfo
  BroadcomTrx_Version* = ref object of KaitaiStruct
    `major`*: uint8
    `minor`*: uint8
    `patch`*: uint8
    `tweak`*: uint8
    `parent`*: BroadcomTrx_Tail
  BroadcomTrx_Tail* = ref object of KaitaiStruct
    `version`*: BroadcomTrx_Version
    `productId`*: string
    `compHw`*: seq[BroadcomTrx_Tail_HwCompInfo]
    `reserved`*: seq[byte]
    `parent`*: BroadcomTrx
  BroadcomTrx_Tail_HwCompInfo* = ref object of KaitaiStruct
    `min`*: BroadcomTrx_Revision
    `max`*: BroadcomTrx_Revision
    `parent`*: BroadcomTrx_Tail
  BroadcomTrx_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `len`*: uint32
    `crc32`*: uint32
    `version`*: uint16
    `flags`*: BroadcomTrx_Header_Flags
    `partitions`*: seq[BroadcomTrx_Header_Partition]
    `parent`*: BroadcomTrx
  BroadcomTrx_Header_Partition* = ref object of KaitaiStruct
    `ofsBody`*: uint32
    `idx`*: uint8
    `parent`*: BroadcomTrx_Header
    `isPresentInst`: bool
    `isPresentInstFlag`: bool
    `isLastInst`: bool
    `isLastInstFlag`: bool
    `lenBodyInst`: int
    `lenBodyInstFlag`: bool
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
  BroadcomTrx_Header_Flags* = ref object of KaitaiStruct
    `flags`*: seq[bool]
    `parent`*: BroadcomTrx_Header

proc read*(_: typedesc[BroadcomTrx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BroadcomTrx
proc read*(_: typedesc[BroadcomTrx_Revision], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Tail_HwCompInfo): BroadcomTrx_Revision
proc read*(_: typedesc[BroadcomTrx_Version], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Tail): BroadcomTrx_Version
proc read*(_: typedesc[BroadcomTrx_Tail], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx): BroadcomTrx_Tail
proc read*(_: typedesc[BroadcomTrx_Tail_HwCompInfo], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Tail): BroadcomTrx_Tail_HwCompInfo
proc read*(_: typedesc[BroadcomTrx_Header], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx): BroadcomTrx_Header
proc read*(_: typedesc[BroadcomTrx_Header_Partition], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Header, idx: any): BroadcomTrx_Header_Partition
proc read*(_: typedesc[BroadcomTrx_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Header): BroadcomTrx_Header_Flags

proc header*(this: BroadcomTrx): BroadcomTrx_Header
proc tail*(this: BroadcomTrx): BroadcomTrx_Tail
proc isPresent*(this: BroadcomTrx_Header_Partition): bool
proc isLast*(this: BroadcomTrx_Header_Partition): bool
proc lenBody*(this: BroadcomTrx_Header_Partition): int
proc body*(this: BroadcomTrx_Header_Partition): seq[byte]


##[
.trx file format is widely used for distribution of firmware
updates for Broadcom devices. The most well-known are ASUS routers.

Fundamentally, it includes a footer which acts as a safeguard
against installing a firmware package on a wrong hardware model or
version, and a header which list numerous partitions packaged inside
a single .trx file.

trx files not necessarily contain all these headers.

@see <a href="https://github.com/openwrt/firmware-utils/blob/a2c80c5/src/trx.c">Source</a>
@see <a href="https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header">Source</a>
@see <a href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt">Source</a>
]##
proc read*(_: typedesc[BroadcomTrx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BroadcomTrx =
  template this: untyped = result
  this = new(BroadcomTrx)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent


proc header(this: BroadcomTrx): BroadcomTrx_Header = 
  if this.headerInstFlag:
    return this.headerInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let headerInstExpr = BroadcomTrx_Header.read(this.io, this.root, this)
  this.headerInst = headerInstExpr
  this.io.seek(pos)
  this.headerInstFlag = true
  return this.headerInst

proc tail(this: BroadcomTrx): BroadcomTrx_Tail = 
  if this.tailInstFlag:
    return this.tailInst
  let pos = this.io.pos()
  this.io.seek(int((this.io.size - 64)))
  let tailInstExpr = BroadcomTrx_Tail.read(this.io, this.root, this)
  this.tailInst = tailInstExpr
  this.io.seek(pos)
  this.tailInstFlag = true
  return this.tailInst

proc fromFile*(_: typedesc[BroadcomTrx], filename: string): BroadcomTrx =
  BroadcomTrx.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BroadcomTrx_Revision], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Tail_HwCompInfo): BroadcomTrx_Revision =
  template this: untyped = result
  this = new(BroadcomTrx_Revision)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU1()
  this.major = majorExpr
  let minorExpr = this.io.readU1()
  this.minor = minorExpr

proc fromFile*(_: typedesc[BroadcomTrx_Revision], filename: string): BroadcomTrx_Revision =
  BroadcomTrx_Revision.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BroadcomTrx_Version], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Tail): BroadcomTrx_Version =
  template this: untyped = result
  this = new(BroadcomTrx_Version)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
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

proc fromFile*(_: typedesc[BroadcomTrx_Version], filename: string): BroadcomTrx_Version =
  BroadcomTrx_Version.read(newKaitaiFileStream(filename), nil, nil)


##[
A safeguard against installation of firmware to an incompatible device
]##
proc read*(_: typedesc[BroadcomTrx_Tail], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx): BroadcomTrx_Tail =
  template this: untyped = result
  this = new(BroadcomTrx_Tail)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  1.9.2.7 by default
  ]##
  let versionExpr = BroadcomTrx_Version.read(this.io, this.root, this)
  this.version = versionExpr
  let productIdExpr = encode(this.io.readBytes(int(12)).bytesTerminate(0, false), "utf-8")
  this.productId = productIdExpr

  ##[
  0.02 - 2.99
  ]##
  for i in 0 ..< int(4):
    let it = BroadcomTrx_Tail_HwCompInfo.read(this.io, this.root, this)
    this.compHw.add(it)
  let reservedExpr = this.io.readBytes(int(32))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[BroadcomTrx_Tail], filename: string): BroadcomTrx_Tail =
  BroadcomTrx_Tail.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BroadcomTrx_Tail_HwCompInfo], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Tail): BroadcomTrx_Tail_HwCompInfo =
  template this: untyped = result
  this = new(BroadcomTrx_Tail_HwCompInfo)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minExpr = BroadcomTrx_Revision.read(this.io, this.root, this)
  this.min = minExpr
  let maxExpr = BroadcomTrx_Revision.read(this.io, this.root, this)
  this.max = maxExpr

proc fromFile*(_: typedesc[BroadcomTrx_Tail_HwCompInfo], filename: string): BroadcomTrx_Tail_HwCompInfo =
  BroadcomTrx_Tail_HwCompInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BroadcomTrx_Header], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx): BroadcomTrx_Header =
  template this: untyped = result
  this = new(BroadcomTrx_Header)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

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
  let flagsExpr = BroadcomTrx_Header_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  Offsets of partitions from start of header
  ]##
  block:
    var i: int
    while true:
      let it = BroadcomTrx_Header_Partition.read(this.io, this.root, this, i)
      this.partitions.add(it)
      if  ((i >= 4) or (not(it.isPresent))) :
        break
      inc i

proc fromFile*(_: typedesc[BroadcomTrx_Header], filename: string): BroadcomTrx_Header =
  BroadcomTrx_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BroadcomTrx_Header_Partition], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Header, idx: any): BroadcomTrx_Header_Partition =
  template this: untyped = result
  this = new(BroadcomTrx_Header_Partition)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint8(idx)
  this.idx = idxExpr

  let ofsBodyExpr = this.io.readU4le()
  this.ofsBody = ofsBodyExpr

proc isPresent(this: BroadcomTrx_Header_Partition): bool = 
  if this.isPresentInstFlag:
    return this.isPresentInst
  let isPresentInstExpr = bool(this.ofsBody != 0)
  this.isPresentInst = isPresentInstExpr
  this.isPresentInstFlag = true
  return this.isPresentInst

proc isLast(this: BroadcomTrx_Header_Partition): bool = 
  if this.isLastInstFlag:
    return this.isLastInst
  if this.isPresent:
    let isLastInstExpr = bool( ((this.idx == (len(this.parent.partitions) - 1)) or (not(this.parent.partitions[(this.idx + 1)].isPresent))) )
    this.isLastInst = isLastInstExpr
  this.isLastInstFlag = true
  return this.isLastInst

proc lenBody(this: BroadcomTrx_Header_Partition): int = 
  if this.lenBodyInstFlag:
    return this.lenBodyInst
  if this.isPresent:
    let lenBodyInstExpr = int((if this.isLast: (BroadcomTrx(this.root).io.size - this.ofsBody) else: this.parent.partitions[(this.idx + 1)].ofsBody))
    this.lenBodyInst = lenBodyInstExpr
  this.lenBodyInstFlag = true
  return this.lenBodyInst

proc body(this: BroadcomTrx_Header_Partition): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  if this.isPresent:
    let io = BroadcomTrx(this.root).io
    let pos = io.pos()
    io.seek(int(this.ofsBody))
    let bodyInstExpr = io.readBytes(int(this.lenBody))
    this.bodyInst = bodyInstExpr
    io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[BroadcomTrx_Header_Partition], filename: string): BroadcomTrx_Header_Partition =
  BroadcomTrx_Header_Partition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BroadcomTrx_Header_Flags], io: KaitaiStream, root: KaitaiStruct, parent: BroadcomTrx_Header): BroadcomTrx_Header_Flags =
  template this: untyped = result
  this = new(BroadcomTrx_Header_Flags)
  let root = if root == nil: cast[BroadcomTrx](this) else: cast[BroadcomTrx](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(16):
    let it = this.io.readBitsIntLe(1) != 0
    this.flags.add(it)

proc fromFile*(_: typedesc[BroadcomTrx_Header_Flags], filename: string): BroadcomTrx_Header_Flags =
  BroadcomTrx_Header_Flags.read(newKaitaiFileStream(filename), nil, nil)

