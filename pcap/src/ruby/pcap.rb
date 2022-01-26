# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# PCAP (named after libpcap / winpcap) is a popular format for saving
# network traffic grabbed by network sniffers. It is typically
# produced by tools like [tcpdump](https://www.tcpdump.org/) or
# [Wireshark](https://www.wireshark.org/).
# @see http://wiki.wireshark.org/Development/LibpcapFileFormat Source
class Pcap < Kaitai::Struct::Struct

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
    182 => :linktype_mfr,
    187 => :linktype_bluetooth_hci_h4,
    189 => :linktype_usb_linux,
    192 => :linktype_ppi,
    195 => :linktype_ieee802_15_4_withfcs,
    196 => :linktype_sita,
    197 => :linktype_erf,
    201 => :linktype_bluetooth_hci_h4_with_phdr,
    202 => :linktype_ax25_kiss,
    203 => :linktype_lapd,
    204 => :linktype_ppp_with_dir,
    205 => :linktype_c_hdlc_with_dir,
    206 => :linktype_frelay_with_dir,
    207 => :linktype_lapb_with_dir,
    209 => :linktype_ipmb_linux,
    210 => :linktype_flexray,
    212 => :linktype_lin,
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
    265 => :linktype_rds,
    266 => :linktype_usb_darwin,
    268 => :linktype_sdlc,
    270 => :linktype_loratap,
    271 => :linktype_vsock,
    272 => :linktype_nordic_ble,
    273 => :linktype_docsis31_xra31,
    274 => :linktype_ethernet_mpacket,
    275 => :linktype_displayport_aux,
    276 => :linktype_linux_sll2,
    278 => :linktype_openvizsla,
    279 => :linktype_ebhscr,
    280 => :linktype_vpp_dispatch,
    281 => :linktype_dsa_tag_brcm,
    282 => :linktype_dsa_tag_brcm_prepend,
    283 => :linktype_ieee802_15_4_tap,
    284 => :linktype_dsa_tag_dsa,
    285 => :linktype_dsa_tag_edsa,
    286 => :linktype_elee,
    287 => :linktype_zwave_serial,
    288 => :linktype_usb_2_0,
    289 => :linktype_atsc_alp,
    290 => :linktype_etw,
    292 => :linktype_zboss_ncp,
  }
  I__LINKTYPE = LINKTYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @hdr = Header.new(@_io, self, @_root)
    @packets = []
    i = 0
    while not @_io.eof?
      @packets << Packet.new(@_io, self, @_root)
      i += 1
    end
    self
  end

  ##
  # @see https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header Source
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic_number = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([212, 195, 178, 161].pack('C*'), magic_number, _io, "/types/header/seq/0") if not magic_number == [212, 195, 178, 161].pack('C*')
      @version_major = @_io.read_u2le
      raise Kaitai::Struct::ValidationNotEqualError.new(2, version_major, _io, "/types/header/seq/1") if not version_major == 2
      @version_minor = @_io.read_u2le
      @thiszone = @_io.read_s4le
      @sigfigs = @_io.read_u4le
      @snaplen = @_io.read_u4le
      @network = Kaitai::Struct::Stream::resolve_enum(Pcap::LINKTYPE, @_io.read_u4le)
      self
    end
    attr_reader :magic_number
    attr_reader :version_major
    attr_reader :version_minor

    ##
    # Correction time in seconds between UTC and the local
    # timezone of the following packet header timestamps.
    attr_reader :thiszone

    ##
    # In theory, the accuracy of time stamps in the capture; in
    # practice, all tools set it to 0.
    attr_reader :sigfigs

    ##
    # The "snapshot length" for the capture (typically 65535 or
    # even more, but might be limited by the user), see: incl_len
    # vs. orig_len.
    attr_reader :snaplen

    ##
    # Link-layer header type, specifying the type of headers at
    # the beginning of the packet.
    attr_reader :network
  end

  ##
  # @see https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header Source
  class Packet < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ts_sec = @_io.read_u4le
      @ts_usec = @_io.read_u4le
      @incl_len = @_io.read_u4le
      @orig_len = @_io.read_u4le
      case _root.hdr.network
      when :linktype_ppi
        @_raw_body = @_io.read_bytes(incl_len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PacketPpi.new(_io__raw_body)
      when :linktype_ethernet
        @_raw_body = @_io.read_bytes(incl_len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = EthernetFrame.new(_io__raw_body)
      else
        @body = @_io.read_bytes(incl_len)
      end
      self
    end
    attr_reader :ts_sec
    attr_reader :ts_usec

    ##
    # Number of bytes of packet data actually captured and saved in the file.
    attr_reader :incl_len

    ##
    # Length of the packet as it appeared on the network when it was captured.
    attr_reader :orig_len

    ##
    # @see https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data Source
    attr_reader :body
    attr_reader :_raw_body
  end
  attr_reader :hdr
  attr_reader :packets
end
