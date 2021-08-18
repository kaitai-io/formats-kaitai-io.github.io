# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
# of data (primarily devicetree data, although other data is possible as well).
# The data is internally stored as a tree of named nodes and properties. Nodes
# contain properties and child nodes, while properties are name–value pairs.
# 
# The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
# files (`.dts`) through the Devicetree compiler (DTC).
# 
# On Linux systems that support this, the blobs can be accessed in
# `/sys/firmware/fdt`:
# 
# * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
# 
# The encoding of strings used in the `strings_block` and `structure_block` is
# actually a subset of ASCII:
# 
# <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
# 
# Example files:
# 
# * <https://github.com/qemu/qemu/tree/master/pc-bios>
# @see https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html Source
# @see https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf Source
class Dtb < Kaitai::Struct::Struct

  FDT = {
    1 => :fdt_begin_node,
    2 => :fdt_end_node,
    3 => :fdt_prop,
    4 => :fdt_nop,
    9 => :fdt_end,
  }
  I__FDT = FDT.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([208, 13, 254, 237].pack('C*'), magic, _io, "/seq/0") if not magic == [208, 13, 254, 237].pack('C*')
    @total_size = @_io.read_u4be
    @ofs_structure_block = @_io.read_u4be
    @ofs_strings_block = @_io.read_u4be
    @ofs_memory_reservation_block = @_io.read_u4be
    @version = @_io.read_u4be
    @min_compatible_version = @_io.read_u4be
    raise Kaitai::Struct::ValidationGreaterThanError.new(version, min_compatible_version, _io, "/seq/6") if not min_compatible_version <= version
    @boot_cpuid_phys = @_io.read_u4be
    @len_strings_block = @_io.read_u4be
    @len_structure_block = @_io.read_u4be
    self
  end
  class MemoryBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << MemoryBlockEntry.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class FdtBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @nodes = []
      i = 0
      begin
        _ = FdtNode.new(@_io, self, @_root)
        @nodes << _
        i += 1
      end until _.type == :fdt_end
      self
    end
    attr_reader :nodes
  end
  class MemoryBlockEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @address = @_io.read_u8be
      @size = @_io.read_u8be
      self
    end

    ##
    # physical address of a reserved memory region
    attr_reader :address

    ##
    # size of a reserved memory region
    attr_reader :size
  end
  class Strings < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @strings = []
      i = 0
      while not @_io.eof?
        @strings << (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        i += 1
      end
      self
    end
    attr_reader :strings
  end
  class FdtProp < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_property = @_io.read_u4be
      @ofs_name = @_io.read_u4be
      @property = @_io.read_bytes(len_property)
      @padding = @_io.read_bytes((-(_io.pos) % 4))
      self
    end
    def name
      return @name unless @name.nil?
      io = _root.strings_block._io
      _pos = io.pos
      io.seek(ofs_name)
      @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      io.seek(_pos)
      @name
    end
    attr_reader :len_property
    attr_reader :ofs_name
    attr_reader :property
    attr_reader :padding
  end
  class FdtNode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(Dtb::FDT, @_io.read_u4be)
      case type
      when :fdt_begin_node
        @body = FdtBeginNode.new(@_io, self, @_root)
      when :fdt_prop
        @body = FdtProp.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :type
    attr_reader :body
  end
  class FdtBeginNode < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      @padding = @_io.read_bytes((-(_io.pos) % 4))
      self
    end
    attr_reader :name
    attr_reader :padding
  end
  def memory_reservation_block
    return @memory_reservation_block unless @memory_reservation_block.nil?
    _pos = @_io.pos
    @_io.seek(ofs_memory_reservation_block)
    @_raw_memory_reservation_block = @_io.read_bytes((ofs_structure_block - ofs_memory_reservation_block))
    _io__raw_memory_reservation_block = Kaitai::Struct::Stream.new(@_raw_memory_reservation_block)
    @memory_reservation_block = MemoryBlock.new(_io__raw_memory_reservation_block, self, @_root)
    @_io.seek(_pos)
    @memory_reservation_block
  end
  def structure_block
    return @structure_block unless @structure_block.nil?
    _pos = @_io.pos
    @_io.seek(ofs_structure_block)
    @_raw_structure_block = @_io.read_bytes(len_structure_block)
    _io__raw_structure_block = Kaitai::Struct::Stream.new(@_raw_structure_block)
    @structure_block = FdtBlock.new(_io__raw_structure_block, self, @_root)
    @_io.seek(_pos)
    @structure_block
  end
  def strings_block
    return @strings_block unless @strings_block.nil?
    _pos = @_io.pos
    @_io.seek(ofs_strings_block)
    @_raw_strings_block = @_io.read_bytes(len_strings_block)
    _io__raw_strings_block = Kaitai::Struct::Stream.new(@_raw_strings_block)
    @strings_block = Strings.new(_io__raw_strings_block, self, @_root)
    @_io.seek(_pos)
    @strings_block
  end
  attr_reader :magic
  attr_reader :total_size
  attr_reader :ofs_structure_block
  attr_reader :ofs_strings_block
  attr_reader :ofs_memory_reservation_block
  attr_reader :version
  attr_reader :min_compatible_version
  attr_reader :boot_cpuid_phys
  attr_reader :len_strings_block
  attr_reader :len_structure_block
  attr_reader :_raw_memory_reservation_block
  attr_reader :_raw_structure_block
  attr_reader :_raw_strings_block
end
