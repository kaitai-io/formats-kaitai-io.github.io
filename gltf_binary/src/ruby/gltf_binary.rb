# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# glTF is a format for distribution of 3D models optimized for being used in software
# @see https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout Source
class GltfBinary < Kaitai::Struct::Struct

  CHUNK_TYPE = {
    5130562 => :chunk_type_bin,
    1313821514 => :chunk_type_json,
  }
  I__CHUNK_TYPE = CHUNK_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @chunks = []
    i = 0
    while not @_io.eof?
      @chunks << Chunk.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Bin < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :data
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_u4le
      @type = Kaitai::Struct::Stream::resolve_enum(GltfBinary::CHUNK_TYPE, @_io.read_u4le)
      case type
      when :chunk_type_bin
        _io_data = @_io.substream(len_data)
        @data = Bin.new(_io_data, self, @_root)
      when :chunk_type_json
        _io_data = @_io.substream(len_data)
        @data = Json.new(_io_data, self, @_root)
      else
        @data = @_io.read_bytes(len_data)
      end
      self
    end
    attr_reader :len_data
    attr_reader :type
    attr_reader :data
    attr_reader :_raw_data
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([103, 108, 84, 70].pack('C*'), @magic, @_io, "/types/header/seq/0") if not @magic == [103, 108, 84, 70].pack('C*')
      @version = @_io.read_u4le
      @length = @_io.read_u4le
      self
    end
    attr_reader :magic

    ##
    # Indicates the version of the Binary glTF container format.
    # For this specification, should be set to 2.
    attr_reader :version

    ##
    # Total length of the Binary glTF, including Header and all Chunks, in bytes.
    attr_reader :length
  end
  class Json < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end

    ##
    # This is where GLB deviates from being an elegant format.
    # To parse the rest of the file, you have to parse the JSON first.
    attr_reader :data
  end
  attr_reader :header
  attr_reader :chunks
end
