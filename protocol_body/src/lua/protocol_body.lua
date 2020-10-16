-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

require("icmp_packet")
require("udp_datagram")
require("ipv4_packet")
require("ipv6_packet")
require("tcp_segment")
-- 
-- Protocol body represents particular payload on transport level (OSI
-- layer 4).
-- 
-- Typically this payload in encapsulated into network level (OSI layer
-- 3) packet, which includes "protocol number" field that would be used
-- to decide what's inside the payload and how to parse it. Thanks to
-- IANA's standardization effort, multiple network level use the same
-- IDs for these payloads named "protocol numbers".
-- 
-- This is effectively a "router" type: it expects to get protocol
-- number as a parameter, and then invokes relevant type parser based
-- on that parameter.
-- See also: Source (http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)
ProtocolBody = class.class(KaitaiStruct)

ProtocolBody.ProtocolEnum = enum.Enum {
  hopopt = 0,
  icmp = 1,
  igmp = 2,
  ggp = 3,
  ipv4 = 4,
  st = 5,
  tcp = 6,
  cbt = 7,
  egp = 8,
  igp = 9,
  bbn_rcc_mon = 10,
  nvp_ii = 11,
  pup = 12,
  argus = 13,
  emcon = 14,
  xnet = 15,
  chaos = 16,
  udp = 17,
  mux = 18,
  dcn_meas = 19,
  hmp = 20,
  prm = 21,
  xns_idp = 22,
  trunk_1 = 23,
  trunk_2 = 24,
  leaf_1 = 25,
  leaf_2 = 26,
  rdp = 27,
  irtp = 28,
  iso_tp4 = 29,
  netblt = 30,
  mfe_nsp = 31,
  merit_inp = 32,
  dccp = 33,
  x_3pc = 34,
  idpr = 35,
  xtp = 36,
  ddp = 37,
  idpr_cmtp = 38,
  tp_plus_plus = 39,
  il = 40,
  ipv6 = 41,
  sdrp = 42,
  ipv6_route = 43,
  ipv6_frag = 44,
  idrp = 45,
  rsvp = 46,
  gre = 47,
  dsr = 48,
  bna = 49,
  esp = 50,
  ah = 51,
  i_nlsp = 52,
  swipe = 53,
  narp = 54,
  mobile = 55,
  tlsp = 56,
  skip = 57,
  ipv6_icmp = 58,
  ipv6_nonxt = 59,
  ipv6_opts = 60,
  any_host_internal_protocol = 61,
  cftp = 62,
  any_local_network = 63,
  sat_expak = 64,
  kryptolan = 65,
  rvd = 66,
  ippc = 67,
  any_distributed_file_system = 68,
  sat_mon = 69,
  visa = 70,
  ipcv = 71,
  cpnx = 72,
  cphb = 73,
  wsn = 74,
  pvp = 75,
  br_sat_mon = 76,
  sun_nd = 77,
  wb_mon = 78,
  wb_expak = 79,
  iso_ip = 80,
  vmtp = 81,
  secure_vmtp = 82,
  vines = 83,
  ttp_or_iptm = 84,
  nsfnet_igp = 85,
  dgp = 86,
  tcf = 87,
  eigrp = 88,
  ospfigp = 89,
  sprite_rpc = 90,
  larp = 91,
  mtp = 92,
  ax_25 = 93,
  ipip = 94,
  micp = 95,
  scc_sp = 96,
  etherip = 97,
  encap = 98,
  any_private_encryption_scheme = 99,
  gmtp = 100,
  ifmp = 101,
  pnni = 102,
  pim = 103,
  aris = 104,
  scps = 105,
  qnx = 106,
  a_n = 107,
  ipcomp = 108,
  snp = 109,
  compaq_peer = 110,
  ipx_in_ip = 111,
  vrrp = 112,
  pgm = 113,
  any_0_hop = 114,
  l2tp = 115,
  ddx = 116,
  iatp = 117,
  stp = 118,
  srp = 119,
  uti = 120,
  smp = 121,
  sm = 122,
  ptp = 123,
  isis_over_ipv4 = 124,
  fire = 125,
  crtp = 126,
  crudp = 127,
  sscopmce = 128,
  iplt = 129,
  sps = 130,
  pipe = 131,
  sctp = 132,
  fc = 133,
  rsvp_e2e_ignore = 134,
  mobility_header = 135,
  udplite = 136,
  mpls_in_ip = 137,
  manet = 138,
  hip = 139,
  shim6 = 140,
  wesp = 141,
  rohc = 142,
  reserved_255 = 255,
}

function ProtocolBody:_init(protocol_num, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.protocol_num = protocol_num
  self:_read()
end

function ProtocolBody:_read()
  local _on = self.protocol
  if _on == ProtocolBody.ProtocolEnum.ipv6_nonxt then
    self.body = ProtocolBody.NoNextHeader(self._io, self, self._root)
  elseif _on == ProtocolBody.ProtocolEnum.ipv4 then
    self.body = Ipv4Packet(self._io)
  elseif _on == ProtocolBody.ProtocolEnum.udp then
    self.body = UdpDatagram(self._io)
  elseif _on == ProtocolBody.ProtocolEnum.icmp then
    self.body = IcmpPacket(self._io)
  elseif _on == ProtocolBody.ProtocolEnum.hopopt then
    self.body = ProtocolBody.OptionHopByHop(self._io, self, self._root)
  elseif _on == ProtocolBody.ProtocolEnum.ipv6 then
    self.body = Ipv6Packet(self._io)
  elseif _on == ProtocolBody.ProtocolEnum.tcp then
    self.body = TcpSegment(self._io)
  end
end

ProtocolBody.property.protocol = {}
function ProtocolBody.property.protocol:get()
  if self._m_protocol ~= nil then
    return self._m_protocol
  end

  self._m_protocol = ProtocolBody.ProtocolEnum(self.protocol_num)
  return self._m_protocol
end

-- 
-- Protocol number as an integer.

-- 
-- Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
ProtocolBody.NoNextHeader = class.class(KaitaiStruct)

function ProtocolBody.NoNextHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ProtocolBody.NoNextHeader:_read()
end


ProtocolBody.OptionHopByHop = class.class(KaitaiStruct)

function ProtocolBody.OptionHopByHop:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ProtocolBody.OptionHopByHop:_read()
  self.next_header_type = self._io:read_u1()
  self.hdr_ext_len = self._io:read_u1()
  self.body = self._io:read_bytes((self.hdr_ext_len - 1))
  self.next_header = ProtocolBody(self.next_header_type, self._io)
end


