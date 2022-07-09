# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
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
    self
  end
  class Pstr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @str = (@_io.read_bytes(size)).force_encoding("ASCII")
      self
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
      self
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
      @files = []
      (file_count).times { |i|
        @files << File.new(@_io, self, @_root)
      }
      self
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
      @flags = Kaitai::Struct::Stream::resolve_enum(Fallout2Dat::COMPRESSION, @_io.read_u1)
      @size_unpacked = @_io.read_u4le
      @size_packed = @_io.read_u4le
      @offset = @_io.read_u4le
      self
    end
    def contents_raw
      return @contents_raw unless @contents_raw.nil?
      if flags == :compression_none
        io = _root._io
        _pos = io.pos
        io.seek(offset)
        @contents_raw = io.read_bytes(size_unpacked)
        io.seek(_pos)
      end
      @contents_raw
    end
    def contents_zlib
      return @contents_zlib unless @contents_zlib.nil?
      if flags == :compression_zlib
        io = _root._io
        _pos = io.pos
        io.seek(offset)
        @_raw_contents_zlib = io.read_bytes(size_packed)
        @contents_zlib = Zlib::Inflate.inflate(@_raw_contents_zlib)
        io.seek(_pos)
      end
      @contents_zlib
    end
    def contents
      return @contents unless @contents.nil?
      if  ((flags == :compression_zlib) || (flags == :compression_none)) 
        @contents = (flags == :compression_zlib ? contents_zlib : contents_raw)
      end
      @contents
    end
    attr_reader :name
    attr_reader :flags
    attr_reader :size_unpacked
    attr_reader :size_packed
    attr_reader :offset
    attr_reader :_raw_contents_zlib
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
