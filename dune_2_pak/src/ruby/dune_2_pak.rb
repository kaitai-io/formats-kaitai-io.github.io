# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Dune2Pak < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_dir = @_io.read_bytes(dir_size)
    _io__raw_dir = Kaitai::Struct::Stream.new(@_raw_dir)
    @dir = Files.new(_io__raw_dir, self, @_root)
    self
  end
  class Files < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @files = []
      i = 0
      while not @_io.eof?
        @files << File.new(@_io, self, @_root, i)
        i += 1
      end
      self
    end
    attr_reader :files
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      @ofs = @_io.read_u4le
      if ofs != 0
        @file_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      end
      self
    end
    def next_ofs0
      return @next_ofs0 unless @next_ofs0.nil?
      if ofs != 0
        @next_ofs0 = _root.dir.files[(idx + 1)].ofs
      end
      @next_ofs0
    end
    def next_ofs
      return @next_ofs unless @next_ofs.nil?
      if ofs != 0
        @next_ofs = (next_ofs0 == 0 ? _root._io.size : next_ofs0)
      end
      @next_ofs
    end
    def body
      return @body unless @body.nil?
      if ofs != 0
        io = _root._io
        _pos = io.pos
        io.seek(ofs)
        @body = io.read_bytes((next_ofs - ofs))
        io.seek(_pos)
      end
      @body
    end
    attr_reader :ofs
    attr_reader :file_name
    attr_reader :idx
  end
  def dir_size
    return @dir_size unless @dir_size.nil?
    _pos = @_io.pos
    @_io.seek(0)
    @dir_size = @_io.read_u4le
    @_io.seek(_pos)
    @dir_size
  end
  attr_reader :dir
  attr_reader :_raw_dir
end
