# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class DoomWad < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @magic = (@_io.read_bytes(4)).force_encoding("ASCII")
    @num_index_entries = @_io.read_s4le
    @index_offset = @_io.read_s4le
  end
  class Sectors < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << Sector.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
  class Vertex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @x = @_io.read_s2le
      @y = @_io.read_s2le
    end
    attr_reader :x
    attr_reader :y
  end
  class Linedef < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @vertex_start_idx = @_io.read_u2le
      @vertex_end_idx = @_io.read_u2le
      @flags = @_io.read_u2le
      @line_type = @_io.read_u2le
      @sector_tag = @_io.read_u2le
      @sidedef_right_idx = @_io.read_u2le
      @sidedef_left_idx = @_io.read_u2le
    end
    attr_reader :vertex_start_idx
    attr_reader :vertex_end_idx
    attr_reader :flags
    attr_reader :line_type
    attr_reader :sector_tag
    attr_reader :sidedef_right_idx
    attr_reader :sidedef_left_idx
  end
  class Thing < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @x = @_io.read_s2le
      @y = @_io.read_s2le
      @angle = @_io.read_u2le
      @type = @_io.read_u2le
      @flags = @_io.read_u2le
    end
    attr_reader :x
    attr_reader :y
    attr_reader :angle
    attr_reader :type
    attr_reader :flags
  end
  class Sector < Kaitai::Struct::Struct

    SPECIAL_SECTOR = {
      0 => :special_sector_normal,
      1 => :special_sector_d_light_flicker,
      2 => :special_sector_d_light_strobe_fast,
      3 => :special_sector_d_light_strobe_slow,
      4 => :special_sector_d_light_strobe_hurt,
      5 => :special_sector_d_damage_hellslime,
      7 => :special_sector_d_damage_nukage,
      8 => :special_sector_d_light_glow,
      9 => :special_sector_secret,
      10 => :special_sector_d_sector_door_close_in_30,
      11 => :special_sector_d_damage_end,
      12 => :special_sector_d_light_strobe_slow_sync,
      13 => :special_sector_d_light_strobe_fast_sync,
      14 => :special_sector_d_sector_door_raise_in_5_mins,
      15 => :special_sector_d_friction_low,
      16 => :special_sector_d_damage_super_hellslime,
      17 => :special_sector_d_light_fire_flicker,
      18 => :special_sector_d_damage_lava_wimpy,
      19 => :special_sector_d_damage_lava_hefty,
      20 => :special_sector_d_scroll_east_lava_damage,
      21 => :special_sector_light_phased,
      22 => :special_sector_light_sequence_start,
      23 => :special_sector_light_sequence_special1,
      24 => :special_sector_light_sequence_special2,
    }
    I__SPECIAL_SECTOR = SPECIAL_SECTOR.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @floor_z = @_io.read_s2le
      @ceil_z = @_io.read_s2le
      @floor_flat = (@_io.read_bytes(8)).force_encoding("ASCII")
      @ceil_flat = (@_io.read_bytes(8)).force_encoding("ASCII")
      @light = @_io.read_s2le
      @special_type = Kaitai::Struct::Stream::resolve_enum(SPECIAL_SECTOR, @_io.read_u2le)
      @tag = @_io.read_u2le
    end
    attr_reader :floor_z
    attr_reader :ceil_z
    attr_reader :floor_flat
    attr_reader :ceil_flat

    ##
    # Light level of the sector [0..255]. Original engine uses COLORMAP to render lighting, so only 32 actual levels are available (i.e. 0..7, 8..15, etc).
    attr_reader :light
    attr_reader :special_type

    ##
    # Tag number. When the linedef with the same tag number is activated, some effect will be triggered in this sector.
    attr_reader :tag
  end
  class Vertexes < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << Vertex.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
  class Sidedef < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @offset_x = @_io.read_s2le
      @offset_y = @_io.read_s2le
      @upper_texture_name = (@_io.read_bytes(8)).force_encoding("ASCII")
      @lower_texture_name = (@_io.read_bytes(8)).force_encoding("ASCII")
      @normal_texture_name = (@_io.read_bytes(8)).force_encoding("ASCII")
      @sector_id = @_io.read_s2le
    end
    attr_reader :offset_x
    attr_reader :offset_y
    attr_reader :upper_texture_name
    attr_reader :lower_texture_name
    attr_reader :normal_texture_name
    attr_reader :sector_id
  end
  class Things < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << Thing.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
  class Linedefs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << Linedef.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
  class IndexEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @offset = @_io.read_s4le
      @size = @_io.read_s4le
      @name = (@_io.read_bytes(8)).force_encoding("ASCII")
    end
    def contents
      return @contents unless @contents.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      case name
      when "SECTORS\000"
        @_raw_contents = io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = Sectors.new(io, self, @_root)
      when "VERTEXES"
        @_raw_contents = io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = Vertexes.new(io, self, @_root)
      when "BLOCKMAP"
        @_raw_contents = io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = Blockmap.new(io, self, @_root)
      when "THINGS\000\000"
        @_raw_contents = io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = Things.new(io, self, @_root)
      when "LINEDEFS"
        @_raw_contents = io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = Linedefs.new(io, self, @_root)
      when "SIDEDEFS"
        @_raw_contents = io.read_bytes(size)
        io = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = Sidedefs.new(io, self, @_root)
      else
        @contents = io.read_bytes(size)
      end
      io.seek(_pos)
      @contents
    end
    attr_reader :offset
    attr_reader :size
    attr_reader :name
    attr_reader :_raw_contents
  end
  class Sidedefs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << Sidedef.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
  class Blockmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @origin_x = @_io.read_s2le
      @origin_y = @_io.read_s2le
      @num_cols = @_io.read_s2le
      @num_rows = @_io.read_s2le
      @linedefs_in_block = Array.new((num_cols * num_rows))
      ((num_cols * num_rows)).times { |i|
        @linedefs_in_block[i] = Blocklist.new(@_io, self, @_root)
      }
    end
    class Blocklist < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end
      def _read
        @offset = @_io.read_u2le
      end

      ##
      # List of linedefs found in this block
      def linedefs
        return @linedefs unless @linedefs.nil?
        _pos = @_io.pos
        @_io.seek((offset * 2))
        @linedefs = []
        begin
          _ = @_io.read_s2le
          @linedefs << _
        end until _ == -1
        @_io.seek(_pos)
        @linedefs
      end

      ##
      # Offset to the list of linedefs
      attr_reader :offset
    end

    ##
    # Grid origin, X coord
    attr_reader :origin_x

    ##
    # Grid origin, Y coord
    attr_reader :origin_y

    ##
    # Number of columns
    attr_reader :num_cols

    ##
    # Number of rows
    attr_reader :num_rows

    ##
    # Lists of linedefs for every block
    attr_reader :linedefs_in_block
  end
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek(index_offset)
    @index = Array.new(num_index_entries)
    (num_index_entries).times { |i|
      @index[i] = IndexEntry.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @index
  end
  attr_reader :magic

  ##
  # Number of entries in the lump index
  attr_reader :num_index_entries

  ##
  # Offset to the start of the index
  attr_reader :index_offset
end
