# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class HeroesOfMightAndMagicBmp < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_u2le
    @width = @_io.read_u2le
    @height = @_io.read_u2le
    @data = @_io.read_bytes(width * height)
    self
  end
  attr_reader :magic
  attr_reader :width
  attr_reader :height
  attr_reader :data
end
