-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- GIF (Graphics Interchange Format) is an image file format, developed
-- in 1987. It became popular in 1990s as one of the main image formats
-- used in World Wide Web.
-- 
-- GIF format allows encoding of palette-based images up to 256 colors
-- (each of the colors can be chosen from a 24-bit RGB
-- colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
-- compression.
-- 
-- Over the years, several version of the format were published and
-- several extensions to it were made, namely, a popular Netscape
-- extension that allows to store several images in one file, switching
-- between them, which produces crude form of animation.
-- 
-- Structurally, format consists of several mandatory headers and then
-- a stream of blocks follows. Blocks can carry additional
-- metainformation or image data.
Gif = class.class(KaitaiStruct)

Gif.BlockType = enum.Enum {
  extension = 33,
  local_image_descriptor = 44,
  end_of_file = 59,
}

Gif.ExtensionLabel = enum.Enum {
  graphic_control = 249,
  comment = 254,
  application = 255,
}

function Gif:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif:_read()
  self.hdr = Gif.Header(self._io, self, self._root)
  self.logical_screen_descriptor = Gif.LogicalScreenDescriptorStruct(self._io, self, self._root)
  if self.logical_screen_descriptor.has_color_table then
    self._raw_global_color_table = self._io:read_bytes((self.logical_screen_descriptor.color_table_size * 3))
    local _io = KaitaiStream(stringstream(self._raw_global_color_table))
    self.global_color_table = Gif.ColorTable(_io, self, self._root)
  end
  self.blocks = {}
  local i = 0
  while true do
    local _ = Gif.Block(self._io, self, self._root)
    self.blocks[i + 1] = _
    if  ((self._io:is_eof()) or (_.block_type == Gif.BlockType.end_of_file))  then
      break
    end
    i = i + 1
  end
end

-- 
-- See also: - section 18 (https://www.w3.org/Graphics/GIF/spec-gif89a.txt)

-- 
-- See also: - section 22 (https://www.w3.org/Graphics/GIF/spec-gif89a.txt)
Gif.ImageData = class.class(KaitaiStruct)

function Gif.ImageData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.ImageData:_read()
  self.lzw_min_code_size = self._io:read_u1()
  self.subblocks = Gif.Subblocks(self._io, self, self._root)
end


Gif.ColorTableEntry = class.class(KaitaiStruct)

function Gif.ColorTableEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.ColorTableEntry:_read()
  self.red = self._io:read_u1()
  self.green = self._io:read_u1()
  self.blue = self._io:read_u1()
end


-- 
-- See also: - section 18 (https://www.w3.org/Graphics/GIF/spec-gif89a.txt)
Gif.LogicalScreenDescriptorStruct = class.class(KaitaiStruct)

function Gif.LogicalScreenDescriptorStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.LogicalScreenDescriptorStruct:_read()
  self.screen_width = self._io:read_u2le()
  self.screen_height = self._io:read_u2le()
  self.flags = self._io:read_u1()
  self.bg_color_index = self._io:read_u1()
  self.pixel_aspect_ratio = self._io:read_u1()
end

Gif.LogicalScreenDescriptorStruct.property.has_color_table = {}
function Gif.LogicalScreenDescriptorStruct.property.has_color_table:get()
  if self._m_has_color_table ~= nil then
    return self._m_has_color_table
  end

  self._m_has_color_table = (self.flags & 128) ~= 0
  return self._m_has_color_table
end

Gif.LogicalScreenDescriptorStruct.property.color_table_size = {}
function Gif.LogicalScreenDescriptorStruct.property.color_table_size:get()
  if self._m_color_table_size ~= nil then
    return self._m_color_table_size
  end

  self._m_color_table_size = (2 << (self.flags & 7))
  return self._m_color_table_size
end


Gif.LocalImageDescriptor = class.class(KaitaiStruct)

function Gif.LocalImageDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.LocalImageDescriptor:_read()
  self.left = self._io:read_u2le()
  self.top = self._io:read_u2le()
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.flags = self._io:read_u1()
  if self.has_color_table then
    self._raw_local_color_table = self._io:read_bytes((self.color_table_size * 3))
    local _io = KaitaiStream(stringstream(self._raw_local_color_table))
    self.local_color_table = Gif.ColorTable(_io, self, self._root)
  end
  self.image_data = Gif.ImageData(self._io, self, self._root)
end

Gif.LocalImageDescriptor.property.has_color_table = {}
function Gif.LocalImageDescriptor.property.has_color_table:get()
  if self._m_has_color_table ~= nil then
    return self._m_has_color_table
  end

  self._m_has_color_table = (self.flags & 128) ~= 0
  return self._m_has_color_table
end

Gif.LocalImageDescriptor.property.has_interlace = {}
function Gif.LocalImageDescriptor.property.has_interlace:get()
  if self._m_has_interlace ~= nil then
    return self._m_has_interlace
  end

  self._m_has_interlace = (self.flags & 64) ~= 0
  return self._m_has_interlace
end

Gif.LocalImageDescriptor.property.has_sorted_color_table = {}
function Gif.LocalImageDescriptor.property.has_sorted_color_table:get()
  if self._m_has_sorted_color_table ~= nil then
    return self._m_has_sorted_color_table
  end

  self._m_has_sorted_color_table = (self.flags & 32) ~= 0
  return self._m_has_sorted_color_table
end

Gif.LocalImageDescriptor.property.color_table_size = {}
function Gif.LocalImageDescriptor.property.color_table_size:get()
  if self._m_color_table_size ~= nil then
    return self._m_color_table_size
  end

  self._m_color_table_size = (2 << (self.flags & 7))
  return self._m_color_table_size
end


Gif.Block = class.class(KaitaiStruct)

function Gif.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.Block:_read()
  self.block_type = Gif.BlockType(self._io:read_u1())
  local _on = self.block_type
  if _on == Gif.BlockType.extension then
    self.body = Gif.Extension(self._io, self, self._root)
  elseif _on == Gif.BlockType.local_image_descriptor then
    self.body = Gif.LocalImageDescriptor(self._io, self, self._root)
  end
end


-- 
-- See also: - section 19 (https://www.w3.org/Graphics/GIF/spec-gif89a.txt)
Gif.ColorTable = class.class(KaitaiStruct)

function Gif.ColorTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.ColorTable:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Gif.ColorTableEntry(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- See also: - section 17 (https://www.w3.org/Graphics/GIF/spec-gif89a.txt)
Gif.Header = class.class(KaitaiStruct)

function Gif.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.Header:_read()
  self.magic = self._io:read_bytes(3)
  if not(self.magic == "\071\073\070") then
    error("not equal, expected " ..  "\071\073\070" .. ", but got " .. self.magic)
  end
  self.version = str_decode.decode(self._io:read_bytes(3), "ASCII")
end


-- 
-- See also: - section 23 (https://www.w3.org/Graphics/GIF/spec-gif89a.txt)
Gif.ExtGraphicControl = class.class(KaitaiStruct)

function Gif.ExtGraphicControl:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.ExtGraphicControl:_read()
  self.block_size = self._io:read_bytes(1)
  if not(self.block_size == "\004") then
    error("not equal, expected " ..  "\004" .. ", but got " .. self.block_size)
  end
  self.flags = self._io:read_u1()
  self.delay_time = self._io:read_u2le()
  self.transparent_idx = self._io:read_u1()
  self.terminator = self._io:read_bytes(1)
  if not(self.terminator == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.terminator)
  end
end

Gif.ExtGraphicControl.property.transparent_color_flag = {}
function Gif.ExtGraphicControl.property.transparent_color_flag:get()
  if self._m_transparent_color_flag ~= nil then
    return self._m_transparent_color_flag
  end

  self._m_transparent_color_flag = (self.flags & 1) ~= 0
  return self._m_transparent_color_flag
end

Gif.ExtGraphicControl.property.user_input_flag = {}
function Gif.ExtGraphicControl.property.user_input_flag:get()
  if self._m_user_input_flag ~= nil then
    return self._m_user_input_flag
  end

  self._m_user_input_flag = (self.flags & 2) ~= 0
  return self._m_user_input_flag
end


Gif.Subblock = class.class(KaitaiStruct)

function Gif.Subblock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.Subblock:_read()
  self.len_bytes = self._io:read_u1()
  self.bytes = self._io:read_bytes(self.len_bytes)
end


Gif.ApplicationId = class.class(KaitaiStruct)

function Gif.ApplicationId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.ApplicationId:_read()
  self.len_bytes = self._io:read_u1()
  if not(self.len_bytes == 11) then
    error("not equal, expected " ..  11 .. ", but got " .. self.len_bytes)
  end
  self.application_identifier = str_decode.decode(self._io:read_bytes(8), "ASCII")
  self.application_auth_code = self._io:read_bytes(3)
end


Gif.ExtApplication = class.class(KaitaiStruct)

function Gif.ExtApplication:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.ExtApplication:_read()
  self.application_id = Gif.ApplicationId(self._io, self, self._root)
  self.subblocks = {}
  local i = 0
  while true do
    local _ = Gif.Subblock(self._io, self, self._root)
    self.subblocks[i + 1] = _
    if _.len_bytes == 0 then
      break
    end
    i = i + 1
  end
end


Gif.Subblocks = class.class(KaitaiStruct)

function Gif.Subblocks:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.Subblocks:_read()
  self.entries = {}
  local i = 0
  while true do
    local _ = Gif.Subblock(self._io, self, self._root)
    self.entries[i + 1] = _
    if _.len_bytes == 0 then
      break
    end
    i = i + 1
  end
end


Gif.Extension = class.class(KaitaiStruct)

function Gif.Extension:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gif.Extension:_read()
  self.label = Gif.ExtensionLabel(self._io:read_u1())
  local _on = self.label
  if _on == Gif.ExtensionLabel.application then
    self.body = Gif.ExtApplication(self._io, self, self._root)
  elseif _on == Gif.ExtensionLabel.comment then
    self.body = Gif.Subblocks(self._io, self, self._root)
  elseif _on == Gif.ExtensionLabel.graphic_control then
    self.body = Gif.ExtGraphicControl(self._io, self, self._root)
  else
    self.body = Gif.Subblocks(self._io, self, self._root)
  end
end


