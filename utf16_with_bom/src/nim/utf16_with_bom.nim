import kaitai_struct_nim_runtime
import options

type
  Utf16WithBom* = ref object of KaitaiStruct
    `bom`*: seq[byte]
    `strBe`*: string
    `strLe`*: string
    `parent`*: KaitaiStruct
    `isBeInst`: bool
    `isBeInstFlag`: bool
    `isLeInst`: bool
    `isLeInstFlag`: bool
    `valueInst`: string
    `valueInstFlag`: bool

proc read*(_: typedesc[Utf16WithBom], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utf16WithBom

proc isBe*(this: Utf16WithBom): bool
proc isLe*(this: Utf16WithBom): bool
proc value*(this: Utf16WithBom): string


##[
A simple wrapper which allows to read a UTF-16 encoded string that starts
with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
encoding, which can be either big-endian (BE) or little-endian (LE).

Use:

* `value` to get the string value with BOM stripped, regardless of endianness.
* `is_be` and `is_le` to check the endianness indicated by the BOM.
* `bom` to check the raw byte order mark.

@see "- https://en.wikipedia.org/wiki/Byte_order_mark
"
]##
proc read*(_: typedesc[Utf16WithBom], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utf16WithBom =
  template this: untyped = result
  this = new(Utf16WithBom)
  let root = if root == nil: cast[Utf16WithBom](this) else: cast[Utf16WithBom](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The byte order mark (BOM) is a special marker at the beginning of the
string that indicates the endianness of the UTF-16 encoding. The
character U+FEFF is used as the BOM, and its byte representation differs
based on endianness:

* For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
* For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`

This implementation checks for the presence of a valid BOM and strips it
from the resulting string value.

  ]##
  let bomExpr = this.io.readBytes(int(2))
  this.bom = bomExpr
  if this.isBe:
    let strBeExpr = encode(this.io.readBytesFull(), "UTF-16BE")
    this.strBe = strBeExpr
  if this.isLe:
    let strLeExpr = encode(this.io.readBytesFull(), "UTF-16LE")
    this.strLe = strLeExpr

proc isBe(this: Utf16WithBom): bool = 

  ##[
  True if the byte order mark indicates big-endian UTF-16 encoding.
  ]##
  if this.isBeInstFlag:
    return this.isBeInst
  let isBeInstExpr = bool(this.bom == @[254'u8, 255'u8])
  this.isBeInst = isBeInstExpr
  this.isBeInstFlag = true
  return this.isBeInst

proc isLe(this: Utf16WithBom): bool = 

  ##[
  True if the byte order mark indicates little-endian UTF-16 encoding.
  ]##
  if this.isLeInstFlag:
    return this.isLeInst
  let isLeInstExpr = bool(this.bom == @[255'u8, 254'u8])
  this.isLeInst = isLeInstExpr
  this.isLeInstFlag = true
  return this.isLeInst

proc value(this: Utf16WithBom): string = 

  ##[
  The string value with BOM stripped, regardless of endianness.
  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = string((if this.isBe: this.strBe else: this.strLe))
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Utf16WithBom], filename: string): Utf16WithBom =
  Utf16WithBom.read(newKaitaiFileStream(filename), nil, nil)

