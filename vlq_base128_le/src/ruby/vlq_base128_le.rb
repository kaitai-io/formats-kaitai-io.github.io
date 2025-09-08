# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
# consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
# "least significant group first", i.e. in "little-endian" manner.
# 
# This particular encoding is specified and used in:
# 
# * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
#   <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
# * Google Protocol Buffers, where it's called "Base 128 Varints".
#   <https://protobuf.dev/programming-guides/encoding/#varints>
# * Apache Lucene, where it's called "VInt"
#   <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
# * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
#   top of it for signed ints
#   <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>
# 
# More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>
# 
# This particular implementation supports integer values up to 64 bits (i.e. the
# maximum unsigned value supported is `2**64 - 1`), which implies that serialized
# values can be up to 10 bytes in length.
# 
# If the most significant 10th byte (`groups[9]`) is present, its `has_next`
# must be `false` (otherwise we would have 11 or more bytes, which is not
# supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
# represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
# since only integers up to 64 bits are supported). These restrictions are
# enforced by this implementation. They were inspired by the Protoscope tool,
# see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.
class VlqBase128Le < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @groups = []
    i = 0
    begin
      _ = Group.new(@_io, self, @_root, i, (i != 0 ? groups[i - 1].interm_value : 0), (i != 0 ? (i == 9 ? 9223372036854775808 : groups[i - 1].multiplier * 128) : 1))
      @groups << _
      i += 1
    end until !(_.has_next)
    self
  end

  ##
  # One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
  class Group < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, idx, prev_interm_value, multiplier)
      super(_io, _parent, _root)
      @idx = idx
      @prev_interm_value = prev_interm_value
      @multiplier = multiplier
      _read
    end

    def _read
      @has_next = @_io.read_bits_int_be(1) != 0
      raise Kaitai::Struct::ValidationNotEqualError.new((idx == 9 ? false : has_next), @has_next, @_io, "/types/group/seq/0") if not @has_next == (idx == 9 ? false : has_next)
      @value = @_io.read_bits_int_be(7)
      raise Kaitai::Struct::ValidationGreaterThanError.new((idx == 9 ? 1 : 127), @value, @_io, "/types/group/seq/1") if not @value <= (idx == 9 ? 1 : 127)
      self
    end
    def interm_value
      return @interm_value unless @interm_value.nil?
      @interm_value = (prev_interm_value + value * multiplier)
      @interm_value
    end

    ##
    # If `true`, then we have more bytes to read.
    # 
    # Since this implementation only supports serialized values up to 10
    # bytes, this must be `false` in the 10th group (`groups[9]`).
    attr_reader :has_next

    ##
    # The 7-bit (base128) numeric value chunk of this group
    # 
    # Since this implementation only supports integer values up to 64 bits,
    # the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
    # (otherwise the width of the represented value would be 65 bits or
    # more, which is not supported).
    attr_reader :value
    attr_reader :idx
    attr_reader :prev_interm_value
    attr_reader :multiplier
  end
  def len
    return @len unless @len.nil?
    @len = groups.length
    @len
  end
  def sign_bit
    return @sign_bit unless @sign_bit.nil?
    @sign_bit = (len == 10 ? 9223372036854775808 : groups.last.multiplier * 64)
    @sign_bit
  end

  ##
  # Resulting unsigned value as normal integer
  def value
    return @value unless @value.nil?
    @value = groups.last.interm_value
    @value
  end
  def value_signed
    return @value_signed unless @value_signed.nil?
    @value_signed = ( ((sign_bit > 0) && (value >= sign_bit))  ? -((sign_bit - (value - sign_bit))) : value)
    @value_signed
  end
  attr_reader :groups
end
