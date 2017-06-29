# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class FtlDat < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @num_files = @_io.read_u4le
    @files = Array.new(num_files)
    (num_files).times { |i|
      @files[i] = File.new(@_io, self, @_root)
    }
    self
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @meta_ofs = @_io.read_u4le
      self
    end
    def meta
      return @meta unless @meta.nil?
      if meta_ofs != 0
        _pos = @_io.pos
        @_io.seek(meta_ofs)
        @meta = Meta.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @meta
    end
    attr_reader :meta_ofs
  end
  class Meta < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_size = @_io.read_u4le
      @filename_size = @_io.read_u4le
      @filename = (@_io.read_bytes(filename_size)).force_encoding("UTF-8")
      @body = @_io.read_bytes(file_size)
      self
    end
    attr_reader :file_size
    attr_reader :filename_size
    attr_reader :filename
    attr_reader :body
  end

  ##
  # Number of files in the archive
  attr_reader :num_files
  attr_reader :files
end
