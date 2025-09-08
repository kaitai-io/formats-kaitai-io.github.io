import kaitai_struct_nim_runtime
import options

type
  PhpSerializedValue* = ref object of KaitaiStruct
    `type`*: PhpSerializedValue_ValueType
    `contents`*: KaitaiStruct
    `parent`*: KaitaiStruct
  PhpSerializedValue_BoolValue* = enum
    false = 48
    true = 49
  PhpSerializedValue_ValueType* = enum
    custom_serialized_object = 67
    null = 78
    object = 79
    variable_reference = 82
    php_6_string = 83
    array = 97
    bool = 98
    float = 100
    int = 105
    php_3_object = 111
    object_reference = 114
    string = 115
  PhpSerializedValue_ArrayContents* = ref object of KaitaiStruct
    `colon`*: seq[byte]
    `elements`*: PhpSerializedValue_CountPrefixedMapping
    `parent`*: PhpSerializedValue
  PhpSerializedValue_BoolContents* = ref object of KaitaiStruct
    `colon`*: seq[byte]
    `valueDec`*: PhpSerializedValue_BoolValue
    `semicolon`*: seq[byte]
    `parent`*: PhpSerializedValue
    `valueInst`: bool
    `valueInstFlag`: bool
  PhpSerializedValue_CountPrefixedMapping* = ref object of KaitaiStruct
    `numEntriesDec`*: string
    `openingBrace`*: seq[byte]
    `entries`*: seq[PhpSerializedValue_MappingEntry]
    `closingBrace`*: seq[byte]
    `parent`*: KaitaiStruct
    `numEntriesInst`: int
    `numEntriesInstFlag`: bool
  PhpSerializedValue_CustomSerializedObjectContents* = ref object of KaitaiStruct
    `colon1`*: seq[byte]
    `className`*: PhpSerializedValue_LengthPrefixedQuotedString
    `colon2`*: seq[byte]
    `lenDataDec`*: string
    `openingBrace`*: seq[byte]
    `data`*: seq[byte]
    `closingQuote`*: seq[byte]
    `parent`*: PhpSerializedValue
    `lenDataInst`: int
    `lenDataInstFlag`: bool
  PhpSerializedValue_FloatContents* = ref object of KaitaiStruct
    `colon`*: seq[byte]
    `valueDec`*: string
    `parent`*: PhpSerializedValue
  PhpSerializedValue_IntContents* = ref object of KaitaiStruct
    `colon`*: seq[byte]
    `valueDec`*: string
    `parent`*: PhpSerializedValue
    `valueInst`: int
    `valueInstFlag`: bool
  PhpSerializedValue_LengthPrefixedQuotedString* = ref object of KaitaiStruct
    `lenDataDec`*: string
    `openingQuote`*: seq[byte]
    `data`*: seq[byte]
    `closingQuote`*: seq[byte]
    `parent`*: KaitaiStruct
    `lenDataInst`: int
    `lenDataInstFlag`: bool
  PhpSerializedValue_MappingEntry* = ref object of KaitaiStruct
    `key`*: PhpSerializedValue
    `value`*: PhpSerializedValue
    `parent`*: PhpSerializedValue_CountPrefixedMapping
  PhpSerializedValue_NullContents* = ref object of KaitaiStruct
    `semicolon`*: seq[byte]
    `parent`*: PhpSerializedValue
  PhpSerializedValue_ObjectContents* = ref object of KaitaiStruct
    `colon1`*: seq[byte]
    `className`*: PhpSerializedValue_LengthPrefixedQuotedString
    `colon2`*: seq[byte]
    `properties`*: PhpSerializedValue_CountPrefixedMapping
    `parent`*: PhpSerializedValue
  PhpSerializedValue_Php3ObjectContents* = ref object of KaitaiStruct
    `colon`*: seq[byte]
    `properties`*: PhpSerializedValue_CountPrefixedMapping
    `parent`*: PhpSerializedValue
  PhpSerializedValue_StringContents* = ref object of KaitaiStruct
    `colon`*: seq[byte]
    `string`*: PhpSerializedValue_LengthPrefixedQuotedString
    `semicolon`*: seq[byte]
    `parent`*: PhpSerializedValue
    `valueInst`: seq[byte]
    `valueInstFlag`: bool

proc read*(_: typedesc[PhpSerializedValue], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PhpSerializedValue
proc read*(_: typedesc[PhpSerializedValue_ArrayContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_ArrayContents
proc read*(_: typedesc[PhpSerializedValue_BoolContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_BoolContents
proc read*(_: typedesc[PhpSerializedValue_CountPrefixedMapping], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PhpSerializedValue_CountPrefixedMapping
proc read*(_: typedesc[PhpSerializedValue_CustomSerializedObjectContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_CustomSerializedObjectContents
proc read*(_: typedesc[PhpSerializedValue_FloatContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_FloatContents
proc read*(_: typedesc[PhpSerializedValue_IntContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_IntContents
proc read*(_: typedesc[PhpSerializedValue_LengthPrefixedQuotedString], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PhpSerializedValue_LengthPrefixedQuotedString
proc read*(_: typedesc[PhpSerializedValue_MappingEntry], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue_CountPrefixedMapping): PhpSerializedValue_MappingEntry
proc read*(_: typedesc[PhpSerializedValue_NullContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_NullContents
proc read*(_: typedesc[PhpSerializedValue_ObjectContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_ObjectContents
proc read*(_: typedesc[PhpSerializedValue_Php3ObjectContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_Php3ObjectContents
proc read*(_: typedesc[PhpSerializedValue_StringContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_StringContents

proc value*(this: PhpSerializedValue_BoolContents): bool
proc numEntries*(this: PhpSerializedValue_CountPrefixedMapping): int
proc lenData*(this: PhpSerializedValue_CustomSerializedObjectContents): int
proc value*(this: PhpSerializedValue_IntContents): int
proc lenData*(this: PhpSerializedValue_LengthPrefixedQuotedString): int
proc value*(this: PhpSerializedValue_StringContents): seq[byte]


##[
A serialized PHP value, in the format used by PHP's built-in `serialize` and
`unserialize` functions. This format closely mirrors PHP's data model:
it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
associative arrays, objects, and recursive data structures using references.
The only PHP values not supported by this format are *resources*,
which usually correspond to native file or connection handles and cannot be
meaningfully serialized.

There is no official documentation for this data format;
this spec was created based on the PHP source code and the behavior of
`serialize`/`unserialize`. PHP makes no guarantees about compatibility of
serialized data between PHP versions, but in practice, the format has
remained fully backwards-compatible - values serialized by an older
PHP version can be unserialized on any newer PHP version.
This spec supports serialized values from PHP 7.3 or any earlier version.

@see <a href="https://www.php.net/manual/en/function.serialize.php">Source</a>
@see <a href="https://www.php.net/manual/en/function.serialize.php#66147">Source</a>
@see <a href="https://www.php.net/manual/en/function.unserialize.php">Source</a>
@see <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re">Source</a>
@see <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822">Source</a>
]##
proc read*(_: typedesc[PhpSerializedValue], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PhpSerializedValue =
  template this: untyped = result
  this = new(PhpSerializedValue)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  A single-character code indicating the type of the serialized value.
  ]##
  let typeExpr = PhpSerializedValue_ValueType(this.io.readU1())
  this.type = typeExpr

  ##[
  The contents of the serialized value, which vary depending on the type.

  ]##
  block:
    let on = this.type
    if on == php_serialized_value.array:
      let contentsExpr = PhpSerializedValue_ArrayContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.bool:
      let contentsExpr = PhpSerializedValue_BoolContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.custom_serialized_object:
      let contentsExpr = PhpSerializedValue_CustomSerializedObjectContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.float:
      let contentsExpr = PhpSerializedValue_FloatContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.int:
      let contentsExpr = PhpSerializedValue_IntContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.null:
      let contentsExpr = PhpSerializedValue_NullContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.object:
      let contentsExpr = PhpSerializedValue_ObjectContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.object_reference:
      let contentsExpr = PhpSerializedValue_IntContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.php_3_object:
      let contentsExpr = PhpSerializedValue_Php3ObjectContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.php_6_string:
      let contentsExpr = PhpSerializedValue_StringContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.string:
      let contentsExpr = PhpSerializedValue_StringContents.read(this.io, this.root, this)
      this.contents = contentsExpr
    elif on == php_serialized_value.variable_reference:
      let contentsExpr = PhpSerializedValue_IntContents.read(this.io, this.root, this)
      this.contents = contentsExpr

proc fromFile*(_: typedesc[PhpSerializedValue], filename: string): PhpSerializedValue =
  PhpSerializedValue.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of an array value.
]##
proc read*(_: typedesc[PhpSerializedValue_ArrayContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_ArrayContents =
  template this: untyped = result
  this = new(PhpSerializedValue_ArrayContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colonExpr = this.io.readBytes(int(1))
  this.colon = colonExpr

  ##[
  The array's elements. Keys must be of type `int` or `string`,
values may have any type.

  ]##
  let elementsExpr = PhpSerializedValue_CountPrefixedMapping.read(this.io, this.root, this)
  this.elements = elementsExpr

proc fromFile*(_: typedesc[PhpSerializedValue_ArrayContents], filename: string): PhpSerializedValue_ArrayContents =
  PhpSerializedValue_ArrayContents.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of a boolean value (`value_type::bool`).
]##
proc read*(_: typedesc[PhpSerializedValue_BoolContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_BoolContents =
  template this: untyped = result
  this = new(PhpSerializedValue_BoolContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colonExpr = this.io.readBytes(int(1))
  this.colon = colonExpr

  ##[
  The value of the `bool`: `0` for `false` or `1` for `true`.

  ]##
  let valueDecExpr = PhpSerializedValue_BoolValue(this.io.readU1())
  this.valueDec = valueDecExpr
  let semicolonExpr = this.io.readBytes(int(1))
  this.semicolon = semicolonExpr

proc value(this: PhpSerializedValue_BoolContents): bool = 

  ##[
  The value of the `bool`, parsed as a boolean.
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = bool(this.valueDec == php_serialized_value.true)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[PhpSerializedValue_BoolContents], filename: string): PhpSerializedValue_BoolContents =
  PhpSerializedValue_BoolContents.read(newKaitaiFileStream(filename), nil, nil)


##[
A mapping (a sequence of key-value pairs) prefixed with its size.
]##
proc read*(_: typedesc[PhpSerializedValue_CountPrefixedMapping], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PhpSerializedValue_CountPrefixedMapping =
  template this: untyped = result
  this = new(PhpSerializedValue_CountPrefixedMapping)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The number of key-value pairs in the mapping, in ASCII decimal.
  ]##
  let numEntriesDecExpr = encode(this.io.readBytesTerm(58, false, true, true), "ASCII")
  this.numEntriesDec = numEntriesDecExpr
  let openingBraceExpr = this.io.readBytes(int(1))
  this.openingBrace = openingBraceExpr

  ##[
  The key-value pairs contained in the mapping.
  ]##
  for i in 0 ..< int(this.numEntries):
    let it = PhpSerializedValue_MappingEntry.read(this.io, this.root, this)
    this.entries.add(it)
  let closingBraceExpr = this.io.readBytes(int(1))
  this.closingBrace = closingBraceExpr

proc numEntries(this: PhpSerializedValue_CountPrefixedMapping): int = 

  ##[
  The number of key-value pairs in the mapping, parsed as an integer.

  ]##
  if this.numEntriesInstFlag:
    return this.numEntriesInst
  let numEntriesInstExpr = int(this.numEntriesDec.parseInt(10))
  this.numEntriesInst = numEntriesInstExpr
  this.numEntriesInstFlag = true
  return this.numEntriesInst

proc fromFile*(_: typedesc[PhpSerializedValue_CountPrefixedMapping], filename: string): PhpSerializedValue_CountPrefixedMapping =
  PhpSerializedValue_CountPrefixedMapping.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of an object value that implements a custom
serialized format using `Serializable`.

]##
proc read*(_: typedesc[PhpSerializedValue_CustomSerializedObjectContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_CustomSerializedObjectContents =
  template this: untyped = result
  this = new(PhpSerializedValue_CustomSerializedObjectContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colon1Expr = this.io.readBytes(int(1))
  this.colon1 = colon1Expr

  ##[
  The name of the object's class.
  ]##
  let classNameExpr = PhpSerializedValue_LengthPrefixedQuotedString.read(this.io, this.root, this)
  this.className = classNameExpr
  let colon2Expr = this.io.readBytes(int(1))
  this.colon2 = colon2Expr

  ##[
  The length of the serialized data in bytes, in ASCII decimal.
The braces are not counted in this size number.

  ]##
  let lenDataDecExpr = encode(this.io.readBytesTerm(58, false, true, true), "ASCII")
  this.lenDataDec = lenDataDecExpr
  let openingBraceExpr = this.io.readBytes(int(1))
  this.openingBrace = openingBraceExpr

  ##[
  The custom serialized data. The braces are not included.

Although the surrounding braces make it look like a regular
serialized object, this field is actually more similar to a string:
it can contain arbitrary data that is not required to follow
any common structure.

  ]##
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr
  let closingQuoteExpr = this.io.readBytes(int(1))
  this.closingQuote = closingQuoteExpr

proc lenData(this: PhpSerializedValue_CustomSerializedObjectContents): int = 

  ##[
  The length of the serialized data in bytes, parsed as an integer.
The braces are not counted in this length number.

  ]##
  if this.lenDataInstFlag:
    return this.lenDataInst
  let lenDataInstExpr = int(this.lenDataDec.parseInt(10))
  this.lenDataInst = lenDataInstExpr
  this.lenDataInstFlag = true
  return this.lenDataInst

proc fromFile*(_: typedesc[PhpSerializedValue_CustomSerializedObjectContents], filename: string): PhpSerializedValue_CustomSerializedObjectContents =
  PhpSerializedValue_CustomSerializedObjectContents.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of a floating-point value.
]##
proc read*(_: typedesc[PhpSerializedValue_FloatContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_FloatContents =
  template this: untyped = result
  this = new(PhpSerializedValue_FloatContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colonExpr = this.io.readBytes(int(1))
  this.colon = colonExpr

  ##[
  The value of the `float`, in ASCII decimal, as generated by PHP's
usual double-to-string conversion. In particular, this means that:

* A decimal point may not be included (for integral numbers)
* The number may use exponent notation (e. g. `1.0E+16`)
* Positive and negative infinity are represented as `INF`
  and `-INF`, respectively
* Not-a-number is represented as `NAN`

  ]##
  let valueDecExpr = encode(this.io.readBytesTerm(59, false, true, true), "ASCII")
  this.valueDec = valueDecExpr

proc fromFile*(_: typedesc[PhpSerializedValue_FloatContents], filename: string): PhpSerializedValue_FloatContents =
  PhpSerializedValue_FloatContents.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of an integer-like value:
either an actual integer (`value_type::int`) or a reference
(`value_type::variable_reference`, `value_type::object_reference`).

]##
proc read*(_: typedesc[PhpSerializedValue_IntContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_IntContents =
  template this: untyped = result
  this = new(PhpSerializedValue_IntContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colonExpr = this.io.readBytes(int(1))
  this.colon = colonExpr

  ##[
  The value of the `int`, in ASCII decimal.
  ]##
  let valueDecExpr = encode(this.io.readBytesTerm(59, false, true, true), "ASCII")
  this.valueDec = valueDecExpr

proc value(this: PhpSerializedValue_IntContents): int = 

  ##[
  The value of the `int`, parsed as an integer.
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int(this.valueDec.parseInt(10))
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[PhpSerializedValue_IntContents], filename: string): PhpSerializedValue_IntContents =
  PhpSerializedValue_IntContents.read(newKaitaiFileStream(filename), nil, nil)


##[
A quoted string prefixed with its length.

Despite the quotes surrounding the string data, it can contain
arbitrary bytes, which are never escaped in any way.
This does not cause any ambiguities when parsing - the bounds of
the string are determined only by the length field, not by the quotes.

]##
proc read*(_: typedesc[PhpSerializedValue_LengthPrefixedQuotedString], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PhpSerializedValue_LengthPrefixedQuotedString =
  template this: untyped = result
  this = new(PhpSerializedValue_LengthPrefixedQuotedString)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The length of the string's data in bytes, in ASCII decimal.
The quotes are not counted in this length number.

  ]##
  let lenDataDecExpr = encode(this.io.readBytesTerm(58, false, true, true), "ASCII")
  this.lenDataDec = lenDataDecExpr
  let openingQuoteExpr = this.io.readBytes(int(1))
  this.openingQuote = openingQuoteExpr

  ##[
  The data contained in the string. The quotes are not included.
  ]##
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr
  let closingQuoteExpr = this.io.readBytes(int(1))
  this.closingQuote = closingQuoteExpr

proc lenData(this: PhpSerializedValue_LengthPrefixedQuotedString): int = 

  ##[
  The length of the string's contents in bytes, parsed as an integer.
The quotes are not counted in this size number.

  ]##
  if this.lenDataInstFlag:
    return this.lenDataInst
  let lenDataInstExpr = int(this.lenDataDec.parseInt(10))
  this.lenDataInst = lenDataInstExpr
  this.lenDataInstFlag = true
  return this.lenDataInst

proc fromFile*(_: typedesc[PhpSerializedValue_LengthPrefixedQuotedString], filename: string): PhpSerializedValue_LengthPrefixedQuotedString =
  PhpSerializedValue_LengthPrefixedQuotedString.read(newKaitaiFileStream(filename), nil, nil)


##[
A mapping entry consisting of a key and a value.
]##
proc read*(_: typedesc[PhpSerializedValue_MappingEntry], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue_CountPrefixedMapping): PhpSerializedValue_MappingEntry =
  template this: untyped = result
  this = new(PhpSerializedValue_MappingEntry)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The key of the entry.
  ]##
  let keyExpr = PhpSerializedValue.read(this.io, this.root, this)
  this.key = keyExpr

  ##[
  The value of the entry.
  ]##
  let valueExpr = PhpSerializedValue.read(this.io, this.root, this)
  this.value = valueExpr

proc fromFile*(_: typedesc[PhpSerializedValue_MappingEntry], filename: string): PhpSerializedValue_MappingEntry =
  PhpSerializedValue_MappingEntry.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of a null value (`value_type::null`). This structure
contains no actual data, since there is only a single `NULL` value.

]##
proc read*(_: typedesc[PhpSerializedValue_NullContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_NullContents =
  template this: untyped = result
  this = new(PhpSerializedValue_NullContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let semicolonExpr = this.io.readBytes(int(1))
  this.semicolon = semicolonExpr

proc fromFile*(_: typedesc[PhpSerializedValue_NullContents], filename: string): PhpSerializedValue_NullContents =
  PhpSerializedValue_NullContents.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of an object value serialized in the default format.
Unlike its PHP 3 counterpart, it contains a class name.

]##
proc read*(_: typedesc[PhpSerializedValue_ObjectContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_ObjectContents =
  template this: untyped = result
  this = new(PhpSerializedValue_ObjectContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colon1Expr = this.io.readBytes(int(1))
  this.colon1 = colon1Expr

  ##[
  The name of the object's class.
  ]##
  let classNameExpr = PhpSerializedValue_LengthPrefixedQuotedString.read(this.io, this.root, this)
  this.className = classNameExpr
  let colon2Expr = this.io.readBytes(int(1))
  this.colon2 = colon2Expr

  ##[
  The object's properties. Keys ust be of type `string`,
values may have any type.

  ]##
  let propertiesExpr = PhpSerializedValue_CountPrefixedMapping.read(this.io, this.root, this)
  this.properties = propertiesExpr

proc fromFile*(_: typedesc[PhpSerializedValue_ObjectContents], filename: string): PhpSerializedValue_ObjectContents =
  PhpSerializedValue_ObjectContents.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
and above, it does not contain a class name.

]##
proc read*(_: typedesc[PhpSerializedValue_Php3ObjectContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_Php3ObjectContents =
  template this: untyped = result
  this = new(PhpSerializedValue_Php3ObjectContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colonExpr = this.io.readBytes(int(1))
  this.colon = colonExpr

  ##[
  The object's properties. Keys must be of type `string`,
values may have any type.

  ]##
  let propertiesExpr = PhpSerializedValue_CountPrefixedMapping.read(this.io, this.root, this)
  this.properties = propertiesExpr

proc fromFile*(_: typedesc[PhpSerializedValue_Php3ObjectContents], filename: string): PhpSerializedValue_Php3ObjectContents =
  PhpSerializedValue_Php3ObjectContents.read(newKaitaiFileStream(filename), nil, nil)


##[
The contents of a string value.

Note: PHP strings can contain arbitrary byte sequences.
They are not necessarily valid text in any specific encoding.

]##
proc read*(_: typedesc[PhpSerializedValue_StringContents], io: KaitaiStream, root: KaitaiStruct, parent: PhpSerializedValue): PhpSerializedValue_StringContents =
  template this: untyped = result
  this = new(PhpSerializedValue_StringContents)
  let root = if root == nil: cast[PhpSerializedValue](this) else: cast[PhpSerializedValue](root)
  this.io = io
  this.root = root
  this.parent = parent

  let colonExpr = this.io.readBytes(int(1))
  this.colon = colonExpr
  let stringExpr = PhpSerializedValue_LengthPrefixedQuotedString.read(this.io, this.root, this)
  this.string = stringExpr
  let semicolonExpr = this.io.readBytes(int(1))
  this.semicolon = semicolonExpr

proc value(this: PhpSerializedValue_StringContents): seq[byte] = 

  ##[
  The value of the string, as a byte array.
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = seq[byte](this.string.data)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[PhpSerializedValue_StringContents], filename: string): PhpSerializedValue_StringContents =
  PhpSerializedValue_StringContents.read(newKaitaiFileStream(filename), nil, nil)

