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
# rather just use `type: str` with `encoding: utf-8`. That will use
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
      @codepoints << Utf8Codepoint.new(@_io, self, @_root, _io.pos)
      i += 1
    end
    self
  end
  class Utf8Codepoint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, ofs)
      super(_io, _parent, _root)
      @ofs = ofs
      _read
    end

    def _read
      @bytes = @_io.read_bytes(len_bytes)
      self
    end
    def raw1
      return @raw1 unless @raw1.nil?
      if len_bytes >= 2
        @raw1 = (bytes[1].ord & 63)
      end
      @raw1
    end
    def len_bytes
      return @len_bytes unless @len_bytes.nil?
      @len_bytes = ((byte0 & 128) == 0 ? 1 : ((byte0 & 224) == 192 ? 2 : ((byte0 & 240) == 224 ? 3 : ((byte0 & 248) == 240 ? 4 : -1))))
      @len_bytes
    end
    def raw3
      return @raw3 unless @raw3.nil?
      if len_bytes >= 4
        @raw3 = (bytes[3].ord & 63)
      end
      @raw3
    end
    def value_as_int
      return @value_as_int unless @value_as_int.nil?
      @value_as_int = (len_bytes == 1 ? raw0 : (len_bytes == 2 ? ((raw0 << 6) | raw1) : (len_bytes == 3 ? (((raw0 << 12) | (raw1 << 6)) | raw2) : (len_bytes == 4 ? ((((raw0 << 18) | (raw1 << 12)) | (raw2 << 6)) | raw3) : -1))))
      @value_as_int
    end
    def raw0
      return @raw0 unless @raw0.nil?
      @raw0 = (bytes[0].ord & (len_bytes == 1 ? 127 : (len_bytes == 2 ? 31 : (len_bytes == 3 ? 15 : (len_bytes == 4 ? 7 : 0)))))
      @raw0
    end
    def byte0
      return @byte0 unless @byte0.nil?
      _pos = @_io.pos
      @_io.seek(ofs)
      @byte0 = @_io.read_u1
      @_io.seek(_pos)
      @byte0
    end
    def raw2
      return @raw2 unless @raw2.nil?
      if len_bytes >= 3
        @raw2 = (bytes[2].ord & 63)
      end
      @raw2
    end
    attr_reader :bytes
    attr_reader :ofs
  end
  attr_reader :codepoints
end
