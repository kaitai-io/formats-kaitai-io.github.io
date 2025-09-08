# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Ogg is a popular media container format, which provides basic
# streaming / buffering mechanisms and is content-agnostic. Most
# popular codecs that are used within Ogg streams are Vorbis (thus
# making Ogg/Vorbis streams) and Theora (Ogg/Theora).
# 
# Ogg stream is a sequence Ogg pages. They can be read sequentially,
# or one can jump into arbitrary stream location and scan for "OggS"
# sync code to find the beginning of a new Ogg page and continue
# decoding the stream contents from that one.
class Ogg < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @pages = []
    i = 0
    while not @_io.eof?
      @pages << Page.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # Ogg page is a basic unit of data in an Ogg bitstream, usually
  # it's around 4-8 KB, with a maximum size of 65307 bytes.
  class Page < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sync_code = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([79, 103, 103, 83].pack('C*'), @sync_code, @_io, "/types/page/seq/0") if not @sync_code == [79, 103, 103, 83].pack('C*')
      @version = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), @version, @_io, "/types/page/seq/1") if not @version == [0].pack('C*')
      @reserved1 = @_io.read_bits_int_be(5)
      @is_end_of_stream = @_io.read_bits_int_be(1) != 0
      @is_beginning_of_stream = @_io.read_bits_int_be(1) != 0
      @is_continuation = @_io.read_bits_int_be(1) != 0
      @_io.align_to_byte
      @granule_pos = @_io.read_u8le
      @bitstream_serial = @_io.read_u4le
      @page_seq_num = @_io.read_u4le
      @crc32 = @_io.read_u4le
      @num_segments = @_io.read_u1
      @len_segments = []
      (num_segments).times { |i|
        @len_segments << @_io.read_u1
      }
      @segments = []
      (num_segments).times { |i|
        @segments << @_io.read_bytes(len_segments[i])
      }
      self
    end
    attr_reader :sync_code

    ##
    # Version of the Ogg bitstream format. Currently must be 0.
    attr_reader :version
    attr_reader :reserved1

    ##
    # EOS (End Of Stream) mark. This page is the last page in the
    # logical bitstream. The EOS flag must be set on the final page of
    # every logical bitstream, and must not be set on any other page.
    attr_reader :is_end_of_stream

    ##
    # BOS (Beginning Of Stream) mark. This page is the first page in
    # the logical bitstream. The BOS flag must be set on the first
    # page of every logical bitstream, and must not be set on any
    # other page.
    attr_reader :is_beginning_of_stream

    ##
    # The first packet on this page is a continuation of the previous
    # packet in the logical bitstream.
    attr_reader :is_continuation

    ##
    # "Granule position" is the time marker in Ogg files. It is an
    # abstract value, whose meaning is determined by the codec. It
    # may, for example, be a count of the number of samples, the
    # number of frames or a more complex scheme.
    attr_reader :granule_pos

    ##
    # Serial number that identifies a page as belonging to a
    # particular logical bitstream. Each logical bitstream in a file
    # has a unique value, and this field allows implementations to
    # deliver the pages to the appropriate decoder. In a typical
    # Vorbis and Theora file, one stream is the audio (Vorbis), and
    # the other is the video (Theora).
    attr_reader :bitstream_serial

    ##
    # Sequential number of page, guaranteed to be monotonically
    # increasing for each logical bitstream. The first page is 0, the
    # second 1, etc. This allows implementations to detect when data
    # has been lost.
    attr_reader :page_seq_num

    ##
    # This field provides a CRC32 checksum of the data in the entire
    # page (including the page header, calculated with the checksum
    # field set to 0). This allows verification that the data has not
    # been corrupted since it was created. Pages that fail the
    # checksum should be discarded. The checksum is generated using a
    # polynomial value of 0x04C11DB7.
    attr_reader :crc32

    ##
    # The number of segments that exist in this page. There can be a
    # maximum of 255 segments in any one page.
    attr_reader :num_segments

    ##
    # Table of lengths of segments.
    attr_reader :len_segments

    ##
    # Segment content bytes make up the rest of the Ogg page.
    attr_reader :segments
  end
  attr_reader :pages
end
