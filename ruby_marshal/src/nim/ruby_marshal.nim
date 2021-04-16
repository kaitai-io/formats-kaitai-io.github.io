import kaitai_struct_nim_runtime
import options

type
  RubyMarshal* = ref object of KaitaiStruct
    `version`*: seq[byte]
    `records`*: RubyMarshal_Record
    `parent`*: KaitaiStruct
  RubyMarshal_Codes* = enum
    ruby_string = 34
    const_nil = 48
    ruby_symbol = 58
    ruby_symbol_link = 59
    ruby_object_link = 64
    const_false = 70
    instance_var = 73
    ruby_struct = 83
    const_true = 84
    ruby_array = 91
    packed_int = 105
    bignum = 108
    ruby_hash = 123
  RubyMarshal_RubyArray* = ref object of KaitaiStruct
    `numElements`*: RubyMarshal_PackedInt
    `elements`*: seq[RubyMarshal_Record]
    `parent`*: RubyMarshal_Record
  RubyMarshal_Bignum* = ref object of KaitaiStruct
    `sign`*: uint8
    `lenDiv2`*: RubyMarshal_PackedInt
    `body`*: seq[byte]
    `parent`*: RubyMarshal_Record
  RubyMarshal_RubyStruct* = ref object of KaitaiStruct
    `name`*: RubyMarshal_Record
    `numMembers`*: RubyMarshal_PackedInt
    `members`*: seq[RubyMarshal_Pair]
    `parent`*: RubyMarshal_Record
  RubyMarshal_RubySymbol* = ref object of KaitaiStruct
    `len`*: RubyMarshal_PackedInt
    `name`*: string
    `parent`*: RubyMarshal_Record
  RubyMarshal_PackedInt* = ref object of KaitaiStruct
    `code`*: uint8
    `encoded`*: uint32
    `encoded2`*: uint8
    `parent`*: KaitaiStruct
    `isImmediateInst`*: bool
    `valueInst`*: int
  RubyMarshal_Pair* = ref object of KaitaiStruct
    `key`*: RubyMarshal_Record
    `value`*: RubyMarshal_Record
    `parent`*: KaitaiStruct
  RubyMarshal_InstanceVar* = ref object of KaitaiStruct
    `obj`*: RubyMarshal_Record
    `numVars`*: RubyMarshal_PackedInt
    `vars`*: seq[RubyMarshal_Pair]
    `parent`*: RubyMarshal_Record
  RubyMarshal_Record* = ref object of KaitaiStruct
    `code`*: RubyMarshal_Codes
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
  RubyMarshal_RubyHash* = ref object of KaitaiStruct
    `numPairs`*: RubyMarshal_PackedInt
    `pairs`*: seq[RubyMarshal_Pair]
    `parent`*: RubyMarshal_Record
  RubyMarshal_RubyString* = ref object of KaitaiStruct
    `len`*: RubyMarshal_PackedInt
    `body`*: seq[byte]
    `parent`*: RubyMarshal_Record

proc read*(_: typedesc[RubyMarshal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal
proc read*(_: typedesc[RubyMarshal_RubyArray], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyArray
proc read*(_: typedesc[RubyMarshal_Bignum], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_Bignum
proc read*(_: typedesc[RubyMarshal_RubyStruct], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyStruct
proc read*(_: typedesc[RubyMarshal_RubySymbol], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubySymbol
proc read*(_: typedesc[RubyMarshal_PackedInt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal_PackedInt
proc read*(_: typedesc[RubyMarshal_Pair], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal_Pair
proc read*(_: typedesc[RubyMarshal_InstanceVar], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_InstanceVar
proc read*(_: typedesc[RubyMarshal_Record], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal_Record
proc read*(_: typedesc[RubyMarshal_RubyHash], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyHash
proc read*(_: typedesc[RubyMarshal_RubyString], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyString

proc isImmediate*(this: RubyMarshal_PackedInt): bool
proc value*(this: RubyMarshal_PackedInt): int


##[
Ruby's Marshal module allows serialization and deserialization of
many standard and arbitrary Ruby objects in a compact binary
format. It is relatively fast, available in stdlibs standard and
allows conservation of language-specific properties (such as symbols
or encoding-aware strings).

Feature-wise, it is comparable to other language-specific
implementations, such as:

* Java's
  [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
* .NET
  [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
* Python's
  [marshal](https://docs.python.org/3/library/marshal.html),
  [pickle](https://docs.python.org/3/library/pickle.html) and
  [shelve](https://docs.python.org/3/library/shelve.html)

From internal perspective, serialized stream consists of a simple
magic header and a record.

@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format">Source</a>
]##
proc read*(_: typedesc[RubyMarshal], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal =
  template this: untyped = result
  this = new(RubyMarshal)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readBytes(int(2))
  this.version = versionExpr
  let recordsExpr = RubyMarshal_Record.read(this.io, this.root, this)
  this.records = recordsExpr

proc fromFile*(_: typedesc[RubyMarshal], filename: string): RubyMarshal =
  RubyMarshal.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RubyMarshal_RubyArray], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyArray =
  template this: untyped = result
  this = new(RubyMarshal_RubyArray)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numElementsExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.numElements = numElementsExpr
  for i in 0 ..< int(this.numElements.value):
    let it = RubyMarshal_Record.read(this.io, this.root, this)
    this.elements.add(it)

proc fromFile*(_: typedesc[RubyMarshal_RubyArray], filename: string): RubyMarshal_RubyArray =
  RubyMarshal_RubyArray.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_Bignum], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_Bignum =
  template this: untyped = result
  this = new(RubyMarshal_Bignum)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  A single byte containing `+` for a positive value or `-` for a negative value.
  ]##
  let signExpr = this.io.readU1()
  this.sign = signExpr

  ##[
  Length of bignum body, divided by 2.
  ]##
  let lenDiv2Expr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.lenDiv2 = lenDiv2Expr

  ##[
  Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
  ]##
  let bodyExpr = this.io.readBytes(int((this.lenDiv2.value * 2)))
  this.body = bodyExpr

proc fromFile*(_: typedesc[RubyMarshal_Bignum], filename: string): RubyMarshal_Bignum =
  RubyMarshal_Bignum.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_RubyStruct], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyStruct =
  template this: untyped = result
  this = new(RubyMarshal_RubyStruct)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Symbol containing the name of the struct.
  ]##
  let nameExpr = RubyMarshal_Record.read(this.io, this.root, this)
  this.name = nameExpr

  ##[
  Number of members in a struct
  ]##
  let numMembersExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.numMembers = numMembersExpr
  for i in 0 ..< int(this.numMembers.value):
    let it = RubyMarshal_Pair.read(this.io, this.root, this)
    this.members.add(it)

proc fromFile*(_: typedesc[RubyMarshal_RubyStruct], filename: string): RubyMarshal_RubyStruct =
  RubyMarshal_RubyStruct.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_RubySymbol], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubySymbol =
  template this: untyped = result
  this = new(RubyMarshal_RubySymbol)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.len = lenExpr
  let nameExpr = encode(this.io.readBytes(int(this.len.value)), "UTF-8")
  this.name = nameExpr

proc fromFile*(_: typedesc[RubyMarshal_RubySymbol], filename: string): RubyMarshal_RubySymbol =
  RubyMarshal_RubySymbol.read(newKaitaiFileStream(filename), nil, nil)


##[
Ruby uses sophisticated system to pack integers: first `code`
byte either determines packing scheme or carries encoded
immediate value (thus allowing smaller values from -123 to 122
(inclusive) to take only one byte. There are 11 encoding schemes
in total:

* 0 is encoded specially (as 0)
* 1..122 are encoded as immediate value with a shift
* 123..255 are encoded with code of 0x01 and 1 extra byte
* 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
* 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
  bytes
* 0x1000000..0xffffffff are encoded with code of 0x04 and 4
  extra bytes
* -123..-1 are encoded as immediate value with another shift
* -256..-124 are encoded with code of 0xff and 1 extra byte
* -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
* -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
   bytes
* -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
   extra bytes

Values beyond that are serialized as bignum (even if they
technically might be not Bignum class in Ruby implementation,
i.e. if they fit into 64 bits on a 64-bit platform).

@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_PackedInt], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal_PackedInt =
  template this: untyped = result
  this = new(RubyMarshal_PackedInt)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = this.io.readU1()
  this.code = codeExpr
  block:
    let on = this.code
    if on == 4:
      let encodedExpr = this.io.readU4le()
      this.encoded = encodedExpr
    elif on == 1:
      let encodedExpr = uint32(this.io.readU1())
      this.encoded = encodedExpr
    elif on == 252:
      let encodedExpr = this.io.readU4le()
      this.encoded = encodedExpr
    elif on == 253:
      let encodedExpr = uint32(this.io.readU2le())
      this.encoded = encodedExpr
    elif on == 3:
      let encodedExpr = uint32(this.io.readU2le())
      this.encoded = encodedExpr
    elif on == 2:
      let encodedExpr = uint32(this.io.readU2le())
      this.encoded = encodedExpr
    elif on == 255:
      let encodedExpr = uint32(this.io.readU1())
      this.encoded = encodedExpr
    elif on == 254:
      let encodedExpr = uint32(this.io.readU2le())
      this.encoded = encodedExpr

  ##[
  One extra byte for 3-byte integers (0x03 and 0xfd), as
there is no standard `u3` type in KS.

  ]##
  block:
    let on = this.code
    if on == 3:
      let encoded2Expr = this.io.readU1()
      this.encoded2 = encoded2Expr
    elif on == 253:
      let encoded2Expr = this.io.readU1()
      this.encoded2 = encoded2Expr

proc isImmediate(this: RubyMarshal_PackedInt): bool = 
  if this.isImmediateInst != nil:
    return this.isImmediateInst
  let isImmediateInstExpr = bool( ((this.code > 4) and (this.code < 252)) )
  this.isImmediateInst = isImmediateInstExpr
  if this.isImmediateInst != nil:
    return this.isImmediateInst

proc value(this: RubyMarshal_PackedInt): int = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = int((if this.isImmediate: (if this.code < 128: (this.code - 5) else: (4 - (not(this.code) and 127))) else: (if this.code == 0: 0 else: (if this.code == 255: (this.encoded - 256) else: (if this.code == 254: (this.encoded - 65536) else: (if this.code == 253: (((this.encoded2 shl 16) or this.encoded) - 16777216) else: (if this.code == 3: ((this.encoded2 shl 16) or this.encoded) else: this.encoded)))))))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[RubyMarshal_PackedInt], filename: string): RubyMarshal_PackedInt =
  RubyMarshal_PackedInt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RubyMarshal_Pair], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal_Pair =
  template this: untyped = result
  this = new(RubyMarshal_Pair)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyExpr = RubyMarshal_Record.read(this.io, this.root, this)
  this.key = keyExpr
  let valueExpr = RubyMarshal_Record.read(this.io, this.root, this)
  this.value = valueExpr

proc fromFile*(_: typedesc[RubyMarshal_Pair], filename: string): RubyMarshal_Pair =
  RubyMarshal_Pair.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_InstanceVar], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_InstanceVar =
  template this: untyped = result
  this = new(RubyMarshal_InstanceVar)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let objExpr = RubyMarshal_Record.read(this.io, this.root, this)
  this.obj = objExpr
  let numVarsExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.numVars = numVarsExpr
  for i in 0 ..< int(this.numVars.value):
    let it = RubyMarshal_Pair.read(this.io, this.root, this)
    this.vars.add(it)

proc fromFile*(_: typedesc[RubyMarshal_InstanceVar], filename: string): RubyMarshal_InstanceVar =
  RubyMarshal_InstanceVar.read(newKaitaiFileStream(filename), nil, nil)


##[
Each record starts with a single byte that determines its type
(`code`) and contents. If necessary, additional info as parsed
as `body`, to be determined by `code`.

]##
proc read*(_: typedesc[RubyMarshal_Record], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RubyMarshal_Record =
  template this: untyped = result
  this = new(RubyMarshal_Record)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = RubyMarshal_Codes(this.io.readU1())
  this.code = codeExpr
  block:
    let on = this.code
    if on == ruby_marshal.packed_int:
      let bodyExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.bignum:
      let bodyExpr = RubyMarshal_Bignum.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_array:
      let bodyExpr = RubyMarshal_RubyArray.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_symbol_link:
      let bodyExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_struct:
      let bodyExpr = RubyMarshal_RubyStruct.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_string:
      let bodyExpr = RubyMarshal_RubyString.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.instance_var:
      let bodyExpr = RubyMarshal_InstanceVar.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_hash:
      let bodyExpr = RubyMarshal_RubyHash.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_symbol:
      let bodyExpr = RubyMarshal_RubySymbol.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == ruby_marshal.ruby_object_link:
      let bodyExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[RubyMarshal_Record], filename: string): RubyMarshal_Record =
  RubyMarshal_Record.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_RubyHash], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyHash =
  template this: untyped = result
  this = new(RubyMarshal_RubyHash)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numPairsExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.numPairs = numPairsExpr
  for i in 0 ..< int(this.numPairs.value):
    let it = RubyMarshal_Pair.read(this.io, this.root, this)
    this.pairs.add(it)

proc fromFile*(_: typedesc[RubyMarshal_RubyHash], filename: string): RubyMarshal_RubyHash =
  RubyMarshal_RubyHash.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String">Source</a>
]##
proc read*(_: typedesc[RubyMarshal_RubyString], io: KaitaiStream, root: KaitaiStruct, parent: RubyMarshal_Record): RubyMarshal_RubyString =
  template this: untyped = result
  this = new(RubyMarshal_RubyString)
  let root = if root == nil: cast[RubyMarshal](this) else: cast[RubyMarshal](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = RubyMarshal_PackedInt.read(this.io, this.root, this)
  this.len = lenExpr
  let bodyExpr = this.io.readBytes(int(this.len.value))
  this.body = bodyExpr

proc fromFile*(_: typedesc[RubyMarshal_RubyString], filename: string): RubyMarshal_RubyString =
  RubyMarshal_RubyString.read(newKaitaiFileStream(filename), nil, nil)

