import kaitai_struct_nim_runtime
import options

type
  AppleSingleDouble* = ref object of KaitaiStruct
    `magic`*: AppleSingleDouble_FileType
    `version`*: uint32
    `reserved`*: seq[byte]
    `numEntries`*: uint16
    `entries`*: seq[AppleSingleDouble_Entry]
    `parent`*: KaitaiStruct
  AppleSingleDouble_FileType* = enum
    apple_single = 333312
    apple_double = 333319
  AppleSingleDouble_Entry* = ref object of KaitaiStruct
    `type`*: AppleSingleDouble_Entry_Types
    `ofsBody`*: uint32
    `lenBody`*: uint32
    `parent`*: AppleSingleDouble
    `rawBodyInst`*: seq[byte]
    `bodyInst`*: KaitaiStruct
  AppleSingleDouble_Entry_Types* = enum
    data_fork = 1
    resource_fork = 2
    real_name = 3
    comment = 4
    icon_bw = 5
    icon_color = 6
    file_dates_info = 8
    finder_info = 9
    macintosh_file_info = 10
    prodos_file_info = 11
    msdos_file_info = 12
    afp_short_name = 13
    afp_file_info = 14
    afp_directory_id = 15
  AppleSingleDouble_FinderInfo* = ref object of KaitaiStruct
    `fileType`*: seq[byte]
    `fileCreator`*: seq[byte]
    `flags`*: uint16
    `location`*: AppleSingleDouble_Point
    `folderId`*: uint16
    `parent`*: AppleSingleDouble_Entry
  AppleSingleDouble_Point* = ref object of KaitaiStruct
    `x`*: uint16
    `y`*: uint16
    `parent`*: AppleSingleDouble_FinderInfo

proc read*(_: typedesc[AppleSingleDouble], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AppleSingleDouble
proc read*(_: typedesc[AppleSingleDouble_Entry], io: KaitaiStream, root: KaitaiStruct, parent: AppleSingleDouble): AppleSingleDouble_Entry
proc read*(_: typedesc[AppleSingleDouble_FinderInfo], io: KaitaiStream, root: KaitaiStruct, parent: AppleSingleDouble_Entry): AppleSingleDouble_FinderInfo
proc read*(_: typedesc[AppleSingleDouble_Point], io: KaitaiStream, root: KaitaiStruct, parent: AppleSingleDouble_FinderInfo): AppleSingleDouble_Point

proc body*(this: AppleSingleDouble_Entry): KaitaiStruct


##[
AppleSingle and AppleDouble files are used by certain Mac
applications (e.g. Finder) to store Mac-specific file attributes on
filesystems that do not support that.

Syntactically, both formats are the same, the only difference is how
they are being used:

* AppleSingle means that only one file will be created on external
  filesystem that will hold both the data (AKA "data fork" in Apple
  terminology), and the attributes (AKA "resource fork").
* AppleDouble means that two files will be created: a normal file
  that keeps the data ("data fork") is kept separately from an
  auxiliary file that contains attributes ("resource fork"), which
  is kept with the same name, but starting with an extra dot and
  underscore `._` to keep it hidden.

In modern practice (Mac OS X), Finder only uses AppleDouble to keep
compatibility with other OSes, as virtually nobody outside of Mac
understands how to access data in AppleSingle container.

@see <a href="http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf">Source</a>
]##
proc read*(_: typedesc[AppleSingleDouble], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AppleSingleDouble =
  template this: untyped = result
  this = new(AppleSingleDouble)
  let root = if root == nil: cast[AppleSingleDouble](this) else: cast[AppleSingleDouble](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = AppleSingleDouble_FileType(this.io.readU4be())
  this.magic = magicExpr
  let versionExpr = this.io.readU4be()
  this.version = versionExpr

  ##[
  Must be all 0.
  ]##
  let reservedExpr = this.io.readBytes(int(16))
  this.reserved = reservedExpr
  let numEntriesExpr = this.io.readU2be()
  this.numEntries = numEntriesExpr
  for i in 0 ..< int(this.numEntries):
    let it = AppleSingleDouble_Entry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[AppleSingleDouble], filename: string): AppleSingleDouble =
  AppleSingleDouble.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AppleSingleDouble_Entry], io: KaitaiStream, root: KaitaiStruct, parent: AppleSingleDouble): AppleSingleDouble_Entry =
  template this: untyped = result
  this = new(AppleSingleDouble_Entry)
  let root = if root == nil: cast[AppleSingleDouble](this) else: cast[AppleSingleDouble](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = AppleSingleDouble_Entry_Types(this.io.readU4be())
  this.type = typeExpr
  let ofsBodyExpr = this.io.readU4be()
  this.ofsBody = ofsBodyExpr
  let lenBodyExpr = this.io.readU4be()
  this.lenBody = lenBodyExpr

proc body(this: AppleSingleDouble_Entry): KaitaiStruct = 
  if this.bodyInst != nil:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsBody))
  block:
    let on = this.type
    if on == apple_single_double.finder_info:
      let rawBodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.rawBodyInst = rawBodyInstExpr
      let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
      let bodyInstExpr = AppleSingleDouble_FinderInfo.read(rawBodyInstIo, this.root, this)
      this.bodyInst = bodyInstExpr
    else:
      let bodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  if this.bodyInst != nil:
    return this.bodyInst

proc fromFile*(_: typedesc[AppleSingleDouble_Entry], filename: string): AppleSingleDouble_Entry =
  AppleSingleDouble_Entry.read(newKaitaiFileStream(filename), nil, nil)


##[
Information specific to Finder
@see "older Inside Macintosh, Volume II page 84 or Volume IV page 104."
]##
proc read*(_: typedesc[AppleSingleDouble_FinderInfo], io: KaitaiStream, root: KaitaiStruct, parent: AppleSingleDouble_Entry): AppleSingleDouble_FinderInfo =
  template this: untyped = result
  this = new(AppleSingleDouble_FinderInfo)
  let root = if root == nil: cast[AppleSingleDouble](this) else: cast[AppleSingleDouble](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileTypeExpr = this.io.readBytes(int(4))
  this.fileType = fileTypeExpr
  let fileCreatorExpr = this.io.readBytes(int(4))
  this.fileCreator = fileCreatorExpr
  let flagsExpr = this.io.readU2be()
  this.flags = flagsExpr

  ##[
  File icon's coordinates when displaying this folder.
  ]##
  let locationExpr = AppleSingleDouble_Point.read(this.io, this.root, this)
  this.location = locationExpr

  ##[
  File folder ID (=window).
  ]##
  let folderIdExpr = this.io.readU2be()
  this.folderId = folderIdExpr

proc fromFile*(_: typedesc[AppleSingleDouble_FinderInfo], filename: string): AppleSingleDouble_FinderInfo =
  AppleSingleDouble_FinderInfo.read(newKaitaiFileStream(filename), nil, nil)


##[
Specifies 2D coordinate in QuickDraw grid.
]##
proc read*(_: typedesc[AppleSingleDouble_Point], io: KaitaiStream, root: KaitaiStruct, parent: AppleSingleDouble_FinderInfo): AppleSingleDouble_Point =
  template this: untyped = result
  this = new(AppleSingleDouble_Point)
  let root = if root == nil: cast[AppleSingleDouble](this) else: cast[AppleSingleDouble](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readU2be()
  this.x = xExpr
  let yExpr = this.io.readU2be()
  this.y = yExpr

proc fromFile*(_: typedesc[AppleSingleDouble_Point], filename: string): AppleSingleDouble_Point =
  AppleSingleDouble_Point.read(newKaitaiFileStream(filename), nil, nil)

