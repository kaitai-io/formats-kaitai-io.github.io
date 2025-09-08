import kaitai_struct_nim_runtime
import options

type
  Bcd* = ref object of KaitaiStruct
    `digits`*: seq[int]
    `numDigits`*: uint8
    `bitsPerDigit`*: uint8
    `isLe`*: bool
    `parent`*: KaitaiStruct
    `asIntInst`: int
    `asIntInstFlag`: bool
    `asIntBeInst`: int
    `asIntBeInstFlag`: bool
    `asIntLeInst`: int
    `asIntLeInstFlag`: bool
    `lastIdxInst`: int
    `lastIdxInstFlag`: bool

proc read*(_: typedesc[Bcd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, numDigits: any, bitsPerDigit: any, isLe: any): Bcd

proc asInt*(this: Bcd): int
proc asIntBe*(this: Bcd): int
proc asIntLe*(this: Bcd): int
proc lastIdx*(this: Bcd): int


##[
BCD (Binary Coded Decimals) is a common way to encode integer
numbers in a way that makes human-readable output somewhat
simpler. In this encoding scheme, every decimal digit is encoded as
either a single byte (8 bits), or a nibble (half of a byte, 4
bits). This obviously wastes a lot of bits, but it makes translation
into human-readable string much easier than traditional
binary-to-decimal conversion process, which includes lots of
divisions by 10.

For example, encoding integer 31337 in 8-digit, 8 bits per digit,
big endian order of digits BCD format yields

```
00 00 00 03 01 03 03 07
```

Encoding the same integer as 8-digit, 4 bits per digit, little
endian order BCD format would yield:

```
73 31 30 00
```

Using this type of encoding in Kaitai Struct is pretty
straightforward: one calls for this type, specifying desired
encoding parameters, and gets result using either `as_int` or
`as_str` attributes.

]##
proc read*(_: typedesc[Bcd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, numDigits: any, bitsPerDigit: any, isLe: any): Bcd =
  template this: untyped = result
  this = new(Bcd)
  let root = if root == nil: cast[Bcd](this) else: cast[Bcd](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numDigitsExpr = uint8(numDigits)
  this.numDigits = numDigitsExpr
  let bitsPerDigitExpr = uint8(bitsPerDigit)
  this.bitsPerDigit = bitsPerDigitExpr
  let isLeExpr = bool(isLe)
  this.isLe = isLeExpr

  for i in 0 ..< int(this.numDigits):
    block:
      let on = this.bitsPerDigit
      if on == 4:
        let it = int(this.io.readBitsIntBe(4))
        this.digits.add(it)
      elif on == 8:
        let it = int(this.io.readU1())
        this.digits.add(it)

proc asInt(this: Bcd): int = 

  ##[
  Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
  ]##
  if this.asIntInstFlag:
    return this.asIntInst
  let asIntInstExpr = int((if this.isLe: this.asIntLe else: this.asIntBe))
  this.asIntInst = asIntInstExpr
  this.asIntInstFlag = true
  return this.asIntInst

proc asIntBe(this: Bcd): int = 

  ##[
  Value of this BCD number as integer (treating digit order as big-endian).
  ]##
  if this.asIntBeInstFlag:
    return this.asIntBeInst
  let asIntBeInstExpr = int(this.digits[this.lastIdx] + (if this.numDigits < 2: 0 else: this.digits[this.lastIdx - 1] * 10 + (if this.numDigits < 3: 0 else: this.digits[this.lastIdx - 2] * 100 + (if this.numDigits < 4: 0 else: this.digits[this.lastIdx - 3] * 1000 + (if this.numDigits < 5: 0 else: this.digits[this.lastIdx - 4] * 10000 + (if this.numDigits < 6: 0 else: this.digits[this.lastIdx - 5] * 100000 + (if this.numDigits < 7: 0 else: this.digits[this.lastIdx - 6] * 1000000 + (if this.numDigits < 8: 0 else: this.digits[this.lastIdx - 7] * 10000000))))))))
  this.asIntBeInst = asIntBeInstExpr
  this.asIntBeInstFlag = true
  return this.asIntBeInst

proc asIntLe(this: Bcd): int = 

  ##[
  Value of this BCD number as integer (treating digit order as little-endian).
  ]##
  if this.asIntLeInstFlag:
    return this.asIntLeInst
  let asIntLeInstExpr = int(this.digits[0] + (if this.numDigits < 2: 0 else: this.digits[1] * 10 + (if this.numDigits < 3: 0 else: this.digits[2] * 100 + (if this.numDigits < 4: 0 else: this.digits[3] * 1000 + (if this.numDigits < 5: 0 else: this.digits[4] * 10000 + (if this.numDigits < 6: 0 else: this.digits[5] * 100000 + (if this.numDigits < 7: 0 else: this.digits[6] * 1000000 + (if this.numDigits < 8: 0 else: this.digits[7] * 10000000))))))))
  this.asIntLeInst = asIntLeInstExpr
  this.asIntLeInstFlag = true
  return this.asIntLeInst

proc lastIdx(this: Bcd): int = 

  ##[
  Index of last digit (0-based).
  ]##
  if this.lastIdxInstFlag:
    return this.lastIdxInst
  let lastIdxInstExpr = int(this.numDigits - 1)
  this.lastIdxInst = lastIdxInstExpr
  this.lastIdxInstFlag = true
  return this.lastIdxInst

proc fromFile*(_: typedesc[Bcd], filename: string): Bcd =
  Bcd.read(newKaitaiFileStream(filename), nil, nil)

