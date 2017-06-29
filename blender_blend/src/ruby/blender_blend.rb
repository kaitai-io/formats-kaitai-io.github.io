# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class BlenderBlend < Kaitai::Struct::Struct

  PTR_SIZE = {
    45 => :ptr_size_bits_64,
    95 => :ptr_size_bits_32,
  }
  I__PTR_SIZE = PTR_SIZE.invert

  ENDIAN = {
    86 => :endian_be,
    118 => :endian_le,
  }
  I__ENDIAN = ENDIAN.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @hdr = Header.new(@_io, self, @_root)
    @blocks = []
    while not @_io.eof?
      @blocks << FileBlock.new(@_io, self, @_root)
    end
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([66, 76, 69, 78, 68, 69, 82].pack('C*'))
      @ptr_size_id = Kaitai::Struct::Stream::resolve_enum(PTR_SIZE, @_io.read_u1)
      @endian = Kaitai::Struct::Stream::resolve_enum(ENDIAN, @_io.read_u1)
      @version = (@_io.read_bytes(3)).force_encoding("ASCII")
      self
    end

    ##
    # Number of bytes that a pointer occupies
    def psize
      return @psize unless @psize.nil?
      @psize = (ptr_size_id == :ptr_size_bits_64 ? 8 : 4)
      @psize
    end
    attr_reader :magic

    ##
    # Size of a pointer; all pointers in the file are stored in this format
    attr_reader :ptr_size_id

    ##
    # Type of byte ordering used
    attr_reader :endian

    ##
    # Blender version used to save this file
    attr_reader :version
  end
  class FileBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = (@_io.read_bytes(4)).force_encoding("ASCII")
      @size = @_io.read_u4le
      @mem_addr = @_io.read_bytes(_root.hdr.psize)
      @sdna_index = @_io.read_u4le
      @count = @_io.read_u4le
      @body = @_io.read_bytes(size)
      self
    end

    ##
    # Identifier of the file block
    attr_reader :code

    ##
    # Total length of the data after the header of file block
    attr_reader :size

    ##
    # Memory address the structure was located when written to disk
    attr_reader :mem_addr

    ##
    # Index of the SDNA structure
    attr_reader :sdna_index

    ##
    # Number of structure located in this file-block
    attr_reader :count
    attr_reader :body
  end
  attr_reader :hdr
  attr_reader :blocks
end
