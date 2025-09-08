-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- It is a color scheme for visualising SPM scans.
NtMdtPal = class.class(KaitaiStruct)

function NtMdtPal:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function NtMdtPal:_read()
  self.signature = self._io:read_bytes(26)
  if not(self.signature == "\078\084\045\077\068\084\032\080\097\108\101\116\116\101\032\070\105\108\101\032\032\049\046\048\048\033") then
    error("not equal, expected " .. "\078\084\045\077\068\084\032\080\097\108\101\116\116\101\032\070\105\108\101\032\032\049\046\048\048\033" .. ", but got " .. self.signature)
  end
  self.count = self._io:read_u4be()
  self.meta = {}
  for i = 0, self.count - 1 do
    self.meta[i + 1] = NtMdtPal.Meta(self._io, self, self._root)
  end
  self.something2 = self._io:read_bytes(1)
  self.tables = {}
  for i = 0, self.count - 1 do
    self.tables[i + 1] = NtMdtPal.ColTable(i, self._io, self, self._root)
  end
end


NtMdtPal.ColTable = class.class(KaitaiStruct)

function NtMdtPal.ColTable:_init(index, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.index = index
  self:_read()
end

function NtMdtPal.ColTable:_read()
  self.size1 = self._io:read_u1()
  self.unkn = self._io:read_u1()
  self.title = str_decode.decode(self._io:read_bytes(self._root.meta[self.index + 1].name_size), "UTF-16LE")
  self.unkn1 = self._io:read_u2be()
  self.colors = {}
  for i = 0, self._root.meta[self.index + 1].colors_count - 1 - 1 do
    self.colors[i + 1] = NtMdtPal.Color(self._io, self, self._root)
  end
end


NtMdtPal.Color = class.class(KaitaiStruct)

function NtMdtPal.Color:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function NtMdtPal.Color:_read()
  self.red = self._io:read_u1()
  self.unkn = self._io:read_u1()
  self.blue = self._io:read_u1()
  self.green = self._io:read_u1()
end


NtMdtPal.Meta = class.class(KaitaiStruct)

function NtMdtPal.Meta:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function NtMdtPal.Meta:_read()
  self.unkn00 = self._io:read_bytes(3)
  self.unkn01 = self._io:read_bytes(2)
  self.unkn02 = self._io:read_bytes(1)
  self.unkn03 = self._io:read_bytes(1)
  self.colors_count = self._io:read_u2le()
  self.unkn10 = self._io:read_bytes(2)
  self.unkn11 = self._io:read_bytes(1)
  self.unkn12 = self._io:read_bytes(2)
  self.name_size = self._io:read_u2be()
end

-- 
-- usually 0s.
-- 
-- usually 0s.
-- 
-- usually 0s.
-- 
-- usually 4.
-- 
-- usually 0s.

