import kaitai_struct_nim_runtime
import options

type
  GltfBinary* = ref object of KaitaiStruct
    `header`*: GltfBinary_Header
    `chunks`*: seq[GltfBinary_Chunk]
    `parent`*: KaitaiStruct
  GltfBinary_ChunkType* = enum
    bin = 5130562
    json = 1313821514
  GltfBinary_Bin* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: GltfBinary_Chunk
  GltfBinary_Chunk* = ref object of KaitaiStruct
    `lenData`*: uint32
    `type`*: GltfBinary_ChunkType
    `data`*: KaitaiStruct
    `parent`*: GltfBinary
    `rawData`*: seq[byte]
  GltfBinary_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `length`*: uint32
    `parent`*: GltfBinary
  GltfBinary_Json* = ref object of KaitaiStruct
    `data`*: string
    `parent`*: GltfBinary_Chunk

proc read*(_: typedesc[GltfBinary], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GltfBinary
proc read*(_: typedesc[GltfBinary_Bin], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary_Chunk): GltfBinary_Bin
proc read*(_: typedesc[GltfBinary_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary): GltfBinary_Chunk
proc read*(_: typedesc[GltfBinary_Header], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary): GltfBinary_Header
proc read*(_: typedesc[GltfBinary_Json], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary_Chunk): GltfBinary_Json



##[
glTF is a format for distribution of 3D models optimized for being used in software

@see <a href="https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout">Source</a>
]##
proc read*(_: typedesc[GltfBinary], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GltfBinary =
  template this: untyped = result
  this = new(GltfBinary)
  let root = if root == nil: cast[GltfBinary](this) else: cast[GltfBinary](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = GltfBinary_Header.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = GltfBinary_Chunk.read(this.io, this.root, this)
      this.chunks.add(it)
      inc i

proc fromFile*(_: typedesc[GltfBinary], filename: string): GltfBinary =
  GltfBinary.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GltfBinary_Bin], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary_Chunk): GltfBinary_Bin =
  template this: untyped = result
  this = new(GltfBinary_Bin)
  let root = if root == nil: cast[GltfBinary](this) else: cast[GltfBinary](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[GltfBinary_Bin], filename: string): GltfBinary_Bin =
  GltfBinary_Bin.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GltfBinary_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary): GltfBinary_Chunk =
  template this: untyped = result
  this = new(GltfBinary_Chunk)
  let root = if root == nil: cast[GltfBinary](this) else: cast[GltfBinary](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let typeExpr = GltfBinary_ChunkType(this.io.readU4le())
  this.type = typeExpr
  block:
    let on = this.type
    if on == gltf_binary.bin:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = GltfBinary_Bin.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == gltf_binary.json:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = GltfBinary_Json.read(rawDataIo, this.root, this)
      this.data = dataExpr
    else:
      let dataExpr = this.io.readBytes(int(this.lenData))
      this.data = dataExpr

proc fromFile*(_: typedesc[GltfBinary_Chunk], filename: string): GltfBinary_Chunk =
  GltfBinary_Chunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GltfBinary_Header], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary): GltfBinary_Header =
  template this: untyped = result
  this = new(GltfBinary_Header)
  let root = if root == nil: cast[GltfBinary](this) else: cast[GltfBinary](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  Indicates the version of the Binary glTF container format.
For this specification, should be set to 2.

  ]##
  let versionExpr = this.io.readU4le()
  this.version = versionExpr

  ##[
  Total length of the Binary glTF, including Header and all Chunks, in bytes.
  ]##
  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr

proc fromFile*(_: typedesc[GltfBinary_Header], filename: string): GltfBinary_Header =
  GltfBinary_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GltfBinary_Json], io: KaitaiStream, root: KaitaiStruct, parent: GltfBinary_Chunk): GltfBinary_Json =
  template this: untyped = result
  this = new(GltfBinary_Json)
  let root = if root == nil: cast[GltfBinary](this) else: cast[GltfBinary](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  This is where GLB deviates from being an elegant format.
To parse the rest of the file, you have to parse the JSON first.

  ]##
  let dataExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[GltfBinary_Json], filename: string): GltfBinary_Json =
  GltfBinary_Json.read(newKaitaiFileStream(filename), nil, nil)

