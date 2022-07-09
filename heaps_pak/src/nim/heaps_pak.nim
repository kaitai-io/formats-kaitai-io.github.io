import kaitai_struct_nim_runtime
import options

type
  HeapsPak* = ref object of KaitaiStruct
    `header`*: HeapsPak_Header
    `parent`*: KaitaiStruct
  HeapsPak_Header* = ref object of KaitaiStruct
    `magic1`*: seq[byte]
    `version`*: uint8
    `lenHeader`*: uint32
    `lenData`*: uint32
    `rootEntry`*: HeapsPak_Header_Entry
    `magic2`*: seq[byte]
    `parent`*: HeapsPak
    `rawRootEntry`*: seq[byte]
  HeapsPak_Header_Entry* = ref object of KaitaiStruct
    `lenName`*: uint8
    `name`*: string
    `flags`*: HeapsPak_Header_Entry_Flags
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
  HeapsPak_Header_Entry_Flags* = ref object of KaitaiStruct
    `unused`*: uint64
    `isDir`*: bool
    `parent`*: HeapsPak_Header_Entry
  HeapsPak_Header_File* = ref object of KaitaiStruct
    `ofsData`*: uint32
    `lenData`*: uint32
    `checksum`*: seq[byte]
    `parent`*: HeapsPak_Header_Entry
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
  HeapsPak_Header_Dir* = ref object of KaitaiStruct
    `numEntries`*: uint32
    `entries`*: seq[HeapsPak_Header_Entry]
    `parent`*: HeapsPak_Header_Entry

proc read*(_: typedesc[HeapsPak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeapsPak
proc read*(_: typedesc[HeapsPak_Header], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak): HeapsPak_Header
proc read*(_: typedesc[HeapsPak_Header_Entry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeapsPak_Header_Entry
proc read*(_: typedesc[HeapsPak_Header_Entry_Flags], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak_Header_Entry): HeapsPak_Header_Entry_Flags
proc read*(_: typedesc[HeapsPak_Header_File], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak_Header_Entry): HeapsPak_Header_File
proc read*(_: typedesc[HeapsPak_Header_Dir], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak_Header_Entry): HeapsPak_Header_Dir

proc data*(this: HeapsPak_Header_File): seq[byte]


##[
@see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx">Source</a>
]##
proc read*(_: typedesc[HeapsPak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeapsPak =
  template this: untyped = result
  this = new(HeapsPak)
  let root = if root == nil: cast[HeapsPak](this) else: cast[HeapsPak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = HeapsPak_Header.read(this.io, this.root, this)
  this.header = headerExpr

proc fromFile*(_: typedesc[HeapsPak], filename: string): HeapsPak =
  HeapsPak.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[HeapsPak_Header], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak): HeapsPak_Header =
  template this: untyped = result
  this = new(HeapsPak_Header)
  let root = if root == nil: cast[HeapsPak](this) else: cast[HeapsPak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magic1Expr = this.io.readBytes(int(3))
  this.magic1 = magic1Expr
  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let lenHeaderExpr = this.io.readU4le()
  this.lenHeader = lenHeaderExpr
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let rawRootEntryExpr = this.io.readBytes(int((this.lenHeader - 16)))
  this.rawRootEntry = rawRootEntryExpr
  let rawRootEntryIo = newKaitaiStream(rawRootEntryExpr)
  let rootEntryExpr = HeapsPak_Header_Entry.read(rawRootEntryIo, this.root, this)
  this.rootEntry = rootEntryExpr
  let magic2Expr = this.io.readBytes(int(4))
  this.magic2 = magic2Expr

proc fromFile*(_: typedesc[HeapsPak_Header], filename: string): HeapsPak_Header =
  HeapsPak_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx">Source</a>
]##
proc read*(_: typedesc[HeapsPak_Header_Entry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeapsPak_Header_Entry =
  template this: untyped = result
  this = new(HeapsPak_Header_Entry)
  let root = if root == nil: cast[HeapsPak](this) else: cast[HeapsPak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenNameExpr = this.io.readU1()
  this.lenName = lenNameExpr
  let nameExpr = encode(this.io.readBytes(int(this.lenName)), "UTF-8")
  this.name = nameExpr
  let flagsExpr = HeapsPak_Header_Entry_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  block:
    let on = this.flags.isDir
    if on == true:
      let bodyExpr = HeapsPak_Header_Dir.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == false:
      let bodyExpr = HeapsPak_Header_File.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[HeapsPak_Header_Entry], filename: string): HeapsPak_Header_Entry =
  HeapsPak_Header_Entry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[HeapsPak_Header_Entry_Flags], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak_Header_Entry): HeapsPak_Header_Entry_Flags =
  template this: untyped = result
  this = new(HeapsPak_Header_Entry_Flags)
  let root = if root == nil: cast[HeapsPak](this) else: cast[HeapsPak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unusedExpr = this.io.readBitsIntBe(7)
  this.unused = unusedExpr
  let isDirExpr = this.io.readBitsIntBe(1) != 0
  this.isDir = isDirExpr

proc fromFile*(_: typedesc[HeapsPak_Header_Entry_Flags], filename: string): HeapsPak_Header_Entry_Flags =
  HeapsPak_Header_Entry_Flags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[HeapsPak_Header_File], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak_Header_Entry): HeapsPak_Header_File =
  template this: untyped = result
  this = new(HeapsPak_Header_File)
  let root = if root == nil: cast[HeapsPak](this) else: cast[HeapsPak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsDataExpr = this.io.readU4le()
  this.ofsData = ofsDataExpr
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let checksumExpr = this.io.readBytes(int(4))
  this.checksum = checksumExpr

proc data(this: HeapsPak_Header_File): seq[byte] = 
  if this.dataInstFlag:
    return this.dataInst
  let io = HeapsPak(this.root).io
  let pos = io.pos()
  io.seek(int((HeapsPak(this.root).header.lenHeader + this.ofsData)))
  let dataInstExpr = io.readBytes(int(this.lenData))
  this.dataInst = dataInstExpr
  io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[HeapsPak_Header_File], filename: string): HeapsPak_Header_File =
  HeapsPak_Header_File.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[HeapsPak_Header_Dir], io: KaitaiStream, root: KaitaiStruct, parent: HeapsPak_Header_Entry): HeapsPak_Header_Dir =
  template this: untyped = result
  this = new(HeapsPak_Header_Dir)
  let root = if root == nil: cast[HeapsPak](this) else: cast[HeapsPak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numEntriesExpr = this.io.readU4le()
  this.numEntries = numEntriesExpr
  for i in 0 ..< int(this.numEntries):
    let it = HeapsPak_Header_Entry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[HeapsPak_Header_Dir], filename: string): HeapsPak_Header_Dir =
  HeapsPak_Header_Dir.read(newKaitaiFileStream(filename), nil, nil)

