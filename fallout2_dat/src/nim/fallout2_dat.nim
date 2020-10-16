import kaitai_struct_nim_runtime
import options

type
  Fallout2Dat* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `footerInst`*: Fallout2Dat_Footer
    `indexInst`*: Fallout2Dat_Index
  Fallout2Dat_Compression* = enum
    none = 0
    zlib = 1
  Fallout2Dat_Pstr* = ref object of KaitaiStruct
    `size`*: uint32
    `str`*: string
    `parent`*: Fallout2Dat_File
  Fallout2Dat_Footer* = ref object of KaitaiStruct
    `indexSize`*: uint32
    `fileSize`*: uint32
    `parent`*: Fallout2Dat
  Fallout2Dat_Index* = ref object of KaitaiStruct
    `fileCount`*: uint32
    `files`*: seq[Fallout2Dat_File]
    `parent`*: Fallout2Dat
  Fallout2Dat_File* = ref object of KaitaiStruct
    `name`*: Fallout2Dat_Pstr
    `flags`*: Fallout2Dat_Compression
    `sizeUnpacked`*: uint32
    `sizePacked`*: uint32
    `offset`*: uint32
    `parent`*: Fallout2Dat_Index
    `rawContentsZlibInst`*: seq[byte]
    `contentsRawInst`*: seq[byte]
    `contentsZlibInst`*: seq[byte]
    `contentsInst`*: seq[byte]

proc read*(_: typedesc[Fallout2Dat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Fallout2Dat
proc read*(_: typedesc[Fallout2Dat_Pstr], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat_File): Fallout2Dat_Pstr
proc read*(_: typedesc[Fallout2Dat_Footer], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat): Fallout2Dat_Footer
proc read*(_: typedesc[Fallout2Dat_Index], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat): Fallout2Dat_Index
proc read*(_: typedesc[Fallout2Dat_File], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat_Index): Fallout2Dat_File

proc footer*(this: Fallout2Dat): Fallout2Dat_Footer
proc index*(this: Fallout2Dat): Fallout2Dat_Index
proc contentsRaw*(this: Fallout2Dat_File): seq[byte]
proc contentsZlib*(this: Fallout2Dat_File): seq[byte]
proc contents*(this: Fallout2Dat_File): seq[byte]

proc read*(_: typedesc[Fallout2Dat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Fallout2Dat =
  template this: untyped = result
  this = new(Fallout2Dat)
  let root = if root == nil: cast[Fallout2Dat](this) else: cast[Fallout2Dat](root)
  this.io = io
  this.root = root
  this.parent = parent


proc footer(this: Fallout2Dat): Fallout2Dat_Footer = 
  if this.footerInst != nil:
    return this.footerInst
  let pos = this.io.pos()
  this.io.seek(int((this.io.size - 8)))
  let footerInstExpr = Fallout2Dat_Footer.read(this.io, this.root, this)
  this.footerInst = footerInstExpr
  this.io.seek(pos)
  if this.footerInst != nil:
    return this.footerInst

proc index(this: Fallout2Dat): Fallout2Dat_Index = 
  if this.indexInst != nil:
    return this.indexInst
  let pos = this.io.pos()
  this.io.seek(int(((this.io.size - 8) - this.footer.indexSize)))
  let indexInstExpr = Fallout2Dat_Index.read(this.io, this.root, this)
  this.indexInst = indexInstExpr
  this.io.seek(pos)
  if this.indexInst != nil:
    return this.indexInst

proc fromFile*(_: typedesc[Fallout2Dat], filename: string): Fallout2Dat =
  Fallout2Dat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Fallout2Dat_Pstr], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat_File): Fallout2Dat_Pstr =
  template this: untyped = result
  this = new(Fallout2Dat_Pstr)
  let root = if root == nil: cast[Fallout2Dat](this) else: cast[Fallout2Dat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let strExpr = encode(this.io.readBytes(int(this.size)), "ASCII")
  this.str = strExpr

proc fromFile*(_: typedesc[Fallout2Dat_Pstr], filename: string): Fallout2Dat_Pstr =
  Fallout2Dat_Pstr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Fallout2Dat_Footer], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat): Fallout2Dat_Footer =
  template this: untyped = result
  this = new(Fallout2Dat_Footer)
  let root = if root == nil: cast[Fallout2Dat](this) else: cast[Fallout2Dat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let indexSizeExpr = this.io.readU4le()
  this.indexSize = indexSizeExpr
  let fileSizeExpr = this.io.readU4le()
  this.fileSize = fileSizeExpr

proc fromFile*(_: typedesc[Fallout2Dat_Footer], filename: string): Fallout2Dat_Footer =
  Fallout2Dat_Footer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Fallout2Dat_Index], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat): Fallout2Dat_Index =
  template this: untyped = result
  this = new(Fallout2Dat_Index)
  let root = if root == nil: cast[Fallout2Dat](this) else: cast[Fallout2Dat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileCountExpr = this.io.readU4le()
  this.fileCount = fileCountExpr
  for i in 0 ..< int(this.fileCount):
    let it = Fallout2Dat_File.read(this.io, this.root, this)
    this.files.add(it)

proc fromFile*(_: typedesc[Fallout2Dat_Index], filename: string): Fallout2Dat_Index =
  Fallout2Dat_Index.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Fallout2Dat_File], io: KaitaiStream, root: KaitaiStruct, parent: Fallout2Dat_Index): Fallout2Dat_File =
  template this: untyped = result
  this = new(Fallout2Dat_File)
  let root = if root == nil: cast[Fallout2Dat](this) else: cast[Fallout2Dat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = Fallout2Dat_Pstr.read(this.io, this.root, this)
  this.name = nameExpr
  let flagsExpr = Fallout2Dat_Compression(this.io.readU1())
  this.flags = flagsExpr
  let sizeUnpackedExpr = this.io.readU4le()
  this.sizeUnpacked = sizeUnpackedExpr
  let sizePackedExpr = this.io.readU4le()
  this.sizePacked = sizePackedExpr
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr

proc contentsRaw(this: Fallout2Dat_File): seq[byte] = 
  if this.contentsRawInst.len != 0:
    return this.contentsRawInst
  if this.flags == fallout2_dat.none:
    let io = Fallout2Dat(this.root).io
    let pos = io.pos()
    io.seek(int(this.offset))
    let contentsRawInstExpr = io.readBytes(int(this.sizeUnpacked))
    this.contentsRawInst = contentsRawInstExpr
    io.seek(pos)
  if this.contentsRawInst.len != 0:
    return this.contentsRawInst

proc contentsZlib(this: Fallout2Dat_File): seq[byte] = 
  if this.contentsZlibInst.len != 0:
    return this.contentsZlibInst
  if this.flags == fallout2_dat.zlib:
    let io = Fallout2Dat(this.root).io
    let pos = io.pos()
    io.seek(int(this.offset))
    let rawContentsZlibInstExpr = io.readBytes(int(this.sizePacked))
    this.rawContentsZlibInst = rawContentsZlibInstExpr
    let contentsZlibInstExpr = this.rawContentsZlibInst.processZlib()
    this.contentsZlibInst = contentsZlibInstExpr
    io.seek(pos)
  if this.contentsZlibInst.len != 0:
    return this.contentsZlibInst

proc contents(this: Fallout2Dat_File): seq[byte] = 
  if this.contentsInst.len != 0:
    return this.contentsInst
  if  ((this.flags == fallout2_dat.zlib) or (this.flags == fallout2_dat.none)) :
    let contentsInstExpr = seq[byte]((if this.flags == fallout2_dat.zlib: this.contentsZlib else: this.contentsRaw))
    this.contentsInst = contentsInstExpr
  if this.contentsInst.len != 0:
    return this.contentsInst

proc fromFile*(_: typedesc[Fallout2Dat_File], filename: string): Fallout2Dat_File =
  Fallout2Dat_File.read(newKaitaiFileStream(filename), nil, nil)

