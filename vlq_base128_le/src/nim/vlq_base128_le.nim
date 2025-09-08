import kaitai_struct_nim_runtime
import options

type
  VlqBase128Le* = ref object of KaitaiStruct
    `groups`*: seq[VlqBase128Le_Group]
    `parent`*: KaitaiStruct
    `lenInst`: int
    `lenInstFlag`: bool
    `signBitInst`: uint64
    `signBitInstFlag`: bool
    `valueInst`: uint64
    `valueInstFlag`: bool
    `valueSignedInst`: int64
    `valueSignedInstFlag`: bool
  VlqBase128Le_Group* = ref object of KaitaiStruct
    `hasNext`*: bool
    `value`*: uint64
    `idx`*: int32
    `prevIntermValue`*: uint64
    `multiplier`*: uint64
    `parent`*: VlqBase128Le
    `intermValueInst`: uint64
    `intermValueInstFlag`: bool

proc read*(_: typedesc[VlqBase128Le], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VlqBase128Le
proc read*(_: typedesc[VlqBase128Le_Group], io: KaitaiStream, root: KaitaiStruct, parent: VlqBase128Le, idx: any, prevIntermValue: any, multiplier: any): VlqBase128Le_Group

proc len*(this: VlqBase128Le): int
proc signBit*(this: VlqBase128Le): uint64
proc value*(this: VlqBase128Le): uint64
proc valueSigned*(this: VlqBase128Le): int64
proc intermValue*(this: VlqBase128Le_Group): uint64


##[
A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
"least significant group first", i.e. in "little-endian" manner.

This particular encoding is specified and used in:

* DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
  <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
* Google Protocol Buffers, where it's called "Base 128 Varints".
  <https://protobuf.dev/programming-guides/encoding/#varints>
* Apache Lucene, where it's called "VInt"
  <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
* Apache Avro uses this as a basis for integer encoding, adding ZigZag on
  top of it for signed ints
  <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>

More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>

This particular implementation supports integer values up to 64 bits (i.e. the
maximum unsigned value supported is `2**64 - 1`), which implies that serialized
values can be up to 10 bytes in length.

If the most significant 10th byte (`groups[9]`) is present, its `has_next`
must be `false` (otherwise we would have 11 or more bytes, which is not
supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
since only integers up to 64 bits are supported). These restrictions are
enforced by this implementation. They were inspired by the Protoscope tool,
see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.

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
      let it = VlqBase128Le_Group.read(this.io, this.root, this, i, (if i != 0: this.groups[i - 1].intermValue else: 0), (if i != 0: (if i == 9: 9223372036854775808'u64 else: this.groups[i - 1].multiplier * 128) else: 1))
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

proc signBit(this: VlqBase128Le): uint64 = 
  if this.signBitInstFlag:
    return this.signBitInst
  let signBitInstExpr = uint64((uint64((if this.len == 10: 9223372036854775808'u64 else: this.groups[^1].multiplier * 64))))
  this.signBitInst = signBitInstExpr
  this.signBitInstFlag = true
  return this.signBitInst

proc value(this: VlqBase128Le): uint64 = 

  ##[
  Resulting unsigned value as normal integer
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = uint64(this.groups[^1].intermValue)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc valueSigned(this: VlqBase128Le): int64 = 
  if this.valueSignedInstFlag:
    return this.valueSignedInst
  let valueSignedInstExpr = int64((if  ((this.signBit > 0) and (this.value >= this.signBit)) : -((int64(this.signBit - (this.value - this.signBit)))) else: (int64(this.value))))
  this.valueSignedInst = valueSignedInstExpr
  this.valueSignedInstFlag = true
  return this.valueSignedInst

proc fromFile*(_: typedesc[VlqBase128Le], filename: string): VlqBase128Le =
  VlqBase128Le.read(newKaitaiFileStream(filename), nil, nil)


##[
One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.

]##
proc read*(_: typedesc[VlqBase128Le_Group], io: KaitaiStream, root: KaitaiStruct, parent: VlqBase128Le, idx: any, prevIntermValue: any, multiplier: any): VlqBase128Le_Group =
  template this: untyped = result
  this = new(VlqBase128Le_Group)
  let root = if root == nil: cast[VlqBase128Le](this) else: cast[VlqBase128Le](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = int32(idx)
  this.idx = idxExpr
  let prevIntermValueExpr = uint64(prevIntermValue)
  this.prevIntermValue = prevIntermValueExpr
  let multiplierExpr = uint64(multiplier)
  this.multiplier = multiplierExpr


  ##[
  If `true`, then we have more bytes to read.

Since this implementation only supports serialized values up to 10
bytes, this must be `false` in the 10th group (`groups[9]`).

  ]##
  let hasNextExpr = this.io.readBitsIntBe(1) != 0
  this.hasNext = hasNextExpr

  ##[
  The 7-bit (base128) numeric value chunk of this group

Since this implementation only supports integer values up to 64 bits,
the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
(otherwise the width of the represented value would be 65 bits or
more, which is not supported).

  ]##
  let valueExpr = this.io.readBitsIntBe(7)
  this.value = valueExpr

proc intermValue(this: VlqBase128Le_Group): uint64 = 
  if this.intermValueInstFlag:
    return this.intermValueInst
  let intermValueInstExpr = uint64((uint64(this.prevIntermValue + this.value * this.multiplier)))
  this.intermValueInst = intermValueInstExpr
  this.intermValueInstFlag = true
  return this.intermValueInst

proc fromFile*(_: typedesc[VlqBase128Le_Group], filename: string): VlqBase128Le_Group =
  VlqBase128Le_Group.read(newKaitaiFileStream(filename), nil, nil)

