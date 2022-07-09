import kaitai_struct_nim_runtime
import options

type
  VlqBase128Le* = ref object of KaitaiStruct
    `groups`*: seq[VlqBase128Le_Group]
    `parent`*: KaitaiStruct
    `lenInst`: int
    `lenInstFlag`: bool
    `valueInst`: int
    `valueInstFlag`: bool
    `signBitInst`: int
    `signBitInstFlag`: bool
    `valueSignedInst`: int
    `valueSignedInstFlag`: bool
  VlqBase128Le_Group* = ref object of KaitaiStruct
    `b`*: uint8
    `parent`*: VlqBase128Le
    `hasNextInst`: bool
    `hasNextInstFlag`: bool
    `valueInst`: int
    `valueInstFlag`: bool

proc read*(_: typedesc[VlqBase128Le], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VlqBase128Le
proc read*(_: typedesc[VlqBase128Le_Group], io: KaitaiStream, root: KaitaiStruct, parent: VlqBase128Le): VlqBase128Le_Group

proc len*(this: VlqBase128Le): int
proc value*(this: VlqBase128Le): int
proc signBit*(this: VlqBase128Le): int
proc valueSigned*(this: VlqBase128Le): int
proc hasNext*(this: VlqBase128Le_Group): bool
proc value*(this: VlqBase128Le_Group): int


##[
A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
"least significant group first", i.e. in "little-endian" manner.

This particular encoding is specified and used in:

* DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
  http://dwarfstd.org/doc/dwarf-2.0.0.pdf - page 139
* Google Protocol Buffers, where it's called "Base 128 Varints".
  https://developers.google.com/protocol-buffers/docs/encoding?csw=1#varints
* Apache Lucene, where it's called "VInt"
  https://lucene.apache.org/core/3_5_0/fileformats.html#VInt
* Apache Avro uses this as a basis for integer encoding, adding ZigZag on
  top of it for signed ints
  https://avro.apache.org/docs/current/spec.html#binary_encode_primitive

More information on this encoding is available at https://en.wikipedia.org/wiki/LEB128

This particular implementation supports serialized values to up 8 bytes long.

]##
proc read*(_: typedesc[VlqBase128Le], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VlqBase128Le =
  template this: untyped = result
  this = new(VlqBase128Le)
  let root = if root == nil: cast[VlqBase128Le](this) else: cast[VlqBase128Le](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = VlqBase128Le_Group.read(this.io, this.root, this)
      this.groups.add(it)
      if not(it.hasNext):
        break
      inc i

proc len(this: VlqBase128Le): int = 
  if this.lenInstFlag:
    return this.lenInst
  let lenInstExpr = int(len(this.groups))
  this.lenInst = lenInstExpr
  this.lenInstFlag = true
  return this.lenInst

proc value(this: VlqBase128Le): int = 

  ##[
  Resulting unsigned value as normal integer
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int((((((((this.groups[0].value + (if this.len >= 2: (this.groups[1].value shl 7) else: 0)) + (if this.len >= 3: (this.groups[2].value shl 14) else: 0)) + (if this.len >= 4: (this.groups[3].value shl 21) else: 0)) + (if this.len >= 5: (this.groups[4].value shl 28) else: 0)) + (if this.len >= 6: (this.groups[5].value shl 35) else: 0)) + (if this.len >= 7: (this.groups[6].value shl 42) else: 0)) + (if this.len >= 8: (this.groups[7].value shl 49) else: 0)))
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc signBit(this: VlqBase128Le): int = 
  if this.signBitInstFlag:
    return this.signBitInst
  let signBitInstExpr = int((1 shl ((7 * this.len) - 1)))
  this.signBitInst = signBitInstExpr
  this.signBitInstFlag = true
  return this.signBitInst

proc valueSigned(this: VlqBase128Le): int = 

  ##[
  @see <a href="https://graphics.stanford.edu/~seander/bithacks.html#VariableSignExtend">Source</a>
  ]##
  if this.valueSignedInstFlag:
    return this.valueSignedInst
  let valueSignedInstExpr = int(((this.value xor this.signBit) - this.signBit))
  this.valueSignedInst = valueSignedInstExpr
  this.valueSignedInstFlag = true
  return this.valueSignedInst

proc fromFile*(_: typedesc[VlqBase128Le], filename: string): VlqBase128Le =
  VlqBase128Le.read(newKaitaiFileStream(filename), nil, nil)


##[
One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.

]##
proc read*(_: typedesc[VlqBase128Le_Group], io: KaitaiStream, root: KaitaiStruct, parent: VlqBase128Le): VlqBase128Le_Group =
  template this: untyped = result
  this = new(VlqBase128Le_Group)
  let root = if root == nil: cast[VlqBase128Le](this) else: cast[VlqBase128Le](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bExpr = this.io.readU1()
  this.b = bExpr

proc hasNext(this: VlqBase128Le_Group): bool = 

  ##[
  If true, then we have more bytes to read
  ]##
  if this.hasNextInstFlag:
    return this.hasNextInst
  let hasNextInstExpr = bool((this.b and 128) != 0)
  this.hasNextInst = hasNextInstExpr
  this.hasNextInstFlag = true
  return this.hasNextInst

proc value(this: VlqBase128Le_Group): int = 

  ##[
  The 7-bit (base128) numeric value chunk of this group
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int((this.b and 127))
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[VlqBase128Le_Group], filename: string): VlqBase128Le_Group =
  VlqBase128Le_Group.read(newKaitaiFileStream(filename), nil, nil)

