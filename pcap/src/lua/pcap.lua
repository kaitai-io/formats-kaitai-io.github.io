-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

require("ethernet_frame")
require("packet_ppi")
-- 
-- PCAP (named after libpcap / winpcap) is a popular format for saving
-- network traffic grabbed by network sniffers. It is typically
-- produced by tools like [tcpdump](https://www.tcpdump.org/) or
-- [Wireshark](https://www.wireshark.org/).
-- See also: Source (http://wiki.wireshark.org/Development/LibpcapFileFormat)
Pcap = class.class(KaitaiStruct)

Pcap.Linktype = enum.Enum {
  null_linktype = 0,
  ethernet = 1,
  ax25 = 3,
  ieee802_5 = 6,
  arcnet_bsd = 7,
  slip = 8,
  ppp = 9,
  fddi = 10,
  ppp_hdlc = 50,
  ppp_ether = 51,
  atm_rfc1483 = 100,
  raw = 101,
  c_hdlc = 104,
  ieee802_11 = 105,
  frelay = 107,
  loop = 108,
  linux_sll = 113,
  ltalk = 114,
  pflog = 117,
  ieee802_11_prism = 119,
  ip_over_fc = 122,
  sunatm = 123,
  ieee802_11_radiotap = 127,
  arcnet_linux = 129,
  apple_ip_over_ieee1394 = 138,
  mtp2_with_phdr = 139,
  mtp2 = 140,
  mtp3 = 141,
  sccp = 142,
  docsis = 143,
  linux_irda = 144,
  user0 = 147,
  user1 = 148,
  user2 = 149,
  user3 = 150,
  user4 = 151,
  user5 = 152,
  user6 = 153,
  user7 = 154,
  user8 = 155,
  user9 = 156,
  user10 = 157,
  user11 = 158,
  user12 = 159,
  user13 = 160,
  user14 = 161,
  user15 = 162,
  ieee802_11_avs = 163,
  bacnet_ms_tp = 165,
  ppp_pppd = 166,
  gprs_llc = 169,
  gpf_t = 170,
  gpf_f = 171,
  linux_lapd = 177,
  bluetooth_hci_h4 = 187,
  usb_linux = 189,
  ppi = 192,
  ieee802_15_4 = 195,
  sita = 196,
  erf = 197,
  bluetooth_hci_h4_with_phdr = 201,
  ax25_kiss = 202,
  lapd = 203,
  ppp_with_dir = 204,
  c_hdlc_with_dir = 205,
  frelay_with_dir = 206,
  ipmb_linux = 209,
  ieee802_15_4_nonask_phy = 215,
  usb_linux_mmapped = 220,
  fc_2 = 224,
  fc_2_with_frame_delims = 225,
  ipnet = 226,
  can_socketcan = 227,
  ipv4 = 228,
  ipv6 = 229,
  ieee802_15_4_nofcs = 230,
  dbus = 231,
  dvb_ci = 235,
  mux27010 = 236,
  stanag_5066_d_pdu = 237,
  nflog = 239,
  netanalyzer = 240,
  netanalyzer_transparent = 241,
  ipoib = 242,
  mpeg_2_ts = 243,
  ng40 = 244,
  nfc_llcp = 245,
  infiniband = 247,
  sctp = 248,
  usbpcap = 249,
  rtac_serial = 250,
  bluetooth_le_ll = 251,
  netlink = 253,
  bluetooth_linux_monitor = 254,
  bluetooth_bredr_bb = 255,
  bluetooth_le_ll_with_phdr = 256,
  profibus_dl = 257,
  pktap = 258,
  epon = 259,
  ipmi_hpm_2 = 260,
  zwave_r1_r2 = 261,
  zwave_r3 = 262,
  wattstopper_dlm = 263,
  iso_14443 = 264,
}

function Pcap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcap:_read()
  self.hdr = Pcap.Header(self._io, self, self._root)
  self.packets = {}
  local i = 0
  while not self._io:is_eof() do
    self.packets[i + 1] = Pcap.Packet(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- See also: Source (https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header)
Pcap.Header = class.class(KaitaiStruct)

function Pcap.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcap.Header:_read()
  self.magic_number = self._io:read_bytes(4)
  if not(self.magic_number == "\212\195\178\161") then
    error("not equal, expected " ..  "\212\195\178\161" .. ", but got " .. self.magic_number)
  end
  self.version_major = self._io:read_u2le()
  self.version_minor = self._io:read_u2le()
  self.thiszone = self._io:read_s4le()
  self.sigfigs = self._io:read_u4le()
  self.snaplen = self._io:read_u4le()
  self.network = Pcap.Linktype(self._io:read_u4le())
end

-- 
-- Correction time in seconds between UTC and the local
-- timezone of the following packet header timestamps.
-- 
-- In theory, the accuracy of time stamps in the capture; in
-- practice, all tools set it to 0.
-- 
-- The "snapshot length" for the capture (typically 65535 or
-- even more, but might be limited by the user), see: incl_len
-- vs. orig_len.
-- 
-- Link-layer header type, specifying the type of headers at
-- the beginning of the packet.

-- 
-- See also: Source (https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header)
Pcap.Packet = class.class(KaitaiStruct)

function Pcap.Packet:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Pcap.Packet:_read()
  self.ts_sec = self._io:read_u4le()
  self.ts_usec = self._io:read_u4le()
  self.incl_len = self._io:read_u4le()
  self.orig_len = self._io:read_u4le()
  local _on = self._root.hdr.network
  if _on == Pcap.Linktype.ppi then
    self._raw_body = self._io:read_bytes(self.incl_len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = PacketPpi(_io)
  elseif _on == Pcap.Linktype.ethernet then
    self._raw_body = self._io:read_bytes(self.incl_len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = EthernetFrame(_io)
  else
    self.body = self._io:read_bytes(self.incl_len)
  end
end

-- 
-- Number of bytes of packet data actually captured and saved in the file.
-- 
-- Length of the packet as it appeared on the network when it was captured.
-- 
-- See also: Source (https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data)

