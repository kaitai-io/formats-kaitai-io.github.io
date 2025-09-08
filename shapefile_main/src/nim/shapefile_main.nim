import kaitai_struct_nim_runtime
import options

type
  ShapefileMain* = ref object of KaitaiStruct
    `header`*: ShapefileMain_FileHeader
    `records`*: seq[ShapefileMain_Record]
    `parent`*: KaitaiStruct
  ShapefileMain_PartType* = enum
    triangle_strip = 0
    triangle_fan = 1
    outer_ring = 2
    inner_ring = 3
    first_ring = 4
    ring = 5
  ShapefileMain_ShapeType* = enum
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
  ShapefileMain_BoundingBoxXY* = ref object of KaitaiStruct
    `x`*: ShapefileMain_BoundsMinMax
    `y`*: ShapefileMain_BoundsMinMax
    `parent`*: KaitaiStruct
  ShapefileMain_BoundingBoxXYZM* = ref object of KaitaiStruct
    `x`*: ShapefileMain_BoundsMinMax
    `y`*: ShapefileMain_BoundsMinMax
    `z`*: ShapefileMain_BoundsMinMax
    `m`*: ShapefileMain_BoundsMinMax
    `parent`*: ShapefileMain_FileHeader
  ShapefileMain_BoundsMinMax* = ref object of KaitaiStruct
    `min`*: float64
    `max`*: float64
    `parent`*: KaitaiStruct
  ShapefileMain_FileHeader* = ref object of KaitaiStruct
    `fileCode`*: seq[byte]
    `unusedField1`*: seq[byte]
    `unusedField2`*: seq[byte]
    `unusedField3`*: seq[byte]
    `unusedField4`*: seq[byte]
    `unusedField5`*: seq[byte]
    `fileLength`*: int32
    `version`*: seq[byte]
    `shapeType`*: ShapefileMain_ShapeType
    `boundingBox`*: ShapefileMain_BoundingBoxXYZM
    `parent`*: ShapefileMain
  ShapefileMain_MultiPatch* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `partTypes`*: seq[ShapefileMain_PartType]
    `points`*: seq[ShapefileMain_Point]
    `zRange`*: ShapefileMain_BoundsMinMax
    `zValues`*: seq[float64]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_MultiPoint* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfPoints`*: int32
    `points`*: seq[ShapefileMain_Point]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_MultiPointM* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfPoints`*: int32
    `points`*: seq[ShapefileMain_Point]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_MultiPointZ* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfPoints`*: int32
    `points`*: seq[ShapefileMain_Point]
    `zRange`*: ShapefileMain_BoundsMinMax
    `zValues`*: seq[float64]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_Point* = ref object of KaitaiStruct
    `x`*: float64
    `y`*: float64
    `parent`*: KaitaiStruct
  ShapefileMain_PointM* = ref object of KaitaiStruct
    `x`*: float64
    `y`*: float64
    `m`*: float64
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_PointZ* = ref object of KaitaiStruct
    `x`*: float64
    `y`*: float64
    `z`*: float64
    `m`*: float64
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_PolyLine* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `points`*: seq[ShapefileMain_Point]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_PolyLineM* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `points`*: seq[ShapefileMain_Point]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_PolyLineZ* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `points`*: seq[ShapefileMain_Point]
    `zRange`*: ShapefileMain_BoundsMinMax
    `zValues`*: seq[float64]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_Polygon* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `points`*: seq[ShapefileMain_Point]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_PolygonM* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `points`*: seq[ShapefileMain_Point]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_PolygonZ* = ref object of KaitaiStruct
    `boundingBox`*: ShapefileMain_BoundingBoxXY
    `numberOfParts`*: int32
    `numberOfPoints`*: int32
    `parts`*: seq[int32]
    `points`*: seq[ShapefileMain_Point]
    `zRange`*: ShapefileMain_BoundsMinMax
    `zValues`*: seq[float64]
    `mRange`*: ShapefileMain_BoundsMinMax
    `mValues`*: seq[float64]
    `parent`*: ShapefileMain_RecordContents
  ShapefileMain_Record* = ref object of KaitaiStruct
    `header`*: ShapefileMain_RecordHeader
    `contents`*: ShapefileMain_RecordContents
    `parent`*: ShapefileMain
  ShapefileMain_RecordContents* = ref object of KaitaiStruct
    `shapeType`*: ShapefileMain_ShapeType
    `shapeParameters`*: KaitaiStruct
    `parent`*: ShapefileMain_Record
  ShapefileMain_RecordHeader* = ref object of KaitaiStruct
    `recordNumber`*: int32
    `contentLength`*: int32
    `parent`*: ShapefileMain_Record

proc read*(_: typedesc[ShapefileMain], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain
proc read*(_: typedesc[ShapefileMain_BoundingBoxXY], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain_BoundingBoxXY
proc read*(_: typedesc[ShapefileMain_BoundingBoxXYZM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_FileHeader): ShapefileMain_BoundingBoxXYZM
proc read*(_: typedesc[ShapefileMain_BoundsMinMax], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain_BoundsMinMax
proc read*(_: typedesc[ShapefileMain_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain): ShapefileMain_FileHeader
proc read*(_: typedesc[ShapefileMain_MultiPatch], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPatch
proc read*(_: typedesc[ShapefileMain_MultiPoint], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPoint
proc read*(_: typedesc[ShapefileMain_MultiPointM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPointM
proc read*(_: typedesc[ShapefileMain_MultiPointZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPointZ
proc read*(_: typedesc[ShapefileMain_Point], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain_Point
proc read*(_: typedesc[ShapefileMain_PointM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PointM
proc read*(_: typedesc[ShapefileMain_PointZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PointZ
proc read*(_: typedesc[ShapefileMain_PolyLine], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolyLine
proc read*(_: typedesc[ShapefileMain_PolyLineM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolyLineM
proc read*(_: typedesc[ShapefileMain_PolyLineZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolyLineZ
proc read*(_: typedesc[ShapefileMain_Polygon], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_Polygon
proc read*(_: typedesc[ShapefileMain_PolygonM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolygonM
proc read*(_: typedesc[ShapefileMain_PolygonZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolygonZ
proc read*(_: typedesc[ShapefileMain_Record], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain): ShapefileMain_Record
proc read*(_: typedesc[ShapefileMain_RecordContents], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_Record): ShapefileMain_RecordContents
proc read*(_: typedesc[ShapefileMain_RecordHeader], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_Record): ShapefileMain_RecordHeader


proc read*(_: typedesc[ShapefileMain], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain =
  template this: untyped = result
  this = new(ShapefileMain)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = ShapefileMain_FileHeader.read(this.io, this.root, this)
  this.header = headerExpr

  ##[
  the size of this section of the file in bytes must equal (header.file_length * 2) - 100
  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = ShapefileMain_Record.read(this.io, this.root, this)
      this.records.add(it)
      inc i

proc fromFile*(_: typedesc[ShapefileMain], filename: string): ShapefileMain =
  ShapefileMain.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_BoundingBoxXY], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain_BoundingBoxXY =
  template this: untyped = result
  this = new(ShapefileMain_BoundingBoxXY)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.x = xExpr
  let yExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.y = yExpr

proc fromFile*(_: typedesc[ShapefileMain_BoundingBoxXY], filename: string): ShapefileMain_BoundingBoxXY =
  ShapefileMain_BoundingBoxXY.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_BoundingBoxXYZM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_FileHeader): ShapefileMain_BoundingBoxXYZM =
  template this: untyped = result
  this = new(ShapefileMain_BoundingBoxXYZM)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.x = xExpr
  let yExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.y = yExpr
  let zExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.z = zExpr
  let mExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.m = mExpr

proc fromFile*(_: typedesc[ShapefileMain_BoundingBoxXYZM], filename: string): ShapefileMain_BoundingBoxXYZM =
  ShapefileMain_BoundingBoxXYZM.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_BoundsMinMax], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain_BoundsMinMax =
  template this: untyped = result
  this = new(ShapefileMain_BoundsMinMax)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minExpr = this.io.readF8le()
  this.min = minExpr
  let maxExpr = this.io.readF8le()
  this.max = maxExpr

proc fromFile*(_: typedesc[ShapefileMain_BoundsMinMax], filename: string): ShapefileMain_BoundsMinMax =
  ShapefileMain_BoundsMinMax.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain): ShapefileMain_FileHeader =
  template this: untyped = result
  this = new(ShapefileMain_FileHeader)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
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
  let shapeTypeExpr = ShapefileMain_ShapeType(this.io.readS4le())
  this.shapeType = shapeTypeExpr
  let boundingBoxExpr = ShapefileMain_BoundingBoxXYZM.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr

proc fromFile*(_: typedesc[ShapefileMain_FileHeader], filename: string): ShapefileMain_FileHeader =
  ShapefileMain_FileHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_MultiPatch], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPatch =
  template this: untyped = result
  this = new(ShapefileMain_MultiPatch)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfParts):
    let it = ShapefileMain_PartType(this.io.readS4le())
    this.partTypes.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let zRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.zRange = zRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.zValues.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_MultiPatch], filename: string): ShapefileMain_MultiPatch =
  ShapefileMain_MultiPatch.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_MultiPoint], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPoint =
  template this: untyped = result
  this = new(ShapefileMain_MultiPoint)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)

proc fromFile*(_: typedesc[ShapefileMain_MultiPoint], filename: string): ShapefileMain_MultiPoint =
  ShapefileMain_MultiPoint.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_MultiPointM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPointM =
  template this: untyped = result
  this = new(ShapefileMain_MultiPointM)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_MultiPointM], filename: string): ShapefileMain_MultiPointM =
  ShapefileMain_MultiPointM.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_MultiPointZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_MultiPointZ =
  template this: untyped = result
  this = new(ShapefileMain_MultiPointZ)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let zRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.zRange = zRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.zValues.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_MultiPointZ], filename: string): ShapefileMain_MultiPointZ =
  ShapefileMain_MultiPointZ.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_Point], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ShapefileMain_Point =
  template this: untyped = result
  this = new(ShapefileMain_Point)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF8le()
  this.x = xExpr
  let yExpr = this.io.readF8le()
  this.y = yExpr

proc fromFile*(_: typedesc[ShapefileMain_Point], filename: string): ShapefileMain_Point =
  ShapefileMain_Point.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PointM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PointM =
  template this: untyped = result
  this = new(ShapefileMain_PointM)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF8le()
  this.x = xExpr
  let yExpr = this.io.readF8le()
  this.y = yExpr
  let mExpr = this.io.readF8le()
  this.m = mExpr

proc fromFile*(_: typedesc[ShapefileMain_PointM], filename: string): ShapefileMain_PointM =
  ShapefileMain_PointM.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PointZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PointZ =
  template this: untyped = result
  this = new(ShapefileMain_PointZ)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF8le()
  this.x = xExpr
  let yExpr = this.io.readF8le()
  this.y = yExpr
  let zExpr = this.io.readF8le()
  this.z = zExpr
  let mExpr = this.io.readF8le()
  this.m = mExpr

proc fromFile*(_: typedesc[ShapefileMain_PointZ], filename: string): ShapefileMain_PointZ =
  ShapefileMain_PointZ.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PolyLine], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolyLine =
  template this: untyped = result
  this = new(ShapefileMain_PolyLine)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)

proc fromFile*(_: typedesc[ShapefileMain_PolyLine], filename: string): ShapefileMain_PolyLine =
  ShapefileMain_PolyLine.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PolyLineM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolyLineM =
  template this: untyped = result
  this = new(ShapefileMain_PolyLineM)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_PolyLineM], filename: string): ShapefileMain_PolyLineM =
  ShapefileMain_PolyLineM.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PolyLineZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolyLineZ =
  template this: untyped = result
  this = new(ShapefileMain_PolyLineZ)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let zRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.zRange = zRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.zValues.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_PolyLineZ], filename: string): ShapefileMain_PolyLineZ =
  ShapefileMain_PolyLineZ.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_Polygon], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_Polygon =
  template this: untyped = result
  this = new(ShapefileMain_Polygon)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)

proc fromFile*(_: typedesc[ShapefileMain_Polygon], filename: string): ShapefileMain_Polygon =
  ShapefileMain_Polygon.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PolygonM], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolygonM =
  template this: untyped = result
  this = new(ShapefileMain_PolygonM)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_PolygonM], filename: string): ShapefileMain_PolygonM =
  ShapefileMain_PolygonM.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_PolygonZ], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_RecordContents): ShapefileMain_PolygonZ =
  template this: untyped = result
  this = new(ShapefileMain_PolygonZ)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingBoxExpr = ShapefileMain_BoundingBoxXY.read(this.io, this.root, this)
  this.boundingBox = boundingBoxExpr
  let numberOfPartsExpr = this.io.readS4le()
  this.numberOfParts = numberOfPartsExpr
  let numberOfPointsExpr = this.io.readS4le()
  this.numberOfPoints = numberOfPointsExpr
  for i in 0 ..< int(this.numberOfParts):
    let it = this.io.readS4le()
    this.parts.add(it)
  for i in 0 ..< int(this.numberOfPoints):
    let it = ShapefileMain_Point.read(this.io, this.root, this)
    this.points.add(it)
  let zRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.zRange = zRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.zValues.add(it)
  let mRangeExpr = ShapefileMain_BoundsMinMax.read(this.io, this.root, this)
  this.mRange = mRangeExpr
  for i in 0 ..< int(this.numberOfPoints):
    let it = this.io.readF8le()
    this.mValues.add(it)

proc fromFile*(_: typedesc[ShapefileMain_PolygonZ], filename: string): ShapefileMain_PolygonZ =
  ShapefileMain_PolygonZ.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_Record], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain): ShapefileMain_Record =
  template this: untyped = result
  this = new(ShapefileMain_Record)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = ShapefileMain_RecordHeader.read(this.io, this.root, this)
  this.header = headerExpr

  ##[
  the size of this contents section in bytes must equal header.content_length * 2
  ]##
  let contentsExpr = ShapefileMain_RecordContents.read(this.io, this.root, this)
  this.contents = contentsExpr

proc fromFile*(_: typedesc[ShapefileMain_Record], filename: string): ShapefileMain_Record =
  ShapefileMain_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_RecordContents], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_Record): ShapefileMain_RecordContents =
  template this: untyped = result
  this = new(ShapefileMain_RecordContents)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let shapeTypeExpr = ShapefileMain_ShapeType(this.io.readS4le())
  this.shapeType = shapeTypeExpr
  if this.shapeType != shapefile_main.null_shape:
    block:
      let on = this.shapeType
      if on == shapefile_main.multi_patch:
        let shapeParametersExpr = ShapefileMain_MultiPatch.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.multi_point:
        let shapeParametersExpr = ShapefileMain_MultiPoint.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.multi_point_m:
        let shapeParametersExpr = ShapefileMain_MultiPointM.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.multi_point_z:
        let shapeParametersExpr = ShapefileMain_MultiPointZ.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.point:
        let shapeParametersExpr = ShapefileMain_Point.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.point_m:
        let shapeParametersExpr = ShapefileMain_PointM.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.point_z:
        let shapeParametersExpr = ShapefileMain_PointZ.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.poly_line:
        let shapeParametersExpr = ShapefileMain_PolyLine.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.poly_line_m:
        let shapeParametersExpr = ShapefileMain_PolyLineM.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.poly_line_z:
        let shapeParametersExpr = ShapefileMain_PolyLineZ.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.polygon:
        let shapeParametersExpr = ShapefileMain_Polygon.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.polygon_m:
        let shapeParametersExpr = ShapefileMain_PolygonM.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr
      elif on == shapefile_main.polygon_z:
        let shapeParametersExpr = ShapefileMain_PolygonZ.read(this.io, this.root, this)
        this.shapeParameters = shapeParametersExpr

proc fromFile*(_: typedesc[ShapefileMain_RecordContents], filename: string): ShapefileMain_RecordContents =
  ShapefileMain_RecordContents.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ShapefileMain_RecordHeader], io: KaitaiStream, root: KaitaiStruct, parent: ShapefileMain_Record): ShapefileMain_RecordHeader =
  template this: untyped = result
  this = new(ShapefileMain_RecordHeader)
  let root = if root == nil: cast[ShapefileMain](this) else: cast[ShapefileMain](root)
  this.io = io
  this.root = root
  this.parent = parent

  let recordNumberExpr = this.io.readS4be()
  this.recordNumber = recordNumberExpr
  let contentLengthExpr = this.io.readS4be()
  this.contentLength = contentLengthExpr

proc fromFile*(_: typedesc[ShapefileMain_RecordHeader], filename: string): ShapefileMain_RecordHeader =
  ShapefileMain_RecordHeader.read(newKaitaiFileStream(filename), nil, nil)

