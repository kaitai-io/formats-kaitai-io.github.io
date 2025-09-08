# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# AppleSingle and AppleDouble files are used by certain Mac
# applications (e.g. Finder) to store Mac-specific file attributes on
# filesystems that do not support that.
# 
# Syntactically, both formats are the same, the only difference is how
# they are being used:
# 
# * AppleSingle means that only one file will be created on external
#   filesystem that will hold both the data (AKA "data fork" in Apple
#   terminology), and the attributes (AKA "resource fork").
# * AppleDouble means that two files will be created: a normal file
#   that keeps the data ("data fork") is kept separately from an
#   auxiliary file that contains attributes ("resource fork"), which
#   is kept with the same name, but starting with an extra dot and
#   underscore `._` to keep it hidden.
# 
# In modern practice (Mac OS X), Finder only uses AppleDouble to keep
# compatibility with other OSes, as virtually nobody outside of Mac
# understands how to access data in AppleSingle container.
# @see http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf Source
class AppleSingleDouble < Kaitai::Struct::Struct

  FILE_TYPE = {
    333312 => :file_type_apple_single,
    333319 => :file_type_apple_double,
  }
  I__FILE_TYPE = FILE_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = Kaitai::Struct::Stream::resolve_enum(FILE_TYPE, @_io.read_u4be)
    @version = @_io.read_u4be
    @reserved = @_io.read_bytes(16)
    @num_entries = @_io.read_u2be
    @entries = []
    (num_entries).times { |i|
      @entries << Entry.new(@_io, self, @_root)
    }
    self
  end
  class Entry < Kaitai::Struct::Struct

    TYPES = {
      1 => :types_data_fork,
      2 => :types_resource_fork,
      3 => :types_real_name,
      4 => :types_comment,
      5 => :types_icon_bw,
      6 => :types_icon_color,
      8 => :types_file_dates_info,
      9 => :types_finder_info,
      10 => :types_macintosh_file_info,
      11 => :types_prodos_file_info,
      12 => :types_msdos_file_info,
      13 => :types_afp_short_name,
      14 => :types_afp_file_info,
      15 => :types_afp_directory_id,
    }
    I__TYPES = TYPES.invert
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(TYPES, @_io.read_u4be)
      @ofs_body = @_io.read_u4be
      @len_body = @_io.read_u4be
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(ofs_body)
      case type
      when :types_finder_info
        _io_body = @_io.substream(len_body)
        @body = FinderInfo.new(_io_body, self, @_root)
      else
        @body = @_io.read_bytes(len_body)
      end
      @_io.seek(_pos)
      @body
    end
    attr_reader :type
    attr_reader :ofs_body
    attr_reader :len_body
    attr_reader :_raw_body
  end

  ##
  # Information specific to Finder
  # @see '' older Inside Macintosh, Volume II page 84 or Volume IV page 104.
  class FinderInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_type = @_io.read_bytes(4)
      @file_creator = @_io.read_bytes(4)
      @flags = @_io.read_u2be
      @location = Point.new(@_io, self, @_root)
      @folder_id = @_io.read_u2be
      self
    end
    attr_reader :file_type
    attr_reader :file_creator
    attr_reader :flags

    ##
    # File icon's coordinates when displaying this folder.
    attr_reader :location

    ##
    # File folder ID (=window).
    attr_reader :folder_id
  end

  ##
  # Specifies 2D coordinate in QuickDraw grid.
  class Point < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_u2be
      @y = @_io.read_u2be
      self
    end
    attr_reader :x
    attr_reader :y
  end
  attr_reader :magic
  attr_reader :version

  ##
  # Must be all 0.
  attr_reader :reserved
  attr_reader :num_entries
  attr_reader :entries
end
