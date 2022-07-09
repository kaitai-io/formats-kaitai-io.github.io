-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

require("ipv4_packet")
require("ipv6_packet")
-- 
-- Ethernet frame is a OSI data link layer (layer 2) protocol data unit
-- for Ethernet networks. In practice, many other networks and/or
-- in-file dumps adopted the same format for encapsulation purposes.
-- See also: Source (https://ieeexplore.ieee.org/document/7428776)
EthernetFrame = class.class(KaitaiStruct)

EthernetFrame.EtherTypeEnum = enum.Enum {
  ipv4 = 2048,
  x_75_internet = 2049,
  nbs_internet = 2050,
  ecma_internet = 2051,
  chaosnet = 2052,
  x_25_level_3 = 2053,
  arp = 2054,
  ieee_802_1q_tpid = 33024,
  ipv6 = 34525,
}

function EthernetFrame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function EthernetFrame:_read()
  self.dst_mac = self._io:read_bytes(6)
  self.src_mac = self._io:read_bytes(6)
  self.ether_type_1 = EthernetFrame.EtherTypeEnum(self._io:read_u2be())
  if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid then
    self.tci = EthernetFrame.TagControlInfo(self._io, self, self._root)
  end
  if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid then
    self.ether_type_2 = EthernetFrame.EtherTypeEnum(self._io:read_u2be())
  end
  local _on = self.ether_type
  if _on == EthernetFrame.EtherTypeEnum.ipv4 then
    self._raw_body = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Ipv4Packet(_io)
  elseif _on == EthernetFrame.EtherTypeEnum.ipv6 then
    self._raw_body = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Ipv6Packet(_io)
  else
    self.body = self._io:read_bytes_full()
  end
end

-- 
-- Ether type can be specied in several places in the frame. If
-- first location bears special marker (0x8100), then it is not the
-- real ether frame yet, an additional payload (`tci`) is expected
-- and real ether type is upcoming next.
EthernetFrame.property.ether_type = {}
function EthernetFrame.property.ether_type:get()
  if self._m_ether_type ~= nil then
    return self._m_ether_type
  end

  self._m_ether_type = utils.box_unwrap((self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid) and utils.box_wrap(self.ether_type_2) or (self.ether_type_1))
  return self._m_ether_type
end

-- 
-- Destination MAC address.
-- 
-- Source MAC address.
-- 
-- Either ether type or TPID if it is a IEEE 802.1Q frame.

-- 
-- Tag Control Information (TCI) is an extension of IEEE 802.1Q to
-- support VLANs on normal IEEE 802.3 Ethernet network.
EthernetFrame.TagControlInfo = class.class(KaitaiStruct)

function EthernetFrame.TagControlInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function EthernetFrame.TagControlInfo:_read()
  self.priority = self._io:read_bits_int_be(3)
  self.drop_eligible = self._io:read_bits_int_be(1) ~= 0
  self.vlan_id = self._io:read_bits_int_be(12)
end

-- 
-- Priority Code Point (PCP) is used to specify priority for
-- different kinds of traffic.
-- 
-- Drop Eligible Indicator (DEI) specifies if frame is eligible
-- to dropping while congestion is detected for certain classes
-- of traffic.
-- 
-- VLAN Identifier (VID) specifies which VLAN this frame
-- belongs to.

