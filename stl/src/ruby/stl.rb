# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# STL files are used to represent simple 3D models, defined using
# triangular 3D faces.
# 
# Initially it was introduced as native format for 3D Systems
# Stereolithography CAD system, but due to its extreme simplicity, it
# was adopted by a wide range of 3D modelling, CAD, rapid prototyping
# and 3D printing applications as the simplest 3D model exchange
# format.
# 
# STL is extremely bare-bones format: there are no complex headers, no
# texture / color support, no units specifications, no distinct vertex
# arrays. Whole model is specified as a collection of triangular
# faces.
# 
# There are two versions of the format (text and binary), this spec
# describes binary version.
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
    self
  end

  ##
  # Each STL triangle is defined by its 3 points in 3D space and a
  # normal vector, which is generally used to determine where is
  # "inside" and "outside" of the model.
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
      @abr = @_io.read_u2le
      self
    end
    attr_reader :normal
    attr_reader :vertices

    ##
    # In theory (per standard), it's "attribute byte count" with
    # no other details given on what "attribute" is and what
    # should be stored in this field.
    # 
    # In practice, software dealing with STL either expected to
    # see 0 here, or uses this 16-bit field per se to store
    # additional attributes (such as RGB color of a vertex or
    # color index).
    attr_reader :abr
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
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
  end
  attr_reader :header
  attr_reader :num_triangles
  attr_reader :triangles
end
