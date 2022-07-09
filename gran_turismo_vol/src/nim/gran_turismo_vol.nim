import kaitai_struct_nim_runtime
import options

type
  GranTurismoVol* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `numFiles`*: uint16
    `numEntries`*: uint16
    `reserved`*: seq[byte]
    `offsets`*: seq[uint32]
    `parent`*: KaitaiStruct
    `ofsDirInst`: uint32
    `ofsDirInstFlag`: bool
    `filesInst`: seq[GranTurismoVol_FileInfo]
    `filesInstFlag`: bool
  GranTurismoVol_FileInfo* = ref object of KaitaiStruct
    `timestamp`*: uint32
    `offsetIdx`*: uint16
    `flags`*: uint8
    `name`*: string
    `parent`*: GranTurismoVol
    `sizeInst`: int
    `sizeInstFlag`: bool
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
    `isDirInst`: bool
    `isDirInstFlag`: bool
    `isLastEntryInst`: bool
    `isLastEntryInstFlag`: bool

proc read*(_: typedesc[GranTurismoVol], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GranTurismoVol
proc read*(_: typedesc[GranTurismoVol_FileInfo], io: KaitaiStream, root: KaitaiStruct, parent: GranTurismoVol): GranTurismoVol_FileInfo

proc ofsDir*(this: GranTurismoVol): uint32
proc files*(this: GranTurismoVol): seq[GranTurismoVol_FileInfo]
proc size*(this: GranTurismoVol_FileInfo): int
proc body*(this: GranTurismoVol_FileInfo): seq[byte]
proc isDir*(this: GranTurismoVol_FileInfo): bool
proc isLastEntry*(this: GranTurismoVol_FileInfo): bool

proc read*(_: typedesc[GranTurismoVol], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GranTurismoVol =
  template this: untyped = result
  this = new(GranTurismoVol)
  let root = if root == nil: cast[GranTurismoVol](this) else: cast[GranTurismoVol](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr
  let numFilesExpr = this.io.readU2le()
  this.numFiles = numFilesExpr
  let numEntriesExpr = this.io.readU2le()
  this.numEntries = numEntriesExpr
  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  for i in 0 ..< int(this.numFiles):
    let it = this.io.readU4le()
    this.offsets.add(it)

proc ofsDir(this: GranTurismoVol): uint32 = 
  if this.ofsDirInstFlag:
    return this.ofsDirInst
  let ofsDirInstExpr = uint32(this.offsets[1])
  this.ofsDirInst = ofsDirInstExpr
  this.ofsDirInstFlag = true
  return this.ofsDirInst

proc files(this: GranTurismoVol): seq[GranTurismoVol_FileInfo] = 
  if this.filesInstFlag:
    return this.filesInst
  let pos = this.io.pos()
  this.io.seek(int((this.ofsDir and 4294965248'i64)))
  for i in 0 ..< int(GranTurismoVol(this.root).numEntries):
    let it = GranTurismoVol_FileInfo.read(this.io, this.root, this)
    this.filesInst.add(it)
  this.io.seek(pos)
  this.filesInstFlag = true
  return this.filesInst

proc fromFile*(_: typedesc[GranTurismoVol], filename: string): GranTurismoVol =
  GranTurismoVol.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GranTurismoVol_FileInfo], io: KaitaiStream, root: KaitaiStruct, parent: GranTurismoVol): GranTurismoVol_FileInfo =
  template this: untyped = result
  this = new(GranTurismoVol_FileInfo)
  let root = if root == nil: cast[GranTurismoVol](this) else: cast[GranTurismoVol](root)
  this.io = io
  this.root = root
  this.parent = parent

  let timestampExpr = this.io.readU4le()
  this.timestamp = timestampExpr
  let offsetIdxExpr = this.io.readU2le()
  this.offsetIdx = offsetIdxExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let nameExpr = encode(this.io.readBytes(int(25)).bytesStripRight(0).bytesTerminate(0, false), "ASCII")
  this.name = nameExpr

proc size(this: GranTurismoVol_FileInfo): int = 
  if this.sizeInstFlag:
    return this.sizeInst
  let sizeInstExpr = int(((GranTurismoVol(this.root).offsets[(this.offsetIdx + 1)] and 4294965248'i64) - GranTurismoVol(this.root).offsets[this.offsetIdx]))
  this.sizeInst = sizeInstExpr
  this.sizeInstFlag = true
  return this.sizeInst

proc body(this: GranTurismoVol_FileInfo): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  if not(this.isDir):
    let pos = this.io.pos()
    this.io.seek(int((GranTurismoVol(this.root).offsets[this.offsetIdx] and 4294965248'i64)))
    let bodyInstExpr = this.io.readBytes(int(this.size))
    this.bodyInst = bodyInstExpr
    this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc isDir(this: GranTurismoVol_FileInfo): bool = 
  if this.isDirInstFlag:
    return this.isDirInst
  let isDirInstExpr = bool((this.flags and 1) != 0)
  this.isDirInst = isDirInstExpr
  this.isDirInstFlag = true
  return this.isDirInst

proc isLastEntry(this: GranTurismoVol_FileInfo): bool = 
  if this.isLastEntryInstFlag:
    return this.isLastEntryInst
  let isLastEntryInstExpr = bool((this.flags and 128) != 0)
  this.isLastEntryInst = isLastEntryInstExpr
  this.isLastEntryInstFlag = true
  return this.isLastEntryInst

proc fromFile*(_: typedesc[GranTurismoVol_FileInfo], filename: string): GranTurismoVol_FileInfo =
  GranTurismoVol_FileInfo.read(newKaitaiFileStream(filename), nil, nil)

