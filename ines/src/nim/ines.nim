import kaitai_struct_nim_runtime
import options

type
  Ines* = ref object of KaitaiStruct
    `header`*: Ines_Header
    `trainer`*: seq[byte]
    `prgRom`*: seq[byte]
    `chrRom`*: seq[byte]
    `playchoice10`*: Ines_Playchoice10
    `title`*: string
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
  Ines_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenPrgRom`*: uint8
    `lenChrRom`*: uint8
    `f6`*: Ines_Header_F6
    `f7`*: Ines_Header_F7
    `lenPrgRam`*: uint8
    `f9`*: Ines_Header_F9
    `f10`*: Ines_Header_F10
    `reserved`*: seq[byte]
    `parent`*: Ines
    `rawF6`*: seq[byte]
    `rawF7`*: seq[byte]
    `rawF9`*: seq[byte]
    `rawF10`*: seq[byte]
    `mapperInst`: int
    `mapperInstFlag`: bool
  Ines_Header_F6* = ref object of KaitaiStruct
    `lowerMapper`*: uint64
    `fourScreen`*: bool
    `trainer`*: bool
    `hasBatteryRam`*: bool
    `mirroring`*: Ines_Header_F6_Mirroring
    `parent`*: Ines_Header
  Ines_Header_F6_Mirroring* = enum
    horizontal = 0
    vertical = 1
  Ines_Header_F7* = ref object of KaitaiStruct
    `upperMapper`*: uint64
    `format`*: uint64
    `playchoice10`*: bool
    `vsUnisystem`*: bool
    `parent`*: Ines_Header
  Ines_Header_F9* = ref object of KaitaiStruct
    `reserved`*: uint64
    `tvSystem`*: Ines_Header_F9_TvSystem
    `parent`*: Ines_Header
  Ines_Header_F9_TvSystem* = enum
    ntsc = 0
    pal = 1
  Ines_Header_F10* = ref object of KaitaiStruct
    `reserved1`*: uint64
    `busConflict`*: bool
    `prgRam`*: bool
    `reserved2`*: uint64
    `tvSystem`*: Ines_Header_F10_TvSystem
    `parent`*: Ines_Header
  Ines_Header_F10_TvSystem* = enum
    ntsc = 0
    dual1 = 1
    pal = 2
    dual2 = 3
  Ines_Playchoice10* = ref object of KaitaiStruct
    `instRom`*: seq[byte]
    `prom`*: Ines_Playchoice10_Prom
    `parent`*: Ines
  Ines_Playchoice10_Prom* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `counterOut`*: seq[byte]
    `parent`*: Ines_Playchoice10

proc read*(_: typedesc[Ines], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ines
proc read*(_: typedesc[Ines_Header], io: KaitaiStream, root: KaitaiStruct, parent: Ines): Ines_Header
proc read*(_: typedesc[Ines_Header_F6], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F6
proc read*(_: typedesc[Ines_Header_F7], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F7
proc read*(_: typedesc[Ines_Header_F9], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F9
proc read*(_: typedesc[Ines_Header_F10], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F10
proc read*(_: typedesc[Ines_Playchoice10], io: KaitaiStream, root: KaitaiStruct, parent: Ines): Ines_Playchoice10
proc read*(_: typedesc[Ines_Playchoice10_Prom], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Playchoice10): Ines_Playchoice10_Prom

proc mapper*(this: Ines_Header): int


##[
@see <a href="https://www.nesdev.org/wiki/INES">Source</a>
]##
proc read*(_: typedesc[Ines], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ines =
  template this: untyped = result
  this = new(Ines)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawHeaderExpr = this.io.readBytes(int(16))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = Ines_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  if this.header.f6.trainer:
    let trainerExpr = this.io.readBytes(int(512))
    this.trainer = trainerExpr
  let prgRomExpr = this.io.readBytes(int((this.header.lenPrgRom * 16384)))
  this.prgRom = prgRomExpr
  let chrRomExpr = this.io.readBytes(int((this.header.lenChrRom * 8192)))
  this.chrRom = chrRomExpr
  if this.header.f7.playchoice10:
    let playchoice10Expr = Ines_Playchoice10.read(this.io, this.root, this)
    this.playchoice10 = playchoice10Expr
  if not(this.io.isEof):
    let titleExpr = encode(this.io.readBytesFull(), "ASCII")
    this.title = titleExpr

proc fromFile*(_: typedesc[Ines], filename: string): Ines =
  Ines.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ines_Header], io: KaitaiStream, root: KaitaiStruct, parent: Ines): Ines_Header =
  template this: untyped = result
  this = new(Ines_Header)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  Size of PRG ROM in 16 KB units
  ]##
  let lenPrgRomExpr = this.io.readU1()
  this.lenPrgRom = lenPrgRomExpr

  ##[
  Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
  ]##
  let lenChrRomExpr = this.io.readU1()
  this.lenChrRom = lenChrRomExpr
  let rawF6Expr = this.io.readBytes(int(1))
  this.rawF6 = rawF6Expr
  let rawF6Io = newKaitaiStream(rawF6Expr)
  let f6Expr = Ines_Header_F6.read(rawF6Io, this.root, this)
  this.f6 = f6Expr
  let rawF7Expr = this.io.readBytes(int(1))
  this.rawF7 = rawF7Expr
  let rawF7Io = newKaitaiStream(rawF7Expr)
  let f7Expr = Ines_Header_F7.read(rawF7Io, this.root, this)
  this.f7 = f7Expr

  ##[
  Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
  ]##
  let lenPrgRamExpr = this.io.readU1()
  this.lenPrgRam = lenPrgRamExpr
  let rawF9Expr = this.io.readBytes(int(1))
  this.rawF9 = rawF9Expr
  let rawF9Io = newKaitaiStream(rawF9Expr)
  let f9Expr = Ines_Header_F9.read(rawF9Io, this.root, this)
  this.f9 = f9Expr

  ##[
  this one is unofficial
  ]##
  let rawF10Expr = this.io.readBytes(int(1))
  this.rawF10 = rawF10Expr
  let rawF10Io = newKaitaiStream(rawF10Expr)
  let f10Expr = Ines_Header_F10.read(rawF10Io, this.root, this)
  this.f10 = f10Expr
  let reservedExpr = this.io.readBytes(int(5))
  this.reserved = reservedExpr

proc mapper(this: Ines_Header): int = 

  ##[
  @see <a href="https://www.nesdev.org/wiki/Mapper">Source</a>
  ]##
  if this.mapperInstFlag:
    return this.mapperInst
  let mapperInstExpr = int((this.f6.lowerMapper or (this.f7.upperMapper shl 4)))
  this.mapperInst = mapperInstExpr
  this.mapperInstFlag = true
  return this.mapperInst

proc fromFile*(_: typedesc[Ines_Header], filename: string): Ines_Header =
  Ines_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.nesdev.org/wiki/INES#Flags_6">Source</a>
]##
proc read*(_: typedesc[Ines_Header_F6], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F6 =
  template this: untyped = result
  this = new(Ines_Header_F6)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Lower nibble of mapper number
  ]##
  let lowerMapperExpr = this.io.readBitsIntBe(4)
  this.lowerMapper = lowerMapperExpr

  ##[
  Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
  ]##
  let fourScreenExpr = this.io.readBitsIntBe(1) != 0
  this.fourScreen = fourScreenExpr

  ##[
  512-byte trainer at $7000-$71FF (stored before PRG data)
  ]##
  let trainerExpr = this.io.readBitsIntBe(1) != 0
  this.trainer = trainerExpr

  ##[
  If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
  ]##
  let hasBatteryRamExpr = this.io.readBitsIntBe(1) != 0
  this.hasBatteryRam = hasBatteryRamExpr

  ##[
  if 0, horizontal arrangement. if 1, vertical arrangement
  ]##
  let mirroringExpr = Ines_Header_F6_Mirroring(this.io.readBitsIntBe(1))
  this.mirroring = mirroringExpr

proc fromFile*(_: typedesc[Ines_Header_F6], filename: string): Ines_Header_F6 =
  Ines_Header_F6.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.nesdev.org/wiki/INES#Flags_7">Source</a>
]##
proc read*(_: typedesc[Ines_Header_F7], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F7 =
  template this: untyped = result
  this = new(Ines_Header_F7)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Upper nibble of mapper number
  ]##
  let upperMapperExpr = this.io.readBitsIntBe(4)
  this.upperMapper = upperMapperExpr

  ##[
  If equal to 2, flags 8-15 are in NES 2.0 format
  ]##
  let formatExpr = this.io.readBitsIntBe(2)
  this.format = formatExpr

  ##[
  Determines if it made for a Nintendo PlayChoice-10 or not
  ]##
  let playchoice10Expr = this.io.readBitsIntBe(1) != 0
  this.playchoice10 = playchoice10Expr

  ##[
  Determines if it is made for a Nintendo VS Unisystem or not
  ]##
  let vsUnisystemExpr = this.io.readBitsIntBe(1) != 0
  this.vsUnisystem = vsUnisystemExpr

proc fromFile*(_: typedesc[Ines_Header_F7], filename: string): Ines_Header_F7 =
  Ines_Header_F7.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.nesdev.org/wiki/INES#Flags_9">Source</a>
]##
proc read*(_: typedesc[Ines_Header_F9], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F9 =
  template this: untyped = result
  this = new(Ines_Header_F9)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBitsIntBe(7)
  this.reserved = reservedExpr

  ##[
  if 0, NTSC. If 1, PAL.
  ]##
  let tvSystemExpr = Ines_Header_F9_TvSystem(this.io.readBitsIntBe(1))
  this.tvSystem = tvSystemExpr

proc fromFile*(_: typedesc[Ines_Header_F9], filename: string): Ines_Header_F9 =
  Ines_Header_F9.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.nesdev.org/wiki/INES#Flags_10">Source</a>
]##
proc read*(_: typedesc[Ines_Header_F10], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Header): Ines_Header_F10 =
  template this: untyped = result
  this = new(Ines_Header_F10)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(2)
  this.reserved1 = reserved1Expr

  ##[
  If 0, no bus conflicts. If 1, bus conflicts.
  ]##
  let busConflictExpr = this.io.readBitsIntBe(1) != 0
  this.busConflict = busConflictExpr

  ##[
  If 0, PRG ram is present. If 1, not present.
  ]##
  let prgRamExpr = this.io.readBitsIntBe(1) != 0
  this.prgRam = prgRamExpr
  let reserved2Expr = this.io.readBitsIntBe(2)
  this.reserved2 = reserved2Expr

  ##[
  if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
  ]##
  let tvSystemExpr = Ines_Header_F10_TvSystem(this.io.readBitsIntBe(2))
  this.tvSystem = tvSystemExpr

proc fromFile*(_: typedesc[Ines_Header_F10], filename: string): Ines_Header_F10 =
  Ines_Header_F10.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.nesdev.org/wiki/PC10_ROM-Images">Source</a>
]##
proc read*(_: typedesc[Ines_Playchoice10], io: KaitaiStream, root: KaitaiStruct, parent: Ines): Ines_Playchoice10 =
  template this: untyped = result
  this = new(Ines_Playchoice10)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent

  let instRomExpr = this.io.readBytes(int(8192))
  this.instRom = instRomExpr
  let promExpr = Ines_Playchoice10_Prom.read(this.io, this.root, this)
  this.prom = promExpr

proc fromFile*(_: typedesc[Ines_Playchoice10], filename: string): Ines_Playchoice10 =
  Ines_Playchoice10.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ines_Playchoice10_Prom], io: KaitaiStream, root: KaitaiStruct, parent: Ines_Playchoice10): Ines_Playchoice10_Prom =
  template this: untyped = result
  this = new(Ines_Playchoice10_Prom)
  let root = if root == nil: cast[Ines](this) else: cast[Ines](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytes(int(16))
  this.data = dataExpr
  let counterOutExpr = this.io.readBytes(int(16))
  this.counterOut = counterOutExpr

proc fromFile*(_: typedesc[Ines_Playchoice10_Prom], filename: string): Ines_Playchoice10_Prom =
  Ines_Playchoice10_Prom.read(newKaitaiFileStream(filename), nil, nil)

