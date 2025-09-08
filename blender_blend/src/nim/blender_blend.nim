import kaitai_struct_nim_runtime
import options

type
  BlenderBlend* = ref object of KaitaiStruct
    `hdr`*: BlenderBlend_Header
    `blocks`*: seq[BlenderBlend_FileBlock]
    `parent`*: KaitaiStruct
    `sdnaStructsInst`: seq[BlenderBlend_DnaStruct]
    `sdnaStructsInstFlag`: bool
  BlenderBlend_Endian* = enum
    be = 86
    le = 118
  BlenderBlend_PtrSize* = enum
    bits_64 = 45
    bits_32 = 95
  BlenderBlend_Dna1Body* = ref object of KaitaiStruct
    `id`*: seq[byte]
    `nameMagic`*: seq[byte]
    `numNames`*: uint32
    `names`*: seq[string]
    `padding1`*: seq[byte]
    `typeMagic`*: seq[byte]
    `numTypes`*: uint32
    `types`*: seq[string]
    `padding2`*: seq[byte]
    `tlenMagic`*: seq[byte]
    `lengths`*: seq[uint16]
    `padding3`*: seq[byte]
    `strcMagic`*: seq[byte]
    `numStructs`*: uint32
    `structs`*: seq[BlenderBlend_DnaStruct]
    `parent`*: BlenderBlend_FileBlock
  BlenderBlend_DnaField* = ref object of KaitaiStruct
    `idxType`*: uint16
    `idxName`*: uint16
    `parent`*: BlenderBlend_DnaStruct
    `nameInst`: string
    `nameInstFlag`: bool
    `typeInst`: string
    `typeInstFlag`: bool
  BlenderBlend_DnaStruct* = ref object of KaitaiStruct
    `idxType`*: uint16
    `numFields`*: uint16
    `fields`*: seq[BlenderBlend_DnaField]
    `parent`*: BlenderBlend_Dna1Body
    `typeInst`: string
    `typeInstFlag`: bool
  BlenderBlend_FileBlock* = ref object of KaitaiStruct
    `code`*: string
    `lenBody`*: uint32
    `memAddr`*: seq[byte]
    `sdnaIndex`*: uint32
    `count`*: uint32
    `body`*: KaitaiStruct
    `parent`*: BlenderBlend
    `rawBody`*: seq[byte]
    `sdnaStructInst`: BlenderBlend_DnaStruct
    `sdnaStructInstFlag`: bool
  BlenderBlend_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ptrSizeId`*: BlenderBlend_PtrSize
    `endian`*: BlenderBlend_Endian
    `version`*: string
    `parent`*: BlenderBlend
    `psizeInst`: int8
    `psizeInstFlag`: bool

proc read*(_: typedesc[BlenderBlend], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BlenderBlend
proc read*(_: typedesc[BlenderBlend_Dna1Body], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend_FileBlock): BlenderBlend_Dna1Body
proc read*(_: typedesc[BlenderBlend_DnaField], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend_DnaStruct): BlenderBlend_DnaField
proc read*(_: typedesc[BlenderBlend_DnaStruct], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend_Dna1Body): BlenderBlend_DnaStruct
proc read*(_: typedesc[BlenderBlend_FileBlock], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend): BlenderBlend_FileBlock
proc read*(_: typedesc[BlenderBlend_Header], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend): BlenderBlend_Header

proc sdnaStructs*(this: BlenderBlend): seq[BlenderBlend_DnaStruct]
proc name*(this: BlenderBlend_DnaField): string
proc type*(this: BlenderBlend_DnaField): string
proc type*(this: BlenderBlend_DnaStruct): string
proc sdnaStruct*(this: BlenderBlend_FileBlock): BlenderBlend_DnaStruct
proc psize*(this: BlenderBlend_Header): int8


##[
Blender is an open source suite for 3D modelling, sculpting,
animation, compositing, rendering, preparation of assets for its own
game engine and exporting to others, etc. `.blend` is its own binary
format that saves whole state of suite: current scene, animations,
all software settings, extensions, etc.

Internally, .blend format is a hybrid semi-self-descriptive
format. On top level, it contains a simple header and a sequence of
file blocks, which more or less follow typical [TLV
pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
block would be a structure with code `DNA1`, which is a essentially
a machine-readable schema of all other structures used in this file.

]##
proc read*(_: typedesc[BlenderBlend], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): BlenderBlend =
  template this: untyped = result
  this = new(BlenderBlend)
  let root = if root == nil: cast[BlenderBlend](this) else: cast[BlenderBlend](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hdrExpr = BlenderBlend_Header.read(this.io, this.root, this)
  this.hdr = hdrExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = BlenderBlend_FileBlock.read(this.io, this.root, this)
      this.blocks.add(it)
      inc i

proc sdnaStructs(this: BlenderBlend): seq[BlenderBlend_DnaStruct] = 
  if this.sdnaStructsInstFlag:
    return this.sdnaStructsInst
  let sdnaStructsInstExpr = seq[BlenderBlend_DnaStruct]((BlenderBlend_Dna1Body(this.blocks[len(this.blocks) - 2].body)).structs)
  this.sdnaStructsInst = sdnaStructsInstExpr
  this.sdnaStructsInstFlag = true
  return this.sdnaStructsInst

proc fromFile*(_: typedesc[BlenderBlend], filename: string): BlenderBlend =
  BlenderBlend.read(newKaitaiFileStream(filename), nil, nil)


##[
DNA1, also known as "Structure DNA", is a special block in
.blend file, which contains machine-readable specifications of
all other structures used in this .blend file.

Effectively, this block contains:

* a sequence of "names" (strings which represent field names)
* a sequence of "types" (strings which represent type name)
* a sequence of "type lengths"
* a sequence of "structs" (which describe contents of every
  structure, referring to types and names by index)

@see <a href="https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA">Source</a>
]##
proc read*(_: typedesc[BlenderBlend_Dna1Body], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend_FileBlock): BlenderBlend_Dna1Body =
  template this: untyped = result
  this = new(BlenderBlend_Dna1Body)
  let root = if root == nil: cast[BlenderBlend](this) else: cast[BlenderBlend](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readBytes(int(4))
  this.id = idExpr
  let nameMagicExpr = this.io.readBytes(int(4))
  this.nameMagic = nameMagicExpr
  let numNamesExpr = this.io.readU4le()
  this.numNames = numNamesExpr
  for i in 0 ..< int(this.numNames):
    let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
    this.names.add(it)
  let padding1Expr = this.io.readBytes(int((4 - this.io.pos) %%% 4))
  this.padding1 = padding1Expr
  let typeMagicExpr = this.io.readBytes(int(4))
  this.typeMagic = typeMagicExpr
  let numTypesExpr = this.io.readU4le()
  this.numTypes = numTypesExpr
  for i in 0 ..< int(this.numTypes):
    let it = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
    this.types.add(it)
  let padding2Expr = this.io.readBytes(int((4 - this.io.pos) %%% 4))
  this.padding2 = padding2Expr
  let tlenMagicExpr = this.io.readBytes(int(4))
  this.tlenMagic = tlenMagicExpr
  for i in 0 ..< int(this.numTypes):
    let it = this.io.readU2le()
    this.lengths.add(it)
  let padding3Expr = this.io.readBytes(int((4 - this.io.pos) %%% 4))
  this.padding3 = padding3Expr
  let strcMagicExpr = this.io.readBytes(int(4))
  this.strcMagic = strcMagicExpr
  let numStructsExpr = this.io.readU4le()
  this.numStructs = numStructsExpr
  for i in 0 ..< int(this.numStructs):
    let it = BlenderBlend_DnaStruct.read(this.io, this.root, this)
    this.structs.add(it)

proc fromFile*(_: typedesc[BlenderBlend_Dna1Body], filename: string): BlenderBlend_Dna1Body =
  BlenderBlend_Dna1Body.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BlenderBlend_DnaField], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend_DnaStruct): BlenderBlend_DnaField =
  template this: untyped = result
  this = new(BlenderBlend_DnaField)
  let root = if root == nil: cast[BlenderBlend](this) else: cast[BlenderBlend](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idxTypeExpr = this.io.readU2le()
  this.idxType = idxTypeExpr
  let idxNameExpr = this.io.readU2le()
  this.idxName = idxNameExpr

proc name(this: BlenderBlend_DnaField): string = 
  if this.nameInstFlag:
    return this.nameInst
  let nameInstExpr = string(this.parent.parent.names[this.idxName])
  this.nameInst = nameInstExpr
  this.nameInstFlag = true
  return this.nameInst

proc type(this: BlenderBlend_DnaField): string = 
  if this.typeInstFlag:
    return this.typeInst
  let typeInstExpr = string(this.parent.parent.types[this.idxType])
  this.typeInst = typeInstExpr
  this.typeInstFlag = true
  return this.typeInst

proc fromFile*(_: typedesc[BlenderBlend_DnaField], filename: string): BlenderBlend_DnaField =
  BlenderBlend_DnaField.read(newKaitaiFileStream(filename), nil, nil)


##[
DNA struct contains a `type` (type name), which is specified as
an index in types table, and sequence of fields.

]##
proc read*(_: typedesc[BlenderBlend_DnaStruct], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend_Dna1Body): BlenderBlend_DnaStruct =
  template this: untyped = result
  this = new(BlenderBlend_DnaStruct)
  let root = if root == nil: cast[BlenderBlend](this) else: cast[BlenderBlend](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idxTypeExpr = this.io.readU2le()
  this.idxType = idxTypeExpr
  let numFieldsExpr = this.io.readU2le()
  this.numFields = numFieldsExpr
  for i in 0 ..< int(this.numFields):
    let it = BlenderBlend_DnaField.read(this.io, this.root, this)
    this.fields.add(it)

proc type(this: BlenderBlend_DnaStruct): string = 
  if this.typeInstFlag:
    return this.typeInst
  let typeInstExpr = string(this.parent.types[this.idxType])
  this.typeInst = typeInstExpr
  this.typeInstFlag = true
  return this.typeInst

proc fromFile*(_: typedesc[BlenderBlend_DnaStruct], filename: string): BlenderBlend_DnaStruct =
  BlenderBlend_DnaStruct.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BlenderBlend_FileBlock], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend): BlenderBlend_FileBlock =
  template this: untyped = result
  this = new(BlenderBlend_FileBlock)
  let root = if root == nil: cast[BlenderBlend](this) else: cast[BlenderBlend](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Identifier of the file block
  ]##
  let codeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.code = codeExpr

  ##[
  Total length of the data after the header of file block
  ]##
  let lenBodyExpr = this.io.readU4le()
  this.lenBody = lenBodyExpr

  ##[
  Memory address the structure was located when written to disk
  ]##
  let memAddrExpr = this.io.readBytes(int(BlenderBlend(this.root).hdr.psize))
  this.memAddr = memAddrExpr

  ##[
  Index of the SDNA structure
  ]##
  let sdnaIndexExpr = this.io.readU4le()
  this.sdnaIndex = sdnaIndexExpr

  ##[
  Number of structure located in this file-block
  ]##
  let countExpr = this.io.readU4le()
  this.count = countExpr
  block:
    let on = this.code
    if on == "DNA1":
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = BlenderBlend_Dna1Body.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.lenBody))
      this.body = bodyExpr

proc sdnaStruct(this: BlenderBlend_FileBlock): BlenderBlend_DnaStruct = 
  if this.sdnaStructInstFlag:
    return this.sdnaStructInst
  if this.sdnaIndex != 0:
    let sdnaStructInstExpr = BlenderBlend_DnaStruct(BlenderBlend(this.root).sdnaStructs[this.sdnaIndex])
    this.sdnaStructInst = sdnaStructInstExpr
  this.sdnaStructInstFlag = true
  return this.sdnaStructInst

proc fromFile*(_: typedesc[BlenderBlend_FileBlock], filename: string): BlenderBlend_FileBlock =
  BlenderBlend_FileBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[BlenderBlend_Header], io: KaitaiStream, root: KaitaiStruct, parent: BlenderBlend): BlenderBlend_Header =
  template this: untyped = result
  this = new(BlenderBlend_Header)
  let root = if root == nil: cast[BlenderBlend](this) else: cast[BlenderBlend](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(7))
  this.magic = magicExpr

  ##[
  Size of a pointer; all pointers in the file are stored in this format
  ]##
  let ptrSizeIdExpr = BlenderBlend_PtrSize(this.io.readU1())
  this.ptrSizeId = ptrSizeIdExpr

  ##[
  Type of byte ordering used
  ]##
  let endianExpr = BlenderBlend_Endian(this.io.readU1())
  this.endian = endianExpr

  ##[
  Blender version used to save this file
  ]##
  let versionExpr = encode(this.io.readBytes(int(3)), "ASCII")
  this.version = versionExpr

proc psize(this: BlenderBlend_Header): int8 = 

  ##[
  Number of bytes that a pointer occupies
  ]##
  if this.psizeInstFlag:
    return this.psizeInst
  let psizeInstExpr = int8((if this.ptrSizeId == blender_blend.bits_64: 8 else: 4))
  this.psizeInst = psizeInstExpr
  this.psizeInstFlag = true
  return this.psizeInst

proc fromFile*(_: typedesc[BlenderBlend_Header], filename: string): BlenderBlend_Header =
  BlenderBlend_Header.read(newKaitaiFileStream(filename), nil, nil)

