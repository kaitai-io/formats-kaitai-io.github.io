-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

-- 
-- The entries are used to synchronize the state of services instances and the
-- Publish/-Subscribe handling.
-- See also: section 4.1.2.3  Entry Format (https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
-- -)
SomeIpSdEntries = class.class(KaitaiStruct)

function SomeIpSdEntries:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdEntries:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = SomeIpSdEntries.SdEntry(self._io, self, self._root)
    i = i + 1
  end
end


SomeIpSdEntries.SdEntry = class.class(KaitaiStruct)

SomeIpSdEntries.SdEntry.EntryTypes = enum.Enum {
  find = 0,
  offer = 1,
  subscribe = 6,
  subscribe_ack = 7,
}

function SomeIpSdEntries.SdEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdEntries.SdEntry:_read()
  self.header = SomeIpSdEntries.SdEntry.SdEntryHeader(self._io, self, self._root)
  local _on = self.header.type
  if _on == SomeIpSdEntries.SdEntry.EntryTypes.find then
    self.content = SomeIpSdEntries.SdEntry.SdServiceEntry(self._io, self, self._root)
  elseif _on == SomeIpSdEntries.SdEntry.EntryTypes.offer then
    self.content = SomeIpSdEntries.SdEntry.SdServiceEntry(self._io, self, self._root)
  elseif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe then
    self.content = SomeIpSdEntries.SdEntry.SdEventgroupEntry(self._io, self, self._root)
  elseif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe_ack then
    self.content = SomeIpSdEntries.SdEntry.SdEventgroupEntry(self._io, self, self._root)
  end
end


SomeIpSdEntries.SdEntry.SdEntryHeader = class.class(KaitaiStruct)

function SomeIpSdEntries.SdEntry.SdEntryHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdEntries.SdEntry.SdEntryHeader:_read()
  self.type = SomeIpSdEntries.SdEntry.EntryTypes(self._io:read_u1())
  self.index_first_options = self._io:read_u1()
  self.index_second_options = self._io:read_u1()
  self.number_first_options = self._io:read_bits_int_be(4)
  self.number_second_options = self._io:read_bits_int_be(4)
  self._io:align_to_byte()
  self.service_id = self._io:read_u2be()
  self.instance_id = self._io:read_u2be()
  self.major_version = self._io:read_u1()
  self.ttl = self._io:read_bits_int_be(24)
end


SomeIpSdEntries.SdEntry.SdServiceEntry = class.class(KaitaiStruct)

function SomeIpSdEntries.SdEntry.SdServiceEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdEntries.SdEntry.SdServiceEntry:_read()
  self.minor_version = self._io:read_u4be()
end


SomeIpSdEntries.SdEntry.SdEventgroupEntry = class.class(KaitaiStruct)

function SomeIpSdEntries.SdEntry.SdEventgroupEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdEntries.SdEntry.SdEventgroupEntry:_read()
  self.reserved = self._io:read_u1()
  self.initial_data_requested = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(3)
  self.counter = self._io:read_bits_int_be(4)
  self._io:align_to_byte()
  self.event_group_id = self._io:read_u2be()
end


