-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- CHG is a container format file used by
-- [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
-- package for analysis & design of reinforced concrete multi-storey
-- buildings with arbitrary configuration in plan.
-- 
-- CHG is a simple container, which bundles several project files
-- together.
-- 
-- Written and tested by Vladimir Shulzhitskiy, 2017
MonomakhSaprChg = class.class(KaitaiStruct)

function MonomakhSaprChg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MonomakhSaprChg:_read()
  self.title = str_decode.decode(self._io:read_bytes(10), "ascii")
  self.ent = {}
  local i = 0
  while not self._io:is_eof() do
    self.ent[i + 1] = MonomakhSaprChg.Block(self._io, self, self._root)
    i = i + 1
  end
end


MonomakhSaprChg.Block = class.class(KaitaiStruct)

function MonomakhSaprChg.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MonomakhSaprChg.Block:_read()
  self.header = str_decode.decode(self._io:read_bytes(13), "ascii")
  self.file_size = self._io:read_u8le()
  self.file = self._io:read_bytes(self.file_size)
end


