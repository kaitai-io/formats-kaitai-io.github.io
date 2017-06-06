# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class MbrPartitionTable < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @bootstrap_code = @_io.read_bytes(446)
    @partitions = Array.new(4)
    (4).times { |i|
      @partitions[i] = PartitionEntry.new(@_io, self, @_root)
    }
    @boot_signature = @_io.ensure_fixed_contents([85, 170].pack('C*'))
  end
  class PartitionEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @status = @_io.read_u1
      @chs_start = Chs.new(@_io, self, @_root)
      @partition_type = @_io.read_u1
      @chs_end = Chs.new(@_io, self, @_root)
      @lba_start = @_io.read_u4le
      @num_sectors = @_io.read_u4le
    end
    attr_reader :status
    attr_reader :chs_start
    attr_reader :partition_type
    attr_reader :chs_end
    attr_reader :lba_start
    attr_reader :num_sectors
  end
  class Chs < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @head = @_io.read_u1
      @b2 = @_io.read_u1
      @b3 = @_io.read_u1
    end
    def sector
      return @sector unless @sector.nil?
      @sector = (b2 & 63)
      @sector
    end
    def cylinder
      return @cylinder unless @cylinder.nil?
      @cylinder = (b3 + ((b2 & 192) << 2))
      @cylinder
    end
    attr_reader :head
    attr_reader :b2
    attr_reader :b3
  end
  attr_reader :bootstrap_code
  attr_reader :partitions
  attr_reader :boot_signature
end
