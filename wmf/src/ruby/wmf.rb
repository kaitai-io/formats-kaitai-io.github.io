# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# WMF (Windows Metafile) is a relatively early vector image format
# introduced for Microsoft Windows in 1990.
# 
# Inside, it provides a serialized list of Windows GDI (Graphics
# Device Interface) function calls, which, if played back, result in
# an image being drawn on a given surface (display, off-screen buffer,
# printer, etc).
# @see http://www.digitalpreservation.gov/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf Source
class Wmf < Kaitai::Struct::Struct

  FUNC = {
    0 => :func_eof,
    30 => :func_savedc,
    53 => :func_realizepalette,
    55 => :func_setpalentries,
    247 => :func_createpalette,
    258 => :func_setbkmode,
    259 => :func_setmapmode,
    260 => :func_setrop2,
    261 => :func_setrelabs,
    262 => :func_setpolyfillmode,
    263 => :func_setstretchbltmode,
    264 => :func_settextcharextra,
    295 => :func_restoredc,
    298 => :func_invertregion,
    299 => :func_paintregion,
    300 => :func_selectclipregion,
    301 => :func_selectobject,
    302 => :func_settextalign,
    313 => :func_resizepalette,
    322 => :func_dibcreatepatternbrush,
    329 => :func_setlayout,
    496 => :func_deleteobject,
    505 => :func_createpatternbrush,
    513 => :func_setbkcolor,
    521 => :func_settextcolor,
    522 => :func_settextjustification,
    523 => :func_setwindoworg,
    524 => :func_setwindowext,
    525 => :func_setviewportorg,
    526 => :func_setviewportext,
    527 => :func_offsetwindoworg,
    529 => :func_offsetviewportorg,
    531 => :func_lineto,
    532 => :func_moveto,
    544 => :func_offsetcliprgn,
    552 => :func_fillregion,
    561 => :func_setmapperflags,
    564 => :func_selectpalette,
    762 => :func_createpenindirect,
    763 => :func_createfontindirect,
    764 => :func_createbrushindirect,
    804 => :func_polygon,
    805 => :func_polyline,
    1040 => :func_scalewindowext,
    1042 => :func_scaleviewportext,
    1045 => :func_excludecliprect,
    1046 => :func_intersectcliprect,
    1048 => :func_ellipse,
    1049 => :func_floodfill,
    1051 => :func_rectangle,
    1055 => :func_setpixel,
    1065 => :func_frameregion,
    1078 => :func_animatepalette,
    1313 => :func_textout,
    1336 => :func_polypolygon,
    1352 => :func_extfloodfill,
    1564 => :func_roundrect,
    1565 => :func_patblt,
    1574 => :func_escape,
    1791 => :func_createregion,
    2071 => :func_arc,
    2074 => :func_pie,
    2096 => :func_chord,
    2338 => :func_bitblt,
    2368 => :func_dibbitblt,
    2610 => :func_exttextout,
    2851 => :func_stretchblt,
    2881 => :func_dibstretchblt,
    3379 => :func_setdibtodev,
    3907 => :func_stretchdib,
  }
  I__FUNC = FUNC.invert

  BIN_RASTER_OP = {
    1 => :bin_raster_op_black,
    2 => :bin_raster_op_notmergepen,
    3 => :bin_raster_op_masknotpen,
    4 => :bin_raster_op_notcopypen,
    5 => :bin_raster_op_maskpennot,
    6 => :bin_raster_op_not,
    7 => :bin_raster_op_xorpen,
    8 => :bin_raster_op_notmaskpen,
    9 => :bin_raster_op_maskpen,
    10 => :bin_raster_op_notxorpen,
    11 => :bin_raster_op_nop,
    12 => :bin_raster_op_mergenotpen,
    13 => :bin_raster_op_copypen,
    14 => :bin_raster_op_mergepennot,
    15 => :bin_raster_op_mergepen,
    16 => :bin_raster_op_white,
  }
  I__BIN_RASTER_OP = BIN_RASTER_OP.invert

  MIX_MODE = {
    1 => :mix_mode_transparent,
    2 => :mix_mode_opaque,
  }
  I__MIX_MODE = MIX_MODE.invert

  POLY_FILL_MODE = {
    1 => :poly_fill_mode_alternate,
    2 => :poly_fill_mode_winding,
  }
  I__POLY_FILL_MODE = POLY_FILL_MODE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @special_header = SpecialHeader.new(@_io, self, @_root)
    @header = Header.new(@_io, self, @_root)
    @records = []
    i = 0
    begin
      _ = Record.new(@_io, self, @_root)
      @records << _
      i += 1
    end until _.function == :func_eof
    self
  end
  class ParamsSetwindoworg < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @y = @_io.read_s2le
      @x = @_io.read_s2le
      self
    end

    ##
    # Y coordinate of the window origin, in logical units.
    attr_reader :y

    ##
    # X coordinate of the window origin, in logical units.
    attr_reader :x
  end
  class ParamsSetbkmode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bk_mode = Kaitai::Struct::Stream::resolve_enum(MIX_MODE, @_io.read_u2le)
      self
    end

    ##
    # Defines current graphic context background mix mode.
    attr_reader :bk_mode
  end
  class PointS < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_s2le
      @y = @_io.read_s2le
      self
    end

    ##
    # X coordinate of the point, in logical units.
    attr_reader :x

    ##
    # Y coordinate of the point, in logical units.
    attr_reader :y
  end
  class ParamsSetwindowext < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @y = @_io.read_s2le
      @x = @_io.read_s2le
      self
    end

    ##
    # Vertical extent of the window in logical units.
    attr_reader :y

    ##
    # Horizontal extent of the window in logical units.
    attr_reader :x
  end
  class ParamsPolygon < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_points = @_io.read_s2le
      @points = Array.new(num_points)
      (num_points).times { |i|
        @points[i] = PointS.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_points
    attr_reader :points
  end
  class Header < Kaitai::Struct::Struct

    METAFILE_TYPE = {
      1 => :metafile_type_memory_metafile,
      2 => :metafile_type_disk_metafile,
    }
    I__METAFILE_TYPE = METAFILE_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @metafile_type = Kaitai::Struct::Stream::resolve_enum(METAFILE_TYPE, @_io.read_u2le)
      @header_size = @_io.read_u2le
      @version = @_io.read_u2le
      @size = @_io.read_u4le
      @number_of_objects = @_io.read_u2le
      @max_record = @_io.read_u4le
      @number_of_members = @_io.read_u2le
      self
    end
    attr_reader :metafile_type
    attr_reader :header_size
    attr_reader :version
    attr_reader :size
    attr_reader :number_of_objects
    attr_reader :max_record
    attr_reader :number_of_members
  end
  class ColorRef < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @red = @_io.read_u1
      @green = @_io.read_u1
      @blue = @_io.read_u1
      @reserved = @_io.read_u1
      self
    end
    attr_reader :red
    attr_reader :green
    attr_reader :blue
    attr_reader :reserved
  end
  class ParamsSetrop2 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @draw_mode = Kaitai::Struct::Stream::resolve_enum(BIN_RASTER_OP, @_io.read_u2le)
      self
    end

    ##
    # Defines current foreground binary raster operation mixing mode.
    attr_reader :draw_mode
  end
  class ParamsSetpolyfillmode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @poly_fill_mode = Kaitai::Struct::Stream::resolve_enum(POLY_FILL_MODE, @_io.read_u2le)
      self
    end

    ##
    # Defines current polygon fill mode.
    attr_reader :poly_fill_mode
  end
  class ParamsPolyline < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_points = @_io.read_s2le
      @points = Array.new(num_points)
      (num_points).times { |i|
        @points[i] = PointS.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :num_points
    attr_reader :points
  end
  class SpecialHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([215, 205, 198, 154].pack('C*'))
      @handle = @_io.ensure_fixed_contents([0, 0].pack('C*'))
      @left = @_io.read_s2le
      @top = @_io.read_s2le
      @right = @_io.read_s2le
      @bottom = @_io.read_s2le
      @inch = @_io.read_u2le
      @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
      @checksum = @_io.read_u2le
      self
    end
    attr_reader :magic
    attr_reader :handle
    attr_reader :left
    attr_reader :top
    attr_reader :right
    attr_reader :bottom
    attr_reader :inch
    attr_reader :reserved
    attr_reader :checksum
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @function = Kaitai::Struct::Stream::resolve_enum(FUNC, @_io.read_u2le)
      case function
      when :func_setbkmode
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsSetbkmode.new(io, self, @_root)
      when :func_setbkcolor
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ColorRef.new(io, self, @_root)
      when :func_setrop2
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsSetrop2.new(io, self, @_root)
      when :func_polyline
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsPolyline.new(io, self, @_root)
      when :func_setwindoworg
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsSetwindoworg.new(io, self, @_root)
      when :func_polygon
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsPolygon.new(io, self, @_root)
      when :func_setwindowext
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsSetwindowext.new(io, self, @_root)
      when :func_setpolyfillmode
        @_raw_params = @_io.read_bytes(((size - 3) * 2))
        io = Kaitai::Struct::Stream.new(@_raw_params)
        @params = ParamsSetpolyfillmode.new(io, self, @_root)
      else
        @params = @_io.read_bytes(((size - 3) * 2))
      end
      self
    end
    attr_reader :size
    attr_reader :function
    attr_reader :params
    attr_reader :_raw_params
  end
  attr_reader :special_header
  attr_reader :header
  attr_reader :records
end
