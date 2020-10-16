import kaitai_struct_nim_runtime
import options

type
  MagicavoxelVox* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `main`*: MagicavoxelVox_Chunk
    `parent`*: KaitaiStruct
  MagicavoxelVox_ChunkType* = enum
    main = 1296124238
    matt = 1296127060
    pack = 1346454347
    rgba = 1380401729
    size = 1397316165
    xyzi = 1482250825
  MagicavoxelVox_MaterialType* = enum
    diffuse = 0
    metal = 1
    glass = 2
    emissive = 3
  MagicavoxelVox_PropertyBitsType* = enum
    plastic = 1
    roughness = 2
    specular = 4
    ior = 8
    attenuation = 16
    power = 32
    glow = 64
    is_total_power = 128
  MagicavoxelVox_Chunk* = ref object of KaitaiStruct
    `chunkId`*: MagicavoxelVox_ChunkType
    `numBytesOfChunkContent`*: uint32
    `numBytesOfChildrenChunks`*: uint32
    `chunkContent`*: KaitaiStruct
    `childrenChunks`*: seq[MagicavoxelVox_Chunk]
    `parent`*: KaitaiStruct
    `rawChunkContent`*: seq[byte]
  MagicavoxelVox_Size* = ref object of KaitaiStruct
    `sizeX`*: uint32
    `sizeY`*: uint32
    `sizeZ`*: uint32
    `parent`*: MagicavoxelVox_Chunk
  MagicavoxelVox_Rgba* = ref object of KaitaiStruct
    `colors`*: seq[MagicavoxelVox_Color]
    `parent`*: MagicavoxelVox_Chunk
  MagicavoxelVox_Pack* = ref object of KaitaiStruct
    `numModels`*: uint32
    `parent`*: MagicavoxelVox_Chunk
  MagicavoxelVox_Matt* = ref object of KaitaiStruct
    `id`*: uint32
    `materialType`*: MagicavoxelVox_MaterialType
    `materialWeight`*: float32
    `propertyBits`*: uint32
    `plastic`*: float32
    `roughness`*: float32
    `specular`*: float32
    `ior`*: float32
    `attenuation`*: float32
    `power`*: float32
    `glow`*: float32
    `isTotalPower`*: float32
    `parent`*: MagicavoxelVox_Chunk
    `hasIsTotalPowerInst`*: bool
    `hasPlasticInst`*: bool
    `hasAttenuationInst`*: bool
    `hasPowerInst`*: bool
    `hasRoughnessInst`*: bool
    `hasSpecularInst`*: bool
    `hasIorInst`*: bool
    `hasGlowInst`*: bool
  MagicavoxelVox_Xyzi* = ref object of KaitaiStruct
    `numVoxels`*: uint32
    `voxels`*: seq[MagicavoxelVox_Voxel]
    `parent`*: MagicavoxelVox_Chunk
  MagicavoxelVox_Color* = ref object of KaitaiStruct
    `r`*: uint8
    `g`*: uint8
    `b`*: uint8
    `a`*: uint8
    `parent`*: MagicavoxelVox_Rgba
  MagicavoxelVox_Voxel* = ref object of KaitaiStruct
    `x`*: uint8
    `y`*: uint8
    `z`*: uint8
    `colorIndex`*: uint8
    `parent`*: MagicavoxelVox_Xyzi

proc read*(_: typedesc[MagicavoxelVox], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MagicavoxelVox
proc read*(_: typedesc[MagicavoxelVox_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MagicavoxelVox_Chunk
proc read*(_: typedesc[MagicavoxelVox_Size], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Size
proc read*(_: typedesc[MagicavoxelVox_Rgba], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Rgba
proc read*(_: typedesc[MagicavoxelVox_Pack], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Pack
proc read*(_: typedesc[MagicavoxelVox_Matt], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Matt
proc read*(_: typedesc[MagicavoxelVox_Xyzi], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Xyzi
proc read*(_: typedesc[MagicavoxelVox_Color], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Rgba): MagicavoxelVox_Color
proc read*(_: typedesc[MagicavoxelVox_Voxel], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Xyzi): MagicavoxelVox_Voxel

proc hasIsTotalPower*(this: MagicavoxelVox_Matt): bool
proc hasPlastic*(this: MagicavoxelVox_Matt): bool
proc hasAttenuation*(this: MagicavoxelVox_Matt): bool
proc hasPower*(this: MagicavoxelVox_Matt): bool
proc hasRoughness*(this: MagicavoxelVox_Matt): bool
proc hasSpecular*(this: MagicavoxelVox_Matt): bool
proc hasIor*(this: MagicavoxelVox_Matt): bool
proc hasGlow*(this: MagicavoxelVox_Matt): bool


##[
@see <a href="https://ephtracy.github.io/">MagicaVoxel Homepage</a>
@see <a href="https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt">Format Description</a>
]##
proc read*(_: typedesc[MagicavoxelVox], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MagicavoxelVox =
  template this: untyped = result
  this = new(MagicavoxelVox)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  150 expected
  ]##
  let versionExpr = this.io.readU4le()
  this.version = versionExpr
  let mainExpr = MagicavoxelVox_Chunk.read(this.io, this.root, this)
  this.main = mainExpr

proc fromFile*(_: typedesc[MagicavoxelVox], filename: string): MagicavoxelVox =
  MagicavoxelVox.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MagicavoxelVox_Chunk =
  template this: untyped = result
  this = new(MagicavoxelVox_Chunk)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let chunkIdExpr = MagicavoxelVox_ChunkType(this.io.readU4be())
  this.chunkId = chunkIdExpr
  let numBytesOfChunkContentExpr = this.io.readU4le()
  this.numBytesOfChunkContent = numBytesOfChunkContentExpr
  let numBytesOfChildrenChunksExpr = this.io.readU4le()
  this.numBytesOfChildrenChunks = numBytesOfChildrenChunksExpr
  if this.numBytesOfChunkContent != 0:
    block:
      let on = this.chunkId
      if on == magicavoxel_vox.size:
        let rawChunkContentExpr = this.io.readBytes(int(this.numBytesOfChunkContent))
        this.rawChunkContent = rawChunkContentExpr
        let rawChunkContentIo = newKaitaiStream(rawChunkContentExpr)
        let chunkContentExpr = MagicavoxelVox_Size.read(rawChunkContentIo, this.root, this)
        this.chunkContent = chunkContentExpr
      elif on == magicavoxel_vox.matt:
        let rawChunkContentExpr = this.io.readBytes(int(this.numBytesOfChunkContent))
        this.rawChunkContent = rawChunkContentExpr
        let rawChunkContentIo = newKaitaiStream(rawChunkContentExpr)
        let chunkContentExpr = MagicavoxelVox_Matt.read(rawChunkContentIo, this.root, this)
        this.chunkContent = chunkContentExpr
      elif on == magicavoxel_vox.rgba:
        let rawChunkContentExpr = this.io.readBytes(int(this.numBytesOfChunkContent))
        this.rawChunkContent = rawChunkContentExpr
        let rawChunkContentIo = newKaitaiStream(rawChunkContentExpr)
        let chunkContentExpr = MagicavoxelVox_Rgba.read(rawChunkContentIo, this.root, this)
        this.chunkContent = chunkContentExpr
      elif on == magicavoxel_vox.xyzi:
        let rawChunkContentExpr = this.io.readBytes(int(this.numBytesOfChunkContent))
        this.rawChunkContent = rawChunkContentExpr
        let rawChunkContentIo = newKaitaiStream(rawChunkContentExpr)
        let chunkContentExpr = MagicavoxelVox_Xyzi.read(rawChunkContentIo, this.root, this)
        this.chunkContent = chunkContentExpr
      elif on == magicavoxel_vox.pack:
        let rawChunkContentExpr = this.io.readBytes(int(this.numBytesOfChunkContent))
        this.rawChunkContent = rawChunkContentExpr
        let rawChunkContentIo = newKaitaiStream(rawChunkContentExpr)
        let chunkContentExpr = MagicavoxelVox_Pack.read(rawChunkContentIo, this.root, this)
        this.chunkContent = chunkContentExpr
      else:
        let chunkContentExpr = this.io.readBytes(int(this.numBytesOfChunkContent))
        this.chunkContent = chunkContentExpr
  if this.numBytesOfChildrenChunks != 0:
    block:
      var i: int
      while not this.io.isEof:
        let it = MagicavoxelVox_Chunk.read(this.io, this.root, this)
        this.childrenChunks.add(it)
        inc i

proc fromFile*(_: typedesc[MagicavoxelVox_Chunk], filename: string): MagicavoxelVox_Chunk =
  MagicavoxelVox_Chunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Size], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Size =
  template this: untyped = result
  this = new(MagicavoxelVox_Size)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeXExpr = this.io.readU4le()
  this.sizeX = sizeXExpr
  let sizeYExpr = this.io.readU4le()
  this.sizeY = sizeYExpr
  let sizeZExpr = this.io.readU4le()
  this.sizeZ = sizeZExpr

proc fromFile*(_: typedesc[MagicavoxelVox_Size], filename: string): MagicavoxelVox_Size =
  MagicavoxelVox_Size.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Rgba], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Rgba =
  template this: untyped = result
  this = new(MagicavoxelVox_Rgba)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(256):
    let it = MagicavoxelVox_Color.read(this.io, this.root, this)
    this.colors.add(it)

proc fromFile*(_: typedesc[MagicavoxelVox_Rgba], filename: string): MagicavoxelVox_Rgba =
  MagicavoxelVox_Rgba.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Pack], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Pack =
  template this: untyped = result
  this = new(MagicavoxelVox_Pack)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numModelsExpr = this.io.readU4le()
  this.numModels = numModelsExpr

proc fromFile*(_: typedesc[MagicavoxelVox_Pack], filename: string): MagicavoxelVox_Pack =
  MagicavoxelVox_Pack.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Matt], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Matt =
  template this: untyped = result
  this = new(MagicavoxelVox_Matt)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU4le()
  this.id = idExpr
  let materialTypeExpr = MagicavoxelVox_MaterialType(this.io.readU4le())
  this.materialType = materialTypeExpr
  let materialWeightExpr = this.io.readF4le()
  this.materialWeight = materialWeightExpr
  let propertyBitsExpr = this.io.readU4le()
  this.propertyBits = propertyBitsExpr
  if this.hasPlastic:
    let plasticExpr = this.io.readF4le()
    this.plastic = plasticExpr
  if this.hasRoughness:
    let roughnessExpr = this.io.readF4le()
    this.roughness = roughnessExpr
  if this.hasSpecular:
    let specularExpr = this.io.readF4le()
    this.specular = specularExpr
  if this.hasIor:
    let iorExpr = this.io.readF4le()
    this.ior = iorExpr
  if this.hasAttenuation:
    let attenuationExpr = this.io.readF4le()
    this.attenuation = attenuationExpr
  if this.hasPower:
    let powerExpr = this.io.readF4le()
    this.power = powerExpr
  if this.hasGlow:
    let glowExpr = this.io.readF4le()
    this.glow = glowExpr
  if this.hasIsTotalPower:
    let isTotalPowerExpr = this.io.readF4le()
    this.isTotalPower = isTotalPowerExpr

proc hasIsTotalPower(this: MagicavoxelVox_Matt): bool = 
  if this.hasIsTotalPowerInst != nil:
    return this.hasIsTotalPowerInst
  let hasIsTotalPowerInstExpr = bool((this.propertyBits and 128) != 0)
  this.hasIsTotalPowerInst = hasIsTotalPowerInstExpr
  if this.hasIsTotalPowerInst != nil:
    return this.hasIsTotalPowerInst

proc hasPlastic(this: MagicavoxelVox_Matt): bool = 
  if this.hasPlasticInst != nil:
    return this.hasPlasticInst
  let hasPlasticInstExpr = bool((this.propertyBits and 1) != 0)
  this.hasPlasticInst = hasPlasticInstExpr
  if this.hasPlasticInst != nil:
    return this.hasPlasticInst

proc hasAttenuation(this: MagicavoxelVox_Matt): bool = 
  if this.hasAttenuationInst != nil:
    return this.hasAttenuationInst
  let hasAttenuationInstExpr = bool((this.propertyBits and 16) != 0)
  this.hasAttenuationInst = hasAttenuationInstExpr
  if this.hasAttenuationInst != nil:
    return this.hasAttenuationInst

proc hasPower(this: MagicavoxelVox_Matt): bool = 
  if this.hasPowerInst != nil:
    return this.hasPowerInst
  let hasPowerInstExpr = bool((this.propertyBits and 32) != 0)
  this.hasPowerInst = hasPowerInstExpr
  if this.hasPowerInst != nil:
    return this.hasPowerInst

proc hasRoughness(this: MagicavoxelVox_Matt): bool = 
  if this.hasRoughnessInst != nil:
    return this.hasRoughnessInst
  let hasRoughnessInstExpr = bool((this.propertyBits and 2) != 0)
  this.hasRoughnessInst = hasRoughnessInstExpr
  if this.hasRoughnessInst != nil:
    return this.hasRoughnessInst

proc hasSpecular(this: MagicavoxelVox_Matt): bool = 
  if this.hasSpecularInst != nil:
    return this.hasSpecularInst
  let hasSpecularInstExpr = bool((this.propertyBits and 4) != 0)
  this.hasSpecularInst = hasSpecularInstExpr
  if this.hasSpecularInst != nil:
    return this.hasSpecularInst

proc hasIor(this: MagicavoxelVox_Matt): bool = 
  if this.hasIorInst != nil:
    return this.hasIorInst
  let hasIorInstExpr = bool((this.propertyBits and 8) != 0)
  this.hasIorInst = hasIorInstExpr
  if this.hasIorInst != nil:
    return this.hasIorInst

proc hasGlow(this: MagicavoxelVox_Matt): bool = 
  if this.hasGlowInst != nil:
    return this.hasGlowInst
  let hasGlowInstExpr = bool((this.propertyBits and 64) != 0)
  this.hasGlowInst = hasGlowInstExpr
  if this.hasGlowInst != nil:
    return this.hasGlowInst

proc fromFile*(_: typedesc[MagicavoxelVox_Matt], filename: string): MagicavoxelVox_Matt =
  MagicavoxelVox_Matt.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Xyzi], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Chunk): MagicavoxelVox_Xyzi =
  template this: untyped = result
  this = new(MagicavoxelVox_Xyzi)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numVoxelsExpr = this.io.readU4le()
  this.numVoxels = numVoxelsExpr
  for i in 0 ..< int(this.numVoxels):
    let it = MagicavoxelVox_Voxel.read(this.io, this.root, this)
    this.voxels.add(it)

proc fromFile*(_: typedesc[MagicavoxelVox_Xyzi], filename: string): MagicavoxelVox_Xyzi =
  MagicavoxelVox_Xyzi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Color], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Rgba): MagicavoxelVox_Color =
  template this: untyped = result
  this = new(MagicavoxelVox_Color)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rExpr = this.io.readU1()
  this.r = rExpr
  let gExpr = this.io.readU1()
  this.g = gExpr
  let bExpr = this.io.readU1()
  this.b = bExpr
  let aExpr = this.io.readU1()
  this.a = aExpr

proc fromFile*(_: typedesc[MagicavoxelVox_Color], filename: string): MagicavoxelVox_Color =
  MagicavoxelVox_Color.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MagicavoxelVox_Voxel], io: KaitaiStream, root: KaitaiStruct, parent: MagicavoxelVox_Xyzi): MagicavoxelVox_Voxel =
  template this: untyped = result
  this = new(MagicavoxelVox_Voxel)
  let root = if root == nil: cast[MagicavoxelVox](this) else: cast[MagicavoxelVox](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readU1()
  this.x = xExpr
  let yExpr = this.io.readU1()
  this.y = yExpr
  let zExpr = this.io.readU1()
  this.z = zExpr
  let colorIndexExpr = this.io.readU1()
  this.colorIndex = colorIndexExpr

proc fromFile*(_: typedesc[MagicavoxelVox_Voxel], filename: string): MagicavoxelVox_Voxel =
  MagicavoxelVox_Voxel.read(newKaitaiFileStream(filename), nil, nil)

