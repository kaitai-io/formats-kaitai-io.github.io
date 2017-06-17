# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Fallout2Dat < Kaitai::Struct::Struct

  COMPRESSION = {
    0 => :compression_none,
    1 => :compression_zlib,
  }
  I__COMPRESSION = COMPRESSION.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
  end
  class Pstr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @size = @_io.read_u4le
      @str = (@_io.read_bytes(size)).force_encoding("ASCII")
    end
    attr_reader :size
    attr_reader :str
  end
  class Footer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @index_size = @_io.read_u4le
      @file_size = @_io.read_u4le
    end
    attr_reader :index_size
    attr_reader :file_size
  end
  class Index < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @file_count = @_io.read_u4le
      @files = Array.new(file_count)
      (file_count).times { |i|
        @files[i] = File.new(@_io, self, @_root)
      }
    end
    attr_reader :file_count
    attr_reader :files
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @name = Pstr.new(@_io, self, @_root)
      @flags = Kaitai::Struct::Stream::resolve_enum(COMPRESSION, @_io.read_u1)
      @size_unpacked = @_io.read_u4le
      @size_packed = @_io.read_u4le
      @offset = @_io.read_u4le
    end
    def contents
      return @contents unless @contents.nil?
      if flags == :compression_zlib
        io = _root._io
        _pos = io.pos
        io.seek(offset)
        @_raw_contents = io.read_bytes(size_packed)
        @contents = Zlib::Inflate.inflate(@_raw_contents)
        io.seek(_pos)
      end
      @contents
    end
    attr_reader :name
    attr_reader :flags
    attr_reader :size_unpacked
    attr_reader :size_packed
    attr_reader :offset
    attr_reader :_raw_contents
  end
  def footer
    return @footer unless @footer.nil?
    _pos = @_io.pos
    @_io.seek((_io.size - 8))
    @footer = Footer.new(@_io, self, @_root)
    @_io.seek(_pos)
    @footer
  end
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek(((_io.size - 8) - footer.index_size))
    @index = Index.new(@_io, self, @_root)
    @_io.seek(_pos)
    @index
  end
end
