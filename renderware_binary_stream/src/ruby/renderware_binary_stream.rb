# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://www.gtamodding.com/wiki/RenderWare_binary_stream_file Source
class RenderwareBinaryStream < Kaitai::Struct::Struct

  SECTIONS = {
    1 => :sections_struct,
    2 => :sections_string,
    3 => :sections_extension,
    5 => :sections_camera,
    6 => :sections_texture,
    7 => :sections_material,
    8 => :sections_material_list,
    9 => :sections_atomic_section,
    10 => :sections_plane_section,
    11 => :sections_world,
    12 => :sections_spline,
    13 => :sections_matrix,
    14 => :sections_frame_list,
    15 => :sections_geometry,
    16 => :sections_clump,
    18 => :sections_light,
    19 => :sections_unicode_string,
    20 => :sections_atomic,
    21 => :sections_texture_native,
    22 => :sections_texture_dictionary,
    23 => :sections_animation_database,
    24 => :sections_image,
    25 => :sections_skin_animation,
    26 => :sections_geometry_list,
    27 => :sections_anim_animation,
    28 => :sections_team,
    29 => :sections_crowd,
    30 => :sections_delta_morph_animation,
    31 => :sections_right_to_render,
    32 => :sections_multitexture_effect_native,
    33 => :sections_multitexture_effect_dictionary,
    34 => :sections_team_dictionary,
    35 => :sections_platform_independent_texture_dictionary,
    36 => :sections_table_of_contents,
    37 => :sections_particle_standard_global_data,
    38 => :sections_altpipe,
    39 => :sections_platform_independent_peds,
    40 => :sections_patch_mesh,
    41 => :sections_chunk_group_start,
    42 => :sections_chunk_group_end,
    43 => :sections_uv_animation_dictionary,
    44 => :sections_coll_tree,
    257 => :sections_metrics_plg,
    258 => :sections_spline_plg,
    259 => :sections_stereo_plg,
    260 => :sections_vrml_plg,
    261 => :sections_morph_plg,
    262 => :sections_pvs_plg,
    263 => :sections_memory_leak_plg,
    264 => :sections_animation_plg,
    265 => :sections_gloss_plg,
    266 => :sections_logo_plg,
    267 => :sections_memory_info_plg,
    268 => :sections_random_plg,
    269 => :sections_png_image_plg,
    270 => :sections_bone_plg,
    271 => :sections_vrml_anim_plg,
    272 => :sections_sky_mipmap_val,
    273 => :sections_mrm_plg,
    274 => :sections_lod_atomic_plg,
    275 => :sections_me_plg,
    276 => :sections_lightmap_plg,
    277 => :sections_refine_plg,
    278 => :sections_skin_plg,
    279 => :sections_label_plg,
    280 => :sections_particles_plg,
    281 => :sections_geomtx_plg,
    282 => :sections_synth_core_plg,
    283 => :sections_stqpp_plg,
    284 => :sections_part_pp_plg,
    285 => :sections_collision_plg,
    286 => :sections_hanim_plg,
    287 => :sections_user_data_plg,
    288 => :sections_material_effects_plg,
    289 => :sections_particle_system_plg,
    290 => :sections_delta_morph_plg,
    291 => :sections_patch_plg,
    292 => :sections_team_plg,
    293 => :sections_crowd_pp_plg,
    294 => :sections_mip_split_plg,
    295 => :sections_anisotropy_plg,
    297 => :sections_gcn_material_plg,
    298 => :sections_geometric_pvs_plg,
    299 => :sections_xbox_material_plg,
    300 => :sections_multi_texture_plg,
    301 => :sections_chain_plg,
    302 => :sections_toon_plg,
    303 => :sections_ptank_plg,
    304 => :sections_particle_standard_plg,
    305 => :sections_pds_plg,
    306 => :sections_prtadv_plg,
    307 => :sections_normal_map_plg,
    308 => :sections_adc_plg,
    309 => :sections_uv_animation_plg,
    384 => :sections_character_set_plg,
    385 => :sections_nohs_world_plg,
    386 => :sections_import_util_plg,
    387 => :sections_slerp_plg,
    388 => :sections_optim_plg,
    389 => :sections_tl_world_plg,
    390 => :sections_database_plg,
    391 => :sections_raytrace_plg,
    392 => :sections_ray_plg,
    393 => :sections_library_plg,
    400 => :sections_plg_2d,
    401 => :sections_tile_render_plg,
    402 => :sections_jpeg_image_plg,
    403 => :sections_tga_image_plg,
    404 => :sections_gif_image_plg,
    405 => :sections_quat_plg,
    406 => :sections_spline_pvs_plg,
    407 => :sections_mipmap_plg,
    408 => :sections_mipmapk_plg,
    409 => :sections_font_2d,
    410 => :sections_intersection_plg,
    411 => :sections_tiff_image_plg,
    412 => :sections_pick_plg,
    413 => :sections_bmp_image_plg,
    414 => :sections_ras_image_plg,
    415 => :sections_skin_fx_plg,
    416 => :sections_vcat_plg,
    417 => :sections_path_2d,
    418 => :sections_brush_2d,
    419 => :sections_object_2d,
    420 => :sections_shape_2d,
    421 => :sections_scene_2d,
    422 => :sections_pick_region_2d,
    423 => :sections_object_string_2d,
    424 => :sections_animation_plg_2d,
    425 => :sections_animation_2d,
    432 => :sections_keyframe_2d,
    433 => :sections_maestro_2d,
    434 => :sections_barycentric,
    435 => :sections_platform_independent_texture_dictionary_tk,
    436 => :sections_toc_tk,
    437 => :sections_tpl_tk,
    438 => :sections_altpipe_tk,
    439 => :sections_animation_tk,
    440 => :sections_skin_split_tookit,
    441 => :sections_compressed_key_tk,
    442 => :sections_geometry_conditioning_plg,
    443 => :sections_wing_plg,
    444 => :sections_generic_pipeline_tk,
    445 => :sections_lightmap_conversion_tk,
    446 => :sections_filesystem_plg,
    447 => :sections_dictionary_tk,
    448 => :sections_uv_animation_linear,
    449 => :sections_uv_animation_parameter,
    1294 => :sections_bin_mesh_plg,
    1296 => :sections_native_data_plg,
    61982 => :sections_zmodeler_lock,
    39055872 => :sections_atomic_visibility_distance,
    39055873 => :sections_clump_visibility_distance,
    39055874 => :sections_frame_visibility_distance,
    39056115 => :sections_pipeline_set,
    39056116 => :sections_unused_5,
    39056117 => :sections_texdictionary_link,
    39056118 => :sections_specular_material,
    39056119 => :sections_unused_8,
    39056120 => :sections_effect_2d,
    39056121 => :sections_extra_vert_colour,
    39056122 => :sections_collision_model,
    39056123 => :sections_gta_hanim,
    39056124 => :sections_reflection_material,
    39056125 => :sections_breakable,
    39056126 => :sections_frame,
    39056127 => :sections_unused_16,
  }
  I__SECTIONS = SECTIONS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @code = Kaitai::Struct::Stream::resolve_enum(SECTIONS, @_io.read_u4le)
    @size = @_io.read_u4le
    @library_id_stamp = @_io.read_u4le
    case code
    when :sections_geometry
      @_raw_body = @_io.read_bytes(size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = ListWithHeader.new(_io__raw_body, self, @_root)
    when :sections_texture_dictionary
      @_raw_body = @_io.read_bytes(size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = ListWithHeader.new(_io__raw_body, self, @_root)
    when :sections_geometry_list
      @_raw_body = @_io.read_bytes(size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = ListWithHeader.new(_io__raw_body, self, @_root)
    when :sections_texture_native
      @_raw_body = @_io.read_bytes(size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = ListWithHeader.new(_io__raw_body, self, @_root)
    when :sections_clump
      @_raw_body = @_io.read_bytes(size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = ListWithHeader.new(_io__raw_body, self, @_root)
    when :sections_frame_list
      @_raw_body = @_io.read_bytes(size)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = ListWithHeader.new(_io__raw_body, self, @_root)
    else
      @body = @_io.read_bytes(size)
    end
    self
  end

  ##
  # @see https://www.gtamodding.com/wiki/RpClump Source
  class StructClump < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_atomics = @_io.read_u4le
      if _parent.version >= 208896
        @num_lights = @_io.read_u4le
      end
      if _parent.version >= 208896
        @num_cameras = @_io.read_u4le
      end
      self
    end
    attr_reader :num_atomics
    attr_reader :num_lights
    attr_reader :num_cameras
  end

  ##
  # @see https://www.gtamodding.com/wiki/RpGeometry Source
  class StructGeometry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @format = @_io.read_u4le
      @num_triangles = @_io.read_u4le
      @num_vertices = @_io.read_u4le
      @num_morph_targets = @_io.read_u4le
      if _parent.version < 212992
        @surf_prop = SurfaceProperties.new(@_io, self, @_root)
      end
      if !(is_native)
        @geometry = GeometryNonNative.new(@_io, self, @_root)
      end
      @morph_targets = Array.new(num_morph_targets)
      (num_morph_targets).times { |i|
        @morph_targets[i] = MorphTarget.new(@_io, self, @_root)
      }
      self
    end
    def is_textured
      return @is_textured unless @is_textured.nil?
      @is_textured = (format & 4) != 0
      @is_textured
    end
    def is_prelit
      return @is_prelit unless @is_prelit.nil?
      @is_prelit = (format & 8) != 0
      @is_prelit
    end
    def is_textured2
      return @is_textured2 unless @is_textured2.nil?
      @is_textured2 = (format & 128) != 0
      @is_textured2
    end
    def is_native
      return @is_native unless @is_native.nil?
      @is_native = (format & 16777216) != 0
      @is_native
    end
    attr_reader :format
    attr_reader :num_triangles
    attr_reader :num_vertices
    attr_reader :num_morph_targets
    attr_reader :surf_prop
    attr_reader :geometry
    attr_reader :morph_targets
  end
  class GeometryNonNative < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if _parent.is_prelit
        @prelit_colors = Array.new(_parent.num_vertices)
        (_parent.num_vertices).times { |i|
          @prelit_colors[i] = Rgba.new(@_io, self, @_root)
        }
      end
      if  ((_parent.is_textured) || (_parent.is_textured2)) 
        @tex_coords = Array.new(_parent.num_vertices)
        (_parent.num_vertices).times { |i|
          @tex_coords[i] = TexCoord.new(@_io, self, @_root)
        }
      end
      @triangles = Array.new(_parent.num_triangles)
      (_parent.num_triangles).times { |i|
        @triangles[i] = Triangle.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :prelit_colors
    attr_reader :tex_coords
    attr_reader :triangles
  end

  ##
  # @see https://www.gtamodding.com/wiki/Geometry_List_(RW_Section)#Structure Source
  class StructGeometryList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_geometries = @_io.read_u4le
      self
    end
    attr_reader :num_geometries
  end
  class Rgba < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @r = @_io.read_u1
      @g = @_io.read_u1
      @b = @_io.read_u1
      @a = @_io.read_u1
      self
    end
    attr_reader :r
    attr_reader :g
    attr_reader :b
    attr_reader :a
  end
  class Sphere < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_f4le
      @y = @_io.read_f4le
      @z = @_io.read_f4le
      @radius = @_io.read_f4le
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :radius
  end
  class MorphTarget < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_sphere = Sphere.new(@_io, self, @_root)
      @has_vertices = @_io.read_u4le
      @has_normals = @_io.read_u4le
      if has_vertices != 0
        @vertices = Array.new(_parent.num_vertices)
        (_parent.num_vertices).times { |i|
          @vertices[i] = Vector3d.new(@_io, self, @_root)
        }
      end
      if has_normals != 0
        @normals = Array.new(_parent.num_vertices)
        (_parent.num_vertices).times { |i|
          @normals[i] = Vector3d.new(@_io, self, @_root)
        }
      end
      self
    end
    attr_reader :bounding_sphere
    attr_reader :has_vertices
    attr_reader :has_normals
    attr_reader :vertices
    attr_reader :normals
  end

  ##
  # @see https://www.gtamodding.com/wiki/RpGeometry Source
  class SurfaceProperties < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ambient = @_io.read_f4le
      @specular = @_io.read_f4le
      @diffuse = @_io.read_f4le
      self
    end
    attr_reader :ambient
    attr_reader :specular
    attr_reader :diffuse
  end

  ##
  # @see https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure Source
  class StructFrameList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_frames = @_io.read_u4le
      @frames = Array.new(num_frames)
      (num_frames).times { |i|
        @frames[i] = Frame.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_frames
    attr_reader :frames
  end

  ##
  # @see https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure Source
  class Matrix < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = Array.new(3)
      (3).times { |i|
        @entries[i] = Vector3d.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :entries
  end

  ##
  # @see https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure Source
  class Vector3d < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_f4le
      @y = @_io.read_f4le
      @z = @_io.read_f4le
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
  end

  ##
  # Typical structure used by many data types in RenderWare binary
  # stream. Substream contains a list of binary stream entries,
  # first entry always has type "struct" and carries some specific
  # binary data it in, determined by the type of parent. All other
  # entries, beside the first one, are normal, self-describing
  # records.
  class ListWithHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([1, 0, 0, 0].pack('C*'), code, _io, "/types/list_with_header/seq/0") if not code == [1, 0, 0, 0].pack('C*')
      @header_size = @_io.read_u4le
      @library_id_stamp = @_io.read_u4le
      case _parent.code
      when :sections_geometry
        @_raw_header = @_io.read_bytes(header_size)
        _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
        @header = StructGeometry.new(_io__raw_header, self, @_root)
      when :sections_texture_dictionary
        @_raw_header = @_io.read_bytes(header_size)
        _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
        @header = StructTextureDictionary.new(_io__raw_header, self, @_root)
      when :sections_geometry_list
        @_raw_header = @_io.read_bytes(header_size)
        _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
        @header = StructGeometryList.new(_io__raw_header, self, @_root)
      when :sections_clump
        @_raw_header = @_io.read_bytes(header_size)
        _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
        @header = StructClump.new(_io__raw_header, self, @_root)
      when :sections_frame_list
        @_raw_header = @_io.read_bytes(header_size)
        _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
        @header = StructFrameList.new(_io__raw_header, self, @_root)
      else
        @header = @_io.read_bytes(header_size)
      end
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << RenderwareBinaryStream.new(@_io)
        i += 1
      end
      self
    end
    def version
      return @version unless @version.nil?
      @version = ((library_id_stamp & 4294901760) != 0 ? ((((library_id_stamp >> 14) & 261888) + 196608) | ((library_id_stamp >> 16) & 63)) : (library_id_stamp << 8))
      @version
    end
    attr_reader :code
    attr_reader :header_size
    attr_reader :library_id_stamp
    attr_reader :header
    attr_reader :entries
    attr_reader :_raw_header
  end
  class Triangle < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @vertex2 = @_io.read_u2le
      @vertex1 = @_io.read_u2le
      @material_id = @_io.read_u2le
      @vertex3 = @_io.read_u2le
      self
    end
    attr_reader :vertex2
    attr_reader :vertex1
    attr_reader :material_id
    attr_reader :vertex3
  end

  ##
  # @see https://www.gtamodding.com/wiki/Frame_List_(RW_Section)#Structure Source
  class Frame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rotation_matrix = Matrix.new(@_io, self, @_root)
      @position = Vector3d.new(@_io, self, @_root)
      @cur_frame_idx = @_io.read_s4le
      @matrix_creation_flags = @_io.read_u4le
      self
    end
    attr_reader :rotation_matrix
    attr_reader :position
    attr_reader :cur_frame_idx
    attr_reader :matrix_creation_flags
  end
  class TexCoord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @u = @_io.read_f4le
      @v = @_io.read_f4le
      self
    end
    attr_reader :u
    attr_reader :v
  end
  class StructTextureDictionary < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_textures = @_io.read_u4le
      self
    end
    attr_reader :num_textures
  end
  def version
    return @version unless @version.nil?
    @version = ((library_id_stamp & 4294901760) != 0 ? ((((library_id_stamp >> 14) & 261888) + 196608) | ((library_id_stamp >> 16) & 63)) : (library_id_stamp << 8))
    @version
  end
  attr_reader :code
  attr_reader :size
  attr_reader :library_id_stamp
  attr_reader :body
  attr_reader :_raw_body
end
