import kaitai_struct_nim_runtime
import options

type
  NtMdtPal* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `count`*: uint32
    `meta`*: seq[NtMdtPal_Meta]
    `something2`*: seq[byte]
    `tables`*: seq[NtMdtPal_ColTable]
    `parent`*: KaitaiStruct
  NtMdtPal_Meta* = ref object of KaitaiStruct
    `unkn00`*: seq[byte]
    `unkn01`*: seq[byte]
    `unkn02`*: seq[byte]
    `unkn03`*: seq[byte]
    `colorsCount`*: uint16
    `unkn10`*: seq[byte]
    `unkn11`*: seq[byte]
    `unkn12`*: seq[byte]
    `nameSize`*: uint16
    `parent`*: NtMdtPal
  NtMdtPal_Color* = ref object of KaitaiStruct
    `red`*: uint8
    `unkn`*: uint8
    `blue`*: uint8
    `green`*: uint8
    `parent`*: NtMdtPal_ColTable
  NtMdtPal_ColTable* = ref object of KaitaiStruct
    `size1`*: uint8
    `unkn`*: uint8
    `title`*: string
    `unkn1`*: uint16
    `colors`*: seq[NtMdtPal_Color]
    `index`*: uint16
    `parent`*: NtMdtPal

proc read*(_: typedesc[NtMdtPal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdtPal
proc read*(_: typedesc[NtMdtPal_Meta], io: KaitaiStream, root: KaitaiStruct, parent: NtMdtPal): NtMdtPal_Meta
proc read*(_: typedesc[NtMdtPal_Color], io: KaitaiStream, root: KaitaiStruct, parent: NtMdtPal_ColTable): NtMdtPal_Color
proc read*(_: typedesc[NtMdtPal_ColTable], io: KaitaiStream, root: KaitaiStruct, parent: NtMdtPal, index: any): NtMdtPal_ColTable



##[
It is a color scheme for visualising SPM scans.
]##
proc read*(_: typedesc[NtMdtPal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): NtMdtPal =
  template this: untyped = result
  this = new(NtMdtPal)
  let root = if root == nil: cast[NtMdtPal](this) else: cast[NtMdtPal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(26))
  this.signature = signatureExpr
  let countExpr = this.io.readU4be()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = NtMdtPal_Meta.read(this.io, this.root, this)
    this.meta.add(it)
  let something2Expr = this.io.readBytes(int(1))
  this.something2 = something2Expr
  for i in 0 ..< int(this.count):
    let it = NtMdtPal_ColTable.read(this.io, this.root, this, i)
    this.tables.add(it)

proc fromFile*(_: typedesc[NtMdtPal], filename: string): NtMdtPal =
  NtMdtPal.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdtPal_Meta], io: KaitaiStream, root: KaitaiStruct, parent: NtMdtPal): NtMdtPal_Meta =
  template this: untyped = result
  this = new(NtMdtPal_Meta)
  let root = if root == nil: cast[NtMdtPal](this) else: cast[NtMdtPal](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  usually 0s
  ]##
  let unkn00Expr = this.io.readBytes(int(3))
  this.unkn00 = unkn00Expr
  let unkn01Expr = this.io.readBytes(int(2))
  this.unkn01 = unkn01Expr
  let unkn02Expr = this.io.readBytes(int(1))
  this.unkn02 = unkn02Expr

  ##[
  usually 0s
  ]##
  let unkn03Expr = this.io.readBytes(int(1))
  this.unkn03 = unkn03Expr
  let colorsCountExpr = this.io.readU2le()
  this.colorsCount = colorsCountExpr

  ##[
  usually 0s
  ]##
  let unkn10Expr = this.io.readBytes(int(2))
  this.unkn10 = unkn10Expr

  ##[
  usually 4
  ]##
  let unkn11Expr = this.io.readBytes(int(1))
  this.unkn11 = unkn11Expr

  ##[
  usually 0s
  ]##
  let unkn12Expr = this.io.readBytes(int(2))
  this.unkn12 = unkn12Expr
  let nameSizeExpr = this.io.readU2be()
  this.nameSize = nameSizeExpr

proc fromFile*(_: typedesc[NtMdtPal_Meta], filename: string): NtMdtPal_Meta =
  NtMdtPal_Meta.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdtPal_Color], io: KaitaiStream, root: KaitaiStruct, parent: NtMdtPal_ColTable): NtMdtPal_Color =
  template this: untyped = result
  this = new(NtMdtPal_Color)
  let root = if root == nil: cast[NtMdtPal](this) else: cast[NtMdtPal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let redExpr = this.io.readU1()
  this.red = redExpr
  let unknExpr = this.io.readU1()
  this.unkn = unknExpr
  let blueExpr = this.io.readU1()
  this.blue = blueExpr
  let greenExpr = this.io.readU1()
  this.green = greenExpr

proc fromFile*(_: typedesc[NtMdtPal_Color], filename: string): NtMdtPal_Color =
  NtMdtPal_Color.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[NtMdtPal_ColTable], io: KaitaiStream, root: KaitaiStruct, parent: NtMdtPal, index: any): NtMdtPal_ColTable =
  template this: untyped = result
  this = new(NtMdtPal_ColTable)
  let root = if root == nil: cast[NtMdtPal](this) else: cast[NtMdtPal](root)
  this.io = io
  this.root = root
  this.parent = parent
  let indexExpr = uint16(index)
  this.index = indexExpr

  let size1Expr = this.io.readU1()
  this.size1 = size1Expr
  let unknExpr = this.io.readU1()
  this.unkn = unknExpr
  let titleExpr = encode(this.io.readBytes(int(NtMdtPal(this.root).meta[this.index].nameSize)), "UTF-16")
  this.title = titleExpr
  let unkn1Expr = this.io.readU2be()
  this.unkn1 = unkn1Expr
  for i in 0 ..< int((NtMdtPal(this.root).meta[this.index].colorsCount - 1)):
    let it = NtMdtPal_Color.read(this.io, this.root, this)
    this.colors.add(it)

proc fromFile*(_: typedesc[NtMdtPal_ColTable], filename: string): NtMdtPal_ColTable =
  NtMdtPal_ColTable.read(newKaitaiFileStream(filename), nil, nil)

