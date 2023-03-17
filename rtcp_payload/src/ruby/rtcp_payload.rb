# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# RTCP is the Real-Time Control Protocol
# @see https://www.rfc-editor.org/rfc/rfc3550 Source
class RtcpPayload < Kaitai::Struct::Struct

  PAYLOAD_TYPE = {
    192 => :payload_type_fir,
    193 => :payload_type_nack,
    195 => :payload_type_ij,
    200 => :payload_type_sr,
    201 => :payload_type_rr,
    202 => :payload_type_sdes,
    203 => :payload_type_bye,
    204 => :payload_type_app,
    205 => :payload_type_rtpfb,
    206 => :payload_type_psfb,
    207 => :payload_type_xr,
    208 => :payload_type_avb,
    209 => :payload_type_rsi,
  }
  I__PAYLOAD_TYPE = PAYLOAD_TYPE.invert

  SDES_SUBTYPE = {
    0 => :sdes_subtype_pad,
    1 => :sdes_subtype_cname,
    2 => :sdes_subtype_name,
    3 => :sdes_subtype_email,
    4 => :sdes_subtype_phone,
    5 => :sdes_subtype_loc,
    6 => :sdes_subtype_tool,
    7 => :sdes_subtype_note,
    8 => :sdes_subtype_priv,
  }
  I__SDES_SUBTYPE = SDES_SUBTYPE.invert

  PSFB_SUBTYPE = {
    1 => :psfb_subtype_pli,
    2 => :psfb_subtype_sli,
    3 => :psfb_subtype_rpsi,
    4 => :psfb_subtype_fir,
    5 => :psfb_subtype_tstr,
    6 => :psfb_subtype_tstn,
    7 => :psfb_subtype_vbcm,
    15 => :psfb_subtype_afb,
  }
  I__PSFB_SUBTYPE = PSFB_SUBTYPE.invert

  RTPFB_SUBTYPE = {
    1 => :rtpfb_subtype_nack,
    3 => :rtpfb_subtype_tmmbr,
    4 => :rtpfb_subtype_tmmbn,
    5 => :rtpfb_subtype_rrr,
    15 => :rtpfb_subtype_transport_feedback,
  }
  I__RTPFB_SUBTYPE = RTPFB_SUBTYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @rtcp_packets = []
    i = 0
    while not @_io.eof?
      @rtcp_packets << RtcpPacket.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class PsfbAfbRembPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_ssrc = @_io.read_u1
      @br_exp = @_io.read_bits_int_be(6)
      @br_mantissa = @_io.read_bits_int_be(18)
      @_io.align_to_byte
      @ssrc_list = []
      (num_ssrc).times { |i|
        @ssrc_list << @_io.read_u4be
      }
      self
    end
    def max_total_bitrate
      return @max_total_bitrate unless @max_total_bitrate.nil?
      @max_total_bitrate = (br_mantissa * (1 << br_exp))
      @max_total_bitrate
    end
    attr_reader :num_ssrc
    attr_reader :br_exp
    attr_reader :br_mantissa
    attr_reader :ssrc_list
  end
  class SrPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ssrc = @_io.read_u4be
      @ntp_msw = @_io.read_u4be
      @ntp_lsw = @_io.read_u4be
      @rtp_timestamp = @_io.read_u4be
      @sender_packet_count = @_io.read_u4be
      @sender_octet_count = @_io.read_u4be
      @report_block = []
      (_parent.subtype).times { |i|
        @report_block << ReportBlock.new(@_io, self, @_root)
      }
      self
    end
    def ntp
      return @ntp unless @ntp.nil?
      @ntp = ((ntp_msw << 32) & ntp_lsw)
      @ntp
    end
    attr_reader :ssrc
    attr_reader :ntp_msw
    attr_reader :ntp_lsw
    attr_reader :rtp_timestamp
    attr_reader :sender_packet_count
    attr_reader :sender_octet_count
    attr_reader :report_block
  end
  class RrPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ssrc = @_io.read_u4be
      @report_block = []
      (_parent.subtype).times { |i|
        @report_block << ReportBlock.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :ssrc
    attr_reader :report_block
  end
  class RtcpPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_bits_int_be(2)
      @padding = @_io.read_bits_int_be(1) != 0
      @subtype = @_io.read_bits_int_be(5)
      @_io.align_to_byte
      @payload_type = Kaitai::Struct::Stream::resolve_enum(RtcpPayload::PAYLOAD_TYPE, @_io.read_u1)
      @length = @_io.read_u2be
      case payload_type
      when :payload_type_sr
        @_raw_body = @_io.read_bytes((4 * length))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SrPacket.new(_io__raw_body, self, @_root)
      when :payload_type_psfb
        @_raw_body = @_io.read_bytes((4 * length))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PsfbPacket.new(_io__raw_body, self, @_root)
      when :payload_type_rr
        @_raw_body = @_io.read_bytes((4 * length))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = RrPacket.new(_io__raw_body, self, @_root)
      when :payload_type_rtpfb
        @_raw_body = @_io.read_bytes((4 * length))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = RtpfbPacket.new(_io__raw_body, self, @_root)
      when :payload_type_sdes
        @_raw_body = @_io.read_bytes((4 * length))
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SdesPacket.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes((4 * length))
      end
      self
    end
    attr_reader :version
    attr_reader :padding
    attr_reader :subtype
    attr_reader :payload_type
    attr_reader :length
    attr_reader :body
    attr_reader :_raw_body
  end
  class SdesTlv < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(RtcpPayload::SDES_SUBTYPE, @_io.read_u1)
      if type != :sdes_subtype_pad
        @length = @_io.read_u1
      end
      if type != :sdes_subtype_pad
        @value = @_io.read_bytes(length)
      end
      self
    end
    attr_reader :type
    attr_reader :length
    attr_reader :value
  end
  class ReportBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ssrc_source = @_io.read_u4be
      @lost_val = @_io.read_u1
      @highest_seq_num_received = @_io.read_u4be
      @interarrival_jitter = @_io.read_u4be
      @lsr = @_io.read_u4be
      @dlsr = @_io.read_u4be
      self
    end
    def fraction_lost
      return @fraction_lost unless @fraction_lost.nil?
      @fraction_lost = (lost_val >> 24)
      @fraction_lost
    end
    def cumulative_packets_lost
      return @cumulative_packets_lost unless @cumulative_packets_lost.nil?
      @cumulative_packets_lost = (lost_val & 16777215)
      @cumulative_packets_lost
    end
    attr_reader :ssrc_source
    attr_reader :lost_val
    attr_reader :highest_seq_num_received
    attr_reader :interarrival_jitter
    attr_reader :lsr
    attr_reader :dlsr
  end
  class RtpfbTransportFeedbackPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @base_sequence_number = @_io.read_u2be
      @packet_status_count = @_io.read_u2be
      @b4 = @_io.read_u4be
      @remaining = @_io.read_bytes_full
      self
    end
    def reference_time
      return @reference_time unless @reference_time.nil?
      @reference_time = (b4 >> 8)
      @reference_time
    end
    def fb_pkt_count
      return @fb_pkt_count unless @fb_pkt_count.nil?
      @fb_pkt_count = (b4 & 255)
      @fb_pkt_count
    end
    def packet_status
      return @packet_status unless @packet_status.nil?
      @packet_status = @_io.read_bytes(0)
      @packet_status
    end
    def recv_delta
      return @recv_delta unless @recv_delta.nil?
      @recv_delta = @_io.read_bytes(0)
      @recv_delta
    end
    attr_reader :base_sequence_number
    attr_reader :packet_status_count
    attr_reader :b4
    attr_reader :remaining
  end
  class PsfbPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ssrc = @_io.read_u4be
      @ssrc_media_source = @_io.read_u4be
      case fmt
      when :psfb_subtype_afb
        @_raw_fci_block = @_io.read_bytes_full
        _io__raw_fci_block = Kaitai::Struct::Stream.new(@_raw_fci_block)
        @fci_block = PsfbAfbPacket.new(_io__raw_fci_block, self, @_root)
      else
        @fci_block = @_io.read_bytes_full
      end
      self
    end
    def fmt
      return @fmt unless @fmt.nil?
      @fmt = Kaitai::Struct::Stream::resolve_enum(RtcpPayload::PSFB_SUBTYPE, _parent.subtype)
      @fmt
    end
    attr_reader :ssrc
    attr_reader :ssrc_media_source
    attr_reader :fci_block
    attr_reader :_raw_fci_block
  end
  class SourceChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ssrc = @_io.read_u4be
      @sdes_tlv = []
      i = 0
      while not @_io.eof?
        @sdes_tlv << SdesTlv.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :ssrc
    attr_reader :sdes_tlv
  end
  class SdesPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @source_chunk = []
      (source_count).times { |i|
        @source_chunk << SourceChunk.new(@_io, self, @_root)
      }
      self
    end
    def source_count
      return @source_count unless @source_count.nil?
      @source_count = _parent.subtype
      @source_count
    end
    attr_reader :source_chunk
  end
  class RtpfbPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ssrc = @_io.read_u4be
      @ssrc_media_source = @_io.read_u4be
      case fmt
      when :rtpfb_subtype_transport_feedback
        @_raw_fci_block = @_io.read_bytes_full
        _io__raw_fci_block = Kaitai::Struct::Stream.new(@_raw_fci_block)
        @fci_block = RtpfbTransportFeedbackPacket.new(_io__raw_fci_block, self, @_root)
      else
        @fci_block = @_io.read_bytes_full
      end
      self
    end
    def fmt
      return @fmt unless @fmt.nil?
      @fmt = Kaitai::Struct::Stream::resolve_enum(RtcpPayload::RTPFB_SUBTYPE, _parent.subtype)
      @fmt
    end
    attr_reader :ssrc
    attr_reader :ssrc_media_source
    attr_reader :fci_block
    attr_reader :_raw_fci_block
  end
  class PacketStatusChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @t = @_io.read_bits_int_be(1) != 0
      if (t ? 1 : 0) == 0
        @s2 = @_io.read_bits_int_be(2)
      end
      if (t ? 1 : 0) == 1
        @s1 = @_io.read_bits_int_be(1) != 0
      end
      if (t ? 1 : 0) == 0
        @rle = @_io.read_bits_int_be(13)
      end
      if (t ? 1 : 0) == 1
        @symbol_list = @_io.read_bits_int_be(14)
      end
      self
    end
    def s
      return @s unless @s.nil?
      @s = ((t ? 1 : 0) == 0 ? s2 : ((s1 ? 1 : 0) == 0 ? 1 : 0))
      @s
    end
    attr_reader :t
    attr_reader :s2
    attr_reader :s1
    attr_reader :rle
    attr_reader :symbol_list
  end
  class PsfbAfbPacket < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @uid = @_io.read_u4be
      case uid
      when 1380273474
        @_raw_contents = @_io.read_bytes_full
        _io__raw_contents = Kaitai::Struct::Stream.new(@_raw_contents)
        @contents = PsfbAfbRembPacket.new(_io__raw_contents, self, @_root)
      else
        @contents = @_io.read_bytes_full
      end
      self
    end
    attr_reader :uid
    attr_reader :contents
    attr_reader :_raw_contents
  end
  attr_reader :rtcp_packets
end
