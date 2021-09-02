-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
-- 
-- * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
--   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
-- 
-- [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
-- [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
-- 
-- All image versions can be found in factory images at
-- <https://developers.google.com/android/images> for the specific device. To
-- avoid having to download an entire ZIP archive when you only need one file
-- from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
-- use its [command line
-- tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
-- members in the archive and then to download only the file you want.
-- See also: Source (https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py)
AndroidBootldrHuawei = class.class(KaitaiStruct)

function AndroidBootldrHuawei:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrHuawei:_read()
  self.meta_header = AndroidBootldrHuawei.MetaHdr(self._io, self, self._root)
  self.header_ext = self._io:read_bytes((self.meta_header.len_meta_header - 76))
  self._raw_image_header = self._io:read_bytes(self.meta_header.len_image_header)
  local _io = KaitaiStream(stringstream(self._raw_image_header))
  self.image_header = AndroidBootldrHuawei.ImageHdr(_io, self, self._root)
end


AndroidBootldrHuawei.MetaHdr = class.class(KaitaiStruct)

function AndroidBootldrHuawei.MetaHdr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrHuawei.MetaHdr:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\060\214\026\206") then
    error("not equal, expected " ..  "\060\214\026\206" .. ", but got " .. self.magic)
  end
  self.version = AndroidBootldrHuawei.Version(self._io, self, self._root)
  self.image_version = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(64), 0, false), "ASCII")
  self.len_meta_header = self._io:read_u2le()
  self.len_image_header = self._io:read_u2le()
end


AndroidBootldrHuawei.Version = class.class(KaitaiStruct)

function AndroidBootldrHuawei.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrHuawei.Version:_read()
  self.major = self._io:read_u2le()
  self.minor = self._io:read_u2le()
end


AndroidBootldrHuawei.ImageHdr = class.class(KaitaiStruct)

function AndroidBootldrHuawei.ImageHdr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrHuawei.ImageHdr:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = AndroidBootldrHuawei.ImageHdrEntry(self._io, self, self._root)
    i = i + 1
  end
end


AndroidBootldrHuawei.ImageHdrEntry = class.class(KaitaiStruct)

function AndroidBootldrHuawei.ImageHdrEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrHuawei.ImageHdrEntry:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(72), 0, false), "ASCII")
  self.ofs_body = self._io:read_u4le()
  self.len_body = self._io:read_u4le()
end

AndroidBootldrHuawei.ImageHdrEntry.property.body = {}
function AndroidBootldrHuawei.ImageHdrEntry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_body)
  self._m_body = _io:read_bytes(self.len_body)
  _io:seek(_pos)
  return self._m_body
end

-- 
-- partition name.

