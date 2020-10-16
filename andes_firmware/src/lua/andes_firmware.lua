-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Firmware image found with MediaTek MT76xx wifi chipsets.
AndesFirmware = class.class(KaitaiStruct)

function AndesFirmware:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndesFirmware:_read()
  self._raw_image_header = self._io:read_bytes(32)
  local _io = KaitaiStream(stringstream(self._raw_image_header))
  self.image_header = AndesFirmware.ImageHeader(_io, self, self._root)
  self.ilm = self._io:read_bytes(self.image_header.ilm_len)
  self.dlm = self._io:read_bytes(self.image_header.dlm_len)
end


AndesFirmware.ImageHeader = class.class(KaitaiStruct)

function AndesFirmware.ImageHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndesFirmware.ImageHeader:_read()
  self.ilm_len = self._io:read_u4le()
  self.dlm_len = self._io:read_u4le()
  self.fw_ver = self._io:read_u2le()
  self.build_ver = self._io:read_u2le()
  self.extra = self._io:read_u4le()
  self.build_time = str_decode.decode(self._io:read_bytes(16), "UTF-8")
end


