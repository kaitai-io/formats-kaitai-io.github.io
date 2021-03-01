import kaitai_struct_nim_runtime
import options

type
  WindowsResourceFile* = ref object of KaitaiStruct
    `resources`*: seq[WindowsResourceFile_Resource]
    `parent`*: KaitaiStruct
  WindowsResourceFile_Resource* = ref object of KaitaiStruct
    `valueSize`*: uint32
    `headerSize`*: uint32
    `type`*: WindowsResourceFile_UnicodeOrId
    `name`*: WindowsResourceFile_UnicodeOrId
    `padding1`*: seq[byte]
    `formatVersion`*: uint32
    `flags`*: uint16
    `language`*: uint16
    `valueVersion`*: uint32
    `characteristics`*: uint32
    `value`*: seq[byte]
    `padding2`*: seq[byte]
    `parent`*: WindowsResourceFile
    `typeAsPredefInst`*: WindowsResourceFile_Resource_PredefTypes
  WindowsResourceFile_Resource_PredefTypes* = enum
    cursor = 1
    bitmap = 2
    icon = 3
    menu = 4
    dialog = 5
    string = 6
    fontdir = 7
    font = 8
    accelerator = 9
    rcdata = 10
    messagetable = 11
    group_cursor = 12
    group_icon = 14
    version = 16
    dlginclude = 17
    plugplay = 19
    vxd = 20
    anicursor = 21
    aniicon = 22
    html = 23
    manifest = 24
  WindowsResourceFile_UnicodeOrId* = ref object of KaitaiStruct
    `first`*: uint16
    `asNumeric`*: uint16
    `rest`*: seq[uint16]
    `noop`*: seq[byte]
    `parent`*: WindowsResourceFile_Resource
    `savePos1Inst`*: int
    `savePos2Inst`*: int
    `isStringInst`*: bool
    `asStringInst`*: string

proc read*(_: typedesc[WindowsResourceFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsResourceFile
proc read*(_: typedesc[WindowsResourceFile_Resource], io: KaitaiStream, root: KaitaiStruct, parent: WindowsResourceFile): WindowsResourceFile_Resource
proc read*(_: typedesc[WindowsResourceFile_UnicodeOrId], io: KaitaiStream, root: KaitaiStruct, parent: WindowsResourceFile_Resource): WindowsResourceFile_UnicodeOrId

proc typeAsPredef*(this: WindowsResourceFile_Resource): WindowsResourceFile_Resource_PredefTypes
proc savePos1*(this: WindowsResourceFile_UnicodeOrId): int
proc savePos2*(this: WindowsResourceFile_UnicodeOrId): int
proc isString*(this: WindowsResourceFile_UnicodeOrId): bool
proc asString*(this: WindowsResourceFile_UnicodeOrId): string


##[
Windows resource file (.res) are binary bundles of
"resources". Resource has some sort of ID (numerical or string),
type (predefined or user-defined), and raw value. Resource files can
be seen standalone (as .res file), or embedded inside PE executable
(.exe, .dll) files.

Typical use cases include:

* providing information about the application (such as title, copyrights, etc)
* embedding icon(s) to be displayed in file managers into .exe
* adding non-code data into the binary, such as menus, dialog forms,
  cursor images, fonts, various misc bitmaps, and locale-aware
  strings

Windows provides special API to access "resources" from a binary.

Normally, resources files are created with `rc` compiler: it takes a
.rc file (so called "resource-definition script") + all the raw
resource binary files for input, and outputs .res file. That .res
file can be linked into an .exe / .dll afterwards using a linker.

Internally, resource file is just a sequence of individual resource
definitions. RC tool ensures that first resource (#0) is always
empty.

]##
proc read*(_: typedesc[WindowsResourceFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): WindowsResourceFile =
  template this: untyped = result
  this = new(WindowsResourceFile)
  let root = if root == nil: cast[WindowsResourceFile](this) else: cast[WindowsResourceFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = WindowsResourceFile_Resource.read(this.io, this.root, this)
      this.resources.add(it)
      inc i

proc fromFile*(_: typedesc[WindowsResourceFile], filename: string): WindowsResourceFile =
  WindowsResourceFile.read(newKaitaiFileStream(filename), nil, nil)


##[
Each resource has a `type` and a `name`, which can be used to
identify it, and a `value`. Both `type` and `name` can be a
number or a string.

@see <a href="https://docs.microsoft.com/en-us/windows/win32/menurc/resourceheader">Source</a>
]##
proc read*(_: typedesc[WindowsResourceFile_Resource], io: KaitaiStream, root: KaitaiStruct, parent: WindowsResourceFile): WindowsResourceFile_Resource =
  template this: untyped = result
  this = new(WindowsResourceFile_Resource)
  let root = if root == nil: cast[WindowsResourceFile](this) else: cast[WindowsResourceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Size of resource value that follows the header
  ]##
  let valueSizeExpr = this.io.readU4le()
  this.valueSize = valueSizeExpr

  ##[
  Size of this header (i.e. every field except `value` and an
optional padding after it)

  ]##
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr
  let typeExpr = WindowsResourceFile_UnicodeOrId.read(this.io, this.root, this)
  this.type = typeExpr
  let nameExpr = WindowsResourceFile_UnicodeOrId.read(this.io, this.root, this)
  this.name = nameExpr
  let padding1Expr = this.io.readBytes(int(((4 - this.io.pos) %%% 4)))
  this.padding1 = padding1Expr
  let formatVersionExpr = this.io.readU4le()
  this.formatVersion = formatVersionExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr
  let languageExpr = this.io.readU2le()
  this.language = languageExpr

  ##[
  Version for value, as specified by a user.
  ]##
  let valueVersionExpr = this.io.readU4le()
  this.valueVersion = valueVersionExpr

  ##[
  Extra 4 bytes that can be used by user for any purpose.
  ]##
  let characteristicsExpr = this.io.readU4le()
  this.characteristics = characteristicsExpr
  let valueExpr = this.io.readBytes(int(this.valueSize))
  this.value = valueExpr
  let padding2Expr = this.io.readBytes(int(((4 - this.io.pos) %%% 4)))
  this.padding2 = padding2Expr

proc typeAsPredef(this: WindowsResourceFile_Resource): WindowsResourceFile_Resource_PredefTypes = 

  ##[
  Numeric type IDs in range of [0..0xff] are reserved for
system usage in Windows, and there are some predefined,
well-known values in that range. This instance allows to get
it as enum value, if applicable.

  ]##
  if this.typeAsPredefInst != nil:
    return this.typeAsPredefInst
  if  ((not(this.type.isString)) and (this.type.asNumeric <= 255)) :
    let typeAsPredefInstExpr = WindowsResourceFile_Resource_PredefTypes(WindowsResourceFile_Resource_PredefTypes(this.type.asNumeric))
    this.typeAsPredefInst = typeAsPredefInstExpr
  if this.typeAsPredefInst != nil:
    return this.typeAsPredefInst

proc fromFile*(_: typedesc[WindowsResourceFile_Resource], filename: string): WindowsResourceFile_Resource =
  WindowsResourceFile_Resource.read(newKaitaiFileStream(filename), nil, nil)


##[
Resources use a special serialization of names and types: they
can be either a number or a string.

Use `is_string` to check which kind we've got here, and then use
`as_numeric` or `as_string` to get relevant value.

]##
proc read*(_: typedesc[WindowsResourceFile_UnicodeOrId], io: KaitaiStream, root: KaitaiStruct, parent: WindowsResourceFile_Resource): WindowsResourceFile_UnicodeOrId =
  template this: untyped = result
  this = new(WindowsResourceFile_UnicodeOrId)
  let root = if root == nil: cast[WindowsResourceFile](this) else: cast[WindowsResourceFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.savePos1 >= 0:
    let firstExpr = this.io.readU2le()
    this.first = firstExpr
  if not(this.isString):
    let asNumericExpr = this.io.readU2le()
    this.asNumeric = asNumericExpr
  if this.isString:
    block:
      var i: int
      while true:
        let it = this.io.readU2le()
        this.rest.add(it)
        if it == 0:
          break
        inc i
  if  ((this.isString) and (this.savePos2 >= 0)) :
    let noopExpr = this.io.readBytes(int(0))
    this.noop = noopExpr

proc savePos1(this: WindowsResourceFile_UnicodeOrId): int = 
  if this.savePos1Inst != nil:
    return this.savePos1Inst
  let savePos1InstExpr = int(this.io.pos)
  this.savePos1Inst = savePos1InstExpr
  if this.savePos1Inst != nil:
    return this.savePos1Inst

proc savePos2(this: WindowsResourceFile_UnicodeOrId): int = 
  if this.savePos2Inst != nil:
    return this.savePos2Inst
  let savePos2InstExpr = int(this.io.pos)
  this.savePos2Inst = savePos2InstExpr
  if this.savePos2Inst != nil:
    return this.savePos2Inst

proc isString(this: WindowsResourceFile_UnicodeOrId): bool = 
  if this.isStringInst != nil:
    return this.isStringInst
  let isStringInstExpr = bool(this.first != 65535)
  this.isStringInst = isStringInstExpr
  if this.isStringInst != nil:
    return this.isStringInst

proc asString(this: WindowsResourceFile_UnicodeOrId): string = 
  if this.asStringInst.len != 0:
    return this.asStringInst
  if this.isString:
    let pos = this.io.pos()
    this.io.seek(int(this.savePos1))
    let asStringInstExpr = encode(this.io.readBytes(int(((this.savePos2 - this.savePos1) - 2))), "UTF-16LE")
    this.asStringInst = asStringInstExpr
    this.io.seek(pos)
  if this.asStringInst.len != 0:
    return this.asStringInst

proc fromFile*(_: typedesc[WindowsResourceFile_UnicodeOrId], filename: string): WindowsResourceFile_UnicodeOrId =
  WindowsResourceFile_UnicodeOrId.read(newKaitaiFileStream(filename), nil, nil)

