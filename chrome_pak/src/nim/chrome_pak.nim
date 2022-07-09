import kaitai_struct_nim_runtime
import options

type
  ChromePak* = ref object of KaitaiStruct
    `version`*: uint32
    `numResourcesV4`*: uint32
    `encoding`*: ChromePak_Encodings
    `v5Part`*: ChromePak_HeaderV5Part
    `resources`*: seq[ChromePak_Resource]
    `aliases`*: seq[ChromePak_Alias]
    `parent`*: KaitaiStruct
    `numResourcesInst`: uint32
    `numResourcesInstFlag`: bool
    `numAliasesInst`: uint16
    `numAliasesInstFlag`: bool
  ChromePak_Encodings* = enum
    binary = 0
    utf8 = 1
    utf16 = 2
  ChromePak_HeaderV5Part* = ref object of KaitaiStruct
    `encodingPadding`*: seq[byte]
    `numResources`*: uint16
    `numAliases`*: uint16
    `parent`*: ChromePak
  ChromePak_Resource* = ref object of KaitaiStruct
    `id`*: uint16
    `ofsBody`*: uint32
    `idx`*: int32
    `hasBody`*: bool
    `parent`*: ChromePak
    `lenBodyInst`: int
    `lenBodyInstFlag`: bool
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
  ChromePak_Alias* = ref object of KaitaiStruct
    `id`*: uint16
    `resourceIdx`*: uint16
    `parent`*: ChromePak
    `resourceInst`: ChromePak_Resource
    `resourceInstFlag`: bool

proc read*(_: typedesc[ChromePak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ChromePak
proc read*(_: typedesc[ChromePak_HeaderV5Part], io: KaitaiStream, root: KaitaiStruct, parent: ChromePak): ChromePak_HeaderV5Part
proc read*(_: typedesc[ChromePak_Resource], io: KaitaiStream, root: KaitaiStruct, parent: ChromePak, idx: any, hasBody: any): ChromePak_Resource
proc read*(_: typedesc[ChromePak_Alias], io: KaitaiStream, root: KaitaiStruct, parent: ChromePak): ChromePak_Alias

proc numResources*(this: ChromePak): uint32
proc numAliases*(this: ChromePak): uint16
proc lenBody*(this: ChromePak_Resource): int
proc body*(this: ChromePak_Resource): seq[byte]
proc resource*(this: ChromePak_Alias): ChromePak_Resource


##[
Format mostly used by Google Chrome and various Android apps to store
resources such as translated strings, help messages and images.

@see <a href="https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings">Source</a>
@see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py">Source</a>
@see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py">Source</a>
]##
proc read*(_: typedesc[ChromePak], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ChromePak =
  template this: untyped = result
  this = new(ChromePak)
  let root = if root == nil: cast[ChromePak](this) else: cast[ChromePak](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  only versions 4 and 5 are supported
  ]##
  let versionExpr = this.io.readU4le()
  this.version = versionExpr
  if this.version == 4:
    let numResourcesV4Expr = this.io.readU4le()
    this.numResourcesV4 = numResourcesV4Expr

  ##[
  Character encoding of all text resources in the PAK file. Note that
the file can **always** contain binary resources, this only applies to
those that are supposed to hold text.

In practice, this will probably always be `encodings::utf8` - I haven't
seen any organic file that would state otherwise. `UTF8` is also usually
hardcoded in Python scripts from the GRIT repository that generate .pak
files (for example
[`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).

  ]##
  let encodingExpr = ChromePak_Encodings(this.io.readU1())
  this.encoding = encodingExpr
  if this.version == 5:
    let v5PartExpr = ChromePak_HeaderV5Part.read(this.io, this.root, this)
    this.v5Part = v5PartExpr

  ##[
  The length is calculated by looking at the offset of
the next item, so an extra entry is stored with id 0
and offset pointing to the end of the resources.

  ]##
  for i in 0 ..< int((this.numResources + 1)):
    let it = ChromePak_Resource.read(this.io, this.root, this, i, i < this.numResources)
    this.resources.add(it)
  for i in 0 ..< int(this.numAliases):
    let it = ChromePak_Alias.read(this.io, this.root, this)
    this.aliases.add(it)

proc numResources(this: ChromePak): uint32 = 
  if this.numResourcesInstFlag:
    return this.numResourcesInst
  let numResourcesInstExpr = uint32((if this.version == 5: this.v5Part.numResources else: this.numResourcesV4))
  this.numResourcesInst = numResourcesInstExpr
  this.numResourcesInstFlag = true
  return this.numResourcesInst

proc numAliases(this: ChromePak): uint16 = 
  if this.numAliasesInstFlag:
    return this.numAliasesInst
  let numAliasesInstExpr = uint16((if this.version == 5: this.v5Part.numAliases else: 0))
  this.numAliasesInst = numAliasesInstExpr
  this.numAliasesInstFlag = true
  return this.numAliasesInst

proc fromFile*(_: typedesc[ChromePak], filename: string): ChromePak =
  ChromePak.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ChromePak_HeaderV5Part], io: KaitaiStream, root: KaitaiStruct, parent: ChromePak): ChromePak_HeaderV5Part =
  template this: untyped = result
  this = new(ChromePak_HeaderV5Part)
  let root = if root == nil: cast[ChromePak](this) else: cast[ChromePak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let encodingPaddingExpr = this.io.readBytes(int(3))
  this.encodingPadding = encodingPaddingExpr
  let numResourcesExpr = this.io.readU2le()
  this.numResources = numResourcesExpr
  let numAliasesExpr = this.io.readU2le()
  this.numAliases = numAliasesExpr

proc fromFile*(_: typedesc[ChromePak_HeaderV5Part], filename: string): ChromePak_HeaderV5Part =
  ChromePak_HeaderV5Part.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ChromePak_Resource], io: KaitaiStream, root: KaitaiStruct, parent: ChromePak, idx: any, hasBody: any): ChromePak_Resource =
  template this: untyped = result
  this = new(ChromePak_Resource)
  let root = if root == nil: cast[ChromePak](this) else: cast[ChromePak](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = int32(idx)
  this.idx = idxExpr
  let hasBodyExpr = bool(hasBody)
  this.hasBody = hasBodyExpr

  let idExpr = this.io.readU2le()
  this.id = idExpr
  let ofsBodyExpr = this.io.readU4le()
  this.ofsBody = ofsBodyExpr

proc lenBody(this: ChromePak_Resource): int = 

  ##[
  MUST NOT be accessed until the next `resource` is parsed
  ]##
  if this.lenBodyInstFlag:
    return this.lenBodyInst
  if this.hasBody:
    let lenBodyInstExpr = int((this.parent.resources[(this.idx + 1)].ofsBody - this.ofsBody))
    this.lenBodyInst = lenBodyInstExpr
  this.lenBodyInstFlag = true
  return this.lenBodyInst

proc body(this: ChromePak_Resource): seq[byte] = 

  ##[
  MUST NOT be accessed until the next `resource` is parsed
  ]##
  if this.bodyInstFlag:
    return this.bodyInst
  if this.hasBody:
    let pos = this.io.pos()
    this.io.seek(int(this.ofsBody))
    let bodyInstExpr = this.io.readBytes(int(this.lenBody))
    this.bodyInst = bodyInstExpr
    this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[ChromePak_Resource], filename: string): ChromePak_Resource =
  ChromePak_Resource.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ChromePak_Alias], io: KaitaiStream, root: KaitaiStruct, parent: ChromePak): ChromePak_Alias =
  template this: untyped = result
  this = new(ChromePak_Alias)
  let root = if root == nil: cast[ChromePak](this) else: cast[ChromePak](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU2le()
  this.id = idExpr
  let resourceIdxExpr = this.io.readU2le()
  this.resourceIdx = resourceIdxExpr

proc resource(this: ChromePak_Alias): ChromePak_Resource = 
  if this.resourceInstFlag:
    return this.resourceInst
  let resourceInstExpr = ChromePak_Resource(this.parent.resources[this.resourceIdx])
  this.resourceInst = resourceInstExpr
  this.resourceInstFlag = true
  return this.resourceInst

proc fromFile*(_: typedesc[ChromePak_Alias], filename: string): ChromePak_Alias =
  ChromePak_Alias.read(newKaitaiFileStream(filename), nil, nil)

