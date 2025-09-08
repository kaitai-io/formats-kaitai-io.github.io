-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- A bootloader image which only seems to have been used on a few ASUS
-- devices. The encoding is ASCII, because the `releasetools.py` script
-- is written using Python 2, where the default encoding is ASCII.
-- 
-- A test file can be found in the firmware files for the "fugu" device,
-- which can be downloaded from <https://developers.google.com/android/images>
-- See also: Source (https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py)
AndroidBootldrAsus = class.class(KaitaiStruct)

function AndroidBootldrAsus:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrAsus:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\066\079\079\084\076\068\082\033") then
    error("not equal, expected " .. "\066\079\079\084\076\068\082\033" .. ", but got " .. self.magic)
  end
  self.revision = self._io:read_u2le()
  if not(self.revision >= 2) then
    error("ValidationLessThanError")
  end
  self.reserved1 = self._io:read_u2le()
  self.reserved2 = self._io:read_u4le()
  self.images = {}
  for i = 0, 3 - 1 do
    self.images[i + 1] = AndroidBootldrAsus.Image(self._io, self, self._root)
  end
end

-- 
-- Only three images are included: `ifwi.bin`, `droidboot.img`
-- and `splashscreen.img`

AndroidBootldrAsus.Image = class.class(KaitaiStruct)

function AndroidBootldrAsus.Image:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AndroidBootldrAsus.Image:_read()
  self.chunk_id = str_decode.decode(self._io:read_bytes(8), "ASCII")
  if not( ((self.chunk_id == "IFWI!!!!") or (self.chunk_id == "DROIDBT!") or (self.chunk_id == "SPLASHS!")) ) then
    error("ValidationNotAnyOfError")
  end
  self.len_body = self._io:read_u4le()
  self.flags = self._io:read_u1()
  local _ = self.flags
  if not(_ & 1 ~= 0) then
    error("ValidationExprError")
  end
  self.reserved1 = self._io:read_u1()
  self.reserved2 = self._io:read_u1()
  self.reserved3 = self._io:read_u1()
  self.body = self._io:read_bytes(self.len_body)
end

AndroidBootldrAsus.Image.property.file_name = {}
function AndroidBootldrAsus.Image.property.file_name:get()
  if self._m_file_name ~= nil then
    return self._m_file_name
  end

  self._m_file_name = utils.box_unwrap((self.chunk_id == "IFWI!!!!") and utils.box_wrap("ifwi.bin") or (utils.box_unwrap((self.chunk_id == "DROIDBT!") and utils.box_wrap("droidboot.img") or (utils.box_unwrap((self.chunk_id == "SPLASHS!") and utils.box_wrap("splashscreen.img") or (""))))))
  return self._m_file_name
end


