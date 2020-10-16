import kaitai_struct_nim_runtime
import options

type
  FtlDat* = ref object of KaitaiStruct
    `numFiles`*: uint32
    `files`*: seq[FtlDat_File]
    `parent`*: KaitaiStruct
  FtlDat_File* = ref object of KaitaiStruct
    `ofsMeta`*: uint32
    `parent`*: FtlDat
    `metaInst`*: FtlDat_Meta
  FtlDat_Meta* = ref object of KaitaiStruct
    `lenFile`*: uint32
    `lenFilename`*: uint32
    `filename`*: string
    `body`*: seq[byte]
    `parent`*: FtlDat_File

proc read*(_: typedesc[FtlDat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FtlDat
proc read*(_: typedesc[FtlDat_File], io: KaitaiStream, root: KaitaiStruct, parent: FtlDat): FtlDat_File
proc read*(_: typedesc[FtlDat_Meta], io: KaitaiStream, root: KaitaiStruct, parent: FtlDat_File): FtlDat_Meta

proc meta*(this: FtlDat_File): FtlDat_Meta

proc read*(_: typedesc[FtlDat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FtlDat =
  template this: untyped = result
  this = new(FtlDat)
  let root = if root == nil: cast[FtlDat](this) else: cast[FtlDat](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of files in the archive
  ]##
  let numFilesExpr = this.io.readU4le()
  this.numFiles = numFilesExpr
  for i in 0 ..< int(this.numFiles):
    let it = FtlDat_File.read(this.io, this.root, this)
    this.files.add(it)

proc fromFile*(_: typedesc[FtlDat], filename: string): FtlDat =
  FtlDat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FtlDat_File], io: KaitaiStream, root: KaitaiStruct, parent: FtlDat): FtlDat_File =
  template this: untyped = result
  this = new(FtlDat_File)
  let root = if root == nil: cast[FtlDat](this) else: cast[FtlDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsMetaExpr = this.io.readU4le()
  this.ofsMeta = ofsMetaExpr

proc meta(this: FtlDat_File): FtlDat_Meta = 
  if this.metaInst != nil:
    return this.metaInst
  if this.ofsMeta != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.ofsMeta))
    let metaInstExpr = FtlDat_Meta.read(this.io, this.root, this)
    this.metaInst = metaInstExpr
    this.io.seek(pos)
  if this.metaInst != nil:
    return this.metaInst

proc fromFile*(_: typedesc[FtlDat_File], filename: string): FtlDat_File =
  FtlDat_File.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FtlDat_Meta], io: KaitaiStream, root: KaitaiStruct, parent: FtlDat_File): FtlDat_Meta =
  template this: untyped = result
  this = new(FtlDat_Meta)
  let root = if root == nil: cast[FtlDat](this) else: cast[FtlDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenFileExpr = this.io.readU4le()
  this.lenFile = lenFileExpr
  let lenFilenameExpr = this.io.readU4le()
  this.lenFilename = lenFilenameExpr
  let filenameExpr = encode(this.io.readBytes(int(this.lenFilename)), "UTF-8")
  this.filename = filenameExpr
  let bodyExpr = this.io.readBytes(int(this.lenFile))
  this.body = bodyExpr

proc fromFile*(_: typedesc[FtlDat_Meta], filename: string): FtlDat_Meta =
  FtlDat_Meta.read(newKaitaiFileStream(filename), nil, nil)

