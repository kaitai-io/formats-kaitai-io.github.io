-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

require("rtp_packet")
-- 
-- rtpdump is a format used by rtptools to record and replay
-- rtp data from network capture.
-- See also: Source (https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h)
Rtpdump = class.class(KaitaiStruct)

function Rtpdump:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rtpdump:_read()
  self.file_header = Rtpdump.HeaderT(self._io, self, self._root)
  self.packets = {}
  local i = 0
  while not self._io:is_eof() do
    self.packets[i + 1] = Rtpdump.PacketT(self._io, self, self._root)
    i = i + 1
  end
end


Rtpdump.HeaderT = class.class(KaitaiStruct)

function Rtpdump.HeaderT:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rtpdump.HeaderT:_read()
  self.shebang = self._io:read_bytes(12)
  if not(self.shebang == "\035\033\114\116\112\112\108\097\121\049\046\048") then
    error("not equal, expected " ..  "\035\033\114\116\112\112\108\097\121\049\046\048" .. ", but got " .. self.shebang)
  end
  self.space = self._io:read_bytes(1)
  if not(self.space == "\032") then
    error("not equal, expected " ..  "\032" .. ", but got " .. self.space)
  end
  self.ip = str_decode.decode(self._io:read_bytes_term(47, false, true, true), "ascii")
  self.port = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "ascii")
  self.start_sec = self._io:read_u4be()
  self.start_usec = self._io:read_u4be()
  self.ip2 = self._io:read_u4be()
  self.port2 = self._io:read_u2be()
  self.padding = self._io:read_u2be()
end

-- 
-- start of recording, the seconds part.
-- 
-- start of recording, the microseconds part.
-- 
-- network source.
-- 
-- port.
-- 
-- 2 bytes padding.

Rtpdump.PacketT = class.class(KaitaiStruct)

function Rtpdump.PacketT:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rtpdump.PacketT:_read()
  self.length = self._io:read_u2be()
  self.len_body = self._io:read_u2be()
  self.packet_usec = self._io:read_u4be()
  self._raw_body = self._io:read_bytes(self.len_body)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = RtpPacket(_io)
end

-- 
-- packet length (including this header).
-- 
-- payload length.
-- 
-- timestamp of packet since the start.

