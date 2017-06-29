# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Swf < Kaitai::Struct::Struct

  TAG_TYPE = {
    69 => :tag_type_file_attributes,
    82 => :tag_type_abc_tag,
  }
  I__TAG_TYPE = TAG_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @junk = @_io.read_bytes(4)
    @file_size = @_io.read_u4le
    @_raw__raw_body = @_io.read_bytes_full
    @_raw_body = Zlib::Inflate.inflate(@_raw__raw_body)
    io = Kaitai::Struct::Stream.new(@_raw_body)
    @body = SwfBody.new(io, self, @_root)
    self
  end
  class SwfBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rect = Rect.new(@_io, self, @_root)
      @frame_rate = @_io.read_u2le
      @frame_count = @_io.read_u2le
      @tags = []
      while not @_io.eof?
        @tags << Tag.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :rect
    attr_reader :frame_rate
    attr_reader :frame_count
    attr_reader :tags
  end
  class Rect < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      @skip = @_io.read_bytes(num_bytes)
      self
    end
    def num_bits
      return @num_bits unless @num_bits.nil?
      @num_bits = (b1 >> 3)
      @num_bits
    end
    def num_bytes
      return @num_bytes unless @num_bytes.nil?
      @num_bytes = ((((num_bits * 4) - 3) + 7) / 8)
      @num_bytes
    end
    attr_reader :b1
    attr_reader :skip
  end
  class Tag < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @record_header = RecordHeader.new(@_io, self, @_root)
      case record_header.tag_type
      when :tag_type_abc_tag
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        io = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = AbcTagBody.new(io, self, @_root)
      else
        @tag_body = @_io.read_bytes(record_header.len)
      end
      self
    end
    attr_reader :record_header
    attr_reader :tag_body
    attr_reader :_raw_tag_body
  end
  class AbcTagBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_u4le
      @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      @abcdata = @_io.read_bytes_full
      self
    end
    attr_reader :flags
    attr_reader :name
    attr_reader :abcdata
  end
  class RecordHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tag_code_and_length = @_io.read_u2le
      if small_len == 63
        @big_len = @_io.read_s4le
      end
      self
    end
    def tag_type
      return @tag_type unless @tag_type.nil?
      @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE, (tag_code_and_length >> 6))
      @tag_type
    end
    def small_len
      return @small_len unless @small_len.nil?
      @small_len = (tag_code_and_length & 63)
      @small_len
    end
    def len
      return @len unless @len.nil?
      @len = (small_len == 63 ? big_len : small_len)
      @len
    end
    attr_reader :tag_code_and_length
    attr_reader :big_len
  end
  attr_reader :junk
  attr_reader :file_size
  attr_reader :body
  attr_reader :_raw__raw_body
  attr_reader :_raw_body
end
