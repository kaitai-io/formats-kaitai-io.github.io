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
    `isArray32Inst`*: bool
    `intValueInst`*: int
    `strLenInst`*: int
    `isFixArrayInst`*: bool
    `isMapInst`*: bool
    `isArrayInst`*: bool
    `isFloatInst`*: bool
    `isStr8Inst`*: bool
    `isFixMapInst`*: bool
    `isIntInst`*: bool
    `isBoolInst`*: bool
    `isStr16Inst`*: bool
    `isFloat64Inst`*: bool
    `isMap16Inst`*: bool
    `isNegInt5Inst`*: bool
    `posInt7ValueInst`*: uint8
    `isNilInst`*: bool
    `floatValueInst`*: float64
    `numArrayElementsInst`*: int
    `negInt5ValueInst`*: int
    `boolValueInst`*: bool
    `isPosInt7Inst`*: bool
    `isArray16Inst`*: bool
    `isStrInst`*: bool
    `isFixStrInst`*: bool
    `isStr32Inst`*: bool
    `numMapElementsInst`*: int
    `isFloat32Inst`*: bool
    `isMap32Inst`*: bool
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
  if this.isArray32Inst != nil:
    return this.isArray32Inst
  let isArray32InstExpr = bool(this.b1 == 221)
  this.isArray32Inst = isArray32InstExpr
  if this.isArray32Inst != nil:
    return this.isArray32Inst

proc intValue(this: Msgpack): int = 
  if this.intValueInst != nil:
    return this.intValueInst
  if this.isInt:
    let intValueInstExpr = int((if this.isPosInt7: this.posInt7Value else: (if this.isNegInt5: this.negInt5Value else: 4919)))
    this.intValueInst = intValueInstExpr
  if this.intValueInst != nil:
    return this.intValueInst

proc strLen(this: Msgpack): int = 
  if this.strLenInst != nil:
    return this.strLenInst
  if this.isStr:
    let strLenInstExpr = int((if this.isFixStr: (this.b1 and 31) else: (if this.isStr8: this.strLen8 else: (if this.isStr16: this.strLen16 else: this.strLen32))))
    this.strLenInst = strLenInstExpr
  if this.strLenInst != nil:
    return this.strLenInst

proc isFixArray(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isFixArrayInst != nil:
    return this.isFixArrayInst
  let isFixArrayInstExpr = bool((this.b1 and 240) == 144)
  this.isFixArrayInst = isFixArrayInstExpr
  if this.isFixArrayInst != nil:
    return this.isFixArrayInst

proc isMap(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isMapInst != nil:
    return this.isMapInst
  let isMapInstExpr = bool( ((this.isFixMap) or (this.isMap16) or (this.isMap32)) )
  this.isMapInst = isMapInstExpr
  if this.isMapInst != nil:
    return this.isMapInst

proc isArray(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isArrayInst != nil:
    return this.isArrayInst
  let isArrayInstExpr = bool( ((this.isFixArray) or (this.isArray16) or (this.isArray32)) )
  this.isArrayInst = isArrayInstExpr
  if this.isArrayInst != nil:
    return this.isArrayInst

proc isFloat(this: Msgpack): bool = 
  if this.isFloatInst != nil:
    return this.isFloatInst
  let isFloatInstExpr = bool( ((this.isFloat32) or (this.isFloat64)) )
  this.isFloatInst = isFloatInstExpr
  if this.isFloatInst != nil:
    return this.isFloatInst

proc isStr8(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isStr8Inst != nil:
    return this.isStr8Inst
  let isStr8InstExpr = bool(this.b1 == 217)
  this.isStr8Inst = isStr8InstExpr
  if this.isStr8Inst != nil:
    return this.isStr8Inst

proc isFixMap(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isFixMapInst != nil:
    return this.isFixMapInst
  let isFixMapInstExpr = bool((this.b1 and 240) == 128)
  this.isFixMapInst = isFixMapInstExpr
  if this.isFixMapInst != nil:
    return this.isFixMapInst

proc isInt(this: Msgpack): bool = 
  if this.isIntInst != nil:
    return this.isIntInst
  let isIntInstExpr = bool( ((this.isPosInt7) or (this.isNegInt5)) )
  this.isIntInst = isIntInstExpr
  if this.isIntInst != nil:
    return this.isIntInst

proc isBool(this: Msgpack): bool = 
  if this.isBoolInst != nil:
    return this.isBoolInst
  let isBoolInstExpr = bool( ((this.b1 == 194) or (this.b1 == 195)) )
  this.isBoolInst = isBoolInstExpr
  if this.isBoolInst != nil:
    return this.isBoolInst

proc isStr16(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isStr16Inst != nil:
    return this.isStr16Inst
  let isStr16InstExpr = bool(this.b1 == 218)
  this.isStr16Inst = isStr16InstExpr
  if this.isStr16Inst != nil:
    return this.isStr16Inst

proc isFloat64(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
  ]##
  if this.isFloat64Inst != nil:
    return this.isFloat64Inst
  let isFloat64InstExpr = bool(this.b1 == 203)
  this.isFloat64Inst = isFloat64InstExpr
  if this.isFloat64Inst != nil:
    return this.isFloat64Inst

proc isMap16(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isMap16Inst != nil:
    return this.isMap16Inst
  let isMap16InstExpr = bool(this.b1 == 222)
  this.isMap16Inst = isMap16InstExpr
  if this.isMap16Inst != nil:
    return this.isMap16Inst

proc isNegInt5(this: Msgpack): bool = 
  if this.isNegInt5Inst != nil:
    return this.isNegInt5Inst
  let isNegInt5InstExpr = bool((this.b1 and 224) == 224)
  this.isNegInt5Inst = isNegInt5InstExpr
  if this.isNegInt5Inst != nil:
    return this.isNegInt5Inst

proc posInt7Value(this: Msgpack): uint8 = 
  if this.posInt7ValueInst != nil:
    return this.posInt7ValueInst
  if this.isPosInt7:
    let posInt7ValueInstExpr = uint8(this.b1)
    this.posInt7ValueInst = posInt7ValueInstExpr
  if this.posInt7ValueInst != nil:
    return this.posInt7ValueInst

proc isNil(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil">Source</a>
  ]##
  if this.isNilInst != nil:
    return this.isNilInst
  let isNilInstExpr = bool(this.b1 == 192)
  this.isNilInst = isNilInstExpr
  if this.isNilInst != nil:
    return this.isNilInst

proc floatValue(this: Msgpack): float64 = 
  if this.floatValueInst != nil:
    return this.floatValueInst
  if this.isFloat:
    let floatValueInstExpr = float64((if this.isFloat32: this.float32Value else: this.float64Value))
    this.floatValueInst = floatValueInstExpr
  if this.floatValueInst != nil:
    return this.floatValueInst

proc numArrayElements(this: Msgpack): int = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.numArrayElementsInst != nil:
    return this.numArrayElementsInst
  if this.isArray:
    let numArrayElementsInstExpr = int((if this.isFixArray: (this.b1 and 15) else: (if this.isArray16: this.numArrayElements16 else: this.numArrayElements32)))
    this.numArrayElementsInst = numArrayElementsInstExpr
  if this.numArrayElementsInst != nil:
    return this.numArrayElementsInst

proc negInt5Value(this: Msgpack): int = 
  if this.negInt5ValueInst != nil:
    return this.negInt5ValueInst
  if this.isNegInt5:
    let negInt5ValueInstExpr = int(-((this.b1 and 31)))
    this.negInt5ValueInst = negInt5ValueInstExpr
  if this.negInt5ValueInst != nil:
    return this.negInt5ValueInst

proc boolValue(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool">Source</a>
  ]##
  if this.boolValueInst != nil:
    return this.boolValueInst
  if this.isBool:
    let boolValueInstExpr = bool(this.b1 == 195)
    this.boolValueInst = boolValueInstExpr
  if this.boolValueInst != nil:
    return this.boolValueInst

proc isPosInt7(this: Msgpack): bool = 
  if this.isPosInt7Inst != nil:
    return this.isPosInt7Inst
  let isPosInt7InstExpr = bool((this.b1 and 128) == 0)
  this.isPosInt7Inst = isPosInt7InstExpr
  if this.isPosInt7Inst != nil:
    return this.isPosInt7Inst

proc isArray16(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
  ]##
  if this.isArray16Inst != nil:
    return this.isArray16Inst
  let isArray16InstExpr = bool(this.b1 == 220)
  this.isArray16Inst = isArray16InstExpr
  if this.isArray16Inst != nil:
    return this.isArray16Inst

proc isStr(this: Msgpack): bool = 
  if this.isStrInst != nil:
    return this.isStrInst
  let isStrInstExpr = bool( ((this.isFixStr) or (this.isStr8) or (this.isStr16) or (this.isStr32)) )
  this.isStrInst = isStrInstExpr
  if this.isStrInst != nil:
    return this.isStrInst

proc isFixStr(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isFixStrInst != nil:
    return this.isFixStrInst
  let isFixStrInstExpr = bool((this.b1 and 224) == 160)
  this.isFixStrInst = isFixStrInstExpr
  if this.isFixStrInst != nil:
    return this.isFixStrInst

proc isStr32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
  ]##
  if this.isStr32Inst != nil:
    return this.isStr32Inst
  let isStr32InstExpr = bool(this.b1 == 219)
  this.isStr32Inst = isStr32InstExpr
  if this.isStr32Inst != nil:
    return this.isStr32Inst

proc numMapElements(this: Msgpack): int = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.numMapElementsInst != nil:
    return this.numMapElementsInst
  if this.isMap:
    let numMapElementsInstExpr = int((if this.isFixMap: (this.b1 and 15) else: (if this.isMap16: this.numMapElements16 else: this.numMapElements32)))
    this.numMapElementsInst = numMapElementsInstExpr
  if this.numMapElementsInst != nil:
    return this.numMapElementsInst

proc isFloat32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
  ]##
  if this.isFloat32Inst != nil:
    return this.isFloat32Inst
  let isFloat32InstExpr = bool(this.b1 == 202)
  this.isFloat32Inst = isFloat32InstExpr
  if this.isFloat32Inst != nil:
    return this.isFloat32Inst

proc isMap32(this: Msgpack): bool = 

  ##[
  @see <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
  ]##
  if this.isMap32Inst != nil:
    return this.isMap32Inst
  let isMap32InstExpr = bool(this.b1 == 223)
  this.isMap32Inst = isMap32InstExpr
  if this.isMap32Inst != nil:
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

