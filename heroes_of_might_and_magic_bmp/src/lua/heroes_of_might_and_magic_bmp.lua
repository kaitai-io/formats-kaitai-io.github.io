-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

HeroesOfMightAndMagicBmp = class.class(KaitaiStruct)

function HeroesOfMightAndMagicBmp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeroesOfMightAndMagicBmp:_read()
  self.magic = self._io:read_u2le()
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.data = self._io:read_bytes((self.width * self.height))
end


