-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local utils = require("utils")

require("protocol_body")
Ipv4Packet = class.class(KaitaiStruct)

function Ipv4Packet:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ipv4Packet:_read()
  self.b1 = self._io:read_u1()
  self.b2 = self._io:read_u1()
  self.total_length = self._io:read_u2be()
  self.identification = self._io:read_u2be()
  self.b67 = self._io:read_u2be()
  self.ttl = self._io:read_u1()
  self.protocol = self._io:read_u1()
  self.header_checksum = self._io:read_u2be()
  self.src_ip_addr = self._io:read_bytes(4)
  self.dst_ip_addr = self._io:read_bytes(4)
  self._raw_options = self._io:read_bytes((self.ihl_bytes - 20))
  local _io = KaitaiStream(stringstream(self._raw_options))
  self.options = Ipv4Packet.Ipv4Options(_io, self, self._root)
  self._raw_body = self._io:read_bytes((self.total_length - self.ihl_bytes))
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = ProtocolBody(self.protocol, _io)
end

Ipv4Packet.property.version = {}
function Ipv4Packet.property.version:get()
  if self._m_version ~= nil then
    return self._m_version
  end

  self._m_version = ((self.b1 & 240) >> 4)
  return self._m_version
end

Ipv4Packet.property.ihl = {}
function Ipv4Packet.property.ihl:get()
  if self._m_ihl ~= nil then
    return self._m_ihl
  end

  self._m_ihl = (self.b1 & 15)
  return self._m_ihl
end

Ipv4Packet.property.ihl_bytes = {}
function Ipv4Packet.property.ihl_bytes:get()
  if self._m_ihl_bytes ~= nil then
    return self._m_ihl_bytes
  end

  self._m_ihl_bytes = (self.ihl * 4)
  return self._m_ihl_bytes
end


Ipv4Packet.Ipv4Options = class.class(KaitaiStruct)

function Ipv4Packet.Ipv4Options:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ipv4Packet.Ipv4Options:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Ipv4Packet.Ipv4Option(self._io, self, self._root)
    i = i + 1
  end
end


Ipv4Packet.Ipv4Option = class.class(KaitaiStruct)

function Ipv4Packet.Ipv4Option:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ipv4Packet.Ipv4Option:_read()
  self.b1 = self._io:read_u1()
  self.len = self._io:read_u1()
  self.body = self._io:read_bytes(utils.box_unwrap((self.len > 2) and utils.box_wrap((self.len - 2)) or (0)))
end

Ipv4Packet.Ipv4Option.property.copy = {}
function Ipv4Packet.Ipv4Option.property.copy:get()
  if self._m_copy ~= nil then
    return self._m_copy
  end

  self._m_copy = ((self.b1 & 128) >> 7)
  return self._m_copy
end

Ipv4Packet.Ipv4Option.property.opt_class = {}
function Ipv4Packet.Ipv4Option.property.opt_class:get()
  if self._m_opt_class ~= nil then
    return self._m_opt_class
  end

  self._m_opt_class = ((self.b1 & 96) >> 5)
  return self._m_opt_class
end

Ipv4Packet.Ipv4Option.property.number = {}
function Ipv4Packet.Ipv4Option.property.number:get()
  if self._m_number ~= nil then
    return self._m_number
  end

  self._m_number = (self.b1 & 31)
  return self._m_number
end


