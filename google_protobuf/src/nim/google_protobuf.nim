import kaitai_struct_nim_runtime
import options
import /common/vlq_base128_le

import "vlq_base128_le"
type
  GoogleProtobuf* = ref object of KaitaiStruct
    `pairs`*: seq[GoogleProtobuf_Pair]
    `parent`*: KaitaiStruct
  GoogleProtobuf_Pair* = ref object of KaitaiStruct
    `key`*: VlqBase128Le
    `value`*: KaitaiStruct
    `parent`*: GoogleProtobuf
    `wireTypeInst`: GoogleProtobuf_Pair_WireTypes
    `wireTypeInstFlag`: bool
    `fieldTagInst`: int
    `fieldTagInstFlag`: bool
  GoogleProtobuf_Pair_WireTypes* = enum
    varint = 0
    bit_64 = 1
    len_delimited = 2
    group_start = 3
    group_end = 4
    bit_32 = 5
  GoogleProtobuf_DelimitedBytes* = ref object of KaitaiStruct
    `len`*: VlqBase128Le
    `body`*: seq[byte]
    `parent`*: GoogleProtobuf_Pair

proc read*(_: typedesc[GoogleProtobuf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GoogleProtobuf
proc read*(_: typedesc[GoogleProtobuf_Pair], io: KaitaiStream, root: KaitaiStruct, parent: GoogleProtobuf): GoogleProtobuf_Pair
proc read*(_: typedesc[GoogleProtobuf_DelimitedBytes], io: KaitaiStream, root: KaitaiStruct, parent: GoogleProtobuf_Pair): GoogleProtobuf_DelimitedBytes

proc wireType*(this: GoogleProtobuf_Pair): GoogleProtobuf_Pair_WireTypes
proc fieldTag*(this: GoogleProtobuf_Pair): int


##[
Google Protocol Buffers (AKA protobuf) is a popular data
serialization scheme used for communication protocols, data storage,
etc. There are implementations are available for almost every
popular language. The focus points of this scheme are brevity (data
is encoded in a very size-efficient manner) and extensibility (one
can add keys to the structure, while keeping it readable in previous
version of software).

Protobuf uses semi-self-describing encoding scheme for its
messages. It means that it is possible to parse overall structure of
the message (skipping over fields one can't understand), but to
fully understand the message, one needs a protocol definition file
(`.proto`). To be specific:

* "Keys" in key-value pairs provided in the message are identified
  only with an integer "field tag". `.proto` file provides info on
  which symbolic field names these field tags map to.
* "Keys" also provide something called "wire type". It's not a data
  type in its common sense (i.e. you can't, for example, distinguish
  `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
  it's enough information to determine how many bytes to
  parse. Interpretation of the value should be done according to the
  type specified in `.proto` file.
* There's no direct information on which fields are optional /
  required, which fields may be repeated or constitute a map, what
  restrictions are placed on fields usage in a single message, what
  are the fields' default values, etc, etc.

@see <a href="https://protobuf.dev/programming-guides/encoding/">Source</a>
]##
proc read*(_: typedesc[GoogleProtobuf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GoogleProtobuf =
  template this: untyped = result
  this = new(GoogleProtobuf)
  let root = if root == nil: cast[GoogleProtobuf](this) else: cast[GoogleProtobuf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Key-value pairs which constitute a message
  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = GoogleProtobuf_Pair.read(this.io, this.root, this)
      this.pairs.add(it)
      inc i

proc fromFile*(_: typedesc[GoogleProtobuf], filename: string): GoogleProtobuf =
  GoogleProtobuf.read(newKaitaiFileStream(filename), nil, nil)


##[
Key-value pair
]##
proc read*(_: typedesc[GoogleProtobuf_Pair], io: KaitaiStream, root: KaitaiStruct, parent: GoogleProtobuf): GoogleProtobuf_Pair =
  template this: untyped = result
  this = new(GoogleProtobuf_Pair)
  let root = if root == nil: cast[GoogleProtobuf](this) else: cast[GoogleProtobuf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Key is a bit-mapped variable-length integer: lower 3 bits
are used for "wire type", and everything higher designates
an integer "field tag".

  ]##
  let keyExpr = VlqBase128Le.read(this.io, this.root, this)
  this.key = keyExpr

  ##[
  Value that corresponds to field identified by
`field_tag`. Type is determined approximately: there is
enough information to parse it unambiguously from a stream,
but further infromation from `.proto` file is required to
interprete it properly.

  ]##
  block:
    let on = this.wireType
    if on == google_protobuf.varint:
      let valueExpr = VlqBase128Le.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == google_protobuf.len_delimited:
      let valueExpr = GoogleProtobuf_DelimitedBytes.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == google_protobuf.bit_64:
      let valueExpr = KaitaiStruct(this.io.readU8le())
      this.value = valueExpr
    elif on == google_protobuf.bit_32:
      let valueExpr = KaitaiStruct(this.io.readU4le())
      this.value = valueExpr

proc wireType(this: GoogleProtobuf_Pair): GoogleProtobuf_Pair_WireTypes = 

  ##[
  "Wire type" is a part of the "key" that carries enough
information to parse value from the wire, i.e. read correct
amount of bytes, but there's not enough informaton to
interprete in unambiguously. For example, one can't clearly
distinguish 64-bit fixed-sized integers from 64-bit floats,
signed zigzag-encoded varints from regular unsigned varints,
arbitrary bytes from UTF-8 encoded strings, etc.

  ]##
  if this.wireTypeInstFlag:
    return this.wireTypeInst
  let wireTypeInstExpr = GoogleProtobuf_Pair_WireTypes(GoogleProtobuf_Pair_WireTypes((this.key.value and 7)))
  this.wireTypeInst = wireTypeInstExpr
  this.wireTypeInstFlag = true
  return this.wireTypeInst

proc fieldTag(this: GoogleProtobuf_Pair): int = 

  ##[
  Identifies a field of protocol. One can look up symbolic
field name in a `.proto` file by this field tag.

  ]##
  if this.fieldTagInstFlag:
    return this.fieldTagInst
  let fieldTagInstExpr = int((this.key.value shr 3))
  this.fieldTagInst = fieldTagInstExpr
  this.fieldTagInstFlag = true
  return this.fieldTagInst

proc fromFile*(_: typedesc[GoogleProtobuf_Pair], filename: string): GoogleProtobuf_Pair =
  GoogleProtobuf_Pair.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GoogleProtobuf_DelimitedBytes], io: KaitaiStream, root: KaitaiStruct, parent: GoogleProtobuf_Pair): GoogleProtobuf_DelimitedBytes =
  template this: untyped = result
  this = new(GoogleProtobuf_DelimitedBytes)
  let root = if root == nil: cast[GoogleProtobuf](this) else: cast[GoogleProtobuf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = VlqBase128Le.read(this.io, this.root, this)
  this.len = lenExpr
  let bodyExpr = this.io.readBytes(int(this.len.value))
  this.body = bodyExpr

proc fromFile*(_: typedesc[GoogleProtobuf_DelimitedBytes], filename: string): GoogleProtobuf_DelimitedBytes =
  GoogleProtobuf_DelimitedBytes.read(newKaitaiFileStream(filename), nil, nil)

