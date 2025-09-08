import kaitai_struct_nim_runtime
import options

type
  Wmf* = ref object of KaitaiStruct
    `specialHeader`*: Wmf_SpecialHeader
    `header`*: Wmf_Header
    `records`*: seq[Wmf_Record]
    `parent`*: KaitaiStruct
  Wmf_BinRasterOp* = enum
    black = 1
    notmergepen = 2
    masknotpen = 3
    notcopypen = 4
    maskpennot = 5
    not = 6
    xorpen = 7
    notmaskpen = 8
    maskpen = 9
    notxorpen = 10
    nop = 11
    mergenotpen = 12
    copypen = 13
    mergepennot = 14
    mergepen = 15
    white = 16
  Wmf_Func* = enum
    eof = 0
    savedc = 30
    realizepalette = 53
    setpalentries = 55
    createpalette = 247
    setbkmode = 258
    setmapmode = 259
    setrop2 = 260
    setrelabs = 261
    setpolyfillmode = 262
    setstretchbltmode = 263
    settextcharextra = 264
    restoredc = 295
    invertregion = 298
    paintregion = 299
    selectclipregion = 300
    selectobject = 301
    settextalign = 302
    resizepalette = 313
    dibcreatepatternbrush = 322
    setlayout = 329
    deleteobject = 496
    createpatternbrush = 505
    setbkcolor = 513
    settextcolor = 521
    settextjustification = 522
    setwindoworg = 523
    setwindowext = 524
    setviewportorg = 525
    setviewportext = 526
    offsetwindoworg = 527
    offsetviewportorg = 529
    lineto = 531
    moveto = 532
    offsetcliprgn = 544
    fillregion = 552
    setmapperflags = 561
    selectpalette = 564
    createpenindirect = 762
    createfontindirect = 763
    createbrushindirect = 764
    polygon = 804
    polyline = 805
    scalewindowext = 1040
    scaleviewportext = 1042
    excludecliprect = 1045
    intersectcliprect = 1046
    ellipse = 1048
    floodfill = 1049
    rectangle = 1051
    setpixel = 1055
    frameregion = 1065
    animatepalette = 1078
    textout = 1313
    polypolygon = 1336
    extfloodfill = 1352
    roundrect = 1564
    patblt = 1565
    escape = 1574
    createregion = 1791
    arc = 2071
    pie = 2074
    chord = 2096
    bitblt = 2338
    dibbitblt = 2368
    exttextout = 2610
    stretchblt = 2851
    dibstretchblt = 2881
    setdibtodev = 3379
    stretchdib = 3907
  Wmf_MixMode* = enum
    transparent = 1
    opaque = 2
  Wmf_PolyFillMode* = enum
    alternate = 1
    winding = 2
  Wmf_ColorRef* = ref object of KaitaiStruct
    `red`*: uint8
    `green`*: uint8
    `blue`*: uint8
    `reserved`*: uint8
    `parent`*: Wmf_Record
  Wmf_Header* = ref object of KaitaiStruct
    `metafileType`*: Wmf_Header_MetafileType
    `headerSize`*: uint16
    `version`*: uint16
    `size`*: uint32
    `numberOfObjects`*: uint16
    `maxRecord`*: uint32
    `numberOfMembers`*: uint16
    `parent`*: Wmf
  Wmf_Header_MetafileType* = enum
    memory_metafile = 1
    disk_metafile = 2
  Wmf_ParamsPolygon* = ref object of KaitaiStruct
    `numPoints`*: int16
    `points`*: seq[Wmf_PointS]
    `parent`*: Wmf_Record
  Wmf_ParamsPolyline* = ref object of KaitaiStruct
    `numPoints`*: int16
    `points`*: seq[Wmf_PointS]
    `parent`*: Wmf_Record
  Wmf_ParamsSetbkmode* = ref object of KaitaiStruct
    `bkMode`*: Wmf_MixMode
    `parent`*: Wmf_Record
  Wmf_ParamsSetpolyfillmode* = ref object of KaitaiStruct
    `polyFillMode`*: Wmf_PolyFillMode
    `parent`*: Wmf_Record
  Wmf_ParamsSetrop2* = ref object of KaitaiStruct
    `drawMode`*: Wmf_BinRasterOp
    `parent`*: Wmf_Record
  Wmf_ParamsSetwindowext* = ref object of KaitaiStruct
    `y`*: int16
    `x`*: int16
    `parent`*: Wmf_Record
  Wmf_ParamsSetwindoworg* = ref object of KaitaiStruct
    `y`*: int16
    `x`*: int16
    `parent`*: Wmf_Record
  Wmf_PointS* = ref object of KaitaiStruct
    `x`*: int16
    `y`*: int16
    `parent`*: KaitaiStruct
  Wmf_Record* = ref object of KaitaiStruct
    `size`*: uint32
    `function`*: Wmf_Func
    `params`*: KaitaiStruct
    `parent`*: Wmf
    `rawParams`*: seq[byte]
  Wmf_SpecialHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `handle`*: seq[byte]
    `left`*: int16
    `top`*: int16
    `right`*: int16
    `bottom`*: int16
    `inch`*: uint16
    `reserved`*: seq[byte]
    `checksum`*: uint16
    `parent`*: Wmf

proc read*(_: typedesc[Wmf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wmf
proc read*(_: typedesc[Wmf_ColorRef], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ColorRef
proc read*(_: typedesc[Wmf_Header], io: KaitaiStream, root: KaitaiStruct, parent: Wmf): Wmf_Header
proc read*(_: typedesc[Wmf_ParamsPolygon], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsPolygon
proc read*(_: typedesc[Wmf_ParamsPolyline], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsPolyline
proc read*(_: typedesc[Wmf_ParamsSetbkmode], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetbkmode
proc read*(_: typedesc[Wmf_ParamsSetpolyfillmode], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetpolyfillmode
proc read*(_: typedesc[Wmf_ParamsSetrop2], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetrop2
proc read*(_: typedesc[Wmf_ParamsSetwindowext], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetwindowext
proc read*(_: typedesc[Wmf_ParamsSetwindoworg], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetwindoworg
proc read*(_: typedesc[Wmf_PointS], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wmf_PointS
proc read*(_: typedesc[Wmf_Record], io: KaitaiStream, root: KaitaiStruct, parent: Wmf): Wmf_Record
proc read*(_: typedesc[Wmf_SpecialHeader], io: KaitaiStream, root: KaitaiStruct, parent: Wmf): Wmf_SpecialHeader



##[
WMF (Windows Metafile) is a relatively early vector image format
introduced for Microsoft Windows in 1990.

Inside, it provides a serialized list of Windows GDI (Graphics
Device Interface) function calls, which, if played back, result in
an image being drawn on a given surface (display, off-screen buffer,
printer, etc).

@see <a href="https://www.loc.gov/preservation/digital/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf">Source</a>
]##
proc read*(_: typedesc[Wmf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wmf =
  template this: untyped = result
  this = new(Wmf)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let specialHeaderExpr = Wmf_SpecialHeader.read(this.io, this.root, this)
  this.specialHeader = specialHeaderExpr
  let headerExpr = Wmf_Header.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    var i: int
    while true:
      let it = Wmf_Record.read(this.io, this.root, this)
      this.records.add(it)
      if it.function == wmf.eof:
        break
      inc i

proc fromFile*(_: typedesc[Wmf], filename: string): Wmf =
  Wmf.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.2.1.7"
]##
proc read*(_: typedesc[Wmf_ColorRef], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ColorRef =
  template this: untyped = result
  this = new(Wmf_ColorRef)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let redExpr = this.io.readU1()
  this.red = redExpr
  let greenExpr = this.io.readU1()
  this.green = greenExpr
  let blueExpr = this.io.readU1()
  this.blue = blueExpr
  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Wmf_ColorRef], filename: string): Wmf_ColorRef =
  Wmf_ColorRef.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wmf_Header], io: KaitaiStream, root: KaitaiStruct, parent: Wmf): Wmf_Header =
  template this: untyped = result
  this = new(Wmf_Header)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let metafileTypeExpr = Wmf_Header_MetafileType(this.io.readU2le())
  this.metafileType = metafileTypeExpr
  let headerSizeExpr = this.io.readU2le()
  this.headerSize = headerSizeExpr
  let versionExpr = this.io.readU2le()
  this.version = versionExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let numberOfObjectsExpr = this.io.readU2le()
  this.numberOfObjects = numberOfObjectsExpr
  let maxRecordExpr = this.io.readU4le()
  this.maxRecord = maxRecordExpr
  let numberOfMembersExpr = this.io.readU2le()
  this.numberOfMembers = numberOfMembersExpr

proc fromFile*(_: typedesc[Wmf_Header], filename: string): Wmf_Header =
  Wmf_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.3.15 = params_polyline"
]##
proc read*(_: typedesc[Wmf_ParamsPolygon], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsPolygon =
  template this: untyped = result
  this = new(Wmf_ParamsPolygon)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numPointsExpr = this.io.readS2le()
  this.numPoints = numPointsExpr
  for i in 0 ..< int(this.numPoints):
    let it = Wmf_PointS.read(this.io, this.root, this)
    this.points.add(it)

proc fromFile*(_: typedesc[Wmf_ParamsPolygon], filename: string): Wmf_ParamsPolygon =
  Wmf_ParamsPolygon.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.3.14"
]##
proc read*(_: typedesc[Wmf_ParamsPolyline], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsPolyline =
  template this: untyped = result
  this = new(Wmf_ParamsPolyline)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numPointsExpr = this.io.readS2le()
  this.numPoints = numPointsExpr
  for i in 0 ..< int(this.numPoints):
    let it = Wmf_PointS.read(this.io, this.root, this)
    this.points.add(it)

proc fromFile*(_: typedesc[Wmf_ParamsPolyline], filename: string): Wmf_ParamsPolyline =
  Wmf_ParamsPolyline.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.5.15"
]##
proc read*(_: typedesc[Wmf_ParamsSetbkmode], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetbkmode =
  template this: untyped = result
  this = new(Wmf_ParamsSetbkmode)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Defines current graphic context background mix mode.
  ]##
  let bkModeExpr = Wmf_MixMode(this.io.readU2le())
  this.bkMode = bkModeExpr

proc fromFile*(_: typedesc[Wmf_ParamsSetbkmode], filename: string): Wmf_ParamsSetbkmode =
  Wmf_ParamsSetbkmode.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.5.20"
]##
proc read*(_: typedesc[Wmf_ParamsSetpolyfillmode], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetpolyfillmode =
  template this: untyped = result
  this = new(Wmf_ParamsSetpolyfillmode)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Defines current polygon fill mode.
  ]##
  let polyFillModeExpr = Wmf_PolyFillMode(this.io.readU2le())
  this.polyFillMode = polyFillModeExpr

proc fromFile*(_: typedesc[Wmf_ParamsSetpolyfillmode], filename: string): Wmf_ParamsSetpolyfillmode =
  Wmf_ParamsSetpolyfillmode.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.5.22"
]##
proc read*(_: typedesc[Wmf_ParamsSetrop2], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetrop2 =
  template this: untyped = result
  this = new(Wmf_ParamsSetrop2)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Defines current foreground binary raster operation mixing mode.
  ]##
  let drawModeExpr = Wmf_BinRasterOp(this.io.readU2le())
  this.drawMode = drawModeExpr

proc fromFile*(_: typedesc[Wmf_ParamsSetrop2], filename: string): Wmf_ParamsSetrop2 =
  Wmf_ParamsSetrop2.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.5.30"
]##
proc read*(_: typedesc[Wmf_ParamsSetwindowext], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetwindowext =
  template this: untyped = result
  this = new(Wmf_ParamsSetwindowext)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Vertical extent of the window in logical units.
  ]##
  let yExpr = this.io.readS2le()
  this.y = yExpr

  ##[
  Horizontal extent of the window in logical units.
  ]##
  let xExpr = this.io.readS2le()
  this.x = xExpr

proc fromFile*(_: typedesc[Wmf_ParamsSetwindowext], filename: string): Wmf_ParamsSetwindowext =
  Wmf_ParamsSetwindowext.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.3.5.31"
]##
proc read*(_: typedesc[Wmf_ParamsSetwindoworg], io: KaitaiStream, root: KaitaiStruct, parent: Wmf_Record): Wmf_ParamsSetwindoworg =
  template this: untyped = result
  this = new(Wmf_ParamsSetwindoworg)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Y coordinate of the window origin, in logical units.
  ]##
  let yExpr = this.io.readS2le()
  this.y = yExpr

  ##[
  X coordinate of the window origin, in logical units.
  ]##
  let xExpr = this.io.readS2le()
  this.x = xExpr

proc fromFile*(_: typedesc[Wmf_ParamsSetwindoworg], filename: string): Wmf_ParamsSetwindoworg =
  Wmf_ParamsSetwindoworg.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "section 2.2.1.12"
]##
proc read*(_: typedesc[Wmf_PointS], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Wmf_PointS =
  template this: untyped = result
  this = new(Wmf_PointS)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  X coordinate of the point, in logical units.
  ]##
  let xExpr = this.io.readS2le()
  this.x = xExpr

  ##[
  Y coordinate of the point, in logical units.
  ]##
  let yExpr = this.io.readS2le()
  this.y = yExpr

proc fromFile*(_: typedesc[Wmf_PointS], filename: string): Wmf_PointS =
  Wmf_PointS.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wmf_Record], io: KaitaiStream, root: KaitaiStruct, parent: Wmf): Wmf_Record =
  template this: untyped = result
  this = new(Wmf_Record)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let functionExpr = Wmf_Func(this.io.readU2le())
  this.function = functionExpr
  block:
    let on = this.function
    if on == wmf.polygon:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsPolygon.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.polyline:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsPolyline.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.setbkcolor:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ColorRef.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.setbkmode:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsSetbkmode.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.setpolyfillmode:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsSetpolyfillmode.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.setrop2:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsSetrop2.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.setwindowext:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsSetwindowext.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    elif on == wmf.setwindoworg:
      let rawParamsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.rawParams = rawParamsExpr
      let rawParamsIo = newKaitaiStream(rawParamsExpr)
      let paramsExpr = Wmf_ParamsSetwindoworg.read(rawParamsIo, this.root, this)
      this.params = paramsExpr
    else:
      let paramsExpr = this.io.readBytes(int((this.size - 3) * 2))
      this.params = paramsExpr

proc fromFile*(_: typedesc[Wmf_Record], filename: string): Wmf_Record =
  Wmf_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Wmf_SpecialHeader], io: KaitaiStream, root: KaitaiStruct, parent: Wmf): Wmf_SpecialHeader =
  template this: untyped = result
  this = new(Wmf_SpecialHeader)
  let root = if root == nil: cast[Wmf](this) else: cast[Wmf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let handleExpr = this.io.readBytes(int(2))
  this.handle = handleExpr
  let leftExpr = this.io.readS2le()
  this.left = leftExpr
  let topExpr = this.io.readS2le()
  this.top = topExpr
  let rightExpr = this.io.readS2le()
  this.right = rightExpr
  let bottomExpr = this.io.readS2le()
  this.bottom = bottomExpr
  let inchExpr = this.io.readU2le()
  this.inch = inchExpr
  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let checksumExpr = this.io.readU2le()
  this.checksum = checksumExpr

proc fromFile*(_: typedesc[Wmf_SpecialHeader], filename: string): Wmf_SpecialHeader =
  Wmf_SpecialHeader.read(newKaitaiFileStream(filename), nil, nil)

