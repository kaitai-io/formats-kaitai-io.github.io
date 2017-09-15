# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Asn1Der < Kaitai::Struct::Struct

  TYPE_TAG = {
    0 => :type_tag_end_of_content,
    1 => :type_tag_boolean,
    2 => :type_tag_integer,
    3 => :type_tag_bit_string,
    4 => :type_tag_octet_string,
    5 => :type_tag_null_value,
    6 => :type_tag_object_id,
    7 => :type_tag_object_descriptor,
    8 => :type_tag_external,
    9 => :type_tag_real,
    10 => :type_tag_enumerated,
    11 => :type_tag_embedded_pdv,
    12 => :type_tag_utf8string,
    13 => :type_tag_relative_oid,
    16 => :type_tag_sequence_10,
    19 => :type_tag_printable_string,
    22 => :type_tag_ia5string,
    48 => :type_tag_sequence_30,
    49 => :type_tag_set,
  }
  I__TYPE_TAG = TYPE_TAG.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @type_tag = Kaitai::Struct::Stream::resolve_enum(TYPE_TAG, @_io.read_u1)
    @len = LenEncoded.new(@_io, self, @_root)
    case type_tag
    when :type_tag_sequence_30
      @_raw_body = @_io.read_bytes(len.result)
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodySequence.new(io, self, @_root)
    when :type_tag_sequence_10
      @_raw_body = @_io.read_bytes(len.result)
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodySequence.new(io, self, @_root)
    when :type_tag_utf8string
      @_raw_body = @_io.read_bytes(len.result)
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodyUtf8string.new(io, self, @_root)
    when :type_tag_printable_string
      @_raw_body = @_io.read_bytes(len.result)
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodyPrintableString.new(io, self, @_root)
    when :type_tag_set
      @_raw_body = @_io.read_bytes(len.result)
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodySequence.new(io, self, @_root)
    else
      @body = @_io.read_bytes(len.result)
    end
    self
  end
  class LenEncoded < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      if b1 == 130
        @int2 = @_io.read_u2be
      end
      self
    end
    def result
      return @result unless @result.nil?
      @result = ((b1 & 128) == 0 ? b1 : int2)
      @result
    end
    attr_reader :b1
    attr_reader :int2
  end
  class BodySequence < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Asn1Der.new(@_io)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class BodyUtf8string < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @str = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :str
  end
  class BodyPrintableString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @str = (@_io.read_bytes_full).force_encoding("ASCII")
      self
    end
    attr_reader :str
  end
  attr_reader :type_tag
  attr_reader :len
  attr_reader :body
  attr_reader :_raw_body
end
