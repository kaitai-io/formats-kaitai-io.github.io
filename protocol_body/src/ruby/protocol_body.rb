# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Protocol body represents particular payload on transport level (OSI
# layer 4).
# 
# Typically this payload in encapsulated into network level (OSI layer
# 3) packet, which includes "protocol number" field that would be used
# to decide what's inside the payload and how to parse it. Thanks to
# IANA's standardization effort, multiple network level use the same
# IDs for these payloads named "protocol numbers".
# 
# This is effectively a "router" type: it expects to get protocol
# number as a parameter, and then invokes relevant type parser based
# on that parameter.
# @see http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml Source
class ProtocolBody < Kaitai::Struct::Struct

  PROTOCOL_ENUM = {
    0 => :protocol_enum_hopopt,
    1 => :protocol_enum_icmp,
    2 => :protocol_enum_igmp,
    3 => :protocol_enum_ggp,
    4 => :protocol_enum_ipv4,
    5 => :protocol_enum_st,
    6 => :protocol_enum_tcp,
    7 => :protocol_enum_cbt,
    8 => :protocol_enum_egp,
    9 => :protocol_enum_igp,
    10 => :protocol_enum_bbn_rcc_mon,
    11 => :protocol_enum_nvp_ii,
    12 => :protocol_enum_pup,
    13 => :protocol_enum_argus,
    14 => :protocol_enum_emcon,
    15 => :protocol_enum_xnet,
    16 => :protocol_enum_chaos,
    17 => :protocol_enum_udp,
    18 => :protocol_enum_mux,
    19 => :protocol_enum_dcn_meas,
    20 => :protocol_enum_hmp,
    21 => :protocol_enum_prm,
    22 => :protocol_enum_xns_idp,
    23 => :protocol_enum_trunk_1,
    24 => :protocol_enum_trunk_2,
    25 => :protocol_enum_leaf_1,
    26 => :protocol_enum_leaf_2,
    27 => :protocol_enum_rdp,
    28 => :protocol_enum_irtp,
    29 => :protocol_enum_iso_tp4,
    30 => :protocol_enum_netblt,
    31 => :protocol_enum_mfe_nsp,
    32 => :protocol_enum_merit_inp,
    33 => :protocol_enum_dccp,
    34 => :protocol_enum_x_3pc,
    35 => :protocol_enum_idpr,
    36 => :protocol_enum_xtp,
    37 => :protocol_enum_ddp,
    38 => :protocol_enum_idpr_cmtp,
    39 => :protocol_enum_tp_plus_plus,
    40 => :protocol_enum_il,
    41 => :protocol_enum_ipv6,
    42 => :protocol_enum_sdrp,
    43 => :protocol_enum_ipv6_route,
    44 => :protocol_enum_ipv6_frag,
    45 => :protocol_enum_idrp,
    46 => :protocol_enum_rsvp,
    47 => :protocol_enum_gre,
    48 => :protocol_enum_dsr,
    49 => :protocol_enum_bna,
    50 => :protocol_enum_esp,
    51 => :protocol_enum_ah,
    52 => :protocol_enum_i_nlsp,
    53 => :protocol_enum_swipe,
    54 => :protocol_enum_narp,
    55 => :protocol_enum_mobile,
    56 => :protocol_enum_tlsp,
    57 => :protocol_enum_skip,
    58 => :protocol_enum_ipv6_icmp,
    59 => :protocol_enum_ipv6_nonxt,
    60 => :protocol_enum_ipv6_opts,
    61 => :protocol_enum_any_host_internal_protocol,
    62 => :protocol_enum_cftp,
    63 => :protocol_enum_any_local_network,
    64 => :protocol_enum_sat_expak,
    65 => :protocol_enum_kryptolan,
    66 => :protocol_enum_rvd,
    67 => :protocol_enum_ippc,
    68 => :protocol_enum_any_distributed_file_system,
    69 => :protocol_enum_sat_mon,
    70 => :protocol_enum_visa,
    71 => :protocol_enum_ipcv,
    72 => :protocol_enum_cpnx,
    73 => :protocol_enum_cphb,
    74 => :protocol_enum_wsn,
    75 => :protocol_enum_pvp,
    76 => :protocol_enum_br_sat_mon,
    77 => :protocol_enum_sun_nd,
    78 => :protocol_enum_wb_mon,
    79 => :protocol_enum_wb_expak,
    80 => :protocol_enum_iso_ip,
    81 => :protocol_enum_vmtp,
    82 => :protocol_enum_secure_vmtp,
    83 => :protocol_enum_vines,
    84 => :protocol_enum_iptm,
    85 => :protocol_enum_nsfnet_igp,
    86 => :protocol_enum_dgp,
    87 => :protocol_enum_tcf,
    88 => :protocol_enum_eigrp,
    89 => :protocol_enum_ospfigp,
    90 => :protocol_enum_sprite_rpc,
    91 => :protocol_enum_larp,
    92 => :protocol_enum_mtp,
    93 => :protocol_enum_ax_25,
    94 => :protocol_enum_ipip,
    95 => :protocol_enum_micp,
    96 => :protocol_enum_scc_sp,
    97 => :protocol_enum_etherip,
    98 => :protocol_enum_encap,
    99 => :protocol_enum_any_private_encryption_scheme,
    100 => :protocol_enum_gmtp,
    101 => :protocol_enum_ifmp,
    102 => :protocol_enum_pnni,
    103 => :protocol_enum_pim,
    104 => :protocol_enum_aris,
    105 => :protocol_enum_scps,
    106 => :protocol_enum_qnx,
    107 => :protocol_enum_a_n,
    108 => :protocol_enum_ipcomp,
    109 => :protocol_enum_snp,
    110 => :protocol_enum_compaq_peer,
    111 => :protocol_enum_ipx_in_ip,
    112 => :protocol_enum_vrrp,
    113 => :protocol_enum_pgm,
    114 => :protocol_enum_any_0_hop,
    115 => :protocol_enum_l2tp,
    116 => :protocol_enum_ddx,
    117 => :protocol_enum_iatp,
    118 => :protocol_enum_stp,
    119 => :protocol_enum_srp,
    120 => :protocol_enum_uti,
    121 => :protocol_enum_smp,
    122 => :protocol_enum_sm,
    123 => :protocol_enum_ptp,
    124 => :protocol_enum_isis_over_ipv4,
    125 => :protocol_enum_fire,
    126 => :protocol_enum_crtp,
    127 => :protocol_enum_crudp,
    128 => :protocol_enum_sscopmce,
    129 => :protocol_enum_iplt,
    130 => :protocol_enum_sps,
    131 => :protocol_enum_pipe,
    132 => :protocol_enum_sctp,
    133 => :protocol_enum_fc,
    134 => :protocol_enum_rsvp_e2e_ignore,
    135 => :protocol_enum_mobility_header,
    136 => :protocol_enum_udplite,
    137 => :protocol_enum_mpls_in_ip,
    138 => :protocol_enum_manet,
    139 => :protocol_enum_hip,
    140 => :protocol_enum_shim6,
    141 => :protocol_enum_wesp,
    142 => :protocol_enum_rohc,
    255 => :protocol_enum_reserved_255,
  }
  I__PROTOCOL_ENUM = PROTOCOL_ENUM.invert
  def initialize(_io, _parent = nil, _root = self, protocol_num)
    super(_io, _parent, _root)
    @protocol_num = protocol_num
    _read
  end

  def _read
    case protocol
    when :protocol_enum_tcp
      @body = TcpSegment.new(@_io)
    when :protocol_enum_ipv6_nonxt
      @body = NoNextHeader.new(@_io, self, @_root)
    when :protocol_enum_icmp
      @body = IcmpPacket.new(@_io)
    when :protocol_enum_udp
      @body = UdpDatagram.new(@_io)
    when :protocol_enum_hopopt
      @body = OptionHopByHop.new(@_io, self, @_root)
    when :protocol_enum_ipv6
      @body = Ipv6Packet.new(@_io)
    when :protocol_enum_ipv4
      @body = Ipv4Packet.new(@_io)
    end
    self
  end

  ##
  # Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
  class NoNextHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end
  class OptionHopByHop < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @next_header_type = @_io.read_u1
      @hdr_ext_len = @_io.read_u1
      @body = @_io.read_bytes((hdr_ext_len - 1))
      @next_header = ProtocolBody.new(@_io, next_header_type)
      self
    end
    attr_reader :next_header_type
    attr_reader :hdr_ext_len
    attr_reader :body
    attr_reader :next_header
  end
  def protocol
    return @protocol unless @protocol.nil?
    @protocol = Kaitai::Struct::Stream::resolve_enum(PROTOCOL_ENUM, protocol_num)
    @protocol
  end
  attr_reader :body

  ##
  # Protocol number as an integer.
  attr_reader :protocol_num
end
