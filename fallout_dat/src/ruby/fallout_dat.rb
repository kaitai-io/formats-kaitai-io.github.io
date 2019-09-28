# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class FalloutDat < Kaitai::Struct::Struct

  COMPRESSION = {
    32 => :compression_none,
    64 => :compression_lzss,
  }
  I__COMPRESSION = COMPRESSION.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @folder_count = @_io.read_u4be
    @unknown1 = @_io.read_u4be
    @unknown2 = @_io.read_u4be
    @timestamp = @_io.read_u4be
    @folder_names = Array.new(folder_count)
    (folder_count).times { |i|
      @folder_names[i] = Pstr.new(@_io, self, @_root)
    }
    @folders = Array.new(folder_count)
    (folder_count).times { |i|
      @folders[i] = Folder.new(@_io, self, @_root)
    }
    self
  end
  class Pstr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u1
      @str = (@_io.read_bytes(size)).force_encoding("ASCII")
      self
    end
    attr_reader :size
    attr_reader :str
  end
  class Folder < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_count = @_io.read_u4be
      @unknown = @_io.read_u4be
      @flags = @_io.read_u4be
      @timestamp = @_io.read_u4be
      @files = Array.new(file_count)
      (file_count).times { |i|
        @files[i] = File.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :file_count
    attr_reader :unknown
    attr_reader :flags
    attr_reader :timestamp
    attr_reader :files
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = Pstr.new(@_io, self, @_root)
      @flags = Kaitai::Struct::Stream::resolve_enum(FalloutDat::COMPRESSION, @_io.read_u4be)
      @offset = @_io.read_u4be
      @size_unpacked = @_io.read_u4be
      @size_packed = @_io.read_u4be
      self
    end
    def contents
      return @contents unless @contents.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      @contents = io.read_bytes((flags == :compression_none ? size_unpacked : size_packed))
      io.seek(_pos)
      @contents
    end
    attr_reader :name
    attr_reader :flags
    attr_reader :offset
    attr_reader :size_unpacked
    attr_reader :size_packed
  end
  attr_reader :folder_count
  attr_reader :unknown1
  attr_reader :unknown2
  attr_reader :timestamp
  attr_reader :folder_names
  attr_reader :folders
end
