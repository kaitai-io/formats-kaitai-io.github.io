# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# CHG is a container format file used by
# [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
# package for analysis & design of reinforced concrete multi-storey
# buildings with arbitrary configuration in plan.
# 
# CHG is a simple container, which bundles several project files
# together.
# 
# Written and tested by Vladimir Shulzhitskiy, 2017
class MonomakhSaprChg < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @title = (@_io.read_bytes(10)).force_encoding("ascii")
    @ent = []
    i = 0
    while not @_io.eof?
      @ent << Block.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = (@_io.read_bytes(13)).force_encoding("ascii")
      @file_size = @_io.read_u8le
      @file = @_io.read_bytes(file_size)
      self
    end
    attr_reader :header
    attr_reader :file_size
    attr_reader :file
  end
  attr_reader :title
  attr_reader :ent
end
