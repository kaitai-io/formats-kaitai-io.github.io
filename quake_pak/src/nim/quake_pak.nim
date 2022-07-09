import kaitai_struct_nim_runtime
import options

type
  QuakePak* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ofsIndex`*: uint32
    `lenIndex`*: uint32
    `parent`*: KaitaiStruct
    `rawIndexInst`*: seq[byte]
    `indexInst`: QuakePak_IndexStruct
    `indexInstFlag`: bool
  QuakePak_IndexStruct* = ref object of KaitaiStruct
    `entries`*: seq[QuakePak_IndexEntry]
    `parent`*: QuakePak
  QuakePak_IndexEntry* = ref object of KaitaiStruct
    `name`*: string
    `ofs`*: uint32
    `size`*: uint32
    `parent`*: QuakePak_IndexStruct
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool

proc read*(_: typedesc[QuakePak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuakePak
proc read*(_: typedesc[QuakePak_IndexStruct], io: KaitaiStream, root: KaitaiStruct, parent: QuakePak): QuakePak_IndexStruct
proc read*(_: typedesc[QuakePak_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: QuakePak_IndexStruct): QuakePak_IndexEntry

proc index*(this: QuakePak): QuakePak_IndexStruct
proc body*(this: QuakePak_IndexEntry): seq[byte]


##[
@see <a href="https://quakewiki.org/wiki/.pak#Format_specification">Source</a>
]##
proc read*(_: typedesc[QuakePak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuakePak =
  template this: untyped = result
  this = new(QuakePak)
  let root = if root == nil: cast[QuakePak](this) else: cast[QuakePak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let ofsIndexExpr = this.io.readU4le()
  this.ofsIndex = ofsIndexExpr
  let lenIndexExpr = this.io.readU4le()
  this.lenIndex = lenIndexExpr

proc index(this: QuakePak): QuakePak_IndexStruct = 
  if this.indexInstFlag:
    return this.indexInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsIndex))
  let rawIndexInstExpr = this.io.readBytes(int(this.lenIndex))
  this.rawIndexInst = rawIndexInstExpr
  let rawIndexInstIo = newKaitaiStream(rawIndexInstExpr)
  let indexInstExpr = QuakePak_IndexStruct.read(rawIndexInstIo, this.root, this)
  this.indexInst = indexInstExpr
  this.io.seek(pos)
  this.indexInstFlag = true
  return this.indexInst

proc fromFile*(_: typedesc[QuakePak], filename: string): QuakePak =
  QuakePak.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuakePak_IndexStruct], io: KaitaiStream, root: KaitaiStruct, parent: QuakePak): QuakePak_IndexStruct =
  template this: untyped = result
  this = new(QuakePak_IndexStruct)
  let root = if root == nil: cast[QuakePak](this) else: cast[QuakePak](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = QuakePak_IndexEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[QuakePak_IndexStruct], filename: string): QuakePak_IndexStruct =
  QuakePak_IndexStruct.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuakePak_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: QuakePak_IndexStruct): QuakePak_IndexEntry =
  template this: untyped = result
  this = new(QuakePak_IndexEntry)
  let root = if root == nil: cast[QuakePak](this) else: cast[QuakePak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(56)).bytesStripRight(0).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr
  let ofsExpr = this.io.readU4le()
  this.ofs = ofsExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

proc body(this: QuakePak_IndexEntry): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  let io = QuakePak(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofs))
  let bodyInstExpr = io.readBytes(int(this.size))
  this.bodyInst = bodyInstExpr
  io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[QuakePak_IndexEntry], filename: string): QuakePak_IndexEntry =
  QuakePak_IndexEntry.read(newKaitaiFileStream(filename), nil, nil)

