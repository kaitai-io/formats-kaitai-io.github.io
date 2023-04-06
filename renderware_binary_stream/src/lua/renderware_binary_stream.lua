-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- See also: Source (https://gtamods.com/wiki/RenderWare_binary_stream_file)
RenderwareBinaryStream = class.class(KaitaiStruct)

RenderwareBinaryStream.Sections = enum.Enum {
  struct = 1,
  string = 2,
  extension = 3,
  camera = 5,
  texture = 6,
  material = 7,
  material_list = 8,
  atomic_section = 9,
  plane_section = 10,
  world = 11,
  spline = 12,
  matrix = 13,
  frame_list = 14,
  geometry = 15,
  clump = 16,
  light = 18,
  unicode_string = 19,
  atomic = 20,
  texture_native = 21,
  texture_dictionary = 22,
  animation_database = 23,
  image = 24,
  skin_animation = 25,
  geometry_list = 26,
  anim_animation = 27,
  team = 28,
  crowd = 29,
  delta_morph_animation = 30,
  right_to_render = 31,
  multitexture_effect_native = 32,
  multitexture_effect_dictionary = 33,
  team_dictionary = 34,
  platform_independent_texture_dictionary = 35,
  table_of_contents = 36,
  particle_standard_global_data = 37,
  altpipe = 38,
  platform_independent_peds = 39,
  patch_mesh = 40,
  chunk_group_start = 41,
  chunk_group_end = 42,
  uv_animation_dictionary = 43,
  coll_tree = 44,
  metrics_plg = 257,
  spline_plg = 258,
  stereo_plg = 259,
  vrml_plg = 260,
  morph_plg = 261,
  pvs_plg = 262,
  memory_leak_plg = 263,
  animation_plg = 264,
  gloss_plg = 265,
  logo_plg = 266,
  memory_info_plg = 267,
  random_plg = 268,
  png_image_plg = 269,
  bone_plg = 270,
  vrml_anim_plg = 271,
  sky_mipmap_val = 272,
  mrm_plg = 273,
  lod_atomic_plg = 274,
  me_plg = 275,
  lightmap_plg = 276,
  refine_plg = 277,
  skin_plg = 278,
  label_plg = 279,
  particles_plg = 280,
  geomtx_plg = 281,
  synth_core_plg = 282,
  stqpp_plg = 283,
  part_pp_plg = 284,
  collision_plg = 285,
  hanim_plg = 286,
  user_data_plg = 287,
  material_effects_plg = 288,
  particle_system_plg = 289,
  delta_morph_plg = 290,
  patch_plg = 291,
  team_plg = 292,
  crowd_pp_plg = 293,
  mip_split_plg = 294,
  anisotropy_plg = 295,
  gcn_material_plg = 297,
  geometric_pvs_plg = 298,
  xbox_material_plg = 299,
  multi_texture_plg = 300,
  chain_plg = 301,
  toon_plg = 302,
  ptank_plg = 303,
  particle_standard_plg = 304,
  pds_plg = 305,
  prtadv_plg = 306,
  normal_map_plg = 307,
  adc_plg = 308,
  uv_animation_plg = 309,
  character_set_plg = 384,
  nohs_world_plg = 385,
  import_util_plg = 386,
  slerp_plg = 387,
  optim_plg = 388,
  tl_world_plg = 389,
  database_plg = 390,
  raytrace_plg = 391,
  ray_plg = 392,
  library_plg = 393,
  plg_2d = 400,
  tile_render_plg = 401,
  jpeg_image_plg = 402,
  tga_image_plg = 403,
  gif_image_plg = 404,
  quat_plg = 405,
  spline_pvs_plg = 406,
  mipmap_plg = 407,
  mipmapk_plg = 408,
  font_2d = 409,
  intersection_plg = 410,
  tiff_image_plg = 411,
  pick_plg = 412,
  bmp_image_plg = 413,
  ras_image_plg = 414,
  skin_fx_plg = 415,
  vcat_plg = 416,
  path_2d = 417,
  brush_2d = 418,
  object_2d = 419,
  shape_2d = 420,
  scene_2d = 421,
  pick_region_2d = 422,
  object_string_2d = 423,
  animation_plg_2d = 424,
  animation_2d = 425,
  keyframe_2d = 432,
  maestro_2d = 433,
  barycentric = 434,
  platform_independent_texture_dictionary_tk = 435,
  toc_tk = 436,
  tpl_tk = 437,
  altpipe_tk = 438,
  animation_tk = 439,
  skin_split_tookit = 440,
  compressed_key_tk = 441,
  geometry_conditioning_plg = 442,
  wing_plg = 443,
  generic_pipeline_tk = 444,
  lightmap_conversion_tk = 445,
  filesystem_plg = 446,
  dictionary_tk = 447,
  uv_animation_linear = 448,
  uv_animation_parameter = 449,
  bin_mesh_plg = 1294,
  native_data_plg = 1296,
  zmodeler_lock = 61982,
  atomic_visibility_distance = 39055872,
  clump_visibility_distance = 39055873,
  frame_visibility_distance = 39055874,
  pipeline_set = 39056115,
  unused_5 = 39056116,
  texdictionary_link = 39056117,
  specular_material = 39056118,
  unused_8 = 39056119,
  effect_2d = 39056120,
  extra_vert_colour = 39056121,
  collision_model = 39056122,
  gta_hanim = 39056123,
  reflection_material = 39056124,
  breakable = 39056125,
  frame = 39056126,
  unused_16 = 39056127,
}

function RenderwareBinaryStream:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream:_read()
  self.code = RenderwareBinaryStream.Sections(self._io:read_u4le())
  self.size = self._io:read_u4le()
  self.library_id_stamp = self._io:read_u4le()
  local _on = self.code
  if _on == RenderwareBinaryStream.Sections.atomic then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.geometry then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.texture_dictionary then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.geometry_list then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.texture_native then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.clump then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.frame_list then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RenderwareBinaryStream.ListWithHeader(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.size)
  end
end

RenderwareBinaryStream.property.version = {}
function RenderwareBinaryStream.property.version:get()
  if self._m_version ~= nil then
    return self._m_version
  end

  self._m_version = utils.box_unwrap(((self.library_id_stamp & 4294901760) ~= 0) and utils.box_wrap(((((self.library_id_stamp >> 14) & 261888) + 196608) | ((self.library_id_stamp >> 16) & 63))) or ((self.library_id_stamp << 8)))
  return self._m_version
end


-- 
-- See also: Source (https://gtamods.com/wiki/RpClump)
RenderwareBinaryStream.StructClump = class.class(KaitaiStruct)

function RenderwareBinaryStream.StructClump:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.StructClump:_read()
  self.num_atomics = self._io:read_u4le()
  if self._parent.version >= 208896 then
    self.num_lights = self._io:read_u4le()
  end
  if self._parent.version >= 208896 then
    self.num_cameras = self._io:read_u4le()
  end
end


-- 
-- See also: Source (https://gtamods.com/wiki/RpGeometry)
RenderwareBinaryStream.StructGeometry = class.class(KaitaiStruct)

function RenderwareBinaryStream.StructGeometry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.StructGeometry:_read()
  self.format = self._io:read_u4le()
  self.num_triangles = self._io:read_u4le()
  self.num_vertices = self._io:read_u4le()
  self.num_morph_targets = self._io:read_u4le()
  if self._parent.version < 212992 then
    self.surf_prop = RenderwareBinaryStream.SurfaceProperties(self._io, self, self._root)
  end
  if not(self.is_native) then
    self.geometry = RenderwareBinaryStream.GeometryNonNative(self._io, self, self._root)
  end
  self.morph_targets = {}
  for i = 0, self.num_morph_targets - 1 do
    self.morph_targets[i + 1] = RenderwareBinaryStream.MorphTarget(self._io, self, self._root)
  end
end

RenderwareBinaryStream.StructGeometry.property.is_textured = {}
function RenderwareBinaryStream.StructGeometry.property.is_textured:get()
  if self._m_is_textured ~= nil then
    return self._m_is_textured
  end

  self._m_is_textured = (self.format & 4) ~= 0
  return self._m_is_textured
end

RenderwareBinaryStream.StructGeometry.property.is_prelit = {}
function RenderwareBinaryStream.StructGeometry.property.is_prelit:get()
  if self._m_is_prelit ~= nil then
    return self._m_is_prelit
  end

  self._m_is_prelit = (self.format & 8) ~= 0
  return self._m_is_prelit
end

RenderwareBinaryStream.StructGeometry.property.is_textured2 = {}
function RenderwareBinaryStream.StructGeometry.property.is_textured2:get()
  if self._m_is_textured2 ~= nil then
    return self._m_is_textured2
  end

  self._m_is_textured2 = (self.format & 128) ~= 0
  return self._m_is_textured2
end

RenderwareBinaryStream.StructGeometry.property.is_native = {}
function RenderwareBinaryStream.StructGeometry.property.is_native:get()
  if self._m_is_native ~= nil then
    return self._m_is_native
  end

  self._m_is_native = (self.format & 16777216) ~= 0
  return self._m_is_native
end


RenderwareBinaryStream.GeometryNonNative = class.class(KaitaiStruct)

function RenderwareBinaryStream.GeometryNonNative:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.GeometryNonNative:_read()
  if self._parent.is_prelit then
    self.prelit_colors = {}
    for i = 0, self._parent.num_vertices - 1 do
      self.prelit_colors[i + 1] = RenderwareBinaryStream.Rgba(self._io, self, self._root)
    end
  end
  if  ((self._parent.is_textured) or (self._parent.is_textured2))  then
    self.tex_coords = {}
    for i = 0, self._parent.num_vertices - 1 do
      self.tex_coords[i + 1] = RenderwareBinaryStream.TexCoord(self._io, self, self._root)
    end
  end
  self.triangles = {}
  for i = 0, self._parent.num_triangles - 1 do
    self.triangles[i + 1] = RenderwareBinaryStream.Triangle(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure)
RenderwareBinaryStream.StructGeometryList = class.class(KaitaiStruct)

function RenderwareBinaryStream.StructGeometryList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.StructGeometryList:_read()
  self.num_geometries = self._io:read_u4le()
end


RenderwareBinaryStream.Rgba = class.class(KaitaiStruct)

function RenderwareBinaryStream.Rgba:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.Rgba:_read()
  self.r = self._io:read_u1()
  self.g = self._io:read_u1()
  self.b = self._io:read_u1()
  self.a = self._io:read_u1()
end


RenderwareBinaryStream.Sphere = class.class(KaitaiStruct)

function RenderwareBinaryStream.Sphere:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.Sphere:_read()
  self.x = self._io:read_f4le()
  self.y = self._io:read_f4le()
  self.z = self._io:read_f4le()
  self.radius = self._io:read_f4le()
end


RenderwareBinaryStream.MorphTarget = class.class(KaitaiStruct)

function RenderwareBinaryStream.MorphTarget:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.MorphTarget:_read()
  self.bounding_sphere = RenderwareBinaryStream.Sphere(self._io, self, self._root)
  self.has_vertices = self._io:read_u4le()
  self.has_normals = self._io:read_u4le()
  if self.has_vertices ~= 0 then
    self.vertices = {}
    for i = 0, self._parent.num_vertices - 1 do
      self.vertices[i + 1] = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
    end
  end
  if self.has_normals ~= 0 then
    self.normals = {}
    for i = 0, self._parent.num_vertices - 1 do
      self.normals[i + 1] = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
    end
  end
end


-- 
-- See also: Source (https://gtamods.com/wiki/Atomic_(RW_Section)#Structure)
RenderwareBinaryStream.StructAtomic = class.class(KaitaiStruct)

function RenderwareBinaryStream.StructAtomic:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.StructAtomic:_read()
  self.frame_index = self._io:read_u4le()
  self.geometry_index = self._io:read_u4le()
  self.flag_render = self._io:read_bits_int_le(1) ~= 0
  self._unnamed3 = self._io:read_bits_int_le(1) ~= 0
  self.flag_collision_test = self._io:read_bits_int_le(1) ~= 0
  self._unnamed5 = self._io:read_bits_int_le(29)
  self._io:align_to_byte()
  self.unused = self._io:read_u4le()
end


-- 
-- See also: Source (https://gtamods.com/wiki/RpGeometry)
RenderwareBinaryStream.SurfaceProperties = class.class(KaitaiStruct)

function RenderwareBinaryStream.SurfaceProperties:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.SurfaceProperties:_read()
  self.ambient = self._io:read_f4le()
  self.specular = self._io:read_f4le()
  self.diffuse = self._io:read_f4le()
end


-- 
-- See also: Source (https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure)
RenderwareBinaryStream.StructFrameList = class.class(KaitaiStruct)

function RenderwareBinaryStream.StructFrameList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.StructFrameList:_read()
  self.num_frames = self._io:read_u4le()
  self.frames = {}
  for i = 0, self.num_frames - 1 do
    self.frames[i + 1] = RenderwareBinaryStream.Frame(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure)
RenderwareBinaryStream.Matrix = class.class(KaitaiStruct)

function RenderwareBinaryStream.Matrix:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.Matrix:_read()
  self.entries = {}
  for i = 0, 3 - 1 do
    self.entries[i + 1] = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure)
RenderwareBinaryStream.Vector3d = class.class(KaitaiStruct)

function RenderwareBinaryStream.Vector3d:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.Vector3d:_read()
  self.x = self._io:read_f4le()
  self.y = self._io:read_f4le()
  self.z = self._io:read_f4le()
end


-- 
-- Typical structure used by many data types in RenderWare binary
-- stream. Substream contains a list of binary stream entries,
-- first entry always has type "struct" and carries some specific
-- binary data it in, determined by the type of parent. All other
-- entries, beside the first one, are normal, self-describing
-- records.
RenderwareBinaryStream.ListWithHeader = class.class(KaitaiStruct)

function RenderwareBinaryStream.ListWithHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.ListWithHeader:_read()
  self.code = self._io:read_bytes(4)
  if not(self.code == "\001\000\000\000") then
    error("not equal, expected " ..  "\001\000\000\000" .. ", but got " .. self.code)
  end
  self.header_size = self._io:read_u4le()
  self.library_id_stamp = self._io:read_u4le()
  local _on = self._parent.code
  if _on == RenderwareBinaryStream.Sections.atomic then
    self._raw_header = self._io:read_bytes(self.header_size)
    local _io = KaitaiStream(stringstream(self._raw_header))
    self.header = RenderwareBinaryStream.StructAtomic(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.geometry then
    self._raw_header = self._io:read_bytes(self.header_size)
    local _io = KaitaiStream(stringstream(self._raw_header))
    self.header = RenderwareBinaryStream.StructGeometry(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.texture_dictionary then
    self._raw_header = self._io:read_bytes(self.header_size)
    local _io = KaitaiStream(stringstream(self._raw_header))
    self.header = RenderwareBinaryStream.StructTextureDictionary(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.geometry_list then
    self._raw_header = self._io:read_bytes(self.header_size)
    local _io = KaitaiStream(stringstream(self._raw_header))
    self.header = RenderwareBinaryStream.StructGeometryList(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.clump then
    self._raw_header = self._io:read_bytes(self.header_size)
    local _io = KaitaiStream(stringstream(self._raw_header))
    self.header = RenderwareBinaryStream.StructClump(_io, self, self._root)
  elseif _on == RenderwareBinaryStream.Sections.frame_list then
    self._raw_header = self._io:read_bytes(self.header_size)
    local _io = KaitaiStream(stringstream(self._raw_header))
    self.header = RenderwareBinaryStream.StructFrameList(_io, self, self._root)
  else
    self.header = self._io:read_bytes(self.header_size)
  end
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = RenderwareBinaryStream(self._io)
    i = i + 1
  end
end

RenderwareBinaryStream.ListWithHeader.property.version = {}
function RenderwareBinaryStream.ListWithHeader.property.version:get()
  if self._m_version ~= nil then
    return self._m_version
  end

  self._m_version = utils.box_unwrap(((self.library_id_stamp & 4294901760) ~= 0) and utils.box_wrap(((((self.library_id_stamp >> 14) & 261888) + 196608) | ((self.library_id_stamp >> 16) & 63))) or ((self.library_id_stamp << 8)))
  return self._m_version
end


RenderwareBinaryStream.Triangle = class.class(KaitaiStruct)

function RenderwareBinaryStream.Triangle:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.Triangle:_read()
  self.vertex2 = self._io:read_u2le()
  self.vertex1 = self._io:read_u2le()
  self.material_id = self._io:read_u2le()
  self.vertex3 = self._io:read_u2le()
end


-- 
-- See also: Source (https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure)
RenderwareBinaryStream.Frame = class.class(KaitaiStruct)

function RenderwareBinaryStream.Frame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.Frame:_read()
  self.rotation_matrix = RenderwareBinaryStream.Matrix(self._io, self, self._root)
  self.position = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
  self.cur_frame_idx = self._io:read_s4le()
  self.matrix_creation_flags = self._io:read_u4le()
end


RenderwareBinaryStream.TexCoord = class.class(KaitaiStruct)

function RenderwareBinaryStream.TexCoord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.TexCoord:_read()
  self.u = self._io:read_f4le()
  self.v = self._io:read_f4le()
end


RenderwareBinaryStream.StructTextureDictionary = class.class(KaitaiStruct)

function RenderwareBinaryStream.StructTextureDictionary:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RenderwareBinaryStream.StructTextureDictionary:_read()
  self.num_textures = self._io:read_u4le()
end


