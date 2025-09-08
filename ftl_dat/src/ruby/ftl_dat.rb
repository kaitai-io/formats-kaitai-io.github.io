# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class FtlDat < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @num_files = @_io.read_u4le
    @files = []
    (num_files).times { |i|
      @files << File.new(@_io, self, @_root)
    }
    self
  end
  class File < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_meta = @_io.read_u4le
      self
    end
    def meta
      return @meta unless @meta.nil?
      if ofs_meta != 0
        _pos = @_io.pos
        @_io.seek(ofs_meta)
        @meta = Meta.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @meta
    end
    attr_reader :ofs_meta
  end
  class Meta < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_file = @_io.read_u4le
      @len_filename = @_io.read_u4le
      @filename = (@_io.read_bytes(len_filename)).force_encoding("UTF-8")
      @body = @_io.read_bytes(len_file)
      self
    end
    attr_reader :len_file
    attr_reader :len_filename
    attr_reader :filename
    attr_reader :body
  end

  ##
  # Number of files in the archive
  attr_reader :num_files
  attr_reader :files
end
