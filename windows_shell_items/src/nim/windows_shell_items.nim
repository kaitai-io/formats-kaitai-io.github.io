import kaitai_struct_nim_runtime
import options

type
  WindowsShellItems* = ref object of KaitaiStruct
    `items`*: seq[WindowsShellItems_ShellItem]
    `parent`*: KaitaiStruct
  WindowsShellItems_ShellItemData* = ref object of KaitaiStruct
    `code`*: uint8
    `body1`*: WindowsShellItems_RootFolderBody
    `body2`*: KaitaiStruct
    `parent`*: WindowsShellItems_ShellItem
  WindowsShellItems_ShellItem* = ref object of KaitaiStruct
    `lenData`*: uint16
    `data`*: WindowsShellItems_ShellItemData
    `parent`*: WindowsShellItems
    `rawData`*: seq[byte]
  WindowsShellItems_RootFolderBody* = ref object of KaitaiStruct
    `sortIndex`*: uint8
    `shellFolderId`*: seq[byte]
    `parent`*: WindowsShellItems_ShellItemData
  WindowsShellItems_VolumeBody* = ref object of KaitaiStruct
    `flags`*: uint8
    `parent`*: WindowsShellItems_ShellItemData
  WindowsShellItems_FileEntryBody* = ref object of KaitaiStruct
    `unnamed0`*: uint8
    `fileSize`*: uint32
    `lastModTime`*: uint32
    `fileAttrs`*: uint16
    `parent`*: WindowsShellItems_ShellItemData
    `isDirInst`: bool
    `isDirInstFlag`: bool
    `isFileInst`: bool
    `isFileInstFlag`: bool

proc read*(_: typedesc[WindowsShellItems], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsShellItems
proc read*(_: typedesc[WindowsShellItems_ShellItemData], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItem): WindowsShellItems_ShellItemData
proc read*(_: typedesc[WindowsShellItems_ShellItem], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems): WindowsShellItems_ShellItem
proc read*(_: typedesc[WindowsShellItems_RootFolderBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItemData): WindowsShellItems_RootFolderBody
proc read*(_: typedesc[WindowsShellItems_VolumeBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItemData): WindowsShellItems_VolumeBody
proc read*(_: typedesc[WindowsShellItems_FileEntryBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItemData): WindowsShellItems_FileEntryBody

proc isDir*(this: WindowsShellItems_FileEntryBody): bool
proc isFile*(this: WindowsShellItems_FileEntryBody): bool


##[
Windows Shell Items (AKA "shellbags") is an undocumented set of
structures used internally within Windows to identify paths in
Windows Folder Hierarchy. It is widely used in Windows Shell (and
most visible in File Explorer), both as in-memory and in-file
structures. Some formats embed them, namely:

* Windows Shell link files (.lnk) Windows registry
* Windows registry "ShellBags" keys

The format is mostly undocumented, and is known to vary between
various Windows versions.

@see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc">Source</a>
]##
proc read*(_: typedesc[WindowsShellItems], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsShellItems =
  template this: untyped = result
  this = new(WindowsShellItems)
  let root = if root == nil: cast[WindowsShellItems](this) else: cast[WindowsShellItems](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.1</a>
  ]##
  block:
    var i: int
    while true:
      let it = WindowsShellItems_ShellItem.read(this.io, this.root, this)
      this.items.add(it)
      if it.lenData == 0:
        break
      inc i

proc fromFile*(_: typedesc[WindowsShellItems], filename: string): WindowsShellItems =
  WindowsShellItems.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[WindowsShellItems_ShellItemData], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItem): WindowsShellItems_ShellItemData =
  template this: untyped = result
  this = new(WindowsShellItems_ShellItemData)
  let root = if root == nil: cast[WindowsShellItems](this) else: cast[WindowsShellItems](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = this.io.readU1()
  this.code = codeExpr
  block:
    let on = this.code
    if on == 31:
      let body1Expr = WindowsShellItems_RootFolderBody.read(this.io, this.root, this)
      this.body1 = body1Expr
  block:
    let on = (this.code and 112)
    if on == 32:
      let body2Expr = WindowsShellItems_VolumeBody.read(this.io, this.root, this)
      this.body2 = body2Expr
    elif on == 48:
      let body2Expr = WindowsShellItems_FileEntryBody.read(this.io, this.root, this)
      this.body2 = body2Expr

proc fromFile*(_: typedesc[WindowsShellItems_ShellItemData], filename: string): WindowsShellItems_ShellItemData =
  WindowsShellItems_ShellItemData.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.2</a>
]##
proc read*(_: typedesc[WindowsShellItems_ShellItem], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems): WindowsShellItems_ShellItem =
  template this: untyped = result
  this = new(WindowsShellItems_ShellItem)
  let root = if root == nil: cast[WindowsShellItems](this) else: cast[WindowsShellItems](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenDataExpr = this.io.readU2le()
  this.lenData = lenDataExpr
  if this.lenData >= 2:
    let rawDataExpr = this.io.readBytes(int((this.lenData - 2)))
    this.rawData = rawDataExpr
    let rawDataIo = newKaitaiStream(rawDataExpr)
    let dataExpr = WindowsShellItems_ShellItemData.read(rawDataIo, this.root, this)
    this.data = dataExpr

proc fromFile*(_: typedesc[WindowsShellItems_ShellItem], filename: string): WindowsShellItems_ShellItem =
  WindowsShellItems_ShellItem.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item">Source</a>
]##
proc read*(_: typedesc[WindowsShellItems_RootFolderBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItemData): WindowsShellItems_RootFolderBody =
  template this: untyped = result
  this = new(WindowsShellItems_RootFolderBody)
  let root = if root == nil: cast[WindowsShellItems](this) else: cast[WindowsShellItems](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sortIndexExpr = this.io.readU1()
  this.sortIndex = sortIndexExpr
  let shellFolderIdExpr = this.io.readBytes(int(16))
  this.shellFolderId = shellFolderIdExpr

proc fromFile*(_: typedesc[WindowsShellItems_RootFolderBody], filename: string): WindowsShellItems_RootFolderBody =
  WindowsShellItems_RootFolderBody.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item">Source</a>
]##
proc read*(_: typedesc[WindowsShellItems_VolumeBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItemData): WindowsShellItems_VolumeBody =
  template this: untyped = result
  this = new(WindowsShellItems_VolumeBody)
  let root = if root == nil: cast[WindowsShellItems](this) else: cast[WindowsShellItems](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr

proc fromFile*(_: typedesc[WindowsShellItems_VolumeBody], filename: string): WindowsShellItems_VolumeBody =
  WindowsShellItems_VolumeBody.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item">Source</a>
]##
proc read*(_: typedesc[WindowsShellItems_FileEntryBody], io: KaitaiStream, root: KaitaiStruct, parent: WindowsShellItems_ShellItemData): WindowsShellItems_FileEntryBody =
  template this: untyped = result
  this = new(WindowsShellItems_FileEntryBody)
  let root = if root == nil: cast[WindowsShellItems](this) else: cast[WindowsShellItems](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unnamed0Expr = this.io.readU1()
  this.unnamed0 = unnamed0Expr
  let fileSizeExpr = this.io.readU4le()
  this.fileSize = fileSizeExpr
  let lastModTimeExpr = this.io.readU4le()
  this.lastModTime = lastModTimeExpr
  let fileAttrsExpr = this.io.readU2le()
  this.fileAttrs = fileAttrsExpr

proc isDir(this: WindowsShellItems_FileEntryBody): bool = 
  if this.isDirInstFlag:
    return this.isDirInst
  let isDirInstExpr = bool((this.parent.code and 1) != 0)
  this.isDirInst = isDirInstExpr
  this.isDirInstFlag = true
  return this.isDirInst

proc isFile(this: WindowsShellItems_FileEntryBody): bool = 
  if this.isFileInstFlag:
    return this.isFileInst
  let isFileInstExpr = bool((this.parent.code and 2) != 0)
  this.isFileInst = isFileInstExpr
  this.isFileInstFlag = true
  return this.isFileInst

proc fromFile*(_: typedesc[WindowsShellItems_FileEntryBody], filename: string): WindowsShellItems_FileEntryBody =
  WindowsShellItems_FileEntryBody.read(newKaitaiFileStream(filename), nil, nil)

