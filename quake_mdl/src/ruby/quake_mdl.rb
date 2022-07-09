# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class QuakeMdl < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
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
  class MdlVertex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
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
  class MdlTexcoord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
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
  class MdlHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ident = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([73, 68, 80, 79].pack('C*'), ident, _io, "/types/mdl_header/seq/0") if not ident == [73, 68, 80, 79].pack('C*')
      @version_must_be_6 = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([6, 0, 0, 0].pack('C*'), version_must_be_6, _io, "/types/mdl_header/seq/1") if not version_must_be_6 == [6, 0, 0, 0].pack('C*')
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
    def version
      return @version unless @version.nil?
      @version = 6
      @version
    end
    def skin_size
      return @skin_size unless @skin_size.nil?
      @skin_size = (skin_width * skin_height)
      @skin_size
    end
    attr_reader :ident
    attr_reader :version_must_be_6
    attr_reader :scale
    attr_reader :origin
    attr_reader :radius
    attr_reader :eye_position
    attr_reader :num_skins
    attr_reader :skin_width
    attr_reader :skin_height
    attr_reader :num_verts
    attr_reader :num_tris
    attr_reader :num_frames
    attr_reader :synctype
    attr_reader :flags
    attr_reader :size
  end
  class MdlSkin < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
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
  class MdlFrame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
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
  class MdlSimpleFrame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bbox_min = MdlVertex.new(@_io, self, @_root)
      @bbox_max = MdlVertex.new(@_io, self, @_root)
      @name = (Kaitai::Struct::Stream::bytes_terminate(Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(16), 0), 0, false)).force_encoding("ASCII")
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
  class MdlTriangle < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
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
  class Vec3 < Kaitai::Struct::Struct
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
  attr_reader :header
  attr_reader :skins
  attr_reader :texture_coordinates
  attr_reader :triangles
  attr_reader :frames
end
