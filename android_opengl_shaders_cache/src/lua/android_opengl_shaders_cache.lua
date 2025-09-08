-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Android apps using directly or indirectly OpenGL cache compiled shaders
-- into com.android.opengl.shaders_cache file.
-- See also: Source (https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp)
AndroidOpenglShadersCache = class.class(KaitaiStruct)

function AndroidOpenglShadersCache:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidOpenglShadersCache:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\069\071\076\036") then
    error("not equal, expected " .. "\069\071\076\036" .. ", but got " .. self.magic)
  end
  self.crc32 = self._io:read_u4le()
  self._raw_contents = self._io:read_bytes_full()
  local _io = KaitaiStream(stringstream(self._raw_contents))
  self.contents = AndroidOpenglShadersCache.Cache(_io, self, self._root)
end

-- 
-- crc32 of `contents`.

AndroidOpenglShadersCache.Alignment = class.class(KaitaiStruct)

function AndroidOpenglShadersCache.Alignment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AndroidOpenglShadersCache.Alignment:_read()
  self.alignment = self._io:read_bytes(self._io:pos() + 3 & ~3 - self._io:pos())
end

-- 
-- garbage from memory.

-- 
-- See also: Source (https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp)
AndroidOpenglShadersCache.Cache = class.class(KaitaiStruct)

function AndroidOpenglShadersCache.Cache:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AndroidOpenglShadersCache.Cache:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\036\098\066\095") then
    error("not equal, expected " .. "\036\098\066\095" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4le()
  self.device_version = self._io:read_u4le()
  self.num_entries = self._io:read_u4le()
  if self.version >= 3 then
    self.build_id = AndroidOpenglShadersCache.PrefixedString(self._io, self, self._root)
  end
  self.entries = {}
  for i = 0, self.num_entries - 1 do
    self.entries[i + 1] = AndroidOpenglShadersCache.Cache.Entry(self._io, self, self._root)
  end
end


AndroidOpenglShadersCache.Cache.Entry = class.class(KaitaiStruct)

function AndroidOpenglShadersCache.Cache.Entry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AndroidOpenglShadersCache.Cache.Entry:_read()
  self.len_key = self._io:read_u4le()
  self.len_value = self._io:read_u4le()
  self.key = self._io:read_bytes(self.len_key)
  self.value = self._io:read_bytes(self.len_value)
  self.alignment = AndroidOpenglShadersCache.Alignment(self._io, self, self._root)
end


AndroidOpenglShadersCache.PrefixedString = class.class(KaitaiStruct)

function AndroidOpenglShadersCache.PrefixedString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AndroidOpenglShadersCache.PrefixedString:_read()
  self.len_str = self._io:read_u4le()
  self.str = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(self.len_str), 0, false), "ASCII")
  self.alignment = AndroidOpenglShadersCache.Alignment(self._io, self, self._root)
end


