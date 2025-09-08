# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# BCD (Binary Coded Decimals) is a common way to encode integer
# numbers in a way that makes human-readable output somewhat
# simpler. In this encoding scheme, every decimal digit is encoded as
# either a single byte (8 bits), or a nibble (half of a byte, 4
# bits). This obviously wastes a lot of bits, but it makes translation
# into human-readable string much easier than traditional
# binary-to-decimal conversion process, which includes lots of
# divisions by 10.
# 
# For example, encoding integer 31337 in 8-digit, 8 bits per digit,
# big endian order of digits BCD format yields
# 
# ```
# 00 00 00 03 01 03 03 07
# ```
# 
# Encoding the same integer as 8-digit, 4 bits per digit, little
# endian order BCD format would yield:
# 
# ```
# 73 31 30 00
# ```
# 
# Using this type of encoding in Kaitai Struct is pretty
# straightforward: one calls for this type, specifying desired
# encoding parameters, and gets result using either `as_int` or
# `as_str` attributes.
class Bcd < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil, num_digits, bits_per_digit, is_le)
    super(_io, _parent, _root || self)
    @num_digits = num_digits
    @bits_per_digit = bits_per_digit
    @is_le = is_le
    _read
  end

  def _read
    @digits = []
    (num_digits).times { |i|
      case bits_per_digit
      when 4
        @digits << @_io.read_bits_int_be(4)
      when 8
        @digits << @_io.read_u1
      end
    }
    self
  end

  ##
  # Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
  def as_int
    return @as_int unless @as_int.nil?
    @as_int = (is_le ? as_int_le : as_int_be)
    @as_int
  end

  ##
  # Value of this BCD number as integer (treating digit order as big-endian).
  def as_int_be
    return @as_int_be unless @as_int_be.nil?
    @as_int_be = digits[last_idx] + (num_digits < 2 ? 0 : digits[last_idx - 1] * 10 + (num_digits < 3 ? 0 : digits[last_idx - 2] * 100 + (num_digits < 4 ? 0 : digits[last_idx - 3] * 1000 + (num_digits < 5 ? 0 : digits[last_idx - 4] * 10000 + (num_digits < 6 ? 0 : digits[last_idx - 5] * 100000 + (num_digits < 7 ? 0 : digits[last_idx - 6] * 1000000 + (num_digits < 8 ? 0 : digits[last_idx - 7] * 10000000)))))))
    @as_int_be
  end

  ##
  # Value of this BCD number as integer (treating digit order as little-endian).
  def as_int_le
    return @as_int_le unless @as_int_le.nil?
    @as_int_le = digits[0] + (num_digits < 2 ? 0 : digits[1] * 10 + (num_digits < 3 ? 0 : digits[2] * 100 + (num_digits < 4 ? 0 : digits[3] * 1000 + (num_digits < 5 ? 0 : digits[4] * 10000 + (num_digits < 6 ? 0 : digits[5] * 100000 + (num_digits < 7 ? 0 : digits[6] * 1000000 + (num_digits < 8 ? 0 : digits[7] * 10000000)))))))
    @as_int_le
  end

  ##
  # Index of last digit (0-based).
  def last_idx
    return @last_idx unless @last_idx.nil?
    @last_idx = num_digits - 1
    @last_idx
  end
  attr_reader :digits

  ##
  # Number of digits in this BCD representation. Only values from 1 to 8 inclusive are supported.
  attr_reader :num_digits

  ##
  # Number of bits per digit. Only values of 4 and 8 are supported.
  attr_reader :bits_per_digit

  ##
  # Endianness used by this BCD representation. True means little-endian, false is for big-endian.
  attr_reader :is_le
end
