import kaitai_struct_nim_runtime
import options
import /network/tcp_segment
import /network/icmp_packet
import /network/udp_datagram
import /network/ipv4_packet
import /network/ipv6_packet

import "udp_datagram"
import "ipv4_packet"
import "icmp_packet"
import "ipv6_packet"
import "tcp_segment"
type
  ProtocolBody* = ref object of KaitaiStruct
    `body`*: KaitaiStruct
    `protocolNum`*: uint8
    `parent`*: KaitaiStruct
    `protocolInst`: ProtocolBody_ProtocolEnum
    `protocolInstFlag`: bool
  ProtocolBody_ProtocolEnum* = enum
    hopopt = 0
    icmp = 1
    igmp = 2
    ggp = 3
    ipv4 = 4
    st = 5
    tcp = 6
    cbt = 7
    egp = 8
    igp = 9
    bbn_rcc_mon = 10
    nvp_ii = 11
    pup = 12
    argus = 13
    emcon = 14
    xnet = 15
    chaos = 16
    udp = 17
    mux = 18
    dcn_meas = 19
    hmp = 20
    prm = 21
    xns_idp = 22
    trunk_1 = 23
    trunk_2 = 24
    leaf_1 = 25
    leaf_2 = 26
    rdp = 27
    irtp = 28
    iso_tp4 = 29
    netblt = 30
    mfe_nsp = 31
    merit_inp = 32
    dccp = 33
    x_3pc = 34
    idpr = 35
    xtp = 36
    ddp = 37
    idpr_cmtp = 38
    tp_plus_plus = 39
    il = 40
    ipv6 = 41
    sdrp = 42
    ipv6_route = 43
    ipv6_frag = 44
    idrp = 45
    rsvp = 46
    gre = 47
    dsr = 48
    bna = 49
    esp = 50
    ah = 51
    i_nlsp = 52
    swipe = 53
    narp = 54
    mobile = 55
    tlsp = 56
    skip = 57
    ipv6_icmp = 58
    ipv6_nonxt = 59
    ipv6_opts = 60
    any_host_internal_protocol = 61
    cftp = 62
    any_local_network = 63
    sat_expak = 64
    kryptolan = 65
    rvd = 66
    ippc = 67
    any_distributed_file_system = 68
    sat_mon = 69
    visa = 70
    ipcv = 71
    cpnx = 72
    cphb = 73
    wsn = 74
    pvp = 75
    br_sat_mon = 76
    sun_nd = 77
    wb_mon = 78
    wb_expak = 79
    iso_ip = 80
    vmtp = 81
    secure_vmtp = 82
    vines = 83
    ttp_or_iptm = 84
    nsfnet_igp = 85
    dgp = 86
    tcf = 87
    eigrp = 88
    ospfigp = 89
    sprite_rpc = 90
    larp = 91
    mtp = 92
    ax_25 = 93
    ipip = 94
    micp = 95
    scc_sp = 96
    etherip = 97
    encap = 98
    any_private_encryption_scheme = 99
    gmtp = 100
    ifmp = 101
    pnni = 102
    pim = 103
    aris = 104
    scps = 105
    qnx = 106
    a_n = 107
    ipcomp = 108
    snp = 109
    compaq_peer = 110
    ipx_in_ip = 111
    vrrp = 112
    pgm = 113
    any_0_hop = 114
    l2tp = 115
    ddx = 116
    iatp = 117
    stp = 118
    srp = 119
    uti = 120
    smp = 121
    sm = 122
    ptp = 123
    isis_over_ipv4 = 124
    fire = 125
    crtp = 126
    crudp = 127
    sscopmce = 128
    iplt = 129
    sps = 130
    pipe = 131
    sctp = 132
    fc = 133
    rsvp_e2e_ignore = 134
    mobility_header = 135
    udplite = 136
    mpls_in_ip = 137
    manet = 138
    hip = 139
    shim6 = 140
    wesp = 141
    rohc = 142
    reserved_255 = 255
  ProtocolBody_NoNextHeader* = ref object of KaitaiStruct
    `parent`*: ProtocolBody
  ProtocolBody_OptionHopByHop* = ref object of KaitaiStruct
    `nextHeaderType`*: uint8
    `hdrExtLen`*: uint8
    `body`*: seq[byte]
    `nextHeader`*: ProtocolBody
    `parent`*: ProtocolBody

proc read*(_: typedesc[ProtocolBody], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, protocolNum: any): ProtocolBody
proc read*(_: typedesc[ProtocolBody_NoNextHeader], io: KaitaiStream, root: KaitaiStruct, parent: ProtocolBody): ProtocolBody_NoNextHeader
proc read*(_: typedesc[ProtocolBody_OptionHopByHop], io: KaitaiStream, root: KaitaiStruct, parent: ProtocolBody): ProtocolBody_OptionHopByHop

proc protocol*(this: ProtocolBody): ProtocolBody_ProtocolEnum


##[
Protocol body represents particular payload on transport level (OSI
layer 4).

Typically this payload in encapsulated into network level (OSI layer
3) packet, which includes "protocol number" field that would be used
to decide what's inside the payload and how to parse it. Thanks to
IANA's standardization effort, multiple network level use the same
IDs for these payloads named "protocol numbers".

This is effectively a "router" type: it expects to get protocol
number as a parameter, and then invokes relevant type parser based
on that parameter.

@see <a href="https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Source</a>
]##
proc read*(_: typedesc[ProtocolBody], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, protocolNum: any): ProtocolBody =
  template this: untyped = result
  this = new(ProtocolBody)
  let root = if root == nil: cast[ProtocolBody](this) else: cast[ProtocolBody](root)
  this.io = io
  this.root = root
  this.parent = parent
  let protocolNumExpr = uint8(protocolNum)
  this.protocolNum = protocolNumExpr

  block:
    let on = this.protocol
    if on == protocol_body.ipv6_nonxt:
      let bodyExpr = ProtocolBody_NoNextHeader.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == protocol_body.ipv4:
      let bodyExpr = Ipv4Packet.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == protocol_body.udp:
      let bodyExpr = UdpDatagram.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == protocol_body.icmp:
      let bodyExpr = IcmpPacket.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == protocol_body.hopopt:
      let bodyExpr = ProtocolBody_OptionHopByHop.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == protocol_body.ipv6:
      let bodyExpr = Ipv6Packet.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == protocol_body.tcp:
      let bodyExpr = TcpSegment.read(this.io, this.root, this)
      this.body = bodyExpr

proc protocol(this: ProtocolBody): ProtocolBody_ProtocolEnum = 
  if this.protocolInstFlag:
    return this.protocolInst
  let protocolInstExpr = ProtocolBody_ProtocolEnum(ProtocolBody_ProtocolEnum(this.protocolNum))
  this.protocolInst = protocolInstExpr
  this.protocolInstFlag = true
  return this.protocolInst

proc fromFile*(_: typedesc[ProtocolBody], filename: string): ProtocolBody =
  ProtocolBody.read(newKaitaiFileStream(filename), nil, nil)


##[
Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
]##
proc read*(_: typedesc[ProtocolBody_NoNextHeader], io: KaitaiStream, root: KaitaiStruct, parent: ProtocolBody): ProtocolBody_NoNextHeader =
  template this: untyped = result
  this = new(ProtocolBody_NoNextHeader)
  let root = if root == nil: cast[ProtocolBody](this) else: cast[ProtocolBody](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[ProtocolBody_NoNextHeader], filename: string): ProtocolBody_NoNextHeader =
  ProtocolBody_NoNextHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ProtocolBody_OptionHopByHop], io: KaitaiStream, root: KaitaiStruct, parent: ProtocolBody): ProtocolBody_OptionHopByHop =
  template this: untyped = result
  this = new(ProtocolBody_OptionHopByHop)
  let root = if root == nil: cast[ProtocolBody](this) else: cast[ProtocolBody](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nextHeaderTypeExpr = this.io.readU1()
  this.nextHeaderType = nextHeaderTypeExpr
  let hdrExtLenExpr = this.io.readU1()
  this.hdrExtLen = hdrExtLenExpr
  let bodyExpr = this.io.readBytes(int((if this.hdrExtLen > 0: (this.hdrExtLen - 1) else: 1)))
  this.body = bodyExpr
  let nextHeaderExpr = ProtocolBody.read(this.io, this.root, this, this.nextHeaderType)
  this.nextHeader = nextHeaderExpr

proc fromFile*(_: typedesc[ProtocolBody_OptionHopByHop], filename: string): ProtocolBody_OptionHopByHop =
  ProtocolBody_OptionHopByHop.read(newKaitaiFileStream(filename), nil, nil)

