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
  self.data_offset = self._io:read_bits_int_be(4)
  self.reserved = self._io:read_bits_int_be(4)
  self._io:align_to_byte()
  self.flags = TcpSegment.Flags(self._io, self, self._root)
  self.window_size = self._io:read_u2be()
  self.checksum = self._io:read_u2be()
  self.urgent_pointer = self._io:read_u2be()
  if ((self.data_offset * 4) - 20) ~= 0 then
    self.options = self._io:read_bytes(((self.data_offset * 4) - 20))
  end
  self.body = self._io:read_bytes_full()
end

-- 
-- Source port.
-- 
-- Destination port.
-- 
-- Sequence number.
-- 
-- Acknowledgment number.
-- 
-- Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present).

-- 
-- TCP header flags as defined "TCP Header Flags" registry.
TcpSegment.Flags = class.class(KaitaiStruct)

function TcpSegment.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TcpSegment.Flags:_read()
  self.cwr = self._io:read_bits_int_be(1) ~= 0
  self.ece = self._io:read_bits_int_be(1) ~= 0
  self.urg = self._io:read_bits_int_be(1) ~= 0
  self.ack = self._io:read_bits_int_be(1) ~= 0
  self.psh = self._io:read_bits_int_be(1) ~= 0
  self.rst = self._io:read_bits_int_be(1) ~= 0
  self.syn = self._io:read_bits_int_be(1) ~= 0
  self.fin = self._io:read_bits_int_be(1) ~= 0
end

-- 
-- Congestion Window Reduced.
-- 
-- ECN-Echo.
-- 
-- Urgent pointer field is significant.
-- 
-- Acknowledgment field is significant.
-- 
-- Push function.
-- 
-- Reset the connection.
-- 
-- Synchronize sequence numbers.
-- 
-- No more data from sender.

