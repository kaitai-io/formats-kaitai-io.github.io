import kaitai_struct_nim_runtime
import options

type
  DosMz* = ref object of KaitaiStruct
    `header`*: DosMz_ExeHeader
    `body`*: seq[byte]
    `parent`*: KaitaiStruct
    `relocationsInst`: seq[DosMz_Relocation]
    `relocationsInstFlag`: bool
  DosMz_ExeHeader* = ref object of KaitaiStruct
    `mz`*: DosMz_MzHeader
    `restOfHeader`*: seq[byte]
    `parent`*: DosMz
    `lenBodyInst`: int
    `lenBodyInstFlag`: bool
  DosMz_MzHeader* = ref object of KaitaiStruct
    `magic`*: string
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
    `parent`*: DosMz_ExeHeader
    `lenHeaderInst`: int
    `lenHeaderInstFlag`: bool
  DosMz_Relocation* = ref object of KaitaiStruct
    `ofs`*: uint16
    `seg`*: uint16
    `parent`*: DosMz

proc read*(_: typedesc[DosMz], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DosMz
proc read*(_: typedesc[DosMz_ExeHeader], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_ExeHeader
proc read*(_: typedesc[DosMz_MzHeader], io: KaitaiStream, root: KaitaiStruct, parent: DosMz_ExeHeader): DosMz_MzHeader
proc read*(_: typedesc[DosMz_Relocation], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_Relocation

proc relocations*(this: DosMz): seq[DosMz_Relocation]
proc lenBody*(this: DosMz_ExeHeader): int
proc lenHeader*(this: DosMz_MzHeader): int


##[
DOS MZ file format is a traditional format for executables in MS-DOS
environment. Many modern formats (i.e. Windows PE) still maintain
compatibility stub with this format.

As opposed to .com file format (which basically sports one 64K code
segment of raw CPU instructions), DOS MZ .exe file format allowed
more flexible memory management, loading of larger programs and
added support for relocations.

@see <a href="http://www.delorie.com/djgpp/doc/exe/">Source</a>
]##
proc read*(_: typedesc[DosMz], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DosMz =
  template this: untyped = result
  this = new(DosMz)
  let root = if root == nil: cast[DosMz](this) else: cast[DosMz](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = DosMz_ExeHeader.read(this.io, this.root, this)
  this.header = headerExpr
  let bodyExpr = this.io.readBytes(int(this.header.lenBody))
  this.body = bodyExpr

proc relocations(this: DosMz): seq[DosMz_Relocation] = 
  if this.relocationsInstFlag:
    return this.relocationsInst
  if this.header.mz.ofsRelocations != 0:
    let io = this.header.io
    let pos = io.pos()
    io.seek(int(this.header.mz.ofsRelocations))
    for i in 0 ..< int(this.header.mz.numRelocations):
      let it = DosMz_Relocation.read(io, this.root, this)
      this.relocationsInst.add(it)
    io.seek(pos)
  this.relocationsInstFlag = true
  return this.relocationsInst

proc fromFile*(_: typedesc[DosMz], filename: string): DosMz =
  DosMz.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DosMz_ExeHeader], io: KaitaiStream, root: KaitaiStruct, parent: DosMz): DosMz_ExeHeader =
  template this: untyped = result
  this = new(DosMz_ExeHeader)
  let root = if root == nil: cast[DosMz](this) else: cast[DosMz](root)
  this.io = io
  this.root = root
  this.parent = parent

  let mzExpr = DosMz_MzHeader.read(this.io, this.root, this)
  this.mz = mzExpr
  let restOfHeaderExpr = this.io.readBytes(int(this.mz.lenHeader - 28))
  this.restOfHeader = restOfHeaderExpr

proc lenBody(this: DosMz_ExeHeader): int = 
  if this.lenBodyInstFlag:
    return this.lenBodyInst
  let lenBodyInstExpr = int((if this.mz.lastPageExtraBytes == 0: this.mz.numPages * 512 else: (this.mz.numPages - 1) * 512 + this.mz.lastPageExtraBytes) - this.mz.lenHeader)
  this.lenBodyInst = lenBodyInstExpr
  this.lenBodyInstFlag = true
  return this.lenBodyInst

proc fromFile*(_: typedesc[DosMz_ExeHeader], filename: string): DosMz_ExeHeader =
  DosMz_ExeHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DosMz_MzHeader], io: KaitaiStream, root: KaitaiStruct, parent: DosMz_ExeHeader): DosMz_MzHeader =
  template this: untyped = result
  this = new(DosMz_MzHeader)
  let root = if root == nil: cast[DosMz](this) else: cast[DosMz](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = encode(this.io.readBytes(int(2)), "ASCII")
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

proc lenHeader(this: DosMz_MzHeader): int = 
  if this.lenHeaderInstFlag:
    return this.lenHeaderInst
  let lenHeaderInstExpr = int(this.headerSize * 16)
  this.lenHeaderInst = lenHeaderInstExpr
  this.lenHeaderInstFlag = true
  return this.lenHeaderInst

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

