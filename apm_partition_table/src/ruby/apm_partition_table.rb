# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://en.wikipedia.org/wiki/Apple_Partition_Map Source
class ApmPartitionTable < Kaitai::Struct::Struct
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
      @magic = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([80, 77].pack('C*'), magic, _io, "/types/partition_entry/seq/0") if not magic == [80, 77].pack('C*')
      @reserved_1 = @_io.read_bytes(2)
      @number_of_partitions = @_io.read_u4be
      @partition_start = @_io.read_u4be
      @partition_size = @_io.read_u4be
      @partition_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(32), 0, false)).force_encoding("ascii")
      @partition_type = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(32), 0, false)).force_encoding("ascii")
      @data_start = @_io.read_u4be
      @data_size = @_io.read_u4be
      @partition_status = @_io.read_u4be
      @boot_code_start = @_io.read_u4be
      @boot_code_size = @_io.read_u4be
      @boot_loader_address = @_io.read_u4be
      @reserved_2 = @_io.read_bytes(4)
      @boot_code_entry = @_io.read_u4be
      @reserved_3 = @_io.read_bytes(4)
      @boot_code_cksum = @_io.read_u4be
      @processor_type = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(16), 0, false)).force_encoding("ascii")
      self
    end
    def partition
      return @partition unless @partition.nil?
      if (partition_status & 1) != 0
        io = _root._io
        _pos = io.pos
        io.seek((partition_start * _root.sector_size))
        @partition = io.read_bytes((partition_size * _root.sector_size))
        io.seek(_pos)
      end
      @partition
    end
    def data
      return @data unless @data.nil?
      io = _root._io
      _pos = io.pos
      io.seek((data_start * _root.sector_size))
      @data = io.read_bytes((data_size * _root.sector_size))
      io.seek(_pos)
      @data
    end
    def boot_code
      return @boot_code unless @boot_code.nil?
      io = _root._io
      _pos = io.pos
      io.seek((boot_code_start * _root.sector_size))
      @boot_code = io.read_bytes(boot_code_size)
      io.seek(_pos)
      @boot_code
    end
    attr_reader :magic
    attr_reader :reserved_1
    attr_reader :number_of_partitions

    ##
    # First sector
    attr_reader :partition_start

    ##
    # Number of sectors
    attr_reader :partition_size
    attr_reader :partition_name
    attr_reader :partition_type

    ##
    # First sector
    attr_reader :data_start

    ##
    # Number of sectors
    attr_reader :data_size
    attr_reader :partition_status

    ##
    # First sector
    attr_reader :boot_code_start

    ##
    # Number of bytes
    attr_reader :boot_code_size

    ##
    # Address of bootloader code
    attr_reader :boot_loader_address
    attr_reader :reserved_2

    ##
    # Boot code entry point
    attr_reader :boot_code_entry
    attr_reader :reserved_3

    ##
    # Boot code checksum
    attr_reader :boot_code_cksum
    attr_reader :processor_type
  end

  ##
  # 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
  # 0x800 (2048) bytes for CDROM
  def sector_size
    return @sector_size unless @sector_size.nil?
    @sector_size = 512
    @sector_size
  end

  ##
  # Every partition entry contains the number of partition entries.
  # We parse the first entry, to know how many to parse, including the first one.
  # No logic is given what to do if other entries have a different number.
  def partition_lookup
    return @partition_lookup unless @partition_lookup.nil?
    io = _root._io
    _pos = io.pos
    io.seek(_root.sector_size)
    @_raw_partition_lookup = io.read_bytes(sector_size)
    _io__raw_partition_lookup = Kaitai::Struct::Stream.new(@_raw_partition_lookup)
    @partition_lookup = PartitionEntry.new(_io__raw_partition_lookup, self, @_root)
    io.seek(_pos)
    @partition_lookup
  end
  def partition_entries
    return @partition_entries unless @partition_entries.nil?
    io = _root._io
    _pos = io.pos
    io.seek(_root.sector_size)
    @_raw_partition_entries = Array.new(_root.partition_lookup.number_of_partitions)
    @partition_entries = Array.new(_root.partition_lookup.number_of_partitions)
    (_root.partition_lookup.number_of_partitions).times { |i|
      @_raw_partition_entries[i] = io.read_bytes(sector_size)
      _io__raw_partition_entries = Kaitai::Struct::Stream.new(@_raw_partition_entries[i])
      @partition_entries[i] = PartitionEntry.new(_io__raw_partition_entries, self, @_root)
    }
    io.seek(_pos)
    @partition_entries
  end
  attr_reader :_raw_partition_lookup
  attr_reader :_raw_partition_entries
end
