# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Jpeg < Kaitai::Struct::Struct

  COMPONENT_ID = {
    1 => :component_id_y,
    2 => :component_id_cb,
    3 => :component_id_cr,
    4 => :component_id_i,
    5 => :component_id_q,
  }
  I__COMPONENT_ID = COMPONENT_ID.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @segments = []
    while not @_io.eof?
      @segments << Segment.new(@_io, self, @_root)
    end
    self
  end
  class Segment < Kaitai::Struct::Struct

    MARKER_ENUM = {
      1 => :marker_enum_tem,
      192 => :marker_enum_sof0,
      193 => :marker_enum_sof1,
      194 => :marker_enum_sof2,
      195 => :marker_enum_sof3,
      196 => :marker_enum_dht,
      197 => :marker_enum_sof5,
      198 => :marker_enum_sof6,
      199 => :marker_enum_sof7,
      216 => :marker_enum_soi,
      217 => :marker_enum_eoi,
      218 => :marker_enum_sos,
      219 => :marker_enum_dqt,
      220 => :marker_enum_dnl,
      221 => :marker_enum_dri,
      222 => :marker_enum_dhp,
      224 => :marker_enum_app0,
      225 => :marker_enum_app1,
      226 => :marker_enum_app2,
      227 => :marker_enum_app3,
      228 => :marker_enum_app4,
      229 => :marker_enum_app5,
      230 => :marker_enum_app6,
      231 => :marker_enum_app7,
      232 => :marker_enum_app8,
      233 => :marker_enum_app9,
      234 => :marker_enum_app10,
      235 => :marker_enum_app11,
      236 => :marker_enum_app12,
      237 => :marker_enum_app13,
      238 => :marker_enum_app14,
      239 => :marker_enum_app15,
      254 => :marker_enum_com,
    }
    I__MARKER_ENUM = MARKER_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([255].pack('C*'))
      @marker = Kaitai::Struct::Stream::resolve_enum(MARKER_ENUM, @_io.read_u1)
      if  ((marker != :marker_enum_soi) && (marker != :marker_enum_eoi)) 
        @length = @_io.read_u2be
      end
      if  ((marker != :marker_enum_soi) && (marker != :marker_enum_eoi)) 
        case marker
        when :marker_enum_sos
          @_raw_data = @_io.read_bytes((length - 2))
          io = Kaitai::Struct::Stream.new(@_raw_data)
          @data = SegmentSos.new(io, self, @_root)
        when :marker_enum_app1
          @_raw_data = @_io.read_bytes((length - 2))
          io = Kaitai::Struct::Stream.new(@_raw_data)
          @data = SegmentApp1.new(io, self, @_root)
        when :marker_enum_sof0
          @_raw_data = @_io.read_bytes((length - 2))
          io = Kaitai::Struct::Stream.new(@_raw_data)
          @data = SegmentSof0.new(io, self, @_root)
        when :marker_enum_app0
          @_raw_data = @_io.read_bytes((length - 2))
          io = Kaitai::Struct::Stream.new(@_raw_data)
          @data = SegmentApp0.new(io, self, @_root)
        else
          @data = @_io.read_bytes((length - 2))
        end
      end
      if marker == :marker_enum_sos
        @image_data = @_io.read_bytes_full
      end
      self
    end
    attr_reader :magic
    attr_reader :marker
    attr_reader :length
    attr_reader :data
    attr_reader :image_data
    attr_reader :_raw_data
  end
  class SegmentSos < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_components = @_io.read_u1
      @components = Array.new(num_components)
      (num_components).times { |i|
        @components[i] = Component.new(@_io, self, @_root)
      }
      @start_spectral_selection = @_io.read_u1
      @end_spectral = @_io.read_u1
      @appr_bit_pos = @_io.read_u1
      self
    end
    class Component < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @id = Kaitai::Struct::Stream::resolve_enum(COMPONENT_ID, @_io.read_u1)
        @huffman_table = @_io.read_u1
        self
      end

      ##
      # Scan component selector
      attr_reader :id
      attr_reader :huffman_table
    end

    ##
    # Number of components in scan
    attr_reader :num_components

    ##
    # Scan components specification
    attr_reader :components

    ##
    # Start of spectral selection or predictor selection
    attr_reader :start_spectral_selection

    ##
    # End of spectral selection
    attr_reader :end_spectral

    ##
    # Successive approximation bit position high + Successive approximation bit position low or point transform
    attr_reader :appr_bit_pos
  end
  class SegmentApp1 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      case magic
      when "Exif"
        @body = ExifInJpeg.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :magic
    attr_reader :body
  end
  class SegmentSof0 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bits_per_sample = @_io.read_u1
      @image_height = @_io.read_u2be
      @image_width = @_io.read_u2be
      @num_components = @_io.read_u1
      @components = Array.new(num_components)
      (num_components).times { |i|
        @components[i] = Component.new(@_io, self, @_root)
      }
      self
    end
    class Component < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @id = Kaitai::Struct::Stream::resolve_enum(COMPONENT_ID, @_io.read_u1)
        @sampling_factors = @_io.read_u1
        @quantization_table_id = @_io.read_u1
        self
      end
      def sampling_x
        return @sampling_x unless @sampling_x.nil?
        @sampling_x = ((sampling_factors & 240) >> 4)
        @sampling_x
      end
      def sampling_y
        return @sampling_y unless @sampling_y.nil?
        @sampling_y = (sampling_factors & 15)
        @sampling_y
      end

      ##
      # Component selector
      attr_reader :id
      attr_reader :sampling_factors
      attr_reader :quantization_table_id
    end
    attr_reader :bits_per_sample
    attr_reader :image_height
    attr_reader :image_width
    attr_reader :num_components
    attr_reader :components
  end
  class ExifInJpeg < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @extra_zero = @_io.ensure_fixed_contents([0].pack('C*'))
      @_raw_data = @_io.read_bytes_full
      io = Kaitai::Struct::Stream.new(@_raw_data)
      @data = Exif.new(io)
      self
    end
    attr_reader :extra_zero
    attr_reader :data
    attr_reader :_raw_data
  end
  class SegmentApp0 < Kaitai::Struct::Struct

    DENSITY_UNIT = {
      0 => :density_unit_no_units,
      1 => :density_unit_pixels_per_inch,
      2 => :density_unit_pixels_per_cm,
    }
    I__DENSITY_UNIT = DENSITY_UNIT.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = (@_io.read_bytes(5)).force_encoding("ASCII")
      @version_major = @_io.read_u1
      @version_minor = @_io.read_u1
      @density_units = Kaitai::Struct::Stream::resolve_enum(DENSITY_UNIT, @_io.read_u1)
      @density_x = @_io.read_u2be
      @density_y = @_io.read_u2be
      @thumbnail_x = @_io.read_u1
      @thumbnail_y = @_io.read_u1
      @thumbnail = @_io.read_bytes(((thumbnail_x * thumbnail_y) * 3))
      self
    end
    attr_reader :magic
    attr_reader :version_major
    attr_reader :version_minor
    attr_reader :density_units

    ##
    # Horizontal pixel density. Must not be zero.
    attr_reader :density_x

    ##
    # Vertical pixel density. Must not be zero.
    attr_reader :density_y

    ##
    # Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
    attr_reader :thumbnail_x

    ##
    # Vertical pixel count of the following embedded RGB thumbnail. May be zero.
    attr_reader :thumbnail_y

    ##
    # Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
    attr_reader :thumbnail
  end
  attr_reader :segments
end
