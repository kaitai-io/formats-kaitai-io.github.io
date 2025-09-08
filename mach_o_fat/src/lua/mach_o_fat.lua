-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("mach_o")
local stringstream = require("string_stream")

-- 
-- This is a simple container format that encapsulates multiple Mach-O files,
-- each generally for a different architecture. XNU can execute these files just
-- like single-arch Mach-Os and will pick the appropriate entry.
-- See also: Source (https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html)
MachOFat = class.class(KaitaiStruct)

function MachOFat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachOFat:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\202\254\186\190") then
    error("not equal, expected " .. "\202\254\186\190" .. ", but got " .. self.magic)
  end
  self.num_fat_arch = self._io:read_u4be()
  self.fat_archs = {}
  for i = 0, self.num_fat_arch - 1 do
    self.fat_archs[i + 1] = MachOFat.FatArch(self._io, self, self._root)
  end
end


MachOFat.FatArch = class.class(KaitaiStruct)

function MachOFat.FatArch:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MachOFat.FatArch:_read()
  self.cpu_type = MachO.CpuType(self._io:read_u4be())
  self.cpu_subtype = self._io:read_u4be()
  self.ofs_object = self._io:read_u4be()
  self.len_object = self._io:read_u4be()
  self.align = self._io:read_u4be()
end

MachOFat.FatArch.property.object = {}
function MachOFat.FatArch.property.object:get()
  if self._m_object ~= nil then
    return self._m_object
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_object)
  self._raw__m_object = self._io:read_bytes(self.len_object)
  local _io = KaitaiStream(stringstream(self._raw__m_object))
  self._m_object = MachO(_io)
  self._io:seek(_pos)
  return self._m_object
end


