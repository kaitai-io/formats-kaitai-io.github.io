-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

IcmpPacket = class.class(KaitaiStruct)

IcmpPacket.IcmpTypeEnum = enum.Enum {
  echo_reply = 0,
  destination_unreachable = 3,
  source_quench = 4,
  redirect = 5,
  echo = 8,
  time_exceeded = 11,
}

function IcmpPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function IcmpPacket:_read()
  self.icmp_type = IcmpPacket.IcmpTypeEnum(self._io:read_u1())
  if self.icmp_type == IcmpPacket.IcmpTypeEnum.destination_unreachable then
    self.destination_unreachable = IcmpPacket.DestinationUnreachableMsg(self._io, self, self._root)
  end
  if self.icmp_type == IcmpPacket.IcmpTypeEnum.time_exceeded then
    self.time_exceeded = IcmpPacket.TimeExceededMsg(self._io, self, self._root)
  end
  if  ((self.icmp_type == IcmpPacket.IcmpTypeEnum.echo) or (self.icmp_type == IcmpPacket.IcmpTypeEnum.echo_reply))  then
    self.echo = IcmpPacket.EchoMsg(self._io, self, self._root)
  end
end


IcmpPacket.DestinationUnreachableMsg = class.class(KaitaiStruct)

IcmpPacket.DestinationUnreachableMsg.DestinationUnreachableCode = enum.Enum {
  net_unreachable = 0,
  host_unreachable = 1,
  protocol_unreachable = 2,
  port_unreachable = 3,
  fragmentation_needed_and_df_set = 4,
  source_route_failed = 5,
  dst_net_unkown = 6,
  sdt_host_unkown = 7,
  src_isolated = 8,
  net_prohibited_by_admin = 9,
  host_prohibited_by_admin = 10,
  net_unreachable_for_tos = 11,
  host_unreachable_for_tos = 12,
  communication_prohibited_by_admin = 13,
  host_precedence_violation = 14,
  precedence_cuttoff_in_effect = 15,
}

function IcmpPacket.DestinationUnreachableMsg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function IcmpPacket.DestinationUnreachableMsg:_read()
  self.code = IcmpPacket.DestinationUnreachableMsg.DestinationUnreachableCode(self._io:read_u1())
  self.checksum = self._io:read_u2be()
end


IcmpPacket.EchoMsg = class.class(KaitaiStruct)

function IcmpPacket.EchoMsg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function IcmpPacket.EchoMsg:_read()
  self.code = self._io:read_bytes(1)
  if not(self.code == "\000") then
    error("not equal, expected " .. "\000" .. ", but got " .. self.code)
  end
  self.checksum = self._io:read_u2be()
  self.identifier = self._io:read_u2be()
  self.seq_num = self._io:read_u2be()
  self.data = self._io:read_bytes_full()
end


IcmpPacket.TimeExceededMsg = class.class(KaitaiStruct)

IcmpPacket.TimeExceededMsg.TimeExceededCode = enum.Enum {
  time_to_live_exceeded_in_transit = 0,
  fragment_reassembly_time_exceeded = 1,
}

function IcmpPacket.TimeExceededMsg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function IcmpPacket.TimeExceededMsg:_read()
  self.code = IcmpPacket.TimeExceededMsg.TimeExceededCode(self._io:read_u1())
  self.checksum = self._io:read_u2be()
end


