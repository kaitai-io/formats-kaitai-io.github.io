-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

require("ethernet_frame")
-- 
-- PPI is a standard for link layer packet encapsulation, proposed as
-- generic extensible container to store both captured in-band data and
-- out-of-band data. Originally it was developed to provide 802.11n
-- radio information, but can be used for other purposes as well.
-- 
-- Sample capture:
-- <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
-- See also: PPI header format spec, section 3 (https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf)
PacketPpi = class.class(KaitaiStruct)

PacketPpi.PfhType = enum.Enum {
  radio_802_11_common = 2,
  radio_802_11n_mac_ext = 3,
  radio_802_11n_mac_phy_ext = 4,
  spectrum_map = 5,
  process_info = 6,
  capture_info = 7,
}

PacketPpi.Linktype = enum.Enum {
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

function PacketPpi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi:_read()
  self.header = PacketPpi.PacketPpiHeader(self._io, self, self._root)
  self._raw_fields = self._io:read_bytes((self.header.pph_len - 8))
  local _io = KaitaiStream(stringstream(self._raw_fields))
  self.fields = PacketPpi.PacketPpiFields(_io, self, self._root)
  local _on = self.header.pph_dlt
  if _on == PacketPpi.Linktype.ppi then
    self._raw_body = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = PacketPpi(_io)
  elseif _on == PacketPpi.Linktype.ethernet then
    self._raw_body = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = EthernetFrame(_io)
  else
    self.body = self._io:read_bytes_full()
  end
end


PacketPpi.PacketPpiFields = class.class(KaitaiStruct)

function PacketPpi.PacketPpiFields:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.PacketPpiFields:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = PacketPpi.PacketPpiField(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- See also: PPI header format spec, section 4.1.3 (https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf)
PacketPpi.Radio80211nMacExtBody = class.class(KaitaiStruct)

function PacketPpi.Radio80211nMacExtBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.Radio80211nMacExtBody:_read()
  self.flags = PacketPpi.MacFlags(self._io, self, self._root)
  self.a_mpdu_id = self._io:read_u4le()
  self.num_delimiters = self._io:read_u1()
  self.reserved = self._io:read_bytes(3)
end


PacketPpi.MacFlags = class.class(KaitaiStruct)

function PacketPpi.MacFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.MacFlags:_read()
  self.unused1 = self._io:read_bits_int_be(1) ~= 0
  self.aggregate_delimiter = self._io:read_bits_int_be(1) ~= 0
  self.more_aggregates = self._io:read_bits_int_be(1) ~= 0
  self.aggregate = self._io:read_bits_int_be(1) ~= 0
  self.dup_rx = self._io:read_bits_int_be(1) ~= 0
  self.rx_short_guard = self._io:read_bits_int_be(1) ~= 0
  self.is_ht_40 = self._io:read_bits_int_be(1) ~= 0
  self.greenfield = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  self.unused2 = self._io:read_bytes(3)
end

-- 
-- Aggregate delimiter CRC error after this frame.
-- 
-- More aggregates.
-- 
-- Aggregate.
-- 
-- Duplicate RX.
-- 
-- RX short guard interval (SGI).
-- 
-- true = HT40, false = HT20.
-- 
-- Greenfield.

-- 
-- See also: PPI header format spec, section 3.1 (https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf)
PacketPpi.PacketPpiHeader = class.class(KaitaiStruct)

function PacketPpi.PacketPpiHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.PacketPpiHeader:_read()
  self.pph_version = self._io:read_u1()
  self.pph_flags = self._io:read_u1()
  self.pph_len = self._io:read_u2le()
  self.pph_dlt = PacketPpi.Linktype(self._io:read_u4le())
end


-- 
-- See also: PPI header format spec, section 4.1.2 (https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf)
PacketPpi.Radio80211CommonBody = class.class(KaitaiStruct)

function PacketPpi.Radio80211CommonBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.Radio80211CommonBody:_read()
  self.tsf_timer = self._io:read_u8le()
  self.flags = self._io:read_u2le()
  self.rate = self._io:read_u2le()
  self.channel_freq = self._io:read_u2le()
  self.channel_flags = self._io:read_u2le()
  self.fhss_hopset = self._io:read_u1()
  self.fhss_pattern = self._io:read_u1()
  self.dbm_antsignal = self._io:read_s1()
  self.dbm_antnoise = self._io:read_s1()
end


-- 
-- See also: PPI header format spec, section 3.1 (https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf)
PacketPpi.PacketPpiField = class.class(KaitaiStruct)

function PacketPpi.PacketPpiField:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.PacketPpiField:_read()
  self.pfh_type = PacketPpi.PfhType(self._io:read_u2le())
  self.pfh_datalen = self._io:read_u2le()
  local _on = self.pfh_type
  if _on == PacketPpi.PfhType.radio_802_11_common then
    self._raw_body = self._io:read_bytes(self.pfh_datalen)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = PacketPpi.Radio80211CommonBody(_io, self, self._root)
  elseif _on == PacketPpi.PfhType.radio_802_11n_mac_ext then
    self._raw_body = self._io:read_bytes(self.pfh_datalen)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = PacketPpi.Radio80211nMacExtBody(_io, self, self._root)
  elseif _on == PacketPpi.PfhType.radio_802_11n_mac_phy_ext then
    self._raw_body = self._io:read_bytes(self.pfh_datalen)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = PacketPpi.Radio80211nMacPhyExtBody(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.pfh_datalen)
  end
end


-- 
-- See also: PPI header format spec, section 4.1.4 (https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf)
PacketPpi.Radio80211nMacPhyExtBody = class.class(KaitaiStruct)

function PacketPpi.Radio80211nMacPhyExtBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.Radio80211nMacPhyExtBody:_read()
  self.flags = PacketPpi.MacFlags(self._io, self, self._root)
  self.a_mpdu_id = self._io:read_u4le()
  self.num_delimiters = self._io:read_u1()
  self.mcs = self._io:read_u1()
  self.num_streams = self._io:read_u1()
  self.rssi_combined = self._io:read_u1()
  self.rssi_ant_ctl = {}
  for i = 0, 4 - 1 do
    self.rssi_ant_ctl[i + 1] = self._io:read_u1()
  end
  self.rssi_ant_ext = {}
  for i = 0, 4 - 1 do
    self.rssi_ant_ext[i + 1] = self._io:read_u1()
  end
  self.ext_channel_freq = self._io:read_u2le()
  self.ext_channel_flags = PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags(self._io, self, self._root)
  self.rf_signal_noise = {}
  for i = 0, 4 - 1 do
    self.rf_signal_noise[i + 1] = PacketPpi.Radio80211nMacPhyExtBody.SignalNoise(self._io, self, self._root)
  end
  self.evm = {}
  for i = 0, 4 - 1 do
    self.evm[i + 1] = self._io:read_u4le()
  end
end

-- 
-- Modulation Coding Scheme (MCS).
-- 
-- Number of spatial streams (0 = unknown).
-- 
-- RSSI (Received Signal Strength Indication), combined from all active antennas / channels.
-- 
-- RSSI (Received Signal Strength Indication) for antennas 0-3, control channel.
-- 
-- RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel.
-- 
-- Extension channel frequency (MHz).
-- 
-- Extension channel flags.
-- 
-- Signal + noise values for antennas 0-3.
-- 
-- EVM (Error Vector Magnitude) for chains 0-3.

PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags = class.class(KaitaiStruct)

function PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags:_read()
  self.spectrum_2ghz = self._io:read_bits_int_be(1) ~= 0
  self.ofdm = self._io:read_bits_int_be(1) ~= 0
  self.cck = self._io:read_bits_int_be(1) ~= 0
  self.turbo = self._io:read_bits_int_be(1) ~= 0
  self.unused = self._io:read_bits_int_be(8)
  self.gfsk = self._io:read_bits_int_be(1) ~= 0
  self.dyn_cck_ofdm = self._io:read_bits_int_be(1) ~= 0
  self.only_passive_scan = self._io:read_bits_int_be(1) ~= 0
  self.spectrum_5ghz = self._io:read_bits_int_be(1) ~= 0
end

-- 
-- 2 GHz spectrum.
-- 
-- OFDM (Orthogonal Frequency-Division Multiplexing).
-- 
-- CCK (Complementary Code Keying).
-- 
-- Gaussian Frequency Shift Keying.
-- 
-- Dynamic CCK-OFDM.
-- 
-- Only passive scan allowed.
-- 
-- 5 GHz spectrum.

-- 
-- RF signal + noise pair at a single antenna.
PacketPpi.Radio80211nMacPhyExtBody.SignalNoise = class.class(KaitaiStruct)

function PacketPpi.Radio80211nMacPhyExtBody.SignalNoise:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PacketPpi.Radio80211nMacPhyExtBody.SignalNoise:_read()
  self.signal = self._io:read_s1()
  self.noise = self._io:read_s1()
end

-- 
-- RF signal, dBm.
-- 
-- RF noise, dBm.

