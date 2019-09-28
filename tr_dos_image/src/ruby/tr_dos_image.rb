# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
# headerless and contain consequent "logical tracks", each logical track
# consists of 16 256-byte sectors.
# 
# Logical tracks are defined the same way as used by TR-DOS: for single-side
# floppies it's just a physical track number, for two-side floppies sides are
# interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
# 
# So, this format definition is more for TR-DOS filesystem than for .trd files,
# which are formatless.
# 
# Strings (file names, disk label, disk password) are padded with spaces and use
# ZX Spectrum character set, including UDGs, block drawing chars and Basic
# tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
# replaced with (up arrow, pound, copyright symbol).
# 
# .trd file can be smaller than actual floppy disk, if last logical tracks are
# empty (contain no file data) they can be omitted.
class TrDosImage < Kaitai::Struct::Struct

  DISK_TYPE = {
    22 => :disk_type_type_80_tracks_double_side,
    23 => :disk_type_type_40_tracks_double_side,
    24 => :disk_type_type_80_tracks_single_side,
    25 => :disk_type_type_40_tracks_single_side,
  }
  I__DISK_TYPE = DISK_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @files = []
    i = 0
    begin
      _ = File.new(@_io, self, @_root)
      @files << _
      i += 1
    end until _.is_terminator
    self
  end
  class VolumeInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @catalog_end = @_io.ensure_fixed_contents([0].pack('C*'))
      @unused = @_io.read_bytes(224)
      @first_free_sector_sector = @_io.read_u1
      @first_free_sector_track = @_io.read_u1
      @disk_type = Kaitai::Struct::Stream::resolve_enum(TrDosImage::DISK_TYPE, @_io.read_u1)
      @num_files = @_io.read_u1
      @num_free_sectors = @_io.read_u2le
      @tr_dos_id = @_io.ensure_fixed_contents([16].pack('C*'))
      @unused_2 = @_io.read_bytes(2)
      @password = @_io.read_bytes(9)
      @unused_3 = @_io.read_bytes(1)
      @num_deleted_files = @_io.read_u1
      @label = @_io.read_bytes(8)
      @unused_4 = @_io.read_bytes(3)
      self
    end
    def num_tracks
      return @num_tracks unless @num_tracks.nil?
      @num_tracks = ((I__DISK_TYPE[disk_type] & 1) != 0 ? 40 : 80)
      @num_tracks
    end
    def num_sides
      return @num_sides unless @num_sides.nil?
      @num_sides = ((I__DISK_TYPE[disk_type] & 8) != 0 ? 1 : 2)
      @num_sides
    end
    attr_reader :catalog_end
    attr_reader :unused
    attr_reader :first_free_sector_sector

    ##
    # track number is logical, for double-sided disks it's
    # (physical_track << 1) | side, the same way that tracks are stored
    # sequentially in .trd file
    attr_reader :first_free_sector_track
    attr_reader :disk_type

    ##
    # Number of non-deleted files. Directory can have more than
    # number_of_files entries due to deleted files
    attr_reader :num_files
    attr_reader :num_free_sectors
    attr_reader :tr_dos_id
    attr_reader :unused_2
    attr_reader :password
    attr_reader :unused_3
    attr_reader :num_deleted_files
    attr_reader :label
    attr_reader :unused_4
  end
  class PositionAndLengthCode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @start_address = @_io.read_u2le
      @length = @_io.read_u2le
      self
    end

    ##
    # Default memory address to load this byte array into
    attr_reader :start_address
    attr_reader :length
  end
  class Filename < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = @_io.read_bytes(8)
      self
    end
    def first_byte
      return @first_byte unless @first_byte.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @first_byte = @_io.read_u1
      @_io.seek(_pos)
      @first_byte
    end
    attr_reader :name
  end
  class PositionAndLengthPrint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @extent_no = @_io.read_u1
      @reserved = @_io.read_u1
      @length = @_io.read_u2le
      self
    end
    attr_reader :extent_no
    attr_reader :reserved
    attr_reader :length
  end
  class PositionAndLengthGeneric < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved = @_io.read_u2le
      @length = @_io.read_u2le
      self
    end
    attr_reader :reserved
    attr_reader :length
  end
  class PositionAndLengthBasic < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @program_and_data_length = @_io.read_u2le
      @program_length = @_io.read_u2le
      self
    end
    attr_reader :program_and_data_length
    attr_reader :program_length
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_name = @_io.read_bytes(8)
      _io__raw_name = Kaitai::Struct::Stream.new(@_raw_name)
      @name = Filename.new(_io__raw_name, self, @_root)
      @extension = @_io.read_u1
      case extension
      when 66
        @position_and_length = PositionAndLengthBasic.new(@_io, self, @_root)
      when 67
        @position_and_length = PositionAndLengthCode.new(@_io, self, @_root)
      when 35
        @position_and_length = PositionAndLengthPrint.new(@_io, self, @_root)
      else
        @position_and_length = PositionAndLengthGeneric.new(@_io, self, @_root)
      end
      @length_sectors = @_io.read_u1
      @starting_sector = @_io.read_u1
      @starting_track = @_io.read_u1
      self
    end
    def is_deleted
      return @is_deleted unless @is_deleted.nil?
      @is_deleted = name.first_byte == 1
      @is_deleted
    end
    def is_terminator
      return @is_terminator unless @is_terminator.nil?
      @is_terminator = name.first_byte == 0
      @is_terminator
    end
    def contents
      return @contents unless @contents.nil?
      _pos = @_io.pos
      @_io.seek((((starting_track * 256) * 16) + (starting_sector * 256)))
      @contents = @_io.read_bytes((length_sectors * 256))
      @_io.seek(_pos)
      @contents
    end
    attr_reader :name
    attr_reader :extension
    attr_reader :position_and_length
    attr_reader :length_sectors
    attr_reader :starting_sector
    attr_reader :starting_track
    attr_reader :_raw_name
  end
  def volume_info
    return @volume_info unless @volume_info.nil?
    _pos = @_io.pos
    @_io.seek(2048)
    @volume_info = VolumeInfo.new(@_io, self, @_root)
    @_io.seek(_pos)
    @volume_info
  end
  attr_reader :files
end
