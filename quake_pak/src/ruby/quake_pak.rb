# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class QuakePak < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.ensure_fixed_contents([80, 65, 67, 75].pack('C*'))
    @index_ofs = @_io.read_u4le
    @index_size = @_io.read_u4le
    self
  end
  class IndexStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      while not @_io.eof?
        @entries << IndexEntry.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :entries
  end
  class IndexEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = (Kaitai::Struct::Stream::bytes_terminate(Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(56), 0), 0, false)).force_encoding("UTF-8")
      @ofs = @_io.read_u4le
      @size = @_io.read_u4le
      self
    end
    def body
      return @body unless @body.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs)
      @body = io.read_bytes(size)
      io.seek(_pos)
      @body
    end
    attr_reader :name
    attr_reader :ofs
    attr_reader :size
  end
  def index
    return @index unless @index.nil?
    _pos = @_io.pos
    @_io.seek(index_ofs)
    @_raw_index = @_io.read_bytes(index_size)
    io = Kaitai::Struct::Stream.new(@_raw_index)
    @index = IndexStruct.new(io, self, @_root)
    @_io.seek(_pos)
    @index
  end
  attr_reader :magic
  attr_reader :index_ofs
  attr_reader :index_size
  attr_reader :_raw_index
end
