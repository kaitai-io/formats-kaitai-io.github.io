# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://en.wikipedia.org/wiki/GUID_Partition_Table Source
class GptPartitionTable < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    self
  end
  class PartitionEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type_guid = @_io.read_bytes(16)
      @guid = @_io.read_bytes(16)
      @first_lba = @_io.read_u8le
      @last_lba = @_io.read_u8le
      @attributes = @_io.read_u8le
      @name = (@_io.read_bytes(72)).force_encoding("UTF-16LE")
      self
    end
    attr_reader :type_guid
    attr_reader :guid
    attr_reader :first_lba
    attr_reader :last_lba
    attr_reader :attributes
    attr_reader :name
  end
  class PartitionHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.read_bytes(8)
      raise Kaitai::Struct::ValidationNotEqualError.new([69, 70, 73, 32, 80, 65, 82, 84].pack('C*'), signature, _io, "/types/partition_header/seq/0") if not signature == [69, 70, 73, 32, 80, 65, 82, 84].pack('C*')
      @revision = @_io.read_u4le
      @header_size = @_io.read_u4le
      @crc32_header = @_io.read_u4le
      @reserved = @_io.read_u4le
      @current_lba = @_io.read_u8le
      @backup_lba = @_io.read_u8le
      @first_usable_lba = @_io.read_u8le
      @last_usable_lba = @_io.read_u8le
      @disk_guid = @_io.read_bytes(16)
      @entries_start = @_io.read_u8le
      @entries_count = @_io.read_u4le
      @entries_size = @_io.read_u4le
      @crc32_array = @_io.read_u4le
      self
    end
    def entries
      return @entries unless @entries.nil?
      io = _root._io
      _pos = io.pos
      io.seek((entries_start * _root.sector_size))
      @_raw_entries = []
      @entries = []
      (entries_count).times { |i|
        @_raw_entries << io.read_bytes(entries_size)
        _io__raw_entries = Kaitai::Struct::Stream.new(@_raw_entries[i])
        @entries << PartitionEntry.new(_io__raw_entries, self, @_root)
      }
      io.seek(_pos)
      @entries
    end
    attr_reader :signature
    attr_reader :revision
    attr_reader :header_size
    attr_reader :crc32_header
    attr_reader :reserved
    attr_reader :current_lba
    attr_reader :backup_lba
    attr_reader :first_usable_lba
    attr_reader :last_usable_lba
    attr_reader :disk_guid
    attr_reader :entries_start
    attr_reader :entries_count
    attr_reader :entries_size
    attr_reader :crc32_array
    attr_reader :_raw_entries
  end
  def sector_size
    return @sector_size unless @sector_size.nil?
    @sector_size = 512
    @sector_size
  end
  def primary
    return @primary unless @primary.nil?
    io = _root._io
    _pos = io.pos
    io.seek(_root.sector_size)
    @primary = PartitionHeader.new(io, self, @_root)
    io.seek(_pos)
    @primary
  end
  def backup
    return @backup unless @backup.nil?
    io = _root._io
    _pos = io.pos
    io.seek((_io.size - _root.sector_size))
    @backup = PartitionHeader.new(io, self, @_root)
    io.seek(_pos)
    @backup
  end
end
