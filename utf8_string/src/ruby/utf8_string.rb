# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# UTF-8 is a popular character encoding scheme that allows to
# represent strings as sequence of code points defined in Unicode
# standard. Its features are:
# 
# * variable width (i.e. one code point might be represented by 1 to 4
#   bytes)
# * backward compatiblity with ASCII
# * basic validity checking (and thus distinguishing from other legacy
#   8-bit encodings)
# * maintaining sort order of codepoints if sorted as a byte array
# 
# WARNING: For the vast majority of practical purposes of format
# definitions in Kaitai Struct, you'd likely NOT want to use this and
# rather just use `type: str` with `encoding: utf8`. That will use
# native string implementations, which are most likely more efficient
# and will give you native language strings, rather than an array of
# individual codepoints.  This format definition is provided mostly
# for educational / research purposes.
class Utf8String < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @codepoints = []
    i = 0
    while not @_io.eof?
      @codepoints << Utf8Codepoint.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Utf8Codepoint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @byte1 = @_io.read_u1
      if len >= 2
        @byte2 = @_io.read_u1
      end
      if len >= 3
        @byte3 = @_io.read_u1
      end
      if len >= 4
        @byte4 = @_io.read_u1
      end
      self
    end
    def raw1
      return @raw1 unless @raw1.nil?
      @raw1 = (byte1 & (len == 1 ? 127 : (len == 2 ? 31 : (len == 3 ? 15 : (len == 4 ? 7 : 0)))))
      @raw1
    end
    def raw4
      return @raw4 unless @raw4.nil?
      if len >= 4
        @raw4 = (byte4 & 63)
      end
      @raw4
    end
    def raw3
      return @raw3 unless @raw3.nil?
      if len >= 3
        @raw3 = (byte3 & 63)
      end
      @raw3
    end
    def value_as_int
      return @value_as_int unless @value_as_int.nil?
      @value_as_int = (len == 1 ? raw1 : (len == 2 ? ((raw1 << 6) | raw2) : (len == 3 ? (((raw1 << 12) | (raw2 << 6)) | raw3) : (len == 4 ? ((((raw1 << 18) | (raw2 << 12)) | (raw3 << 6)) | raw4) : -1))))
      @value_as_int
    end
    def raw2
      return @raw2 unless @raw2.nil?
      if len >= 2
        @raw2 = (byte2 & 63)
      end
      @raw2
    end
    def len
      return @len unless @len.nil?
      @len = ((byte1 & 128) == 0 ? 1 : ((byte1 & 224) == 192 ? 2 : ((byte1 & 240) == 224 ? 3 : ((byte1 & 248) == 240 ? 4 : -1))))
      @len
    end
    attr_reader :byte1
    attr_reader :byte2
    attr_reader :byte3
    attr_reader :byte4
  end
  attr_reader :codepoints
end
