# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Iso9660 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
  end
  class VolDescPrimary < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @unused1 = @_io.ensure_fixed_contents([0].pack('C*'))
      @system_id = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @volume_id = (@_io.read_bytes(32)).force_encoding("UTF-8")
      @unused2 = @_io.ensure_fixed_contents([0, 0, 0, 0, 0, 0, 0, 0].pack('C*'))
      @vol_space_size = U4bi.new(@_io, self, @_root)
      @unused3 = @_io.ensure_fixed_contents([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*'))
      @vol_set_size = U2bi.new(@_io, self, @_root)
      @vol_seq_num = U2bi.new(@_io, self, @_root)
      @logical_block_size = U2bi.new(@_io, self, @_root)
      @path_table_size = U4bi.new(@_io, self, @_root)
      @lba_path_table_le = @_io.read_u4le
      @lba_opt_path_table_le = @_io.read_u4le
      @lba_path_table_be = @_io.read_u4be
      @lba_opt_path_table_be = @_io.read_u4be
      @_raw_root_dir = @_io.read_bytes(34)
      io = Kaitai::Struct::Stream.new(@_raw_root_dir)
      @root_dir = DirEntry.new(io, self, @_root)
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
    end
    def path_table
      return @path_table unless @path_table.nil?
      _pos = @_io.pos
      @_io.seek((lba_path_table_le * _root.sector_size))
      @_raw_path_table = @_io.read_bytes(path_table_size.le)
      io = Kaitai::Struct::Stream.new(@_raw_path_table)
      @path_table = PathTableLe.new(io, self, @_root)
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
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DirEntryBody.new(io, self, @_root)
      end
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
      @magic = @_io.ensure_fixed_contents([67, 68, 48, 48, 49].pack('C*'))
      @version = @_io.read_u1
      if type == 0
        @vol_desc_boot_record = VolDescBootRecord.new(@_io, self, @_root)
      end
      if type == 1
        @vol_desc_primary = VolDescPrimary.new(@_io, self, @_root)
      end
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
      begin
        _ = DirEntry.new(@_io, self, @_root)
        @entries << _
      end until _.len == 0
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
    end
    attr_reader :le
    attr_reader :be
  end
  class PathTableLe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << PathTableEntryLe.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end
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
    end
    def extent_as_dir
      return @extent_as_dir unless @extent_as_dir.nil?
      if (file_flags & 2) != 0
        io = _root._io
        _pos = io.pos
        io.seek((lba_extent.le * _root.sector_size))
        @_raw_extent_as_dir = io.read_bytes(size_extent.le)
        io = Kaitai::Struct::Stream.new(@_raw_extent_as_dir)
        @extent_as_dir = DirEntries.new(io, self, @_root)
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
