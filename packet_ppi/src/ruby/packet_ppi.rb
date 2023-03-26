# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# PPI is a standard for link layer packet encapsulation, proposed as
# generic extensible container to store both captured in-band data and
# out-of-band data. Originally it was developed to provide 802.11n
# radio information, but can be used for other purposes as well.
# 
# Sample capture:
# <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
# @see https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3
class PacketPpi < Kaitai::Struct::Struct

  PFH_TYPE = {
    2 => :pfh_type_radio_802_11_common,
    3 => :pfh_type_radio_802_11n_mac_ext,
    4 => :pfh_type_radio_802_11n_mac_phy_ext,
    5 => :pfh_type_spectrum_map,
    6 => :pfh_type_process_info,
    7 => :pfh_type_capture_info,
  }
  I__PFH_TYPE = PFH_TYPE.invert

  LINKTYPE = {
    0 => :linktype_null_linktype,
    1 => :linktype_ethernet,
    3 => :linktype_ax25,
    6 => :linktype_ieee802_5,
    7 => :linktype_arcnet_bsd,
    8 => :linktype_slip,
    9 => :linktype_ppp,
    10 => :linktype_fddi,
    50 => :linktype_ppp_hdlc,
    51 => :linktype_ppp_ether,
    100 => :linktype_atm_rfc1483,
    101 => :linktype_raw,
    104 => :linktype_c_hdlc,
    105 => :linktype_ieee802_11,
    107 => :linktype_frelay,
    108 => :linktype_loop,
    113 => :linktype_linux_sll,
    114 => :linktype_ltalk,
    117 => :linktype_pflog,
    119 => :linktype_ieee802_11_prism,
    122 => :linktype_ip_over_fc,
    123 => :linktype_sunatm,
    127 => :linktype_ieee802_11_radiotap,
    129 => :linktype_arcnet_linux,
    138 => :linktype_apple_ip_over_ieee1394,
    139 => :linktype_mtp2_with_phdr,
    140 => :linktype_mtp2,
    141 => :linktype_mtp3,
    142 => :linktype_sccp,
    143 => :linktype_docsis,
    144 => :linktype_linux_irda,
    147 => :linktype_user0,
    148 => :linktype_user1,
    149 => :linktype_user2,
    150 => :linktype_user3,
    151 => :linktype_user4,
    152 => :linktype_user5,
    153 => :linktype_user6,
    154 => :linktype_user7,
    155 => :linktype_user8,
    156 => :linktype_user9,
    157 => :linktype_user10,
    158 => :linktype_user11,
    159 => :linktype_user12,
    160 => :linktype_user13,
    161 => :linktype_user14,
    162 => :linktype_user15,
    163 => :linktype_ieee802_11_avs,
    165 => :linktype_bacnet_ms_tp,
    166 => :linktype_ppp_pppd,
    169 => :linktype_gprs_llc,
    170 => :linktype_gpf_t,
    171 => :linktype_gpf_f,
    177 => :linktype_linux_lapd,
    187 => :linktype_bluetooth_hci_h4,
    189 => :linktype_usb_linux,
    192 => :linktype_ppi,
    195 => :linktype_ieee802_15_4,
    196 => :linktype_sita,
    197 => :linktype_erf,
    201 => :linktype_bluetooth_hci_h4_with_phdr,
    202 => :linktype_ax25_kiss,
    203 => :linktype_lapd,
    204 => :linktype_ppp_with_dir,
    205 => :linktype_c_hdlc_with_dir,
    206 => :linktype_frelay_with_dir,
    209 => :linktype_ipmb_linux,
    215 => :linktype_ieee802_15_4_nonask_phy,
    220 => :linktype_usb_linux_mmapped,
    224 => :linktype_fc_2,
    225 => :linktype_fc_2_with_frame_delims,
    226 => :linktype_ipnet,
    227 => :linktype_can_socketcan,
    228 => :linktype_ipv4,
    229 => :linktype_ipv6,
    230 => :linktype_ieee802_15_4_nofcs,
    231 => :linktype_dbus,
    235 => :linktype_dvb_ci,
    236 => :linktype_mux27010,
    237 => :linktype_stanag_5066_d_pdu,
    239 => :linktype_nflog,
    240 => :linktype_netanalyzer,
    241 => :linktype_netanalyzer_transparent,
    242 => :linktype_ipoib,
    243 => :linktype_mpeg_2_ts,
    244 => :linktype_ng40,
    245 => :linktype_nfc_llcp,
    247 => :linktype_infiniband,
    248 => :linktype_sctp,
    249 => :linktype_usbpcap,
    250 => :linktype_rtac_serial,
    251 => :linktype_bluetooth_le_ll,
    253 => :linktype_netlink,
    254 => :linktype_bluetooth_linux_monitor,
    255 => :linktype_bluetooth_bredr_bb,
    256 => :linktype_bluetooth_le_ll_with_phdr,
    257 => :linktype_profibus_dl,
    258 => :linktype_pktap,
    259 => :linktype_epon,
    260 => :linktype_ipmi_hpm_2,
    261 => :linktype_zwave_r1_r2,
    262 => :linktype_zwave_r3,
    263 => :linktype_wattstopper_dlm,
    264 => :linktype_iso_14443,
  }
  I__LINKTYPE = LINKTYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = PacketPpiHeader.new(@_io, self, @_root)
    @_raw_fields = @_io.read_bytes((header.pph_len - 8))
    _io__raw_fields = Kaitai::Struct::Stream.new(@_raw_fields)
    @fields = PacketPpiFields.new(_io__raw_fields, self, @_root)
    case header.pph_dlt
    when :linktype_ppi
      @_raw_body = @_io.read_bytes_full
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = PacketPpi.new(_io__raw_body)
    when :linktype_ethernet
      @_raw_body = @_io.read_bytes_full
      _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
      @body = EthernetFrame.new(_io__raw_body)
    else
      @body = @_io.read_bytes_full
    end
    self
  end
  class PacketPpiFields < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << PacketPpiField.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # @see https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.3
  class Radio80211nMacExtBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = MacFlags.new(@_io, self, @_root)
      @a_mpdu_id = @_io.read_u4le
      @num_delimiters = @_io.read_u1
      @reserved = @_io.read_bytes(3)
      self
    end
    attr_reader :flags
    attr_reader :a_mpdu_id
    attr_reader :num_delimiters
    attr_reader :reserved
  end
  class MacFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @unused1 = @_io.read_bits_int_be(1) != 0
      @aggregate_delimiter = @_io.read_bits_int_be(1) != 0
      @more_aggregates = @_io.read_bits_int_be(1) != 0
      @aggregate = @_io.read_bits_int_be(1) != 0
      @dup_rx = @_io.read_bits_int_be(1) != 0
      @rx_short_guard = @_io.read_bits_int_be(1) != 0
      @is_ht_40 = @_io.read_bits_int_be(1) != 0
      @greenfield = @_io.read_bits_int_be(1) != 0
      @_io.align_to_byte
      @unused2 = @_io.read_bytes(3)
      self
    end
    attr_reader :unused1

    ##
    # Aggregate delimiter CRC error after this frame
    attr_reader :aggregate_delimiter

    ##
    # More aggregates
    attr_reader :more_aggregates

    ##
    # Aggregate
    attr_reader :aggregate

    ##
    # Duplicate RX
    attr_reader :dup_rx

    ##
    # RX short guard interval (SGI)
    attr_reader :rx_short_guard

    ##
    # true = HT40, false = HT20
    attr_reader :is_ht_40

    ##
    # Greenfield
    attr_reader :greenfield
    attr_reader :unused2
  end

  ##
  # @see https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3.1
  class PacketPpiHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pph_version = @_io.read_u1
      @pph_flags = @_io.read_u1
      @pph_len = @_io.read_u2le
      @pph_dlt = Kaitai::Struct::Stream::resolve_enum(PacketPpi::LINKTYPE, @_io.read_u4le)
      self
    end
    attr_reader :pph_version
    attr_reader :pph_flags
    attr_reader :pph_len
    attr_reader :pph_dlt
  end

  ##
  # @see https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.2
  class Radio80211CommonBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tsf_timer = @_io.read_u8le
      @flags = @_io.read_u2le
      @rate = @_io.read_u2le
      @channel_freq = @_io.read_u2le
      @channel_flags = @_io.read_u2le
      @fhss_hopset = @_io.read_u1
      @fhss_pattern = @_io.read_u1
      @dbm_antsignal = @_io.read_s1
      @dbm_antnoise = @_io.read_s1
      self
    end
    attr_reader :tsf_timer
    attr_reader :flags
    attr_reader :rate
    attr_reader :channel_freq
    attr_reader :channel_flags
    attr_reader :fhss_hopset
    attr_reader :fhss_pattern
    attr_reader :dbm_antsignal
    attr_reader :dbm_antnoise
  end

  ##
  # @see https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 3.1
  class PacketPpiField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pfh_type = Kaitai::Struct::Stream::resolve_enum(PacketPpi::PFH_TYPE, @_io.read_u2le)
      @pfh_datalen = @_io.read_u2le
      case pfh_type
      when :pfh_type_radio_802_11_common
        @_raw_body = @_io.read_bytes(pfh_datalen)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Radio80211CommonBody.new(_io__raw_body, self, @_root)
      when :pfh_type_radio_802_11n_mac_ext
        @_raw_body = @_io.read_bytes(pfh_datalen)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Radio80211nMacExtBody.new(_io__raw_body, self, @_root)
      when :pfh_type_radio_802_11n_mac_phy_ext
        @_raw_body = @_io.read_bytes(pfh_datalen)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Radio80211nMacPhyExtBody.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(pfh_datalen)
      end
      self
    end
    attr_reader :pfh_type
    attr_reader :pfh_datalen
    attr_reader :body
    attr_reader :_raw_body
  end

  ##
  # @see https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf PPI header format spec, section 4.1.4
  class Radio80211nMacPhyExtBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = MacFlags.new(@_io, self, @_root)
      @a_mpdu_id = @_io.read_u4le
      @num_delimiters = @_io.read_u1
      @mcs = @_io.read_u1
      @num_streams = @_io.read_u1
      @rssi_combined = @_io.read_u1
      @rssi_ant_ctl = []
      (4).times { |i|
        @rssi_ant_ctl << @_io.read_u1
      }
      @rssi_ant_ext = []
      (4).times { |i|
        @rssi_ant_ext << @_io.read_u1
      }
      @ext_channel_freq = @_io.read_u2le
      @ext_channel_flags = ChannelFlags.new(@_io, self, @_root)
      @rf_signal_noise = []
      (4).times { |i|
        @rf_signal_noise << SignalNoise.new(@_io, self, @_root)
      }
      @evm = []
      (4).times { |i|
        @evm << @_io.read_u4le
      }
      self
    end
    class ChannelFlags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @spectrum_2ghz = @_io.read_bits_int_be(1) != 0
        @ofdm = @_io.read_bits_int_be(1) != 0
        @cck = @_io.read_bits_int_be(1) != 0
        @turbo = @_io.read_bits_int_be(1) != 0
        @unused = @_io.read_bits_int_be(8)
        @gfsk = @_io.read_bits_int_be(1) != 0
        @dyn_cck_ofdm = @_io.read_bits_int_be(1) != 0
        @only_passive_scan = @_io.read_bits_int_be(1) != 0
        @spectrum_5ghz = @_io.read_bits_int_be(1) != 0
        self
      end

      ##
      # 2 GHz spectrum
      attr_reader :spectrum_2ghz

      ##
      # OFDM (Orthogonal Frequency-Division Multiplexing)
      attr_reader :ofdm

      ##
      # CCK (Complementary Code Keying)
      attr_reader :cck
      attr_reader :turbo
      attr_reader :unused

      ##
      # Gaussian Frequency Shift Keying
      attr_reader :gfsk

      ##
      # Dynamic CCK-OFDM
      attr_reader :dyn_cck_ofdm

      ##
      # Only passive scan allowed
      attr_reader :only_passive_scan

      ##
      # 5 GHz spectrum
      attr_reader :spectrum_5ghz
    end

    ##
    # RF signal + noise pair at a single antenna
    class SignalNoise < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @signal = @_io.read_s1
        @noise = @_io.read_s1
        self
      end

      ##
      # RF signal, dBm
      attr_reader :signal

      ##
      # RF noise, dBm
      attr_reader :noise
    end
    attr_reader :flags
    attr_reader :a_mpdu_id
    attr_reader :num_delimiters

    ##
    # Modulation Coding Scheme (MCS)
    attr_reader :mcs

    ##
    # Number of spatial streams (0 = unknown)
    attr_reader :num_streams

    ##
    # RSSI (Received Signal Strength Indication), combined from all active antennas / channels
    attr_reader :rssi_combined

    ##
    # RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
    attr_reader :rssi_ant_ctl

    ##
    # RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
    attr_reader :rssi_ant_ext

    ##
    # Extension channel frequency (MHz)
    attr_reader :ext_channel_freq

    ##
    # Extension channel flags
    attr_reader :ext_channel_flags

    ##
    # Signal + noise values for antennas 0-3
    attr_reader :rf_signal_noise

    ##
    # EVM (Error Vector Magnitude) for chains 0-3
    attr_reader :evm
  end
  attr_reader :header
  attr_reader :fields
  attr_reader :body
  attr_reader :_raw_fields
  attr_reader :_raw_body
end
