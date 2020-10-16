import kaitai_struct_nim_runtime
import options

type
  DosMz* = ref object of KaitaiStruct
    `hdr`*: DosMz_MzHeader
    `mzHeader2`*: seq[byte]
    `relocations`*: seq[DosMz_Relocation]
    `body`*: seq[byte]
    `parent`*: KaitaiStruct
  DosMz_MzHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lastPageExtraBytes`*: uint16
    `numPages`*: uint16
    `numRelocations`*: uint16
    `headerSize`*: uint16
    `minAllocation`*: uint16
    `maxAllocation`*: uint16
    `initialSs`*: uint16
    `initialSp`*: uint16
    `checksum`*: uint16
    `initialIp`*: uint16
    `initialCs`*: uint16
    `ofsRelocations`*: uint16
    `overlayId`*: uint16
    `parent`*: DosMz
  DosMz_Relocation* = ref object of KaitaiStruct
    `ofs`*: uint16
    `seg`*: uint16
    `parent`*: DosMz

proc read*(_: typedesc[DosMz], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DosMz
proc read*(_: typedesc[DosMz_MzHeader], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_MzHeader
proc read*(_: typedesc[DosMz_Relocation], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_Relocation



##[
DOS MZ file format is a traditional format for executables in MS-DOS
environment. Many modern formats (i.e. Windows PE) still maintain
compatibility stub with this format.

As opposed to .com file format (which basically sports one 64K code
segment of raw CPU instructions), DOS MZ .exe file format allowed
more flexible memory management, loading of larger programs and
added support for relocations.

]##
proc read*(_: typedesc[DosMz], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DosMz =
  template this: untyped = result
  this = new(DosMz)
  let root = if root == nil: cast[DosMz](this) else: cast[DosMz](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hdrExpr = DosMz_MzHeader.read(this.io, this.root, this)
  this.hdr = hdrExpr
  let mzHeader2Expr = this.io.readBytes(int((this.hdr.ofsRelocations - 28)))
  this.mzHeader2 = mzHeader2Expr
  for i in 0 ..< int(this.hdr.numRelocations):
    let it = DosMz_Relocation.read(this.io, this.root, this)
    this.relocations.add(it)
  let bodyExpr = this.io.readBytesFull()
  this.body = bodyExpr

proc fromFile*(_: typedesc[DosMz], filename: string): DosMz =
  DosMz.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DosMz_MzHeader], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_MzHeader =
  template this: untyped = result
  this = new(DosMz_MzHeader)
  let root = if root == nil: cast[DosMz](this) else: cast[DosMz](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let lastPageExtraBytesExpr = this.io.readU2le()
  this.lastPageExtraBytes = lastPageExtraBytesExpr
  let numPagesExpr = this.io.readU2le()
  this.numPages = numPagesExpr
  let numRelocationsExpr = this.io.readU2le()
  this.numRelocations = numRelocationsExpr
  let headerSizeExpr = this.io.readU2le()
  this.headerSize = headerSizeExpr
  let minAllocationExpr = this.io.readU2le()
  this.minAllocation = minAllocationExpr
  let maxAllocationExpr = this.io.readU2le()
  this.maxAllocation = maxAllocationExpr
  let initialSsExpr = this.io.readU2le()
  this.initialSs = initialSsExpr
  let initialSpExpr = this.io.readU2le()
  this.initialSp = initialSpExpr
  let checksumExpr = this.io.readU2le()
  this.checksum = checksumExpr
  let initialIpExpr = this.io.readU2le()
  this.initialIp = initialIpExpr
  let initialCsExpr = this.io.readU2le()
  this.initialCs = initialCsExpr
  let ofsRelocationsExpr = this.io.readU2le()
  this.ofsRelocations = ofsRelocationsExpr
  let overlayIdExpr = this.io.readU2le()
  this.overlayId = overlayIdExpr

proc fromFile*(_: typedesc[DosMz_MzHeader], filename: string): DosMz_MzHeader =
  DosMz_MzHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DosMz_Relocation], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_Relocation =
  template this: untyped = result
  this = new(DosMz_Relocation)
  let root = if root == nil: cast[DosMz](this) else: cast[DosMz](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsExpr = this.io.readU2le()
  this.ofs = ofsExpr
  let segExpr = this.io.readU2le()
  this.seg = segExpr

proc fromFile*(_: typedesc[DosMz_Relocation], filename: string): DosMz_Relocation =
  DosMz_Relocation.read(newKaitaiFileStream(filename), nil, nil)

