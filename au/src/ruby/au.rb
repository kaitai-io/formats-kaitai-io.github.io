# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The NeXT/Sun audio file format.
# 
# Sample files:
# 
# * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
# * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
# * <https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
# @see https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html Source
# @see http://soundfile.sapp.org/doc/NextFormat/ Source
# @see http://soundfile.sapp.org/doc/NextFormat/soundstruct.h Source
# @see https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112 Source
# @see https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74 Source
# @see https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49 Source
# @see https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96 Source
class Au < Kaitai::Struct::Struct

  ENCODINGS = {
    1 => :encodings_mulaw_8,
    2 => :encodings_linear_8,
    3 => :encodings_linear_16,
    4 => :encodings_linear_24,
    5 => :encodings_linear_32,
    6 => :encodings_float,
    7 => :encodings_double,
    8 => :encodings_fragmented,
    9 => :encodings_nested,
    10 => :encodings_dsp_core,
    11 => :encodings_fixed_point_8,
    12 => :encodings_fixed_point_16,
    13 => :encodings_fixed_point_24,
    14 => :encodings_fixed_point_32,
    16 => :encodings_display,
    17 => :encodings_mulaw_squelch,
    18 => :encodings_emphasized,
    19 => :encodings_compressed,
    20 => :encodings_compressed_emphasized,
    21 => :encodings_dsp_commands,
    22 => :encodings_dsp_commands_samples,
    23 => :encodings_adpcm_g721,
    24 => :encodings_adpcm_g722,
    25 => :encodings_adpcm_g723_3,
    26 => :encodings_adpcm_g723_5,
    27 => :encodings_alaw_8,
    28 => :encodings_aes,
    29 => :encodings_delta_mulaw_8,
  }
  I__ENCODINGS = ENCODINGS.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([46, 115, 110, 100].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [46, 115, 110, 100].pack('C*')
    @ofs_data = @_io.read_u4be
    _io_header = @_io.substream((ofs_data - 4) - 4)
    @header = Header.new(_io_header, self, @_root)
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data_size = @_io.read_u4be
      @encoding = Kaitai::Struct::Stream::resolve_enum(Au::ENCODINGS, @_io.read_u4be)
      @sample_rate = @_io.read_u4be
      @num_channels = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @num_channels, @_io, "/types/header/seq/3") if not @num_channels >= 1
      @comment = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes_full, 0, false)).force_encoding("ASCII").encode('UTF-8')
      self
    end

    ##
    # don't read this field, access `_root.len_data` instead
    # 
    # value `0xffff_ffff` means unspecified size
    attr_reader :data_size
    attr_reader :encoding
    attr_reader :sample_rate

    ##
    # number of interleaved channels
    attr_reader :num_channels

    ##
    # Most resources claim that this field must be at least 4 bytes long.
    # However, most programs don't enforce it, and [Audacity](
    # https://www.audacityteam.org/) even generates .au files with this field
    # being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
    # "NeXT files require that this chunk be at least 4 bytes (chars) long,
    # whereas this chunk may be zerolength in a Sun .au file."
    # 
    # By convention, size should be a multiple of 4 -
    # see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
    # Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
    # sound playing programs, this field must have an even byte size. So a multiple
    # of 4 is probably best for compatibility.
    # 
    # Must be null-terminated. It is usually an ASCII text string, but this space
    # might be also used to store application-specific binary (i.e. non-ASCII) data.
    attr_reader :comment
  end
  def len_data
    return @len_data unless @len_data.nil?
    @len_data = (header.data_size == 4294967295 ? _io.size - ofs_data : header.data_size)
    @len_data
  end
  attr_reader :magic
  attr_reader :ofs_data
  attr_reader :header
  attr_reader :_raw_header
end
