-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")

-- 
-- The Real-time Transport Protocol (RTP) is a widely used network
-- protocol for transmitting audio or video. It usually works with the
-- RTP Control Protocol (RTCP). The transmission can be based on
-- Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
RtpPacket = class.class(KaitaiStruct)

RtpPacket.PayloadTypeEnum = enum.Enum {
  pcmu = 0,
  reserved1 = 1,
  reserved2 = 2,
  gsm = 3,
  g723 = 4,
  dvi4_1 = 5,
  dvi4_2 = 6,
  lpc = 7,
  pama = 8,
  g722 = 9,
  l16_1 = 10,
  l16_2 = 11,
  qcelp = 12,
  cn = 13,
  mpa = 14,
  g728 = 15,
  dvi4_3 = 16,
  dvi4_4 = 17,
  g729 = 18,
  reserved19 = 19,
  unassigned20 = 20,
  unassigned21 = 21,
  unassigned22 = 22,
  unassigned23 = 23,
  unassigned24 = 24,
  celb = 25,
  jpeg = 26,
  unassigned27 = 27,
  nv = 28,
  unassigned29 = 29,
  unassigned30 = 30,
  h261 = 31,
  mpv = 32,
  mp2t = 33,
  h263 = 34,
  mpeg_ps = 96,
}

function RtpPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtpPacket:_read()
  self.version = self._io:read_bits_int_be(2)
  self.has_padding = self._io:read_bits_int_be(1)
  self.has_extension = self._io:read_bits_int_be(1)
  self.csrc_count = self._io:read_bits_int_be(4)
  self.marker = self._io:read_bits_int_be(1)
  self.payload_type = RtpPacket.PayloadTypeEnum(self._io:read_bits_int_be(7))
  self._io:align_to_byte()
  self.sequence_number = self._io:read_u2be()
  self.timestamp = self._io:read_u4be()
  self.ssrc = self._io:read_u4be()
  if self.has_extension then
    self.header_extension = RtpPacket.HeaderExtention(self._io, self, self._root)
  end
  self.data = self._io:read_bytes(((self._io:size() - self._io:pos()) - self.len_padding))
  self.padding = self._io:read_bytes(self.len_padding)
end

-- 
-- If padding bit is enabled, last byte of data contains number of
-- bytes appended to the payload as padding.
RtpPacket.property.len_padding_if_exists = {}
function RtpPacket.property.len_padding_if_exists:get()
  if self._m_len_padding_if_exists ~= nil then
    return self._m_len_padding_if_exists
  end

  if self.has_padding then
    local _pos = self._io:pos()
    self._io:seek((self._io:size() - 1))
    self._m_len_padding_if_exists = self._io:read_u1()
    self._io:seek(_pos)
  end
  return self._m_len_padding_if_exists
end

-- 
-- Always returns number of padding bytes to in the payload.
RtpPacket.property.len_padding = {}
function RtpPacket.property.len_padding:get()
  if self._m_len_padding ~= nil then
    return self._m_len_padding
  end

  self._m_len_padding = utils.box_unwrap((self.has_padding) and utils.box_wrap(self.len_padding_if_exists) or (0))
  return self._m_len_padding
end

-- 
-- Payload without padding.

RtpPacket.HeaderExtention = class.class(KaitaiStruct)

function RtpPacket.HeaderExtention:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function RtpPacket.HeaderExtention:_read()
  self.id = self._io:read_u2be()
  self.length = self._io:read_u2be()
end


