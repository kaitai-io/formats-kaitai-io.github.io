# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Compressed resource data in `'dcmp' (0)` format,
# as stored in compressed resources with header type `8` and decompressor ID `0`.
# 
# The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
# This compression format is used for most compressed resources in System 7.0's files.
# This decompressor is also included with and used by some other Apple applications,
# such as ResEdit.
# 
# This compression format supports some basic general-purpose compression schemes,
# including backreferences to previous data,
# run-length encoding,
# and delta encoding.
# It also includes some types of compression tailored specifically to Mac OS resources,
# including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
# and a specialized kind of delta encoding for segment loader jump tables.
# 
# Almost all parts of this compression format operate on units of 2 or 4 bytes.
# As a result,
# it is nearly impossible to store data with an odd length in this format.
# To work around this limitation,
# odd-length resources are padded with an extra byte before compressing them with this format.
# This extra byte is ignored after decompression,
# as the real (odd) length of the resource is stored in the compressed resource header.
# 
# The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
# with the main difference that it operates mostly on single bytes rather than two-byte units.
# @see https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py Source
class Dcmp0 < Kaitai::Struct::Struct
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
      case ( ((tag >= 0) && (tag <= 31))  ? :tag_kind_literal : ( ((tag >= 32) && (tag <= 74))  ? :tag_kind_backreference : ( ((tag >= 75) && (tag <= 253))  ? :tag_kind_table_lookup : (tag == 254 ? :tag_kind_extended : (tag == 255 ? :tag_kind_end : :tag_kind_invalid)))))
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
    # 
    # The length of the literal data is stored as a number of two-byte units.
    # This means that the literal data always has an even length in bytes.
    class LiteralBody < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, tag)
        super(_io, _parent, _root)
        @tag = tag
        _read
      end

      def _read
        if is_len_literal_div2_separate
          @len_literal_div2_separate = @_io.read_u1
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
        @do_store = (tag & 16) != 0
        @do_store
      end

      ##
      # The length of the literal data,
      # in two-byte units.
      # 
      # In practice,
      # this value is always greater than zero,
      # as there is no use in storing a zero-length literal.
      def len_literal_div2
        return @len_literal_div2 unless @len_literal_div2.nil?
        @len_literal_div2 = (is_len_literal_div2_separate ? len_literal_div2_separate : len_literal_div2_in_tag)
        @len_literal_div2
      end

      ##
      # The length of the literal data,
      # in bytes.
      def len_literal
        return @len_literal unless @len_literal.nil?
        @len_literal = (len_literal_div2 * 2)
        @len_literal
      end

      ##
      # The part of the tag byte that indicates the length of the literal data,
      # in two-byte units.
      # If this value is 0,
      # the length is stored in a separate byte after the tag byte and before the literal data.
      def len_literal_div2_in_tag
        return @len_literal_div2_in_tag unless @len_literal_div2_in_tag.nil?
        @len_literal_div2_in_tag = (tag & 15)
        @len_literal_div2_in_tag
      end

      ##
      # Whether the length of the literal is stored separately from the tag.
      def is_len_literal_div2_separate
        return @is_len_literal_div2_separate unless @is_len_literal_div2_separate.nil?
        @is_len_literal_div2_separate = len_literal_div2_in_tag == 0
        @is_len_literal_div2_separate
      end

      ##
      # The length of the literal data,
      # in two-byte units.
      # 
      # This field is only present if the tag byte's low nibble is zero.
      # In practice,
      # this only happens if the length is 0x10 or greater,
      # because smaller lengths can be encoded into the tag byte.
      attr_reader :len_literal_div2_separate

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
          case tag
          when 32
            @index_separate_minus = @_io.read_u1
          when 33
            @index_separate_minus = @_io.read_u1
          when 34
            @index_separate_minus = @_io.read_u2be
          end
        end
        self
      end

      ##
      # Whether the index is stored separately from the tag.
      def is_index_separate
        return @is_index_separate unless @is_index_separate.nil?
        @is_index_separate =  ((tag >= 32) && (tag <= 34)) 
        @is_index_separate
      end

      ##
      # The index of the referenced literal chunk,
      # as stored in the tag byte.
      def index_in_tag
        return @index_in_tag unless @index_in_tag.nil?
        @index_in_tag = (tag - 35)
        @index_in_tag
      end

      ##
      # The index of the referenced literal chunk,
      # as stored separately from the tag byte,
      # with the implicit offset corrected for.
      def index_separate
        return @index_separate unless @index_separate.nil?
        if is_index_separate
          @index_separate = ((index_separate_minus + 40) + (tag == 33 ? 256 : 0))
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
      # The value in this field is stored minus 0x28.
      # If the tag byte is 0x21,
      # the value is also stored minus 0x100,
      # *on top of* the regular offset
      # (i. e. minus 0x128 in total).
      # 
      # In other words,
      # for tag bytes 0x20 and 0x21,
      # the index is actually 9 bits large,
      # with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
      # 
      # This field is only present if the tag byte is 0x20 through 0x22.
      # For higher tag bytes,
      # the index is encoded in the tag byte.
      # Values smaller than 0x28 cannot be stored in this field,
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
      # index 0 stands for tag 0x4b, 1 for 0x4c, etc.
      def lookup_table
        return @lookup_table unless @lookup_table.nil?
        @lookup_table = [[0, 0].pack('C*'), [78, 186].pack('C*'), [0, 8].pack('C*'), [78, 117].pack('C*'), [0, 12].pack('C*'), [78, 173].pack('C*'), [32, 83].pack('C*'), [47, 11].pack('C*'), [97, 0].pack('C*'), [0, 16].pack('C*'), [112, 0].pack('C*'), [47, 0].pack('C*'), [72, 110].pack('C*'), [32, 80].pack('C*'), [32, 110].pack('C*'), [47, 46].pack('C*'), [255, 252].pack('C*'), [72, 231].pack('C*'), [63, 60].pack('C*'), [0, 4].pack('C*'), [255, 248].pack('C*'), [47, 12].pack('C*'), [32, 6].pack('C*'), [78, 237].pack('C*'), [78, 86].pack('C*'), [32, 104].pack('C*'), [78, 94].pack('C*'), [0, 1].pack('C*'), [88, 143].pack('C*'), [79, 239].pack('C*'), [0, 2].pack('C*'), [0, 24].pack('C*'), [96, 0].pack('C*'), [255, 255].pack('C*'), [80, 143].pack('C*'), [78, 144].pack('C*'), [0, 6].pack('C*'), [38, 110].pack('C*'), [0, 20].pack('C*'), [255, 244].pack('C*'), [76, 238].pack('C*'), [0, 10].pack('C*'), [0, 14].pack('C*'), [65, 238].pack('C*'), [76, 223].pack('C*'), [72, 192].pack('C*'), [255, 240].pack('C*'), [45, 64].pack('C*'), [0, 18].pack('C*'), [48, 46].pack('C*'), [112, 1].pack('C*'), [47, 40].pack('C*'), [32, 84].pack('C*'), [103, 0].pack('C*'), [0, 32].pack('C*'), [0, 28].pack('C*'), [32, 95].pack('C*'), [24, 0].pack('C*'), [38, 111].pack('C*'), [72, 120].pack('C*'), [0, 22].pack('C*'), [65, 250].pack('C*'), [48, 60].pack('C*'), [40, 64].pack('C*'), [114, 0].pack('C*'), [40, 110].pack('C*'), [32, 12].pack('C*'), [102, 0].pack('C*'), [32, 107].pack('C*'), [47, 7].pack('C*'), [85, 143].pack('C*'), [0, 40].pack('C*'), [255, 254].pack('C*'), [255, 236].pack('C*'), [34, 216].pack('C*'), [32, 11].pack('C*'), [0, 15].pack('C*'), [89, 143].pack('C*'), [47, 60].pack('C*'), [255, 0].pack('C*'), [1, 24].pack('C*'), [129, 225].pack('C*'), [74, 0].pack('C*'), [78, 176].pack('C*'), [255, 232].pack('C*'), [72, 199].pack('C*'), [0, 3].pack('C*'), [0, 34].pack('C*'), [0, 7].pack('C*'), [0, 26].pack('C*'), [103, 6].pack('C*'), [103, 8].pack('C*'), [78, 249].pack('C*'), [0, 36].pack('C*'), [32, 120].pack('C*'), [8, 0].pack('C*'), [102, 4].pack('C*'), [0, 42].pack('C*'), [78, 208].pack('C*'), [48, 40].pack('C*'), [38, 95].pack('C*'), [103, 4].pack('C*'), [0, 48].pack('C*'), [67, 238].pack('C*'), [63, 0].pack('C*'), [32, 31].pack('C*'), [0, 30].pack('C*'), [255, 246].pack('C*'), [32, 46].pack('C*'), [66, 167].pack('C*'), [32, 7].pack('C*'), [255, 250].pack('C*'), [96, 2].pack('C*'), [61, 64].pack('C*'), [12, 64].pack('C*'), [102, 6].pack('C*'), [0, 38].pack('C*'), [45, 72].pack('C*'), [47, 1].pack('C*'), [112, 255].pack('C*'), [96, 4].pack('C*'), [24, 128].pack('C*'), [74, 64].pack('C*'), [0, 64].pack('C*'), [0, 44].pack('C*'), [47, 8].pack('C*'), [0, 17].pack('C*'), [255, 228].pack('C*'), [33, 64].pack('C*'), [38, 64].pack('C*'), [255, 242].pack('C*'), [66, 110].pack('C*'), [78, 185].pack('C*'), [61, 124].pack('C*'), [0, 56].pack('C*'), [0, 13].pack('C*'), [96, 6].pack('C*'), [66, 46].pack('C*'), [32, 60].pack('C*'), [103, 12].pack('C*'), [45, 104].pack('C*'), [102, 8].pack('C*'), [74, 46].pack('C*'), [74, 174].pack('C*'), [0, 46].pack('C*'), [72, 64].pack('C*'), [34, 95].pack('C*'), [34, 0].pack('C*'), [103, 10].pack('C*'), [48, 7].pack('C*'), [66, 103].pack('C*'), [0, 50].pack('C*'), [32, 40].pack('C*'), [0, 9].pack('C*'), [72, 122].pack('C*'), [2, 0].pack('C*'), [47, 43].pack('C*'), [0, 5].pack('C*'), [34, 110].pack('C*'), [102, 2].pack('C*'), [229, 128].pack('C*'), [103, 14].pack('C*'), [102, 10].pack('C*'), [0, 80].pack('C*'), [62, 0].pack('C*'), [102, 12].pack('C*'), [46, 0].pack('C*'), [255, 238].pack('C*'), [32, 109].pack('C*'), [32, 64].pack('C*'), [255, 224].pack('C*'), [83, 64].pack('C*'), [96, 8].pack('C*'), [4, 128].pack('C*'), [0, 104].pack('C*'), [11, 124].pack('C*'), [68, 0].pack('C*'), [65, 232].pack('C*'), [72, 65].pack('C*')]
        @lookup_table
      end

      ##
      # The two bytes that the tag byte expands to,
      # based on the fixed lookup table.
      def value
        return @value unless @value.nil?
        @value = lookup_table[(tag - 75)]
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
        when 0
          @body = JumpTableBody.new(@_io, self, @_root)
        when 4
          @body = DeltaEncoding16BitBody.new(@_io, self, @_root)
        when 6
          @body = DeltaEncoding32BitBody.new(@_io, self, @_root)
        when 3
          @body = RepeatBody.new(@_io, self, @_root, tag)
        when 2
          @body = RepeatBody.new(@_io, self, @_root, tag)
        end
        self
      end

      ##
      # The body of a jump table chunk.
      # 
      # This chunk generates parts of a segment loader jump table,
      # in the format found in `'CODE' (0)` resources.
      # It expands to the following data,
      # with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
      # 
      # * `0x3f 0x3c` (push following segment number onto stack)
      # * The segment number
      # * `0xa9 0xf0` (`_LoadSeg` trap)
      # * For each address:
      #   * The address
      #   * `0x3f 0x3c` (push following segment number onto stack)
      #   * The segment number
      #   * `0xa9 0xf0` (`_LoadSeg` trap)
      # 
      # Note that this generates one jump table entry without an address before it,
      # meaning that this address needs to be generated by the preceding chunk.
      # All following jump table entries are generated with the addresses encoded in this chunk.
      class JumpTableBody < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @segment_number_raw = DcmpVariableLengthInteger.new(@_io)
          @num_addresses_raw = DcmpVariableLengthInteger.new(@_io)
          @addresses_raw = []
          (num_addresses).times { |i|
            @addresses_raw << DcmpVariableLengthInteger.new(@_io)
          }
          self
        end

        ##
        # The segment number for all of the generated jump table entries.
        # 
        # Although it is stored as a variable-length integer,
        # the segment number must be in the range `0x0 <= x <= 0xffff`,
        # i. e. an unsigned 16-bit integer.
        def segment_number
          return @segment_number unless @segment_number.nil?
          @segment_number = segment_number_raw.value
          @segment_number
        end

        ##
        # The number of addresses stored in this chunk.
        # 
        # This number must be greater than 0.
        def num_addresses
          return @num_addresses unless @num_addresses.nil?
          @num_addresses = num_addresses_raw.value
          @num_addresses
        end

        ##
        # Raw variable-length integer representation of `segment_number`.
        attr_reader :segment_number_raw

        ##
        # Raw variable-length integer representation of `num_addresses`.
        attr_reader :num_addresses_raw

        ##
        # The addresses for each generated jump table entry,
        # stored as variable-length integers.
        # 
        # The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
        # i. e. an unsigned 16-bit integer.
        # 
        # All following addresses are stored as deltas relative to the previous address.
        # Each of these deltas is stored plus 6;
        # this value needs to be subtracted before (or after) adding it to the previous address.
        # 
        # Each delta (after subtracting 6) should be positive,
        # and adding it to the previous address should not result in a value larger than `0xffff`,
        # i. e. there should be no 16-bit unsigned integer wraparound.
        # These conditions are always met in all known jump table chunks,
        # so it is not known how the original decompressor behaves otherwise.
        attr_reader :addresses_raw
      end

      ##
      # The body of a repeat chunk.
      # 
      # This chunk expands to a 1-byte or 2-byte value repeated a number of times,
      # i. e. it implements a form of run-length encoding.
      class RepeatBody < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, tag)
          super(_io, _parent, _root)
          @tag = tag
          _read
        end

        def _read
          @to_repeat_raw = DcmpVariableLengthInteger.new(@_io)
          @repeat_count_m1_raw = DcmpVariableLengthInteger.new(@_io)
          self
        end

        ##
        # The length in bytes of the value to be repeated.
        # Regardless of the byte count,
        # the value to be repeated is stored as a variable-length integer.
        def byte_count
          return @byte_count unless @byte_count.nil?
          @byte_count = (tag == 2 ? 1 : (tag == 3 ? 2 : -1))
          @byte_count
        end

        ##
        # The value to repeat.
        # 
        # Although it is stored as a variable-length integer,
        # this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
        # i. e. either 8 or 16 bits.
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

        ##
        # The extended tag byte preceding this chunk body.
        attr_reader :tag
      end

      ##
      # The body of a 16-bit delta encoding chunk.
      # 
      # This chunk expands to a sequence of 16-bit big-endian integer values.
      # The first value is stored literally.
      # All following values are stored as deltas relative to the previous value.
      class DeltaEncoding16BitBody < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @first_value_raw = DcmpVariableLengthInteger.new(@_io)
          @num_deltas_raw = DcmpVariableLengthInteger.new(@_io)
          @deltas = []
          (num_deltas).times { |i|
            @deltas << @_io.read_s1
          }
          self
        end

        ##
        # The first value in the sequence.
        # 
        # Although it is stored as a variable-length integer,
        # this value must be in the range `-0x8000 <= x <= 0x7fff`,
        # i. e. a signed 16-bit integer.
        def first_value
          return @first_value unless @first_value.nil?
          @first_value = first_value_raw.value
          @first_value
        end

        ##
        # The number of deltas stored in this chunk.
        # 
        # This number must not be negative.
        def num_deltas
          return @num_deltas unless @num_deltas.nil?
          @num_deltas = num_deltas_raw.value
          @num_deltas
        end

        ##
        # Raw variable-length integer representation of `first_value`.
        attr_reader :first_value_raw

        ##
        # Raw variable-length integer representation of `num_deltas`.
        attr_reader :num_deltas_raw

        ##
        # The deltas for each value relative to the previous value.
        # 
        # Each of these deltas is a signed 8-bit value.
        # When adding the delta to the previous value,
        # 16-bit integer wraparound is performed if necessary,
        # so that the resulting value always fits into a 16-bit signed integer.
        attr_reader :deltas
      end

      ##
      # The body of a 32-bit delta encoding chunk.
      # 
      # This chunk expands to a sequence of 32-bit big-endian integer values.
      # The first value is stored literally.
      # All following values are stored as deltas relative to the previous value.
      class DeltaEncoding32BitBody < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @first_value_raw = DcmpVariableLengthInteger.new(@_io)
          @num_deltas_raw = DcmpVariableLengthInteger.new(@_io)
          @deltas_raw = []
          (num_deltas).times { |i|
            @deltas_raw << DcmpVariableLengthInteger.new(@_io)
          }
          self
        end

        ##
        # The first value in the sequence.
        def first_value
          return @first_value unless @first_value.nil?
          @first_value = first_value_raw.value
          @first_value
        end

        ##
        # The number of deltas stored in this chunk.
        # 
        # This number must not be negative.
        def num_deltas
          return @num_deltas unless @num_deltas.nil?
          @num_deltas = num_deltas_raw.value
          @num_deltas
        end

        ##
        # Raw variable-length integer representation of `first_value`.
        attr_reader :first_value_raw

        ##
        # Raw variable-length integer representation of `num_deltas`.
        attr_reader :num_deltas_raw

        ##
        # The deltas for each value relative to the previous value,
        # stored as variable-length integers.
        # 
        # Each of these deltas is a signed value.
        # When adding the delta to the previous value,
        # 32-bit integer wraparound is performed if necessary,
        # so that the resulting value always fits into a 32-bit signed integer.
        attr_reader :deltas_raw
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
