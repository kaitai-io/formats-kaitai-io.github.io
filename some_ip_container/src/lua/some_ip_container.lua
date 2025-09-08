-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("some_ip")

SomeIpContainer = class.class(KaitaiStruct)

function SomeIpContainer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIpContainer:_read()
  self.some_ip_packages = {}
  local i = 0
  while not self._io:is_eof() do
    self.some_ip_packages[i + 1] = SomeIp(self._io)
    i = i + 1
  end
end


