import kaitai_struct_nim_runtime
import options

type
  Edid* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `mfgBytes`*: uint16
    `productCode`*: uint16
    `serial`*: uint32
    `mfgWeek`*: uint8
    `mfgYearMod`*: uint8
    `edidVersionMajor`*: uint8
    `edidVersionMinor`*: uint8
    `inputFlags`*: uint8
    `screenSizeH`*: uint8
    `screenSizeV`*: uint8
    `gammaMod`*: uint8
    `featuresFlags`*: uint8
    `chromacity`*: Edid_ChromacityInfo
    `estTimings`*: Edid_EstTimingsInfo
    `stdTimings`*: seq[Edid_StdTiming]
    `parent`*: KaitaiStruct
    `rawStdTimings`*: seq[seq[byte]]
    `mfgYearInst`: int
    `mfgYearInstFlag`: bool
    `mfgIdCh1Inst`: int
    `mfgIdCh1InstFlag`: bool
    `mfgIdCh3Inst`: int
    `mfgIdCh3InstFlag`: bool
    `gammaInst`: float64
    `gammaInstFlag`: bool
    `mfgStrInst`: string
    `mfgStrInstFlag`: bool
    `mfgIdCh2Inst`: int
    `mfgIdCh2InstFlag`: bool
  Edid_ChromacityInfo* = ref object of KaitaiStruct
    `redX10`*: uint64
    `redY10`*: uint64
    `greenX10`*: uint64
    `greenY10`*: uint64
    `blueX10`*: uint64
    `blueY10`*: uint64
    `whiteX10`*: uint64
    `whiteY10`*: uint64
    `redX92`*: uint8
    `redY92`*: uint8
    `greenX92`*: uint8
    `greenY92`*: uint8
    `blueX92`*: uint8
    `blueY92`*: uint8
    `whiteX92`*: uint8
    `whiteY92`*: uint8
    `parent`*: Edid
    `greenXIntInst`: int
    `greenXIntInstFlag`: bool
    `redYInst`: float64
    `redYInstFlag`: bool
    `greenYIntInst`: int
    `greenYIntInstFlag`: bool
    `whiteYInst`: float64
    `whiteYInstFlag`: bool
    `redXInst`: float64
    `redXInstFlag`: bool
    `whiteXInst`: float64
    `whiteXInstFlag`: bool
    `blueXInst`: float64
    `blueXInstFlag`: bool
    `whiteXIntInst`: int
    `whiteXIntInstFlag`: bool
    `whiteYIntInst`: int
    `whiteYIntInstFlag`: bool
    `greenXInst`: float64
    `greenXInstFlag`: bool
    `redXIntInst`: int
    `redXIntInstFlag`: bool
    `redYIntInst`: int
    `redYIntInstFlag`: bool
    `blueXIntInst`: int
    `blueXIntInstFlag`: bool
    `blueYInst`: float64
    `blueYInstFlag`: bool
    `greenYInst`: float64
    `greenYInstFlag`: bool
    `blueYIntInst`: int
    `blueYIntInstFlag`: bool
  Edid_EstTimingsInfo* = ref object of KaitaiStruct
    `can720x400px70hz`*: bool
    `can720x400px88hz`*: bool
    `can640x480px60hz`*: bool
    `can640x480px67hz`*: bool
    `can640x480px72hz`*: bool
    `can640x480px75hz`*: bool
    `can800x600px56hz`*: bool
    `can800x600px60hz`*: bool
    `can800x600px72hz`*: bool
    `can800x600px75hz`*: bool
    `can832x624px75hz`*: bool
    `can1024x768px87hzI`*: bool
    `can1024x768px60hz`*: bool
    `can1024x768px70hz`*: bool
    `can1024x768px75hz`*: bool
    `can1280x1024px75hz`*: bool
    `can1152x870px75hz`*: bool
    `reserved`*: uint64
    `parent`*: Edid
  Edid_StdTiming* = ref object of KaitaiStruct
    `horizActivePixelsMod`*: uint8
    `aspectRatio`*: Edid_StdTiming_AspectRatios
    `refreshRateMod`*: uint64
    `parent`*: Edid
    `bytesLookaheadInst`: seq[byte]
    `bytesLookaheadInstFlag`: bool
    `isUsedInst`: bool
    `isUsedInstFlag`: bool
    `horizActivePixelsInst`: int
    `horizActivePixelsInstFlag`: bool
    `refreshRateInst`: int
    `refreshRateInstFlag`: bool
  Edid_StdTiming_AspectRatios* = enum
    ratio_16_10 = 0
    ratio_4_3 = 1
    ratio_5_4 = 2
    ratio_16_9 = 3

proc read*(_: typedesc[Edid], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Edid
proc read*(_: typedesc[Edid_ChromacityInfo], io: KaitaiStream, root: KaitaiStruct, parent: Edid): Edid_ChromacityInfo
proc read*(_: typedesc[Edid_EstTimingsInfo], io: KaitaiStream, root: KaitaiStruct, parent: Edid): Edid_EstTimingsInfo
proc read*(_: typedesc[Edid_StdTiming], io: KaitaiStream, root: KaitaiStruct, parent: Edid): Edid_StdTiming

proc mfgYear*(this: Edid): int
proc mfgIdCh1*(this: Edid): int
proc mfgIdCh3*(this: Edid): int
proc gamma*(this: Edid): float64
proc mfgStr*(this: Edid): string
proc mfgIdCh2*(this: Edid): int
proc greenXInt*(this: Edid_ChromacityInfo): int
proc redY*(this: Edid_ChromacityInfo): float64
proc greenYInt*(this: Edid_ChromacityInfo): int
proc whiteY*(this: Edid_ChromacityInfo): float64
proc redX*(this: Edid_ChromacityInfo): float64
proc whiteX*(this: Edid_ChromacityInfo): float64
proc blueX*(this: Edid_ChromacityInfo): float64
proc whiteXInt*(this: Edid_ChromacityInfo): int
proc whiteYInt*(this: Edid_ChromacityInfo): int
proc greenX*(this: Edid_ChromacityInfo): float64
proc redXInt*(this: Edid_ChromacityInfo): int
proc redYInt*(this: Edid_ChromacityInfo): int
proc blueXInt*(this: Edid_ChromacityInfo): int
proc blueY*(this: Edid_ChromacityInfo): float64
proc greenY*(this: Edid_ChromacityInfo): float64
proc blueYInt*(this: Edid_ChromacityInfo): int
proc bytesLookahead*(this: Edid_StdTiming): seq[byte]
proc isUsed*(this: Edid_StdTiming): bool
proc horizActivePixels*(this: Edid_StdTiming): int
proc refreshRate*(this: Edid_StdTiming): int

proc read*(_: typedesc[Edid], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Edid =
  template this: untyped = result
  this = new(Edid)
  let root = if root == nil: cast[Edid](this) else: cast[Edid](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr
  let mfgBytesExpr = this.io.readU2be()
  this.mfgBytes = mfgBytesExpr

  ##[
  Manufacturer product code
  ]##
  let productCodeExpr = this.io.readU2le()
  this.productCode = productCodeExpr

  ##[
  Serial number
  ]##
  let serialExpr = this.io.readU4le()
  this.serial = serialExpr

  ##[
  Week of manufacture. Week numbering is not consistent between manufacturers.
  ]##
  let mfgWeekExpr = this.io.readU1()
  this.mfgWeek = mfgWeekExpr

  ##[
  Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
  ]##
  let mfgYearModExpr = this.io.readU1()
  this.mfgYearMod = mfgYearModExpr

  ##[
  EDID version, usually 1 (for 1.3)
  ]##
  let edidVersionMajorExpr = this.io.readU1()
  this.edidVersionMajor = edidVersionMajorExpr

  ##[
  EDID revision, usually 3 (for 1.3)
  ]##
  let edidVersionMinorExpr = this.io.readU1()
  this.edidVersionMinor = edidVersionMinorExpr
  let inputFlagsExpr = this.io.readU1()
  this.inputFlags = inputFlagsExpr

  ##[
  Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
  ]##
  let screenSizeHExpr = this.io.readU1()
  this.screenSizeH = screenSizeHExpr

  ##[
  Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
  ]##
  let screenSizeVExpr = this.io.readU1()
  this.screenSizeV = screenSizeVExpr

  ##[
  Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54)
  ]##
  let gammaModExpr = this.io.readU1()
  this.gammaMod = gammaModExpr
  let featuresFlagsExpr = this.io.readU1()
  this.featuresFlags = featuresFlagsExpr

  ##[
  Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
  @see "Standard, section 3.7"
  ]##
  let chromacityExpr = Edid_ChromacityInfo.read(this.io, this.root, this)
  this.chromacity = chromacityExpr

  ##[
  Block of bit flags that indicates support of so called
"established timings", which is a commonly used subset of VESA
DMT (Discrete Monitor Timings) modes.

  @see "Standard, section 3.8"
  ]##
  let estTimingsExpr = Edid_EstTimingsInfo.read(this.io, this.root, this)
  this.estTimings = estTimingsExpr

  ##[
  Array of descriptions of so called "standard timings", which are
used to specify up to 8 additional timings not included in
"established timings".

  ]##
  for i in 0 ..< int(8):
    let buf = this.io.readBytes(int(2))
    this.rawStdTimings.add(buf)
    let rawStdTimingsIo = newKaitaiStream(buf)
    let it = Edid_StdTiming.read(rawStdTimingsIo, this.root, this)
    this.stdTimings.add(it)

proc mfgYear(this: Edid): int = 
  if this.mfgYearInstFlag:
    return this.mfgYearInst
  let mfgYearInstExpr = int((this.mfgYearMod + 1990))
  this.mfgYearInst = mfgYearInstExpr
  this.mfgYearInstFlag = true
  return this.mfgYearInst

proc mfgIdCh1(this: Edid): int = 
  if this.mfgIdCh1InstFlag:
    return this.mfgIdCh1Inst
  let mfgIdCh1InstExpr = int(((this.mfgBytes and 31744) shr 10))
  this.mfgIdCh1Inst = mfgIdCh1InstExpr
  this.mfgIdCh1InstFlag = true
  return this.mfgIdCh1Inst

proc mfgIdCh3(this: Edid): int = 
  if this.mfgIdCh3InstFlag:
    return this.mfgIdCh3Inst
  let mfgIdCh3InstExpr = int((this.mfgBytes and 31))
  this.mfgIdCh3Inst = mfgIdCh3InstExpr
  this.mfgIdCh3InstFlag = true
  return this.mfgIdCh3Inst

proc gamma(this: Edid): float64 = 
  if this.gammaInstFlag:
    return this.gammaInst
  if this.gammaMod != 255:
    let gammaInstExpr = float64(((this.gammaMod + 100) div 100.0))
    this.gammaInst = gammaInstExpr
  this.gammaInstFlag = true
  return this.gammaInst

proc mfgStr(this: Edid): string = 
  if this.mfgStrInstFlag:
    return this.mfgStrInst
  let mfgStrInstExpr = string(encode(@[(this.mfgIdCh1 + 64), (this.mfgIdCh2 + 64), (this.mfgIdCh3 + 64)], "ASCII"))
  this.mfgStrInst = mfgStrInstExpr
  this.mfgStrInstFlag = true
  return this.mfgStrInst

proc mfgIdCh2(this: Edid): int = 
  if this.mfgIdCh2InstFlag:
    return this.mfgIdCh2Inst
  let mfgIdCh2InstExpr = int(((this.mfgBytes and 992) shr 5))
  this.mfgIdCh2Inst = mfgIdCh2InstExpr
  this.mfgIdCh2InstFlag = true
  return this.mfgIdCh2Inst

proc fromFile*(_: typedesc[Edid], filename: string): Edid =
  Edid.read(newKaitaiFileStream(filename), nil, nil)


##[
Chromaticity information: colorimetry and white point
coordinates. All coordinates are stored as fixed precision
10-bit numbers, bits are shuffled for compactness.

]##
proc read*(_: typedesc[Edid_ChromacityInfo], io: KaitaiStream, root: KaitaiStruct, parent: Edid): Edid_ChromacityInfo =
  template this: untyped = result
  this = new(Edid_ChromacityInfo)
  let root = if root == nil: cast[Edid](this) else: cast[Edid](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Red X, bits 1..0
  ]##
  let redX10Expr = this.io.readBitsIntBe(2)
  this.redX10 = redX10Expr

  ##[
  Red Y, bits 1..0
  ]##
  let redY10Expr = this.io.readBitsIntBe(2)
  this.redY10 = redY10Expr

  ##[
  Green X, bits 1..0
  ]##
  let greenX10Expr = this.io.readBitsIntBe(2)
  this.greenX10 = greenX10Expr

  ##[
  Green Y, bits 1..0
  ]##
  let greenY10Expr = this.io.readBitsIntBe(2)
  this.greenY10 = greenY10Expr

  ##[
  Blue X, bits 1..0
  ]##
  let blueX10Expr = this.io.readBitsIntBe(2)
  this.blueX10 = blueX10Expr

  ##[
  Blue Y, bits 1..0
  ]##
  let blueY10Expr = this.io.readBitsIntBe(2)
  this.blueY10 = blueY10Expr

  ##[
  White X, bits 1..0
  ]##
  let whiteX10Expr = this.io.readBitsIntBe(2)
  this.whiteX10 = whiteX10Expr

  ##[
  White Y, bits 1..0
  ]##
  let whiteY10Expr = this.io.readBitsIntBe(2)
  this.whiteY10 = whiteY10Expr
  alignToByte(this.io)

  ##[
  Red X, bits 9..2
  ]##
  let redX92Expr = this.io.readU1()
  this.redX92 = redX92Expr

  ##[
  Red Y, bits 9..2
  ]##
  let redY92Expr = this.io.readU1()
  this.redY92 = redY92Expr

  ##[
  Green X, bits 9..2
  ]##
  let greenX92Expr = this.io.readU1()
  this.greenX92 = greenX92Expr

  ##[
  Green Y, bits 9..2
  ]##
  let greenY92Expr = this.io.readU1()
  this.greenY92 = greenY92Expr

  ##[
  Blue X, bits 9..2
  ]##
  let blueX92Expr = this.io.readU1()
  this.blueX92 = blueX92Expr

  ##[
  Blue Y, bits 9..2
  ]##
  let blueY92Expr = this.io.readU1()
  this.blueY92 = blueY92Expr

  ##[
  White X, bits 9..2
  ]##
  let whiteX92Expr = this.io.readU1()
  this.whiteX92 = whiteX92Expr

  ##[
  White Y, bits 9..2
  ]##
  let whiteY92Expr = this.io.readU1()
  this.whiteY92 = whiteY92Expr

proc greenXInt(this: Edid_ChromacityInfo): int = 
  if this.greenXIntInstFlag:
    return this.greenXIntInst
  let greenXIntInstExpr = int(((this.greenX92 shl 2) or this.greenX10))
  this.greenXIntInst = greenXIntInstExpr
  this.greenXIntInstFlag = true
  return this.greenXIntInst

proc redY(this: Edid_ChromacityInfo): float64 = 

  ##[
  Red Y coordinate
  ]##
  if this.redYInstFlag:
    return this.redYInst
  let redYInstExpr = float64((this.redYInt div 1024.0))
  this.redYInst = redYInstExpr
  this.redYInstFlag = true
  return this.redYInst

proc greenYInt(this: Edid_ChromacityInfo): int = 
  if this.greenYIntInstFlag:
    return this.greenYIntInst
  let greenYIntInstExpr = int(((this.greenY92 shl 2) or this.greenY10))
  this.greenYIntInst = greenYIntInstExpr
  this.greenYIntInstFlag = true
  return this.greenYIntInst

proc whiteY(this: Edid_ChromacityInfo): float64 = 

  ##[
  White Y coordinate
  ]##
  if this.whiteYInstFlag:
    return this.whiteYInst
  let whiteYInstExpr = float64((this.whiteYInt div 1024.0))
  this.whiteYInst = whiteYInstExpr
  this.whiteYInstFlag = true
  return this.whiteYInst

proc redX(this: Edid_ChromacityInfo): float64 = 

  ##[
  Red X coordinate
  ]##
  if this.redXInstFlag:
    return this.redXInst
  let redXInstExpr = float64((this.redXInt div 1024.0))
  this.redXInst = redXInstExpr
  this.redXInstFlag = true
  return this.redXInst

proc whiteX(this: Edid_ChromacityInfo): float64 = 

  ##[
  White X coordinate
  ]##
  if this.whiteXInstFlag:
    return this.whiteXInst
  let whiteXInstExpr = float64((this.whiteXInt div 1024.0))
  this.whiteXInst = whiteXInstExpr
  this.whiteXInstFlag = true
  return this.whiteXInst

proc blueX(this: Edid_ChromacityInfo): float64 = 

  ##[
  Blue X coordinate
  ]##
  if this.blueXInstFlag:
    return this.blueXInst
  let blueXInstExpr = float64((this.blueXInt div 1024.0))
  this.blueXInst = blueXInstExpr
  this.blueXInstFlag = true
  return this.blueXInst

proc whiteXInt(this: Edid_ChromacityInfo): int = 
  if this.whiteXIntInstFlag:
    return this.whiteXIntInst
  let whiteXIntInstExpr = int(((this.whiteX92 shl 2) or this.whiteX10))
  this.whiteXIntInst = whiteXIntInstExpr
  this.whiteXIntInstFlag = true
  return this.whiteXIntInst

proc whiteYInt(this: Edid_ChromacityInfo): int = 
  if this.whiteYIntInstFlag:
    return this.whiteYIntInst
  let whiteYIntInstExpr = int(((this.whiteY92 shl 2) or this.whiteY10))
  this.whiteYIntInst = whiteYIntInstExpr
  this.whiteYIntInstFlag = true
  return this.whiteYIntInst

proc greenX(this: Edid_ChromacityInfo): float64 = 

  ##[
  Green X coordinate
  ]##
  if this.greenXInstFlag:
    return this.greenXInst
  let greenXInstExpr = float64((this.greenXInt div 1024.0))
  this.greenXInst = greenXInstExpr
  this.greenXInstFlag = true
  return this.greenXInst

proc redXInt(this: Edid_ChromacityInfo): int = 
  if this.redXIntInstFlag:
    return this.redXIntInst
  let redXIntInstExpr = int(((this.redX92 shl 2) or this.redX10))
  this.redXIntInst = redXIntInstExpr
  this.redXIntInstFlag = true
  return this.redXIntInst

proc redYInt(this: Edid_ChromacityInfo): int = 
  if this.redYIntInstFlag:
    return this.redYIntInst
  let redYIntInstExpr = int(((this.redY92 shl 2) or this.redY10))
  this.redYIntInst = redYIntInstExpr
  this.redYIntInstFlag = true
  return this.redYIntInst

proc blueXInt(this: Edid_ChromacityInfo): int = 
  if this.blueXIntInstFlag:
    return this.blueXIntInst
  let blueXIntInstExpr = int(((this.blueX92 shl 2) or this.blueX10))
  this.blueXIntInst = blueXIntInstExpr
  this.blueXIntInstFlag = true
  return this.blueXIntInst

proc blueY(this: Edid_ChromacityInfo): float64 = 

  ##[
  Blue Y coordinate
  ]##
  if this.blueYInstFlag:
    return this.blueYInst
  let blueYInstExpr = float64((this.blueYInt div 1024.0))
  this.blueYInst = blueYInstExpr
  this.blueYInstFlag = true
  return this.blueYInst

proc greenY(this: Edid_ChromacityInfo): float64 = 

  ##[
  Green Y coordinate
  ]##
  if this.greenYInstFlag:
    return this.greenYInst
  let greenYInstExpr = float64((this.greenYInt div 1024.0))
  this.greenYInst = greenYInstExpr
  this.greenYInstFlag = true
  return this.greenYInst

proc blueYInt(this: Edid_ChromacityInfo): int = 
  if this.blueYIntInstFlag:
    return this.blueYIntInst
  let blueYIntInstExpr = int(((this.blueY92 shl 2) or this.blueY10))
  this.blueYIntInst = blueYIntInstExpr
  this.blueYIntInstFlag = true
  return this.blueYIntInst

proc fromFile*(_: typedesc[Edid_ChromacityInfo], filename: string): Edid_ChromacityInfo =
  Edid_ChromacityInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Edid_EstTimingsInfo], io: KaitaiStream, root: KaitaiStruct, parent: Edid): Edid_EstTimingsInfo =
  template this: untyped = result
  this = new(Edid_EstTimingsInfo)
  let root = if root == nil: cast[Edid](this) else: cast[Edid](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Supports 720 x 400 @ 70Hz
  ]##
  let can720x400px70hzExpr = this.io.readBitsIntBe(1) != 0
  this.can720x400px70hz = can720x400px70hzExpr

  ##[
  Supports 720 x 400 @ 88Hz
  ]##
  let can720x400px88hzExpr = this.io.readBitsIntBe(1) != 0
  this.can720x400px88hz = can720x400px88hzExpr

  ##[
  Supports 640 x 480 @ 60Hz
  ]##
  let can640x480px60hzExpr = this.io.readBitsIntBe(1) != 0
  this.can640x480px60hz = can640x480px60hzExpr

  ##[
  Supports 640 x 480 @ 67Hz
  ]##
  let can640x480px67hzExpr = this.io.readBitsIntBe(1) != 0
  this.can640x480px67hz = can640x480px67hzExpr

  ##[
  Supports 640 x 480 @ 72Hz
  ]##
  let can640x480px72hzExpr = this.io.readBitsIntBe(1) != 0
  this.can640x480px72hz = can640x480px72hzExpr

  ##[
  Supports 640 x 480 @ 75Hz
  ]##
  let can640x480px75hzExpr = this.io.readBitsIntBe(1) != 0
  this.can640x480px75hz = can640x480px75hzExpr

  ##[
  Supports 800 x 600 @ 56Hz
  ]##
  let can800x600px56hzExpr = this.io.readBitsIntBe(1) != 0
  this.can800x600px56hz = can800x600px56hzExpr

  ##[
  Supports 800 x 600 @ 60Hz
  ]##
  let can800x600px60hzExpr = this.io.readBitsIntBe(1) != 0
  this.can800x600px60hz = can800x600px60hzExpr

  ##[
  Supports 800 x 600 @ 72Hz
  ]##
  let can800x600px72hzExpr = this.io.readBitsIntBe(1) != 0
  this.can800x600px72hz = can800x600px72hzExpr

  ##[
  Supports 800 x 600 @ 75Hz
  ]##
  let can800x600px75hzExpr = this.io.readBitsIntBe(1) != 0
  this.can800x600px75hz = can800x600px75hzExpr

  ##[
  Supports 832 x 624 @ 75Hz
  ]##
  let can832x624px75hzExpr = this.io.readBitsIntBe(1) != 0
  this.can832x624px75hz = can832x624px75hzExpr

  ##[
  Supports 1024 x 768 @ 87Hz(I)
  ]##
  let can1024x768px87hzIExpr = this.io.readBitsIntBe(1) != 0
  this.can1024x768px87hzI = can1024x768px87hzIExpr

  ##[
  Supports 1024 x 768 @ 60Hz
  ]##
  let can1024x768px60hzExpr = this.io.readBitsIntBe(1) != 0
  this.can1024x768px60hz = can1024x768px60hzExpr

  ##[
  Supports 1024 x 768 @ 70Hz
  ]##
  let can1024x768px70hzExpr = this.io.readBitsIntBe(1) != 0
  this.can1024x768px70hz = can1024x768px70hzExpr

  ##[
  Supports 1024 x 768 @ 75Hz
  ]##
  let can1024x768px75hzExpr = this.io.readBitsIntBe(1) != 0
  this.can1024x768px75hz = can1024x768px75hzExpr

  ##[
  Supports 1280 x 1024 @ 75Hz
  ]##
  let can1280x1024px75hzExpr = this.io.readBitsIntBe(1) != 0
  this.can1280x1024px75hz = can1280x1024px75hzExpr

  ##[
  Supports 1152 x 870 @ 75Hz
  ]##
  let can1152x870px75hzExpr = this.io.readBitsIntBe(1) != 0
  this.can1152x870px75hz = can1152x870px75hzExpr
  let reservedExpr = this.io.readBitsIntBe(7)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Edid_EstTimingsInfo], filename: string): Edid_EstTimingsInfo =
  Edid_EstTimingsInfo.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Edid_StdTiming], io: KaitaiStream, root: KaitaiStruct, parent: Edid): Edid_StdTiming =
  template this: untyped = result
  this = new(Edid_StdTiming)
  let root = if root == nil: cast[Edid](this) else: cast[Edid](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Range of horizontal active pixels, written in modified form:
`(horiz_active_pixels / 8) - 31`. This yields an effective
range of 256..2288, with steps of 8 pixels.

  ]##
  let horizActivePixelsModExpr = this.io.readU1()
  this.horizActivePixelsMod = horizActivePixelsModExpr

  ##[
  Aspect ratio of the image. Can be used to calculate number
of vertical pixels.

  ]##
  let aspectRatioExpr = Edid_StdTiming_AspectRatios(this.io.readBitsIntBe(2))
  this.aspectRatio = aspectRatioExpr

  ##[
  Refresh rate in Hz, written in modified form: `refresh_rate
- 60`. This yields an effective range of 60..123 Hz.

  ]##
  let refreshRateModExpr = this.io.readBitsIntBe(6)
  this.refreshRateMod = refreshRateModExpr

proc bytesLookahead(this: Edid_StdTiming): seq[byte] = 
  if this.bytesLookaheadInstFlag:
    return this.bytesLookaheadInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let bytesLookaheadInstExpr = this.io.readBytes(int(2))
  this.bytesLookaheadInst = bytesLookaheadInstExpr
  this.io.seek(pos)
  this.bytesLookaheadInstFlag = true
  return this.bytesLookaheadInst

proc isUsed(this: Edid_StdTiming): bool = 
  if this.isUsedInstFlag:
    return this.isUsedInst
  let isUsedInstExpr = bool(this.bytesLookahead != @[1'u8, 1'u8])
  this.isUsedInst = isUsedInstExpr
  this.isUsedInstFlag = true
  return this.isUsedInst

proc horizActivePixels(this: Edid_StdTiming): int = 

  ##[
  Range of horizontal active pixels.
  ]##
  if this.horizActivePixelsInstFlag:
    return this.horizActivePixelsInst
  if this.isUsed:
    let horizActivePixelsInstExpr = int(((this.horizActivePixelsMod + 31) * 8))
    this.horizActivePixelsInst = horizActivePixelsInstExpr
  this.horizActivePixelsInstFlag = true
  return this.horizActivePixelsInst

proc refreshRate(this: Edid_StdTiming): int = 

  ##[
  Vertical refresh rate, Hz.
  ]##
  if this.refreshRateInstFlag:
    return this.refreshRateInst
  if this.isUsed:
    let refreshRateInstExpr = int((this.refreshRateMod + 60))
    this.refreshRateInst = refreshRateInstExpr
  this.refreshRateInstFlag = true
  return this.refreshRateInst

proc fromFile*(_: typedesc[Edid_StdTiming], filename: string): Edid_StdTiming =
  Edid_StdTiming.read(newKaitaiFileStream(filename), nil, nil)

