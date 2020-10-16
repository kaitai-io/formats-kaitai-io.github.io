# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The Real-time Transport Protocol (RTP) is a widely used network
# protocol for transmitting audio or video. It usually works with the
# RTP Control Protocol (RTCP). The transmission can be based on
# Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
class RtpPacket < Kaitai::Struct::Struct

  PAYLOAD_TYPE_ENUM = {
    0 => :payload_type_enum_pcmu,
    1 => :payload_type_enum_reserved1,
    2 => :payload_type_enum_reserved2,
    3 => :payload_type_enum_gsm,
    4 => :payload_type_enum_g723,
    5 => :payload_type_enum_dvi4_1,
    6 => :payload_type_enum_dvi4_2,
    7 => :payload_type_enum_lpc,
    8 => :payload_type_enum_pama,
    9 => :payload_type_enum_g722,
    10 => :payload_type_enum_l16_1,
    11 => :payload_type_enum_l16_2,
    12 => :payload_type_enum_qcelp,
    13 => :payload_type_enum_cn,
    14 => :payload_type_enum_mpa,
    15 => :payload_type_enum_g728,
    16 => :payload_type_enum_dvi4_3,
    17 => :payload_type_enum_dvi4_4,
    18 => :payload_type_enum_g729,
    19 => :payload_type_enum_reserved3,
    20 => :payload_type_enum_unassigned1,
    21 => :payload_type_enum_unassigned2,
    22 => :payload_type_enum_unassigned3,
    23 => :payload_type_enum_unassigned4,
    24 => :payload_type_enum_unassigned5,
    25 => :payload_type_enum_celb,
    26 => :payload_type_enum_jpeg,
    27 => :payload_type_enum_unassigned6,
    28 => :payload_type_enum_nv,
    29 => :payload_type_enum_unassigned7,
    30 => :payload_type_enum_unassigned8,
    31 => :payload_type_enum_h261,
    32 => :payload_type_enum_mpv,
    33 => :payload_type_enum_mp2t,
    34 => :payload_type_enum_h263,
    96 => :payload_type_enum_mpeg_ps,
  }
  I__PAYLOAD_TYPE_ENUM = PAYLOAD_TYPE_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = @_io.read_bits_int_be(2)
    @has_padding = @_io.read_bits_int_be(1) != 0
    @has_extension = @_io.read_bits_int_be(1) != 0
    @csrc_count = @_io.read_bits_int_be(4)
    @marker = @_io.read_bits_int_be(1) != 0
    @payload_type = Kaitai::Struct::Stream::resolve_enum(PAYLOAD_TYPE_ENUM, @_io.read_bits_int_be(7))
    @_io.align_to_byte
    @sequence_number = @_io.read_u2be
    @timestamp = @_io.read_u4be
    @ssrc = @_io.read_u4be
    if has_extension
      @header_extension = HeaderExtention.new(@_io, self, @_root)
    end
    @data = @_io.read_bytes(((_io.size - _io.pos) - len_padding))
    @padding = @_io.read_bytes(len_padding)
    self
  end
  class HeaderExtention < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u2be
      @length = @_io.read_u2be
      self
    end
    attr_reader :id
    attr_reader :length
  end

  ##
  # If padding bit is enabled, last byte of data contains number of
  # bytes appended to the payload as padding.
  def len_padding_if_exists
    return @len_padding_if_exists unless @len_padding_if_exists.nil?
    if has_padding
      _pos = @_io.pos
      @_io.seek((_io.size - 1))
      @len_padding_if_exists = @_io.read_u1
      @_io.seek(_pos)
    end
    @len_padding_if_exists
  end

  ##
  # Always returns number of padding bytes to in the payload.
  def len_padding
    return @len_padding unless @len_padding.nil?
    @len_padding = (has_padding ? len_padding_if_exists : 0)
    @len_padding
  end
  attr_reader :version
  attr_reader :has_padding
  attr_reader :has_extension
  attr_reader :csrc_count
  attr_reader :marker
  attr_reader :payload_type
  attr_reader :sequence_number
  attr_reader :timestamp
  attr_reader :ssrc
  attr_reader :header_extension

  ##
  # Payload without padding.
  attr_reader :data
  attr_reader :padding
end
