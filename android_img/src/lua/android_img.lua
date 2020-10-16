-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- See also: Source (https://source.android.com/devices/bootloader/boot-image-header)
AndroidImg = class.class(KaitaiStruct)

function AndroidImg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidImg:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\065\078\068\082\079\073\068\033") then
    error("not equal, expected " ..  "\065\078\068\082\079\073\068\033" .. ", but got " .. self.magic)
  end
  self.kernel = AndroidImg.Load(self._io, self, self._root)
  self.ramdisk = AndroidImg.Load(self._io, self, self._root)
  self.second = AndroidImg.Load(self._io, self, self._root)
  self.tags_load = self._io:read_u4le()
  self.page_size = self._io:read_u4le()
  self.header_version = self._io:read_u4le()
  self.os_version = AndroidImg.OsVersion(self._io, self, self._root)
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(16), 0, false), "ASCII")
  self.cmdline = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(512), 0, false), "ASCII")
  self.sha = self._io:read_bytes(32)
  self.extra_cmdline = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(1024), 0, false), "ASCII")
  if self.header_version > 0 then
    self.recovery_dtbo = AndroidImg.SizeOffset(self._io, self, self._root)
  end
  if self.header_version > 0 then
    self.boot_header_size = self._io:read_u4le()
  end
  if self.header_version > 1 then
    self.dtb = AndroidImg.LoadLong(self._io, self, self._root)
  end
end

AndroidImg.property.kernel_img = {}
function AndroidImg.property.kernel_img:get()
  if self._m_kernel_img ~= nil then
    return self._m_kernel_img
  end

  local _pos = self._io:pos()
  self._io:seek(self.page_size)
  self._m_kernel_img = self._io:read_bytes(self.kernel.size)
  self._io:seek(_pos)
  return self._m_kernel_img
end

-- 
-- tags offset from base.
AndroidImg.property.tags_offset = {}
function AndroidImg.property.tags_offset:get()
  if self._m_tags_offset ~= nil then
    return self._m_tags_offset
  end

  self._m_tags_offset = (self.tags_load - self.base)
  return self._m_tags_offset
end

-- 
-- ramdisk offset from base.
AndroidImg.property.ramdisk_offset = {}
function AndroidImg.property.ramdisk_offset:get()
  if self._m_ramdisk_offset ~= nil then
    return self._m_ramdisk_offset
  end

  self._m_ramdisk_offset = utils.box_unwrap((self.ramdisk.addr > 0) and utils.box_wrap((self.ramdisk.addr - self.base)) or (0))
  return self._m_ramdisk_offset
end

-- 
-- 2nd bootloader offset from base.
AndroidImg.property.second_offset = {}
function AndroidImg.property.second_offset:get()
  if self._m_second_offset ~= nil then
    return self._m_second_offset
  end

  self._m_second_offset = utils.box_unwrap((self.second.addr > 0) and utils.box_wrap((self.second.addr - self.base)) or (0))
  return self._m_second_offset
end

-- 
-- kernel offset from base.
AndroidImg.property.kernel_offset = {}
function AndroidImg.property.kernel_offset:get()
  if self._m_kernel_offset ~= nil then
    return self._m_kernel_offset
  end

  self._m_kernel_offset = (self.kernel.addr - self.base)
  return self._m_kernel_offset
end

-- 
-- dtb offset from base.
AndroidImg.property.dtb_offset = {}
function AndroidImg.property.dtb_offset:get()
  if self._m_dtb_offset ~= nil then
    return self._m_dtb_offset
  end

  if self.header_version > 1 then
    self._m_dtb_offset = utils.box_unwrap((self.dtb.addr > 0) and utils.box_wrap((self.dtb.addr - self.base)) or (0))
  end
  return self._m_dtb_offset
end

AndroidImg.property.dtb_img = {}
function AndroidImg.property.dtb_img:get()
  if self._m_dtb_img ~= nil then
    return self._m_dtb_img
  end

  if  ((self.header_version > 1) and (self.dtb.size > 0))  then
    local _pos = self._io:pos()
    self._io:seek((math.floor(((((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.second.size) + self.recovery_dtbo.size) + self.page_size) - 1) / self.page_size) * self.page_size))
    self._m_dtb_img = self._io:read_bytes(self.dtb.size)
    self._io:seek(_pos)
  end
  return self._m_dtb_img
end

AndroidImg.property.ramdisk_img = {}
function AndroidImg.property.ramdisk_img:get()
  if self._m_ramdisk_img ~= nil then
    return self._m_ramdisk_img
  end

  if self.ramdisk.size > 0 then
    local _pos = self._io:pos()
    self._io:seek((math.floor((((self.page_size + self.kernel.size) + self.page_size) - 1) / self.page_size) * self.page_size))
    self._m_ramdisk_img = self._io:read_bytes(self.ramdisk.size)
    self._io:seek(_pos)
  end
  return self._m_ramdisk_img
end

AndroidImg.property.recovery_dtbo_img = {}
function AndroidImg.property.recovery_dtbo_img:get()
  if self._m_recovery_dtbo_img ~= nil then
    return self._m_recovery_dtbo_img
  end

  if  ((self.header_version > 0) and (self.recovery_dtbo.size > 0))  then
    local _pos = self._io:pos()
    self._io:seek(self.recovery_dtbo.offset)
    self._m_recovery_dtbo_img = self._io:read_bytes(self.recovery_dtbo.size)
    self._io:seek(_pos)
  end
  return self._m_recovery_dtbo_img
end

AndroidImg.property.second_img = {}
function AndroidImg.property.second_img:get()
  if self._m_second_img ~= nil then
    return self._m_second_img
  end

  if self.second.size > 0 then
    local _pos = self._io:pos()
    self._io:seek((math.floor(((((self.page_size + self.kernel.size) + self.ramdisk.size) + self.page_size) - 1) / self.page_size) * self.page_size))
    self._m_second_img = self._io:read_bytes(self.second.size)
    self._io:seek(_pos)
  end
  return self._m_second_img
end

-- 
-- base loading address.
AndroidImg.property.base = {}
function AndroidImg.property.base:get()
  if self._m_base ~= nil then
    return self._m_base
  end

  self._m_base = (self.kernel.addr - 32768)
  return self._m_base
end


AndroidImg.Load = class.class(KaitaiStruct)

function AndroidImg.Load:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidImg.Load:_read()
  self.size = self._io:read_u4le()
  self.addr = self._io:read_u4le()
end


AndroidImg.LoadLong = class.class(KaitaiStruct)

function AndroidImg.LoadLong:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidImg.LoadLong:_read()
  self.size = self._io:read_u4le()
  self.addr = self._io:read_u8le()
end


AndroidImg.SizeOffset = class.class(KaitaiStruct)

function AndroidImg.SizeOffset:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidImg.SizeOffset:_read()
  self.size = self._io:read_u4le()
  self.offset = self._io:read_u8le()
end


AndroidImg.OsVersion = class.class(KaitaiStruct)

function AndroidImg.OsVersion:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidImg.OsVersion:_read()
  self.version = self._io:read_u4le()
end

AndroidImg.OsVersion.property.month = {}
function AndroidImg.OsVersion.property.month:get()
  if self._m_month ~= nil then
    return self._m_month
  end

  self._m_month = (self.version & 15)
  return self._m_month
end

AndroidImg.OsVersion.property.patch = {}
function AndroidImg.OsVersion.property.patch:get()
  if self._m_patch ~= nil then
    return self._m_patch
  end

  self._m_patch = ((self.version >> 11) & 127)
  return self._m_patch
end

AndroidImg.OsVersion.property.year = {}
function AndroidImg.OsVersion.property.year:get()
  if self._m_year ~= nil then
    return self._m_year
  end

  self._m_year = (((self.version >> 4) & 127) + 2000)
  return self._m_year
end

AndroidImg.OsVersion.property.major = {}
function AndroidImg.OsVersion.property.major:get()
  if self._m_major ~= nil then
    return self._m_major
  end

  self._m_major = ((self.version >> 25) & 127)
  return self._m_major
end

AndroidImg.OsVersion.property.minor = {}
function AndroidImg.OsVersion.property.minor:get()
  if self._m_minor ~= nil then
    return self._m_minor
  end

  self._m_minor = ((self.version >> 18) & 127)
  return self._m_minor
end


