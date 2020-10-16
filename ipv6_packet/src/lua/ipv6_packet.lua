-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

require("protocol_body")
Ipv6Packet = class.class(KaitaiStruct)

function Ipv6Packet:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ipv6Packet:_read()
  self.version = self._io:read_bits_int_be(4)
  self.traffic_class = self._io:read_bits_int_be(8)
  self.flow_label = self._io:read_bits_int_be(20)
  self._io:align_to_byte()
  self.payload_length = self._io:read_u2be()
  self.next_header_type = self._io:read_u1()
  self.hop_limit = self._io:read_u1()
  self.src_ipv6_addr = self._io:read_bytes(16)
  self.dst_ipv6_addr = self._io:read_bytes(16)
  self.next_header = ProtocolBody(self.next_header_type, self._io)
  self.rest = self._io:read_bytes_full()
end


