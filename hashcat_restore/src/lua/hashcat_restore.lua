-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://hashcat.net/wiki/doku.php?id=restore)
HashcatRestore = class.class(KaitaiStruct)

function HashcatRestore:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HashcatRestore:_read()
  self.version = self._io:read_u4le()
  self.cwd = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(256), 0, false), "UTF-8")
  self.dicts_pos = self._io:read_u4le()
  self.masks_pos = self._io:read_u4le()
  self.padding = self._io:read_bytes(4)
  self.current_restore_point = self._io:read_u8le()
  self.argc = self._io:read_u4le()
  self.padding2 = self._io:read_bytes(12)
  self.argv = {}
  for i = 0, self.argc - 1 do
    self.argv[i + 1] = str_decode.decode(self._io:read_bytes_term(10, false, true, true), "UTF-8")
  end
end


