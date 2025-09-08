# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The MD2 format is used for 3D animated models in id Sofware's Quake II.
# 
# A model consists of named `frames`, each with the same number of `vertices`
# (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
# model space. Each vertex has the same topological "meaning" across frames, in
# terms of triangle and texture info; it just varies in position and normal for
# animation purposes.
# 
# How the vertices form triangles is defined via disjoint `triangles` or via
# `gl_cmds` (which allows strip and fan topology). Each triangle contains three
# `vertex_indices` into frame vertices, and three `tex_point_indices` into
# global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
# ranging from 0 to `skin_{width,height}_px` respectively, along with
# `{s,t}_normalized` ranging from 0 to 1 for your convenience.
# 
# A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
# with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
# to 1, and a `vertex_index` into frame vertices.
# 
# A model may also contain `skins`, which are just file paths to PCX images.
# However, this is empty for many models, in which case it is up to the client
# (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
# current directory).
# 
# There are 198 `frames` in total, partitioned into a fixed set of ranges used
# for different animations. Each frame has a standard `name` for humans, but the
# client just uses their index and the name can be arbitrary. The name, start
# frame index and frame count of each animation can be looked up in the arrays
# `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
# information is summarized in the following table:
# 
# ```
# |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
# |:--------:|--------:|:-------|:-------------------------------------------------------|
# |    0-39  |   stand | 01-40  | Idle animation                                         |
# |   40-45  |     run | 1-6    | Full run cycle                                         |
# |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
# |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
# |   58-61  |   pain2 | 01-04  |                                                        |
# |   62-65  |   pain3 | 01-04  |                                                        |
# |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
# |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
# |   84-94  |  salute | 01-11  |                                                        |
# |   95-111 |   taunt | 01-17  |                                                        |
# |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
# |  123-134 |   point | 01-12  |                                                        |
# |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
# |  154-159 |  crwalk | 1-6    |                                                        |
# |  160-168 | crattak | 1-9    |                                                        |
# |  169-172 |  crpain | 1-4    |                                                        |
# |  173-177 | crdeath | 1-5    |                                                        |
# |  178-183 |  death1 | 01-06  |                                                        |
# |  184-189 |  death2 | 01-06  |                                                        |
# |  190-197 |  death3 | 01-08  |                                                        |
# ```
# 
# The above are filled in for player models; for the separate weapon models,
# the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
# during death animations. `a_grenades.md2`, the handgrenade weapon model, is
# the same except that the `wave` frames are blank (according to the default
# female model files). This is likely due to its dual use as a grenade throw
# animation where this model must leave the player's model.
# @see https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html Source
# @see http://tfc.duke.free.fr/coding/md2-specs-en.html Source
# @see http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html Source
# @see http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList Source
class Quake2Md2 < Kaitai::Struct::Struct

  GL_PRIMITIVE = {
    0 => :gl_primitive_triangle_strip,
    1 => :gl_primitive_triangle_fan,
  }
  I__GL_PRIMITIVE = GL_PRIMITIVE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([73, 68, 80, 50].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [73, 68, 80, 50].pack('C*')
    @version = @_io.read_u4le
    raise Kaitai::Struct::ValidationNotEqualError.new(8, @version, @_io, "/seq/1") if not @version == 8
    @skin_width_px = @_io.read_u4le
    @skin_height_px = @_io.read_u4le
    @bytes_per_frame = @_io.read_u4le
    @num_skins = @_io.read_u4le
    @vertices_per_frame = @_io.read_u4le
    @num_tex_coords = @_io.read_u4le
    @num_triangles = @_io.read_u4le
    @num_gl_cmds = @_io.read_u4le
    @num_frames = @_io.read_u4le
    @ofs_skins = @_io.read_u4le
    @ofs_tex_coords = @_io.read_u4le
    @ofs_triangles = @_io.read_u4le
    @ofs_frames = @_io.read_u4le
    @ofs_gl_cmds = @_io.read_u4le
    @ofs_eof = @_io.read_u4le
    self
  end
  class CompressedVec < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x_compressed = @_io.read_u1
      @y_compressed = @_io.read_u1
      @z_compressed = @_io.read_u1
      self
    end
    def x
      return @x unless @x.nil?
      @x = x_compressed * _parent._parent.scale.x + _parent._parent.translate.x
      @x
    end
    def y
      return @y unless @y.nil?
      @y = y_compressed * _parent._parent.scale.y + _parent._parent.translate.y
      @y
    end
    def z
      return @z unless @z.nil?
      @z = z_compressed * _parent._parent.scale.z + _parent._parent.translate.z
      @z
    end
    attr_reader :x_compressed
    attr_reader :y_compressed
    attr_reader :z_compressed
  end
  class Frame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @scale = Vec3f.new(@_io, self, @_root)
      @translate = Vec3f.new(@_io, self, @_root)
      @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(16), 0, false)).force_encoding("ASCII").encode('UTF-8')
      @vertices = []
      (_root.vertices_per_frame).times { |i|
        @vertices << Vertex.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :scale
    attr_reader :translate
    attr_reader :name
    attr_reader :vertices
  end
  class GlCmd < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cmd_num_vertices = @_io.read_s4le
      @vertices = []
      (num_vertices).times { |i|
        @vertices << GlVertex.new(@_io, self, @_root)
      }
      self
    end
    def num_vertices
      return @num_vertices unless @num_vertices.nil?
      @num_vertices = (cmd_num_vertices < 0 ? -(cmd_num_vertices) : cmd_num_vertices)
      @num_vertices
    end
    def primitive
      return @primitive unless @primitive.nil?
      @primitive = (cmd_num_vertices < 0 ? :gl_primitive_triangle_fan : :gl_primitive_triangle_strip)
      @primitive
    end
    attr_reader :cmd_num_vertices
    attr_reader :vertices
  end
  class GlCmdsList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if !(_io.eof?)
        @items = []
        i = 0
        begin
          _ = GlCmd.new(@_io, self, @_root)
          @items << _
          i += 1
        end until _.cmd_num_vertices == 0
      end
      self
    end
    attr_reader :items
  end
  class GlVertex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tex_coords_normalized = []
      (2).times { |i|
        @tex_coords_normalized << @_io.read_f4le
      }
      @vertex_index = @_io.read_u4le
      self
    end
    attr_reader :tex_coords_normalized

    ##
    # index to `_root.frames[i].vertices` (for each frame with index `i`)
    attr_reader :vertex_index
  end
  class TexPoint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @s_px = @_io.read_u2le
      @t_px = @_io.read_u2le
      self
    end
    def s_normalized
      return @s_normalized unless @s_normalized.nil?
      @s_normalized = (s_px + 0.0) / _root.skin_width_px
      @s_normalized
    end
    def t_normalized
      return @t_normalized unless @t_normalized.nil?
      @t_normalized = (t_px + 0.0) / _root.skin_height_px
      @t_normalized
    end
    attr_reader :s_px
    attr_reader :t_px
  end
  class Triangle < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @vertex_indices = []
      (3).times { |i|
        @vertex_indices << @_io.read_u2le
      }
      @tex_point_indices = []
      (3).times { |i|
        @tex_point_indices << @_io.read_u2le
      }
      self
    end

    ##
    # indices to `_root.frames[i].vertices` (for each frame with index `i`)
    attr_reader :vertex_indices

    ##
    # indices to `_root.tex_coords`
    attr_reader :tex_point_indices
  end
  class Vec3f < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  class Vertex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @position = CompressedVec.new(@_io, self, @_root)
      @normal_index = @_io.read_u1
      self
    end
    def normal
      return @normal unless @normal.nil?
      @normal = _root.anorms_table[normal_index]
      @normal
    end
    attr_reader :position
    attr_reader :normal_index
  end
  def anim_names
    return @anim_names unless @anim_names.nil?
    @anim_names = ["stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"]
    @anim_names
  end
  def anim_num_frames
    return @anim_num_frames unless @anim_num_frames.nil?
    @anim_num_frames = [40, 6, 8, 4, 4, 4, 6, 12, 11, 17, 11, 12, 19, 6, 9, 4, 5, 6, 6, 8].pack('C*')
    @anim_num_frames
  end
  def anim_start_indices
    return @anim_start_indices unless @anim_start_indices.nil?
    @anim_start_indices = [0, 40, 46, 54, 58, 62, 66, 72, 84, 95, 112, 123, 135, 154, 160, 169, 173, 178, 184, 190].pack('C*')
    @anim_start_indices
  end

  ##
  # @see https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
  #   from Quake anorms.h
  def anorms_table
    return @anorms_table unless @anorms_table.nil?
    @anorms_table = [[-0.525731, 0.000000, 0.850651], [-0.442863, 0.238856, 0.864188], [-0.295242, 0.000000, 0.955423], [-0.309017, 0.500000, 0.809017], [-0.162460, 0.262866, 0.951056], [0.000000, 0.000000, 1.000000], [0.000000, 0.850651, 0.525731], [-0.147621, 0.716567, 0.681718], [0.147621, 0.716567, 0.681718], [0.000000, 0.525731, 0.850651], [0.309017, 0.500000, 0.809017], [0.525731, 0.000000, 0.850651], [0.295242, 0.000000, 0.955423], [0.442863, 0.238856, 0.864188], [0.162460, 0.262866, 0.951056], [-0.681718, 0.147621, 0.716567], [-0.809017, 0.309017, 0.500000], [-0.587785, 0.425325, 0.688191], [-0.850651, 0.525731, 0.000000], [-0.864188, 0.442863, 0.238856], [-0.716567, 0.681718, 0.147621], [-0.688191, 0.587785, 0.425325], [-0.500000, 0.809017, 0.309017], [-0.238856, 0.864188, 0.442863], [-0.425325, 0.688191, 0.587785], [-0.716567, 0.681718, -0.147621], [-0.500000, 0.809017, -0.309017], [-0.525731, 0.850651, 0.000000], [0.000000, 0.850651, -0.525731], [-0.238856, 0.864188, -0.442863], [0.000000, 0.955423, -0.295242], [-0.262866, 0.951056, -0.162460], [0.000000, 1.000000, 0.000000], [0.000000, 0.955423, 0.295242], [-0.262866, 0.951056, 0.162460], [0.238856, 0.864188, 0.442863], [0.262866, 0.951056, 0.162460], [0.500000, 0.809017, 0.309017], [0.238856, 0.864188, -0.442863], [0.262866, 0.951056, -0.162460], [0.500000, 0.809017, -0.309017], [0.850651, 0.525731, 0.000000], [0.716567, 0.681718, 0.147621], [0.716567, 0.681718, -0.147621], [0.525731, 0.850651, 0.000000], [0.425325, 0.688191, 0.587785], [0.864188, 0.442863, 0.238856], [0.688191, 0.587785, 0.425325], [0.809017, 0.309017, 0.500000], [0.681718, 0.147621, 0.716567], [0.587785, 0.425325, 0.688191], [0.955423, 0.295242, 0.000000], [1.000000, 0.000000, 0.000000], [0.951056, 0.162460, 0.262866], [0.850651, -0.525731, 0.000000], [0.955423, -0.295242, 0.000000], [0.864188, -0.442863, 0.238856], [0.951056, -0.162460, 0.262866], [0.809017, -0.309017, 0.500000], [0.681718, -0.147621, 0.716567], [0.850651, 0.000000, 0.525731], [0.864188, 0.442863, -0.238856], [0.809017, 0.309017, -0.500000], [0.951056, 0.162460, -0.262866], [0.525731, 0.000000, -0.850651], [0.681718, 0.147621, -0.716567], [0.681718, -0.147621, -0.716567], [0.850651, 0.000000, -0.525731], [0.809017, -0.309017, -0.500000], [0.864188, -0.442863, -0.238856], [0.951056, -0.162460, -0.262866], [0.147621, 0.716567, -0.681718], [0.309017, 0.500000, -0.809017], [0.425325, 0.688191, -0.587785], [0.442863, 0.238856, -0.864188], [0.587785, 0.425325, -0.688191], [0.688191, 0.587785, -0.425325], [-0.147621, 0.716567, -0.681718], [-0.309017, 0.500000, -0.809017], [0.000000, 0.525731, -0.850651], [-0.525731, 0.000000, -0.850651], [-0.442863, 0.238856, -0.864188], [-0.295242, 0.000000, -0.955423], [-0.162460, 0.262866, -0.951056], [0.000000, 0.000000, -1.000000], [0.295242, 0.000000, -0.955423], [0.162460, 0.262866, -0.951056], [-0.442863, -0.238856, -0.864188], [-0.309017, -0.500000, -0.809017], [-0.162460, -0.262866, -0.951056], [0.000000, -0.850651, -0.525731], [-0.147621, -0.716567, -0.681718], [0.147621, -0.716567, -0.681718], [0.000000, -0.525731, -0.850651], [0.309017, -0.500000, -0.809017], [0.442863, -0.238856, -0.864188], [0.162460, -0.262866, -0.951056], [0.238856, -0.864188, -0.442863], [0.500000, -0.809017, -0.309017], [0.425325, -0.688191, -0.587785], [0.716567, -0.681718, -0.147621], [0.688191, -0.587785, -0.425325], [0.587785, -0.425325, -0.688191], [0.000000, -0.955423, -0.295242], [0.000000, -1.000000, 0.000000], [0.262866, -0.951056, -0.162460], [0.000000, -0.850651, 0.525731], [0.000000, -0.955423, 0.295242], [0.238856, -0.864188, 0.442863], [0.262866, -0.951056, 0.162460], [0.500000, -0.809017, 0.309017], [0.716567, -0.681718, 0.147621], [0.525731, -0.850651, 0.000000], [-0.238856, -0.864188, -0.442863], [-0.500000, -0.809017, -0.309017], [-0.262866, -0.951056, -0.162460], [-0.850651, -0.525731, 0.000000], [-0.716567, -0.681718, -0.147621], [-0.716567, -0.681718, 0.147621], [-0.525731, -0.850651, 0.000000], [-0.500000, -0.809017, 0.309017], [-0.238856, -0.864188, 0.442863], [-0.262866, -0.951056, 0.162460], [-0.864188, -0.442863, 0.238856], [-0.809017, -0.309017, 0.500000], [-0.688191, -0.587785, 0.425325], [-0.681718, -0.147621, 0.716567], [-0.442863, -0.238856, 0.864188], [-0.587785, -0.425325, 0.688191], [-0.309017, -0.500000, 0.809017], [-0.147621, -0.716567, 0.681718], [-0.425325, -0.688191, 0.587785], [-0.162460, -0.262866, 0.951056], [0.442863, -0.238856, 0.864188], [0.162460, -0.262866, 0.951056], [0.309017, -0.500000, 0.809017], [0.147621, -0.716567, 0.681718], [0.000000, -0.525731, 0.850651], [0.425325, -0.688191, 0.587785], [0.587785, -0.425325, 0.688191], [0.688191, -0.587785, 0.425325], [-0.955423, 0.295242, 0.000000], [-0.951056, 0.162460, 0.262866], [-1.000000, 0.000000, 0.000000], [-0.850651, 0.000000, 0.525731], [-0.955423, -0.295242, 0.000000], [-0.951056, -0.162460, 0.262866], [-0.864188, 0.442863, -0.238856], [-0.951056, 0.162460, -0.262866], [-0.809017, 0.309017, -0.500000], [-0.864188, -0.442863, -0.238856], [-0.951056, -0.162460, -0.262866], [-0.809017, -0.309017, -0.500000], [-0.681718, 0.147621, -0.716567], [-0.681718, -0.147621, -0.716567], [-0.850651, 0.000000, -0.525731], [-0.688191, 0.587785, -0.425325], [-0.587785, 0.425325, -0.688191], [-0.425325, 0.688191, -0.587785], [-0.425325, -0.688191, -0.587785], [-0.587785, -0.425325, -0.688191], [-0.688191, -0.587785, -0.425325]]
    @anorms_table
  end
  def frames
    return @frames unless @frames.nil?
    _pos = @_io.pos
    @_io.seek(ofs_frames)
    @_raw_frames = []
    @frames = []
    (num_frames).times { |i|
      _io_frames = @_io.substream(bytes_per_frame)
      @frames << Frame.new(_io_frames, self, @_root)
    }
    @_io.seek(_pos)
    @frames
  end
  def gl_cmds
    return @gl_cmds unless @gl_cmds.nil?
    _pos = @_io.pos
    @_io.seek(ofs_gl_cmds)
    _io_gl_cmds = @_io.substream(4 * num_gl_cmds)
    @gl_cmds = GlCmdsList.new(_io_gl_cmds, self, @_root)
    @_io.seek(_pos)
    @gl_cmds
  end
  def skins
    return @skins unless @skins.nil?
    _pos = @_io.pos
    @_io.seek(ofs_skins)
    @skins = []
    (num_skins).times { |i|
      @skins << (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(64), 0, false)).force_encoding("ASCII").encode('UTF-8')
    }
    @_io.seek(_pos)
    @skins
  end
  def tex_coords
    return @tex_coords unless @tex_coords.nil?
    _pos = @_io.pos
    @_io.seek(ofs_tex_coords)
    @tex_coords = []
    (num_tex_coords).times { |i|
      @tex_coords << TexPoint.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @tex_coords
  end
  def triangles
    return @triangles unless @triangles.nil?
    _pos = @_io.pos
    @_io.seek(ofs_triangles)
    @triangles = []
    (num_triangles).times { |i|
      @triangles << Triangle.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @triangles
  end
  attr_reader :magic
  attr_reader :version
  attr_reader :skin_width_px
  attr_reader :skin_height_px
  attr_reader :bytes_per_frame
  attr_reader :num_skins
  attr_reader :vertices_per_frame
  attr_reader :num_tex_coords
  attr_reader :num_triangles
  attr_reader :num_gl_cmds
  attr_reader :num_frames
  attr_reader :ofs_skins
  attr_reader :ofs_tex_coords
  attr_reader :ofs_triangles
  attr_reader :ofs_frames
  attr_reader :ofs_gl_cmds
  attr_reader :ofs_eof
  attr_reader :_raw_frames
  attr_reader :_raw_gl_cmds
end
