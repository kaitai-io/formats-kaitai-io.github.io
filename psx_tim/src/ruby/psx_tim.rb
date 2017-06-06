# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class PsxTim < Kaitai::Struct::Struct

  BPP_TYPE = {
    0 => :bpp_type_bpp_4,
    1 => :bpp_type_bpp_8,
    2 => :bpp_type_bpp_16,
    3 => :bpp_type_bpp_24,
  }
  I__BPP_TYPE = BPP_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @magic = @_io.ensure_fixed_contents([16, 0, 0, 0].pack('C*'))
    @flags = @_io.read_u4le
    if has_clut
      @clut = Bitmap.new(@_io, self, @_root)
    end
    @img = Bitmap.new(@_io, self, @_root)
  end
  class Bitmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @len = @_io.read_u4le
      @origin_x = @_io.read_u2le
      @origin_y = @_io.read_u2le
      @width = @_io.read_u2le
      @height = @_io.read_u2le
      @body = @_io.read_bytes((len - 12))
    end
    attr_reader :len
    attr_reader :origin_x
    attr_reader :origin_y
    attr_reader :width
    attr_reader :height
    attr_reader :body
  end
  def has_clut
    return @has_clut unless @has_clut.nil?
    @has_clut = (flags & 8) != 0
    @has_clut
  end
  def bpp
    return @bpp unless @bpp.nil?
    @bpp = (flags & 3)
    @bpp
  end
  attr_reader :magic

  ##
  # Encodes bits-per-pixel and whether CLUT is present in a file or not
  attr_reader :flags

  ##
  # CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
  attr_reader :clut
  attr_reader :img
end
