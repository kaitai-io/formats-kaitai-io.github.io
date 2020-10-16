-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- RTCP is the Real-Time Control Protocol.
-- See also: Source (https://tools.ietf.org/html/rfc3550)
RtcpPayload = class.class(KaitaiStruct)

RtcpPayload.PayloadType = enum.Enum {
  fir = 192,
  nack = 193,
  ij = 195,
  sr = 200,
  rr = 201,
  sdes = 202,
  bye = 203,
  app = 204,
  rtpfb = 205,
  psfb = 206,
  xr = 207,
  avb = 208,
  rsi = 209,
}

RtcpPayload.SdesSubtype = enum.Enum {
  pad = 0,
  cname = 1,
  name = 2,
  email = 3,
  phone = 4,
  loc = 5,
  tool = 6,
  note = 7,
  priv = 8,
}

RtcpPayload.PsfbSubtype = enum.Enum {
  pli = 1,
  sli = 2,
  rpsi = 3,
  fir = 4,
  tstr = 5,
  tstn = 6,
  vbcm = 7,
  afb = 15,
}

RtcpPayload.RtpfbSubtype = enum.Enum {
  nack = 1,
  tmmbr = 3,
  tmmbn = 4,
  rrr = 5,
  transport_feedback = 15,
}

function RtcpPayload:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload:_read()
  self.rtcp_packets = {}
  local i = 0
  while not self._io:is_eof() do
    self.rtcp_packets[i + 1] = RtcpPayload.RtcpPacket(self._io, self, self._root)
    i = i + 1
  end
end


RtcpPayload.PsfbAfbRembPacket = class.class(KaitaiStruct)

function RtcpPayload.PsfbAfbRembPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.PsfbAfbRembPacket:_read()
  self.num_ssrc = self._io:read_u1()
  self.br_exp = self._io:read_bits_int_be(6)
  self.br_mantissa = self._io:read_bits_int_be(18)
  self._io:align_to_byte()
  self.ssrc_list = {}
  for i = 0, self.num_ssrc - 1 do
    self.ssrc_list[i + 1] = self._io:read_u4be()
  end
end

RtcpPayload.PsfbAfbRembPacket.property.max_total_bitrate = {}
function RtcpPayload.PsfbAfbRembPacket.property.max_total_bitrate:get()
  if self._m_max_total_bitrate ~= nil then
    return self._m_max_total_bitrate
  end

  self._m_max_total_bitrate = (self.br_mantissa * (1 << self.br_exp))
  return self._m_max_total_bitrate
end


RtcpPayload.SrPacket = class.class(KaitaiStruct)

function RtcpPayload.SrPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.SrPacket:_read()
  self.ssrc = self._io:read_u4be()
  self.ntp_msw = self._io:read_u4be()
  self.ntp_lsw = self._io:read_u4be()
  self.rtp_timestamp = self._io:read_u4be()
  self.sender_packet_count = self._io:read_u4be()
  self.sender_octet_count = self._io:read_u4be()
  self.report_block = {}
  for i = 0, self._parent.subtype - 1 do
    self.report_block[i + 1] = RtcpPayload.ReportBlock(self._io, self, self._root)
  end
end

RtcpPayload.SrPacket.property.ntp = {}
function RtcpPayload.SrPacket.property.ntp:get()
  if self._m_ntp ~= nil then
    return self._m_ntp
  end

  self._m_ntp = ((self.ntp_msw << 32) & self.ntp_lsw)
  return self._m_ntp
end


RtcpPayload.RrPacket = class.class(KaitaiStruct)

function RtcpPayload.RrPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.RrPacket:_read()
  self.ssrc = self._io:read_u4be()
  self.report_block = {}
  for i = 0, self._parent.subtype - 1 do
    self.report_block[i + 1] = RtcpPayload.ReportBlock(self._io, self, self._root)
  end
end


RtcpPayload.RtcpPacket = class.class(KaitaiStruct)

function RtcpPayload.RtcpPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.RtcpPacket:_read()
  self.version = self._io:read_bits_int_be(2)
  self.padding = self._io:read_bits_int_be(1)
  self.subtype = self._io:read_bits_int_be(5)
  self._io:align_to_byte()
  self.payload_type = RtcpPayload.PayloadType(self._io:read_u1())
  self.length = self._io:read_u2be()
  local _on = self.payload_type
  if _on == RtcpPayload.PayloadType.sr then
    self._raw_body = self._io:read_bytes((4 * self.length))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RtcpPayload.SrPacket(_io, self, self._root)
  elseif _on == RtcpPayload.PayloadType.psfb then
    self._raw_body = self._io:read_bytes((4 * self.length))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RtcpPayload.PsfbPacket(_io, self, self._root)
  elseif _on == RtcpPayload.PayloadType.rr then
    self._raw_body = self._io:read_bytes((4 * self.length))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RtcpPayload.RrPacket(_io, self, self._root)
  elseif _on == RtcpPayload.PayloadType.rtpfb then
    self._raw_body = self._io:read_bytes((4 * self.length))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RtcpPayload.RtpfbPacket(_io, self, self._root)
  elseif _on == RtcpPayload.PayloadType.sdes then
    self._raw_body = self._io:read_bytes((4 * self.length))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = RtcpPayload.SdesPacket(_io, self, self._root)
  else
    self.body = self._io:read_bytes((4 * self.length))
  end
end


RtcpPayload.SdesTlv = class.class(KaitaiStruct)

function RtcpPayload.SdesTlv:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.SdesTlv:_read()
  self.type = RtcpPayload.SdesSubtype(self._io:read_u1())
  if self.type ~= RtcpPayload.SdesSubtype.pad then
    self.length = self._io:read_u1()
  end
  if self.type ~= RtcpPayload.SdesSubtype.pad then
    self.value = self._io:read_bytes(self.length)
  end
end


RtcpPayload.ReportBlock = class.class(KaitaiStruct)

function RtcpPayload.ReportBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.ReportBlock:_read()
  self.ssrc_source = self._io:read_u4be()
  self.lost_val = self._io:read_u1()
  self.highest_seq_num_received = self._io:read_u4be()
  self.interarrival_jitter = self._io:read_u4be()
  self.lsr = self._io:read_u4be()
  self.dlsr = self._io:read_u4be()
end

RtcpPayload.ReportBlock.property.fraction_lost = {}
function RtcpPayload.ReportBlock.property.fraction_lost:get()
  if self._m_fraction_lost ~= nil then
    return self._m_fraction_lost
  end

  self._m_fraction_lost = (self.lost_val >> 24)
  return self._m_fraction_lost
end

RtcpPayload.ReportBlock.property.cumulative_packets_lost = {}
function RtcpPayload.ReportBlock.property.cumulative_packets_lost:get()
  if self._m_cumulative_packets_lost ~= nil then
    return self._m_cumulative_packets_lost
  end

  self._m_cumulative_packets_lost = (self.lost_val & 16777215)
  return self._m_cumulative_packets_lost
end


RtcpPayload.RtpfbTransportFeedbackPacket = class.class(KaitaiStruct)

function RtcpPayload.RtpfbTransportFeedbackPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.RtpfbTransportFeedbackPacket:_read()
  self.base_sequence_number = self._io:read_u2be()
  self.packet_status_count = self._io:read_u2be()
  self.b4 = self._io:read_u4be()
  self.remaining = self._io:read_bytes_full()
end

RtcpPayload.RtpfbTransportFeedbackPacket.property.reference_time = {}
function RtcpPayload.RtpfbTransportFeedbackPacket.property.reference_time:get()
  if self._m_reference_time ~= nil then
    return self._m_reference_time
  end

  self._m_reference_time = (self.b4 >> 8)
  return self._m_reference_time
end

RtcpPayload.RtpfbTransportFeedbackPacket.property.fb_pkt_count = {}
function RtcpPayload.RtpfbTransportFeedbackPacket.property.fb_pkt_count:get()
  if self._m_fb_pkt_count ~= nil then
    return self._m_fb_pkt_count
  end

  self._m_fb_pkt_count = (self.b4 & 255)
  return self._m_fb_pkt_count
end

RtcpPayload.RtpfbTransportFeedbackPacket.property.packet_status = {}
function RtcpPayload.RtpfbTransportFeedbackPacket.property.packet_status:get()
  if self._m_packet_status ~= nil then
    return self._m_packet_status
  end

  self._m_packet_status = self._io:read_bytes(0)
  return self._m_packet_status
end

RtcpPayload.RtpfbTransportFeedbackPacket.property.recv_delta = {}
function RtcpPayload.RtpfbTransportFeedbackPacket.property.recv_delta:get()
  if self._m_recv_delta ~= nil then
    return self._m_recv_delta
  end

  self._m_recv_delta = self._io:read_bytes(0)
  return self._m_recv_delta
end


RtcpPayload.PsfbPacket = class.class(KaitaiStruct)

function RtcpPayload.PsfbPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.PsfbPacket:_read()
  self.ssrc = self._io:read_u4be()
  self.ssrc_media_source = self._io:read_u4be()
  local _on = self.fmt
  if _on == RtcpPayload.PsfbSubtype.afb then
    self._raw_fci_block = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_fci_block))
    self.fci_block = RtcpPayload.PsfbAfbPacket(_io, self, self._root)
  else
    self.fci_block = self._io:read_bytes_full()
  end
end

RtcpPayload.PsfbPacket.property.fmt = {}
function RtcpPayload.PsfbPacket.property.fmt:get()
  if self._m_fmt ~= nil then
    return self._m_fmt
  end

  self._m_fmt = RtcpPayload.PsfbSubtype(self._parent.subtype)
  return self._m_fmt
end


RtcpPayload.SourceChunk = class.class(KaitaiStruct)

function RtcpPayload.SourceChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.SourceChunk:_read()
  self.ssrc = self._io:read_u4be()
  self.sdes_tlv = {}
  local i = 0
  while not self._io:is_eof() do
    self.sdes_tlv[i + 1] = RtcpPayload.SdesTlv(self._io, self, self._root)
    i = i + 1
  end
end


RtcpPayload.SdesPacket = class.class(KaitaiStruct)

function RtcpPayload.SdesPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.SdesPacket:_read()
  self.source_chunk = {}
  for i = 0, self.source_count - 1 do
    self.source_chunk[i + 1] = RtcpPayload.SourceChunk(self._io, self, self._root)
  end
end

RtcpPayload.SdesPacket.property.source_count = {}
function RtcpPayload.SdesPacket.property.source_count:get()
  if self._m_source_count ~= nil then
    return self._m_source_count
  end

  self._m_source_count = self._parent.subtype
  return self._m_source_count
end


RtcpPayload.RtpfbPacket = class.class(KaitaiStruct)

function RtcpPayload.RtpfbPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.RtpfbPacket:_read()
  self.ssrc = self._io:read_u4be()
  self.ssrc_media_source = self._io:read_u4be()
  local _on = self.fmt
  if _on == RtcpPayload.RtpfbSubtype.transport_feedback then
    self._raw_fci_block = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_fci_block))
    self.fci_block = RtcpPayload.RtpfbTransportFeedbackPacket(_io, self, self._root)
  else
    self.fci_block = self._io:read_bytes_full()
  end
end

RtcpPayload.RtpfbPacket.property.fmt = {}
function RtcpPayload.RtpfbPacket.property.fmt:get()
  if self._m_fmt ~= nil then
    return self._m_fmt
  end

  self._m_fmt = RtcpPayload.RtpfbSubtype(self._parent.subtype)
  return self._m_fmt
end


RtcpPayload.PacketStatusChunk = class.class(KaitaiStruct)

function RtcpPayload.PacketStatusChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.PacketStatusChunk:_read()
  self.t = self._io:read_bits_int_be(1)
  if (self.t and 1 or 0) == 0 then
    self.s2 = self._io:read_bits_int_be(2)
  end
  if (self.t and 1 or 0) == 1 then
    self.s1 = self._io:read_bits_int_be(1)
  end
  if (self.t and 1 or 0) == 0 then
    self.rle = self._io:read_bits_int_be(13)
  end
  if (self.t and 1 or 0) == 1 then
    self.symbol_list = self._io:read_bits_int_be(14)
  end
end

RtcpPayload.PacketStatusChunk.property.s = {}
function RtcpPayload.PacketStatusChunk.property.s:get()
  if self._m_s ~= nil then
    return self._m_s
  end

  self._m_s = utils.box_unwrap(((self.t and 1 or 0) == 0) and utils.box_wrap(self.s2) or (utils.box_unwrap(((self.s1 and 1 or 0) == 0) and utils.box_wrap(1) or (0))))
  return self._m_s
end


RtcpPayload.PsfbAfbPacket = class.class(KaitaiStruct)

function RtcpPayload.PsfbAfbPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtcpPayload.PsfbAfbPacket:_read()
  self.uid = self._io:read_u4be()
  local _on = self.uid
  if _on == 1380273474 then
    self._raw_contents = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_contents))
    self.contents = RtcpPayload.PsfbAfbRembPacket(_io, self, self._root)
  else
    self.contents = self._io:read_bytes_full()
  end
end


