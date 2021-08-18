import kaitai_struct_nim_runtime
import options

type
  Dtb* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `totalSize`*: uint32
    `ofsStructureBlock`*: uint32
    `ofsStringsBlock`*: uint32
    `ofsMemoryReservationBlock`*: uint32
    `version`*: uint32
    `minCompatibleVersion`*: uint32
    `bootCpuidPhys`*: uint32
    `lenStringsBlock`*: uint32
    `lenStructureBlock`*: uint32
    `parent`*: KaitaiStruct
    `rawMemoryReservationBlockInst`*: seq[byte]
    `rawStructureBlockInst`*: seq[byte]
    `rawStringsBlockInst`*: seq[byte]
    `memoryReservationBlockInst`*: Dtb_MemoryBlock
    `structureBlockInst`*: Dtb_FdtBlock
    `stringsBlockInst`*: Dtb_Strings
  Dtb_Fdt* = enum
    begin_node = 1
    end_node = 2
    prop = 3
    nop = 4
    end = 9
  Dtb_MemoryBlock* = ref object of KaitaiStruct
    `entries`*: seq[Dtb_MemoryBlockEntry]
    `parent`*: Dtb
  Dtb_FdtBlock* = ref object of KaitaiStruct
    `nodes`*: seq[Dtb_FdtNode]
    `parent`*: Dtb
  Dtb_MemoryBlockEntry* = ref object of KaitaiStruct
    `address`*: uint64
    `size`*: uint64
    `parent`*: Dtb_MemoryBlock
  Dtb_Strings* = ref object of KaitaiStruct
    `strings`*: seq[string]
    `parent`*: Dtb
  Dtb_FdtProp* = ref object of KaitaiStruct
    `lenProperty`*: uint32
    `ofsName`*: uint32
    `property`*: seq[byte]
    `padding`*: seq[byte]
    `parent`*: Dtb_FdtNode
    `nameInst`*: string
  Dtb_FdtNode* = ref object of KaitaiStruct
    `type`*: Dtb_Fdt
    `body`*: KaitaiStruct
    `parent`*: Dtb_FdtBlock
  Dtb_FdtBeginNode* = ref object of KaitaiStruct
    `name`*: string
    `padding`*: seq[byte]
    `parent`*: Dtb_FdtNode

proc read*(_: typedesc[Dtb], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dtb
proc read*(_: typedesc[Dtb_MemoryBlock], io: KaitaiStream, root: KaitaiStruct, parent: Dtb): Dtb_MemoryBlock
proc read*(_: typedesc[Dtb_FdtBlock], io: KaitaiStream, root: KaitaiStruct, parent: Dtb): Dtb_FdtBlock
proc read*(_: typedesc[Dtb_MemoryBlockEntry], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_MemoryBlock): Dtb_MemoryBlockEntry
proc read*(_: typedesc[Dtb_Strings], io: KaitaiStream, root: KaitaiStruct, parent: Dtb): Dtb_Strings
proc read*(_: typedesc[Dtb_FdtProp], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_FdtNode): Dtb_FdtProp
proc read*(_: typedesc[Dtb_FdtNode], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_FdtBlock): Dtb_FdtNode
proc read*(_: typedesc[Dtb_FdtBeginNode], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_FdtNode): Dtb_FdtBeginNode

proc memoryReservationBlock*(this: Dtb): Dtb_MemoryBlock
proc structureBlock*(this: Dtb): Dtb_FdtBlock
proc stringsBlock*(this: Dtb): Dtb_Strings
proc name*(this: Dtb_FdtProp): string


##[
Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
of data (primarily devicetree data, although other data is possible as well).
The data is internally stored as a tree of named nodes and properties. Nodes
contain properties and child nodes, while properties are name–value pairs.

The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
files (`.dts`) through the Devicetree compiler (DTC).

On Linux systems that support this, the blobs can be accessed in
`/sys/firmware/fdt`:

* <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>

The encoding of strings used in the `strings_block` and `structure_block` is
actually a subset of ASCII:

<https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>

Example files:

* <https://github.com/qemu/qemu/tree/master/pc-bios>

@see <a href="https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html">Source</a>
@see <a href="https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf">Source</a>
]##
proc read*(_: typedesc[Dtb], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dtb =
  template this: untyped = result
  this = new(Dtb)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let totalSizeExpr = this.io.readU4be()
  this.totalSize = totalSizeExpr
  let ofsStructureBlockExpr = this.io.readU4be()
  this.ofsStructureBlock = ofsStructureBlockExpr
  let ofsStringsBlockExpr = this.io.readU4be()
  this.ofsStringsBlock = ofsStringsBlockExpr
  let ofsMemoryReservationBlockExpr = this.io.readU4be()
  this.ofsMemoryReservationBlock = ofsMemoryReservationBlockExpr
  let versionExpr = this.io.readU4be()
  this.version = versionExpr
  let minCompatibleVersionExpr = this.io.readU4be()
  this.minCompatibleVersion = minCompatibleVersionExpr
  let bootCpuidPhysExpr = this.io.readU4be()
  this.bootCpuidPhys = bootCpuidPhysExpr
  let lenStringsBlockExpr = this.io.readU4be()
  this.lenStringsBlock = lenStringsBlockExpr
  let lenStructureBlockExpr = this.io.readU4be()
  this.lenStructureBlock = lenStructureBlockExpr

proc memoryReservationBlock(this: Dtb): Dtb_MemoryBlock = 
  if this.memoryReservationBlockInst != nil:
    return this.memoryReservationBlockInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsMemoryReservationBlock))
  let rawMemoryReservationBlockInstExpr = this.io.readBytes(int((this.ofsStructureBlock - this.ofsMemoryReservationBlock)))
  this.rawMemoryReservationBlockInst = rawMemoryReservationBlockInstExpr
  let rawMemoryReservationBlockInstIo = newKaitaiStream(rawMemoryReservationBlockInstExpr)
  let memoryReservationBlockInstExpr = Dtb_MemoryBlock.read(rawMemoryReservationBlockInstIo, this.root, this)
  this.memoryReservationBlockInst = memoryReservationBlockInstExpr
  this.io.seek(pos)
  if this.memoryReservationBlockInst != nil:
    return this.memoryReservationBlockInst

proc structureBlock(this: Dtb): Dtb_FdtBlock = 
  if this.structureBlockInst != nil:
    return this.structureBlockInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsStructureBlock))
  let rawStructureBlockInstExpr = this.io.readBytes(int(this.lenStructureBlock))
  this.rawStructureBlockInst = rawStructureBlockInstExpr
  let rawStructureBlockInstIo = newKaitaiStream(rawStructureBlockInstExpr)
  let structureBlockInstExpr = Dtb_FdtBlock.read(rawStructureBlockInstIo, this.root, this)
  this.structureBlockInst = structureBlockInstExpr
  this.io.seek(pos)
  if this.structureBlockInst != nil:
    return this.structureBlockInst

proc stringsBlock(this: Dtb): Dtb_Strings = 
  if this.stringsBlockInst != nil:
    return this.stringsBlockInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsStringsBlock))
  let rawStringsBlockInstExpr = this.io.readBytes(int(this.lenStringsBlock))
  this.rawStringsBlockInst = rawStringsBlockInstExpr
  let rawStringsBlockInstIo = newKaitaiStream(rawStringsBlockInstExpr)
  let stringsBlockInstExpr = Dtb_Strings.read(rawStringsBlockInstIo, this.root, this)
  this.stringsBlockInst = stringsBlockInstExpr
  this.io.seek(pos)
  if this.stringsBlockInst != nil:
    return this.stringsBlockInst

proc fromFile*(_: typedesc[Dtb], filename: string): Dtb =
  Dtb.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_MemoryBlock], io: KaitaiStream, root: KaitaiStruct, parent: Dtb): Dtb_MemoryBlock =
  template this: untyped = result
  this = new(Dtb_MemoryBlock)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Dtb_MemoryBlockEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Dtb_MemoryBlock], filename: string): Dtb_MemoryBlock =
  Dtb_MemoryBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_FdtBlock], io: KaitaiStream, root: KaitaiStruct, parent: Dtb): Dtb_FdtBlock =
  template this: untyped = result
  this = new(Dtb_FdtBlock)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = Dtb_FdtNode.read(this.io, this.root, this)
      this.nodes.add(it)
      if it.type == dtb.end:
        break
      inc i

proc fromFile*(_: typedesc[Dtb_FdtBlock], filename: string): Dtb_FdtBlock =
  Dtb_FdtBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_MemoryBlockEntry], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_MemoryBlock): Dtb_MemoryBlockEntry =
  template this: untyped = result
  this = new(Dtb_MemoryBlockEntry)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  physical address of a reserved memory region
  ]##
  let addressExpr = this.io.readU8be()
  this.address = addressExpr

  ##[
  size of a reserved memory region
  ]##
  let sizeExpr = this.io.readU8be()
  this.size = sizeExpr

proc fromFile*(_: typedesc[Dtb_MemoryBlockEntry], filename: string): Dtb_MemoryBlockEntry =
  Dtb_MemoryBlockEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_Strings], io: KaitaiStream, root: KaitaiStruct, parent: Dtb): Dtb_Strings =
  template this: untyped = result
  this = new(Dtb_Strings)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
      this.strings.add(it)
      inc i

proc fromFile*(_: typedesc[Dtb_Strings], filename: string): Dtb_Strings =
  Dtb_Strings.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_FdtProp], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_FdtNode): Dtb_FdtProp =
  template this: untyped = result
  this = new(Dtb_FdtProp)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenPropertyExpr = this.io.readU4be()
  this.lenProperty = lenPropertyExpr
  let ofsNameExpr = this.io.readU4be()
  this.ofsName = ofsNameExpr
  let propertyExpr = this.io.readBytes(int(this.lenProperty))
  this.property = propertyExpr
  let paddingExpr = this.io.readBytes(int((-(this.io.pos) %%% 4)))
  this.padding = paddingExpr

proc name(this: Dtb_FdtProp): string = 
  if this.nameInst.len != 0:
    return this.nameInst
  let io = Dtb(this.root).stringsBlock.io
  let pos = io.pos()
  io.seek(int(this.ofsName))
  let nameInstExpr = encode(io.readBytesTerm(0, false, true, true), "ASCII")
  this.nameInst = nameInstExpr
  io.seek(pos)
  if this.nameInst.len != 0:
    return this.nameInst

proc fromFile*(_: typedesc[Dtb_FdtProp], filename: string): Dtb_FdtProp =
  Dtb_FdtProp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_FdtNode], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_FdtBlock): Dtb_FdtNode =
  template this: untyped = result
  this = new(Dtb_FdtNode)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = Dtb_Fdt(this.io.readU4be())
  this.type = typeExpr
  block:
    let on = this.type
    if on == dtb.begin_node:
      let bodyExpr = Dtb_FdtBeginNode.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == dtb.prop:
      let bodyExpr = Dtb_FdtProp.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Dtb_FdtNode], filename: string): Dtb_FdtNode =
  Dtb_FdtNode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Dtb_FdtBeginNode], io: KaitaiStream, root: KaitaiStruct, parent: Dtb_FdtNode): Dtb_FdtBeginNode =
  template this: untyped = result
  this = new(Dtb_FdtBeginNode)
  let root = if root == nil: cast[Dtb](this) else: cast[Dtb](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.name = nameExpr
  let paddingExpr = this.io.readBytes(int((-(this.io.pos) %%% 4)))
  this.padding = paddingExpr

proc fromFile*(_: typedesc[Dtb_FdtBeginNode], filename: string): Dtb_FdtBeginNode =
  Dtb_FdtBeginNode.read(newKaitaiFileStream(filename), nil, nil)

