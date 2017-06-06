# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class ShapefileIndex < Kaitai::Struct::Struct

  SHAPE_TYPE = {
    0 => :shape_type_null_shape,
    1 => :shape_type_point,
    3 => :shape_type_poly_line,
    5 => :shape_type_polygon,
    8 => :shape_type_multi_point,
    11 => :shape_type_point_z,
    13 => :shape_type_poly_line_z,
    15 => :shape_type_polygon_z,
    18 => :shape_type_multi_point_z,
    21 => :shape_type_point_m,
    23 => :shape_type_poly_line_m,
    25 => :shape_type_polygon_m,
    28 => :shape_type_multi_point_m,
    31 => :shape_type_multi_patch,
  }
  I__SHAPE_TYPE = SHAPE_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @header = FileHeader.new(@_io, self, @_root)
    @records = []
    while not @_io.eof?
      @records << Record.new(@_io, self, @_root)
    end
  end
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @file_code = @_io.ensure_fixed_contents([0, 0, 39, 10].pack('C*'))
      @unused_field_1 = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
      @unused_field_2 = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
      @unused_field_3 = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
      @unused_field_4 = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
      @unused_field_5 = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
      @file_length = @_io.read_s4be
      @version = @_io.ensure_fixed_contents([232, 3, 0, 0].pack('C*'))
      @shape_type = Kaitai::Struct::Stream::resolve_enum(SHAPE_TYPE, @_io.read_s4le)
      @bounding_box = BoundingBoxXYZM.new(@_io, self, @_root)
    end

    ##
    # corresponds to s4be value of 9994
    attr_reader :file_code
    attr_reader :unused_field_1
    attr_reader :unused_field_2
    attr_reader :unused_field_3
    attr_reader :unused_field_4
    attr_reader :unused_field_5
    attr_reader :file_length

    ##
    # corresponds to s4le value of 1000
    attr_reader :version
    attr_reader :shape_type
    attr_reader :bounding_box
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @offset = @_io.read_s4be
      @content_length = @_io.read_s4be
    end
    attr_reader :offset
    attr_reader :content_length
  end
  class BoundingBoxXYZM < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @x = BoundsMinMax.new(@_io, self, @_root)
      @y = BoundsMinMax.new(@_io, self, @_root)
      @z = BoundsMinMax.new(@_io, self, @_root)
      @m = BoundsMinMax.new(@_io, self, @_root)
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :m
  end
  class BoundsMinMax < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @min = @_io.read_f8be
      @max = @_io.read_f8be
    end
    attr_reader :min
    attr_reader :max
  end
  attr_reader :header

  ##
  # the size of this section of the file in bytes must equal (header.file_length * 2) - 100
  attr_reader :records
end
