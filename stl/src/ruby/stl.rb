# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Stl < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @header = @_io.read_bytes(80)
    @num_triangles = @_io.read_u4le
    @triangles = Array.new(num_triangles)
    (num_triangles).times { |i|
      @triangles[i] = Triangle.new(@_io, self, @_root)
    }
  end
  class Triangle < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @normal = Vec3d.new(@_io, self, @_root)
      @vertices = Array.new(3)
      (3).times { |i|
        @vertices[i] = Vec3d.new(@_io, self, @_root)
      }
    end
    attr_reader :normal
    attr_reader :vertices
  end
  class Vec3d < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @x = @_io.read_f4le
      @y = @_io.read_f4le
      @z = @_io.read_f4le
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
  end
  attr_reader :header
  attr_reader :num_triangles
  attr_reader :triangles
end
