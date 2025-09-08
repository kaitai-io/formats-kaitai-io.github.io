# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic) Source
class HeroesOfMightAndMagicAgg < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @num_files = @_io.read_u2le
    @entries = []
    (num_files).times { |i|
      @entries << Entry.new(@_io, self, @_root)
    }
    self
  end
  class Entry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @hash = @_io.read_u2le
      @offset = @_io.read_u4le
      @size = @_io.read_u4le
      @size2 = @_io.read_u4le
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(offset)
      @body = @_io.read_bytes(size)
      @_io.seek(_pos)
      @body
    end
    attr_reader :hash
    attr_reader :offset
    attr_reader :size
    attr_reader :size2
  end
  class Filename < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @str = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :str
  end
  def filenames
    return @filenames unless @filenames.nil?
    _pos = @_io.pos
    @_io.seek(entries.last.offset + entries.last.size)
    @_raw_filenames = []
    @filenames = []
    (num_files).times { |i|
      _io_filenames = @_io.substream(15)
      @filenames << Filename.new(_io_filenames, self, @_root)
    }
    @_io.seek(_pos)
    @filenames
  end
  attr_reader :num_files
  attr_reader :entries
  attr_reader :_raw_filenames
end
