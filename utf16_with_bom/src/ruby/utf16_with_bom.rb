# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A simple wrapper which allows to read a UTF-16 encoded string that starts
# with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
# encoding, which can be either big-endian (BE) or little-endian (LE).
# 
# Use:
# 
# * `value` to get the string value with BOM stripped, regardless of endianness.
# * `is_be` and `is_le` to check the endianness indicated by the BOM.
# * `bom` to check the raw byte order mark.
# @see '' - https://en.wikipedia.org/wiki/Byte_order_mark
class Utf16WithBom < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @bom = @_io.read_bytes(2)
    raise Kaitai::Struct::ValidationNotAnyOfError.new(@bom, @_io, "/seq/0") if not  ((@bom == [254, 255].pack('C*')) || (@bom == [255, 254].pack('C*'))) 
    if is_be
      @str_be = (@_io.read_bytes_full).force_encoding("UTF-16BE").encode('UTF-8')
    end
    if is_le
      @str_le = (@_io.read_bytes_full).force_encoding("UTF-16LE").encode('UTF-8')
    end
    self
  end

  ##
  # True if the byte order mark indicates big-endian UTF-16 encoding.
  def is_be
    return @is_be unless @is_be.nil?
    @is_be = bom == [254, 255].pack('C*')
    @is_be
  end

  ##
  # True if the byte order mark indicates little-endian UTF-16 encoding.
  def is_le
    return @is_le unless @is_le.nil?
    @is_le = bom == [255, 254].pack('C*')
    @is_le
  end

  ##
  # The string value with BOM stripped, regardless of endianness.
  def value
    return @value unless @value.nil?
    @value = (is_be ? str_be : str_le)
    @value
  end

  ##
  # The byte order mark (BOM) is a special marker at the beginning of the
  # string that indicates the endianness of the UTF-16 encoding. The
  # character U+FEFF is used as the BOM, and its byte representation differs
  # based on endianness:
  # 
  # * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
  # * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
  # 
  # This implementation checks for the presence of a valid BOM and strips it
  # from the resulting string value.
  attr_reader :bom
  attr_reader :str_be
  attr_reader :str_le
end
