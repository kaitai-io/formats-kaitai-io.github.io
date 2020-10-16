-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
BytesWithIo = class.class(KaitaiStruct)

function BytesWithIo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BytesWithIo:_read()
  self.data = self._io:read_bytes_full()
end

-- 
-- The actual data.

