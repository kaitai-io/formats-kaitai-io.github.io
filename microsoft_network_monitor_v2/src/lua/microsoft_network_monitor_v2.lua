-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

require("ethernet_frame")
require("windows_systemtime")
-- 
-- Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
-- network packet sniffing and analysis tool. It can save captured
-- traffic as .cap files, which usually contain the packets and may
-- contain some additional info - enhanced network info, calculated
-- statistics, etc.
-- 
-- There are at least 2 different versions of the format: v1 and
-- v2. Netmon v3 seems to use the same file format as v1.
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values)
MicrosoftNetworkMonitorV2 = class.class(KaitaiStruct)

MicrosoftNetworkMonitorV2.Linktype = enum.Enum {
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

function MicrosoftNetworkMonitorV2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftNetworkMonitorV2:_read()
  self.signature = self._io:read_bytes(4)
  if not(self.signature == "\071\077\066\085") then
    error("not equal, expected " ..  "\071\077\066\085" .. ", but got " .. self.signature)
  end
  self.version_minor = self._io:read_u1()
  self.version_major = self._io:read_u1()
  self.mac_type = MicrosoftNetworkMonitorV2.Linktype(self._io:read_u2le())
  self.time_capture_start = WindowsSystemtime(self._io)
  self.frame_table_ofs = self._io:read_u4le()
  self.frame_table_len = self._io:read_u4le()
  self.user_data_ofs = self._io:read_u4le()
  self.user_data_len = self._io:read_u4le()
  self.comment_ofs = self._io:read_u4le()
  self.comment_len = self._io:read_u4le()
  self.statistics_ofs = self._io:read_u4le()
  self.statistics_len = self._io:read_u4le()
  self.network_info_ofs = self._io:read_u4le()
  self.network_info_len = self._io:read_u4le()
  self.conversation_stats_ofs = self._io:read_u4le()
  self.conversation_stats_len = self._io:read_u4le()
end

-- 
-- Index that is used to access individual captured frames.
MicrosoftNetworkMonitorV2.property.frame_table = {}
function MicrosoftNetworkMonitorV2.property.frame_table:get()
  if self._m_frame_table ~= nil then
    return self._m_frame_table
  end

  local _pos = self._io:pos()
  self._io:seek(self.frame_table_ofs)
  self._raw__m_frame_table = self._io:read_bytes(self.frame_table_len)
  local _io = KaitaiStream(stringstream(self._raw__m_frame_table))
  self._m_frame_table = MicrosoftNetworkMonitorV2.FrameIndex(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_frame_table
end

-- 
-- Format version (minor), BCD.
-- 
-- Format version (major), BCD.
-- 
-- Network topology type of captured data.
-- 
-- Timestamp of capture start.

MicrosoftNetworkMonitorV2.FrameIndex = class.class(KaitaiStruct)

function MicrosoftNetworkMonitorV2.FrameIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftNetworkMonitorV2.FrameIndex:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = MicrosoftNetworkMonitorV2.FrameIndexEntry(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- Each index entry is just a pointer to where the frame data is
-- stored in the file.
MicrosoftNetworkMonitorV2.FrameIndexEntry = class.class(KaitaiStruct)

function MicrosoftNetworkMonitorV2.FrameIndexEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftNetworkMonitorV2.FrameIndexEntry:_read()
  self.ofs = self._io:read_u4le()
end

-- 
-- Frame body itself.
MicrosoftNetworkMonitorV2.FrameIndexEntry.property.body = {}
function MicrosoftNetworkMonitorV2.FrameIndexEntry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs)
  self._m_body = MicrosoftNetworkMonitorV2.Frame(_io, self, self._root)
  _io:seek(_pos)
  return self._m_body
end

-- 
-- Absolute pointer to frame data in the file.

-- 
-- A container for actually captured network data. Allow to
-- timestamp individual frames and designates how much data from
-- the original packet was actually written into the file.
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/netmon2/frame)
MicrosoftNetworkMonitorV2.Frame = class.class(KaitaiStruct)

function MicrosoftNetworkMonitorV2.Frame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MicrosoftNetworkMonitorV2.Frame:_read()
  self.ts_delta = self._io:read_u8le()
  self.orig_len = self._io:read_u4le()
  self.inc_len = self._io:read_u4le()
  local _on = self._root.mac_type
  if _on == MicrosoftNetworkMonitorV2.Linktype.ethernet then
    self._raw_body = self._io:read_bytes(self.inc_len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = EthernetFrame(_io)
  else
    self.body = self._io:read_bytes(self.inc_len)
  end
end

-- 
-- Time stamp - usecs since start of capture.
-- 
-- Actual length of packet.
-- 
-- Number of octets captured in file.
-- 
-- Actual packet captured from the network.

