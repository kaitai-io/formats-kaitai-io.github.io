# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Compressed resource data in `'dcmp' (1)` format,
# as stored in compressed resources with header type `8` and decompressor ID `1`.
# 
# The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
# This compression format is used for a few compressed resources in System 7.0's files
# (such as the Finder Help file).
# This decompressor is also included with and used by some other Apple applications,
# such as ResEdit.
# (Note: ResEdit includes the `'dcmp' (1)` resource,
# but none of its resources actually use this decompressor.)
# 
# This compression format supports some basic general-purpose compression schemes,
# including backreferences to previous data and run-length encoding.
# It also includes some types of compression tailored specifically to Mac OS resources,
# including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
# 
# The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
# with the main difference that it operates mostly on units of 2 or 4 bytes.
# This makes the ``dcmp' (0)` format more suitable for word-aligned data,
# such as executable code, bitmaps, sounds, etc.
# The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
# with the latter only being used in resource files that contain mostly unaligned data,
# such as text.
# @see https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/dcmp1.py Source
class Dcmp1 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @chunks = []
    i = 0
    begin
      _ = Chunk.new(@_io, self, @_root)
      @chunks << _
      i += 1
    end until _.tag == 255
    self
  end

  ##
  # A single chunk of compressed data.
  # Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
  # except when `tag == 0xff`,
  # which marks the end of the data and does not correspond to any bytes in the uncompressed data.
  # 
  # Most chunks are stateless and always expand to the same data,
  # regardless of where the chunk appears in the sequence.
  # However,
  # some chunks affect the behavior of future chunks,
  # or expand to different data depending on which chunks came before them.
  class Chunk < Kaitai::Struct::Struct

    TAG_KIND = {
      -1 => :tag_kind_invalid,
      0 => :tag_kind_literal,
      1 => :tag_kind_backreference,
      2 => :tag_kind_table_lookup,
      3 => :tag_kind_extended,
      4 => :tag_kind_end,
    }
    I__TAG_KIND = TAG_KIND.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tag = @_io.read_u1
      case ( ((tag >= 0) && (tag <= 31))  ? :tag_kind_literal : ( ((tag >= 32) && (tag <= 207))  ? :tag_kind_backreference : ( ((tag >= 208) && (tag <= 209))  ? :tag_kind_literal : (tag == 210 ? :tag_kind_backreference : ( ((tag >= 213) && (tag <= 253))  ? :tag_kind_table_lookup : (tag == 254 ? :tag_kind_extended : (tag == 255 ? :tag_kind_end : :tag_kind_invalid)))))))
      when :tag_kind_extended
        @body = ExtendedBody.new(@_io, self, @_root)
      when :tag_kind_literal
        @body = LiteralBody.new(@_io, self, @_root, tag)
      when :tag_kind_end
        @body = EndBody.new(@_io, self, @_root)
      when :tag_kind_table_lookup
        @body = TableLookupBody.new(@_io, self, @_root, tag)
      when :tag_kind_backreference
        @body = BackreferenceBody.new(@_io, self, @_root, tag)
      end
      self
    end

    ##
    # The body of a literal data chunk.
    # 
    # The data that this chunk expands to is stored literally in the body (`literal`).
    # Optionally,
    # the literal data may also be stored for use by future backreference chunks (`do_store`).
    class LiteralBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, tag)
        super(_io, _parent, _root)
        @tag = tag
        _read
      end

      def _read
        if is_len_literal_separate
          @len_literal_separate = @_io.read_u1
        end
        @literal = @_io.read_bytes(len_literal)
        self
      end

      ##
      # Whether this literal should be stored for use by future backreference chunks.
      # 
      # See the documentation of the `backreference_body` type for details about backreference chunks.
      def do_store
        return @do_store unless @do_store.nil?
        @do_store = (is_len_literal_separate ? tag == 209 : (tag & 16) != 0)
        @do_store
      end

      ##
      # The part of the tag byte that indicates the length of the literal data,
      # in bytes,
      # minus one.
      # 
      # If the tag byte is 0xd0 or 0xd1,
      # the length is stored in a separate byte after the tag byte and before the literal data.
      def len_literal_m1_in_tag
        return @len_literal_m1_in_tag unless @len_literal_m1_in_tag.nil?
        if !(is_len_literal_separate)
          @len_literal_m1_in_tag = (tag & 15)
        end
        @len_literal_m1_in_tag
      end

      ##
      # Whether the length of the literal is stored separately from the tag.
      def is_len_literal_separate
        return @is_len_literal_separate unless @is_len_literal_separate.nil?
        @is_len_literal_separate = tag >= 208
        @is_len_literal_separate
      end

      ##
      # The length of the literal data,
      # in bytes.
      # 
      # In practice,
      # this value is always greater than zero,
      # as there is no use in storing a zero-length literal.
      def len_literal
        return @len_literal unless @len_literal.nil?
        @len_literal = (is_len_literal_separate ? len_literal_separate : (len_literal_m1_in_tag + 1))
        @len_literal
      end

      ##
      # The length of the literal data,
      # in bytes.
      # 
      # This field is only present if the tag byte is 0xd0 or 0xd1.
      # In practice,
      # this only happens if the length is 0x11 or greater,
      # because smaller lengths can be encoded into the tag byte.
      attr_reader :len_literal_separate

      ##
      # The literal data.
      attr_reader :literal

      ##
      # The tag byte preceding this chunk body.
      attr_reader :tag
    end

    ##
    # The body of a backreference chunk.
    # 
    # This chunk expands to the data stored in a preceding literal chunk,
    # indicated by an index number (`index`).
    class BackreferenceBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, tag)
        super(_io, _parent, _root)
        @tag = tag
        _read
      end

      def _read
        if is_index_separate
          @index_separate_minus = @_io.read_u1
        end
        self
      end

      ##
      # Whether the index is stored separately from the tag.
      def is_index_separate
        return @is_index_separate unless @is_index_separate.nil?
        @is_index_separate = tag == 210
        @is_index_separate
      end

      ##
      # The index of the referenced literal chunk,
      # as stored in the tag byte.
      def index_in_tag
        return @index_in_tag unless @index_in_tag.nil?
        @index_in_tag = (tag - 32)
        @index_in_tag
      end

      ##
      # The index of the referenced literal chunk,
      # as stored separately from the tag byte,
      # with the implicit offset corrected for.
      def index_separate
        return @index_separate unless @index_separate.nil?
        if is_index_separate
          @index_separate = (index_separate_minus + 176)
        end
        @index_separate
      end

      ##
      # The index of the referenced literal chunk.
      # 
      # Stored literals are assigned index numbers in the order in which they appear in the compressed data,
      # starting at 0.
      # Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
      # Once an index is assigned to a stored literal,
      # it is never changed or unassigned for the entire length of the compressed data.
      # 
      # As the name indicates,
      # a backreference can only reference stored literal chunks found *before* the backreference,
      # not ones that come after it.
      def index
        return @index unless @index.nil?
        @index = (is_index_separate ? index_separate : index_in_tag)
        @index
      end

      ##
      # The index of the referenced literal chunk,
      # stored separately from the tag.
      # The value in this field is stored minus 0xb0.
      # 
      # This field is only present if the tag byte is 0xd2.
      # For other tag bytes,
      # the index is encoded in the tag byte.
      # Values smaller than 0xb0 cannot be stored in this field,
      # they must always be encoded in the tag byte.
      attr_reader :index_separate_minus

      ##
      # The tag byte preceding this chunk body.
      attr_reader :tag
    end

    ##
    # The body of a table lookup chunk.
    # This body is always empty.
    # 
    # This chunk always expands to two bytes (`value`),
    # determined from the tag byte using a fixed lookup table (`lookup_table`).
    # This lookup table is hardcoded in the decompressor and always the same for all compressed data.
    class TableLookupBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, tag)
        super(_io, _parent, _root)
        @tag = tag
        _read
      end

      def _read
        self
      end

      ##
      # Fixed lookup table that maps tag byte numbers to two bytes each.
      # 
      # The entries in the lookup table are offset -
      # index 0 stands for tag 0xd5, 1 for 0xd6, etc.
      def lookup_table
        return @lookup_table unless @lookup_table.nil?
        @lookup_table = [[0, 0].pack('C*'), [0, 1].pack('C*'), [0, 2].pack('C*'), [0, 3].pack('C*'), [46, 1].pack('C*'), [62, 1].pack('C*'), [1, 1].pack('C*'), [30, 1].pack('C*'), [255, 255].pack('C*'), [14, 1].pack('C*'), [49, 0].pack('C*'), [17, 18].pack('C*'), [1, 7].pack('C*'), [51, 50].pack('C*'), [18, 57].pack('C*'), [237, 16].pack('C*'), [1, 39].pack('C*'), [35, 34].pack('C*'), [1, 55].pack('C*'), [7, 6].pack('C*'), [1, 23].pack('C*'), [1, 35].pack('C*'), [0, 255].pack('C*'), [0, 47].pack('C*'), [7, 14].pack('C*'), [253, 60].pack('C*'), [1, 53].pack('C*'), [1, 21].pack('C*'), [1, 2].pack('C*'), [0, 7].pack('C*'), [0, 62].pack('C*'), [5, 213].pack('C*'), [2, 1].pack('C*'), [6, 7].pack('C*'), [7, 8].pack('C*'), [48, 1].pack('C*'), [1, 51].pack('C*'), [0, 16].pack('C*'), [23, 22].pack('C*'), [55, 62].pack('C*'), [54, 55].pack('C*')]
        @lookup_table
      end

      ##
      # The two bytes that the tag byte expands to,
      # based on the fixed lookup table.
      def value
        return @value unless @value.nil?
        @value = lookup_table[(tag - 213)]
        @value
      end

      ##
      # The tag byte preceding this chunk body.
      attr_reader :tag
    end

    ##
    # The body of an end chunk.
    # This body is always empty.
    # 
    # The last chunk in the compressed data must always be an end chunk.
    # An end chunk cannot appear elsewhere in the compressed data.
    class EndBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        self
      end
    end

    ##
    # The body of an extended chunk.
    # The meaning of this chunk depends on the extended tag byte stored in the chunk data.
    class ExtendedBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @tag = @_io.read_u1
        case tag
        when 2
          @body = RepeatBody.new(@_io, self, @_root)
        end
        self
      end

      ##
      # The body of a repeat chunk.
      # 
      # This chunk expands to the same byte repeated a number of times,
      # i. e. it implements a form of run-length encoding.
      class RepeatBody < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @to_repeat_raw = DcmpVariableLengthInteger.new(@_io)
          @repeat_count_m1_raw = DcmpVariableLengthInteger.new(@_io)
          self
        end

        ##
        # The value to repeat.
        # 
        # Although it is stored as a variable-length integer,
        # this value must fit into an unsigned 8-bit integer.
        def to_repeat
          return @to_repeat unless @to_repeat.nil?
          @to_repeat = to_repeat_raw.value
          @to_repeat
        end

        ##
        # The number of times to repeat the value,
        # minus one.
        # 
        # This value must not be negative.
        def repeat_count_m1
          return @repeat_count_m1 unless @repeat_count_m1.nil?
          @repeat_count_m1 = repeat_count_m1_raw.value
          @repeat_count_m1
        end

        ##
        # The number of times to repeat the value.
        # 
        # This value must be positive.
        def repeat_count
          return @repeat_count unless @repeat_count.nil?
          @repeat_count = (repeat_count_m1 + 1)
          @repeat_count
        end

        ##
        # Raw variable-length integer representation of `to_repeat`.
        attr_reader :to_repeat_raw

        ##
        # Raw variable-length integer representation of `repeat_count_m1`.
        attr_reader :repeat_count_m1_raw
      end

      ##
      # The chunk's extended tag byte.
      # This controls the structure of the body and the meaning of the chunk.
      attr_reader :tag

      ##
      # The chunk's body.
      attr_reader :body
    end

    ##
    # The chunk's tag byte.
    # This controls the structure of the body and the meaning of the chunk.
    attr_reader :tag

    ##
    # The chunk's body.
    # 
    # Certain chunks do not have any data following the tag byte.
    # In this case,
    # the body is a zero-length structure.
    attr_reader :body
  end

  ##
  # The sequence of chunks that make up the compressed data.
  attr_reader :chunks
end
