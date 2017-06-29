# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class ShapefileMain < Kaitai::Struct::Struct

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

  PART_TYPE = {
    0 => :part_type_triangle_strip,
    1 => :part_type_triangle_fan,
    2 => :part_type_outer_ring,
    3 => :part_type_inner_ring,
    4 => :part_type_first_ring,
    5 => :part_type_ring,
  }
  I__PART_TYPE = PART_TYPE.invert
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
    self
  end
  class MultiPointM < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_points = @_io.read_s4le
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_points
    attr_reader :points
    attr_reader :m_range
    attr_reader :m_values
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
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :m
  end
  class Point < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_f8le
      @y = @_io.read_f8le
      self
    end
    attr_reader :x
    attr_reader :y
  end
  class Polygon < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :points
  end
  class BoundsMinMax < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @min = @_io.read_f8le
      @max = @_io.read_f8le
      self
    end
    attr_reader :min
    attr_reader :max
  end
  class PolyLine < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :points
  end
  class MultiPointZ < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_points = @_io.read_s4le
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @z_range = BoundsMinMax.new(@_io, self, @_root)
      @z_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @z_values[i] = @_io.read_f8le
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_points
    attr_reader :points
    attr_reader :z_range
    attr_reader :z_values
    attr_reader :m_range
    attr_reader :m_values
  end
  class PolyLineZ < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @z_range = BoundsMinMax.new(@_io, self, @_root)
      @z_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @z_values[i] = @_io.read_f8le
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :points
    attr_reader :z_range
    attr_reader :z_values
    attr_reader :m_range
    attr_reader :m_values
  end
  class PolygonZ < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @z_range = BoundsMinMax.new(@_io, self, @_root)
      @z_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @z_values[i] = @_io.read_f8le
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :points
    attr_reader :z_range
    attr_reader :z_values
    attr_reader :m_range
    attr_reader :m_values
  end
  class BoundingBoxXY < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = BoundsMinMax.new(@_io, self, @_root)
      @y = BoundsMinMax.new(@_io, self, @_root)
      self
    end
    attr_reader :x
    attr_reader :y
  end
  class PointM < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_f8le
      @y = @_io.read_f8le
      @m = @_io.read_f8le
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :m
  end
  class PolygonM < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :points
    attr_reader :m_range
    attr_reader :m_values
  end
  class RecordHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @record_number = @_io.read_s4be
      @content_length = @_io.read_s4be
      self
    end
    attr_reader :record_number
    attr_reader :content_length
  end
  class MultiPoint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_points = @_io.read_s4le
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_points
    attr_reader :points
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
      self
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
  class PointZ < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_f8le
      @y = @_io.read_f8le
      @z = @_io.read_f8le
      @m = @_io.read_f8le
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :m
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = RecordHeader.new(@_io, self, @_root)
      @contents = RecordContents.new(@_io, self, @_root)
      self
    end
    attr_reader :header

    ##
    # the size of this contents section in bytes must equal header.content_length * 2
    attr_reader :contents
  end
  class RecordContents < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @shape_type = Kaitai::Struct::Stream::resolve_enum(SHAPE_TYPE, @_io.read_s4le)
      if shape_type != :shape_type_null_shape
        case shape_type
        when :shape_type_point_m
          @shape_parameters = PointM.new(@_io, self, @_root)
        when :shape_type_polygon_z
          @shape_parameters = PolygonZ.new(@_io, self, @_root)
        when :shape_type_multi_point_m
          @shape_parameters = MultiPointM.new(@_io, self, @_root)
        when :shape_type_poly_line_z
          @shape_parameters = PolyLineZ.new(@_io, self, @_root)
        when :shape_type_multi_point_z
          @shape_parameters = MultiPointZ.new(@_io, self, @_root)
        when :shape_type_multi_point
          @shape_parameters = MultiPoint.new(@_io, self, @_root)
        when :shape_type_polygon_m
          @shape_parameters = PolygonM.new(@_io, self, @_root)
        when :shape_type_polygon
          @shape_parameters = Polygon.new(@_io, self, @_root)
        when :shape_type_point
          @shape_parameters = Point.new(@_io, self, @_root)
        when :shape_type_poly_line_m
          @shape_parameters = PolyLineM.new(@_io, self, @_root)
        when :shape_type_poly_line
          @shape_parameters = PolyLine.new(@_io, self, @_root)
        when :shape_type_point_z
          @shape_parameters = PointZ.new(@_io, self, @_root)
        when :shape_type_multi_patch
          @shape_parameters = MultiPatch.new(@_io, self, @_root)
        end
      end
      self
    end
    attr_reader :shape_type
    attr_reader :shape_parameters
  end
  class MultiPatch < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @part_types = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @part_types[i] = Kaitai::Struct::Stream::resolve_enum(PART_TYPE, @_io.read_s4le)
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @z_range = BoundsMinMax.new(@_io, self, @_root)
      @z_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @z_values[i] = @_io.read_f8le
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :part_types
    attr_reader :points
    attr_reader :z_range
    attr_reader :z_values
    attr_reader :m_range
    attr_reader :m_values
  end
  class PolyLineM < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bounding_box = BoundingBoxXY.new(@_io, self, @_root)
      @number_of_parts = @_io.read_s4le
      @number_of_points = @_io.read_s4le
      @parts = Array.new(number_of_parts)
      (number_of_parts).times { |i|
        @parts[i] = @_io.read_s4le
      }
      @points = Array.new(number_of_points)
      (number_of_points).times { |i|
        @points[i] = Point.new(@_io, self, @_root)
      }
      @m_range = BoundsMinMax.new(@_io, self, @_root)
      @m_values = Array.new(number_of_points)
      (number_of_points).times { |i|
        @m_values[i] = @_io.read_f8le
      }
      self
    end
    attr_reader :bounding_box
    attr_reader :number_of_parts
    attr_reader :number_of_points
    attr_reader :parts
    attr_reader :points
    attr_reader :m_range
    attr_reader :m_values
  end
  attr_reader :header

  ##
  # the size of this section of the file in bytes must equal (header.file_length * 2) - 100
  attr_reader :records
end
