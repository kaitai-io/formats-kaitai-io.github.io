# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ISO9660 is standard filesystem used on read-only optical discs
# (mostly CD-ROM). The standard was based on earlier High Sierra
# Format (HSF), proposed for CD-ROMs in 1985, and, after several
# revisions, it was accepted as ISO9960:1998.
# 
# The format emphasizes portability (thus having pretty minimal
# features and very conservative file names standards) and sequential
# access (which favors disc devices with relatively slow rotation
# speed).
class Iso9660 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    self
  end

  ##
  # @see https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor Source
  class VolDescPrimary < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @unused1 = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), unused1, _io, "/types/vol_desc_primary/seq/0") if not unused1 == [0].pack('C*')
      @system_id = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @volume_id = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @unused2 = @_io.read_bytes(8)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0, 0, 0, 0].pack('C*'), unused2, _io, "/types/vol_desc_primary/seq/3") if not unused2 == [0, 0, 0, 0, 0, 0, 0, 0].pack('C*')
      @vol_space_size = U4bi.new(@_io, self, @_root)
      @unused3 = @_io.read_bytes(32)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*'), unused3, _io, "/types/vol_desc_primary/seq/5") if not unused3 == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*')
      @vol_set_size = U2bi.new(@_io, self, @_root)
      @vol_seq_num = U2bi.new(@_io, self, @_root)
      @logical_block_size = U2bi.new(@_io, self, @_root)
      @path_table_size = U4bi.new(@_io, self, @_root)
      @lba_path_table_le = @_io.read_u4le
      @lba_opt_path_table_le = @_io.read_u4le
      @lba_path_table_be = @_io.read_u4be
      @lba_opt_path_table_be = @_io.read_u4be
      @_raw_root_dir = @_io.read_bytes(34)
      _io__raw_root_dir = Kaitai::Struct::Stream.new(@_raw_root_dir)
      @root_dir = DirEntry.new(_io__raw_root_dir, self, @_root)
      @vol_set_id = (@_io.read_bytes(128)).force_encoding("UTF-8")
      @publisher_id = (@_io.read_bytes(128)).force_encoding("UTF-8")
      @data_preparer_id = (@_io.read_bytes(128)).force_encoding("UTF-8")
      @application_id = (@_io.read_bytes(128)).force_encoding("UTF-8")
      @copyright_file_id = (@_io.read_bytes(38)).force_encoding("UTF-8")
      @abstract_file_id = (@_io.read_bytes(36)).force_encoding("UTF-8")
      @bibliographic_file_id = (@_io.read_bytes(37)).force_encoding("UTF-8")
      @vol_create_datetime = DecDatetime.new(@_io, self, @_root)
      @vol_mod_datetime = DecDatetime.new(@_io, self, @_root)
      @vol_expire_datetime = DecDatetime.new(@_io, self, @_root)
      @vol_effective_datetime = DecDatetime.new(@_io, self, @_root)
      @file_structure_version = @_io.read_u1
      @unused4 = @_io.read_u1
      @application_area = @_io.read_bytes(512)
      self
    end
    def path_table
      return @path_table unless @path_table.nil?
      _pos = @_io.pos
      @_io.seek((lba_path_table_le * _root.sector_size))
      @_raw_path_table = @_io.read_bytes(path_table_size.le)
      _io__raw_path_table = Kaitai::Struct::Stream.new(@_raw_path_table)
      @path_table = PathTableLe.new(_io__raw_path_table, self, @_root)
      @_io.seek(_pos)
      @path_table
    end
    attr_reader :unused1
    attr_reader :system_id
    attr_reader :volume_id
    attr_reader :unused2
    attr_reader :vol_space_size
    attr_reader :unused3
    attr_reader :vol_set_size
    attr_reader :vol_seq_num
    attr_reader :logical_block_size
    attr_reader :path_table_size
    attr_reader :lba_path_table_le
    attr_reader :lba_opt_path_table_le
    attr_reader :lba_path_table_be
    attr_reader :lba_opt_path_table_be
    attr_reader :root_dir
    attr_reader :vol_set_id
    attr_reader :publisher_id
    attr_reader :data_preparer_id
    attr_reader :application_id
    attr_reader :copyright_file_id
    attr_reader :abstract_file_id
    attr_reader :bibliographic_file_id
    attr_reader :vol_create_datetime
    attr_reader :vol_mod_datetime
    attr_reader :vol_expire_datetime
    attr_reader :vol_effective_datetime
    attr_reader :file_structure_version
    attr_reader :unused4
    attr_reader :application_area
    attr_reader :_raw_root_dir
    attr_reader :_raw_path_table
  end
  class VolDescBootRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @boot_system_id = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @boot_id = (@_io.read_bytes(32)).force_encoding("UTF-8")
      self
    end
    attr_reader :boot_system_id
    attr_reader :boot_id
  end
  class Datetime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @year = @_io.read_u1
      @month = @_io.read_u1
      @day = @_io.read_u1
      @hour = @_io.read_u1
      @minute = @_io.read_u1
      @sec = @_io.read_u1
      @timezone = @_io.read_u1
      self
    end
    attr_reader :year
    attr_reader :month
    attr_reader :day
    attr_reader :hour
    attr_reader :minute
    attr_reader :sec
    attr_reader :timezone
  end
  class DirEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u1
      if len > 0
        @_raw_body = @_io.read_bytes((len - 1))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DirEntryBody.new(_io__raw_body, self, @_root)
      end
      self
    end
    attr_reader :len
    attr_reader :body
    attr_reader :_raw_body
  end
  class VolDesc < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = @_io.read_u1
      @magic = @_io.read_bytes(5)
      raise Kaitai::Struct::ValidationNotEqualError.new([67, 68, 48, 48, 49].pack('C*'), magic, _io, "/types/vol_desc/seq/1") if not magic == [67, 68, 48, 48, 49].pack('C*')
      @version = @_io.read_u1
      if type == 0
        @vol_desc_boot_record = VolDescBootRecord.new(@_io, self, @_root)
      end
      if type == 1
        @vol_desc_primary = VolDescPrimary.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :type
    attr_reader :magic
    attr_reader :version
    attr_reader :vol_desc_boot_record
    attr_reader :vol_desc_primary
  end
  class PathTableEntryLe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_dir_name = @_io.read_u1
      @len_ext_attr_rec = @_io.read_u1
      @lba_extent = @_io.read_u4le
      @parent_dir_idx = @_io.read_u2le
      @dir_name = (@_io.read_bytes(len_dir_name)).force_encoding("UTF-8")
      if (len_dir_name % 2) == 1
        @padding = @_io.read_u1
      end
      self
    end
    attr_reader :len_dir_name
    attr_reader :len_ext_attr_rec
    attr_reader :lba_extent
    attr_reader :parent_dir_idx
    attr_reader :dir_name
    attr_reader :padding
  end
  class DirEntries < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      begin
        _ = DirEntry.new(@_io, self, @_root)
        @entries << _
        i += 1
      end until _.len == 0
      self
    end
    attr_reader :entries
  end
  class U4bi < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @le = @_io.read_u4le
      @be = @_io.read_u4be
      self
    end
    attr_reader :le
    attr_reader :be
  end
  class U2bi < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @le = @_io.read_u2le
      @be = @_io.read_u2be
      self
    end
    attr_reader :le
    attr_reader :be
  end

  ##
  # @see https://wiki.osdev.org/ISO_9660#The_Path_Table Source
  class PathTableLe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << PathTableEntryLe.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # @see https://wiki.osdev.org/ISO_9660#Date.2Ftime_format Source
  class DecDatetime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @year = (@_io.read_bytes(4)).force_encoding("ASCII")
      @month = (@_io.read_bytes(2)).force_encoding("ASCII")
      @day = (@_io.read_bytes(2)).force_encoding("ASCII")
      @hour = (@_io.read_bytes(2)).force_encoding("ASCII")
      @minute = (@_io.read_bytes(2)).force_encoding("ASCII")
      @sec = (@_io.read_bytes(2)).force_encoding("ASCII")
      @sec_hundreds = (@_io.read_bytes(2)).force_encoding("ASCII")
      @timezone = @_io.read_u1
      self
    end
    attr_reader :year
    attr_reader :month
    attr_reader :day
    attr_reader :hour
    attr_reader :minute
    attr_reader :sec
    attr_reader :sec_hundreds
    attr_reader :timezone
  end
  class DirEntryBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_ext_attr_rec = @_io.read_u1
      @lba_extent = U4bi.new(@_io, self, @_root)
      @size_extent = U4bi.new(@_io, self, @_root)
      @datetime = Datetime.new(@_io, self, @_root)
      @file_flags = @_io.read_u1
      @file_unit_size = @_io.read_u1
      @interleave_gap_size = @_io.read_u1
      @vol_seq_num = U2bi.new(@_io, self, @_root)
      @len_file_name = @_io.read_u1
      @file_name = (@_io.read_bytes(len_file_name)).force_encoding("UTF-8")
      if (len_file_name % 2) == 0
        @padding = @_io.read_u1
      end
      @rest = @_io.read_bytes_full
      self
    end
    def extent_as_dir
      return @extent_as_dir unless @extent_as_dir.nil?
      if (file_flags & 2) != 0
        io = _root._io
        _pos = io.pos
        io.seek((lba_extent.le * _root.sector_size))
        @_raw_extent_as_dir = io.read_bytes(size_extent.le)
        _io__raw_extent_as_dir = Kaitai::Struct::Stream.new(@_raw_extent_as_dir)
        @extent_as_dir = DirEntries.new(_io__raw_extent_as_dir, self, @_root)
        io.seek(_pos)
      end
      @extent_as_dir
    end
    def extent_as_file
      return @extent_as_file unless @extent_as_file.nil?
      if (file_flags & 2) == 0
        io = _root._io
        _pos = io.pos
        io.seek((lba_extent.le * _root.sector_size))
        @extent_as_file = io.read_bytes(size_extent.le)
        io.seek(_pos)
      end
      @extent_as_file
    end
    attr_reader :len_ext_attr_rec
    attr_reader :lba_extent
    attr_reader :size_extent
    attr_reader :datetime
    attr_reader :file_flags
    attr_reader :file_unit_size
    attr_reader :interleave_gap_size
    attr_reader :vol_seq_num
    attr_reader :len_file_name
    attr_reader :file_name
    attr_reader :padding
    attr_reader :rest
    attr_reader :_raw_extent_as_dir
  end
  def sector_size
    return @sector_size unless @sector_size.nil?
    @sector_size = 2048
    @sector_size
  end
  def primary_vol_desc
    return @primary_vol_desc unless @primary_vol_desc.nil?
    _pos = @_io.pos
    @_io.seek((16 * sector_size))
    @primary_vol_desc = VolDesc.new(@_io, self, @_root)
    @_io.seek(_pos)
    @primary_vol_desc
  end
end
