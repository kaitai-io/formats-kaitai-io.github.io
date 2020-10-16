import kaitai_struct_nim_runtime
import options

type
  Bson* = ref object of KaitaiStruct
    `len`*: int32
    `fields`*: Bson_ElementsList
    `terminator`*: seq[byte]
    `parent`*: KaitaiStruct
    `rawFields`*: seq[byte]
  Bson_Timestamp* = ref object of KaitaiStruct
    `increment`*: uint32
    `timestamp`*: uint32
    `parent`*: Bson_Element
  Bson_BinData* = ref object of KaitaiStruct
    `len`*: int32
    `subtype`*: Bson_BinData_Subtype
    `content`*: KaitaiStruct
    `parent`*: Bson_Element
    `rawContent`*: seq[byte]
  Bson_BinData_Subtype* = enum
    generic = 0
    function = 1
    byte_array_deprecated = 2
    uuid_deprecated = 3
    uuid = 4
    md5 = 5
    custom = 128
  Bson_BinData_ByteArrayDeprecated* = ref object of KaitaiStruct
    `len`*: int32
    `content`*: seq[byte]
    `parent`*: Bson_BinData
  Bson_ElementsList* = ref object of KaitaiStruct
    `elements`*: seq[Bson_Element]
    `parent`*: Bson
  Bson_Cstring* = ref object of KaitaiStruct
    `str`*: string
    `parent`*: KaitaiStruct
  Bson_String* = ref object of KaitaiStruct
    `len`*: int32
    `str`*: string
    `terminator`*: seq[byte]
    `parent`*: KaitaiStruct
  Bson_Element* = ref object of KaitaiStruct
    `typeByte`*: Bson_Element_BsonType
    `name`*: Bson_Cstring
    `content`*: KaitaiStruct
    `parent`*: Bson_ElementsList
  Bson_Element_BsonType* = enum
    min_key = -1
    end_of_object = 0
    number_double = 1
    string = 2
    document = 3
    array = 4
    bin_data = 5
    undefined = 6
    object_id = 7
    boolean = 8
    utc_datetime = 9
    jst_null = 10
    reg_ex = 11
    db_pointer = 12
    javascript = 13
    symbol = 14
    code_with_scope = 15
    number_int = 16
    timestamp = 17
    number_long = 18
    number_decimal = 19
    max_key = 127
  Bson_DbPointer* = ref object of KaitaiStruct
    `namespace`*: Bson_String
    `id`*: Bson_ObjectId
    `parent`*: Bson_Element
  Bson_U3* = ref object of KaitaiStruct
    `b1`*: uint8
    `b2`*: uint8
    `b3`*: uint8
    `parent`*: Bson_ObjectId
    `valueInst`*: int
  Bson_CodeWithScope* = ref object of KaitaiStruct
    `id`*: int32
    `source`*: Bson_String
    `scope`*: Bson
    `parent`*: Bson_Element
  Bson_F16* = ref object of KaitaiStruct
    `str`*: bool
    `exponent`*: uint64
    `significandHi`*: uint64
    `significandLo`*: uint64
    `parent`*: Bson_Element
  Bson_ObjectId* = ref object of KaitaiStruct
    `epochTime`*: uint32
    `machineId`*: Bson_U3
    `processId`*: uint16
    `counter`*: Bson_U3
    `parent`*: KaitaiStruct
  Bson_RegEx* = ref object of KaitaiStruct
    `pattern`*: Bson_Cstring
    `options`*: Bson_Cstring
    `parent`*: Bson_Element

proc read*(_: typedesc[Bson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson
proc read*(_: typedesc[Bson_Timestamp], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_Timestamp
proc read*(_: typedesc[Bson_BinData], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_BinData
proc read*(_: typedesc[Bson_BinData_ByteArrayDeprecated], io: KaitaiStream, root: KaitaiStruct, parent: Bson_BinData): Bson_BinData_ByteArrayDeprecated
proc read*(_: typedesc[Bson_ElementsList], io: KaitaiStream, root: KaitaiStruct, parent: Bson): Bson_ElementsList
proc read*(_: typedesc[Bson_Cstring], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson_Cstring
proc read*(_: typedesc[Bson_String], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson_String
proc read*(_: typedesc[Bson_Element], io: KaitaiStream, root: KaitaiStruct, parent: Bson_ElementsList): Bson_Element
proc read*(_: typedesc[Bson_DbPointer], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_DbPointer
proc read*(_: typedesc[Bson_U3], io: KaitaiStream, root: KaitaiStruct, parent: Bson_ObjectId): Bson_U3
proc read*(_: typedesc[Bson_CodeWithScope], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_CodeWithScope
proc read*(_: typedesc[Bson_F16], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_F16
proc read*(_: typedesc[Bson_ObjectId], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson_ObjectId
proc read*(_: typedesc[Bson_RegEx], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_RegEx

proc value*(this: Bson_U3): int


##[
BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
  * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
  * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
  * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.

]##
proc read*(_: typedesc[Bson], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson =
  template this: untyped = result
  this = new(Bson)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Total number of bytes comprising the document.
  ]##
  let lenExpr = this.io.readS4le()
  this.len = lenExpr
  let rawFieldsExpr = this.io.readBytes(int((this.len - 5)))
  this.rawFields = rawFieldsExpr
  let rawFieldsIo = newKaitaiStream(rawFieldsExpr)
  let fieldsExpr = Bson_ElementsList.read(rawFieldsIo, this.root, this)
  this.fields = fieldsExpr
  let terminatorExpr = this.io.readBytes(int(1))
  this.terminator = terminatorExpr

proc fromFile*(_: typedesc[Bson], filename: string): Bson =
  Bson.read(newKaitaiFileStream(filename), nil, nil)


##[
Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
]##
proc read*(_: typedesc[Bson_Timestamp], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_Timestamp =
  template this: untyped = result
  this = new(Bson_Timestamp)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let incrementExpr = this.io.readU4le()
  this.increment = incrementExpr
  let timestampExpr = this.io.readU4le()
  this.timestamp = timestampExpr

proc fromFile*(_: typedesc[Bson_Timestamp], filename: string): Bson_Timestamp =
  Bson_Timestamp.read(newKaitaiFileStream(filename), nil, nil)


##[
The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
]##
proc read*(_: typedesc[Bson_BinData], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_BinData =
  template this: untyped = result
  this = new(Bson_BinData)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readS4le()
  this.len = lenExpr
  let subtypeExpr = Bson_BinData_Subtype(this.io.readU1())
  this.subtype = subtypeExpr
  block:
    let on = this.subtype
    if on == bson.byte_array_deprecated:
      let rawContentExpr = this.io.readBytes(int(this.len))
      this.rawContent = rawContentExpr
      let rawContentIo = newKaitaiStream(rawContentExpr)
      let contentExpr = Bson_BinData_ByteArrayDeprecated.read(rawContentIo, this.root, this)
      this.content = contentExpr
    else:
      let contentExpr = this.io.readBytes(int(this.len))
      this.content = contentExpr

proc fromFile*(_: typedesc[Bson_BinData], filename: string): Bson_BinData =
  Bson_BinData.read(newKaitaiFileStream(filename), nil, nil)


##[
The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
]##
proc read*(_: typedesc[Bson_BinData_ByteArrayDeprecated], io: KaitaiStream, root: KaitaiStruct, parent: Bson_BinData): Bson_BinData_ByteArrayDeprecated =
  template this: untyped = result
  this = new(Bson_BinData_ByteArrayDeprecated)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readS4le()
  this.len = lenExpr
  let contentExpr = this.io.readBytes(int(this.len))
  this.content = contentExpr

proc fromFile*(_: typedesc[Bson_BinData_ByteArrayDeprecated], filename: string): Bson_BinData_ByteArrayDeprecated =
  Bson_BinData_ByteArrayDeprecated.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_ElementsList], io: KaitaiStream, root: KaitaiStruct, parent: Bson): Bson_ElementsList =
  template this: untyped = result
  this = new(Bson_ElementsList)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Bson_Element.read(this.io, this.root, this)
      this.elements.add(it)
      inc i

proc fromFile*(_: typedesc[Bson_ElementsList], filename: string): Bson_ElementsList =
  Bson_ElementsList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_Cstring], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson_Cstring =
  template this: untyped = result
  this = new(Bson_Cstring)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  MUST NOT contain '\x00', hence it is not full UTF-8.
  ]##
  let strExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.str = strExpr

proc fromFile*(_: typedesc[Bson_Cstring], filename: string): Bson_Cstring =
  Bson_Cstring.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_String], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson_String =
  template this: untyped = result
  this = new(Bson_String)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readS4le()
  this.len = lenExpr
  let strExpr = encode(this.io.readBytes(int((this.len - 1))), "UTF-8")
  this.str = strExpr
  let terminatorExpr = this.io.readBytes(int(1))
  this.terminator = terminatorExpr

proc fromFile*(_: typedesc[Bson_String], filename: string): Bson_String =
  Bson_String.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_Element], io: KaitaiStream, root: KaitaiStruct, parent: Bson_ElementsList): Bson_Element =
  template this: untyped = result
  this = new(Bson_Element)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeByteExpr = Bson_Element_BsonType(this.io.readU1())
  this.typeByte = typeByteExpr
  let nameExpr = Bson_Cstring.read(this.io, this.root, this)
  this.name = nameExpr
  block:
    let on = this.typeByte
    if on == bson.code_with_scope:
      let contentExpr = Bson_CodeWithScope.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.reg_ex:
      let contentExpr = Bson_RegEx.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.number_double:
      let contentExpr = KaitaiStruct(this.io.readF8le())
      this.content = contentExpr
    elif on == bson.symbol:
      let contentExpr = Bson_String.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.timestamp:
      let contentExpr = Bson_Timestamp.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.number_int:
      let contentExpr = KaitaiStruct(this.io.readS4le())
      this.content = contentExpr
    elif on == bson.document:
      let contentExpr = Bson.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.object_id:
      let contentExpr = Bson_ObjectId.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.javascript:
      let contentExpr = Bson_String.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.utc_datetime:
      let contentExpr = KaitaiStruct(this.io.readS8le())
      this.content = contentExpr
    elif on == bson.boolean:
      let contentExpr = KaitaiStruct(this.io.readU1())
      this.content = contentExpr
    elif on == bson.number_long:
      let contentExpr = KaitaiStruct(this.io.readS8le())
      this.content = contentExpr
    elif on == bson.bin_data:
      let contentExpr = Bson_BinData.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.string:
      let contentExpr = Bson_String.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.db_pointer:
      let contentExpr = Bson_DbPointer.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.array:
      let contentExpr = Bson.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == bson.number_decimal:
      let contentExpr = Bson_F16.read(this.io, this.root, this)
      this.content = contentExpr

proc fromFile*(_: typedesc[Bson_Element], filename: string): Bson_Element =
  Bson_Element.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_DbPointer], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_DbPointer =
  template this: untyped = result
  this = new(Bson_DbPointer)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let namespaceExpr = Bson_String.read(this.io, this.root, this)
  this.namespace = namespaceExpr
  let idExpr = Bson_ObjectId.read(this.io, this.root, this)
  this.id = idExpr

proc fromFile*(_: typedesc[Bson_DbPointer], filename: string): Bson_DbPointer =
  Bson_DbPointer.read(newKaitaiFileStream(filename), nil, nil)


##[
Implements unsigned 24-bit (3 byte) integer.

]##
proc read*(_: typedesc[Bson_U3], io: KaitaiStream, root: KaitaiStruct, parent: Bson_ObjectId): Bson_U3 =
  template this: untyped = result
  this = new(Bson_U3)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  let b2Expr = this.io.readU1()
  this.b2 = b2Expr
  let b3Expr = this.io.readU1()
  this.b3 = b3Expr

proc value(this: Bson_U3): int = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = int(((this.b1 or (this.b2 shl 8)) or (this.b3 shl 16)))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[Bson_U3], filename: string): Bson_U3 =
  Bson_U3.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_CodeWithScope], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_CodeWithScope =
  template this: untyped = result
  this = new(Bson_CodeWithScope)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readS4le()
  this.id = idExpr
  let sourceExpr = Bson_String.read(this.io, this.root, this)
  this.source = sourceExpr

  ##[
  mapping from identifiers to values, representing the scope in which the string should be evaluated.
  ]##
  let scopeExpr = Bson.read(this.io, this.root, this)
  this.scope = scopeExpr

proc fromFile*(_: typedesc[Bson_CodeWithScope], filename: string): Bson_CodeWithScope =
  Bson_CodeWithScope.read(newKaitaiFileStream(filename), nil, nil)


##[
128-bit IEEE 754-2008 decimal floating point
]##
proc read*(_: typedesc[Bson_F16], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_F16 =
  template this: untyped = result
  this = new(Bson_F16)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let strExpr = this.io.readBitsIntBe(1) != 0
  this.str = strExpr
  let exponentExpr = this.io.readBitsIntBe(15)
  this.exponent = exponentExpr
  let significandHiExpr = this.io.readBitsIntBe(49)
  this.significandHi = significandHiExpr
  alignToByte(this.io)
  let significandLoExpr = this.io.readU8le()
  this.significandLo = significandLoExpr

proc fromFile*(_: typedesc[Bson_F16], filename: string): Bson_F16 =
  Bson_F16.read(newKaitaiFileStream(filename), nil, nil)


##[
https://docs.mongodb.com/manual/reference/method/ObjectId/
]##
proc read*(_: typedesc[Bson_ObjectId], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Bson_ObjectId =
  template this: untyped = result
  this = new(Bson_ObjectId)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  seconds since the Unix epoch
  ]##
  let epochTimeExpr = this.io.readU4le()
  this.epochTime = epochTimeExpr
  let machineIdExpr = Bson_U3.read(this.io, this.root, this)
  this.machineId = machineIdExpr
  let processIdExpr = this.io.readU2le()
  this.processId = processIdExpr

  ##[
  counter, starting with a random value.
  ]##
  let counterExpr = Bson_U3.read(this.io, this.root, this)
  this.counter = counterExpr

proc fromFile*(_: typedesc[Bson_ObjectId], filename: string): Bson_ObjectId =
  Bson_ObjectId.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Bson_RegEx], io: KaitaiStream, root: KaitaiStruct, parent: Bson_Element): Bson_RegEx =
  template this: untyped = result
  this = new(Bson_RegEx)
  let root = if root == nil: cast[Bson](this) else: cast[Bson](root)
  this.io = io
  this.root = root
  this.parent = parent

  let patternExpr = Bson_Cstring.read(this.io, this.root, this)
  this.pattern = patternExpr
  let optionsExpr = Bson_Cstring.read(this.io, this.root, this)
  this.options = optionsExpr

proc fromFile*(_: typedesc[Bson_RegEx], filename: string): Bson_RegEx =
  Bson_RegEx.read(newKaitaiFileStream(filename), nil, nil)

