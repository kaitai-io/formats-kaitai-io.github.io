import kaitai_struct_nim_runtime
import options
import mach_o

type
  MachOFat* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `numFatArch`*: uint32
    `fatArchs`*: seq[MachOFat_FatArch]
    `parent`*: KaitaiStruct
  MachOFat_FatArch* = ref object of KaitaiStruct
    `cpuType`*: MachO_CpuType
    `cpuSubtype`*: uint32
    `ofsObject`*: uint32
    `lenObject`*: uint32
    `align`*: uint32
    `parent`*: MachOFat
    `rawObjectInst`*: seq[byte]
    `objectInst`: MachO
    `objectInstFlag`: bool

proc read*(_: typedesc[MachOFat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachOFat
proc read*(_: typedesc[MachOFat_FatArch], io: KaitaiStream, root: KaitaiStruct, parent: MachOFat): MachOFat_FatArch

proc object*(this: MachOFat_FatArch): MachO


##[
This is a simple container format that encapsulates multiple Mach-O files,
each generally for a different architecture. XNU can execute these files just
like single-arch Mach-Os and will pick the appropriate entry.

@see <a href="https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html">Source</a>
]##
proc read*(_: typedesc[MachOFat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MachOFat =
  template this: untyped = result
  this = new(MachOFat)
  let root = if root == nil: cast[MachOFat](this) else: cast[MachOFat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let numFatArchExpr = this.io.readU4be()
  this.numFatArch = numFatArchExpr
  for i in 0 ..< int(this.numFatArch):
    let it = MachOFat_FatArch.read(this.io, this.root, this)
    this.fatArchs.add(it)

proc fromFile*(_: typedesc[MachOFat], filename: string): MachOFat =
  MachOFat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MachOFat_FatArch], io: KaitaiStream, root: KaitaiStruct, parent: MachOFat): MachOFat_FatArch =
  template this: untyped = result
  this = new(MachOFat_FatArch)
  let root = if root == nil: cast[MachOFat](this) else: cast[MachOFat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cpuTypeExpr = MachO_CpuType(this.io.readU4be())
  this.cpuType = cpuTypeExpr
  let cpuSubtypeExpr = this.io.readU4be()
  this.cpuSubtype = cpuSubtypeExpr
  let ofsObjectExpr = this.io.readU4be()
  this.ofsObject = ofsObjectExpr
  let lenObjectExpr = this.io.readU4be()
  this.lenObject = lenObjectExpr
  let alignExpr = this.io.readU4be()
  this.align = alignExpr

proc object(this: MachOFat_FatArch): MachO = 
  if this.objectInstFlag:
    return this.objectInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsObject))
  let rawObjectInstExpr = this.io.readBytes(int(this.lenObject))
  this.rawObjectInst = rawObjectInstExpr
  let rawObjectInstIo = newKaitaiStream(rawObjectInstExpr)
  let objectInstExpr = MachO.read(rawObjectInstIo, nil, nil)
  this.objectInst = objectInstExpr
  this.io.seek(pos)
  this.objectInstFlag = true
  return this.objectInst

proc fromFile*(_: typedesc[MachOFat_FatArch], filename: string): MachOFat_FatArch =
  MachOFat_FatArch.read(newKaitaiFileStream(filename), nil, nil)

