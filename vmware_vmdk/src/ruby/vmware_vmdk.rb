# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://github.com/libyal/libvmdk/blob/master/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header Source
class VmwareVmdk < Kaitai::Struct::Struct

  COMPRESSION_METHODS = {
    0 => :compression_methods_none,
    1 => :compression_methods_deflate,
  }
  I__COMPRESSION_METHODS = COMPRESSION_METHODS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([75, 68, 77, 86].pack('C*'), magic, _io, "/seq/0") if not magic == [75, 68, 77, 86].pack('C*')
    @version = @_io.read_s4le
    @flags = HeaderFlags.new(@_io, self, @_root)
    @size_max = @_io.read_s8le
    @size_grain = @_io.read_s8le
    @start_descriptor = @_io.read_s8le
    @size_descriptor = @_io.read_s8le
    @num_grain_table_entries = @_io.read_s4le
    @start_secondary_grain = @_io.read_s8le
    @start_primary_grain = @_io.read_s8le
    @size_metadata = @_io.read_s8le
    @is_dirty = @_io.read_u1
    @stuff = @_io.read_bytes(4)
    @compression_method = Kaitai::Struct::Stream::resolve_enum(COMPRESSION_METHODS, @_io.read_u2le)
    self
  end

  ##
  # @see https://github.com/libyal/libvmdk/blob/master/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags Source
  class HeaderFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved1 = @_io.read_bits_int_be(5)
      @zeroed_grain_table_entry = @_io.read_bits_int_be(1) != 0
      @use_secondary_grain_dir = @_io.read_bits_int_be(1) != 0
      @valid_new_line_detection_test = @_io.read_bits_int_be(1) != 0
      @_io.align_to_byte
      @reserved2 = @_io.read_u1
      @reserved3 = @_io.read_bits_int_be(6)
      @has_metadata = @_io.read_bits_int_be(1) != 0
      @has_compressed_grain = @_io.read_bits_int_be(1) != 0
      @_io.align_to_byte
      @reserved4 = @_io.read_u1
      self
    end
    attr_reader :reserved1
    attr_reader :zeroed_grain_table_entry
    attr_reader :use_secondary_grain_dir
    attr_reader :valid_new_line_detection_test
    attr_reader :reserved2
    attr_reader :reserved3
    attr_reader :has_metadata
    attr_reader :has_compressed_grain
    attr_reader :reserved4
  end
  def len_sector
    return @len_sector unless @len_sector.nil?
    @len_sector = 512
    @len_sector
  end
  def descriptor
    return @descriptor unless @descriptor.nil?
    _pos = @_io.pos
    @_io.seek((start_descriptor * _root.len_sector))
    @descriptor = @_io.read_bytes((size_descriptor * _root.len_sector))
    @_io.seek(_pos)
    @descriptor
  end
  def grain_primary
    return @grain_primary unless @grain_primary.nil?
    _pos = @_io.pos
    @_io.seek((start_primary_grain * _root.len_sector))
    @grain_primary = @_io.read_bytes((size_grain * _root.len_sector))
    @_io.seek(_pos)
    @grain_primary
  end
  def grain_secondary
    return @grain_secondary unless @grain_secondary.nil?
    _pos = @_io.pos
    @_io.seek((start_secondary_grain * _root.len_sector))
    @grain_secondary = @_io.read_bytes((size_grain * _root.len_sector))
    @_io.seek(_pos)
    @grain_secondary
  end
  attr_reader :magic
  attr_reader :version
  attr_reader :flags

  ##
  # Maximum number of sectors in a given image file (capacity)
  attr_reader :size_max
  attr_reader :size_grain

  ##
  # Embedded descriptor file start sector number (0 if not available)
  attr_reader :start_descriptor

  ##
  # Number of sectors that embedded descriptor file occupies
  attr_reader :size_descriptor

  ##
  # Number of grains table entries
  attr_reader :num_grain_table_entries

  ##
  # Secondary (backup) grain directory start sector number
  attr_reader :start_secondary_grain

  ##
  # Primary grain directory start sector number
  attr_reader :start_primary_grain
  attr_reader :size_metadata
  attr_reader :is_dirty
  attr_reader :stuff
  attr_reader :compression_method
end
