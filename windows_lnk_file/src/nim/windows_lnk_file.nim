import kaitai_struct_nim_runtime
import options
import windows_shell_items

type
  WindowsLnkFile* = ref object of KaitaiStruct
    `header`*: WindowsLnkFile_FileHeader
    `targetIdList`*: WindowsLnkFile_LinkTargetIdList
    `info`*: WindowsLnkFile_LinkInfo
    `name`*: WindowsLnkFile_StringData
    `relPath`*: WindowsLnkFile_StringData
    `workDir`*: WindowsLnkFile_StringData
    `arguments`*: WindowsLnkFile_StringData
    `iconLocation`*: WindowsLnkFile_StringData
    `parent`*: KaitaiStruct
  WindowsLnkFile_DriveTypes* = enum
    unknown = 0
    no_root_dir = 1
    removable = 2
    fixed = 3
    remote = 4
    cdrom = 5
    ramdisk = 6
  WindowsLnkFile_WindowState* = enum
    normal = 1
    maximized = 3
    min_no_active = 7
  WindowsLnkFile_FileHeader* = ref object of KaitaiStruct
    `lenHeader`*: seq[byte]
    `linkClsid`*: seq[byte]
    `flags`*: WindowsLnkFile_LinkFlags
    `fileAttrs`*: uint32
    `timeCreation`*: uint64
    `timeAccess`*: uint64
    `timeWrite`*: uint64
    `targetFileSize`*: uint32
    `iconIndex`*: int32
    `showCommand`*: WindowsLnkFile_WindowState
    `hotkey`*: uint16
    `reserved`*: seq[byte]
    `parent`*: WindowsLnkFile
    `rawFlags`*: seq[byte]
  WindowsLnkFile_LinkFlags* = ref object of KaitaiStruct
    `isUnicode`*: bool
    `hasIconLocation`*: bool
    `hasArguments`*: bool
    `hasWorkDir`*: bool
    `hasRelPath`*: bool
    `hasName`*: bool
    `hasLinkInfo`*: bool
    `hasLinkTargetIdList`*: bool
    `unnamed8`*: uint64
    `reserved`*: uint64
    `keepLocalIdListForUncTarget`*: bool
    `unnamed11`*: uint64
    `parent`*: WindowsLnkFile_FileHeader
  WindowsLnkFile_LinkInfo* = ref object of KaitaiStruct
    `lenAll`*: uint32
    `all`*: WindowsLnkFile_LinkInfo_All
    `parent`*: WindowsLnkFile
    `rawAll`*: seq[byte]
  WindowsLnkFile_LinkInfo_All* = ref object of KaitaiStruct
    `lenHeader`*: uint32
    `header`*: WindowsLnkFile_LinkInfo_Header
    `parent`*: WindowsLnkFile_LinkInfo
    `rawHeader`*: seq[byte]
    `localBasePathInst`: seq[byte]
    `localBasePathInstFlag`: bool
    `volumeIdInst`: WindowsLnkFile_LinkInfo_VolumeIdSpec
    `volumeIdInstFlag`: bool
  WindowsLnkFile_LinkInfo_Header* = ref object of KaitaiStruct
    `flags`*: WindowsLnkFile_LinkInfo_LinkInfoFlags
    `ofsVolumeId`*: uint32
    `ofsLocalBasePath`*: uint32
    `ofsCommonNetRelLink`*: uint32
    `ofsCommonPathSuffix`*: uint32
    `ofsLocalBasePathUnicode`*: uint32
    `ofsCommonPathSuffixUnicode`*: uint32
    `parent`*: WindowsLnkFile_LinkInfo_All
  WindowsLnkFile_LinkInfo_LinkInfoFlags* = ref object of KaitaiStruct
    `reserved1`*: uint64
    `hasCommonNetRelLink`*: bool
    `hasVolumeIdAndLocalBasePath`*: bool
    `reserved2`*: uint64
    `parent`*: WindowsLnkFile_LinkInfo_Header
  WindowsLnkFile_LinkInfo_VolumeIdBody* = ref object of KaitaiStruct
    `driveType`*: WindowsLnkFile_DriveTypes
    `driveSerialNumber`*: uint32
    `ofsVolumeLabel`*: uint32
    `ofsVolumeLabelUnicode`*: uint32
    `parent`*: WindowsLnkFile_LinkInfo_VolumeIdSpec
    `isUnicodeInst`: bool
    `isUnicodeInstFlag`: bool
    `volumeLabelAnsiInst`: string
    `volumeLabelAnsiInstFlag`: bool
  WindowsLnkFile_LinkInfo_VolumeIdSpec* = ref object of KaitaiStruct
    `lenAll`*: uint32
    `body`*: WindowsLnkFile_LinkInfo_VolumeIdBody
    `parent`*: WindowsLnkFile_LinkInfo_All
    `rawBody`*: seq[byte]
  WindowsLnkFile_LinkTargetIdList* = ref object of KaitaiStruct
    `lenIdList`*: uint16
    `idList`*: WindowsShellItems
    `parent`*: WindowsLnkFile
    `rawIdList`*: seq[byte]
  WindowsLnkFile_StringData* = ref object of KaitaiStruct
    `charsStr`*: uint16
    `str`*: string
    `parent`*: WindowsLnkFile

proc read*(_: typedesc[WindowsLnkFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsLnkFile
proc read*(_: typedesc[WindowsLnkFile_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_FileHeader
proc read*(_: typedesc[WindowsLnkFile_LinkFlags], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_FileHeader): WindowsLnkFile_LinkFlags
proc read*(_: typedesc[WindowsLnkFile_LinkInfo], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_LinkInfo
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_All], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo): WindowsLnkFile_LinkInfo_All
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_Header], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_All): WindowsLnkFile_LinkInfo_Header
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_LinkInfoFlags], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_Header): WindowsLnkFile_LinkInfo_LinkInfoFlags
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_VolumeIdBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_VolumeIdSpec): WindowsLnkFile_LinkInfo_VolumeIdBody
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_VolumeIdSpec], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_All): WindowsLnkFile_LinkInfo_VolumeIdSpec
proc read*(_: typedesc[WindowsLnkFile_LinkTargetIdList], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_LinkTargetIdList
proc read*(_: typedesc[WindowsLnkFile_StringData], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_StringData

proc localBasePath*(this: WindowsLnkFile_LinkInfo_All): seq[byte]
proc volumeId*(this: WindowsLnkFile_LinkInfo_All): WindowsLnkFile_LinkInfo_VolumeIdSpec
proc isUnicode*(this: WindowsLnkFile_LinkInfo_VolumeIdBody): bool
proc volumeLabelAnsi*(this: WindowsLnkFile_LinkInfo_VolumeIdBody): string


##[
Windows .lnk files (AKA "shell link" file) are most frequently used
in Windows shell to create "shortcuts" to another files, usually for
purposes of running a program from some other directory, sometimes
with certain preconfigured arguments and some other options.

@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Source</a>
]##
proc read*(_: typedesc[WindowsLnkFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsLnkFile =
  template this: untyped = result
  this = new(WindowsLnkFile)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = WindowsLnkFile_FileHeader.read(this.io, this.root, this)
  this.header = headerExpr
  if this.header.flags.hasLinkTargetIdList:
    let targetIdListExpr = WindowsLnkFile_LinkTargetIdList.read(this.io, this.root, this)
    this.targetIdList = targetIdListExpr
  if this.header.flags.hasLinkInfo:
    let infoExpr = WindowsLnkFile_LinkInfo.read(this.io, this.root, this)
    this.info = infoExpr
  if this.header.flags.hasName:
    let nameExpr = WindowsLnkFile_StringData.read(this.io, this.root, this)
    this.name = nameExpr
  if this.header.flags.hasRelPath:
    let relPathExpr = WindowsLnkFile_StringData.read(this.io, this.root, this)
    this.relPath = relPathExpr
  if this.header.flags.hasWorkDir:
    let workDirExpr = WindowsLnkFile_StringData.read(this.io, this.root, this)
    this.workDir = workDirExpr
  if this.header.flags.hasArguments:
    let argumentsExpr = WindowsLnkFile_StringData.read(this.io, this.root, this)
    this.arguments = argumentsExpr
  if this.header.flags.hasIconLocation:
    let iconLocationExpr = WindowsLnkFile_StringData.read(this.io, this.root, this)
    this.iconLocation = iconLocationExpr

proc fromFile*(_: typedesc[WindowsLnkFile], filename: string): WindowsLnkFile =
  WindowsLnkFile.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.1</a>
]##
proc read*(_: typedesc[WindowsLnkFile_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_FileHeader =
  template this: untyped = result
  this = new(WindowsLnkFile_FileHeader)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Technically, a size of the header, but in reality, it's
fixed by standard.

  ]##
  let lenHeaderExpr = this.io.readBytes(int(4))
  this.lenHeader = lenHeaderExpr

  ##[
  16-byte class identified (CLSID), reserved for Windows shell
link files.

  ]##
  let linkClsidExpr = this.io.readBytes(int(16))
  this.linkClsid = linkClsidExpr
  let rawFlagsExpr = this.io.readBytes(int(4))
  this.rawFlags = rawFlagsExpr
  let rawFlagsIo = newKaitaiStream(rawFlagsExpr)
  let flagsExpr = WindowsLnkFile_LinkFlags.read(rawFlagsIo, this.root, this)
  this.flags = flagsExpr
  let fileAttrsExpr = this.io.readU4le()
  this.fileAttrs = fileAttrsExpr
  let timeCreationExpr = this.io.readU8le()
  this.timeCreation = timeCreationExpr
  let timeAccessExpr = this.io.readU8le()
  this.timeAccess = timeAccessExpr
  let timeWriteExpr = this.io.readU8le()
  this.timeWrite = timeWriteExpr

  ##[
  Lower 32 bits of the size of the file that this link targets
  ]##
  let targetFileSizeExpr = this.io.readU4le()
  this.targetFileSize = targetFileSizeExpr

  ##[
  Index of an icon to use from target file
  ]##
  let iconIndexExpr = this.io.readS4le()
  this.iconIndex = iconIndexExpr

  ##[
  Window state to set after the launch of target executable
  ]##
  let showCommandExpr = WindowsLnkFile_WindowState(this.io.readU4le())
  this.showCommand = showCommandExpr
  let hotkeyExpr = this.io.readU2le()
  this.hotkey = hotkeyExpr
  let reservedExpr = this.io.readBytes(int(10))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[WindowsLnkFile_FileHeader], filename: string): WindowsLnkFile_FileHeader =
  WindowsLnkFile_FileHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.1.1</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkFlags], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_FileHeader): WindowsLnkFile_LinkFlags =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkFlags)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let isUnicodeExpr = this.io.readBitsIntBe(1) != 0
  this.isUnicode = isUnicodeExpr
  let hasIconLocationExpr = this.io.readBitsIntBe(1) != 0
  this.hasIconLocation = hasIconLocationExpr
  let hasArgumentsExpr = this.io.readBitsIntBe(1) != 0
  this.hasArguments = hasArgumentsExpr
  let hasWorkDirExpr = this.io.readBitsIntBe(1) != 0
  this.hasWorkDir = hasWorkDirExpr
  let hasRelPathExpr = this.io.readBitsIntBe(1) != 0
  this.hasRelPath = hasRelPathExpr
  let hasNameExpr = this.io.readBitsIntBe(1) != 0
  this.hasName = hasNameExpr
  let hasLinkInfoExpr = this.io.readBitsIntBe(1) != 0
  this.hasLinkInfo = hasLinkInfoExpr
  let hasLinkTargetIdListExpr = this.io.readBitsIntBe(1) != 0
  this.hasLinkTargetIdList = hasLinkTargetIdListExpr
  let unnamed8Expr = this.io.readBitsIntBe(16)
  this.unnamed8 = unnamed8Expr
  let reservedExpr = this.io.readBitsIntBe(5)
  this.reserved = reservedExpr
  let keepLocalIdListForUncTargetExpr = this.io.readBitsIntBe(1) != 0
  this.keepLocalIdListForUncTarget = keepLocalIdListForUncTargetExpr
  let unnamed11Expr = this.io.readBitsIntBe(2)
  this.unnamed11 = unnamed11Expr

proc fromFile*(_: typedesc[WindowsLnkFile_LinkFlags], filename: string): WindowsLnkFile_LinkFlags =
  WindowsLnkFile_LinkFlags.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkInfo], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_LinkInfo =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkInfo)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenAllExpr = this.io.readU4le()
  this.lenAll = lenAllExpr
  let rawAllExpr = this.io.readBytes(int(this.lenAll - 4))
  this.rawAll = rawAllExpr
  let rawAllIo = newKaitaiStream(rawAllExpr)
  let allExpr = WindowsLnkFile_LinkInfo_All.read(rawAllIo, this.root, this)
  this.all = allExpr

proc fromFile*(_: typedesc[WindowsLnkFile_LinkInfo], filename: string): WindowsLnkFile_LinkInfo =
  WindowsLnkFile_LinkInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_All], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo): WindowsLnkFile_LinkInfo_All =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkInfo_All)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenHeaderExpr = this.io.readU4le()
  this.lenHeader = lenHeaderExpr
  let rawHeaderExpr = this.io.readBytes(int(this.lenHeader - 8))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = WindowsLnkFile_LinkInfo_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr

proc localBasePath(this: WindowsLnkFile_LinkInfo_All): seq[byte] = 
  if this.localBasePathInstFlag:
    return this.localBasePathInst
  if this.header.flags.hasVolumeIdAndLocalBasePath:
    let pos = this.io.pos()
    this.io.seek(int(this.header.ofsLocalBasePath - 4))
    let localBasePathInstExpr = this.io.readBytesTerm(0, false, true, true)
    this.localBasePathInst = localBasePathInstExpr
    this.io.seek(pos)
  this.localBasePathInstFlag = true
  return this.localBasePathInst

proc volumeId(this: WindowsLnkFile_LinkInfo_All): WindowsLnkFile_LinkInfo_VolumeIdSpec = 
  if this.volumeIdInstFlag:
    return this.volumeIdInst
  if this.header.flags.hasVolumeIdAndLocalBasePath:
    let pos = this.io.pos()
    this.io.seek(int(this.header.ofsVolumeId - 4))
    let volumeIdInstExpr = WindowsLnkFile_LinkInfo_VolumeIdSpec.read(this.io, this.root, this)
    this.volumeIdInst = volumeIdInstExpr
    this.io.seek(pos)
  this.volumeIdInstFlag = true
  return this.volumeIdInst

proc fromFile*(_: typedesc[WindowsLnkFile_LinkInfo_All], filename: string): WindowsLnkFile_LinkInfo_All =
  WindowsLnkFile_LinkInfo_All.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_Header], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_All): WindowsLnkFile_LinkInfo_Header =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkInfo_Header)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = WindowsLnkFile_LinkInfo_LinkInfoFlags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let ofsVolumeIdExpr = this.io.readU4le()
  this.ofsVolumeId = ofsVolumeIdExpr
  let ofsLocalBasePathExpr = this.io.readU4le()
  this.ofsLocalBasePath = ofsLocalBasePathExpr
  let ofsCommonNetRelLinkExpr = this.io.readU4le()
  this.ofsCommonNetRelLink = ofsCommonNetRelLinkExpr
  let ofsCommonPathSuffixExpr = this.io.readU4le()
  this.ofsCommonPathSuffix = ofsCommonPathSuffixExpr
  if not(this.io.isEof):
    let ofsLocalBasePathUnicodeExpr = this.io.readU4le()
    this.ofsLocalBasePathUnicode = ofsLocalBasePathUnicodeExpr
  if not(this.io.isEof):
    let ofsCommonPathSuffixUnicodeExpr = this.io.readU4le()
    this.ofsCommonPathSuffixUnicode = ofsCommonPathSuffixUnicodeExpr

proc fromFile*(_: typedesc[WindowsLnkFile_LinkInfo_Header], filename: string): WindowsLnkFile_LinkInfo_Header =
  WindowsLnkFile_LinkInfo_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_LinkInfoFlags], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_Header): WindowsLnkFile_LinkInfo_LinkInfoFlags =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkInfo_LinkInfoFlags)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(6)
  this.reserved1 = reserved1Expr
  let hasCommonNetRelLinkExpr = this.io.readBitsIntBe(1) != 0
  this.hasCommonNetRelLink = hasCommonNetRelLinkExpr
  let hasVolumeIdAndLocalBasePathExpr = this.io.readBitsIntBe(1) != 0
  this.hasVolumeIdAndLocalBasePath = hasVolumeIdAndLocalBasePathExpr
  let reserved2Expr = this.io.readBitsIntBe(24)
  this.reserved2 = reserved2Expr

proc fromFile*(_: typedesc[WindowsLnkFile_LinkInfo_LinkInfoFlags], filename: string): WindowsLnkFile_LinkInfo_LinkInfoFlags =
  WindowsLnkFile_LinkInfo_LinkInfoFlags.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3.1</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_VolumeIdBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_VolumeIdSpec): WindowsLnkFile_LinkInfo_VolumeIdBody =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkInfo_VolumeIdBody)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let driveTypeExpr = WindowsLnkFile_DriveTypes(this.io.readU4le())
  this.driveType = driveTypeExpr
  let driveSerialNumberExpr = this.io.readU4le()
  this.driveSerialNumber = driveSerialNumberExpr
  let ofsVolumeLabelExpr = this.io.readU4le()
  this.ofsVolumeLabel = ofsVolumeLabelExpr
  if this.isUnicode:
    let ofsVolumeLabelUnicodeExpr = this.io.readU4le()
    this.ofsVolumeLabelUnicode = ofsVolumeLabelUnicodeExpr

proc isUnicode(this: WindowsLnkFile_LinkInfo_VolumeIdBody): bool = 
  if this.isUnicodeInstFlag:
    return this.isUnicodeInst
  let isUnicodeInstExpr = bool(this.ofsVolumeLabel == 20)
  this.isUnicodeInst = isUnicodeInstExpr
  this.isUnicodeInstFlag = true
  return this.isUnicodeInst

proc volumeLabelAnsi(this: WindowsLnkFile_LinkInfo_VolumeIdBody): string = 
  if this.volumeLabelAnsiInstFlag:
    return this.volumeLabelAnsiInst
  if not(this.isUnicode):
    let pos = this.io.pos()
    this.io.seek(int(this.ofsVolumeLabel - 4))
    let volumeLabelAnsiInstExpr = encode(this.io.readBytesTerm(0, false, true, true), "IBM437")
    this.volumeLabelAnsiInst = volumeLabelAnsiInstExpr
    this.io.seek(pos)
  this.volumeLabelAnsiInstFlag = true
  return this.volumeLabelAnsiInst

proc fromFile*(_: typedesc[WindowsLnkFile_LinkInfo_VolumeIdBody], filename: string): WindowsLnkFile_LinkInfo_VolumeIdBody =
  WindowsLnkFile_LinkInfo_VolumeIdBody.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3.1</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkInfo_VolumeIdSpec], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile_LinkInfo_All): WindowsLnkFile_LinkInfo_VolumeIdSpec =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkInfo_VolumeIdSpec)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenAllExpr = this.io.readU4le()
  this.lenAll = lenAllExpr
  let rawBodyExpr = this.io.readBytes(int(this.lenAll - 4))
  this.rawBody = rawBodyExpr
  let rawBodyIo = newKaitaiStream(rawBodyExpr)
  let bodyExpr = WindowsLnkFile_LinkInfo_VolumeIdBody.read(rawBodyIo, this.root, this)
  this.body = bodyExpr

proc fromFile*(_: typedesc[WindowsLnkFile_LinkInfo_VolumeIdSpec], filename: string): WindowsLnkFile_LinkInfo_VolumeIdSpec =
  WindowsLnkFile_LinkInfo_VolumeIdSpec.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2</a>
]##
proc read*(_: typedesc[WindowsLnkFile_LinkTargetIdList], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_LinkTargetIdList =
  template this: untyped = result
  this = new(WindowsLnkFile_LinkTargetIdList)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenIdListExpr = this.io.readU2le()
  this.lenIdList = lenIdListExpr
  let rawIdListExpr = this.io.readBytes(int(this.lenIdList))
  this.rawIdList = rawIdListExpr
  let rawIdListIo = newKaitaiStream(rawIdListExpr)
  let idListExpr = WindowsShellItems.read(rawIdListIo, nil, nil)
  this.idList = idListExpr

proc fromFile*(_: typedesc[WindowsLnkFile_LinkTargetIdList], filename: string): WindowsLnkFile_LinkTargetIdList =
  WindowsLnkFile_LinkTargetIdList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[WindowsLnkFile_StringData], io: KaitaiStream, root: KaitaiStruct, parent: WindowsLnkFile): WindowsLnkFile_StringData =
  template this: untyped = result
  this = new(WindowsLnkFile_StringData)
  let root = if root == nil: cast[WindowsLnkFile](this) else: cast[WindowsLnkFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let charsStrExpr = this.io.readU2le()
  this.charsStr = charsStrExpr
  let strExpr = encode(this.io.readBytes(int(this.charsStr * 2)), "UTF-16LE")
  this.str = strExpr

proc fromFile*(_: typedesc[WindowsLnkFile_StringData], filename: string): WindowsLnkFile_StringData =
  WindowsLnkFile_StringData.read(newKaitaiFileStream(filename), nil, nil)

