# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A variable-length integer,
# in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
# See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
# 
# This variable-length integer format can store an integer `x` in any of the following ways:
# 
# * In a single byte,
#   if `0 <= x <= 0x7f`
#   (7-bit unsigned integer)
# * In 2 bytes,
#   if `-0x4000 <= x <= 0x3eff`
#   (15-bit signed integer with the highest `0x100` values unavailable)
# * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
#   (32-bit signed integer)
# 
# In practice,
# values are always stored in the smallest possible format,
# but technically any of the larger formats could be used as well.
# @see https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/common.py Source
class DcmpVariableLengthInteger < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @first = @_io.read_u1
    if first >= 128
      case first
      when 255
        @more = @_io.read_s4be
      else
        @more = @_io.read_u1
      end
    end
    self
  end

  ##
  # The decoded value of the variable-length integer.
  def value
    return @value unless @value.nil?
    @value = (first == 255 ? more : (first >= 128 ? (((first << 8) | more) - 49152) : first))
    @value
  end

  ##
  # The first byte of the variable-length integer.
  # This determines which storage format is used.
  # 
  # * For the 1-byte format,
  #   this encodes the entire value of the value.
  # * For the 2-byte format,
  #   this encodes the high 7 bits of the value,
  #   minus `0xc0`.
  #   The highest bit of the value,
  #   i. e. the second-highest bit of this field,
  #   is the sign bit.
  # * For the 5-byte format,
  #   this is always `0xff`.
  attr_reader :first

  ##
  # The remaining bytes of the variable-length integer.
  # 
  # * For the 1-byte format,
  #   this is not present.
  # * For the 2-byte format,
  #   this encodes the low 8 bits of the value.
  # * For the 5-byte format,
  #   this encodes the entire value.
  attr_reader :more
end
