# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A variable-length unsigned integer using base128 encoding. 1-byte groups
# consists of 1-bit flag of continuation and 7-bit value, and are ordered
# "most significant group first", i.e. in "big-endian" manner.
# 
# This particular encoding is specified and used in:
# 
# * Standard MIDI file format
# * ASN.1 BER encoding
# 
# More information on this encoding is available at
# https://en.wikipedia.org/wiki/Variable-length_quantity
# 
# This particular implementation supports serialized values to up 8 bytes long.
class VlqBase128Be < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @groups = []
    begin
      _ = Group.new(@_io, self, @_root)
      @groups << _
    end until !(_.has_next)
  end

  ##
  # One byte group, clearly divided into 7-bit "value" and 1-bit "has continuation
  # in the next byte" flag.
  class Group < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @b = @_io.read_u1
    end

    ##
    # If true, then we have more bytes to read
    def has_next
      return @has_next unless @has_next.nil?
      @has_next = (b & 128) != 0
      @has_next
    end

    ##
    # The 7-bit (base128) numeric value of this group
    def value
      return @value unless @value.nil?
      @value = (b & 127)
      @value
    end
    attr_reader :b
  end
  def last
    return @last unless @last.nil?
    @last = (groups.length - 1)
    @last
  end

  ##
  # Resulting value as normal integer
  def value
    return @value unless @value.nil?
    @value = (((((((groups[last].value + (last >= 1 ? (groups[(last - 1)].value << 7) : 0)) + (last >= 2 ? (groups[(last - 2)].value << 14) : 0)) + (last >= 3 ? (groups[(last - 3)].value << 21) : 0)) + (last >= 4 ? (groups[(last - 4)].value << 28) : 0)) + (last >= 5 ? (groups[(last - 5)].value << 35) : 0)) + (last >= 6 ? (groups[(last - 6)].value << 42) : 0)) + (last >= 7 ? (groups[(last - 7)].value << 49) : 0))
    @value
  end
  attr_reader :groups
end
