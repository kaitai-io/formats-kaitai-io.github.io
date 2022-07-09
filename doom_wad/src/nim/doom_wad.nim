import kaitai_struct_nim_runtime
import options

type
  DoomWad* = ref object of KaitaiStruct
    `magic`*: string
    `numIndexEntries`*: int32
    `indexOffset`*: int32
    `parent`*: KaitaiStruct
    `indexInst`: seq[DoomWad_IndexEntry]
    `indexInstFlag`: bool
  DoomWad_Sectors* = ref object of KaitaiStruct
    `entries`*: seq[DoomWad_Sector]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Vertex* = ref object of KaitaiStruct
    `x`*: int16
    `y`*: int16
    `parent`*: DoomWad_Vertexes
  DoomWad_Texture12* = ref object of KaitaiStruct
    `numTextures`*: int32
    `textures`*: seq[DoomWad_Texture12_TextureIndex]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Texture12_TextureIndex* = ref object of KaitaiStruct
    `offset`*: int32
    `parent`*: DoomWad_Texture12
    `bodyInst`: DoomWad_Texture12_TextureBody
    `bodyInstFlag`: bool
  DoomWad_Texture12_TextureBody* = ref object of KaitaiStruct
    `name`*: string
    `masked`*: uint32
    `width`*: uint16
    `height`*: uint16
    `columnDirectory`*: uint32
    `numPatches`*: uint16
    `patches`*: seq[DoomWad_Texture12_Patch]
    `parent`*: DoomWad_Texture12_TextureIndex
  DoomWad_Texture12_Patch* = ref object of KaitaiStruct
    `originX`*: int16
    `originY`*: int16
    `patchId`*: uint16
    `stepDir`*: uint16
    `colormap`*: uint16
    `parent`*: DoomWad_Texture12_TextureBody
  DoomWad_Linedef* = ref object of KaitaiStruct
    `vertexStartIdx`*: uint16
    `vertexEndIdx`*: uint16
    `flags`*: uint16
    `lineType`*: uint16
    `sectorTag`*: uint16
    `sidedefRightIdx`*: uint16
    `sidedefLeftIdx`*: uint16
    `parent`*: DoomWad_Linedefs
  DoomWad_Pnames* = ref object of KaitaiStruct
    `numPatches`*: uint32
    `names`*: seq[string]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Thing* = ref object of KaitaiStruct
    `x`*: int16
    `y`*: int16
    `angle`*: uint16
    `type`*: uint16
    `flags`*: uint16
    `parent`*: DoomWad_Things
  DoomWad_Sector* = ref object of KaitaiStruct
    `floorZ`*: int16
    `ceilZ`*: int16
    `floorFlat`*: string
    `ceilFlat`*: string
    `light`*: int16
    `specialType`*: DoomWad_Sector_SpecialSector
    `tag`*: uint16
    `parent`*: DoomWad_Sectors
  DoomWad_Sector_SpecialSector* = enum
    normal = 0
    d_light_flicker = 1
    d_light_strobe_fast = 2
    d_light_strobe_slow = 3
    d_light_strobe_hurt = 4
    d_damage_hellslime = 5
    d_damage_nukage = 7
    d_light_glow = 8
    secret = 9
    d_sector_door_close_in_30 = 10
    d_damage_end = 11
    d_light_strobe_slow_sync = 12
    d_light_strobe_fast_sync = 13
    d_sector_door_raise_in_5_mins = 14
    d_friction_low = 15
    d_damage_super_hellslime = 16
    d_light_fire_flicker = 17
    d_damage_lava_wimpy = 18
    d_damage_lava_hefty = 19
    d_scroll_east_lava_damage = 20
    light_phased = 21
    light_sequence_start = 22
    light_sequence_special1 = 23
    light_sequence_special2 = 24
  DoomWad_Vertexes* = ref object of KaitaiStruct
    `entries`*: seq[DoomWad_Vertex]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Sidedef* = ref object of KaitaiStruct
    `offsetX`*: int16
    `offsetY`*: int16
    `upperTextureName`*: string
    `lowerTextureName`*: string
    `normalTextureName`*: string
    `sectorId`*: int16
    `parent`*: DoomWad_Sidedefs
  DoomWad_Things* = ref object of KaitaiStruct
    `entries`*: seq[DoomWad_Thing]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Linedefs* = ref object of KaitaiStruct
    `entries`*: seq[DoomWad_Linedef]
    `parent`*: DoomWad_IndexEntry
  DoomWad_IndexEntry* = ref object of KaitaiStruct
    `offset`*: int32
    `size`*: int32
    `name`*: string
    `parent`*: DoomWad
    `rawContentsInst`*: seq[byte]
    `contentsInst`: KaitaiStruct
    `contentsInstFlag`: bool
  DoomWad_Sidedefs* = ref object of KaitaiStruct
    `entries`*: seq[DoomWad_Sidedef]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Blockmap* = ref object of KaitaiStruct
    `originX`*: int16
    `originY`*: int16
    `numCols`*: int16
    `numRows`*: int16
    `linedefsInBlock`*: seq[DoomWad_Blockmap_Blocklist]
    `parent`*: DoomWad_IndexEntry
  DoomWad_Blockmap_Blocklist* = ref object of KaitaiStruct
    `offset`*: uint16
    `parent`*: DoomWad_Blockmap
    `linedefsInst`: seq[int16]
    `linedefsInstFlag`: bool

proc read*(_: typedesc[DoomWad], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DoomWad
proc read*(_: typedesc[DoomWad_Sectors], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Sectors
proc read*(_: typedesc[DoomWad_Vertex], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Vertexes): DoomWad_Vertex
proc read*(_: typedesc[DoomWad_Texture12], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Texture12
proc read*(_: typedesc[DoomWad_Texture12_TextureIndex], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Texture12): DoomWad_Texture12_TextureIndex
proc read*(_: typedesc[DoomWad_Texture12_TextureBody], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Texture12_TextureIndex): DoomWad_Texture12_TextureBody
proc read*(_: typedesc[DoomWad_Texture12_Patch], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Texture12_TextureBody): DoomWad_Texture12_Patch
proc read*(_: typedesc[DoomWad_Linedef], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Linedefs): DoomWad_Linedef
proc read*(_: typedesc[DoomWad_Pnames], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Pnames
proc read*(_: typedesc[DoomWad_Thing], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Things): DoomWad_Thing
proc read*(_: typedesc[DoomWad_Sector], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Sectors): DoomWad_Sector
proc read*(_: typedesc[DoomWad_Vertexes], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Vertexes
proc read*(_: typedesc[DoomWad_Sidedef], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Sidedefs): DoomWad_Sidedef
proc read*(_: typedesc[DoomWad_Things], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Things
proc read*(_: typedesc[DoomWad_Linedefs], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Linedefs
proc read*(_: typedesc[DoomWad_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad): DoomWad_IndexEntry
proc read*(_: typedesc[DoomWad_Sidedefs], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Sidedefs
proc read*(_: typedesc[DoomWad_Blockmap], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Blockmap
proc read*(_: typedesc[DoomWad_Blockmap_Blocklist], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Blockmap): DoomWad_Blockmap_Blocklist

proc index*(this: DoomWad): seq[DoomWad_IndexEntry]
proc body*(this: DoomWad_Texture12_TextureIndex): DoomWad_Texture12_TextureBody
proc contents*(this: DoomWad_IndexEntry): KaitaiStruct
proc linedefs*(this: DoomWad_Blockmap_Blocklist): seq[int16]

proc read*(_: typedesc[DoomWad], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DoomWad =
  template this: untyped = result
  this = new(DoomWad)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.magic = magicExpr

  ##[
  Number of entries in the lump index
  ]##
  let numIndexEntriesExpr = this.io.readS4le()
  this.numIndexEntries = numIndexEntriesExpr

  ##[
  Offset to the start of the index
  ]##
  let indexOffsetExpr = this.io.readS4le()
  this.indexOffset = indexOffsetExpr

proc index(this: DoomWad): seq[DoomWad_IndexEntry] = 
  if this.indexInstFlag:
    return this.indexInst
  let pos = this.io.pos()
  this.io.seek(int(this.indexOffset))
  for i in 0 ..< int(this.numIndexEntries):
    let it = DoomWad_IndexEntry.read(this.io, this.root, this)
    this.indexInst.add(it)
  this.io.seek(pos)
  this.indexInstFlag = true
  return this.indexInst

proc fromFile*(_: typedesc[DoomWad], filename: string): DoomWad =
  DoomWad.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Sectors], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Sectors =
  template this: untyped = result
  this = new(DoomWad_Sectors)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DoomWad_Sector.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[DoomWad_Sectors], filename: string): DoomWad_Sectors =
  DoomWad_Sectors.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Vertex], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Vertexes): DoomWad_Vertex =
  template this: untyped = result
  this = new(DoomWad_Vertex)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readS2le()
  this.x = xExpr
  let yExpr = this.io.readS2le()
  this.y = yExpr

proc fromFile*(_: typedesc[DoomWad_Vertex], filename: string): DoomWad_Vertex =
  DoomWad_Vertex.read(newKaitaiFileStream(filename), nil, nil)


##[
Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
combine wall patches to make wall textures. This essentially
provides a very simple form of image compression, allowing
certain elements ("patches") to be reused / recombined on
different textures for more variety in the game.

@see <a href="http://doom.wikia.com/wiki/TEXTURE1">Source</a>
]##
proc read*(_: typedesc[DoomWad_Texture12], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Texture12 =
  template this: untyped = result
  this = new(DoomWad_Texture12)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of wall textures
  ]##
  let numTexturesExpr = this.io.readS4le()
  this.numTextures = numTexturesExpr
  for i in 0 ..< int(this.numTextures):
    let it = DoomWad_Texture12_TextureIndex.read(this.io, this.root, this)
    this.textures.add(it)

proc fromFile*(_: typedesc[DoomWad_Texture12], filename: string): DoomWad_Texture12 =
  DoomWad_Texture12.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Texture12_TextureIndex], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Texture12): DoomWad_Texture12_TextureIndex =
  template this: untyped = result
  this = new(DoomWad_Texture12_TextureIndex)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetExpr = this.io.readS4le()
  this.offset = offsetExpr

proc body(this: DoomWad_Texture12_TextureIndex): DoomWad_Texture12_TextureBody = 
  if this.bodyInstFlag:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.offset))
  let bodyInstExpr = DoomWad_Texture12_TextureBody.read(this.io, this.root, this)
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[DoomWad_Texture12_TextureIndex], filename: string): DoomWad_Texture12_TextureIndex =
  DoomWad_Texture12_TextureIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Texture12_TextureBody], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Texture12_TextureIndex): DoomWad_Texture12_TextureBody =
  template this: untyped = result
  this = new(DoomWad_Texture12_TextureBody)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
  ]##
  let nameExpr = encode(this.io.readBytes(int(8)).bytesStripRight(0), "ASCII")
  this.name = nameExpr
  let maskedExpr = this.io.readU4le()
  this.masked = maskedExpr
  let widthExpr = this.io.readU2le()
  this.width = widthExpr
  let heightExpr = this.io.readU2le()
  this.height = heightExpr

  ##[
  Obsolete, ignored by all DOOM versions
  ]##
  let columnDirectoryExpr = this.io.readU4le()
  this.columnDirectory = columnDirectoryExpr

  ##[
  Number of patches that are used in a texture
  ]##
  let numPatchesExpr = this.io.readU2le()
  this.numPatches = numPatchesExpr
  for i in 0 ..< int(this.numPatches):
    let it = DoomWad_Texture12_Patch.read(this.io, this.root, this)
    this.patches.add(it)

proc fromFile*(_: typedesc[DoomWad_Texture12_TextureBody], filename: string): DoomWad_Texture12_TextureBody =
  DoomWad_Texture12_TextureBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Texture12_Patch], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Texture12_TextureBody): DoomWad_Texture12_Patch =
  template this: untyped = result
  this = new(DoomWad_Texture12_Patch)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  X offset to draw a patch at (pixels from left boundary of a texture)
  ]##
  let originXExpr = this.io.readS2le()
  this.originX = originXExpr

  ##[
  Y offset to draw a patch at (pixels from upper boundary of a texture)
  ]##
  let originYExpr = this.io.readS2le()
  this.originY = originYExpr

  ##[
  Identifier of a patch (as listed in PNAMES lump) to draw
  ]##
  let patchIdExpr = this.io.readU2le()
  this.patchId = patchIdExpr
  let stepDirExpr = this.io.readU2le()
  this.stepDir = stepDirExpr
  let colormapExpr = this.io.readU2le()
  this.colormap = colormapExpr

proc fromFile*(_: typedesc[DoomWad_Texture12_Patch], filename: string): DoomWad_Texture12_Patch =
  DoomWad_Texture12_Patch.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Linedef], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Linedefs): DoomWad_Linedef =
  template this: untyped = result
  this = new(DoomWad_Linedef)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let vertexStartIdxExpr = this.io.readU2le()
  this.vertexStartIdx = vertexStartIdxExpr
  let vertexEndIdxExpr = this.io.readU2le()
  this.vertexEndIdx = vertexEndIdxExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr
  let lineTypeExpr = this.io.readU2le()
  this.lineType = lineTypeExpr
  let sectorTagExpr = this.io.readU2le()
  this.sectorTag = sectorTagExpr
  let sidedefRightIdxExpr = this.io.readU2le()
  this.sidedefRightIdx = sidedefRightIdxExpr
  let sidedefLeftIdxExpr = this.io.readU2le()
  this.sidedefLeftIdx = sidedefLeftIdxExpr

proc fromFile*(_: typedesc[DoomWad_Linedef], filename: string): DoomWad_Linedef =
  DoomWad_Linedef.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="http://doom.wikia.com/wiki/PNAMES">Source</a>
]##
proc read*(_: typedesc[DoomWad_Pnames], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Pnames =
  template this: untyped = result
  this = new(DoomWad_Pnames)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of patches registered in this global game directory
  ]##
  let numPatchesExpr = this.io.readU4le()
  this.numPatches = numPatchesExpr
  for i in 0 ..< int(this.numPatches):
    let it = encode(this.io.readBytes(int(8)).bytesStripRight(0), "ASCII")
    this.names.add(it)

proc fromFile*(_: typedesc[DoomWad_Pnames], filename: string): DoomWad_Pnames =
  DoomWad_Pnames.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Thing], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Things): DoomWad_Thing =
  template this: untyped = result
  this = new(DoomWad_Thing)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readS2le()
  this.x = xExpr
  let yExpr = this.io.readS2le()
  this.y = yExpr
  let angleExpr = this.io.readU2le()
  this.angle = angleExpr
  let typeExpr = this.io.readU2le()
  this.type = typeExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr

proc fromFile*(_: typedesc[DoomWad_Thing], filename: string): DoomWad_Thing =
  DoomWad_Thing.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Sector], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Sectors): DoomWad_Sector =
  template this: untyped = result
  this = new(DoomWad_Sector)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let floorZExpr = this.io.readS2le()
  this.floorZ = floorZExpr
  let ceilZExpr = this.io.readS2le()
  this.ceilZ = ceilZExpr
  let floorFlatExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.floorFlat = floorFlatExpr
  let ceilFlatExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.ceilFlat = ceilFlatExpr

  ##[
  Light level of the sector [0..255]. Original engine uses
COLORMAP to render lighting, so only 32 actual levels are
available (i.e. 0..7, 8..15, etc).

  ]##
  let lightExpr = this.io.readS2le()
  this.light = lightExpr
  let specialTypeExpr = DoomWad_Sector_SpecialSector(this.io.readU2le())
  this.specialType = specialTypeExpr

  ##[
  Tag number. When the linedef with the same tag number is
activated, some effect will be triggered in this sector.

  ]##
  let tagExpr = this.io.readU2le()
  this.tag = tagExpr

proc fromFile*(_: typedesc[DoomWad_Sector], filename: string): DoomWad_Sector =
  DoomWad_Sector.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Vertexes], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Vertexes =
  template this: untyped = result
  this = new(DoomWad_Vertexes)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DoomWad_Vertex.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[DoomWad_Vertexes], filename: string): DoomWad_Vertexes =
  DoomWad_Vertexes.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Sidedef], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Sidedefs): DoomWad_Sidedef =
  template this: untyped = result
  this = new(DoomWad_Sidedef)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetXExpr = this.io.readS2le()
  this.offsetX = offsetXExpr
  let offsetYExpr = this.io.readS2le()
  this.offsetY = offsetYExpr
  let upperTextureNameExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.upperTextureName = upperTextureNameExpr
  let lowerTextureNameExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.lowerTextureName = lowerTextureNameExpr
  let normalTextureNameExpr = encode(this.io.readBytes(int(8)), "ASCII")
  this.normalTextureName = normalTextureNameExpr
  let sectorIdExpr = this.io.readS2le()
  this.sectorId = sectorIdExpr

proc fromFile*(_: typedesc[DoomWad_Sidedef], filename: string): DoomWad_Sidedef =
  DoomWad_Sidedef.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Things], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Things =
  template this: untyped = result
  this = new(DoomWad_Things)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DoomWad_Thing.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[DoomWad_Things], filename: string): DoomWad_Things =
  DoomWad_Things.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Linedefs], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Linedefs =
  template this: untyped = result
  this = new(DoomWad_Linedefs)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DoomWad_Linedef.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[DoomWad_Linedefs], filename: string): DoomWad_Linedefs =
  DoomWad_Linedefs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad): DoomWad_IndexEntry =
  template this: untyped = result
  this = new(DoomWad_IndexEntry)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetExpr = this.io.readS4le()
  this.offset = offsetExpr
  let sizeExpr = this.io.readS4le()
  this.size = sizeExpr
  let nameExpr = encode(this.io.readBytes(int(8)).bytesStripRight(0), "ASCII")
  this.name = nameExpr

proc contents(this: DoomWad_IndexEntry): KaitaiStruct = 
  if this.contentsInstFlag:
    return this.contentsInst
  let io = DoomWad(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  block:
    let on = this.name
    if on == "SECTORS":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Sectors.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "TEXTURE1":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Texture12.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "VERTEXES":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Vertexes.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "BLOCKMAP":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Blockmap.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "PNAMES":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Pnames.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "TEXTURE2":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Texture12.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "THINGS":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Things.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "LINEDEFS":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Linedefs.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    elif on == "SIDEDEFS":
      let rawContentsInstExpr = io.readBytes(int(this.size))
      this.rawContentsInst = rawContentsInstExpr
      let rawContentsInstIo = newKaitaiStream(rawContentsInstExpr)
      let contentsInstExpr = DoomWad_Sidedefs.read(rawContentsInstIo, this.root, this)
      this.contentsInst = contentsInstExpr
    else:
      let contentsInstExpr = io.readBytes(int(this.size))
      this.contentsInst = contentsInstExpr
  io.seek(pos)
  this.contentsInstFlag = true
  return this.contentsInst

proc fromFile*(_: typedesc[DoomWad_IndexEntry], filename: string): DoomWad_IndexEntry =
  DoomWad_IndexEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Sidedefs], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Sidedefs =
  template this: untyped = result
  this = new(DoomWad_Sidedefs)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = DoomWad_Sidedef.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[DoomWad_Sidedefs], filename: string): DoomWad_Sidedefs =
  DoomWad_Sidedefs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Blockmap], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_IndexEntry): DoomWad_Blockmap =
  template this: untyped = result
  this = new(DoomWad_Blockmap)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Grid origin, X coord
  ]##
  let originXExpr = this.io.readS2le()
  this.originX = originXExpr

  ##[
  Grid origin, Y coord
  ]##
  let originYExpr = this.io.readS2le()
  this.originY = originYExpr

  ##[
  Number of columns
  ]##
  let numColsExpr = this.io.readS2le()
  this.numCols = numColsExpr

  ##[
  Number of rows
  ]##
  let numRowsExpr = this.io.readS2le()
  this.numRows = numRowsExpr

  ##[
  Lists of linedefs for every block
  ]##
  for i in 0 ..< int((this.numCols * this.numRows)):
    let it = DoomWad_Blockmap_Blocklist.read(this.io, this.root, this)
    this.linedefsInBlock.add(it)

proc fromFile*(_: typedesc[DoomWad_Blockmap], filename: string): DoomWad_Blockmap =
  DoomWad_Blockmap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DoomWad_Blockmap_Blocklist], io: KaitaiStream, root: KaitaiStruct, parent: DoomWad_Blockmap): DoomWad_Blockmap_Blocklist =
  template this: untyped = result
  this = new(DoomWad_Blockmap_Blocklist)
  let root = if root == nil: cast[DoomWad](this) else: cast[DoomWad](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Offset to the list of linedefs
  ]##
  let offsetExpr = this.io.readU2le()
  this.offset = offsetExpr

proc linedefs(this: DoomWad_Blockmap_Blocklist): seq[int16] = 

  ##[
  List of linedefs found in this block
  ]##
  if this.linedefsInstFlag:
    return this.linedefsInst
  let pos = this.io.pos()
  this.io.seek(int((this.offset * 2)))
  block:
    var i: int
    while true:
      let it = this.io.readS2le()
      this.linedefsInst.add(it)
      if it == -1:
        break
      inc i
  this.io.seek(pos)
  this.linedefsInstFlag = true
  return this.linedefsInst

proc fromFile*(_: typedesc[DoomWad_Blockmap_Blocklist], filename: string): DoomWad_Blockmap_Blocklist =
  DoomWad_Blockmap_Blocklist.read(newKaitaiFileStream(filename), nil, nil)

