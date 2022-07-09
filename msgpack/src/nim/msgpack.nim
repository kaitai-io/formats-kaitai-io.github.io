import kaitai_struct_nim_runtime
import options

type
  Msgpack* = ref object of KaitaiStruct
    `b1`*: uint8
    `intExtra`*: int
    `float32Value`*: float32
    `float64Value`*: float64
    `strLen8`*: uint8
    `strLen16`*: uint16
    `strLen32`*: uint32
    `strValue`*: string
    `numArrayElements16`*: uint16
    `numArrayElements32`*: uint32
    `arrayElements`*: seq[Msgpack]
    `numMapElements16`*: uint16
    `numMapElements32`*: uint32
    `mapElements`*: seq[Msgpack_MapTuple]
    `parent`*: KaitaiStruct
    `isArray32Inst`: bool
    `isArray32InstFlag`: bool
    `intValueInst`: int
    `intValueInstFlag`: bool
    `strLenInst`: int
    `strLenInstFlag`: bool
    `isFixArrayInst`: bool
    `isFixArrayInstFlag`: bool
    `isMapInst`: bool
    `isMapInstFlag`: bool
    `isArrayInst`: bool
    `isArrayInstFlag`: bool
    `isFloatInst`: bool
    `isFloatInstFlag`: bool
    `isStr8Inst`: bool
    `isStr8InstFlag`: bool
    `isFixMapInst`: bool
    `isFixMapInstFlag`: bool
    `isIntInst`: bool
    `isIntInstFlag`: bool
    `isBoolInst`: bool
    `isBoolInstFlag`: bool
    `isStr16Inst`: bool
    `isStr16InstFlag`: bool
    `isFloat64Inst`: bool
    `isFloat64InstFlag`: bool
    `isMap16Inst`: bool
    `isMap16InstFlag`: bool
    `isNegInt5Inst`: bool
    `isNegInt5InstFlag`: bool
    `posInt7ValueInst`: uint8
    `posInt7ValueInstFlag`: bool
    `isNilInst`: bool
    `isNilInstFlag`: bool
    `floatValueInst`: float64
    `floatValueInstFlag`: bool
    `numArrayElementsInst`: int
    `numArrayElementsInstFlag`: bool
    `negInt5ValueInst`: int
    `negInt5ValueInstFlag`: bool
    `boolValueInst`: bool
    `boolValueInstFlag`: bool
    `isPosInt7Inst`: bool
    `isPosInt7InstFlag`: bool
    `isArray16Inst`: bool
    `isArray16InstFlag`: bool
    `isStrInst`: bool
    `isStrInstFlag`: bool
    `isFixStrInst`: bool
    `isFixStrInstFlag`: bool
    `isStr32Inst`: bool
    `isStr32InstFlag`: bool
    `numMapElementsInst`: int
    `numMapElementsInstFlag`: bool
    `isFloat32Inst`: bool
    `isFloat32InstFlag`: bool
    `isMap32Inst`: bool
    `isMap32InstFlag`: bool
  Msgpack_MapTuple* = ref object of KaitaiStruct
    `key`*: Msgpack
    `value`*: Msgpack
    `parent`*: Msgpack

proc read*(_: typedesc[Msgpack], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Msgpack
proc read*(_: typedesc[Msgpack_MapTuple], io: KaitaiStream, root: KaitaiStruct, parent: Msgpack): Msgpack_MapTuple

proc isArray32*(this: Msgpack): bool
proc intValue*(this: Msgpack): int
proc strLen*(this: Msgpack): int
proc isFixArray*(this: Msgpack): bool
proc isMap*(this: Msgpack): bool
proc isArray*(this: Msgpack): bool
proc isFloat*(this: Msgpack): bool
proc isStr8*(this: Msgpack): bool
proc isFixMap*(this: Msgpack): bool
proc isInt*(this: Msgpack): bool
proc isBool*(this: Msgpack): bool
proc isStr16*(this: Msgpack): bool
proc isFloat64*(this: Msgpack): bool
proc isMap16*(this: Msgpack): bool
proc isNegInt5*(this: Msgpack): bool
proc posInt7Value*(this: Msgpack): uint8
proc isNil*(this: Msgpack): bool
proc floatValue*(this: Msgpack): float64
proc numArrayElements*(this: Msgpack): int
proc negInt5Value*(this: Msgpack): int
proc boolValue*(this: Msgpack): bool
proc isPosInt7*(this: Msgpack): bool
proc isArray16*(this: Msgpack): bool
proc isStr*(this: Msgpack): bool
proc isFixStr*(this: Msgpack): bool
proc isStr32*(this: Msgpack): bool
proc numMapElements*(this: Msgpack): int
proc isFloat32*(this: Msgpack): bool
proc isMap32*(this: Msgpack): bool


##[
MessagePack (msgpack) is a system to serialize arbitrary structured
data into a compact binary stream.

@see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md">Source</a>
]##
proc read*(_: typedesc[Msgpack], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Msgpack =
  template this: untyped = result
  this = new(Msgpack)
  let root = if root == nil: cast[Msgpack](this) else: cast[Msgpack](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  First byte is msgpack message is either a piece of data by
itself or determines types of further, more complex data
structures.

  ]##
  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  block:
    let on = this.b1
    if on == 211:
      let intExtraExpr = int(this.io.readS8be())
      this.intExtra = intExtraExpr
    elif on == 209:
      let intExtraExpr = int(this.io.readS2be())
      this.intExtra = intExtraExpr
    elif on == 210:
      let intExtraExpr = int(this.io.readS4be())
      this.intExtra = intExtraExpr
    elif on == 208:
      let intExtraExpr = int(this.io.readS1())
      this.intExtra = intExtraExpr
    elif on == 205:
      let intExtraExpr = int(this.io.readU2be())
      this.intExtra = intExtraExpr
    elif on == 207:
      let intExtraExpr = int(this.io.readU8be())
      this.intExtra = intExtraExpr
    elif on == 204:
      let intExtraExpr = int(this.io.readU1())
      this.intExtra = intExtraExpr
    elif on == 206:
      let intExtraExpr = int(this.io.readU4be())
      this.intExtra = intExtraExpr
  if this.isFloat32:
    let float32ValueExpr = this.io.readF4be()
    this.float32Value = float32ValueExpr
  if this.isFloat64:
    let float64ValueExpr = this.io.readF8be()
    this.float64Value = float64ValueExpr
  if this.isStr8:
    let strLen8Expr = this.io.readU1()
    this.strLen8 = strLen8Expr
  if this.isStr16:
    let strLen16Expr = this.io.readU2be()
    this.strLen16 = strLen16Expr
  if this.isStr32:
    let strLen32Expr = this.io.readU4be()
    this.strLen32 = strLen32Expr
  if this.isStr:
    let strValueExpr = encode(this.io.readBytes(int(this.strLen)), "UTF-8")
    this.strValue = strValueExpr
  if this.isArray16:
    let numArrayElements16Expr = this.io.readU2be()
    this.numArrayElements16 = numArrayElements16Expr
  if this.isArray32:
    let numArrayElements32Expr = this.io.readU4be()
    this.numArrayElements32 = numArrayElements32Expr
  if this.isArray:
    for i in 0 ..< int(this.numArrayElements):
      let it = Msgpack.read(this.io, this.root, this)
      this.arrayElements.add(it)
  if this.isMap16:
    let numMapElements16Expr = this.io.readU2be()
    this.numMapElements16 = numMapElements16Expr
  if this.isMap32:
    let numMapElements32Expr = this.io.readU4be()
    this.numMapElements32 = numMapElements32Expr
  if this.isMap:
    for i in 0 ..< int(this.numMapElements):
      let it = Msgpack_MapTuple.read(this.io, this.root, this)
      this.mapElements.add(it)

proc isArray32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isArray32InstFlag:
    return this.isArray32Inst
  let isArray32InstExpr = bool(this.b1 == 221)
  this.isArray32Inst = isArray32InstExpr
  this.isArray32InstFlag = true
  return this.isArray32Inst

proc intValue(this: Msgpack): int = 
  if this.intValueInstFlag:
    return this.intValueInst
  if this.isInt:
    let intValueInstExpr = int((if this.isPosInt7: this.posInt7Value else: (if this.isNegInt5: this.negInt5Value else: 4919)))
    this.intValueInst = intValueInstExpr
  this.intValueInstFlag = true
  return this.intValueInst

proc strLen(this: Msgpack): int = 
  if this.strLenInstFlag:
    return this.strLenInst
  if this.isStr:
    let strLenInstExpr = int((if this.isFixStr: (this.b1 and 31) else: (if this.isStr8: this.strLen8 else: (if this.isStr16: this.strLen16 else: this.strLen32))))
    this.strLenInst = strLenInstExpr
  this.strLenInstFlag = true
  return this.strLenInst

proc isFixArray(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isFixArrayInstFlag:
    return this.isFixArrayInst
  let isFixArrayInstExpr = bool((this.b1 and 240) == 144)
  this.isFixArrayInst = isFixArrayInstExpr
  this.isFixArrayInstFlag = true
  return this.isFixArrayInst

proc isMap(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isMapInstFlag:
    return this.isMapInst
  let isMapInstExpr = bool( ((this.isFixMap) or (this.isMap16) or (this.isMap32)) )
  this.isMapInst = isMapInstExpr
  this.isMapInstFlag = true
  return this.isMapInst

proc isArray(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isArrayInstFlag:
    return this.isArrayInst
  let isArrayInstExpr = bool( ((this.isFixArray) or (this.isArray16) or (this.isArray32)) )
  this.isArrayInst = isArrayInstExpr
  this.isArrayInstFlag = true
  return this.isArrayInst

proc isFloat(this: Msgpack): bool = 
  if this.isFloatInstFlag:
    return this.isFloatInst
  let isFloatInstExpr = bool( ((this.isFloat32) or (this.isFloat64)) )
  this.isFloatInst = isFloatInstExpr
  this.isFloatInstFlag = true
  return this.isFloatInst

proc isStr8(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isStr8InstFlag:
    return this.isStr8Inst
  let isStr8InstExpr = bool(this.b1 == 217)
  this.isStr8Inst = isStr8InstExpr
  this.isStr8InstFlag = true
  return this.isStr8Inst

proc isFixMap(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isFixMapInstFlag:
    return this.isFixMapInst
  let isFixMapInstExpr = bool((this.b1 and 240) == 128)
  this.isFixMapInst = isFixMapInstExpr
  this.isFixMapInstFlag = true
  return this.isFixMapInst

proc isInt(this: Msgpack): bool = 
  if this.isIntInstFlag:
    return this.isIntInst
  let isIntInstExpr = bool( ((this.isPosInt7) or (this.isNegInt5)) )
  this.isIntInst = isIntInstExpr
  this.isIntInstFlag = true
  return this.isIntInst

proc isBool(this: Msgpack): bool = 
  if this.isBoolInstFlag:
    return this.isBoolInst
  let isBoolInstExpr = bool( ((this.b1 == 194) or (this.b1 == 195)) )
  this.isBoolInst = isBoolInstExpr
  this.isBoolInstFlag = true
  return this.isBoolInst

proc isStr16(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isStr16InstFlag:
    return this.isStr16Inst
  let isStr16InstExpr = bool(this.b1 == 218)
  this.isStr16Inst = isStr16InstExpr
  this.isStr16InstFlag = true
  return this.isStr16Inst

proc isFloat64(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
  ]##
  if this.isFloat64InstFlag:
    return this.isFloat64Inst
  let isFloat64InstExpr = bool(this.b1 == 203)
  this.isFloat64Inst = isFloat64InstExpr
  this.isFloat64InstFlag = true
  return this.isFloat64Inst

proc isMap16(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isMap16InstFlag:
    return this.isMap16Inst
  let isMap16InstExpr = bool(this.b1 == 222)
  this.isMap16Inst = isMap16InstExpr
  this.isMap16InstFlag = true
  return this.isMap16Inst

proc isNegInt5(this: Msgpack): bool = 
  if this.isNegInt5InstFlag:
    return this.isNegInt5Inst
  let isNegInt5InstExpr = bool((this.b1 and 224) == 224)
  this.isNegInt5Inst = isNegInt5InstExpr
  this.isNegInt5InstFlag = true
  return this.isNegInt5Inst

proc posInt7Value(this: Msgpack): uint8 = 
  if this.posInt7ValueInstFlag:
    return this.posInt7ValueInst
  if this.isPosInt7:
    let posInt7ValueInstExpr = uint8(this.b1)
    this.posInt7ValueInst = posInt7ValueInstExpr
  this.posInt7ValueInstFlag = true
  return this.posInt7ValueInst

proc isNil(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil">Source</a>
  ]##
  if this.isNilInstFlag:
    return this.isNilInst
  let isNilInstExpr = bool(this.b1 == 192)
  this.isNilInst = isNilInstExpr
  this.isNilInstFlag = true
  return this.isNilInst

proc floatValue(this: Msgpack): float64 = 
  if this.floatValueInstFlag:
    return this.floatValueInst
  if this.isFloat:
    let floatValueInstExpr = float64((if this.isFloat32: this.float32Value else: this.float64Value))
    this.floatValueInst = floatValueInstExpr
  this.floatValueInstFlag = true
  return this.floatValueInst

proc numArrayElements(this: Msgpack): int = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.numArrayElementsInstFlag:
    return this.numArrayElementsInst
  if this.isArray:
    let numArrayElementsInstExpr = int((if this.isFixArray: (this.b1 and 15) else: (if this.isArray16: this.numArrayElements16 else: this.numArrayElements32)))
    this.numArrayElementsInst = numArrayElementsInstExpr
  this.numArrayElementsInstFlag = true
  return this.numArrayElementsInst

proc negInt5Value(this: Msgpack): int = 
  if this.negInt5ValueInstFlag:
    return this.negInt5ValueInst
  if this.isNegInt5:
    let negInt5ValueInstExpr = int(-((this.b1 and 31)))
    this.negInt5ValueInst = negInt5ValueInstExpr
  this.negInt5ValueInstFlag = true
  return this.negInt5ValueInst

proc boolValue(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool">Source</a>
  ]##
  if this.boolValueInstFlag:
    return this.boolValueInst
  if this.isBool:
    let boolValueInstExpr = bool(this.b1 == 195)
    this.boolValueInst = boolValueInstExpr
  this.boolValueInstFlag = true
  return this.boolValueInst

proc isPosInt7(this: Msgpack): bool = 
  if this.isPosInt7InstFlag:
    return this.isPosInt7Inst
  let isPosInt7InstExpr = bool((this.b1 and 128) == 0)
  this.isPosInt7Inst = isPosInt7InstExpr
  this.isPosInt7InstFlag = true
  return this.isPosInt7Inst

proc isArray16(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isArray16InstFlag:
    return this.isArray16Inst
  let isArray16InstExpr = bool(this.b1 == 220)
  this.isArray16Inst = isArray16InstExpr
  this.isArray16InstFlag = true
  return this.isArray16Inst

proc isStr(this: Msgpack): bool = 
  if this.isStrInstFlag:
    return this.isStrInst
  let isStrInstExpr = bool( ((this.isFixStr) or (this.isStr8) or (this.isStr16) or (this.isStr32)) )
  this.isStrInst = isStrInstExpr
  this.isStrInstFlag = true
  return this.isStrInst

proc isFixStr(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isFixStrInstFlag:
    return this.isFixStrInst
  let isFixStrInstExpr = bool((this.b1 and 224) == 160)
  this.isFixStrInst = isFixStrInstExpr
  this.isFixStrInstFlag = true
  return this.isFixStrInst

proc isStr32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isStr32InstFlag:
    return this.isStr32Inst
  let isStr32InstExpr = bool(this.b1 == 219)
  this.isStr32Inst = isStr32InstExpr
  this.isStr32InstFlag = true
  return this.isStr32Inst

proc numMapElements(this: Msgpack): int = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.numMapElementsInstFlag:
    return this.numMapElementsInst
  if this.isMap:
    let numMapElementsInstExpr = int((if this.isFixMap: (this.b1 and 15) else: (if this.isMap16: this.numMapElements16 else: this.numMapElements32)))
    this.numMapElementsInst = numMapElementsInstExpr
  this.numMapElementsInstFlag = true
  return this.numMapElementsInst

proc isFloat32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
  ]##
  if this.isFloat32InstFlag:
    return this.isFloat32Inst
  let isFloat32InstExpr = bool(this.b1 == 202)
  this.isFloat32Inst = isFloat32InstExpr
  this.isFloat32InstFlag = true
  return this.isFloat32Inst

proc isMap32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isMap32InstFlag:
    return this.isMap32Inst
  let isMap32InstExpr = bool(this.b1 == 223)
  this.isMap32Inst = isMap32InstExpr
  this.isMap32InstFlag = true
  return this.isMap32Inst

proc fromFile*(_: typedesc[Msgpack], filename: string): Msgpack =
  Msgpack.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Msgpack_MapTuple], io: KaitaiStream, root: KaitaiStruct, parent: Msgpack): Msgpack_MapTuple =
  template this: untyped = result
  this = new(Msgpack_MapTuple)
  let root = if root == nil: cast[Msgpack](this) else: cast[Msgpack](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyExpr = Msgpack.read(this.io, this.root, this)
  this.key = keyExpr
  let valueExpr = Msgpack.read(this.io, this.root, this)
  this.value = valueExpr

proc fromFile*(_: typedesc[Msgpack_MapTuple], filename: string): Msgpack_MapTuple =
  Msgpack_MapTuple.read(newKaitaiFileStream(filename), nil, nil)

