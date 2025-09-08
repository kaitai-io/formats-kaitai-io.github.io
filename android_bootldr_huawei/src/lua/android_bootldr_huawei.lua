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
-- See also: Source (https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&id=a68d284aee85)
-- See also: Source (https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85)
AndroidBootldrHuawei = class.class(KaitaiStruct)

function AndroidBootldrHuawei:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrHuawei:_read()
  self.meta_header = AndroidBootldrHuawei.MetaHdr(self._io, self, self._root)
  self.header_ext = self._io:read_bytes(self.meta_header.len_meta_header - 76)
  self._raw_image_header = self._io:read_bytes(self.meta_header.len_image_header)
  local _io = KaitaiStream(stringstream(self._raw_image_header))
  self.image_header = AndroidBootldrHuawei.ImageHdr(_io, self, self._root)
end


AndroidBootldrHuawei.ImageHdr = class.class(KaitaiStruct)

function AndroidBootldrHuawei.ImageHdr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
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

-- 
-- The C generator program defines `img_header` as a [fixed size
-- array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
-- of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
-- defined as `16`).
-- 
-- This means that technically there will always be 16 `image_hdr`
-- entries, the first *n* entries being used (filled with real values)
-- and the rest left unused with all bytes zero.
-- 
-- To check if an entry is used, use the `is_used` attribute.

AndroidBootldrHuawei.ImageHdrEntry = class.class(KaitaiStruct)

function AndroidBootldrHuawei.ImageHdrEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
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

  if self.is_used then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_body)
    self._m_body = _io:read_bytes(self.len_body)
    _io:seek(_pos)
  end
  return self._m_body
end

-- 
-- See also: Source (https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n119)
AndroidBootldrHuawei.ImageHdrEntry.property.is_used = {}
function AndroidBootldrHuawei.ImageHdrEntry.property.is_used:get()
  if self._m_is_used ~= nil then
    return self._m_is_used
  end

  self._m_is_used =  ((self.ofs_body ~= 0) and (self.len_body ~= 0)) 
  return self._m_is_used
end

-- 
-- partition name.

AndroidBootldrHuawei.MetaHdr = class.class(KaitaiStruct)

function AndroidBootldrHuawei.MetaHdr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AndroidBootldrHuawei.MetaHdr:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\060\214\026\206") then
    error("not equal, expected " .. "\060\214\026\206" .. ", but got " .. self.magic)
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
  self._root = root
  self:_read()
end

function AndroidBootldrHuawei.Version:_read()
  self.major = self._io:read_u2le()
  self.minor = self._io:read_u2le()
end


