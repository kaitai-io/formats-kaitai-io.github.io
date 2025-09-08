-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- Resource file found in CPB firmware archives, mostly used on older CoolPad
-- phones and/or tablets. The only observed files are called "ResPack.cfg".
Respack = class.class(KaitaiStruct)

function Respack:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Respack:_read()
  self.header = Respack.Header(self._io, self, self._root)
  self.json = str_decode.decode(self._io:read_bytes(self.header.len_json), "UTF-8")
end


Respack.Header = class.class(KaitaiStruct)

function Respack.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Respack.Header:_read()
  self.magic = self._io:read_bytes(2)
  if not(self.magic == "\082\083") then
    error("not equal, expected " .. "\082\083" .. ", but got " .. self.magic)
  end
  self.unknown = self._io:read_bytes(8)
  self.len_json = self._io:read_u4le()
  self.md5 = str_decode.decode(self._io:read_bytes(32), "UTF-8")
end

-- 
-- MD5 of data that follows the header.

