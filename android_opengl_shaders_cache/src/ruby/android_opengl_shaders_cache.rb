# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Android apps using directly or indirectly OpenGL cache compiled shaders
# into com.android.opengl.shaders_cache file.
# @see https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp Source
class AndroidOpenglShadersCache < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([69, 71, 76, 36].pack('C*'), magic, _io, "/seq/0") if not magic == [69, 71, 76, 36].pack('C*')
    @crc32 = @_io.read_u4le
    @_raw_contents = @_io.read_bytes_full
    _io__raw_contents = Kaitai::Struct::Stream.new(@_raw_contents)
    @contents = Cache.new(_io__raw_contents, self, @_root)
    self
  end
  class Alignment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @alignment = @_io.read_bytes(((_io.pos + 3) & (~3 - _io.pos)))
      self
    end

    ##
    # garbage from memory
    attr_reader :alignment
  end
  class PrefixedString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_str = @_io.read_u4le
      @str = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(len_str), 0, false)).force_encoding("ascii")
      @alignment = Alignment.new(@_io, self, @_root)
      self
    end
    attr_reader :len_str
    attr_reader :str
    attr_reader :alignment
  end

  ##
  # @see https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp Source
  class Cache < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([36, 98, 66, 95].pack('C*'), magic, _io, "/types/cache/seq/0") if not magic == [36, 98, 66, 95].pack('C*')
      @version = @_io.read_u4le
      @device_version = @_io.read_u4le
      @num_entries = @_io.read_u4le
      if version >= 3
        @build_id = PrefixedString.new(@_io, self, @_root)
      end
      @entries = []
      (num_entries).times { |i|
        @entries << Entry.new(@_io, self, @_root)
      }
      self
    end
    class Entry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_key = @_io.read_u4le
        @len_value = @_io.read_u4le
        @key = @_io.read_bytes(len_key)
        @value = @_io.read_bytes(len_value)
        @alignment = Alignment.new(@_io, self, @_root)
        self
      end
      attr_reader :len_key
      attr_reader :len_value
      attr_reader :key
      attr_reader :value
      attr_reader :alignment
    end
    attr_reader :magic
    attr_reader :version
    attr_reader :device_version
    attr_reader :num_entries
    attr_reader :build_id
    attr_reader :entries
  end
  attr_reader :magic

  ##
  # crc32 of `contents`
  attr_reader :crc32
  attr_reader :contents
  attr_reader :_raw_contents
end
