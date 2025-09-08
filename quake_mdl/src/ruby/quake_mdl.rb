# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Quake 1 model format is used to store 3D models completely with
# textures and animations used in the game. Quake 1 engine
# (retroactively named "idtech2") is a popular 3D engine first used
# for Quake game by id Software in 1996.
# 
# Model is constructed traditionally from vertices in 3D space, faces
# which connect vertices, textures ("skins", i.e. 2D bitmaps) and
# texture UV mapping information. As opposed to more modern,
# bones-based animation formats, Quake model was animated by changing
# locations of all vertices it included in 3D space, frame by frame.
# 
# File format stores:
# 
# * "Skins" — effectively 2D bitmaps which will be used as a
#   texture. Every model can have multiple skins — e.g. these can be
#   switched to depict various levels of damage to the
#   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
#   palette, subject to lighting and gamma adjustment when rendering
#   in the game using colormap technique.
# * "Texture coordinates" — UV coordinates, mapping 3D vertices to
#   skin coordinates.
# * "Triangles" — triangular faces connecting 3D vertices.
# * "Frames" — locations of vertices in 3D space; can include more
#   than one frame, thus allowing representation of different frames
#   for animation purposes.
# 
# Originally, 3D geometry for models for Quake was designed in [Alias
# PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
# precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
# 3D-related part of Quake model format followed closely Alias TRI
# format, and Quake development utilities included a converter from Alias
# TRI (`modelgen`).
# 
# Skins (textures) where prepared as LBM bitmaps with the help from
# `texmap` utility in the same development utilities toolkit.
class QuakeMdl < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = MdlHeader.new(@_io, self, @_root)
    @skins = []
    (header.num_skins).times { |i|
      @skins << MdlSkin.new(@_io, self, @_root)
    }
    @texture_coordinates = []
    (header.num_verts).times { |i|
      @texture_coordinates << MdlTexcoord.new(@_io, self, @_root)
    }
    @triangles = []
    (header.num_tris).times { |i|
      @triangles << MdlTriangle.new(@_io, self, @_root)
    }
    @frames = []
    (header.num_frames).times { |i|
      @frames << MdlFrame.new(@_io, self, @_root)
    }
    self
  end
  class MdlFrame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = @_io.read_s4le
      if type != 0
        @min = MdlVertex.new(@_io, self, @_root)
      end
      if type != 0
        @max = MdlVertex.new(@_io, self, @_root)
      end
      if type != 0
        @time = []
        (type).times { |i|
          @time << @_io.read_f4le
        }
      end
      @frames = []
      (num_simple_frames).times { |i|
        @frames << MdlSimpleFrame.new(@_io, self, @_root)
      }
      self
    end
    def num_simple_frames
      return @num_simple_frames unless @num_simple_frames.nil?
      @num_simple_frames = (type == 0 ? 1 : type)
      @num_simple_frames
    end
    attr_reader :type
    attr_reader :min
    attr_reader :max
    attr_reader :time
    attr_reader :frames
  end

  ##
  # @see https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75 Source
  # @see https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0 Source
  class MdlHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ident = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([73, 68, 80, 79].pack('C*'), @ident, @_io, "/types/mdl_header/seq/0") if not @ident == [73, 68, 80, 79].pack('C*')
      @version = @_io.read_s4le
      raise Kaitai::Struct::ValidationNotEqualError.new(6, @version, @_io, "/types/mdl_header/seq/1") if not @version == 6
      @scale = Vec3.new(@_io, self, @_root)
      @origin = Vec3.new(@_io, self, @_root)
      @radius = @_io.read_f4le
      @eye_position = Vec3.new(@_io, self, @_root)
      @num_skins = @_io.read_s4le
      @skin_width = @_io.read_s4le
      @skin_height = @_io.read_s4le
      @num_verts = @_io.read_s4le
      @num_tris = @_io.read_s4le
      @num_frames = @_io.read_s4le
      @synctype = @_io.read_s4le
      @flags = @_io.read_s4le
      @size = @_io.read_f4le
      self
    end

    ##
    # Skin size in pixels.
    def skin_size
      return @skin_size unless @skin_size.nil?
      @skin_size = skin_width * skin_height
      @skin_size
    end

    ##
    # Magic signature bytes that every Quake model must
    # have. "IDPO" is short for "IDPOLYHEADER".
    # @see https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133 Source
    attr_reader :ident
    attr_reader :version

    ##
    # Global scaling factors in 3 dimensions for whole model. When
    # represented in 3D world, this model local coordinates will
    # be multiplied by these factors.
    attr_reader :scale
    attr_reader :origin
    attr_reader :radius
    attr_reader :eye_position

    ##
    # Number of skins (=texture bitmaps) included in this model.
    attr_reader :num_skins

    ##
    # Width (U coordinate max) of every skin (=texture) in pixels.
    attr_reader :skin_width

    ##
    # Height (V coordinate max) of every skin (=texture) in
    # pixels.
    attr_reader :skin_height

    ##
    # Number of vertices in this model. Note that this is constant
    # for all the animation frames and all textures.
    attr_reader :num_verts

    ##
    # Number of triangles (=triangular faces) in this model.
    attr_reader :num_tris

    ##
    # Number of animation frames included in this model.
    attr_reader :num_frames
    attr_reader :synctype
    attr_reader :flags
    attr_reader :size
  end
  class MdlSimpleFrame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bbox_min = MdlVertex.new(@_io, self, @_root)
      @bbox_max = MdlVertex.new(@_io, self, @_root)
      @name = (Kaitai::Struct::Stream::bytes_terminate(Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0), 0, false)).force_encoding("ASCII").encode('UTF-8')
      @vertices = []
      (_root.header.num_verts).times { |i|
        @vertices << MdlVertex.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :bbox_min
    attr_reader :bbox_max
    attr_reader :name
    attr_reader :vertices
  end
  class MdlSkin < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @group = @_io.read_s4le
      if group == 0
        @single_texture_data = @_io.read_bytes(_root.header.skin_size)
      end
      if group != 0
        @num_frames = @_io.read_u4le
      end
      if group != 0
        @frame_times = []
        (num_frames).times { |i|
          @frame_times << @_io.read_f4le
        }
      end
      if group != 0
        @group_texture_data = []
        (num_frames).times { |i|
          @group_texture_data << @_io.read_bytes(_root.header.skin_size)
        }
      end
      self
    end
    attr_reader :group
    attr_reader :single_texture_data
    attr_reader :num_frames
    attr_reader :frame_times
    attr_reader :group_texture_data
  end

  ##
  # @see https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83 Source
  # @see https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2 Source
  class MdlTexcoord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @on_seam = @_io.read_s4le
      @s = @_io.read_s4le
      @t = @_io.read_s4le
      self
    end
    attr_reader :on_seam
    attr_reader :s
    attr_reader :t
  end

  ##
  # Represents a triangular face, connecting 3 vertices, referenced
  # by their indexes.
  # @see https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88 Source
  # @see https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3 Source
  class MdlTriangle < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @faces_front = @_io.read_s4le
      @vertices = []
      (3).times { |i|
        @vertices << @_io.read_s4le
      }
      self
    end
    attr_reader :faces_front
    attr_reader :vertices
  end
  class MdlVertex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @values = []
      (3).times { |i|
        @values << @_io.read_u1
      }
      @normal_index = @_io.read_u1
      self
    end
    attr_reader :values
    attr_reader :normal_index
  end

  ##
  # Basic 3D vector (x, y, z) using single-precision floating point
  # coordnates. Can be used to specify a point in 3D space,
  # direction, scaling factor, etc.
  class Vec3 < Kaitai::Struct::Struct
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
  attr_reader :header
  attr_reader :skins
  attr_reader :texture_coordinates
  attr_reader :triangles
  attr_reader :frames
end
