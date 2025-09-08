import kaitai_struct_nim_runtime
import options

type
  MifareClassic* = ref object of KaitaiStruct
    `sectors`*: seq[MifareClassic_Sector]
    `parent`*: KaitaiStruct
    `rawSectors`*: seq[seq[byte]]
  MifareClassic_Key* = ref object of KaitaiStruct
    `key`*: seq[byte]
    `parent`*: MifareClassic_Trailer
  MifareClassic_Manufacturer* = ref object of KaitaiStruct
    `nuid`*: uint32
    `bcc`*: uint8
    `sak`*: uint8
    `atqa`*: uint16
    `manufacturer`*: seq[byte]
    `parent`*: MifareClassic_Sector
  MifareClassic_Sector* = ref object of KaitaiStruct
    `manufacturer`*: MifareClassic_Manufacturer
    `dataFiller`*: MifareClassic_Sector_Filler
    `trailer`*: MifareClassic_Trailer
    `hasManufacturer`*: bool
    `parent`*: MifareClassic
    `rawDataFiller`*: seq[byte]
    `blockSizeInst`: int8
    `blockSizeInstFlag`: bool
    `blocksInst`: seq[seq[byte]]
    `blocksInstFlag`: bool
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
    `valuesInst`: MifareClassic_Sector_Values
    `valuesInstFlag`: bool
  MifareClassic_Sector_Filler* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: MifareClassic_Sector
  MifareClassic_Sector_Values* = ref object of KaitaiStruct
    `values`*: seq[MifareClassic_Sector_Values_ValueBlock]
    `parent`*: MifareClassic_Sector
  MifareClassic_Sector_Values_ValueBlock* = ref object of KaitaiStruct
    `valuez`*: seq[uint32]
    `addrz`*: seq[uint8]
    `parent`*: MifareClassic_Sector_Values
    `addrInst`: uint8
    `addrInstFlag`: bool
    `addrValidInst`: bool
    `addrValidInstFlag`: bool
    `validInst`: bool
    `validInstFlag`: bool
    `valueInst`: uint32
    `valueInstFlag`: bool
    `valueValidInst`: bool
    `valueValidInstFlag`: bool
  MifareClassic_Trailer* = ref object of KaitaiStruct
    `keyA`*: MifareClassic_Key
    `accessBits`*: MifareClassic_Trailer_AccessConditions
    `userByte`*: uint8
    `keyB`*: MifareClassic_Key
    `parent`*: MifareClassic_Sector
    `rawAccessBits`*: seq[byte]
    `acBitsInst`: int8
    `acBitsInstFlag`: bool
    `acCountOfChunksInst`: int
    `acCountOfChunksInstFlag`: bool
    `acsInSectorInst`: int8
    `acsInSectorInstFlag`: bool
  MifareClassic_Trailer_AccessConditions* = ref object of KaitaiStruct
    `rawChunks`*: seq[uint64]
    `parent`*: MifareClassic_Trailer
    `acsRawInst`: seq[MifareClassic_Trailer_AccessConditions_Ac]
    `acsRawInstFlag`: bool
    `chunksInst`: seq[MifareClassic_Trailer_AccessConditions_ValidChunk]
    `chunksInstFlag`: bool
    `dataAcsInst`: seq[MifareClassic_Trailer_AccessConditions_DataAc]
    `dataAcsInstFlag`: bool
    `remapsInst`: seq[MifareClassic_Trailer_AccessConditions_ChunkBitRemap]
    `remapsInstFlag`: bool
    `trailerAcInst`: MifareClassic_Trailer_AccessConditions_TrailerAc
    `trailerAcInstFlag`: bool
  MifareClassic_Trailer_AccessConditions_Ac* = ref object of KaitaiStruct
    `index`*: uint8
    `parent`*: MifareClassic_Trailer_AccessConditions
    `bitsInst`: seq[MifareClassic_Trailer_AccessConditions_Ac_AcBit]
    `bitsInstFlag`: bool
    `invShiftValInst`: int
    `invShiftValInstFlag`: bool
    `valInst`: int
    `valInstFlag`: bool
  MifareClassic_Trailer_AccessConditions_Ac_AcBit* = ref object of KaitaiStruct
    `i`*: uint8
    `chunk`*: uint8
    `parent`*: MifareClassic_Trailer_AccessConditions_Ac
    `bInst`: bool
    `bInstFlag`: bool
    `nInst`: int
    `nInstFlag`: bool
  MifareClassic_Trailer_AccessConditions_ChunkBitRemap* = ref object of KaitaiStruct
    `bitNo`*: uint8
    `parent`*: MifareClassic_Trailer_AccessConditions
    `chunkNoInst`: int
    `chunkNoInstFlag`: bool
    `invChunkNoInst`: int
    `invChunkNoInstFlag`: bool
    `shiftValueInst`: int
    `shiftValueInstFlag`: bool
  MifareClassic_Trailer_AccessConditions_DataAc* = ref object of KaitaiStruct
    `ac`*: MifareClassic_Trailer_AccessConditions_Ac
    `parent`*: MifareClassic_Trailer_AccessConditions
    `decrementAvailableInst`: bool
    `decrementAvailableInstFlag`: bool
    `incrementAvailableInst`: bool
    `incrementAvailableInstFlag`: bool
    `readKeyARequiredInst`: bool
    `readKeyARequiredInstFlag`: bool
    `readKeyBRequiredInst`: bool
    `readKeyBRequiredInstFlag`: bool
    `writeKeyARequiredInst`: bool
    `writeKeyARequiredInstFlag`: bool
    `writeKeyBRequiredInst`: bool
    `writeKeyBRequiredInstFlag`: bool
  MifareClassic_Trailer_AccessConditions_TrailerAc* = ref object of KaitaiStruct
    `ac`*: MifareClassic_Trailer_AccessConditions_Ac
    `parent`*: MifareClassic_Trailer_AccessConditions
    `canReadKeyBInst`: bool
    `canReadKeyBInstFlag`: bool
    `canWriteAccessBitsInst`: bool
    `canWriteAccessBitsInstFlag`: bool
    `canWriteKeysInst`: bool
    `canWriteKeysInstFlag`: bool
    `keyBControlsWriteInst`: bool
    `keyBControlsWriteInstFlag`: bool
  MifareClassic_Trailer_AccessConditions_ValidChunk* = ref object of KaitaiStruct
    `invChunk`*: uint8
    `chunk`*: uint8
    `parent`*: MifareClassic_Trailer_AccessConditions
    `validInst`: bool
    `validInstFlag`: bool

proc read*(_: typedesc[MifareClassic], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MifareClassic
proc read*(_: typedesc[MifareClassic_Key], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer): MifareClassic_Key
proc read*(_: typedesc[MifareClassic_Manufacturer], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Manufacturer
proc read*(_: typedesc[MifareClassic_Sector], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic, hasManufacturer: any): MifareClassic_Sector
proc read*(_: typedesc[MifareClassic_Sector_Filler], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Sector_Filler
proc read*(_: typedesc[MifareClassic_Sector_Values], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Sector_Values
proc read*(_: typedesc[MifareClassic_Sector_Values_ValueBlock], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector_Values): MifareClassic_Sector_Values_ValueBlock
proc read*(_: typedesc[MifareClassic_Trailer], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Trailer
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer): MifareClassic_Trailer_AccessConditions
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_Ac], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, index: any): MifareClassic_Trailer_AccessConditions_Ac
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_Ac_AcBit], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions_Ac, i: any, chunk: any): MifareClassic_Trailer_AccessConditions_Ac_AcBit
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_ChunkBitRemap], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, bitNo: any): MifareClassic_Trailer_AccessConditions_ChunkBitRemap
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_DataAc], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, ac: any): MifareClassic_Trailer_AccessConditions_DataAc
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_TrailerAc], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, ac: any): MifareClassic_Trailer_AccessConditions_TrailerAc
proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_ValidChunk], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, invChunk: any, chunk: any): MifareClassic_Trailer_AccessConditions_ValidChunk

proc blockSize*(this: MifareClassic_Sector): int8
proc blocks*(this: MifareClassic_Sector): seq[seq[byte]]
proc data*(this: MifareClassic_Sector): seq[byte]
proc values*(this: MifareClassic_Sector): MifareClassic_Sector_Values
proc addr*(this: MifareClassic_Sector_Values_ValueBlock): uint8
proc addrValid*(this: MifareClassic_Sector_Values_ValueBlock): bool
proc valid*(this: MifareClassic_Sector_Values_ValueBlock): bool
proc value*(this: MifareClassic_Sector_Values_ValueBlock): uint32
proc valueValid*(this: MifareClassic_Sector_Values_ValueBlock): bool
proc acBits*(this: MifareClassic_Trailer): int8
proc acCountOfChunks*(this: MifareClassic_Trailer): int
proc acsInSector*(this: MifareClassic_Trailer): int8
proc acsRaw*(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_Ac]
proc chunks*(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_ValidChunk]
proc dataAcs*(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_DataAc]
proc remaps*(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_ChunkBitRemap]
proc trailerAc*(this: MifareClassic_Trailer_AccessConditions): MifareClassic_Trailer_AccessConditions_TrailerAc
proc bits*(this: MifareClassic_Trailer_AccessConditions_Ac): seq[MifareClassic_Trailer_AccessConditions_Ac_AcBit]
proc invShiftVal*(this: MifareClassic_Trailer_AccessConditions_Ac): int
proc val*(this: MifareClassic_Trailer_AccessConditions_Ac): int
proc b*(this: MifareClassic_Trailer_AccessConditions_Ac_AcBit): bool
proc n*(this: MifareClassic_Trailer_AccessConditions_Ac_AcBit): int
proc chunkNo*(this: MifareClassic_Trailer_AccessConditions_ChunkBitRemap): int
proc invChunkNo*(this: MifareClassic_Trailer_AccessConditions_ChunkBitRemap): int
proc shiftValue*(this: MifareClassic_Trailer_AccessConditions_ChunkBitRemap): int
proc decrementAvailable*(this: MifareClassic_Trailer_AccessConditions_DataAc): bool
proc incrementAvailable*(this: MifareClassic_Trailer_AccessConditions_DataAc): bool
proc readKeyARequired*(this: MifareClassic_Trailer_AccessConditions_DataAc): bool
proc readKeyBRequired*(this: MifareClassic_Trailer_AccessConditions_DataAc): bool
proc writeKeyARequired*(this: MifareClassic_Trailer_AccessConditions_DataAc): bool
proc writeKeyBRequired*(this: MifareClassic_Trailer_AccessConditions_DataAc): bool
proc canReadKeyB*(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool
proc canWriteAccessBits*(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool
proc canWriteKeys*(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool
proc keyBControlsWrite*(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool
proc valid*(this: MifareClassic_Trailer_AccessConditions_ValidChunk): bool


##[
You can get a dump for testing from this link:
<https://github.com/zhovner/mfdread/raw/master/dump.mfd>

@see <a href="https://github.com/nfc-tools/libnfc
https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
">Source</a>
]##
proc read*(_: typedesc[MifareClassic], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MifareClassic =
  template this: untyped = result
  this = new(MifareClassic)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let buf = this.io.readBytes(int(((if i >= 32: 4 else: 1) * 4) * 16))
      this.rawSectors.add(buf)
      let rawSectorsIo = newKaitaiStream(buf)
      let it = MifareClassic_Sector.read(rawSectorsIo, this.root, this, i == 0)
      this.sectors.add(it)
      inc i

proc fromFile*(_: typedesc[MifareClassic], filename: string): MifareClassic =
  MifareClassic.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Key], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer): MifareClassic_Key =
  template this: untyped = result
  this = new(MifareClassic_Key)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyExpr = this.io.readBytes(int(6))
  this.key = keyExpr

proc fromFile*(_: typedesc[MifareClassic_Key], filename: string): MifareClassic_Key =
  MifareClassic_Key.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Manufacturer], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Manufacturer =
  template this: untyped = result
  this = new(MifareClassic_Manufacturer)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  beware for 7bytes UID it goes over next fields
  ]##
  let nuidExpr = this.io.readU4le()
  this.nuid = nuidExpr
  let bccExpr = this.io.readU1()
  this.bcc = bccExpr
  let sakExpr = this.io.readU1()
  this.sak = sakExpr
  let atqaExpr = this.io.readU2le()
  this.atqa = atqaExpr

  ##[
  may contain manufacture date as BCD
  ]##
  let manufacturerExpr = this.io.readBytes(int(8))
  this.manufacturer = manufacturerExpr

proc fromFile*(_: typedesc[MifareClassic_Manufacturer], filename: string): MifareClassic_Manufacturer =
  MifareClassic_Manufacturer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Sector], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic, hasManufacturer: any): MifareClassic_Sector =
  template this: untyped = result
  this = new(MifareClassic_Sector)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let hasManufacturerExpr = bool(hasManufacturer)
  this.hasManufacturer = hasManufacturerExpr

  if this.hasManufacturer:
    let manufacturerExpr = MifareClassic_Manufacturer.read(this.io, this.root, this)
    this.manufacturer = manufacturerExpr
  let rawDataFillerExpr = this.io.readBytes(int((this.io.size - this.io.pos) - 16))
  this.rawDataFiller = rawDataFillerExpr
  let rawDataFillerIo = newKaitaiStream(rawDataFillerExpr)
  let dataFillerExpr = MifareClassic_Sector_Filler.read(rawDataFillerIo, this.root, this)
  this.dataFiller = dataFillerExpr
  let trailerExpr = MifareClassic_Trailer.read(this.io, this.root, this)
  this.trailer = trailerExpr

proc blockSize(this: MifareClassic_Sector): int8 = 
  if this.blockSizeInstFlag:
    return this.blockSizeInst
  let blockSizeInstExpr = int8(16)
  this.blockSizeInst = blockSizeInstExpr
  this.blockSizeInstFlag = true
  return this.blockSizeInst

proc blocks(this: MifareClassic_Sector): seq[seq[byte]] = 
  if this.blocksInstFlag:
    return this.blocksInst
  let io = this.dataFiller.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    var i: int
    while not io.isEof:
      let it = io.readBytes(int(this.blockSize))
      this.blocksInst.add(it)
      inc i
  io.seek(pos)
  this.blocksInstFlag = true
  return this.blocksInst

proc data(this: MifareClassic_Sector): seq[byte] = 
  if this.dataInstFlag:
    return this.dataInst
  let dataInstExpr = seq[byte](this.dataFiller.data)
  this.dataInst = dataInstExpr
  this.dataInstFlag = true
  return this.dataInst

proc values(this: MifareClassic_Sector): MifareClassic_Sector_Values = 
  if this.valuesInstFlag:
    return this.valuesInst
  let io = this.dataFiller.io
  let pos = io.pos()
  io.seek(int(0))
  let valuesInstExpr = MifareClassic_Sector_Values.read(io, this.root, this)
  this.valuesInst = valuesInstExpr
  io.seek(pos)
  this.valuesInstFlag = true
  return this.valuesInst

proc fromFile*(_: typedesc[MifareClassic_Sector], filename: string): MifareClassic_Sector =
  MifareClassic_Sector.read(newKaitaiFileStream(filename), nil, nil)


##[
only to create _io
]##
proc read*(_: typedesc[MifareClassic_Sector_Filler], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Sector_Filler =
  template this: untyped = result
  this = new(MifareClassic_Sector_Filler)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytes(int(this.io.size))
  this.data = dataExpr

proc fromFile*(_: typedesc[MifareClassic_Sector_Filler], filename: string): MifareClassic_Sector_Filler =
  MifareClassic_Sector_Filler.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Sector_Values], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Sector_Values =
  template this: untyped = result
  this = new(MifareClassic_Sector_Values)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = MifareClassic_Sector_Values_ValueBlock.read(this.io, this.root, this)
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[MifareClassic_Sector_Values], filename: string): MifareClassic_Sector_Values =
  MifareClassic_Sector_Values.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Sector_Values_ValueBlock], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector_Values): MifareClassic_Sector_Values_ValueBlock =
  template this: untyped = result
  this = new(MifareClassic_Sector_Values_ValueBlock)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(3):
    let it = this.io.readU4le()
    this.valuez.add(it)
  for i in 0 ..< int(4):
    let it = this.io.readU1()
    this.addrz.add(it)

proc addr(this: MifareClassic_Sector_Values_ValueBlock): uint8 = 
  if this.addrInstFlag:
    return this.addrInst
  if this.valid:
    let addrInstExpr = uint8(this.addrz[0])
    this.addrInst = addrInstExpr
  this.addrInstFlag = true
  return this.addrInst

proc addrValid(this: MifareClassic_Sector_Values_ValueBlock): bool = 
  if this.addrValidInstFlag:
    return this.addrValidInst
  let addrValidInstExpr = bool( ((this.addrz[0] == not(this.addrz[1])) and (this.addrz[0] == this.addrz[2]) and (this.addrz[1] == this.addrz[3])) )
  this.addrValidInst = addrValidInstExpr
  this.addrValidInstFlag = true
  return this.addrValidInst

proc valid(this: MifareClassic_Sector_Values_ValueBlock): bool = 
  if this.validInstFlag:
    return this.validInst
  let validInstExpr = bool( ((this.valueValid) and (this.addrValid)) )
  this.validInst = validInstExpr
  this.validInstFlag = true
  return this.validInst

proc value(this: MifareClassic_Sector_Values_ValueBlock): uint32 = 
  if this.valueInstFlag:
    return this.valueInst
  if this.valid:
    let valueInstExpr = uint32(this.valuez[0])
    this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc valueValid(this: MifareClassic_Sector_Values_ValueBlock): bool = 
  if this.valueValidInstFlag:
    return this.valueValidInst
  let valueValidInstExpr = bool( ((this.valuez[0] == not(this.valuez[1])) and (this.valuez[0] == this.valuez[2])) )
  this.valueValidInst = valueValidInstExpr
  this.valueValidInstFlag = true
  return this.valueValidInst

proc fromFile*(_: typedesc[MifareClassic_Sector_Values_ValueBlock], filename: string): MifareClassic_Sector_Values_ValueBlock =
  MifareClassic_Sector_Values_ValueBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Sector): MifareClassic_Trailer =
  template this: untyped = result
  this = new(MifareClassic_Trailer)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyAExpr = MifareClassic_Key.read(this.io, this.root, this)
  this.keyA = keyAExpr
  let rawAccessBitsExpr = this.io.readBytes(int(3))
  this.rawAccessBits = rawAccessBitsExpr
  let rawAccessBitsIo = newKaitaiStream(rawAccessBitsExpr)
  let accessBitsExpr = MifareClassic_Trailer_AccessConditions.read(rawAccessBitsIo, this.root, this)
  this.accessBits = accessBitsExpr
  let userByteExpr = this.io.readU1()
  this.userByte = userByteExpr
  let keyBExpr = MifareClassic_Key.read(this.io, this.root, this)
  this.keyB = keyBExpr

proc acBits(this: MifareClassic_Trailer): int8 = 
  if this.acBitsInstFlag:
    return this.acBitsInst
  let acBitsInstExpr = int8(3)
  this.acBitsInst = acBitsInstExpr
  this.acBitsInstFlag = true
  return this.acBitsInst

proc acCountOfChunks(this: MifareClassic_Trailer): int = 
  if this.acCountOfChunksInstFlag:
    return this.acCountOfChunksInst
  let acCountOfChunksInstExpr = int(this.acBits * 2)
  this.acCountOfChunksInst = acCountOfChunksInstExpr
  this.acCountOfChunksInstFlag = true
  return this.acCountOfChunksInst

proc acsInSector(this: MifareClassic_Trailer): int8 = 
  if this.acsInSectorInstFlag:
    return this.acsInSectorInst
  let acsInSectorInstExpr = int8(4)
  this.acsInSectorInst = acsInSectorInstExpr
  this.acsInSectorInstFlag = true
  return this.acsInSectorInst

proc fromFile*(_: typedesc[MifareClassic_Trailer], filename: string): MifareClassic_Trailer =
  MifareClassic_Trailer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer): MifareClassic_Trailer_AccessConditions =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(this.parent.acCountOfChunks):
    let it = this.io.readBitsIntBe(4)
    this.rawChunks.add(it)

proc acsRaw(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_Ac] = 
  if this.acsRawInstFlag:
    return this.acsRawInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  for i in 0 ..< int(this.parent.acsInSector):
    let it = MifareClassic_Trailer_AccessConditions_Ac.read(this.io, this.root, this, i)
    this.acsRawInst.add(it)
  this.io.seek(pos)
  this.acsRawInstFlag = true
  return this.acsRawInst

proc chunks(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_ValidChunk] = 
  if this.chunksInstFlag:
    return this.chunksInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  for i in 0 ..< int(this.parent.acBits):
    let it = MifareClassic_Trailer_AccessConditions_ValidChunk.read(this.io, this.root, this, this.rawChunks[this.remaps[i].invChunkNo], this.rawChunks[this.remaps[i].chunkNo])
    this.chunksInst.add(it)
  this.io.seek(pos)
  this.chunksInstFlag = true
  return this.chunksInst

proc dataAcs(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_DataAc] = 
  if this.dataAcsInstFlag:
    return this.dataAcsInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  for i in 0 ..< int(this.parent.acsInSector - 1):
    let it = MifareClassic_Trailer_AccessConditions_DataAc.read(this.io, this.root, this, this.acsRaw[i])
    this.dataAcsInst.add(it)
  this.io.seek(pos)
  this.dataAcsInstFlag = true
  return this.dataAcsInst

proc remaps(this: MifareClassic_Trailer_AccessConditions): seq[MifareClassic_Trailer_AccessConditions_ChunkBitRemap] = 
  if this.remapsInstFlag:
    return this.remapsInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  for i in 0 ..< int(this.parent.acBits):
    let it = MifareClassic_Trailer_AccessConditions_ChunkBitRemap.read(this.io, this.root, this, i)
    this.remapsInst.add(it)
  this.io.seek(pos)
  this.remapsInstFlag = true
  return this.remapsInst

proc trailerAc(this: MifareClassic_Trailer_AccessConditions): MifareClassic_Trailer_AccessConditions_TrailerAc = 
  if this.trailerAcInstFlag:
    return this.trailerAcInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let trailerAcInstExpr = MifareClassic_Trailer_AccessConditions_TrailerAc.read(this.io, this.root, this, this.acsRaw[this.parent.acsInSector - 1])
  this.trailerAcInst = trailerAcInstExpr
  this.io.seek(pos)
  this.trailerAcInstFlag = true
  return this.trailerAcInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions], filename: string): MifareClassic_Trailer_AccessConditions =
  MifareClassic_Trailer_AccessConditions.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_Ac], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, index: any): MifareClassic_Trailer_AccessConditions_Ac =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions_Ac)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let indexExpr = uint8(index)
  this.index = indexExpr


proc bits(this: MifareClassic_Trailer_AccessConditions_Ac): seq[MifareClassic_Trailer_AccessConditions_Ac_AcBit] = 
  if this.bitsInstFlag:
    return this.bitsInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  for i in 0 ..< int(this.parent.parent.acBits):
    let it = MifareClassic_Trailer_AccessConditions_Ac_AcBit.read(this.io, this.root, this, this.index, this.parent.chunks[i].chunk)
    this.bitsInst.add(it)
  this.io.seek(pos)
  this.bitsInstFlag = true
  return this.bitsInst

proc invShiftVal(this: MifareClassic_Trailer_AccessConditions_Ac): int = 
  if this.invShiftValInstFlag:
    return this.invShiftValInst
  let invShiftValInstExpr = int((this.bits[0].n shl 2 or this.bits[1].n shl 1) or this.bits[2].n)
  this.invShiftValInst = invShiftValInstExpr
  this.invShiftValInstFlag = true
  return this.invShiftValInst

proc val(this: MifareClassic_Trailer_AccessConditions_Ac): int = 

  ##[
  c3 c2 c1
  ]##
  if this.valInstFlag:
    return this.valInst
  let valInstExpr = int((this.bits[2].n shl 2 or this.bits[1].n shl 1) or this.bits[0].n)
  this.valInst = valInstExpr
  this.valInstFlag = true
  return this.valInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions_Ac], filename: string): MifareClassic_Trailer_AccessConditions_Ac =
  MifareClassic_Trailer_AccessConditions_Ac.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_Ac_AcBit], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions_Ac, i: any, chunk: any): MifareClassic_Trailer_AccessConditions_Ac_AcBit =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions_Ac_AcBit)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let iExpr = uint8(i)
  this.i = iExpr
  let chunkExpr = uint8(chunk)
  this.chunk = chunkExpr


proc b(this: MifareClassic_Trailer_AccessConditions_Ac_AcBit): bool = 
  if this.bInstFlag:
    return this.bInst
  let bInstExpr = bool(this.n == 1)
  this.bInst = bInstExpr
  this.bInstFlag = true
  return this.bInst

proc n(this: MifareClassic_Trailer_AccessConditions_Ac_AcBit): int = 
  if this.nInstFlag:
    return this.nInst
  let nInstExpr = int(this.chunk shr this.i and 1)
  this.nInst = nInstExpr
  this.nInstFlag = true
  return this.nInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions_Ac_AcBit], filename: string): MifareClassic_Trailer_AccessConditions_Ac_AcBit =
  MifareClassic_Trailer_AccessConditions_Ac_AcBit.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_ChunkBitRemap], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, bitNo: any): MifareClassic_Trailer_AccessConditions_ChunkBitRemap =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions_ChunkBitRemap)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let bitNoExpr = uint8(bitNo)
  this.bitNo = bitNoExpr


proc chunkNo(this: MifareClassic_Trailer_AccessConditions_ChunkBitRemap): int = 
  if this.chunkNoInstFlag:
    return this.chunkNoInst
  let chunkNoInstExpr = int(((this.invChunkNo + this.shiftValue) + this.parent.parent.acCountOfChunks) %%% this.parent.parent.acCountOfChunks)
  this.chunkNoInst = chunkNoInstExpr
  this.chunkNoInstFlag = true
  return this.chunkNoInst

proc invChunkNo(this: MifareClassic_Trailer_AccessConditions_ChunkBitRemap): int = 
  if this.invChunkNoInstFlag:
    return this.invChunkNoInst
  let invChunkNoInstExpr = int(this.bitNo + this.shiftValue)
  this.invChunkNoInst = invChunkNoInstExpr
  this.invChunkNoInstFlag = true
  return this.invChunkNoInst

proc shiftValue(this: MifareClassic_Trailer_AccessConditions_ChunkBitRemap): int = 
  if this.shiftValueInstFlag:
    return this.shiftValueInst
  let shiftValueInstExpr = int((if this.bitNo == 1: -1 else: 1))
  this.shiftValueInst = shiftValueInstExpr
  this.shiftValueInstFlag = true
  return this.shiftValueInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions_ChunkBitRemap], filename: string): MifareClassic_Trailer_AccessConditions_ChunkBitRemap =
  MifareClassic_Trailer_AccessConditions_ChunkBitRemap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_DataAc], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, ac: any): MifareClassic_Trailer_AccessConditions_DataAc =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions_DataAc)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let acExpr = MifareClassic_Trailer_AccessConditions_Ac(ac)
  this.ac = acExpr


proc decrementAvailable(this: MifareClassic_Trailer_AccessConditions_DataAc): bool = 
  if this.decrementAvailableInstFlag:
    return this.decrementAvailableInst
  let decrementAvailableInstExpr = bool( (( ((this.ac.bits[1].b) or (not(this.ac.bits[0].b))) ) and (not(this.ac.bits[2].b))) )
  this.decrementAvailableInst = decrementAvailableInstExpr
  this.decrementAvailableInstFlag = true
  return this.decrementAvailableInst

proc incrementAvailable(this: MifareClassic_Trailer_AccessConditions_DataAc): bool = 
  if this.incrementAvailableInstFlag:
    return this.incrementAvailableInst
  let incrementAvailableInstExpr = bool( (( ((not(this.ac.bits[0].b)) and (not(this.readKeyARequired)) and (not(this.readKeyBRequired))) ) or ( ((not(this.ac.bits[0].b)) and (this.readKeyARequired) and (this.readKeyBRequired)) )) )
  this.incrementAvailableInst = incrementAvailableInstExpr
  this.incrementAvailableInstFlag = true
  return this.incrementAvailableInst

proc readKeyARequired(this: MifareClassic_Trailer_AccessConditions_DataAc): bool = 
  if this.readKeyARequiredInstFlag:
    return this.readKeyARequiredInst
  let readKeyARequiredInstExpr = bool(this.ac.val <= 4)
  this.readKeyARequiredInst = readKeyARequiredInstExpr
  this.readKeyARequiredInstFlag = true
  return this.readKeyARequiredInst

proc readKeyBRequired(this: MifareClassic_Trailer_AccessConditions_DataAc): bool = 
  if this.readKeyBRequiredInstFlag:
    return this.readKeyBRequiredInst
  let readKeyBRequiredInstExpr = bool(this.ac.val <= 6)
  this.readKeyBRequiredInst = readKeyBRequiredInstExpr
  this.readKeyBRequiredInstFlag = true
  return this.readKeyBRequiredInst

proc writeKeyARequired(this: MifareClassic_Trailer_AccessConditions_DataAc): bool = 
  if this.writeKeyARequiredInstFlag:
    return this.writeKeyARequiredInst
  let writeKeyARequiredInstExpr = bool(this.ac.val == 0)
  this.writeKeyARequiredInst = writeKeyARequiredInstExpr
  this.writeKeyARequiredInstFlag = true
  return this.writeKeyARequiredInst

proc writeKeyBRequired(this: MifareClassic_Trailer_AccessConditions_DataAc): bool = 
  if this.writeKeyBRequiredInstFlag:
    return this.writeKeyBRequiredInst
  let writeKeyBRequiredInstExpr = bool( (( ((not(this.readKeyARequired)) or (this.readKeyBRequired)) ) and (not(this.ac.bits[0].b))) )
  this.writeKeyBRequiredInst = writeKeyBRequiredInstExpr
  this.writeKeyBRequiredInstFlag = true
  return this.writeKeyBRequiredInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions_DataAc], filename: string): MifareClassic_Trailer_AccessConditions_DataAc =
  MifareClassic_Trailer_AccessConditions_DataAc.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_TrailerAc], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, ac: any): MifareClassic_Trailer_AccessConditions_TrailerAc =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions_TrailerAc)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let acExpr = MifareClassic_Trailer_AccessConditions_Ac(ac)
  this.ac = acExpr


proc canReadKeyB(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool = 

  ##[
  key A is required
  ]##
  if this.canReadKeyBInstFlag:
    return this.canReadKeyBInst
  let canReadKeyBInstExpr = bool(this.ac.invShiftVal <= 2)
  this.canReadKeyBInst = canReadKeyBInstExpr
  this.canReadKeyBInstFlag = true
  return this.canReadKeyBInst

proc canWriteAccessBits(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool = 
  if this.canWriteAccessBitsInstFlag:
    return this.canWriteAccessBitsInst
  let canWriteAccessBitsInstExpr = bool(this.ac.bits[2].b)
  this.canWriteAccessBitsInst = canWriteAccessBitsInstExpr
  this.canWriteAccessBitsInstFlag = true
  return this.canWriteAccessBitsInst

proc canWriteKeys(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool = 
  if this.canWriteKeysInstFlag:
    return this.canWriteKeysInst
  let canWriteKeysInstExpr = bool( (((this.ac.invShiftVal + 1) %%% 3 != 0) and (this.ac.invShiftVal < 6)) )
  this.canWriteKeysInst = canWriteKeysInstExpr
  this.canWriteKeysInstFlag = true
  return this.canWriteKeysInst

proc keyBControlsWrite(this: MifareClassic_Trailer_AccessConditions_TrailerAc): bool = 
  if this.keyBControlsWriteInstFlag:
    return this.keyBControlsWriteInst
  let keyBControlsWriteInstExpr = bool(not(this.canReadKeyB))
  this.keyBControlsWriteInst = keyBControlsWriteInstExpr
  this.keyBControlsWriteInstFlag = true
  return this.keyBControlsWriteInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions_TrailerAc], filename: string): MifareClassic_Trailer_AccessConditions_TrailerAc =
  MifareClassic_Trailer_AccessConditions_TrailerAc.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MifareClassic_Trailer_AccessConditions_ValidChunk], io: KaitaiStream, root: KaitaiStruct, parent: MifareClassic_Trailer_AccessConditions, invChunk: any, chunk: any): MifareClassic_Trailer_AccessConditions_ValidChunk =
  template this: untyped = result
  this = new(MifareClassic_Trailer_AccessConditions_ValidChunk)
  let root = if root == nil: cast[MifareClassic](this) else: cast[MifareClassic](root)
  this.io = io
  this.root = root
  this.parent = parent
  let invChunkExpr = uint8(invChunk)
  this.invChunk = invChunkExpr
  let chunkExpr = uint8(chunk)
  this.chunk = chunkExpr


proc valid(this: MifareClassic_Trailer_AccessConditions_ValidChunk): bool = 
  if this.validInstFlag:
    return this.validInst
  let validInstExpr = bool((this.invChunk xor this.chunk) == 15)
  this.validInst = validInstExpr
  this.validInstFlag = true
  return this.validInst

proc fromFile*(_: typedesc[MifareClassic_Trailer_AccessConditions_ValidChunk], filename: string): MifareClassic_Trailer_AccessConditions_ValidChunk =
  MifareClassic_Trailer_AccessConditions_ValidChunk.read(newKaitaiFileStream(filename), nil, nil)

