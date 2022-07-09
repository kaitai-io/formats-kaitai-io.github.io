# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The Android sparse format is a format to more efficiently store files
# for for example firmware updates to save on bandwidth. Files in sparse
# format first have to be converted back to their original format.
# 
# A tool to create images for testing can be found in the Android source code tree:
# 
# <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
# 
# Note: this is not the same as the Android sparse data image format.
# @see https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h Source
# @see https://source.android.com/devices/bootloader/images#sparse-image-format Source
class AndroidSparse < Kaitai::Struct::Struct

  CHUNK_TYPES = {
    51905 => :chunk_types_raw,
    51906 => :chunk_types_fill,
    51907 => :chunk_types_dont_care,
    51908 => :chunk_types_crc32,
  }
  I__CHUNK_TYPES = CHUNK_TYPES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header_prefix = FileHeaderPrefix.new(@_io, self, @_root)
    @_raw_header = @_io.read_bytes((header_prefix.len_header - 10))
    _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
    @header = FileHeader.new(_io__raw_header, self, @_root)
    @chunks = []
    (header.num_chunks).times { |i|
      @chunks << Chunk.new(@_io, self, @_root)
    }
    self
  end
  class FileHeaderPrefix < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([58, 255, 38, 237].pack('C*'), magic, _io, "/types/file_header_prefix/seq/0") if not magic == [58, 255, 38, 237].pack('C*')
      @version = Version.new(@_io, self, @_root)
      @len_header = @_io.read_u2le
      self
    end
    attr_reader :magic

    ##
    # internal; access `_root.header.version` instead
    attr_reader :version

    ##
    # internal; access `_root.header.len_header` instead
    attr_reader :len_header
  end
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_chunk_header = @_io.read_u2le
      @block_size = @_io.read_u4le
      _ = block_size
      raise Kaitai::Struct::ValidationExprError.new(block_size, _io, "/types/file_header/seq/1") if not (_ % 4) == 0
      @num_blocks = @_io.read_u4le
      @num_chunks = @_io.read_u4le
      @checksum = @_io.read_u4le
      self
    end
    def version
      return @version unless @version.nil?
      @version = _root.header_prefix.version
      @version
    end

    ##
    # size of file header, should be 28
    def len_header
      return @len_header unless @len_header.nil?
      @len_header = _root.header_prefix.len_header
      @len_header
    end

    ##
    # size of chunk header, should be 12
    attr_reader :len_chunk_header

    ##
    # block size in bytes, must be a multiple of 4
    attr_reader :block_size

    ##
    # blocks in the original data
    attr_reader :num_blocks
    attr_reader :num_chunks

    ##
    # CRC32 checksum of the original data
    # 
    # In practice always 0; if checksum writing is requested, a CRC32 chunk is written
    # at the end of the file instead. The canonical `libsparse` implementation does this
    # and other implementations tend to follow it, see
    # <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
    attr_reader :checksum
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_header = @_io.read_bytes(_root.header.len_chunk_header)
      _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
      @header = ChunkHeader.new(_io__raw_header, self, @_root)
      case header.chunk_type
      when :chunk_types_crc32
        @body = @_io.read_u4le
      else
        @body = @_io.read_bytes(header.len_body)
      end
      self
    end
    class ChunkHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @chunk_type = Kaitai::Struct::Stream::resolve_enum(AndroidSparse::CHUNK_TYPES, @_io.read_u2le)
        @reserved1 = @_io.read_u2le
        @num_body_blocks = @_io.read_u4le
        @len_chunk = @_io.read_u4le
        raise Kaitai::Struct::ValidationNotEqualError.new((len_body_expected != -1 ? (_root.header.len_chunk_header + len_body_expected) : len_chunk), len_chunk, _io, "/types/chunk/types/chunk_header/seq/3") if not len_chunk == (len_body_expected != -1 ? (_root.header.len_chunk_header + len_body_expected) : len_chunk)
        self
      end
      def len_body
        return @len_body unless @len_body.nil?
        @len_body = (len_chunk - _root.header.len_chunk_header)
        @len_body
      end

      ##
      # @see https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184 Source
      # @see https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215 Source
      # @see https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249 Source
      # @see https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270 Source
      def len_body_expected
        return @len_body_expected unless @len_body_expected.nil?
        @len_body_expected = (chunk_type == :chunk_types_raw ? (_root.header.block_size * num_body_blocks) : (chunk_type == :chunk_types_fill ? 4 : (chunk_type == :chunk_types_dont_care ? 0 : (chunk_type == :chunk_types_crc32 ? 4 : -1))))
        @len_body_expected
      end
      attr_reader :chunk_type
      attr_reader :reserved1

      ##
      # size of the chunk body in blocks in output image
      attr_reader :num_body_blocks

      ##
      # in bytes of chunk input file including chunk header and data
      attr_reader :len_chunk
    end
    attr_reader :header
    attr_reader :body
    attr_reader :_raw_header
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u2le
      raise Kaitai::Struct::ValidationNotEqualError.new(1, major, _io, "/types/version/seq/0") if not major == 1
      @minor = @_io.read_u2le
      self
    end
    attr_reader :major
    attr_reader :minor
  end

  ##
  # internal; access `_root.header` instead
  attr_reader :header_prefix
  attr_reader :header
  attr_reader :chunks
  attr_reader :_raw_header
end
