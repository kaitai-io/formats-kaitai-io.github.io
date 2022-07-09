-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- (No support for Auth-Name + Add-Name for simplicity)
DnsPacket = class.class(KaitaiStruct)

DnsPacket.ClassType = enum.Enum {
  in_class = 1,
  cs = 2,
  ch = 3,
  hs = 4,
}

DnsPacket.TypeType = enum.Enum {
  a = 1,
  ns = 2,
  md = 3,
  mf = 4,
  cname = 5,
  soa = 6,
  mb = 7,
  mg = 8,
  mr = 9,
  null = 10,
  wks = 11,
  ptr = 12,
  hinfo = 13,
  minfo = 14,
  mx = 15,
  txt = 16,
  aaaa = 28,
  srv = 33,
}

function DnsPacket:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket:_read()
  self.transaction_id = self._io:read_u2be()
  self.flags = DnsPacket.PacketFlags(self._io, self, self._root)
  if self.flags.is_opcode_valid then
    self.qdcount = self._io:read_u2be()
  end
  if self.flags.is_opcode_valid then
    self.ancount = self._io:read_u2be()
  end
  if self.flags.is_opcode_valid then
    self.nscount = self._io:read_u2be()
  end
  if self.flags.is_opcode_valid then
    self.arcount = self._io:read_u2be()
  end
  if self.flags.is_opcode_valid then
    self.queries = {}
    for i = 0, self.qdcount - 1 do
      self.queries[i + 1] = DnsPacket.Query(self._io, self, self._root)
    end
  end
  if self.flags.is_opcode_valid then
    self.answers = {}
    for i = 0, self.ancount - 1 do
      self.answers[i + 1] = DnsPacket.Answer(self._io, self, self._root)
    end
  end
  if self.flags.is_opcode_valid then
    self.authorities = {}
    for i = 0, self.nscount - 1 do
      self.authorities[i + 1] = DnsPacket.Answer(self._io, self, self._root)
    end
  end
  if self.flags.is_opcode_valid then
    self.additionals = {}
    for i = 0, self.arcount - 1 do
      self.additionals[i + 1] = DnsPacket.Answer(self._io, self, self._root)
    end
  end
end

-- 
-- ID to keep track of request/responces.
-- 
-- How many questions are there.
-- 
-- Number of resource records answering the question.
-- 
-- Number of resource records pointing toward an authority.
-- 
-- Number of resource records holding additional information.

DnsPacket.MxInfo = class.class(KaitaiStruct)

function DnsPacket.MxInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.MxInfo:_read()
  self.preference = self._io:read_u2be()
  self.mx = DnsPacket.DomainName(self._io, self, self._root)
end


DnsPacket.PointerStruct = class.class(KaitaiStruct)

function DnsPacket.PointerStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.PointerStruct:_read()
  self.value = self._io:read_u1()
end

DnsPacket.PointerStruct.property.contents = {}
function DnsPacket.PointerStruct.property.contents:get()
  if self._m_contents ~= nil then
    return self._m_contents
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek((self.value + ((self._parent.length - 192) << 8)))
  self._m_contents = DnsPacket.DomainName(_io, self, self._root)
  _io:seek(_pos)
  return self._m_contents
end

-- 
-- Read one byte, then offset to that position, read one domain-name and return.

DnsPacket.Label = class.class(KaitaiStruct)

function DnsPacket.Label:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.Label:_read()
  self.length = self._io:read_u1()
  if self.is_pointer then
    self.pointer = DnsPacket.PointerStruct(self._io, self, self._root)
  end
  if not(self.is_pointer) then
    self.name = str_decode.decode(self._io:read_bytes(self.length), "utf-8")
  end
end

DnsPacket.Label.property.is_pointer = {}
function DnsPacket.Label.property.is_pointer:get()
  if self._m_is_pointer ~= nil then
    return self._m_is_pointer
  end

  self._m_is_pointer = self.length >= 192
  return self._m_is_pointer
end

-- 
-- RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name.
-- 
-- Otherwise its a string the length of the length value.

DnsPacket.Query = class.class(KaitaiStruct)

function DnsPacket.Query:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.Query:_read()
  self.name = DnsPacket.DomainName(self._io, self, self._root)
  self.type = DnsPacket.TypeType(self._io:read_u2be())
  self.query_class = DnsPacket.ClassType(self._io:read_u2be())
end


DnsPacket.DomainName = class.class(KaitaiStruct)

function DnsPacket.DomainName:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.DomainName:_read()
  self.name = {}
  local i = 0
  while true do
    local _ = DnsPacket.Label(self._io, self, self._root)
    self.name[i + 1] = _
    if  ((_.length == 0) or (_.length >= 192))  then
      break
    end
    i = i + 1
  end
end

-- 
-- Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator).

DnsPacket.AddressV6 = class.class(KaitaiStruct)

function DnsPacket.AddressV6:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.AddressV6:_read()
  self.ip_v6 = self._io:read_bytes(16)
end


DnsPacket.Service = class.class(KaitaiStruct)

function DnsPacket.Service:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.Service:_read()
  self.priority = self._io:read_u2be()
  self.weight = self._io:read_u2be()
  self.port = self._io:read_u2be()
  self.target = DnsPacket.DomainName(self._io, self, self._root)
end


DnsPacket.Txt = class.class(KaitaiStruct)

function DnsPacket.Txt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.Txt:_read()
  self.length = self._io:read_u1()
  self.text = str_decode.decode(self._io:read_bytes(self.length), "utf-8")
end


DnsPacket.TxtBody = class.class(KaitaiStruct)

function DnsPacket.TxtBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.TxtBody:_read()
  self.data = {}
  local i = 0
  while not self._io:is_eof() do
    self.data[i + 1] = DnsPacket.Txt(self._io, self, self._root)
    i = i + 1
  end
end


DnsPacket.Address = class.class(KaitaiStruct)

function DnsPacket.Address:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.Address:_read()
  self.ip = self._io:read_bytes(4)
end


DnsPacket.Answer = class.class(KaitaiStruct)

function DnsPacket.Answer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.Answer:_read()
  self.name = DnsPacket.DomainName(self._io, self, self._root)
  self.type = DnsPacket.TypeType(self._io:read_u2be())
  self.answer_class = DnsPacket.ClassType(self._io:read_u2be())
  self.ttl = self._io:read_s4be()
  self.rdlength = self._io:read_u2be()
  local _on = self.type
  if _on == DnsPacket.TypeType.srv then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.Service(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.a then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.Address(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.cname then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.DomainName(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.ns then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.DomainName(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.soa then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.AuthorityInfo(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.mx then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.MxInfo(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.txt then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.TxtBody(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.ptr then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.DomainName(_io, self, self._root)
  elseif _on == DnsPacket.TypeType.aaaa then
    self._raw_payload = self._io:read_bytes(self.rdlength)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = DnsPacket.AddressV6(_io, self, self._root)
  else
    self.payload = self._io:read_bytes(self.rdlength)
  end
end

-- 
-- Time to live (in seconds).
-- 
-- Length in octets of the following payload.

DnsPacket.PacketFlags = class.class(KaitaiStruct)

function DnsPacket.PacketFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.PacketFlags:_read()
  self.flag = self._io:read_u2be()
end

DnsPacket.PacketFlags.property.qr = {}
function DnsPacket.PacketFlags.property.qr:get()
  if self._m_qr ~= nil then
    return self._m_qr
  end

  self._m_qr = ((self.flag & 32768) >> 15)
  return self._m_qr
end

DnsPacket.PacketFlags.property.ra = {}
function DnsPacket.PacketFlags.property.ra:get()
  if self._m_ra ~= nil then
    return self._m_ra
  end

  self._m_ra = ((self.flag & 128) >> 7)
  return self._m_ra
end

DnsPacket.PacketFlags.property.tc = {}
function DnsPacket.PacketFlags.property.tc:get()
  if self._m_tc ~= nil then
    return self._m_tc
  end

  self._m_tc = ((self.flag & 512) >> 9)
  return self._m_tc
end

DnsPacket.PacketFlags.property.is_opcode_valid = {}
function DnsPacket.PacketFlags.property.is_opcode_valid:get()
  if self._m_is_opcode_valid ~= nil then
    return self._m_is_opcode_valid
  end

  self._m_is_opcode_valid =  ((self.opcode == 0) or (self.opcode == 1) or (self.opcode == 2)) 
  return self._m_is_opcode_valid
end

DnsPacket.PacketFlags.property.rcode = {}
function DnsPacket.PacketFlags.property.rcode:get()
  if self._m_rcode ~= nil then
    return self._m_rcode
  end

  self._m_rcode = ((self.flag & 15) >> 0)
  return self._m_rcode
end

DnsPacket.PacketFlags.property.opcode = {}
function DnsPacket.PacketFlags.property.opcode:get()
  if self._m_opcode ~= nil then
    return self._m_opcode
  end

  self._m_opcode = ((self.flag & 30720) >> 11)
  return self._m_opcode
end

DnsPacket.PacketFlags.property.aa = {}
function DnsPacket.PacketFlags.property.aa:get()
  if self._m_aa ~= nil then
    return self._m_aa
  end

  self._m_aa = ((self.flag & 1024) >> 10)
  return self._m_aa
end

DnsPacket.PacketFlags.property.z = {}
function DnsPacket.PacketFlags.property.z:get()
  if self._m_z ~= nil then
    return self._m_z
  end

  self._m_z = ((self.flag & 64) >> 6)
  return self._m_z
end

DnsPacket.PacketFlags.property.rd = {}
function DnsPacket.PacketFlags.property.rd:get()
  if self._m_rd ~= nil then
    return self._m_rd
  end

  self._m_rd = ((self.flag & 256) >> 8)
  return self._m_rd
end

DnsPacket.PacketFlags.property.cd = {}
function DnsPacket.PacketFlags.property.cd:get()
  if self._m_cd ~= nil then
    return self._m_cd
  end

  self._m_cd = ((self.flag & 16) >> 4)
  return self._m_cd
end

DnsPacket.PacketFlags.property.ad = {}
function DnsPacket.PacketFlags.property.ad:get()
  if self._m_ad ~= nil then
    return self._m_ad
  end

  self._m_ad = ((self.flag & 32) >> 5)
  return self._m_ad
end


DnsPacket.AuthorityInfo = class.class(KaitaiStruct)

function DnsPacket.AuthorityInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DnsPacket.AuthorityInfo:_read()
  self.primary_ns = DnsPacket.DomainName(self._io, self, self._root)
  self.resoponsible_mailbox = DnsPacket.DomainName(self._io, self, self._root)
  self.serial = self._io:read_u4be()
  self.refresh_interval = self._io:read_u4be()
  self.retry_interval = self._io:read_u4be()
  self.expire_limit = self._io:read_u4be()
  self.min_ttl = self._io:read_u4be()
end


