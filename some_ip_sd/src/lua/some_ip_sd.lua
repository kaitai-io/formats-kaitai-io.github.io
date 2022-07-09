-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")

require("some_ip_sd_entries")
require("some_ip_sd_options")
-- 
-- The main tasks of the Service Discovery Protocol are communicating the
-- availability of functional entities called services in the in-vehicle
-- communication as well as controlling the send behavior of event messages.
-- This allows sending only event messages to receivers requiring them (Publish/Subscribe).
-- The solution described here is also known as SOME/IP-SD
-- (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
-- See also: Source (https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf)
SomeIpSd = class.class(KaitaiStruct)

function SomeIpSd:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSd:_read()
  self.flags = SomeIpSd.SdFlags(self._io, self, self._root)
  self.reserved = self._io:read_bytes(3)
  self.len_entries = self._io:read_u4be()
  self._raw_entries = self._io:read_bytes(self.len_entries)
  local _io = KaitaiStream(stringstream(self._raw_entries))
  self.entries = SomeIpSdEntries(_io)
  self.len_options = self._io:read_u4be()
  self._raw_options = self._io:read_bytes(self.len_options)
  local _io = KaitaiStream(stringstream(self._raw_options))
  self.options = SomeIpSdOptions(_io)
end

-- 
-- The SOME/IP-SD Header shall start with an 8 Bit field called flags.

-- 
-- See also: AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
SomeIpSd.SdFlags = class.class(KaitaiStruct)

function SomeIpSd.SdFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSd.SdFlags:_read()
  self.reboot = self._io:read_bits_int_be(1) ~= 0
  self.unicast = self._io:read_bits_int_be(1) ~= 0
  self.initial_data = self._io:read_bits_int_be(1) ~= 0
  self.reserved = self._io:read_bits_int_be(5)
end


