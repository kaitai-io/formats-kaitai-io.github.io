import kaitai_struct_nim_runtime
import options

type
  RenderwareBinaryStream* = ref object of KaitaiStruct
    `code`*: RenderwareBinaryStream_Sections
    `size`*: uint32
    `libraryIdStamp`*: uint32
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawBody`*: seq[byte]
    `versionInst`: int
    `versionInstFlag`: bool
  RenderwareBinaryStream_Sections* = enum
    struct = 1
    string = 2
    extension = 3
    camera = 5
    texture = 6
    material = 7
    material_list = 8
    atomic_section = 9
    plane_section = 10
    world = 11
    spline = 12
    matrix = 13
    frame_list = 14
    geometry = 15
    clump = 16
    light = 18
    unicode_string = 19
    atomic = 20
    texture_native = 21
    texture_dictionary = 22
    animation_database = 23
    image = 24
    skin_animation = 25
    geometry_list = 26
    anim_animation = 27
    team = 28
    crowd = 29
    delta_morph_animation = 30
    right_to_render = 31
    multitexture_effect_native = 32
    multitexture_effect_dictionary = 33
    team_dictionary = 34
    platform_independent_texture_dictionary = 35
    table_of_contents = 36
    particle_standard_global_data = 37
    altpipe = 38
    platform_independent_peds = 39
    patch_mesh = 40
    chunk_group_start = 41
    chunk_group_end = 42
    uv_animation_dictionary = 43
    coll_tree = 44
    metrics_plg = 257
    spline_plg = 258
    stereo_plg = 259
    vrml_plg = 260
    morph_plg = 261
    pvs_plg = 262
    memory_leak_plg = 263
    animation_plg = 264
    gloss_plg = 265
    logo_plg = 266
    memory_info_plg = 267
    random_plg = 268
    png_image_plg = 269
    bone_plg = 270
    vrml_anim_plg = 271
    sky_mipmap_val = 272
    mrm_plg = 273
    lod_atomic_plg = 274
    me_plg = 275
    lightmap_plg = 276
    refine_plg = 277
    skin_plg = 278
    label_plg = 279
    particles_plg = 280
    geomtx_plg = 281
    synth_core_plg = 282
    stqpp_plg = 283
    part_pp_plg = 284
    collision_plg = 285
    hanim_plg = 286
    user_data_plg = 287
    material_effects_plg = 288
    particle_system_plg = 289
    delta_morph_plg = 290
    patch_plg = 291
    team_plg = 292
    crowd_pp_plg = 293
    mip_split_plg = 294
    anisotropy_plg = 295
    gcn_material_plg = 297
    geometric_pvs_plg = 298
    xbox_material_plg = 299
    multi_texture_plg = 300
    chain_plg = 301
    toon_plg = 302
    ptank_plg = 303
    particle_standard_plg = 304
    pds_plg = 305
    prtadv_plg = 306
    normal_map_plg = 307
    adc_plg = 308
    uv_animation_plg = 309
    character_set_plg = 384
    nohs_world_plg = 385
    import_util_plg = 386
    slerp_plg = 387
    optim_plg = 388
    tl_world_plg = 389
    database_plg = 390
    raytrace_plg = 391
    ray_plg = 392
    library_plg = 393
    plg_2d = 400
    tile_render_plg = 401
    jpeg_image_plg = 402
    tga_image_plg = 403
    gif_image_plg = 404
    quat_plg = 405
    spline_pvs_plg = 406
    mipmap_plg = 407
    mipmapk_plg = 408
    font_2d = 409
    intersection_plg = 410
    tiff_image_plg = 411
    pick_plg = 412
    bmp_image_plg = 413
    ras_image_plg = 414
    skin_fx_plg = 415
    vcat_plg = 416
    path_2d = 417
    brush_2d = 418
    object_2d = 419
    shape_2d = 420
    scene_2d = 421
    pick_region_2d = 422
    object_string_2d = 423
    animation_plg_2d = 424
    animation_2d = 425
    keyframe_2d = 432
    maestro_2d = 433
    barycentric = 434
    platform_independent_texture_dictionary_tk = 435
    toc_tk = 436
    tpl_tk = 437
    altpipe_tk = 438
    animation_tk = 439
    skin_split_tookit = 440
    compressed_key_tk = 441
    geometry_conditioning_plg = 442
    wing_plg = 443
    generic_pipeline_tk = 444
    lightmap_conversion_tk = 445
    filesystem_plg = 446
    dictionary_tk = 447
    uv_animation_linear = 448
    uv_animation_parameter = 449
    bin_mesh_plg = 1294
    native_data_plg = 1296
    zmodeler_lock = 61982
    atomic_visibility_distance = 39055872
    clump_visibility_distance = 39055873
    frame_visibility_distance = 39055874
    pipeline_set = 39056115
    unused_5 = 39056116
    texdictionary_link = 39056117
    specular_material = 39056118
    unused_8 = 39056119
    effect_2d = 39056120
    extra_vert_colour = 39056121
    collision_model = 39056122
    gta_hanim = 39056123
    reflection_material = 39056124
    breakable = 39056125
    frame = 39056126
    unused_16 = 39056127
  RenderwareBinaryStream_Frame* = ref object of KaitaiStruct
    `rotationMatrix`*: RenderwareBinaryStream_Matrix
    `position`*: RenderwareBinaryStream_Vector3d
    `curFrameIdx`*: int32
    `matrixCreationFlags`*: uint32
    `parent`*: RenderwareBinaryStream_StructFrameList
  RenderwareBinaryStream_GeometryNonNative* = ref object of KaitaiStruct
    `prelitColors`*: seq[RenderwareBinaryStream_Rgba]
    `uvLayers`*: seq[RenderwareBinaryStream_UvLayer]
    `triangles`*: seq[RenderwareBinaryStream_Triangle]
    `parent`*: RenderwareBinaryStream_StructGeometry
  RenderwareBinaryStream_ListWithHeader* = ref object of KaitaiStruct
    `code`*: seq[byte]
    `headerSize`*: uint32
    `libraryIdStamp`*: uint32
    `header`*: KaitaiStruct
    `entries`*: seq[RenderwareBinaryStream]
    `parent`*: RenderwareBinaryStream
    `rawHeader`*: seq[byte]
    `versionInst`: int
    `versionInstFlag`: bool
  RenderwareBinaryStream_Matrix* = ref object of KaitaiStruct
    `entries`*: seq[RenderwareBinaryStream_Vector3d]
    `parent`*: RenderwareBinaryStream_Frame
  RenderwareBinaryStream_MorphTarget* = ref object of KaitaiStruct
    `boundingSphere`*: RenderwareBinaryStream_Sphere
    `hasVertices`*: uint32
    `hasNormals`*: uint32
    `vertices`*: seq[RenderwareBinaryStream_Vector3d]
    `normals`*: seq[RenderwareBinaryStream_Vector3d]
    `parent`*: RenderwareBinaryStream_StructGeometry
  RenderwareBinaryStream_Rgba* = ref object of KaitaiStruct
    `r`*: uint8
    `g`*: uint8
    `b`*: uint8
    `a`*: uint8
    `parent`*: RenderwareBinaryStream_GeometryNonNative
  RenderwareBinaryStream_Sphere* = ref object of KaitaiStruct
    `x`*: float32
    `y`*: float32
    `z`*: float32
    `radius`*: float32
    `parent`*: RenderwareBinaryStream_MorphTarget
  RenderwareBinaryStream_StructAtomic* = ref object of KaitaiStruct
    `frameIndex`*: uint32
    `geometryIndex`*: uint32
    `flagRender`*: bool
    `unnamed3`*: bool
    `flagCollisionTest`*: bool
    `unnamed5`*: uint64
    `unused`*: uint32
    `parent`*: RenderwareBinaryStream_ListWithHeader
  RenderwareBinaryStream_StructClump* = ref object of KaitaiStruct
    `numAtomics`*: uint32
    `numLights`*: uint32
    `numCameras`*: uint32
    `parent`*: RenderwareBinaryStream_ListWithHeader
  RenderwareBinaryStream_StructFrameList* = ref object of KaitaiStruct
    `numFrames`*: uint32
    `frames`*: seq[RenderwareBinaryStream_Frame]
    `parent`*: RenderwareBinaryStream_ListWithHeader
  RenderwareBinaryStream_StructGeometry* = ref object of KaitaiStruct
    `format`*: uint32
    `numTriangles`*: uint32
    `numVertices`*: uint32
    `numMorphTargets`*: uint32
    `surfProp`*: RenderwareBinaryStream_SurfaceProperties
    `geometry`*: RenderwareBinaryStream_GeometryNonNative
    `morphTargets`*: seq[RenderwareBinaryStream_MorphTarget]
    `parent`*: RenderwareBinaryStream_ListWithHeader
    `isNativeInst`: bool
    `isNativeInstFlag`: bool
    `isPrelitInst`: bool
    `isPrelitInstFlag`: bool
    `isTexturedInst`: bool
    `isTexturedInstFlag`: bool
    `isTextured2Inst`: bool
    `isTextured2InstFlag`: bool
    `numUvLayersInst`: int
    `numUvLayersInstFlag`: bool
    `numUvLayersRawInst`: int
    `numUvLayersRawInstFlag`: bool
  RenderwareBinaryStream_StructGeometryList* = ref object of KaitaiStruct
    `numGeometries`*: uint32
    `parent`*: RenderwareBinaryStream_ListWithHeader
  RenderwareBinaryStream_StructTextureDictionary* = ref object of KaitaiStruct
    `numTextures`*: uint32
    `parent`*: RenderwareBinaryStream_ListWithHeader
  RenderwareBinaryStream_SurfaceProperties* = ref object of KaitaiStruct
    `ambient`*: float32
    `specular`*: float32
    `diffuse`*: float32
    `parent`*: RenderwareBinaryStream_StructGeometry
  RenderwareBinaryStream_TexCoord* = ref object of KaitaiStruct
    `u`*: float32
    `v`*: float32
    `parent`*: RenderwareBinaryStream_UvLayer
  RenderwareBinaryStream_Triangle* = ref object of KaitaiStruct
    `vertex2`*: uint16
    `vertex1`*: uint16
    `materialId`*: uint16
    `vertex3`*: uint16
    `parent`*: RenderwareBinaryStream_GeometryNonNative
  RenderwareBinaryStream_UvLayer* = ref object of KaitaiStruct
    `texCoords`*: seq[RenderwareBinaryStream_TexCoord]
    `numVertices`*: uint32
    `parent`*: RenderwareBinaryStream_GeometryNonNative
  RenderwareBinaryStream_Vector3d* = ref object of KaitaiStruct
    `x`*: float32
    `y`*: float32
    `z`*: float32
    `parent`*: KaitaiStruct

proc read*(_: typedesc[RenderwareBinaryStream], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RenderwareBinaryStream
proc read*(_: typedesc[RenderwareBinaryStream_Frame], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructFrameList): RenderwareBinaryStream_Frame
proc read*(_: typedesc[RenderwareBinaryStream_GeometryNonNative], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructGeometry): RenderwareBinaryStream_GeometryNonNative
proc read*(_: typedesc[RenderwareBinaryStream_ListWithHeader], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream): RenderwareBinaryStream_ListWithHeader
proc read*(_: typedesc[RenderwareBinaryStream_Matrix], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_Frame): RenderwareBinaryStream_Matrix
proc read*(_: typedesc[RenderwareBinaryStream_MorphTarget], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructGeometry): RenderwareBinaryStream_MorphTarget
proc read*(_: typedesc[RenderwareBinaryStream_Rgba], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_GeometryNonNative): RenderwareBinaryStream_Rgba
proc read*(_: typedesc[RenderwareBinaryStream_Sphere], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_MorphTarget): RenderwareBinaryStream_Sphere
proc read*(_: typedesc[RenderwareBinaryStream_StructAtomic], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructAtomic
proc read*(_: typedesc[RenderwareBinaryStream_StructClump], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructClump
proc read*(_: typedesc[RenderwareBinaryStream_StructFrameList], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructFrameList
proc read*(_: typedesc[RenderwareBinaryStream_StructGeometry], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructGeometry
proc read*(_: typedesc[RenderwareBinaryStream_StructGeometryList], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructGeometryList
proc read*(_: typedesc[RenderwareBinaryStream_StructTextureDictionary], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructTextureDictionary
proc read*(_: typedesc[RenderwareBinaryStream_SurfaceProperties], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructGeometry): RenderwareBinaryStream_SurfaceProperties
proc read*(_: typedesc[RenderwareBinaryStream_TexCoord], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_UvLayer): RenderwareBinaryStream_TexCoord
proc read*(_: typedesc[RenderwareBinaryStream_Triangle], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_GeometryNonNative): RenderwareBinaryStream_Triangle
proc read*(_: typedesc[RenderwareBinaryStream_UvLayer], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_GeometryNonNative, numVertices: any): RenderwareBinaryStream_UvLayer
proc read*(_: typedesc[RenderwareBinaryStream_Vector3d], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RenderwareBinaryStream_Vector3d

proc version*(this: RenderwareBinaryStream): int
proc version*(this: RenderwareBinaryStream_ListWithHeader): int
proc isNative*(this: RenderwareBinaryStream_StructGeometry): bool
proc isPrelit*(this: RenderwareBinaryStream_StructGeometry): bool
proc isTextured*(this: RenderwareBinaryStream_StructGeometry): bool
proc isTextured2*(this: RenderwareBinaryStream_StructGeometry): bool
proc numUvLayers*(this: RenderwareBinaryStream_StructGeometry): int
proc numUvLayersRaw*(this: RenderwareBinaryStream_StructGeometry): int


##[
@see <a href="https://gtamods.com/wiki/RenderWare_binary_stream_file">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RenderwareBinaryStream =
  template this: untyped = result
  this = new(RenderwareBinaryStream)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = RenderwareBinaryStream_Sections(this.io.readU4le())
  this.code = codeExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let libraryIdStampExpr = this.io.readU4le()
  this.libraryIdStamp = libraryIdStampExpr
  block:
    let on = this.code
    if on == renderware_binary_stream.atomic:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == renderware_binary_stream.clump:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == renderware_binary_stream.frame_list:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == renderware_binary_stream.geometry:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == renderware_binary_stream.geometry_list:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == renderware_binary_stream.texture_dictionary:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == renderware_binary_stream.texture_native:
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = RenderwareBinaryStream_ListWithHeader.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.size))
      this.body = bodyExpr

proc version(this: RenderwareBinaryStream): int = 
  if this.versionInstFlag:
    return this.versionInst
  let versionInstExpr = int((if (this.libraryIdStamp and 4294901760'i64) != 0: (this.libraryIdStamp shr 14 and 261888) + 196608 or this.libraryIdStamp shr 16 and 63 else: this.libraryIdStamp shl 8))
  this.versionInst = versionInstExpr
  this.versionInstFlag = true
  return this.versionInst

proc fromFile*(_: typedesc[RenderwareBinaryStream], filename: string): RenderwareBinaryStream =
  RenderwareBinaryStream.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_Frame], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructFrameList): RenderwareBinaryStream_Frame =
  template this: untyped = result
  this = new(RenderwareBinaryStream_Frame)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rotationMatrixExpr = RenderwareBinaryStream_Matrix.read(this.io, this.root, this)
  this.rotationMatrix = rotationMatrixExpr
  let positionExpr = RenderwareBinaryStream_Vector3d.read(this.io, this.root, this)
  this.position = positionExpr
  let curFrameIdxExpr = this.io.readS4le()
  this.curFrameIdx = curFrameIdxExpr
  let matrixCreationFlagsExpr = this.io.readU4le()
  this.matrixCreationFlags = matrixCreationFlagsExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_Frame], filename: string): RenderwareBinaryStream_Frame =
  RenderwareBinaryStream_Frame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_GeometryNonNative], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructGeometry): RenderwareBinaryStream_GeometryNonNative =
  template this: untyped = result
  this = new(RenderwareBinaryStream_GeometryNonNative)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.parent.isPrelit:
    for i in 0 ..< int(this.parent.numVertices):
      let it = RenderwareBinaryStream_Rgba.read(this.io, this.root, this)
      this.prelitColors.add(it)
  for i in 0 ..< int(this.parent.numUvLayers):
    let it = RenderwareBinaryStream_UvLayer.read(this.io, this.root, this, this.parent.numVertices)
    this.uvLayers.add(it)
  for i in 0 ..< int(this.parent.numTriangles):
    let it = RenderwareBinaryStream_Triangle.read(this.io, this.root, this)
    this.triangles.add(it)

proc fromFile*(_: typedesc[RenderwareBinaryStream_GeometryNonNative], filename: string): RenderwareBinaryStream_GeometryNonNative =
  RenderwareBinaryStream_GeometryNonNative.read(newKaitaiFileStream(filename), nil, nil)


##[
Typical structure used by many data types in RenderWare binary
stream. Substream contains a list of binary stream entries,
first entry always has type "struct" and carries some specific
binary data it in, determined by the type of parent. All other
entries, beside the first one, are normal, self-describing
records.

]##
proc read*(_: typedesc[RenderwareBinaryStream_ListWithHeader], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream): RenderwareBinaryStream_ListWithHeader =
  template this: untyped = result
  this = new(RenderwareBinaryStream_ListWithHeader)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = this.io.readBytes(int(4))
  this.code = codeExpr
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr
  let libraryIdStampExpr = this.io.readU4le()
  this.libraryIdStamp = libraryIdStampExpr
  block:
    let on = this.parent.code
    if on == renderware_binary_stream.atomic:
      let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
      this.rawHeader = rawHeaderExpr
      let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
      let headerExpr = RenderwareBinaryStream_StructAtomic.read(rawHeaderIo, this.root, this)
      this.header = headerExpr
    elif on == renderware_binary_stream.clump:
      let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
      this.rawHeader = rawHeaderExpr
      let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
      let headerExpr = RenderwareBinaryStream_StructClump.read(rawHeaderIo, this.root, this)
      this.header = headerExpr
    elif on == renderware_binary_stream.frame_list:
      let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
      this.rawHeader = rawHeaderExpr
      let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
      let headerExpr = RenderwareBinaryStream_StructFrameList.read(rawHeaderIo, this.root, this)
      this.header = headerExpr
    elif on == renderware_binary_stream.geometry:
      let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
      this.rawHeader = rawHeaderExpr
      let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
      let headerExpr = RenderwareBinaryStream_StructGeometry.read(rawHeaderIo, this.root, this)
      this.header = headerExpr
    elif on == renderware_binary_stream.geometry_list:
      let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
      this.rawHeader = rawHeaderExpr
      let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
      let headerExpr = RenderwareBinaryStream_StructGeometryList.read(rawHeaderIo, this.root, this)
      this.header = headerExpr
    elif on == renderware_binary_stream.texture_dictionary:
      let rawHeaderExpr = this.io.readBytes(int(this.headerSize))
      this.rawHeader = rawHeaderExpr
      let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
      let headerExpr = RenderwareBinaryStream_StructTextureDictionary.read(rawHeaderIo, this.root, this)
      this.header = headerExpr
    else:
      let headerExpr = this.io.readBytes(int(this.headerSize))
      this.header = headerExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = RenderwareBinaryStream.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc version(this: RenderwareBinaryStream_ListWithHeader): int = 
  if this.versionInstFlag:
    return this.versionInst
  let versionInstExpr = int((if (this.libraryIdStamp and 4294901760'i64) != 0: (this.libraryIdStamp shr 14 and 261888) + 196608 or this.libraryIdStamp shr 16 and 63 else: this.libraryIdStamp shl 8))
  this.versionInst = versionInstExpr
  this.versionInstFlag = true
  return this.versionInst

proc fromFile*(_: typedesc[RenderwareBinaryStream_ListWithHeader], filename: string): RenderwareBinaryStream_ListWithHeader =
  RenderwareBinaryStream_ListWithHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_Matrix], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_Frame): RenderwareBinaryStream_Matrix =
  template this: untyped = result
  this = new(RenderwareBinaryStream_Matrix)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(3):
    let it = RenderwareBinaryStream_Vector3d.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[RenderwareBinaryStream_Matrix], filename: string): RenderwareBinaryStream_Matrix =
  RenderwareBinaryStream_Matrix.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_MorphTarget], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructGeometry): RenderwareBinaryStream_MorphTarget =
  template this: untyped = result
  this = new(RenderwareBinaryStream_MorphTarget)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let boundingSphereExpr = RenderwareBinaryStream_Sphere.read(this.io, this.root, this)
  this.boundingSphere = boundingSphereExpr
  let hasVerticesExpr = this.io.readU4le()
  this.hasVertices = hasVerticesExpr
  let hasNormalsExpr = this.io.readU4le()
  this.hasNormals = hasNormalsExpr
  if this.hasVertices != 0:
    for i in 0 ..< int(this.parent.numVertices):
      let it = RenderwareBinaryStream_Vector3d.read(this.io, this.root, this)
      this.vertices.add(it)
  if this.hasNormals != 0:
    for i in 0 ..< int(this.parent.numVertices):
      let it = RenderwareBinaryStream_Vector3d.read(this.io, this.root, this)
      this.normals.add(it)

proc fromFile*(_: typedesc[RenderwareBinaryStream_MorphTarget], filename: string): RenderwareBinaryStream_MorphTarget =
  RenderwareBinaryStream_MorphTarget.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_Rgba], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_GeometryNonNative): RenderwareBinaryStream_Rgba =
  template this: untyped = result
  this = new(RenderwareBinaryStream_Rgba)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
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

proc fromFile*(_: typedesc[RenderwareBinaryStream_Rgba], filename: string): RenderwareBinaryStream_Rgba =
  RenderwareBinaryStream_Rgba.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_Sphere], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_MorphTarget): RenderwareBinaryStream_Sphere =
  template this: untyped = result
  this = new(RenderwareBinaryStream_Sphere)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF4le()
  this.x = xExpr
  let yExpr = this.io.readF4le()
  this.y = yExpr
  let zExpr = this.io.readF4le()
  this.z = zExpr
  let radiusExpr = this.io.readF4le()
  this.radius = radiusExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_Sphere], filename: string): RenderwareBinaryStream_Sphere =
  RenderwareBinaryStream_Sphere.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/Atomic_(RW_Section)#Structure">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_StructAtomic], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructAtomic =
  template this: untyped = result
  this = new(RenderwareBinaryStream_StructAtomic)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let frameIndexExpr = this.io.readU4le()
  this.frameIndex = frameIndexExpr
  let geometryIndexExpr = this.io.readU4le()
  this.geometryIndex = geometryIndexExpr
  let flagRenderExpr = this.io.readBitsIntLe(1) != 0
  this.flagRender = flagRenderExpr
  let unnamed3Expr = this.io.readBitsIntLe(1) != 0
  this.unnamed3 = unnamed3Expr
  let flagCollisionTestExpr = this.io.readBitsIntLe(1) != 0
  this.flagCollisionTest = flagCollisionTestExpr
  let unnamed5Expr = this.io.readBitsIntLe(29)
  this.unnamed5 = unnamed5Expr
  alignToByte(this.io)
  let unusedExpr = this.io.readU4le()
  this.unused = unusedExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_StructAtomic], filename: string): RenderwareBinaryStream_StructAtomic =
  RenderwareBinaryStream_StructAtomic.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/RpClump">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_StructClump], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructClump =
  template this: untyped = result
  this = new(RenderwareBinaryStream_StructClump)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numAtomicsExpr = this.io.readU4le()
  this.numAtomics = numAtomicsExpr
  if this.parent.version >= 208896:
    let numLightsExpr = this.io.readU4le()
    this.numLights = numLightsExpr
  if this.parent.version >= 208896:
    let numCamerasExpr = this.io.readU4le()
    this.numCameras = numCamerasExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_StructClump], filename: string): RenderwareBinaryStream_StructClump =
  RenderwareBinaryStream_StructClump.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_StructFrameList], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructFrameList =
  template this: untyped = result
  this = new(RenderwareBinaryStream_StructFrameList)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numFramesExpr = this.io.readU4le()
  this.numFrames = numFramesExpr
  for i in 0 ..< int(this.numFrames):
    let it = RenderwareBinaryStream_Frame.read(this.io, this.root, this)
    this.frames.add(it)

proc fromFile*(_: typedesc[RenderwareBinaryStream_StructFrameList], filename: string): RenderwareBinaryStream_StructFrameList =
  RenderwareBinaryStream_StructFrameList.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_StructGeometry], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructGeometry =
  template this: untyped = result
  this = new(RenderwareBinaryStream_StructGeometry)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = this.io.readU4le()
  this.format = formatExpr
  let numTrianglesExpr = this.io.readU4le()
  this.numTriangles = numTrianglesExpr
  let numVerticesExpr = this.io.readU4le()
  this.numVertices = numVerticesExpr
  let numMorphTargetsExpr = this.io.readU4le()
  this.numMorphTargets = numMorphTargetsExpr
  if this.parent.version < 212992:
    let surfPropExpr = RenderwareBinaryStream_SurfaceProperties.read(this.io, this.root, this)
    this.surfProp = surfPropExpr
  if not(this.isNative):
    let geometryExpr = RenderwareBinaryStream_GeometryNonNative.read(this.io, this.root, this)
    this.geometry = geometryExpr
  for i in 0 ..< int(this.numMorphTargets):
    let it = RenderwareBinaryStream_MorphTarget.read(this.io, this.root, this)
    this.morphTargets.add(it)

proc isNative(this: RenderwareBinaryStream_StructGeometry): bool = 
  if this.isNativeInstFlag:
    return this.isNativeInst
  let isNativeInstExpr = bool((this.format and 16777216) != 0)
  this.isNativeInst = isNativeInstExpr
  this.isNativeInstFlag = true
  return this.isNativeInst

proc isPrelit(this: RenderwareBinaryStream_StructGeometry): bool = 
  if this.isPrelitInstFlag:
    return this.isPrelitInst
  let isPrelitInstExpr = bool((this.format and 8) != 0)
  this.isPrelitInst = isPrelitInstExpr
  this.isPrelitInstFlag = true
  return this.isPrelitInst

proc isTextured(this: RenderwareBinaryStream_StructGeometry): bool = 
  if this.isTexturedInstFlag:
    return this.isTexturedInst
  let isTexturedInstExpr = bool((this.format and 4) != 0)
  this.isTexturedInst = isTexturedInstExpr
  this.isTexturedInstFlag = true
  return this.isTexturedInst

proc isTextured2(this: RenderwareBinaryStream_StructGeometry): bool = 
  if this.isTextured2InstFlag:
    return this.isTextured2Inst
  let isTextured2InstExpr = bool((this.format and 128) != 0)
  this.isTextured2Inst = isTextured2InstExpr
  this.isTextured2InstFlag = true
  return this.isTextured2Inst

proc numUvLayers(this: RenderwareBinaryStream_StructGeometry): int = 
  if this.numUvLayersInstFlag:
    return this.numUvLayersInst
  let numUvLayersInstExpr = int((if this.numUvLayersRaw == 0: (if this.isTextured2: 2 else: (if this.isTextured: 1 else: 0)) else: this.numUvLayersRaw))
  this.numUvLayersInst = numUvLayersInstExpr
  this.numUvLayersInstFlag = true
  return this.numUvLayersInst

proc numUvLayersRaw(this: RenderwareBinaryStream_StructGeometry): int = 
  if this.numUvLayersRawInstFlag:
    return this.numUvLayersRawInst
  let numUvLayersRawInstExpr = int((this.format and 16711680) shr 16)
  this.numUvLayersRawInst = numUvLayersRawInstExpr
  this.numUvLayersRawInstFlag = true
  return this.numUvLayersRawInst

proc fromFile*(_: typedesc[RenderwareBinaryStream_StructGeometry], filename: string): RenderwareBinaryStream_StructGeometry =
  RenderwareBinaryStream_StructGeometry.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_StructGeometryList], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructGeometryList =
  template this: untyped = result
  this = new(RenderwareBinaryStream_StructGeometryList)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numGeometriesExpr = this.io.readU4le()
  this.numGeometries = numGeometriesExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_StructGeometryList], filename: string): RenderwareBinaryStream_StructGeometryList =
  RenderwareBinaryStream_StructGeometryList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_StructTextureDictionary], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_ListWithHeader): RenderwareBinaryStream_StructTextureDictionary =
  template this: untyped = result
  this = new(RenderwareBinaryStream_StructTextureDictionary)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numTexturesExpr = this.io.readU4le()
  this.numTextures = numTexturesExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_StructTextureDictionary], filename: string): RenderwareBinaryStream_StructTextureDictionary =
  RenderwareBinaryStream_StructTextureDictionary.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_SurfaceProperties], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_StructGeometry): RenderwareBinaryStream_SurfaceProperties =
  template this: untyped = result
  this = new(RenderwareBinaryStream_SurfaceProperties)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ambientExpr = this.io.readF4le()
  this.ambient = ambientExpr
  let specularExpr = this.io.readF4le()
  this.specular = specularExpr
  let diffuseExpr = this.io.readF4le()
  this.diffuse = diffuseExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_SurfaceProperties], filename: string): RenderwareBinaryStream_SurfaceProperties =
  RenderwareBinaryStream_SurfaceProperties.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_TexCoord], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_UvLayer): RenderwareBinaryStream_TexCoord =
  template this: untyped = result
  this = new(RenderwareBinaryStream_TexCoord)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uExpr = this.io.readF4le()
  this.u = uExpr
  let vExpr = this.io.readF4le()
  this.v = vExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_TexCoord], filename: string): RenderwareBinaryStream_TexCoord =
  RenderwareBinaryStream_TexCoord.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_Triangle], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_GeometryNonNative): RenderwareBinaryStream_Triangle =
  template this: untyped = result
  this = new(RenderwareBinaryStream_Triangle)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let vertex2Expr = this.io.readU2le()
  this.vertex2 = vertex2Expr
  let vertex1Expr = this.io.readU2le()
  this.vertex1 = vertex1Expr
  let materialIdExpr = this.io.readU2le()
  this.materialId = materialIdExpr
  let vertex3Expr = this.io.readU2le()
  this.vertex3 = vertex3Expr

proc fromFile*(_: typedesc[RenderwareBinaryStream_Triangle], filename: string): RenderwareBinaryStream_Triangle =
  RenderwareBinaryStream_Triangle.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[RenderwareBinaryStream_UvLayer], io: KaitaiStream, root: KaitaiStruct, parent: RenderwareBinaryStream_GeometryNonNative, numVertices: any): RenderwareBinaryStream_UvLayer =
  template this: untyped = result
  this = new(RenderwareBinaryStream_UvLayer)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent
  let numVerticesExpr = uint32(numVertices)
  this.numVertices = numVerticesExpr

  for i in 0 ..< int(this.numVertices):
    let it = RenderwareBinaryStream_TexCoord.read(this.io, this.root, this)
    this.texCoords.add(it)

proc fromFile*(_: typedesc[RenderwareBinaryStream_UvLayer], filename: string): RenderwareBinaryStream_UvLayer =
  RenderwareBinaryStream_UvLayer.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
]##
proc read*(_: typedesc[RenderwareBinaryStream_Vector3d], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): RenderwareBinaryStream_Vector3d =
  template this: untyped = result
  this = new(RenderwareBinaryStream_Vector3d)
  let root = if root == nil: cast[RenderwareBinaryStream](this) else: cast[RenderwareBinaryStream](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF4le()
  this.x = xExpr
  let yExpr = this.io.readF4le()
  this.y = yExpr
  let zExpr = this.io.readF4le()
  this.z = zExpr

proc fromFile*(_: typedesc[RenderwareBinaryStream_Vector3d], filename: string): RenderwareBinaryStream_Vector3d =
  RenderwareBinaryStream_Vector3d.read(newKaitaiFileStream(filename), nil, nil)

