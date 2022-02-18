import kaitai_struct_nim_runtime
import options

type
  HeroesOfMightAndMagicAgg* = ref object of KaitaiStruct
    `numFiles`*: uint16
    `entries`*: seq[HeroesOfMightAndMagicAgg_Entry]
    `parent`*: KaitaiStruct
    `rawFilenamesInst`*: seq[seq[byte]]
    `filenamesInst`*: seq[HeroesOfMightAndMagicAgg_Filename]
  HeroesOfMightAndMagicAgg_Entry* = ref object of KaitaiStruct
    `hash`*: uint16
    `offset`*: uint32
    `size`*: uint32
    `size2`*: uint32
    `parent`*: HeroesOfMightAndMagicAgg
    `bodyInst`*: seq[byte]
  HeroesOfMightAndMagicAgg_Filename* = ref object of KaitaiStruct
    `str`*: string
    `parent`*: HeroesOfMightAndMagicAgg

proc read*(_: typedesc[HeroesOfMightAndMagicAgg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeroesOfMightAndMagicAgg
proc read*(_: typedesc[HeroesOfMightAndMagicAgg_Entry], io: KaitaiStream, root: KaitaiStruct, parent: HeroesOfMightAndMagicAgg): HeroesOfMightAndMagicAgg_Entry
proc read*(_: typedesc[HeroesOfMightAndMagicAgg_Filename], io: KaitaiStream, root: KaitaiStruct, parent: HeroesOfMightAndMagicAgg): HeroesOfMightAndMagicAgg_Filename

proc filenames*(this: HeroesOfMightAndMagicAgg): seq[HeroesOfMightAndMagicAgg_Filename]
proc body*(this: HeroesOfMightAndMagicAgg_Entry): seq[byte]


##[
@see <a href="https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)">Source</a>
]##
proc read*(_: typedesc[HeroesOfMightAndMagicAgg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): HeroesOfMightAndMagicAgg =
  template this: untyped = result
  this = new(HeroesOfMightAndMagicAgg)
  let root = if root == nil: cast[HeroesOfMightAndMagicAgg](this) else: cast[HeroesOfMightAndMagicAgg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numFilesExpr = this.io.readU2le()
  this.numFiles = numFilesExpr
  for i in 0 ..< int(this.numFiles):
    let it = HeroesOfMightAndMagicAgg_Entry.read(this.io, this.root, this)
    this.entries.add(it)

proc filenames(this: HeroesOfMightAndMagicAgg): seq[HeroesOfMightAndMagicAgg_Filename] = 
  if this.filenamesInst.len != 0:
    return this.filenamesInst
  let pos = this.io.pos()
  this.io.seek(int((this.entries[^1].offset + this.entries[^1].size)))
  for i in 0 ..< int(this.numFiles):
    let buf = this.io.readBytes(int(15))
    this.rawFilenamesInst.add(buf)
    let rawFilenamesInstIo = newKaitaiStream(buf)
    let it = HeroesOfMightAndMagicAgg_Filename.read(rawFilenamesInstIo, this.root, this)
    this.filenamesInst.add(it)
  this.io.seek(pos)
  if this.filenamesInst.len != 0:
    return this.filenamesInst

proc fromFile*(_: typedesc[HeroesOfMightAndMagicAgg], filename: string): HeroesOfMightAndMagicAgg =
  HeroesOfMightAndMagicAgg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[HeroesOfMightAndMagicAgg_Entry], io: KaitaiStream, root: KaitaiStruct, parent: HeroesOfMightAndMagicAgg): HeroesOfMightAndMagicAgg_Entry =
  template this: untyped = result
  this = new(HeroesOfMightAndMagicAgg_Entry)
  let root = if root == nil: cast[HeroesOfMightAndMagicAgg](this) else: cast[HeroesOfMightAndMagicAgg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hashExpr = this.io.readU2le()
  this.hash = hashExpr
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let size2Expr = this.io.readU4le()
  this.size2 = size2Expr

proc body(this: HeroesOfMightAndMagicAgg_Entry): seq[byte] = 
  if this.bodyInst.len != 0:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.offset))
  let bodyInstExpr = this.io.readBytes(int(this.size))
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  if this.bodyInst.len != 0:
    return this.bodyInst

proc fromFile*(_: typedesc[HeroesOfMightAndMagicAgg_Entry], filename: string): HeroesOfMightAndMagicAgg_Entry =
  HeroesOfMightAndMagicAgg_Entry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[HeroesOfMightAndMagicAgg_Filename], io: KaitaiStream, root: KaitaiStruct, parent: HeroesOfMightAndMagicAgg): HeroesOfMightAndMagicAgg_Filename =
  template this: untyped = result
  this = new(HeroesOfMightAndMagicAgg_Filename)
  let root = if root == nil: cast[HeroesOfMightAndMagicAgg](this) else: cast[HeroesOfMightAndMagicAgg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let strExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.str = strExpr

proc fromFile*(_: typedesc[HeroesOfMightAndMagicAgg_Filename], filename: string): HeroesOfMightAndMagicAgg_Filename =
  HeroesOfMightAndMagicAgg_Filename.read(newKaitaiFileStream(filename), nil, nil)

