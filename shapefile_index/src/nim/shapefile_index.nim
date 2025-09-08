import kaitai_struct_nim_runtime
import options

type
  ShapefileIndex* = ref object of KaitaiStruct
    `header`*: ShapefileIndex_FileHeader
    `records`*: seq[ShapefileIndex_Record]
    `parent`*: KaitaiStruct
  ShapefileIndex_ShapeType* = enum
    null_shape = 0
    point = 1
    poly_line = 3
    polygon = 5
    multi_point = 8
    point_z = 11
    poly_line_z = 13
    polygon_z = 15
    multi_point_z = 18
    point_m = 21
    poly_line_m = 23
    polygon_m = 25
    multi_point_m = 28
    multi_patch = 31
  ShapefileIndex_BoundingBoxXYZM* = ref object of KaitaiStruct
    `x`*: ShapefileIndex_BoundsMinMax
    `y`*: ShapefileIndex_BoundsMinMax
    `z`*: ShapefileIndex_BoundsMinMax
    `m`*: ShapefileIndex_BoundsMinMax
    `parent`*: ShapefileIndex_FileHeader
  ShapefileIndex_BoundsMinMax* = ref object of KaitaiStruct
    `min`*: float64
    `max`*: float64
    `parent`*: ShapefileIndex_BoundingBoxXYZM
  ShapefileIndex_FileHeader* = ref object of KaitaiStruct
    `fileCode`*: seq[byte]
    `unusedField1`*: seq[byte]
    `unusedField2`*: seq[byte]
    `unusedField3`*: seq[byte]
    `unusedField4`*: seq[byte]
    `unusedField5`*: seq[byte]
    `fileLength`*: int32
    `version`*: seq[byte]
    `shapeType`*: ShapefileIndex_ShapeType
    `boundingBox`*: ShapefileIndex_BoundingBoxXYZM
    `parent`*: ShapefileIndex
  ShapefileIndex_Record* = ref object of KaitaiStruct
    `offset`*: int32
    `contentLength`*: int32
    `parent`*: ShapefileIndex

proc read*(_: typedesc[ShapefileIndex], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileIndex
proc read*(_: typedesc[ShapefileIndex_BoundingBoxXYZM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex_FileHeader): ShapefileIndex_BoundingBoxXYZM
proc read*(_: typedesc[ShapefileIndex_BoundsMinMax], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex_BoundingBoxXYZM): ShapefileIndex_BoundsMinMax
proc read*(_: typedesc[ShapefileIndex_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex): ShapefileIndex_FileHeader
proc read*(_: typedesc[ShapefileIndex_Record], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex): ShapefileIndex_Record


proc read*(_: typedesc[ShapefileIndex], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileIndex =
  template this: untyped = result
  this = new(ShapefileIndex)
  let root = if root == nil: cast[ShapefileIndex](this) else: cast[ShapefileIndex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = ShapefileIndex_FileHeader.read(this.io, this.root, this)
  this.header = headerExpr

  ##[
  the size of this section of the file in bytes must equal (header.file_length * 2) - 100
  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = ShapefileIndex_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[ShapefileIndex], filename: string): ShapefileIndex =
  ShapefileIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileIndex_BoundingBoxXYZM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex_FileHeader): ShapefileIndex_BoundingBoxXYZM =
  template this: untyped = result
  this = new(ShapefileIndex_BoundingBoxXYZM)
  let root = if root == nil: cast[ShapefileIndex](this) else: cast[ShapefileIndex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = ShapefileIndex_BoundsMinMax.read(this.io, this.root, this)
  this.x = xExpr
  let yExpr = ShapefileIndex_BoundsMinMax.read(this.io, this.root, this)
  this.y = yExpr
  let zExpr = ShapefileIndex_BoundsMinMax.read(this.io, this.root, this)
  this.z = zExpr
  let mExpr = ShapefileIndex_BoundsMinMax.read(this.io, this.root, this)
  this.m = mExpr

proc fromFile*(_: typedesc[ShapefileIndex_BoundingBoxXYZM], filename: string): ShapefileIndex_BoundingBoxXYZM =
  ShapefileIndex_BoundingBoxXYZM.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileIndex_BoundsMinMax], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex_BoundingBoxXYZM): ShapefileIndex_BoundsMinMax =
  template this: untyped = result
  this = new(ShapefileIndex_BoundsMinMax)
  let root = if root == nil: cast[ShapefileIndex](this) else: cast[ShapefileIndex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minExpr = this.io.readF8be()
  this.min = minExpr
  let maxExpr = this.io.readF8be()
  this.max = maxExpr

proc fromFile*(_: typedesc[ShapefileIndex_BoundsMinMax], filename: string): ShapefileIndex_BoundsMinMax =
  ShapefileIndex_BoundsMinMax.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileIndex_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex): ShapefileIndex_FileHeader =
  template this: untyped = result
  this = new(ShapefileIndex_FileHeader)
  let root = if root == nil: cast[ShapefileIndex](this) else: cast[ShapefileIndex](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  corresponds to s4be value of 9994
  ]##
  let fileCodeExpr = this.io.readBytes(int(4))
  this.fileCode = fileCodeExpr
  let unusedField1Expr = this.io.readBytes(int(4))
  this.unusedField1 = unusedField1Expr
  let unusedField2Expr = this.io.readBytes(int(4))
  this.unusedField2 = unusedField2Expr
  let unusedField3Expr = this.io.readBytes(int(4))
  this.unusedField3 = unusedField3Expr
  let unusedField4Expr = this.io.readBytes(int(4))
  this.unusedField4 = unusedField4Expr
  let unusedField5Expr = this.io.readBytes(int(4))
  this.unusedField5 = unusedField5Expr
  let fileLengthExpr = this.io.readS4be()
  this.fileLength = fileLengthExpr

  ##[
  corresponds to s4le value of 1000
  ]##
  let versionExpr = this.io.readBytes(int(4))
  this.version = versionExpr
  let shapeTypeExpr = ShapefileIndex_ShapeType(this.io.readS4le())
  this.shapeType = shapeTypeExpr
  let boundingBoxExpr = ShapefileIndex_BoundingBoxXYZM.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr

proc fromFile*(_: typedesc[ShapefileIndex_FileHeader], filename: string): ShapefileIndex_FileHeader =
  ShapefileIndex_FileHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileIndex_Record], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileIndex): ShapefileIndex_Record =
  template this: untyped = result
  this = new(ShapefileIndex_Record)
  let root = if root == nil: cast[ShapefileIndex](this) else: cast[ShapefileIndex](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetExpr = this.io.readS4be()
  this.offset = offsetExpr
  let contentLengthExpr = this.io.readS4be()
  this.contentLength = contentLengthExpr

proc fromFile*(_: typedesc[ShapefileIndex_Record], filename: string): ShapefileIndex_Record =
  ShapefileIndex_Record.read(newKaitaiFileStream(filename), nil, nil)

