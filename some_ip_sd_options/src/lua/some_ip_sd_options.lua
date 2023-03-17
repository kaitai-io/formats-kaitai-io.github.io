-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- FormatOptions are used to transport additional information to the entries.
-- This includes forinstance the information how a service instance is
-- reachable (IP-Address, TransportProtocol, Port Number).
-- See also: section 4.1.2.4 Options Format (https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
-- -)
SomeIpSdOptions = class.class(KaitaiStruct)

function SomeIpSdOptions:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = SomeIpSdOptions.SdOption(self._io, self, self._root)
    i = i + 1
  end
end


SomeIpSdOptions.SdOption = class.class(KaitaiStruct)

SomeIpSdOptions.SdOption.OptionTypes = enum.Enum {
  configuration_option = 1,
  load_balancing_option = 2,
  ipv4_endpoint_option = 4,
  ipv6_endpoint_option = 6,
  ipv4_multicast_option = 20,
  ipv6_multicast_option = 22,
  ipv4_sd_endpoint_option = 36,
  ipv6_sd_endpoint_option = 38,
}

function SomeIpSdOptions.SdOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption:_read()
  self.header = SomeIpSdOptions.SdOption.SdOptionHeader(self._io, self, self._root)
  local _on = self.header.type
  if _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option then
    self.content = SomeIpSdOptions.SdOption.SdLoadBalancingOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option then
    self.content = SomeIpSdOptions.SdOption.SdConfigurationOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option then
    self.content = SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option then
    self.content = SomeIpSdOptions.SdOption.SdIpv4EndpointOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option then
    self.content = SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option then
    self.content = SomeIpSdOptions.SdOption.SdIpv4MulticastOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option then
    self.content = SomeIpSdOptions.SdOption.SdIpv6EndpointOption(self._io, self, self._root)
  elseif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option then
    self.content = SomeIpSdOptions.SdOption.SdIpv6MulticastOption(self._io, self, self._root)
  end
end


SomeIpSdOptions.SdOption.SdOptionHeader = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdOptionHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdOptionHeader:_read()
  self.length = self._io:read_u2be()
  self.type = SomeIpSdOptions.SdOption.OptionTypes(self._io:read_u1())
end


SomeIpSdOptions.SdOption.SdConfigString = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdConfigString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdConfigString:_read()
  self.length = self._io:read_u1()
  if self.length ~= 0 then
    self._raw_config = self._io:read_bytes(self.length)
    local _io = KaitaiStream(stringstream(self._raw_config))
    self.config = SomeIpSdOptions.SdOption.SdConfigKvPair(_io, self, self._root)
  end
end


SomeIpSdOptions.SdOption.SdConfigStringsContainer = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdConfigStringsContainer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdConfigStringsContainer:_read()
  self.config_strings = {}
  local i = 0
  while not self._io:is_eof() do
    self.config_strings[i + 1] = SomeIpSdOptions.SdOption.SdConfigString(self._io, self, self._root)
    i = i + 1
  end
end


SomeIpSdOptions.SdOption.SdConfigurationOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdConfigurationOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdConfigurationOption:_read()
  self.reserved = self._io:read_u1()
  self._raw_configurations = self._io:read_bytes((self._parent.header.length - 1))
  local _io = KaitaiStream(stringstream(self._raw_configurations))
  self.configurations = SomeIpSdOptions.SdOption.SdConfigStringsContainer(_io, self, self._root)
end


SomeIpSdOptions.SdOption.SdIpv4MulticastOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdIpv4MulticastOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdIpv4MulticastOption:_read()
  self.reserved = self._io:read_u1()
  self.address = self._io:read_bytes(4)
  self.reserved2 = self._io:read_u1()
  self.l4_protocol = self._io:read_u1()
  self.port = self._io:read_u2be()
end


SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption:_read()
  self.reserved = self._io:read_u1()
  self.address = self._io:read_bytes(4)
  self.reserved2 = self._io:read_u1()
  self.l4_protocol = self._io:read_u1()
  self.port = self._io:read_u2be()
end


SomeIpSdOptions.SdOption.SdIpv6MulticastOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdIpv6MulticastOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdIpv6MulticastOption:_read()
  self.reserved = self._io:read_u1()
  self.address = self._io:read_bytes(16)
  self.reserved2 = self._io:read_u1()
  self.l4_protocol = self._io:read_u1()
  self.port = self._io:read_u2be()
end


SomeIpSdOptions.SdOption.SdConfigKvPair = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdConfigKvPair:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdConfigKvPair:_read()
  self.key = str_decode.decode(self._io:read_bytes_term(61, false, true, true), "ASCII")
  self.value = str_decode.decode(self._io:read_bytes_full(), "ASCII")
end


SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption:_read()
  self.reserved = self._io:read_u1()
  self.address = self._io:read_bytes(16)
  self.reserved2 = self._io:read_u1()
  self.l4_protocol = self._io:read_u1()
  self.port = self._io:read_u2be()
end


SomeIpSdOptions.SdOption.SdIpv4EndpointOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdIpv4EndpointOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdIpv4EndpointOption:_read()
  self.reserved = self._io:read_u1()
  self.address = self._io:read_bytes(4)
  self.reserved2 = self._io:read_u1()
  self.l4_protocol = self._io:read_u1()
  self.port = self._io:read_u2be()
end


SomeIpSdOptions.SdOption.SdIpv6EndpointOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdIpv6EndpointOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdIpv6EndpointOption:_read()
  self.reserved = self._io:read_u1()
  self.address = self._io:read_bytes(16)
  self.reserved2 = self._io:read_u1()
  self.l4_protocol = self._io:read_u1()
  self.port = self._io:read_u2be()
end


SomeIpSdOptions.SdOption.SdLoadBalancingOption = class.class(KaitaiStruct)

function SomeIpSdOptions.SdOption.SdLoadBalancingOption:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpSdOptions.SdOption.SdLoadBalancingOption:_read()
  self.reserved = self._io:read_u1()
  self.priority = self._io:read_u2be()
  self.weight = self._io:read_u2be()
end


