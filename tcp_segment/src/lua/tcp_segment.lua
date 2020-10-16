-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- TCP is one of the core Internet protocols on transport layer (AKA
-- OSI layer 4), providing stateful connections with error checking,
-- guarantees of delivery, order of segments and avoidance of duplicate
-- delivery.
TcpSegment = class.class(KaitaiStruct)

function TcpSegment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TcpSegment:_read()
  self.src_port = self._io:read_u2be()
  self.dst_port = self._io:read_u2be()
  self.seq_num = self._io:read_u4be()
  self.ack_num = self._io:read_u4be()
  self.b12 = self._io:read_u1()
  self.b13 = self._io:read_u1()
  self.window_size = self._io:read_u2be()
  self.checksum = self._io:read_u2be()
  self.urgent_pointer = self._io:read_u2be()
  self.body = self._io:read_bytes_full()
end


