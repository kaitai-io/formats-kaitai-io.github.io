-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

require("pcx")
-- 
-- DCX is a simple extension of PCX image format allowing to bundle
-- many PCX images (typically, pages of a document) in one file. It saw
-- some limited use in DOS-era fax software, but was largely
-- superseeded with multi-page TIFFs and PDFs since then.
PcxDcx = class.class(KaitaiStruct)

function PcxDcx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PcxDcx:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\177\104\222\058") then
    error("not equal, expected " ..  "\177\104\222\058" .. ", but got " .. self.magic)
  end
  self.files = {}
  local i = 0
  while true do
    _ = PcxDcx.PcxOffset(self._io, self, self._root)
    self.files[i + 1] = _
    if _.ofs_body == 0 then
      break
    end
    i = i + 1
  end
end


PcxDcx.PcxOffset = class.class(KaitaiStruct)

function PcxDcx.PcxOffset:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function PcxDcx.PcxOffset:_read()
self.ofs_body = self._io:read_u4le()
end

PcxDcx.PcxOffset.property.body = {}
function PcxDcx.PcxOffset.property.body:get()
if self._m_body ~= nil then
  return self._m_body
end

if self.ofs_body ~= 0 then
  local _pos = self._io:pos()
  self._io:seek(self.ofs_body)
  self._m_body = Pcx(self._io)
  self._io:seek(_pos)
end
return self._m_body
end


