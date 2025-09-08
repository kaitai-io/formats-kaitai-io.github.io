-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- UDP is a simple stateless transport layer (AKA OSI layer 4)
-- protocol, one of the core Internet protocols. It provides source and
-- destination ports, basic checksumming, but provides not guarantees
-- of delivery, order of packets, or duplicate delivery.
UdpDatagram = class.class(KaitaiStruct)

function UdpDatagram:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UdpDatagram:_read()
  self.src_port = self._io:read_u2be()
  self.dst_port = self._io:read_u2be()
  self.length = self._io:read_u2be()
  self.checksum = self._io:read_u2be()
  self.body = self._io:read_bytes(self.length - 8)
end


