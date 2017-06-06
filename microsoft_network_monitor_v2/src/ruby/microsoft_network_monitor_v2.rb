# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
# network packet sniffing and analysis tool. It can save captured
# traffic as .cap files, which usually contain the packets and may
# contain some additional info - enhanced network info, calculated
# statistics, etc.
# 
# There are at least 2 different versions of the format: v1 and
# v2. Netmon v3 seems to use the same file format as v1.
class MicrosoftNetworkMonitorV2 < Kaitai::Struct::Struct

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
    @signature = @_io.ensure_fixed_contents([71, 77, 66, 85].pack('C*'))
    @version_minor = @_io.read_u1
    @version_major = @_io.read_u1
    @mac_type = Kaitai::Struct::Stream::resolve_enum(LINKTYPE, @_io.read_u2le)
    @time_capture_start = WindowsSystemtime.new(@_io)
    @frame_table_ofs = @_io.read_u4le
    @frame_table_len = @_io.read_u4le
    @user_data_ofs = @_io.read_u4le
    @user_data_len = @_io.read_u4le
    @comment_ofs = @_io.read_u4le
    @comment_len = @_io.read_u4le
    @statistics_ofs = @_io.read_u4le
    @statistics_len = @_io.read_u4le
    @network_info_ofs = @_io.read_u4le
    @network_info_len = @_io.read_u4le
    @conversation_stats_ofs = @_io.read_u4le
    @conversation_stats_len = @_io.read_u4le
  end
  class FrameIndex < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @entries = []
      while not @_io.eof?
        @entries << FrameIndexEntry.new(@_io, self, @_root)
      end
    end
    attr_reader :entries
  end

  ##
  # Each index entry is just a pointer to where the frame data is
  # stored in the file.
  class FrameIndexEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @ofs = @_io.read_u4le
    end

    ##
    # Frame body itself
    def body
      return @body unless @body.nil?
      io = _root._io
      _pos = io.pos
      io.seek(ofs)
      @body = Frame.new(io, self, @_root)
      io.seek(_pos)
      @body
    end

    ##
    # Absolute pointer to frame data in the file
    attr_reader :ofs
  end

  ##
  # A container for actually captured network data. Allow to
  # timestamp individual frames and designates how much data from
  # the original packet was actually written into the file.
  class Frame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @ts_delta = @_io.read_u8le
      @orig_len = @_io.read_u4le
      @inc_len = @_io.read_u4le
      case _root.mac_type
      when :linktype_ethernet
        @_raw_body = @_io.read_bytes(inc_len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = EthernetFrame.new(io)
      else
        @body = @_io.read_bytes(inc_len)
      end
    end

    ##
    # Time stamp - usecs since start of capture
    attr_reader :ts_delta

    ##
    # Actual length of packet
    attr_reader :orig_len

    ##
    # Number of octets captured in file
    attr_reader :inc_len

    ##
    # Actual packet captured from the network
    attr_reader :body
    attr_reader :_raw_body
  end

  ##
  # Index that is used to access individual captured frames
  def frame_table
    return @frame_table unless @frame_table.nil?
    _pos = @_io.pos
    @_io.seek(frame_table_ofs)
    @_raw_frame_table = @_io.read_bytes(frame_table_len)
    io = Kaitai::Struct::Stream.new(@_raw_frame_table)
    @frame_table = FrameIndex.new(io, self, @_root)
    @_io.seek(_pos)
    @frame_table
  end
  attr_reader :signature

  ##
  # Format version (minor), BCD
  attr_reader :version_minor

  ##
  # Format version (major), BCD
  attr_reader :version_major

  ##
  # Network topology type of captured data
  attr_reader :mac_type

  ##
  # Timestamp of capture start
  attr_reader :time_capture_start
  attr_reader :frame_table_ofs
  attr_reader :frame_table_len
  attr_reader :user_data_ofs
  attr_reader :user_data_len
  attr_reader :comment_ofs
  attr_reader :comment_len
  attr_reader :statistics_ofs
  attr_reader :statistics_len
  attr_reader :network_info_ofs
  attr_reader :network_info_len
  attr_reader :conversation_stats_ofs
  attr_reader :conversation_stats_len
  attr_reader :_raw_frame_table
end
