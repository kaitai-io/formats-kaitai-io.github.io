# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://quakewiki.org/wiki/.pak#Format_specification Source
class QuakePak < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.ensure_fixed_contents([80, 65, 67, 75].pack('C*'))
    @ofs_index = @_io.read_u4le
    @len_index = @_io.read_u4le
    self
  end
  class IndexStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << IndexEntry.new(@_io, self, @_root)
        i += 1
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
    @_io.seek(ofs_index)
    @_raw_index = @_io.read_bytes(len_index)
    _io__raw_index = Kaitai::Struct::Stream.new(@_raw_index)
    @index = IndexStruct.new(_io__raw_index, self, @_root)
    @_io.seek(_pos)
    @index
  end
  attr_reader :magic
  attr_reader :ofs_index
  attr_reader :len_index
  attr_reader :_raw_index
end
