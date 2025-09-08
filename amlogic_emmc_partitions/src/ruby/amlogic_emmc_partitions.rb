# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This is an unnamed and undocumented partition table format implemented by
# the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
# series at least, and probably others). They appear to use this rather than GPT,
# the industry standard, because their BootROM loads and executes the next stage
# loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
# header would have to start. So instead of changing their BootROM, Amlogic
# devised this partition table, which lives at an offset of 36MiB (0x240_0000)
# on the eMMC and so doesn't conflict. This parser expects as input just the
# partition table from that offset. The maximum number of partitions in a table
# is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
# @see http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef Source
# @see http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef Source
class AmlogicEmmcPartitions < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([77, 80, 84, 0].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [77, 80, 84, 0].pack('C*')
    @version = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(12), 0, false)).force_encoding("UTF-8")
    @num_partitions = @_io.read_s4le
    raise Kaitai::Struct::ValidationLessThanError.new(1, @num_partitions, @_io, "/seq/2") if not @num_partitions >= 1
    raise Kaitai::Struct::ValidationGreaterThanError.new(32, @num_partitions, @_io, "/seq/2") if not @num_partitions <= 32
    @checksum = @_io.read_u4le
    @partitions = []
    (num_partitions).times { |i|
      @partitions << Partition.new(@_io, self, @_root)
    }
    self
  end
  class Partition < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(16), 0, false)).force_encoding("UTF-8")
      @size = @_io.read_u8le
      @offset = @_io.read_u8le
      _io_flags = @_io.substream(4)
      @flags = PartFlags.new(_io_flags, self, @_root)
      @padding = @_io.read_bytes(4)
      self
    end
    class PartFlags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @is_code = @_io.read_bits_int_le(1) != 0
        @is_cache = @_io.read_bits_int_le(1) != 0
        @is_data = @_io.read_bits_int_le(1) != 0
        self
      end
      attr_reader :is_code
      attr_reader :is_cache
      attr_reader :is_data
    end
    attr_reader :name
    attr_reader :size

    ##
    # The start of the partition relative to the start of the eMMC, in bytes
    attr_reader :offset
    attr_reader :flags
    attr_reader :padding
    attr_reader :_raw_flags
  end
  attr_reader :magic
  attr_reader :version
  attr_reader :num_partitions

  ##
  # To calculate this, treat the first (and only the first) partition
  # descriptor in the table below as an array of unsigned little-endian
  # 32-bit integers. Sum all those integers mod 2^32, then multiply the
  # result by the total number of partitions, also mod 2^32. Amlogic
  # likely meant to include all the partition descriptors in the sum,
  # but their code as written instead repeatedly loops over the first
  # one, once for each partition in the table.
  attr_reader :checksum
  attr_reader :partitions
end
