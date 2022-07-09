# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Compressed resource data in `'dcmp' (2)` format,
# as stored in compressed resources with header type `9` and decompressor ID `2`.
# 
# The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
# This compression format is used for a few compressed resources in System 7.0's files
# (such as the System file).
# This decompressor is also included with and used by some other Apple applications,
# such as ResEdit.
# (Note: ResEdit includes the `'dcmp' (2)` resource,
# but none of its resources actually use this decompressor.)
# 
# This compression format is based on simple dictionary coding,
# where each byte in the compressed data expands to two bytes,
# based on a lookup table
# (either included in the compressed data or provided by the decompressor).
# An alternative "tagged" compression format is also supported,
# which allows using two-byte literals in addition to single-byte table references,
# at the cost of requiring an extra "tag" byte every 16 output bytes,
# to differentiate literals and table references.
# @see https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py Source
class Dcmp2 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self, len_decompressed, header_parameters_with_io)
    super(_io, _parent, _root)
    @len_decompressed = len_decompressed
    @header_parameters_with_io = header_parameters_with_io
    _read
  end

  def _read
    if header_parameters.flags.has_custom_lookup_table
      @custom_lookup_table = []
      (header_parameters.num_custom_lookup_table_entries).times { |i|
        @custom_lookup_table << @_io.read_bytes(2)
      }
    end
    case header_parameters.flags.tagged
    when true
      @_raw_data = @_io.read_bytes(((_io.size - _io.pos) - (is_len_decompressed_odd ? 1 : 0)))
      _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
      @data = TaggedData.new(_io__raw_data, self, @_root)
    else
      @_raw_data = @_io.read_bytes(((_io.size - _io.pos) - (is_len_decompressed_odd ? 1 : 0)))
      _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
      @data = UntaggedData.new(_io__raw_data, self, @_root)
    end
    if is_len_decompressed_odd
      @last_byte = @_io.read_bytes(1)
    end
    self
  end

  ##
  # Decompressor-specific parameters for this compression format,
  # as stored in the compressed resource header.
  class HeaderParameters < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @unknown = @_io.read_u2be
      @num_custom_lookup_table_entries_m1 = @_io.read_u1
      @flags = Flags.new(@_io, self, @_root)
      self
    end

    ##
    # Flags for the decompressor,
    # as stored in the decompressor-specific parameters.
    class Flags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_bits_int_be(6)
        @tagged = @_io.read_bits_int_be(1) != 0
        @has_custom_lookup_table = @_io.read_bits_int_be(1) != 0
        self
      end

      ##
      # The flags as a packed integer,
      # as they are stored in the data.
      def as_int
        return @as_int unless @as_int.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @as_int = @_io.read_u1
        @_io.seek(_pos)
        @as_int
      end

      ##
      # These flags have no known usage or meaning and should always be zero.
      attr_reader :reserved

      ##
      # Whether the "tagged" variant of this compression format should be used,
      # rather than the default "untagged" variant.
      attr_reader :tagged

      ##
      # Whether a custom lookup table is included before the compressed data,
      # which should be used instead of the default hardcoded lookup table.
      attr_reader :has_custom_lookup_table
    end

    ##
    # The number of entries in the custom lookup table.
    # Only used if a custom lookup table is present.
    def num_custom_lookup_table_entries
      return @num_custom_lookup_table_entries unless @num_custom_lookup_table_entries.nil?
      if flags.has_custom_lookup_table
        @num_custom_lookup_table_entries = (num_custom_lookup_table_entries_m1 + 1)
      end
      @num_custom_lookup_table_entries
    end

    ##
    # The meaning of this field is unknown.
    # It does not appear to have any effect on the format of the compressed data or the decompression process.
    # 
    # The value of this field is usually zero and otherwise a small integer (< 10).
    # For `'lpch'` resources,
    # the value is always nonzero,
    # and sometimes larger than usual.
    attr_reader :unknown

    ##
    # The number of entries in the custom lookup table,
    # minus one.
    # 
    # If the default lookup table is used rather than a custom one,
    # this value is zero.
    attr_reader :num_custom_lookup_table_entries_m1

    ##
    # Various flags that affect the format of the compressed data and the decompression process.
    attr_reader :flags
  end

  ##
  # Compressed data in the "untagged" variant of the format.
  class UntaggedData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @table_references = []
      i = 0
      while not @_io.eof?
        @table_references << @_io.read_u1
        i += 1
      end
      self
    end

    ##
    # References into the lookup table.
    # Each reference is an integer that is expanded to two bytes by looking it up in the table.
    attr_reader :table_references
  end

  ##
  # Compressed data in the "tagged" variant of the format.
  class TaggedData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunks = []
      i = 0
      while not @_io.eof?
        @chunks << Chunk.new(@_io, self, @_root)
        i += 1
      end
      self
    end

    ##
    # A single tagged chunk of compressed data.
    # 
    # Each chunk expands to 16 bytes of decompressed data.
    # In compressed form,
    # the chunks have a variable length
    # (between 9 and 17 bytes)
    # depending on the value of the tag byte.
    class Chunk < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @tag = []
        (8).times { |i|
          @tag << @_io.read_bits_int_be(1) != 0
        }
        @_io.align_to_byte
        @_raw_units = []
        @units = []
        i = 0
        begin
          case tag[i]
          when true
            _ = @_io.read_u1
            @units << _
          else
            _ = @_io.read_bytes((tag[i] ? 1 : 2))
            @units << _
          end
          i += 1
        end until  ((i >= 7) || (_io.eof?)) 
        self
      end

      ##
      # The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
      attr_reader :tag

      ##
      # The compressed data units in this chunk.
      # 
      # The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
      # If the bit is 0 (false),
      # the unit is a pair of bytes,
      # which are literally copied to the decompressed data.
      # If the bit is 1 (true),
      # the unit is a reference into the lookup table,
      # an integer which is expanded to two bytes by looking it up in the table.
      attr_reader :units
    end

    ##
    # The tagged chunks that make up the compressed data.
    attr_reader :chunks
  end

  ##
  # The parsed decompressor-specific parameters from the compressed resource header.
  def header_parameters
    return @header_parameters unless @header_parameters.nil?
    io = header_parameters_with_io._io
    _pos = io.pos
    io.seek(0)
    @header_parameters = HeaderParameters.new(io, self, @_root)
    io.seek(_pos)
    @header_parameters
  end

  ##
  # Whether the length of the decompressed data is odd.
  # This affects the meaning of the last byte of the compressed data.
  def is_len_decompressed_odd
    return @is_len_decompressed_odd unless @is_len_decompressed_odd.nil?
    @is_len_decompressed_odd = (len_decompressed % 2) != 0
    @is_len_decompressed_odd
  end

  ##
  # The default lookup table,
  # which is used if no custom lookup table is included with the compressed data.
  def default_lookup_table
    return @default_lookup_table unless @default_lookup_table.nil?
    @default_lookup_table = [[0, 0].pack('C*'), [0, 8].pack('C*'), [78, 186].pack('C*'), [32, 110].pack('C*'), [78, 117].pack('C*'), [0, 12].pack('C*'), [0, 4].pack('C*'), [112, 0].pack('C*'), [0, 16].pack('C*'), [0, 2].pack('C*'), [72, 110].pack('C*'), [255, 252].pack('C*'), [96, 0].pack('C*'), [0, 1].pack('C*'), [72, 231].pack('C*'), [47, 46].pack('C*'), [78, 86].pack('C*'), [0, 6].pack('C*'), [78, 94].pack('C*'), [47, 0].pack('C*'), [97, 0].pack('C*'), [255, 248].pack('C*'), [47, 11].pack('C*'), [255, 255].pack('C*'), [0, 20].pack('C*'), [0, 10].pack('C*'), [0, 24].pack('C*'), [32, 95].pack('C*'), [0, 14].pack('C*'), [32, 80].pack('C*'), [63, 60].pack('C*'), [255, 244].pack('C*'), [76, 238].pack('C*'), [48, 46].pack('C*'), [103, 0].pack('C*'), [76, 223].pack('C*'), [38, 110].pack('C*'), [0, 18].pack('C*'), [0, 28].pack('C*'), [66, 103].pack('C*'), [255, 240].pack('C*'), [48, 60].pack('C*'), [47, 12].pack('C*'), [0, 3].pack('C*'), [78, 208].pack('C*'), [0, 32].pack('C*'), [112, 1].pack('C*'), [0, 22].pack('C*'), [45, 64].pack('C*'), [72, 192].pack('C*'), [32, 120].pack('C*'), [114, 0].pack('C*'), [88, 143].pack('C*'), [102, 0].pack('C*'), [79, 239].pack('C*'), [66, 167].pack('C*'), [103, 6].pack('C*'), [255, 250].pack('C*'), [85, 143].pack('C*'), [40, 110].pack('C*'), [63, 0].pack('C*'), [255, 254].pack('C*'), [47, 60].pack('C*'), [103, 4].pack('C*'), [89, 143].pack('C*'), [32, 107].pack('C*'), [0, 36].pack('C*'), [32, 31].pack('C*'), [65, 250].pack('C*'), [129, 225].pack('C*'), [102, 4].pack('C*'), [103, 8].pack('C*'), [0, 26].pack('C*'), [78, 185].pack('C*'), [80, 143].pack('C*'), [32, 46].pack('C*'), [0, 7].pack('C*'), [78, 176].pack('C*'), [255, 242].pack('C*'), [61, 64].pack('C*'), [0, 30].pack('C*'), [32, 104].pack('C*'), [102, 6].pack('C*'), [255, 246].pack('C*'), [78, 249].pack('C*'), [8, 0].pack('C*'), [12, 64].pack('C*'), [61, 124].pack('C*'), [255, 236].pack('C*'), [0, 5].pack('C*'), [32, 60].pack('C*'), [255, 232].pack('C*'), [222, 252].pack('C*'), [74, 46].pack('C*'), [0, 48].pack('C*'), [0, 40].pack('C*'), [47, 8].pack('C*'), [32, 11].pack('C*'), [96, 2].pack('C*'), [66, 110].pack('C*'), [45, 72].pack('C*'), [32, 83].pack('C*'), [32, 64].pack('C*'), [24, 0].pack('C*'), [96, 4].pack('C*'), [65, 238].pack('C*'), [47, 40].pack('C*'), [47, 1].pack('C*'), [103, 10].pack('C*'), [72, 64].pack('C*'), [32, 7].pack('C*'), [102, 8].pack('C*'), [1, 24].pack('C*'), [47, 7].pack('C*'), [48, 40].pack('C*'), [63, 46].pack('C*'), [48, 43].pack('C*'), [34, 110].pack('C*'), [47, 43].pack('C*'), [0, 44].pack('C*'), [103, 12].pack('C*'), [34, 95].pack('C*'), [96, 6].pack('C*'), [0, 255].pack('C*'), [48, 7].pack('C*'), [255, 238].pack('C*'), [83, 64].pack('C*'), [0, 64].pack('C*'), [255, 228].pack('C*'), [74, 64].pack('C*'), [102, 10].pack('C*'), [0, 15].pack('C*'), [78, 173].pack('C*'), [112, 255].pack('C*'), [34, 216].pack('C*'), [72, 107].pack('C*'), [0, 34].pack('C*'), [32, 75].pack('C*'), [103, 14].pack('C*'), [74, 174].pack('C*'), [78, 144].pack('C*'), [255, 224].pack('C*'), [255, 192].pack('C*'), [0, 42].pack('C*'), [39, 64].pack('C*'), [103, 2].pack('C*'), [81, 200].pack('C*'), [2, 182].pack('C*'), [72, 122].pack('C*'), [34, 120].pack('C*'), [176, 110].pack('C*'), [255, 230].pack('C*'), [0, 9].pack('C*'), [50, 46].pack('C*'), [62, 0].pack('C*'), [72, 65].pack('C*'), [255, 234].pack('C*'), [67, 238].pack('C*'), [78, 113].pack('C*'), [116, 0].pack('C*'), [47, 44].pack('C*'), [32, 108].pack('C*'), [0, 60].pack('C*'), [0, 38].pack('C*'), [0, 80].pack('C*'), [24, 128].pack('C*'), [48, 31].pack('C*'), [34, 0].pack('C*'), [102, 12].pack('C*'), [255, 218].pack('C*'), [0, 56].pack('C*'), [102, 2].pack('C*'), [48, 44].pack('C*'), [32, 12].pack('C*'), [45, 110].pack('C*'), [66, 64].pack('C*'), [255, 226].pack('C*'), [169, 240].pack('C*'), [255, 0].pack('C*'), [55, 124].pack('C*'), [229, 128].pack('C*'), [255, 220].pack('C*'), [72, 104].pack('C*'), [89, 79].pack('C*'), [0, 52].pack('C*'), [62, 31].pack('C*'), [96, 8].pack('C*'), [47, 6].pack('C*'), [255, 222].pack('C*'), [96, 10].pack('C*'), [112, 2].pack('C*'), [0, 50].pack('C*'), [255, 204].pack('C*'), [0, 128].pack('C*'), [34, 81].pack('C*'), [16, 31].pack('C*'), [49, 124].pack('C*'), [160, 41].pack('C*'), [255, 216].pack('C*'), [82, 64].pack('C*'), [1, 0].pack('C*'), [103, 16].pack('C*'), [160, 35].pack('C*'), [255, 206].pack('C*'), [255, 212].pack('C*'), [32, 6].pack('C*'), [72, 120].pack('C*'), [0, 46].pack('C*'), [80, 79].pack('C*'), [67, 250].pack('C*'), [103, 18].pack('C*'), [118, 0].pack('C*'), [65, 232].pack('C*'), [74, 110].pack('C*'), [32, 217].pack('C*'), [0, 90].pack('C*'), [127, 255].pack('C*'), [81, 202].pack('C*'), [0, 92].pack('C*'), [46, 0].pack('C*'), [2, 64].pack('C*'), [72, 199].pack('C*'), [103, 20].pack('C*'), [12, 128].pack('C*'), [46, 159].pack('C*'), [255, 214].pack('C*'), [128, 0].pack('C*'), [16, 0].pack('C*'), [72, 66].pack('C*'), [74, 107].pack('C*'), [255, 210].pack('C*'), [0, 72].pack('C*'), [74, 71].pack('C*'), [78, 209].pack('C*'), [32, 111].pack('C*'), [0, 65].pack('C*'), [96, 12].pack('C*'), [42, 120].pack('C*'), [66, 46].pack('C*'), [50, 0].pack('C*'), [101, 116].pack('C*'), [103, 22].pack('C*'), [0, 68].pack('C*'), [72, 109].pack('C*'), [32, 8].pack('C*'), [72, 108].pack('C*'), [11, 124].pack('C*'), [38, 64].pack('C*'), [4, 0].pack('C*'), [0, 104].pack('C*'), [32, 109].pack('C*'), [0, 13].pack('C*'), [42, 64].pack('C*'), [0, 11].pack('C*'), [0, 62].pack('C*'), [2, 32].pack('C*')]
    @default_lookup_table
  end

  ##
  # The lookup table to be used for this compressed data.
  def lookup_table
    return @lookup_table unless @lookup_table.nil?
    @lookup_table = (header_parameters.flags.has_custom_lookup_table ? custom_lookup_table : default_lookup_table)
    @lookup_table
  end

  ##
  # The custom lookup table to be used instead of the default lookup table.
  attr_reader :custom_lookup_table

  ##
  # The compressed data.
  # The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
  attr_reader :data

  ##
  # The last byte of the decompressed data,
  # stored literally.
  # Only present if the decompressed data has an odd length.
  # 
  # This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
  # either literally or as table references,
  # so otherwise there would be no way to compress odd-length resources using this format.
  attr_reader :last_byte

  ##
  # The length of the decompressed data in bytes,
  # from the compressed resource header.
  attr_reader :len_decompressed

  ##
  # The unparsed decompressor-specific parameters,
  # from the compressed resource header.
  attr_reader :header_parameters_with_io
  attr_reader :_raw_data
end
