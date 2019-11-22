# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Android apps using directly or indirectly OpenGL cache compiled shaders into com.android.opengl.shaders_cache file.
# @see https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp Source
class AndroidOpenglShadersCache < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @signature = @_io.ensure_fixed_contents([69, 71, 76, 36].pack('C*'))
    @crc32 = @_io.read_u4le
    @_raw_contents = @_io.read_bytes_full
    io = Kaitai::Struct::Stream.new(@_raw_contents)
    @contents = Cache.new(io, self, @_root)
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
  class String < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length = @_io.read_u4le
      @str = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(length), 0, false)).force_encoding("ascii")
      @alignment = Alignment.new(@_io, self, @_root)
      self
    end
    attr_reader :length
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
      @signature = @_io.ensure_fixed_contents([36, 98, 66, 95].pack('C*'))
      @version = @_io.read_u4le
      @device_version = @_io.read_u4le
      @count_of_entries = @_io.read_u4le
      if version >= 3
        @build_id = String.new(@_io, self, @_root)
      end
      @entries = Array.new(count_of_entries)
      (count_of_entries).times { |i|
        @entries[i] = Entry.new(@_io, self, @_root)
      }
      self
    end
    class Entry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @key_size = @_io.read_u4le
        @value_size = @_io.read_u4le
        @key = @_io.read_bytes(key_size)
        @value = @_io.read_bytes(value_size)
        @alignment = Alignment.new(@_io, self, @_root)
        self
      end
      attr_reader :key_size
      attr_reader :value_size
      attr_reader :key
      attr_reader :value
      attr_reader :alignment
    end
    attr_reader :signature
    attr_reader :version
    attr_reader :device_version
    attr_reader :count_of_entries
    attr_reader :build_id
    attr_reader :entries
  end
  attr_reader :signature

  ##
  # crc32 of `contents`
  attr_reader :crc32
  attr_reader :contents
  attr_reader :_raw_contents
end
