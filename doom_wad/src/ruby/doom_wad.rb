# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class DoomWad < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
    @num_index_entries = @_io.read_s4le
    @index_offset = @_io.read_s4le
    self
  end
  class Blockmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @origin_x = @_io.read_s2le
      @origin_y = @_io.read_s2le
      @num_cols = @_io.read_s2le
      @num_rows = @_io.read_s2le
      @linedefs_in_block = []
      (num_cols * num_rows).times { |i|
        @linedefs_in_block << Blocklist.new(@_io, self, @_root)
      }
      self
    end
    class Blocklist < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @offset = @_io.read_u2le
        self
      end

      ##
      # List of linedefs found in this block
      def linedefs
        return @linedefs unless @linedefs.nil?
        _pos = @_io.pos
        @_io.seek(offset * 2)
        @linedefs = []
        i = 0
        begin
          _ = @_io.read_s2le
          @linedefs << _
          i += 1
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
  class IndexEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @offset = @_io.read_s4le
      @size = @_io.read_s4le
      @name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 0)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    def contents
      return @contents unless @contents.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      case name
      when "BLOCKMAP"
        _io_contents = io.substream(size)
        @contents = Blockmap.new(_io_contents, self, @_root)
      when "LINEDEFS"
        _io_contents = io.substream(size)
        @contents = Linedefs.new(_io_contents, self, @_root)
      when "PNAMES"
        _io_contents = io.substream(size)
        @contents = Pnames.new(_io_contents, self, @_root)
      when "SECTORS"
        _io_contents = io.substream(size)
        @contents = Sectors.new(_io_contents, self, @_root)
      when "SIDEDEFS"
        _io_contents = io.substream(size)
        @contents = Sidedefs.new(_io_contents, self, @_root)
      when "TEXTURE1"
        _io_contents = io.substream(size)
        @contents = Texture12.new(_io_contents, self, @_root)
      when "TEXTURE2"
        _io_contents = io.substream(size)
        @contents = Texture12.new(_io_contents, self, @_root)
      when "THINGS"
        _io_contents = io.substream(size)
        @contents = Things.new(_io_contents, self, @_root)
      when "VERTEXES"
        _io_contents = io.substream(size)
        @contents = Vertexes.new(_io_contents, self, @_root)
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
  class Linedef < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
      self
    end
    attr_reader :vertex_start_idx
    attr_reader :vertex_end_idx
    attr_reader :flags
    attr_reader :line_type
    attr_reader :sector_tag
    attr_reader :sidedef_right_idx
    attr_reader :sidedef_left_idx
  end
  class Linedefs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Linedef.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # @see https://doom.fandom.com/wiki/PNAMES Source
  class Pnames < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_patches = @_io.read_u4le
      @names = []
      (num_patches).times { |i|
        @names << (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 0)).force_encoding("ASCII").encode('UTF-8')
      }
      self
    end

    ##
    # Number of patches registered in this global game directory
    attr_reader :num_patches
    attr_reader :names
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
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @floor_z = @_io.read_s2le
      @ceil_z = @_io.read_s2le
      @floor_flat = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      @ceil_flat = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      @light = @_io.read_s2le
      @special_type = Kaitai::Struct::Stream::resolve_enum(SPECIAL_SECTOR, @_io.read_u2le)
      @tag = @_io.read_u2le
      self
    end
    attr_reader :floor_z
    attr_reader :ceil_z
    attr_reader :floor_flat
    attr_reader :ceil_flat

    ##
    # Light level of the sector [0..255]. Original engine uses
    # COLORMAP to render lighting, so only 32 actual levels are
    # available (i.e. 0..7, 8..15, etc).
    attr_reader :light
    attr_reader :special_type

    ##
    # Tag number. When the linedef with the same tag number is
    # activated, some effect will be triggered in this sector.
    attr_reader :tag
  end
  class Sectors < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Sector.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class Sidedef < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @offset_x = @_io.read_s2le
      @offset_y = @_io.read_s2le
      @upper_texture_name = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      @lower_texture_name = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      @normal_texture_name = (@_io.read_bytes(8)).force_encoding("ASCII").encode('UTF-8')
      @sector_id = @_io.read_s2le
      self
    end
    attr_reader :offset_x
    attr_reader :offset_y
    attr_reader :upper_texture_name
    attr_reader :lower_texture_name
    attr_reader :normal_texture_name
    attr_reader :sector_id
  end
  class Sidedefs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Sidedef.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
  # combine wall patches to make wall textures. This essentially
  # provides a very simple form of image compression, allowing
  # certain elements ("patches") to be reused / recombined on
  # different textures for more variety in the game.
  # @see https://doom.fandom.com/wiki/TEXTURE1_and_TEXTURE2 Source
  class Texture12 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_textures = @_io.read_s4le
      @textures = []
      (num_textures).times { |i|
        @textures << TextureIndex.new(@_io, self, @_root)
      }
      self
    end
    class Patch < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @origin_x = @_io.read_s2le
        @origin_y = @_io.read_s2le
        @patch_id = @_io.read_u2le
        @step_dir = @_io.read_u2le
        @colormap = @_io.read_u2le
        self
      end

      ##
      # X offset to draw a patch at (pixels from left boundary of a texture)
      attr_reader :origin_x

      ##
      # Y offset to draw a patch at (pixels from upper boundary of a texture)
      attr_reader :origin_y

      ##
      # Identifier of a patch (as listed in PNAMES lump) to draw
      attr_reader :patch_id
      attr_reader :step_dir
      attr_reader :colormap
    end
    class TextureBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @name = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(8), 0)).force_encoding("ASCII").encode('UTF-8')
        @masked = @_io.read_u4le
        @width = @_io.read_u2le
        @height = @_io.read_u2le
        @column_directory = @_io.read_u4le
        @num_patches = @_io.read_u2le
        @patches = []
        (num_patches).times { |i|
          @patches << Patch.new(@_io, self, @_root)
        }
        self
      end

      ##
      # Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
      attr_reader :name
      attr_reader :masked
      attr_reader :width
      attr_reader :height

      ##
      # Obsolete, ignored by all DOOM versions
      attr_reader :column_directory

      ##
      # Number of patches that are used in a texture
      attr_reader :num_patches
      attr_reader :patches
    end
    class TextureIndex < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @offset = @_io.read_s4le
        self
      end
      def body
        return @body unless @body.nil?
        _pos = @_io.pos
        @_io.seek(offset)
        @body = TextureBody.new(@_io, self, @_root)
        @_io.seek(_pos)
        @body
      end
      attr_reader :offset
    end

    ##
    # Number of wall textures
    attr_reader :num_textures
    attr_reader :textures
  end
  class Thing < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_s2le
      @y = @_io.read_s2le
      @angle = @_io.read_u2le
      @type = @_io.read_u2le
      @flags = @_io.read_u2le
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :angle
    attr_reader :type
    attr_reader :flags
  end
  class Things < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Thing.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class Vertex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_s2le
      @y = @_io.read_s2le
      self
    end
    attr_reader :x
    attr_reader :y
  end
  class Vertexes < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Vertex.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek(index_offset)
    @index = []
    (num_index_entries).times { |i|
      @index << IndexEntry.new(@_io, self, @_root)
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
