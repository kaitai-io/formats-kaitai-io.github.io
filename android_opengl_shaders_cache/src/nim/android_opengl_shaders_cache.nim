import kaitai_struct_nim_runtime
import options

type
  AndroidOpenglShadersCache* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `crc32`*: uint32
    `contents`*: AndroidOpenglShadersCache_Cache
    `parent`*: KaitaiStruct
    `rawContents`*: seq[byte]
  AndroidOpenglShadersCache_Alignment* = ref object of KaitaiStruct
    `alignment`*: seq[byte]
    `parent`*: KaitaiStruct
  AndroidOpenglShadersCache_Cache* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `deviceVersion`*: uint32
    `numEntries`*: uint32
    `buildId`*: AndroidOpenglShadersCache_PrefixedString
    `entries`*: seq[AndroidOpenglShadersCache_Cache_Entry]
    `parent`*: AndroidOpenglShadersCache
  AndroidOpenglShadersCache_Cache_Entry* = ref object of KaitaiStruct
    `lenKey`*: uint32
    `lenValue`*: uint32
    `key`*: seq[byte]
    `value`*: seq[byte]
    `alignment`*: AndroidOpenglShadersCache_Alignment
    `parent`*: AndroidOpenglShadersCache_Cache
  AndroidOpenglShadersCache_PrefixedString* = ref object of KaitaiStruct
    `lenStr`*: uint32
    `str`*: string
    `alignment`*: AndroidOpenglShadersCache_Alignment
    `parent`*: AndroidOpenglShadersCache_Cache

proc read*(_: typedesc[AndroidOpenglShadersCache], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidOpenglShadersCache
proc read*(_: typedesc[AndroidOpenglShadersCache_Alignment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidOpenglShadersCache_Alignment
proc read*(_: typedesc[AndroidOpenglShadersCache_Cache], io: KaitaiStream, root: KaitaiStruct, parent: AndroidOpenglShadersCache): AndroidOpenglShadersCache_Cache
proc read*(_: typedesc[AndroidOpenglShadersCache_Cache_Entry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidOpenglShadersCache_Cache): AndroidOpenglShadersCache_Cache_Entry
proc read*(_: typedesc[AndroidOpenglShadersCache_PrefixedString], io: KaitaiStream, root: KaitaiStruct, parent: AndroidOpenglShadersCache_Cache): AndroidOpenglShadersCache_PrefixedString



##[
Android apps using directly or indirectly OpenGL cache compiled shaders
into com.android.opengl.shaders_cache file.

@see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp">Source</a>
]##
proc read*(_: typedesc[AndroidOpenglShadersCache], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidOpenglShadersCache =
  template this: untyped = result
  this = new(AndroidOpenglShadersCache)
  let root = if root == nil: cast[AndroidOpenglShadersCache](this) else: cast[AndroidOpenglShadersCache](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  crc32 of `contents`
  ]##
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr
  let rawContentsExpr = this.io.readBytesFull()
  this.rawContents = rawContentsExpr
  let rawContentsIo = newKaitaiStream(rawContentsExpr)
  let contentsExpr = AndroidOpenglShadersCache_Cache.read(rawContentsIo, this.root, this)
  this.contents = contentsExpr

proc fromFile*(_: typedesc[AndroidOpenglShadersCache], filename: string): AndroidOpenglShadersCache =
  AndroidOpenglShadersCache.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidOpenglShadersCache_Alignment], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidOpenglShadersCache_Alignment =
  template this: untyped = result
  this = new(AndroidOpenglShadersCache_Alignment)
  let root = if root == nil: cast[AndroidOpenglShadersCache](this) else: cast[AndroidOpenglShadersCache](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  garbage from memory
  ]##
  let alignmentExpr = this.io.readBytes(int(this.io.pos + 3 and not3 - this.io.pos))
  this.alignment = alignmentExpr

proc fromFile*(_: typedesc[AndroidOpenglShadersCache_Alignment], filename: string): AndroidOpenglShadersCache_Alignment =
  AndroidOpenglShadersCache_Alignment.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp">Source</a>
]##
proc read*(_: typedesc[AndroidOpenglShadersCache_Cache], io: KaitaiStream, root: KaitaiStruct, parent: AndroidOpenglShadersCache): AndroidOpenglShadersCache_Cache =
  template this: untyped = result
  this = new(AndroidOpenglShadersCache_Cache)
  let root = if root == nil: cast[AndroidOpenglShadersCache](this) else: cast[AndroidOpenglShadersCache](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = this.io.readU4le()
  this.version = versionExpr
  let deviceVersionExpr = this.io.readU4le()
  this.deviceVersion = deviceVersionExpr
  let numEntriesExpr = this.io.readU4le()
  this.numEntries = numEntriesExpr
  if this.version >= 3:
    let buildIdExpr = AndroidOpenglShadersCache_PrefixedString.read(this.io, this.root, this)
    this.buildId = buildIdExpr
  for i in 0 ..< int(this.numEntries):
    let it = AndroidOpenglShadersCache_Cache_Entry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[AndroidOpenglShadersCache_Cache], filename: string): AndroidOpenglShadersCache_Cache =
  AndroidOpenglShadersCache_Cache.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidOpenglShadersCache_Cache_Entry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidOpenglShadersCache_Cache): AndroidOpenglShadersCache_Cache_Entry =
  template this: untyped = result
  this = new(AndroidOpenglShadersCache_Cache_Entry)
  let root = if root == nil: cast[AndroidOpenglShadersCache](this) else: cast[AndroidOpenglShadersCache](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenKeyExpr = this.io.readU4le()
  this.lenKey = lenKeyExpr
  let lenValueExpr = this.io.readU4le()
  this.lenValue = lenValueExpr
  let keyExpr = this.io.readBytes(int(this.lenKey))
  this.key = keyExpr
  let valueExpr = this.io.readBytes(int(this.lenValue))
  this.value = valueExpr
  let alignmentExpr = AndroidOpenglShadersCache_Alignment.read(this.io, this.root, this)
  this.alignment = alignmentExpr

proc fromFile*(_: typedesc[AndroidOpenglShadersCache_Cache_Entry], filename: string): AndroidOpenglShadersCache_Cache_Entry =
  AndroidOpenglShadersCache_Cache_Entry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidOpenglShadersCache_PrefixedString], io: KaitaiStream, root: KaitaiStruct, parent: AndroidOpenglShadersCache_Cache): AndroidOpenglShadersCache_PrefixedString =
  template this: untyped = result
  this = new(AndroidOpenglShadersCache_PrefixedString)
  let root = if root == nil: cast[AndroidOpenglShadersCache](this) else: cast[AndroidOpenglShadersCache](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenStrExpr = this.io.readU4le()
  this.lenStr = lenStrExpr
  let strExpr = encode(this.io.readBytes(int(this.lenStr)).bytesTerminate(0, false), "ASCII")
  this.str = strExpr
  let alignmentExpr = AndroidOpenglShadersCache_Alignment.read(this.io, this.root, this)
  this.alignment = alignmentExpr

proc fromFile*(_: typedesc[AndroidOpenglShadersCache_PrefixedString], filename: string): AndroidOpenglShadersCache_PrefixedString =
  AndroidOpenglShadersCache_PrefixedString.read(newKaitaiFileStream(filename), nil, nil)

