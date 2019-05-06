# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://faqwiki.zxnet.co.uk/wiki/TAP_format Source
class ZxSpectrumTap < Kaitai::Struct::Struct

  FLAG_ENUM = {
    0 => :flag_enum_header,
    255 => :flag_enum_data,
  }
  I__FLAG_ENUM = FLAG_ENUM.invert

  HEADER_TYPE_ENUM = {
    0 => :header_type_enum_program,
    1 => :header_type_enum_num_array,
    2 => :header_type_enum_char_array,
    3 => :header_type_enum_bytes,
  }
  I__HEADER_TYPE_ENUM = HEADER_TYPE_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @block = []
    i = 0
    while not @_io.eof?
      @block << Block.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_block = @_io.read_u2le
      @flag = Kaitai::Struct::Stream::resolve_enum(FLAG_ENUM, @_io.read_u1)
      if  ((len_block == 19) && (flag == :flag_enum_header)) 
        @header = Header.new(@_io, self, @_root)
      end
      if len_block == 19
        @data = @_io.read_bytes((header.len_data + 4))
      end
      if flag == :flag_enum_data
        @headerless_data = @_io.read_bytes((len_block - 1))
      end
      self
    end
    attr_reader :len_block
    attr_reader :flag
    attr_reader :header
    attr_reader :data
    attr_reader :headerless_data
  end
  class ProgramParams < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @autostart_line = @_io.read_u2le
      @len_program = @_io.read_u2le
      self
    end
    attr_reader :autostart_line
    attr_reader :len_program
  end
  class BytesParams < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @start_address = @_io.read_u2le
      @reserved = @_io.read_bytes(2)
      self
    end
    attr_reader :start_address
    attr_reader :reserved
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header_type = Kaitai::Struct::Stream::resolve_enum(HEADER_TYPE_ENUM, @_io.read_u1)
      @filename = Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(10), 32)
      @len_data = @_io.read_u2le
      case header_type
      when :header_type_enum_program
        @params = ProgramParams.new(@_io, self, @_root)
      when :header_type_enum_num_arry
        @params = ArrayParams.new(@_io, self, @_root)
      when :header_type_enum_char_arry
        @params = ArrayParams.new(@_io, self, @_root)
      when :header_type_enum_bytes
        @params = BytesParams.new(@_io, self, @_root)
      end
      @checksum = @_io.read_u1
      self
    end
    attr_reader :header_type
    attr_reader :filename
    attr_reader :len_data
    attr_reader :params

    ##
    # Bitwise XOR of all bytes including the flag byte
    attr_reader :checksum
  end
  class ArrayParams < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved = @_io.read_u1
      @var_name = @_io.read_u1
      @reserved1 = @_io.ensure_fixed_contents([0, 128].pack('C*'))
      self
    end
    attr_reader :reserved

    ##
    # Variable name (1..26 meaning A$..Z$ +192)
    attr_reader :var_name
    attr_reader :reserved1
  end
  attr_reader :block
end
