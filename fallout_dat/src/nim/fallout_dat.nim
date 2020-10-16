import kaitai_struct_nim_runtime
import options

type
  FalloutDat* = ref object of KaitaiStruct
    `folderCount`*: uint32
    `unknown1`*: uint32
    `unknown2`*: uint32
    `timestamp`*: uint32
    `folderNames`*: seq[FalloutDat_Pstr]
    `folders`*: seq[FalloutDat_Folder]
    `parent`*: KaitaiStruct
  FalloutDat_Compression* = enum
    none = 32
    lzss = 64
  FalloutDat_Pstr* = ref object of KaitaiStruct
    `size`*: uint8
    `str`*: string
    `parent`*: KaitaiStruct
  FalloutDat_Folder* = ref object of KaitaiStruct
    `fileCount`*: uint32
    `unknown`*: uint32
    `flags`*: uint32
    `timestamp`*: uint32
    `files`*: seq[FalloutDat_File]
    `parent`*: FalloutDat
  FalloutDat_File* = ref object of KaitaiStruct
    `name`*: FalloutDat_Pstr
    `flags`*: FalloutDat_Compression
    `offset`*: uint32
    `sizeUnpacked`*: uint32
    `sizePacked`*: uint32
    `parent`*: FalloutDat_Folder
    `contentsInst`*: seq[byte]

proc read*(_: typedesc[FalloutDat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FalloutDat
proc read*(_: typedesc[FalloutDat_Pstr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FalloutDat_Pstr
proc read*(_: typedesc[FalloutDat_Folder], io: KaitaiStream, root: KaitaiStruct, parent: FalloutDat): FalloutDat_Folder
proc read*(_: typedesc[FalloutDat_File], io: KaitaiStream, root: KaitaiStruct, parent: FalloutDat_Folder): FalloutDat_File

proc contents*(this: FalloutDat_File): seq[byte]

proc read*(_: typedesc[FalloutDat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FalloutDat =
  template this: untyped = result
  this = new(FalloutDat)
  let root = if root == nil: cast[FalloutDat](this) else: cast[FalloutDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let folderCountExpr = this.io.readU4be()
  this.folderCount = folderCountExpr
  let unknown1Expr = this.io.readU4be()
  this.unknown1 = unknown1Expr
  let unknown2Expr = this.io.readU4be()
  this.unknown2 = unknown2Expr
  let timestampExpr = this.io.readU4be()
  this.timestamp = timestampExpr
  for i in 0 ..< int(this.folderCount):
    let it = FalloutDat_Pstr.read(this.io, this.root, this)
    this.folderNames.add(it)
  for i in 0 ..< int(this.folderCount):
    let it = FalloutDat_Folder.read(this.io, this.root, this)
    this.folders.add(it)

proc fromFile*(_: typedesc[FalloutDat], filename: string): FalloutDat =
  FalloutDat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FalloutDat_Pstr], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FalloutDat_Pstr =
  template this: untyped = result
  this = new(FalloutDat_Pstr)
  let root = if root == nil: cast[FalloutDat](this) else: cast[FalloutDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU1()
  this.size = sizeExpr
  let strExpr = encode(this.io.readBytes(int(this.size)), "ASCII")
  this.str = strExpr

proc fromFile*(_: typedesc[FalloutDat_Pstr], filename: string): FalloutDat_Pstr =
  FalloutDat_Pstr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FalloutDat_Folder], io: KaitaiStream, root: KaitaiStruct, parent: FalloutDat): FalloutDat_Folder =
  template this: untyped = result
  this = new(FalloutDat_Folder)
  let root = if root == nil: cast[FalloutDat](this) else: cast[FalloutDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileCountExpr = this.io.readU4be()
  this.fileCount = fileCountExpr
  let unknownExpr = this.io.readU4be()
  this.unknown = unknownExpr
  let flagsExpr = this.io.readU4be()
  this.flags = flagsExpr
  let timestampExpr = this.io.readU4be()
  this.timestamp = timestampExpr
  for i in 0 ..< int(this.fileCount):
    let it = FalloutDat_File.read(this.io, this.root, this)
    this.files.add(it)

proc fromFile*(_: typedesc[FalloutDat_Folder], filename: string): FalloutDat_Folder =
  FalloutDat_Folder.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FalloutDat_File], io: KaitaiStream, root: KaitaiStruct, parent: FalloutDat_Folder): FalloutDat_File =
  template this: untyped = result
  this = new(FalloutDat_File)
  let root = if root == nil: cast[FalloutDat](this) else: cast[FalloutDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = FalloutDat_Pstr.read(this.io, this.root, this)
  this.name = nameExpr
  let flagsExpr = FalloutDat_Compression(this.io.readU4be())
  this.flags = flagsExpr
  let offsetExpr = this.io.readU4be()
  this.offset = offsetExpr
  let sizeUnpackedExpr = this.io.readU4be()
  this.sizeUnpacked = sizeUnpackedExpr
  let sizePackedExpr = this.io.readU4be()
  this.sizePacked = sizePackedExpr

proc contents(this: FalloutDat_File): seq[byte] = 
  if this.contentsInst.len != 0:
    return this.contentsInst
  let io = FalloutDat(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  let contentsInstExpr = io.readBytes(int((if this.flags == fallout_dat.none: this.sizeUnpacked else: this.sizePacked)))
  this.contentsInst = contentsInstExpr
  io.seek(pos)
  if this.contentsInst.len != 0:
    return this.contentsInst

proc fromFile*(_: typedesc[FalloutDat_File], filename: string): FalloutDat_File =
  FalloutDat_File.read(newKaitaiFileStream(filename), nil, nil)

