import kaitai_struct_nim_runtime
import options

type
  VlqBase128Be* = ref object of KaitaiStruct
    `groups`*: seq[VlqBase128Be_Group]
    `parent`*: KaitaiStruct
    `lastInst`: int
    `lastInstFlag`: bool
    `valueInst`: uint64
    `valueInstFlag`: bool
  VlqBase128Be_Group* = ref object of KaitaiStruct
    `hasNext`*: bool
    `value`*: uint64
    `parent`*: VlqBase128Be

proc read*(_: typedesc[VlqBase128Be], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VlqBase128Be
proc read*(_: typedesc[VlqBase128Be_Group], io: KaitaiStream, root: KaitaiStruct, parent: VlqBase128Be): VlqBase128Be_Group

proc last*(this: VlqBase128Be): int
proc value*(this: VlqBase128Be): uint64


##[
A variable-length unsigned integer using base128 encoding. 1-byte groups
consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
"most significant group first", i.e. in "big-endian" manner.

This particular encoding is specified and used in:

* Standard MIDI file format
* ASN.1 BER encoding
* RAR 5.0 file format

More information on this encoding is available at
<https://en.wikipedia.org/wiki/Variable-length_quantity>

This particular implementation supports serialized values to up 8 bytes long.

]##
proc read*(_: typedesc[VlqBase128Be], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VlqBase128Be =
  template this: untyped = result
  this = new(VlqBase128Be)
  let root = if root == nil: cast[VlqBase128Be](this) else: cast[VlqBase128Be](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = VlqBase128Be_Group.read(this.io, this.root, this)
      this.groups.add(it)
      if not(it.hasNext):
        break
      inc i

proc last(this: VlqBase128Be): int = 
  if this.lastInstFlag:
    return this.lastInst
  let lastInstExpr = int(len(this.groups) - 1)
  this.lastInst = lastInstExpr
  this.lastInstFlag = true
  return this.lastInst

proc value(this: VlqBase128Be): uint64 = 

  ##[
  Resulting value as normal integer
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = uint64((uint64(((((((this.groups[this.last].value + (if this.last >= 1: this.groups[this.last - 1].value shl 7 else: 0)) + (if this.last >= 2: this.groups[this.last - 2].value shl 14 else: 0)) + (if this.last >= 3: this.groups[this.last - 3].value shl 21 else: 0)) + (if this.last >= 4: this.groups[this.last - 4].value shl 28 else: 0)) + (if this.last >= 5: this.groups[this.last - 5].value shl 35 else: 0)) + (if this.last >= 6: this.groups[this.last - 6].value shl 42 else: 0)) + (if this.last >= 7: this.groups[this.last - 7].value shl 49 else: 0))))
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[VlqBase128Be], filename: string): VlqBase128Be =
  VlqBase128Be.read(newKaitaiFileStream(filename), nil, nil)


##[
One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.

]##
proc read*(_: typedesc[VlqBase128Be_Group], io: KaitaiStream, root: KaitaiStruct, parent: VlqBase128Be): VlqBase128Be_Group =
  template this: untyped = result
  this = new(VlqBase128Be_Group)
  let root = if root == nil: cast[VlqBase128Be](this) else: cast[VlqBase128Be](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  If true, then we have more bytes to read
  ]##
  let hasNextExpr = this.io.readBitsIntBe(1) != 0
  this.hasNext = hasNextExpr

  ##[
  The 7-bit (base128) numeric value chunk of this group
  ]##
  let valueExpr = this.io.readBitsIntBe(7)
  this.value = valueExpr

proc fromFile*(_: typedesc[VlqBase128Be_Group], filename: string): VlqBase128Be_Group =
  VlqBase128Be_Group.read(newKaitaiFileStream(filename), nil, nil)

