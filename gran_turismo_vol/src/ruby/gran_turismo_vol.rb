# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class GranTurismoVol < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @magic = @_io.ensure_fixed_contents([71, 84, 70, 83, 0, 0, 0, 0].pack('C*'))
    @num_files = @_io.read_u2le
    @num_entries = @_io.read_u2le
    @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
    @offsets = Array.new(num_files)
    (num_files).times { |i|
      @offsets[i] = @_io.read_u4le
    }
  end
  class FileInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @timestamp = @_io.read_u4le
      @offset_idx = @_io.read_u2le
      @flags = @_io.read_u1
      @name = (Kaitai::Struct::Stream::bytes_terminate(Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(25), 0), 0, false)).force_encoding("ASCII")
    end
    def size
      return @size unless @size.nil?
      @size = ((_root.offsets[(offset_idx + 1)] & 4294965248) - _root.offsets[offset_idx])
      @size
    end
    def body
      return @body unless @body.nil?
      if !(is_dir)
        _pos = @_io.pos
        @_io.seek((_root.offsets[offset_idx] & 4294965248))
        @body = @_io.read_bytes(size)
        @_io.seek(_pos)
      end
      @body
    end
    def is_dir
      return @is_dir unless @is_dir.nil?
      @is_dir = (flags & 1) != 0
      @is_dir
    end
    def is_last_entry
      return @is_last_entry unless @is_last_entry.nil?
      @is_last_entry = (flags & 128) != 0
      @is_last_entry
    end
    attr_reader :timestamp
    attr_reader :offset_idx
    attr_reader :flags
    attr_reader :name
  end
  def ofs_dir
    return @ofs_dir unless @ofs_dir.nil?
    @ofs_dir = offsets[1]
    @ofs_dir
  end
  def files
    return @files unless @files.nil?
    _pos = @_io.pos
    @_io.seek((ofs_dir & 4294965248))
    @files = Array.new(_root.num_entries)
    (_root.num_entries).times { |i|
      @files[i] = FileInfo.new(@_io, self, @_root)
    }
    @_io.seek(_pos)
    @files
  end
  attr_reader :magic
  attr_reader :num_files
  attr_reader :num_entries
  attr_reader :reserved
  attr_reader :offsets
end
