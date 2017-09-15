# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Google Protocol Buffers (AKA protobuf) is a popular data
# serialization scheme used for communication protocols, data storage,
# etc. There are implementations are available for almost every
# popular language. The focus points of this scheme are brevity (data
# is encoded in a very size-efficient manner) and extensibility (one
# can add keys to the structure, while keeping it readable in previous
# version of software).
# 
# Protobuf uses semi-self-describing encoding scheme for its
# messages. It means that it is possible to parse overall structure of
# the message (skipping over fields one can't understand), but to
# fully understand the message, one needs a protocol definition file
# (`.proto`). To be specific:
# 
# * "Keys" in key-value pairs provided in the message are identified
#   only with an integer "field tag". `.proto` file provides info on
#   which symbolic field names these field tags map to.
# * "Keys" also provide something called "wire type". It's not a data
#   type in its common sense (i.e. you can't, for example, distinguish
#   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
#   it's enough information to determine how many bytes to
#   parse. Interpretation of the value should be done according to the
#   type specified in `.proto` file.
# * There's no direct information on which fields are optional /
#   required, which fields may be repeated or constitute a map, what
#   restrictions are placed on fields usage in a single message, what
#   are the fields' default values, etc, etc.
# @see https://developers.google.com/protocol-buffers/docs/encoding Source
class GoogleProtobuf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @pairs = []
    i = 0
    while not @_io.eof?
      @pairs << Pair.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # Key-value pair
  class Pair < Kaitai::Struct::Struct

    WIRE_TYPES = {
      0 => :wire_types_varint,
      1 => :wire_types_bit_64,
      2 => :wire_types_len_delimited,
      3 => :wire_types_group_start,
      4 => :wire_types_group_end,
      5 => :wire_types_bit_32,
    }
    I__WIRE_TYPES = WIRE_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @key = VlqBase128Le.new(@_io)
      case wire_type
      when :wire_types_varint
        @value = VlqBase128Le.new(@_io)
      when :wire_types_len_delimited
        @value = DelimitedBytes.new(@_io, self, @_root)
      when :wire_types_bit_64
        @value = @_io.read_u8le
      when :wire_types_bit_32
        @value = @_io.read_u4le
      end
      self
    end

    ##
    # "Wire type" is a part of the "key" that carries enough
    # information to parse value from the wire, i.e. read correct
    # amount of bytes, but there's not enough informaton to
    # interprete in unambiguously. For example, one can't clearly
    # distinguish 64-bit fixed-sized integers from 64-bit floats,
    # signed zigzag-encoded varints from regular unsigned varints,
    # arbitrary bytes from UTF-8 encoded strings, etc.
    def wire_type
      return @wire_type unless @wire_type.nil?
      @wire_type = Kaitai::Struct::Stream::resolve_enum(WIRE_TYPES, (key.value & 7))
      @wire_type
    end

    ##
    # Identifies a field of protocol. One can look up symbolic
    # field name in a `.proto` file by this field tag.
    def field_tag
      return @field_tag unless @field_tag.nil?
      @field_tag = (key.value >> 3)
      @field_tag
    end

    ##
    # Key is a bit-mapped variable-length integer: lower 3 bits
    # are used for "wire type", and everything higher designates
    # an integer "field tag".
    attr_reader :key

    ##
    # Value that corresponds to field identified by
    # `field_tag`. Type is determined approximately: there is
    # enough information to parse it unambiguously from a stream,
    # but further infromation from `.proto` file is required to
    # interprete it properly.
    attr_reader :value
  end
  class DelimitedBytes < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = VlqBase128Le.new(@_io)
      @body = @_io.read_bytes(len.value)
      self
    end
    attr_reader :len
    attr_reader :body
  end

  ##
  # Key-value pairs which constitute a message
  attr_reader :pairs
end
