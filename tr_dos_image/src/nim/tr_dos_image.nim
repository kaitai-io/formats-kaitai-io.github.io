import kaitai_struct_nim_runtime
import options

type
  TrDosImage* = ref object of KaitaiStruct
    `files`*: seq[TrDosImage_File]
    `parent`*: KaitaiStruct
    `volumeInfoInst`: TrDosImage_VolumeInfo
    `volumeInfoInstFlag`: bool
  TrDosImage_DiskType* = enum
    type_80_tracks_double_side = 22
    type_40_tracks_double_side = 23
    type_80_tracks_single_side = 24
    type_40_tracks_single_side = 25
  TrDosImage_File* = ref object of KaitaiStruct
    `name`*: TrDosImage_Filename
    `extension`*: uint8
    `positionAndLength`*: KaitaiStruct
    `lengthSectors`*: uint8
    `startingSector`*: uint8
    `startingTrack`*: uint8
    `parent`*: TrDosImage
    `rawName`*: seq[byte]
    `contentsInst`: seq[byte]
    `contentsInstFlag`: bool
    `isDeletedInst`: bool
    `isDeletedInstFlag`: bool
    `isTerminatorInst`: bool
    `isTerminatorInstFlag`: bool
  TrDosImage_Filename* = ref object of KaitaiStruct
    `name`*: seq[byte]
    `parent`*: TrDosImage_File
    `firstByteInst`: uint8
    `firstByteInstFlag`: bool
  TrDosImage_PositionAndLengthBasic* = ref object of KaitaiStruct
    `programAndDataLength`*: uint16
    `programLength`*: uint16
    `parent`*: TrDosImage_File
  TrDosImage_PositionAndLengthCode* = ref object of KaitaiStruct
    `startAddress`*: uint16
    `length`*: uint16
    `parent`*: TrDosImage_File
  TrDosImage_PositionAndLengthGeneric* = ref object of KaitaiStruct
    `reserved`*: uint16
    `length`*: uint16
    `parent`*: TrDosImage_File
  TrDosImage_PositionAndLengthPrint* = ref object of KaitaiStruct
    `extentNo`*: uint8
    `reserved`*: uint8
    `length`*: uint16
    `parent`*: TrDosImage_File
  TrDosImage_VolumeInfo* = ref object of KaitaiStruct
    `catalogEnd`*: seq[byte]
    `unused`*: seq[byte]
    `firstFreeSectorSector`*: uint8
    `firstFreeSectorTrack`*: uint8
    `diskType`*: TrDosImage_DiskType
    `numFiles`*: uint8
    `numFreeSectors`*: uint16
    `trDosId`*: seq[byte]
    `unused2`*: seq[byte]
    `password`*: seq[byte]
    `unused3`*: seq[byte]
    `numDeletedFiles`*: uint8
    `label`*: seq[byte]
    `unused4`*: seq[byte]
    `parent`*: TrDosImage
    `numSidesInst`: int8
    `numSidesInstFlag`: bool
    `numTracksInst`: int8
    `numTracksInstFlag`: bool

proc read*(_: typedesc[TrDosImage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TrDosImage
proc read*(_: typedesc[TrDosImage_File], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage): TrDosImage_File
proc read*(_: typedesc[TrDosImage_Filename], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_Filename
proc read*(_: typedesc[TrDosImage_PositionAndLengthBasic], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthBasic
proc read*(_: typedesc[TrDosImage_PositionAndLengthCode], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthCode
proc read*(_: typedesc[TrDosImage_PositionAndLengthGeneric], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthGeneric
proc read*(_: typedesc[TrDosImage_PositionAndLengthPrint], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthPrint
proc read*(_: typedesc[TrDosImage_VolumeInfo], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage): TrDosImage_VolumeInfo

proc volumeInfo*(this: TrDosImage): TrDosImage_VolumeInfo
proc contents*(this: TrDosImage_File): seq[byte]
proc isDeleted*(this: TrDosImage_File): bool
proc isTerminator*(this: TrDosImage_File): bool
proc firstByte*(this: TrDosImage_Filename): uint8
proc numSides*(this: TrDosImage_VolumeInfo): int8
proc numTracks*(this: TrDosImage_VolumeInfo): int8


##[
.trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
headerless and contain consequent "logical tracks", each logical track
consists of 16 256-byte sectors.

Logical tracks are defined the same way as used by TR-DOS: for single-side
floppies it's just a physical track number, for two-side floppies sides are
interleaved, i.e. logical_track_num = (physical_track_num << 1) | side

So, this format definition is more for TR-DOS filesystem than for .trd files,
which are formatless.

Strings (file names, disk label, disk password) are padded with spaces and use
ZX Spectrum character set, including UDGs, block drawing chars and Basic
tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
replaced with (up arrow, pound, copyright symbol).

.trd file can be smaller than actual floppy disk, if last logical tracks are
empty (contain no file data) they can be omitted.

]##
proc read*(_: typedesc[TrDosImage], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): TrDosImage =
  template this: untyped = result
  this = new(TrDosImage)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = TrDosImage_File.read(this.io, this.root, this)
      this.files.add(it)
      if it.isTerminator:
        break
      inc i

proc volumeInfo(this: TrDosImage): TrDosImage_VolumeInfo = 
  if this.volumeInfoInstFlag:
    return this.volumeInfoInst
  let pos = this.io.pos()
  this.io.seek(int(2048))
  let volumeInfoInstExpr = TrDosImage_VolumeInfo.read(this.io, this.root, this)
  this.volumeInfoInst = volumeInfoInstExpr
  this.io.seek(pos)
  this.volumeInfoInstFlag = true
  return this.volumeInfoInst

proc fromFile*(_: typedesc[TrDosImage], filename: string): TrDosImage =
  TrDosImage.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_File], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage): TrDosImage_File =
  template this: untyped = result
  this = new(TrDosImage_File)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawNameExpr = this.io.readBytes(int(8))
  this.rawName = rawNameExpr
  let rawNameIo = newKaitaiStream(rawNameExpr)
  let nameExpr = TrDosImage_Filename.read(rawNameIo, this.root, this)
  this.name = nameExpr
  let extensionExpr = this.io.readU1()
  this.extension = extensionExpr
  block:
    let on = this.extension
    if on == 35:
      let positionAndLengthExpr = TrDosImage_PositionAndLengthPrint.read(this.io, this.root, this)
      this.positionAndLength = positionAndLengthExpr
    elif on == 66:
      let positionAndLengthExpr = TrDosImage_PositionAndLengthBasic.read(this.io, this.root, this)
      this.positionAndLength = positionAndLengthExpr
    elif on == 67:
      let positionAndLengthExpr = TrDosImage_PositionAndLengthCode.read(this.io, this.root, this)
      this.positionAndLength = positionAndLengthExpr
    else:
      let positionAndLengthExpr = TrDosImage_PositionAndLengthGeneric.read(this.io, this.root, this)
      this.positionAndLength = positionAndLengthExpr
  let lengthSectorsExpr = this.io.readU1()
  this.lengthSectors = lengthSectorsExpr
  let startingSectorExpr = this.io.readU1()
  this.startingSector = startingSectorExpr
  let startingTrackExpr = this.io.readU1()
  this.startingTrack = startingTrackExpr

proc contents(this: TrDosImage_File): seq[byte] = 
  if this.contentsInstFlag:
    return this.contentsInst
  let pos = this.io.pos()
  this.io.seek(int((this.startingTrack * 256) * 16 + this.startingSector * 256))
  let contentsInstExpr = this.io.readBytes(int(this.lengthSectors * 256))
  this.contentsInst = contentsInstExpr
  this.io.seek(pos)
  this.contentsInstFlag = true
  return this.contentsInst

proc isDeleted(this: TrDosImage_File): bool = 
  if this.isDeletedInstFlag:
    return this.isDeletedInst
  let isDeletedInstExpr = bool(this.name.firstByte == 1)
  this.isDeletedInst = isDeletedInstExpr
  this.isDeletedInstFlag = true
  return this.isDeletedInst

proc isTerminator(this: TrDosImage_File): bool = 
  if this.isTerminatorInstFlag:
    return this.isTerminatorInst
  let isTerminatorInstExpr = bool(this.name.firstByte == 0)
  this.isTerminatorInst = isTerminatorInstExpr
  this.isTerminatorInstFlag = true
  return this.isTerminatorInst

proc fromFile*(_: typedesc[TrDosImage_File], filename: string): TrDosImage_File =
  TrDosImage_File.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_Filename], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_Filename =
  template this: untyped = result
  this = new(TrDosImage_Filename)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = this.io.readBytes(int(8))
  this.name = nameExpr

proc firstByte(this: TrDosImage_Filename): uint8 = 
  if this.firstByteInstFlag:
    return this.firstByteInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let firstByteInstExpr = this.io.readU1()
  this.firstByteInst = firstByteInstExpr
  this.io.seek(pos)
  this.firstByteInstFlag = true
  return this.firstByteInst

proc fromFile*(_: typedesc[TrDosImage_Filename], filename: string): TrDosImage_Filename =
  TrDosImage_Filename.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_PositionAndLengthBasic], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthBasic =
  template this: untyped = result
  this = new(TrDosImage_PositionAndLengthBasic)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let programAndDataLengthExpr = this.io.readU2le()
  this.programAndDataLength = programAndDataLengthExpr
  let programLengthExpr = this.io.readU2le()
  this.programLength = programLengthExpr

proc fromFile*(_: typedesc[TrDosImage_PositionAndLengthBasic], filename: string): TrDosImage_PositionAndLengthBasic =
  TrDosImage_PositionAndLengthBasic.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_PositionAndLengthCode], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthCode =
  template this: untyped = result
  this = new(TrDosImage_PositionAndLengthCode)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Default memory address to load this byte array into
  ]##
  let startAddressExpr = this.io.readU2le()
  this.startAddress = startAddressExpr
  let lengthExpr = this.io.readU2le()
  this.length = lengthExpr

proc fromFile*(_: typedesc[TrDosImage_PositionAndLengthCode], filename: string): TrDosImage_PositionAndLengthCode =
  TrDosImage_PositionAndLengthCode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_PositionAndLengthGeneric], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthGeneric =
  template this: untyped = result
  this = new(TrDosImage_PositionAndLengthGeneric)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU2le()
  this.reserved = reservedExpr
  let lengthExpr = this.io.readU2le()
  this.length = lengthExpr

proc fromFile*(_: typedesc[TrDosImage_PositionAndLengthGeneric], filename: string): TrDosImage_PositionAndLengthGeneric =
  TrDosImage_PositionAndLengthGeneric.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_PositionAndLengthPrint], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage_File): TrDosImage_PositionAndLengthPrint =
  template this: untyped = result
  this = new(TrDosImage_PositionAndLengthPrint)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let extentNoExpr = this.io.readU1()
  this.extentNo = extentNoExpr
  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let lengthExpr = this.io.readU2le()
  this.length = lengthExpr

proc fromFile*(_: typedesc[TrDosImage_PositionAndLengthPrint], filename: string): TrDosImage_PositionAndLengthPrint =
  TrDosImage_PositionAndLengthPrint.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[TrDosImage_VolumeInfo], io: KaitaiStream, root: KaitaiStruct, parent: TrDosImage): TrDosImage_VolumeInfo =
  template this: untyped = result
  this = new(TrDosImage_VolumeInfo)
  let root = if root == nil: cast[TrDosImage](this) else: cast[TrDosImage](root)
  this.io = io
  this.root = root
  this.parent = parent

  let catalogEndExpr = this.io.readBytes(int(1))
  this.catalogEnd = catalogEndExpr
  let unusedExpr = this.io.readBytes(int(224))
  this.unused = unusedExpr
  let firstFreeSectorSectorExpr = this.io.readU1()
  this.firstFreeSectorSector = firstFreeSectorSectorExpr

  ##[
  track number is logical, for double-sided disks it's
(physical_track << 1) | side, the same way that tracks are stored
sequentially in .trd file

  ]##
  let firstFreeSectorTrackExpr = this.io.readU1()
  this.firstFreeSectorTrack = firstFreeSectorTrackExpr
  let diskTypeExpr = TrDosImage_DiskType(this.io.readU1())
  this.diskType = diskTypeExpr

  ##[
  Number of non-deleted files. Directory can have more than
number_of_files entries due to deleted files

  ]##
  let numFilesExpr = this.io.readU1()
  this.numFiles = numFilesExpr
  let numFreeSectorsExpr = this.io.readU2le()
  this.numFreeSectors = numFreeSectorsExpr
  let trDosIdExpr = this.io.readBytes(int(1))
  this.trDosId = trDosIdExpr
  let unused2Expr = this.io.readBytes(int(2))
  this.unused2 = unused2Expr
  let passwordExpr = this.io.readBytes(int(9))
  this.password = passwordExpr
  let unused3Expr = this.io.readBytes(int(1))
  this.unused3 = unused3Expr
  let numDeletedFilesExpr = this.io.readU1()
  this.numDeletedFiles = numDeletedFilesExpr
  let labelExpr = this.io.readBytes(int(8))
  this.label = labelExpr
  let unused4Expr = this.io.readBytes(int(3))
  this.unused4 = unused4Expr

proc numSides(this: TrDosImage_VolumeInfo): int8 = 
  if this.numSidesInstFlag:
    return this.numSidesInst
  let numSidesInstExpr = int8((if (ord(this.diskType) and 8) != 0: 1 else: 2))
  this.numSidesInst = numSidesInstExpr
  this.numSidesInstFlag = true
  return this.numSidesInst

proc numTracks(this: TrDosImage_VolumeInfo): int8 = 
  if this.numTracksInstFlag:
    return this.numTracksInst
  let numTracksInstExpr = int8((if (ord(this.diskType) and 1) != 0: 40 else: 80))
  this.numTracksInst = numTracksInstExpr
  this.numTracksInstFlag = true
  return this.numTracksInst

proc fromFile*(_: typedesc[TrDosImage_VolumeInfo], filename: string): TrDosImage_VolumeInfo =
  TrDosImage_VolumeInfo.read(newKaitaiFileStream(filename), nil, nil)

