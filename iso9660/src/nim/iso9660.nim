import kaitai_struct_nim_runtime
import options

type
  Iso9660* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `sectorSizeInst`: int
    `sectorSizeInstFlag`: bool
    `primaryVolDescInst`: Iso9660_VolDesc
    `primaryVolDescInstFlag`: bool
  Iso9660_VolDescPrimary* = ref object of KaitaiStruct
    `unused1`*: seq[byte]
    `systemId`*: string
    `volumeId`*: string
    `unused2`*: seq[byte]
    `volSpaceSize`*: Iso9660_U4bi
    `unused3`*: seq[byte]
    `volSetSize`*: Iso9660_U2bi
    `volSeqNum`*: Iso9660_U2bi
    `logicalBlockSize`*: Iso9660_U2bi
    `pathTableSize`*: Iso9660_U4bi
    `lbaPathTableLe`*: uint32
    `lbaOptPathTableLe`*: uint32
    `lbaPathTableBe`*: uint32
    `lbaOptPathTableBe`*: uint32
    `rootDir`*: Iso9660_DirEntry
    `volSetId`*: string
    `publisherId`*: string
    `dataPreparerId`*: string
    `applicationId`*: string
    `copyrightFileId`*: string
    `abstractFileId`*: string
    `bibliographicFileId`*: string
    `volCreateDatetime`*: Iso9660_DecDatetime
    `volModDatetime`*: Iso9660_DecDatetime
    `volExpireDatetime`*: Iso9660_DecDatetime
    `volEffectiveDatetime`*: Iso9660_DecDatetime
    `fileStructureVersion`*: uint8
    `unused4`*: uint8
    `applicationArea`*: seq[byte]
    `parent`*: Iso9660_VolDesc
    `rawRootDir`*: seq[byte]
    `rawPathTableInst`*: seq[byte]
    `pathTableInst`: Iso9660_PathTableLe
    `pathTableInstFlag`: bool
  Iso9660_VolDescBootRecord* = ref object of KaitaiStruct
    `bootSystemId`*: string
    `bootId`*: string
    `parent`*: Iso9660_VolDesc
  Iso9660_Datetime* = ref object of KaitaiStruct
    `year`*: uint8
    `month`*: uint8
    `day`*: uint8
    `hour`*: uint8
    `minute`*: uint8
    `sec`*: uint8
    `timezone`*: uint8
    `parent`*: Iso9660_DirEntryBody
  Iso9660_DirEntry* = ref object of KaitaiStruct
    `len`*: uint8
    `body`*: Iso9660_DirEntryBody
    `parent`*: KaitaiStruct
    `rawBody`*: seq[byte]
  Iso9660_VolDesc* = ref object of KaitaiStruct
    `type`*: uint8
    `magic`*: seq[byte]
    `version`*: uint8
    `volDescBootRecord`*: Iso9660_VolDescBootRecord
    `volDescPrimary`*: Iso9660_VolDescPrimary
    `parent`*: Iso9660
  Iso9660_PathTableEntryLe* = ref object of KaitaiStruct
    `lenDirName`*: uint8
    `lenExtAttrRec`*: uint8
    `lbaExtent`*: uint32
    `parentDirIdx`*: uint16
    `dirName`*: string
    `padding`*: uint8
    `parent`*: Iso9660_PathTableLe
  Iso9660_DirEntries* = ref object of KaitaiStruct
    `entries`*: seq[Iso9660_DirEntry]
    `parent`*: Iso9660_DirEntryBody
  Iso9660_U4bi* = ref object of KaitaiStruct
    `le`*: uint32
    `be`*: uint32
    `parent`*: KaitaiStruct
  Iso9660_U2bi* = ref object of KaitaiStruct
    `le`*: uint16
    `be`*: uint16
    `parent`*: KaitaiStruct
  Iso9660_PathTableLe* = ref object of KaitaiStruct
    `entries`*: seq[Iso9660_PathTableEntryLe]
    `parent`*: Iso9660_VolDescPrimary
  Iso9660_DecDatetime* = ref object of KaitaiStruct
    `year`*: string
    `month`*: string
    `day`*: string
    `hour`*: string
    `minute`*: string
    `sec`*: string
    `secHundreds`*: string
    `timezone`*: uint8
    `parent`*: Iso9660_VolDescPrimary
  Iso9660_DirEntryBody* = ref object of KaitaiStruct
    `lenExtAttrRec`*: uint8
    `lbaExtent`*: Iso9660_U4bi
    `sizeExtent`*: Iso9660_U4bi
    `datetime`*: Iso9660_Datetime
    `fileFlags`*: uint8
    `fileUnitSize`*: uint8
    `interleaveGapSize`*: uint8
    `volSeqNum`*: Iso9660_U2bi
    `lenFileName`*: uint8
    `fileName`*: string
    `padding`*: uint8
    `rest`*: seq[byte]
    `parent`*: Iso9660_DirEntry
    `rawExtentAsDirInst`*: seq[byte]
    `extentAsDirInst`: Iso9660_DirEntries
    `extentAsDirInstFlag`: bool
    `extentAsFileInst`: seq[byte]
    `extentAsFileInstFlag`: bool

proc read*(_: typedesc[Iso9660], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660
proc read*(_: typedesc[Iso9660_VolDescPrimary], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDesc): Iso9660_VolDescPrimary
proc read*(_: typedesc[Iso9660_VolDescBootRecord], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDesc): Iso9660_VolDescBootRecord
proc read*(_: typedesc[Iso9660_Datetime], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_DirEntryBody): Iso9660_Datetime
proc read*(_: typedesc[Iso9660_DirEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660_DirEntry
proc read*(_: typedesc[Iso9660_VolDesc], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660): Iso9660_VolDesc
proc read*(_: typedesc[Iso9660_PathTableEntryLe], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_PathTableLe): Iso9660_PathTableEntryLe
proc read*(_: typedesc[Iso9660_DirEntries], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_DirEntryBody): Iso9660_DirEntries
proc read*(_: typedesc[Iso9660_U4bi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660_U4bi
proc read*(_: typedesc[Iso9660_U2bi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660_U2bi
proc read*(_: typedesc[Iso9660_PathTableLe], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDescPrimary): Iso9660_PathTableLe
proc read*(_: typedesc[Iso9660_DecDatetime], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDescPrimary): Iso9660_DecDatetime
proc read*(_: typedesc[Iso9660_DirEntryBody], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_DirEntry): Iso9660_DirEntryBody

proc sectorSize*(this: Iso9660): int
proc primaryVolDesc*(this: Iso9660): Iso9660_VolDesc
proc pathTable*(this: Iso9660_VolDescPrimary): Iso9660_PathTableLe
proc extentAsDir*(this: Iso9660_DirEntryBody): Iso9660_DirEntries
proc extentAsFile*(this: Iso9660_DirEntryBody): seq[byte]


##[
ISO9660 is standard filesystem used on read-only optical discs
(mostly CD-ROM). The standard was based on earlier High Sierra
Format (HSF), proposed for CD-ROMs in 1985, and, after several
revisions, it was accepted as ISO9960:1998.

The format emphasizes portability (thus having pretty minimal
features and very conservative file names standards) and sequential
access (which favors disc devices with relatively slow rotation
speed).

]##
proc read*(_: typedesc[Iso9660], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660 =
  template this: untyped = result
  this = new(Iso9660)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent


proc sectorSize(this: Iso9660): int = 
  if this.sectorSizeInstFlag:
    return this.sectorSizeInst
  let sectorSizeInstExpr = int(2048)
  this.sectorSizeInst = sectorSizeInstExpr
  this.sectorSizeInstFlag = true
  return this.sectorSizeInst

proc primaryVolDesc(this: Iso9660): Iso9660_VolDesc = 
  if this.primaryVolDescInstFlag:
    return this.primaryVolDescInst
  let pos = this.io.pos()
  this.io.seek(int((16 * this.sectorSize)))
  let primaryVolDescInstExpr = Iso9660_VolDesc.read(this.io, this.root, this)
  this.primaryVolDescInst = primaryVolDescInstExpr
  this.io.seek(pos)
  this.primaryVolDescInstFlag = true
  return this.primaryVolDescInst

proc fromFile*(_: typedesc[Iso9660], filename: string): Iso9660 =
  Iso9660.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor">Source</a>
]##
proc read*(_: typedesc[Iso9660_VolDescPrimary], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDesc): Iso9660_VolDescPrimary =
  template this: untyped = result
  this = new(Iso9660_VolDescPrimary)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unused1Expr = this.io.readBytes(int(1))
  this.unused1 = unused1Expr
  let systemIdExpr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.systemId = systemIdExpr
  let volumeIdExpr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.volumeId = volumeIdExpr
  let unused2Expr = this.io.readBytes(int(8))
  this.unused2 = unused2Expr
  let volSpaceSizeExpr = Iso9660_U4bi.read(this.io, this.root, this)
  this.volSpaceSize = volSpaceSizeExpr
  let unused3Expr = this.io.readBytes(int(32))
  this.unused3 = unused3Expr
  let volSetSizeExpr = Iso9660_U2bi.read(this.io, this.root, this)
  this.volSetSize = volSetSizeExpr
  let volSeqNumExpr = Iso9660_U2bi.read(this.io, this.root, this)
  this.volSeqNum = volSeqNumExpr
  let logicalBlockSizeExpr = Iso9660_U2bi.read(this.io, this.root, this)
  this.logicalBlockSize = logicalBlockSizeExpr
  let pathTableSizeExpr = Iso9660_U4bi.read(this.io, this.root, this)
  this.pathTableSize = pathTableSizeExpr
  let lbaPathTableLeExpr = this.io.readU4le()
  this.lbaPathTableLe = lbaPathTableLeExpr
  let lbaOptPathTableLeExpr = this.io.readU4le()
  this.lbaOptPathTableLe = lbaOptPathTableLeExpr
  let lbaPathTableBeExpr = this.io.readU4be()
  this.lbaPathTableBe = lbaPathTableBeExpr
  let lbaOptPathTableBeExpr = this.io.readU4be()
  this.lbaOptPathTableBe = lbaOptPathTableBeExpr
  let rawRootDirExpr = this.io.readBytes(int(34))
  this.rawRootDir = rawRootDirExpr
  let rawRootDirIo = newKaitaiStream(rawRootDirExpr)
  let rootDirExpr = Iso9660_DirEntry.read(rawRootDirIo, this.root, this)
  this.rootDir = rootDirExpr
  let volSetIdExpr = encode(this.io.readBytes(int(128)), "UTF-8")
  this.volSetId = volSetIdExpr
  let publisherIdExpr = encode(this.io.readBytes(int(128)), "UTF-8")
  this.publisherId = publisherIdExpr
  let dataPreparerIdExpr = encode(this.io.readBytes(int(128)), "UTF-8")
  this.dataPreparerId = dataPreparerIdExpr
  let applicationIdExpr = encode(this.io.readBytes(int(128)), "UTF-8")
  this.applicationId = applicationIdExpr
  let copyrightFileIdExpr = encode(this.io.readBytes(int(38)), "UTF-8")
  this.copyrightFileId = copyrightFileIdExpr
  let abstractFileIdExpr = encode(this.io.readBytes(int(36)), "UTF-8")
  this.abstractFileId = abstractFileIdExpr
  let bibliographicFileIdExpr = encode(this.io.readBytes(int(37)), "UTF-8")
  this.bibliographicFileId = bibliographicFileIdExpr
  let volCreateDatetimeExpr = Iso9660_DecDatetime.read(this.io, this.root, this)
  this.volCreateDatetime = volCreateDatetimeExpr
  let volModDatetimeExpr = Iso9660_DecDatetime.read(this.io, this.root, this)
  this.volModDatetime = volModDatetimeExpr
  let volExpireDatetimeExpr = Iso9660_DecDatetime.read(this.io, this.root, this)
  this.volExpireDatetime = volExpireDatetimeExpr
  let volEffectiveDatetimeExpr = Iso9660_DecDatetime.read(this.io, this.root, this)
  this.volEffectiveDatetime = volEffectiveDatetimeExpr
  let fileStructureVersionExpr = this.io.readU1()
  this.fileStructureVersion = fileStructureVersionExpr
  let unused4Expr = this.io.readU1()
  this.unused4 = unused4Expr
  let applicationAreaExpr = this.io.readBytes(int(512))
  this.applicationArea = applicationAreaExpr

proc pathTable(this: Iso9660_VolDescPrimary): Iso9660_PathTableLe = 
  if this.pathTableInstFlag:
    return this.pathTableInst
  let pos = this.io.pos()
  this.io.seek(int((this.lbaPathTableLe * Iso9660(this.root).sectorSize)))
  let rawPathTableInstExpr = this.io.readBytes(int(this.pathTableSize.le))
  this.rawPathTableInst = rawPathTableInstExpr
  let rawPathTableInstIo = newKaitaiStream(rawPathTableInstExpr)
  let pathTableInstExpr = Iso9660_PathTableLe.read(rawPathTableInstIo, this.root, this)
  this.pathTableInst = pathTableInstExpr
  this.io.seek(pos)
  this.pathTableInstFlag = true
  return this.pathTableInst

proc fromFile*(_: typedesc[Iso9660_VolDescPrimary], filename: string): Iso9660_VolDescPrimary =
  Iso9660_VolDescPrimary.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_VolDescBootRecord], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDesc): Iso9660_VolDescBootRecord =
  template this: untyped = result
  this = new(Iso9660_VolDescBootRecord)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bootSystemIdExpr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.bootSystemId = bootSystemIdExpr
  let bootIdExpr = encode(this.io.readBytes(int(32)), "UTF-8")
  this.bootId = bootIdExpr

proc fromFile*(_: typedesc[Iso9660_VolDescBootRecord], filename: string): Iso9660_VolDescBootRecord =
  Iso9660_VolDescBootRecord.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_Datetime], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_DirEntryBody): Iso9660_Datetime =
  template this: untyped = result
  this = new(Iso9660_Datetime)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let yearExpr = this.io.readU1()
  this.year = yearExpr
  let monthExpr = this.io.readU1()
  this.month = monthExpr
  let dayExpr = this.io.readU1()
  this.day = dayExpr
  let hourExpr = this.io.readU1()
  this.hour = hourExpr
  let minuteExpr = this.io.readU1()
  this.minute = minuteExpr
  let secExpr = this.io.readU1()
  this.sec = secExpr
  let timezoneExpr = this.io.readU1()
  this.timezone = timezoneExpr

proc fromFile*(_: typedesc[Iso9660_Datetime], filename: string): Iso9660_Datetime =
  Iso9660_Datetime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_DirEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660_DirEntry =
  template this: untyped = result
  this = new(Iso9660_DirEntry)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU1()
  this.len = lenExpr
  if this.len > 0:
    let rawBodyExpr = this.io.readBytes(int((this.len - 1)))
    this.rawBody = rawBodyExpr
    let rawBodyIo = newKaitaiStream(rawBodyExpr)
    let bodyExpr = Iso9660_DirEntryBody.read(rawBodyIo, this.root, this)
    this.body = bodyExpr

proc fromFile*(_: typedesc[Iso9660_DirEntry], filename: string): Iso9660_DirEntry =
  Iso9660_DirEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_VolDesc], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660): Iso9660_VolDesc =
  template this: untyped = result
  this = new(Iso9660_VolDesc)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = this.io.readU1()
  this.type = typeExpr
  let magicExpr = this.io.readBytes(int(5))
  this.magic = magicExpr
  let versionExpr = this.io.readU1()
  this.version = versionExpr
  if this.type == 0:
    let volDescBootRecordExpr = Iso9660_VolDescBootRecord.read(this.io, this.root, this)
    this.volDescBootRecord = volDescBootRecordExpr
  if this.type == 1:
    let volDescPrimaryExpr = Iso9660_VolDescPrimary.read(this.io, this.root, this)
    this.volDescPrimary = volDescPrimaryExpr

proc fromFile*(_: typedesc[Iso9660_VolDesc], filename: string): Iso9660_VolDesc =
  Iso9660_VolDesc.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_PathTableEntryLe], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_PathTableLe): Iso9660_PathTableEntryLe =
  template this: untyped = result
  this = new(Iso9660_PathTableEntryLe)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenDirNameExpr = this.io.readU1()
  this.lenDirName = lenDirNameExpr
  let lenExtAttrRecExpr = this.io.readU1()
  this.lenExtAttrRec = lenExtAttrRecExpr
  let lbaExtentExpr = this.io.readU4le()
  this.lbaExtent = lbaExtentExpr
  let parentDirIdxExpr = this.io.readU2le()
  this.parentDirIdx = parentDirIdxExpr
  let dirNameExpr = encode(this.io.readBytes(int(this.lenDirName)), "UTF-8")
  this.dirName = dirNameExpr
  if (this.lenDirName %%% 2) == 1:
    let paddingExpr = this.io.readU1()
    this.padding = paddingExpr

proc fromFile*(_: typedesc[Iso9660_PathTableEntryLe], filename: string): Iso9660_PathTableEntryLe =
  Iso9660_PathTableEntryLe.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_DirEntries], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_DirEntryBody): Iso9660_DirEntries =
  template this: untyped = result
  this = new(Iso9660_DirEntries)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = Iso9660_DirEntry.read(this.io, this.root, this)
      this.entries.add(it)
      if it.len == 0:
        break
      inc i

proc fromFile*(_: typedesc[Iso9660_DirEntries], filename: string): Iso9660_DirEntries =
  Iso9660_DirEntries.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_U4bi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660_U4bi =
  template this: untyped = result
  this = new(Iso9660_U4bi)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leExpr = this.io.readU4le()
  this.le = leExpr
  let beExpr = this.io.readU4be()
  this.be = beExpr

proc fromFile*(_: typedesc[Iso9660_U4bi], filename: string): Iso9660_U4bi =
  Iso9660_U4bi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_U2bi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Iso9660_U2bi =
  template this: untyped = result
  this = new(Iso9660_U2bi)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leExpr = this.io.readU2le()
  this.le = leExpr
  let beExpr = this.io.readU2be()
  this.be = beExpr

proc fromFile*(_: typedesc[Iso9660_U2bi], filename: string): Iso9660_U2bi =
  Iso9660_U2bi.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.osdev.org/ISO_9660#The_Path_Table">Source</a>
]##
proc read*(_: typedesc[Iso9660_PathTableLe], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDescPrimary): Iso9660_PathTableLe =
  template this: untyped = result
  this = new(Iso9660_PathTableLe)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Iso9660_PathTableEntryLe.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Iso9660_PathTableLe], filename: string): Iso9660_PathTableLe =
  Iso9660_PathTableLe.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.osdev.org/ISO_9660#Date.2Ftime_format">Source</a>
]##
proc read*(_: typedesc[Iso9660_DecDatetime], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_VolDescPrimary): Iso9660_DecDatetime =
  template this: untyped = result
  this = new(Iso9660_DecDatetime)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let yearExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.year = yearExpr
  let monthExpr = encode(this.io.readBytes(int(2)), "ASCII")
  this.month = monthExpr
  let dayExpr = encode(this.io.readBytes(int(2)), "ASCII")
  this.day = dayExpr
  let hourExpr = encode(this.io.readBytes(int(2)), "ASCII")
  this.hour = hourExpr
  let minuteExpr = encode(this.io.readBytes(int(2)), "ASCII")
  this.minute = minuteExpr
  let secExpr = encode(this.io.readBytes(int(2)), "ASCII")
  this.sec = secExpr
  let secHundredsExpr = encode(this.io.readBytes(int(2)), "ASCII")
  this.secHundreds = secHundredsExpr
  let timezoneExpr = this.io.readU1()
  this.timezone = timezoneExpr

proc fromFile*(_: typedesc[Iso9660_DecDatetime], filename: string): Iso9660_DecDatetime =
  Iso9660_DecDatetime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Iso9660_DirEntryBody], io: KaitaiStream, root: KaitaiStruct, parent: Iso9660_DirEntry): Iso9660_DirEntryBody =
  template this: untyped = result
  this = new(Iso9660_DirEntryBody)
  let root = if root == nil: cast[Iso9660](this) else: cast[Iso9660](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExtAttrRecExpr = this.io.readU1()
  this.lenExtAttrRec = lenExtAttrRecExpr
  let lbaExtentExpr = Iso9660_U4bi.read(this.io, this.root, this)
  this.lbaExtent = lbaExtentExpr
  let sizeExtentExpr = Iso9660_U4bi.read(this.io, this.root, this)
  this.sizeExtent = sizeExtentExpr
  let datetimeExpr = Iso9660_Datetime.read(this.io, this.root, this)
  this.datetime = datetimeExpr
  let fileFlagsExpr = this.io.readU1()
  this.fileFlags = fileFlagsExpr
  let fileUnitSizeExpr = this.io.readU1()
  this.fileUnitSize = fileUnitSizeExpr
  let interleaveGapSizeExpr = this.io.readU1()
  this.interleaveGapSize = interleaveGapSizeExpr
  let volSeqNumExpr = Iso9660_U2bi.read(this.io, this.root, this)
  this.volSeqNum = volSeqNumExpr
  let lenFileNameExpr = this.io.readU1()
  this.lenFileName = lenFileNameExpr
  let fileNameExpr = encode(this.io.readBytes(int(this.lenFileName)), "UTF-8")
  this.fileName = fileNameExpr
  if (this.lenFileName %%% 2) == 0:
    let paddingExpr = this.io.readU1()
    this.padding = paddingExpr
  let restExpr = this.io.readBytesFull()
  this.rest = restExpr

proc extentAsDir(this: Iso9660_DirEntryBody): Iso9660_DirEntries = 
  if this.extentAsDirInstFlag:
    return this.extentAsDirInst
  if (this.fileFlags and 2) != 0:
    let io = Iso9660(this.root).io
    let pos = io.pos()
    io.seek(int((this.lbaExtent.le * Iso9660(this.root).sectorSize)))
    let rawExtentAsDirInstExpr = io.readBytes(int(this.sizeExtent.le))
    this.rawExtentAsDirInst = rawExtentAsDirInstExpr
    let rawExtentAsDirInstIo = newKaitaiStream(rawExtentAsDirInstExpr)
    let extentAsDirInstExpr = Iso9660_DirEntries.read(rawExtentAsDirInstIo, this.root, this)
    this.extentAsDirInst = extentAsDirInstExpr
    io.seek(pos)
  this.extentAsDirInstFlag = true
  return this.extentAsDirInst

proc extentAsFile(this: Iso9660_DirEntryBody): seq[byte] = 
  if this.extentAsFileInstFlag:
    return this.extentAsFileInst
  if (this.fileFlags and 2) == 0:
    let io = Iso9660(this.root).io
    let pos = io.pos()
    io.seek(int((this.lbaExtent.le * Iso9660(this.root).sectorSize)))
    let extentAsFileInstExpr = io.readBytes(int(this.sizeExtent.le))
    this.extentAsFileInst = extentAsFileInstExpr
    io.seek(pos)
  this.extentAsFileInstFlag = true
  return this.extentAsFileInst

proc fromFile*(_: typedesc[Iso9660_DirEntryBody], filename: string): Iso9660_DirEntryBody =
  Iso9660_DirEntryBody.read(newKaitaiFileStream(filename), nil, nil)

