# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
# Rules) is a standard-backed serialization scheme used in many
# different use-cases. Particularly popular usage scenarios are X.509
# certificates and some telecommunication / networking protocols.
# 
# DER is self-describing encoding scheme which allows representation
# of simple, atomic data elements, such as strings and numbers, and
# complex objects, such as sequences of other elements.
# 
# DER is a subset of BER (Basic Encoding Rules), with an emphasis on
# being non-ambiguous: there's always exactly one canonical way to
# encode a data structure defined in terms of ASN.1 using DER.
# 
# This spec allows full parsing of format syntax, but to understand
# the semantics, one would typically require a dictionary of Object
# Identifiers (OIDs), to match OID bodies against some human-readable
# list of constants. OIDs are covered by many different standards,
# so typically it's simpler to use a pre-compiled list of them, such
# as:
# 
# * <https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg>
# * <http://oid-info.com/>
# * <https://www.alvestrand.no/objectid/top.html>
# @see https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&lang=en Source
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
    when :type_tag_printable_string
      @_raw_body = @_io.read_bytes(len.result)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodyPrintableString.new(_io__raw_body, self, @_root)
    when :type_tag_sequence_10
      @_raw_body = @_io.read_bytes(len.result)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodySequence.new(_io__raw_body, self, @_root)
    when :type_tag_set
      @_raw_body = @_io.read_bytes(len.result)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodySequence.new(_io__raw_body, self, @_root)
    when :type_tag_sequence_30
      @_raw_body = @_io.read_bytes(len.result)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodySequence.new(_io__raw_body, self, @_root)
    when :type_tag_utf8string
      @_raw_body = @_io.read_bytes(len.result)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodyUtf8string.new(_io__raw_body, self, @_root)
    when :type_tag_object_id
      @_raw_body = @_io.read_bytes(len.result)
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = BodyObjectId.new(_io__raw_body, self, @_root)
    else
      @body = @_io.read_bytes(len.result)
    end
    self
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

  ##
  # @see https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier Source
  class BodyObjectId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @first_and_second = @_io.read_u1
      @rest = @_io.read_bytes_full
      self
    end
    def first
      return @first unless @first.nil?
      @first = (first_and_second / 40)
      @first
    end
    def second
      return @second unless @second.nil?
      @second = (first_and_second % 40)
      @second
    end
    attr_reader :first_and_second
    attr_reader :rest
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
      if b1 == 129
        @int1 = @_io.read_u1
      end
      self
    end
    def result
      return @result unless @result.nil?
      @result = (b1 == 129 ? int1 : (b1 == 130 ? int2 : b1))
      @result
    end
    attr_reader :b1
    attr_reader :int2
    attr_reader :int1
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
