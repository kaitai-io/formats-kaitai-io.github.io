# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt Source
class Zchunk < Kaitai::Struct::Struct

  CHECKSUM_TYPES = {
    0 => :checksum_types_sha1,
    1 => :checksum_types_sha256,
    2 => :checksum_types_sha512,
    3 => :checksum_types_sha512_128,
  }
  I__CHECKSUM_TYPES = CHECKSUM_TYPES.invert

  COMPRESSION_TYPES = {
    0 => :compression_types_none,
    2 => :compression_types_zstd,
  }
  I__COMPRESSION_TYPES = COMPRESSION_TYPES.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @lead = HeaderLead.new(@_io, self, @_root)
    _io_header_rest = @_io.substream(lead.len_header_rest.value)
    @header_rest = HeaderWithoutLead.new(_io_header_rest, self, @_root)
    @dict = @_io.read_bytes(header_rest.index.len_dict.value)
    if !(lead.is_detached_header)
      @chunks = []
      (header_rest.index.chunks_metadata.length).times { |i|
        @chunks << @_io.read_bytes(header_rest.index.chunks_metadata[i].len_chunk.value)
      }
    end
    self
  end
  class ChecksumType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @raw = CompressedInteger.new(@_io, self, @_root)
      _ = @raw
      raise Kaitai::Struct::ValidationExprError.new(@raw, @_io, "/types/checksum_type/seq/0") if not len_checksum != 0
      self
    end
    def len_checksum
      return @len_checksum unless @len_checksum.nil?
      @len_checksum = (value == :checksum_types_sha1 ? 20 : (value == :checksum_types_sha256 ? 32 : (value == :checksum_types_sha512 ? 64 : (value == :checksum_types_sha512_128 ? 16 : 0))))
      @len_checksum
    end
    def value
      return @value unless @value.nil?
      @value = Kaitai::Struct::Stream::resolve_enum(Zchunk::CHECKSUM_TYPES, raw.value)
      @value
    end

    ##
    # Raw integer, don't read this field - access `value` instead.
    attr_reader :raw
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil, len_checksum, has_data_streams, has_uncompressed_source)
      super(_io, _parent, _root)
      @len_checksum = len_checksum
      @has_data_streams = has_data_streams
      @has_uncompressed_source = has_uncompressed_source
      _read
    end

    def _read
      if has_data_streams
        @chunk_stream = CompressedInteger.new(@_io, self, @_root)
      end
      @chunk_checksum = @_io.read_bytes(len_checksum)
      if has_uncompressed_source
        @uncompressed_chunk_checksum = @_io.read_bytes(len_checksum)
      end
      @len_chunk = CompressedInteger.new(@_io, self, @_root)
      @len_uncompressed_chunk = CompressedInteger.new(@_io, self, @_root)
      self
    end
    attr_reader :chunk_stream
    attr_reader :chunk_checksum

    ##
    # Checksum of the uncompressed chunk. Used to detect whether a chunk
    # from an uncompressed source is identical to the compressed chunk.
    attr_reader :uncompressed_chunk_checksum
    attr_reader :len_chunk
    attr_reader :len_uncompressed_chunk
    attr_reader :len_checksum
    attr_reader :has_data_streams
    attr_reader :has_uncompressed_source
  end

  ##
  # Like `/common/vlq_base128_le` (LEB128), but the logic of the
  # "continuation" flag in the most significant bit is inverted, so instead of
  # `has_next`, it is called `is_last` (if the highest bit is set to zero, it
  # means "continue", whereas in standard LEB128, the highest bit set to
  # **one** means "continue"). Therefore, we cannot simply import
  # `/common/vlq_base128_le` and use it, because it is incompatible.
  class CompressedInteger < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @groups = []
      i = 0
      begin
        _ = Group.new(@_io, self, @_root, i)
        @groups << _
        i += 1
      end until _.is_last
      self
    end

    ##
    # One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
    class Group < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, idx)
        super(_io, _parent, _root)
        @idx = idx
        _read
      end

      def _read
        @is_last = @_io.read_bits_int_be(1) != 0
        raise Kaitai::Struct::ValidationNotEqualError.new((idx == 9 ? true : is_last), @is_last, @_io, "/types/compressed_integer/types/group/seq/0") if not @is_last == (idx == 9 ? true : is_last)
        @value = @_io.read_bits_int_be(7)
        raise Kaitai::Struct::ValidationGreaterThanError.new((idx == 9 ? 1 : 127), @value, @_io, "/types/compressed_integer/types/group/seq/1") if not @value <= (idx == 9 ? 1 : 127)
        self
      end

      ##
      # If `true`, then this is the last byte of the compressed integer.
      # 
      # Since this implementation only supports serialized values up to 10
      # bytes, this must be `true` in the 10th group (`groups[9]`).
      attr_reader :is_last

      ##
      # The 7-bit (base128) numeric value chunk of this group
      # 
      # Since this implementation only supports integer values up to 64 bits,
      # the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
      # (otherwise the width of the represented value would be 65 bits or
      # more, which is not supported).
      attr_reader :value
      attr_reader :idx
    end
    def len
      return @len unless @len.nil?
      @len = groups.length
      @len
    end

    ##
    # Resulting unsigned value as normal integer
    def value
      return @value unless @value.nil?
      @value = (((((((((groups[0].value | (len >= 2 ? groups[1].value << 7 : 0)) | (len >= 3 ? groups[2].value << 14 : 0)) | (len >= 4 ? groups[3].value << 21 : 0)) | (len >= 5 ? groups[4].value << 28 : 0)) | (len >= 6 ? groups[5].value << 35 : 0)) | (len >= 7 ? groups[6].value << 42 : 0)) | (len >= 8 ? groups[7].value << 49 : 0)) | (len >= 9 ? groups[8].value << 56 : 0)) | (len >= 10 ? groups[9].value << 63 : 0))
      @value
    end
    attr_reader :groups
  end
  class HeaderLead < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(5)
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@magic, @_io, "/types/header_lead/seq/0") if not  ((@magic == [0, 90, 67, 75, 49].pack('C*')) || (@magic == [0, 90, 72, 82, 49].pack('C*'))) 
      @overall_checksum_type = ChecksumType.new(@_io, self, @_root)
      @len_header_rest = CompressedInteger.new(@_io, self, @_root)
      @header_checksum = @_io.read_bytes(overall_checksum_type.len_checksum)
      self
    end

    ##
    # Determines whether this file is a zchunk detached header (`.zhr`). If
    # not, it is a complete zchunk file (`.zck`).
    def is_detached_header
      return @is_detached_header unless @is_detached_header.nil?
      @is_detached_header = magic[2].ord == 72
      @is_detached_header
    end

    ##
    # There are two valid magic numbers for zchunk files:
    # 
    # * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
    # * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
    attr_reader :magic

    ##
    # Type of the checksum used for `header_checksum` and
    # `_root.header_rest.preface.data_checksum`.
    attr_reader :overall_checksum_type

    ##
    # Size of the header, not including the lead
    attr_reader :len_header_rest

    ##
    # Checksum of the entire header, which consists of `_root.lead` and
    # `_root.header_rest` (i.e. everything from the beginning of the file to
    # the end of `_root.header_rest`), not including the `header_checksum`
    # field itself (i.e. the input for the checksum algorithm is a
    # concatenation of the bytes preceding the `header_checksum` field with
    # the bytes following it).
    # 
    # For detached headers, the checksum is calculated as if the `magic`
    # field were set to `'\0ZCK1'`, so that it matches the checksum in the
    # full zchunk file.
    attr_reader :header_checksum
  end
  class HeaderWithoutLead < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @preface = Preface.new(@_io, self, @_root)
      @len_index = CompressedInteger.new(@_io, self, @_root)
      _io_index = @_io.substream(len_index.value)
      @index = Index.new(_io_index, self, @_root)
      @num_signatures = CompressedInteger.new(@_io, self, @_root)
      _ = @num_signatures
      raise Kaitai::Struct::ValidationExprError.new(@num_signatures, @_io, "/types/header_without_lead/seq/3") if not _.value == 0
      self
    end
    attr_reader :preface
    attr_reader :len_index
    attr_reader :index

    ##
    # Must be 0. The reference implementation also rejects any file with a
    # non-zero "Signature count", throwing a fatal error stating "Signatures
    # aren't supported yet" - see
    # [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
    # 
    # Although the structure of signatures is defined [in the official
    # textual
    # specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
    # no signature types are defined, and as of this writing no publicly
    # known implementation generates or interprets these signatures.
    # Therefore, we've decided not to implement them here either.
    # 
    # For more details, see
    # <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.
    attr_reader :num_signatures
    attr_reader :_raw_index
  end
  class Index < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk_checksum_type = ChecksumType.new(@_io, self, @_root)
      @num_chunks = CompressedInteger.new(@_io, self, @_root)
      _ = @num_chunks
      raise Kaitai::Struct::ValidationExprError.new(@num_chunks, @_io, "/types/index/seq/1") if not _.value >= 1
      if _parent.preface.has_data_streams
        @dict_stream = CompressedInteger.new(@_io, self, @_root)
        _ = @dict_stream
        raise Kaitai::Struct::ValidationExprError.new(@dict_stream, @_io, "/types/index/seq/2") if not _.value == 0
      end
      @dict_checksum = @_io.read_bytes(chunk_checksum_type.len_checksum)
      if _parent.preface.has_uncompressed_source
        @uncompressed_dict_checksum = @_io.read_bytes(chunk_checksum_type.len_checksum)
      end
      @len_dict = CompressedInteger.new(@_io, self, @_root)
      @len_uncompressed_dict = CompressedInteger.new(@_io, self, @_root)
      @chunks_metadata = []
      (num_data_chunks).times { |i|
        @chunks_metadata << Chunk.new(@_io, self, @_root, chunk_checksum_type.len_checksum, _parent.preface.has_data_streams, _parent.preface.has_uncompressed_source)
      }
      self
    end

    ##
    # Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
    # so it is one greater than this number.
    def num_data_chunks
      return @num_data_chunks unless @num_data_chunks.nil?
      @num_data_chunks = num_chunks.value - 1
      @num_data_chunks
    end

    ##
    # Type of the checksum used for `dict_checksum` and for all
    # `chunks_metadata[...].chunk_checksum` and
    # `chunks_metadata[...].uncompressed_chunk_checksum`.
    attr_reader :chunk_checksum_type

    ##
    # Number of chunks, **including** the dictionary chunk.
    # 
    # Must be at least 1, because the dictionary chunk is always present,
    # even if it is empty. The reference implementation also fails when the
    # number of chunks is 0, see
    # [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
    attr_reader :num_chunks

    ##
    # If present, it must always be 0.
    # @see https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162 Source
    attr_reader :dict_stream
    attr_reader :dict_checksum

    ##
    # Checksum of the uncompressed dictionary. It has no real use, as the
    # uncompressed source won't have a dictionary.
    attr_reader :uncompressed_dict_checksum
    attr_reader :len_dict
    attr_reader :len_uncompressed_dict

    ##
    # Metadata of the data chunks. The dictionary is chunk 0 and its
    # metadata is stored in the `*dict*` fields above, so there is one fewer
    # entry here than indicated by `num_chunks`.
    attr_reader :chunks_metadata
  end
  class OptionalElement < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @element_id = CompressedInteger.new(@_io, self, @_root)
      @len_data = CompressedInteger.new(@_io, self, @_root)
      @data = @_io.read_bytes(len_data.value)
      self
    end
    attr_reader :element_id
    attr_reader :len_data
    attr_reader :data
  end
  class Preface < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data_checksum = @_io.read_bytes(_root.lead.overall_checksum_type.len_checksum)
      @flags = CompressedInteger.new(@_io, self, @_root)
      _ = @flags
      raise Kaitai::Struct::ValidationExprError.new(@flags, @_io, "/types/preface/seq/1") if not _.value <= 7
      @compression_type_int = CompressedInteger.new(@_io, self, @_root)
      _ = @compression_type_int
      raise Kaitai::Struct::ValidationExprError.new(@compression_type_int, @_io, "/types/preface/seq/2") if not  ((_.value == (Zchunk::I__COMPRESSION_TYPES[:compression_types_none] || :compression_types_none)) || (_.value == (Zchunk::I__COMPRESSION_TYPES[:compression_types_zstd] || :compression_types_zstd))) 
      if has_optional_elements
        @num_optional_elements = CompressedInteger.new(@_io, self, @_root)
        _ = @num_optional_elements
        raise Kaitai::Struct::ValidationExprError.new(@num_optional_elements, @_io, "/types/preface/seq/3") if not _.value >= 1
      end
      if has_optional_elements
        @optional_elements = []
        (num_optional_elements.value).times { |i|
          @optional_elements << OptionalElement.new(@_io, self, @_root)
        }
      end
      self
    end
    def compression_type
      return @compression_type unless @compression_type.nil?
      @compression_type = Kaitai::Struct::Stream::resolve_enum(Zchunk::COMPRESSION_TYPES, compression_type_int.value)
      @compression_type
    end
    def has_data_streams
      return @has_data_streams unless @has_data_streams.nil?
      @has_data_streams = flags.value & 1 != 0
      @has_data_streams
    end
    def has_optional_elements
      return @has_optional_elements unless @has_optional_elements.nil?
      @has_optional_elements = flags.value & 2 != 0
      @has_optional_elements
    end

    ##
    # The file may be applied against an uncompressed source. This adds an
    # uncompressed checksum to every index entry, including the dictionary.
    def has_uncompressed_source
      return @has_uncompressed_source unless @has_uncompressed_source.nil?
      @has_uncompressed_source = flags.value & 4 != 0
      @has_uncompressed_source
    end

    ##
    # Total data checksum. Checksum of everything after the header,
    # including the compressed dictionary (`_root.dict`) and all compressed
    # chunks (`_root.chunks`). The type of this checksum is
    # `_root.lead.overall_checksum_type.value`.
    # 
    # If `has_uncompressed_source` is true, this checksum must not be
    # checked and should not be generated. In that case, the reference
    # implementation writes it as all zeros - see the sample file
    # [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
    attr_reader :data_checksum

    ##
    # Compressed integer containing a bitmask of the flags. All unused flags
    # MUST be set to 0. If a decoder sees a flag set that it doesn't
    # recognize, it MUST exit with an error.
    # @see https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81 Source
    attr_reader :flags

    ##
    # Raw integer, don't read this field - access `compression_type`
    # instead.
    attr_reader :compression_type_int

    ##
    # If present, it must be at least 1. This is because if there are no
    # optional elements, `has_optional_elements` must be false, and then
    # neither this field nor `optional_elements` is present.
    # @see https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102 Source
    attr_reader :num_optional_elements
    attr_reader :optional_elements
  end
  attr_reader :lead
  attr_reader :header_rest

  ##
  # Custom dictionary used when compressing each chunk. It's compressed itself
  # without a dictionary.
  # 
  # The official zchunk specification calls this section "Compressed Dict".
  # It's also called a "dictionary chunk". `zck_read_header -c` presents it as
  # "chunk 0" (which is always shown in the chunk table, but can have size 0
  # if the dictionary is not in use).
  attr_reader :dict

  ##
  # Chunks of data, each compressed with the custom dictionary `dict` (if
  # applicable).
  # 
  # They are not included in a detached header (`.zhr`) file. Detached headers
  # contain the dictionary, but none of the data chunks.
  attr_reader :chunks
  attr_reader :_raw_header_rest
end
