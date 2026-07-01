-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("exif")
require("icc_4")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")
local stringstream = require("string_stream")

-- 
-- NOTICE: Many of the documentation comments (or docstrings) in this file were
-- copied from or derived from the [Portable Network Graphics (PNG) Specification
-- (Third Edition)](https://www.w3.org/TR/2025/REC-png-3-20250624/).
-- Copyright © 1996-2025 [World Wide Web Consortium](https://www.w3.org/).
-- <https://www.w3.org/copyright/software-license-2023/>
-- 
-- The full text of the license for the original W3C PNG specification is
-- provided below:
-- 
-- > ## Software and Document license - 2023 version
-- >
-- > This work is being provided by the copyright holders under the following
-- > license.
-- >
-- > ### License
-- >
-- > By obtaining and/or copying this work, you (the licensee) agree that you
-- > have read, understood, and will comply with the following terms and
-- > conditions.
-- >
-- > Permission to copy, modify, and distribute this work, with or without
-- > modification, for any purpose and without fee or royalty is hereby granted,
-- > provided that you include the following on ALL copies of the work or
-- > portions thereof, including modifications:
-- >
-- > * The full text of this NOTICE in a location viewable to users of the
-- >   redistributed or derivative work.
-- > * Any pre-existing intellectual property disclaimers, notices, or terms and
-- >   conditions. If none exist, the [W3C software and document short
-- >   notice](https://www.w3.org/Consortium/Legal/2023/copyright-software-short-notice.html)
-- >   should be included.
-- > * Notice of any changes or modifications, through a copyright statement on
-- >   the new code or document such as "This software or document includes
-- >   material copied from or derived from [title and URI of the W3C document].
-- >   Copyright © [$year-of-document] [World Wide Web
-- >   Consortium](https://www.w3.org/).
-- >   <https://www.w3.org/copyright/software-license-2023/>"
-- >
-- > ### Disclaimers
-- >
-- > THIS WORK IS PROVIDED "AS IS," AND COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS
-- > OR WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, WARRANTIES
-- > OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF
-- > THE SOFTWARE OR DOCUMENT WILL NOT INFRINGE ANY THIRD PARTY PATENTS,
-- > COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
-- >
-- > COPYRIGHT HOLDERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR
-- > CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THE SOFTWARE OR DOCUMENT.
-- >
-- > The name and trademarks of copyright holders may NOT be used in advertising
-- > or publicity pertaining to the work without specific, written prior
-- > permission. Title to copyright in this work will at all times remain with
-- > copyright holders.
-- 
-- ---
-- 
-- Test files for APNG can be found at the following locations:
-- 
--   * <https://philip.html5.org/tests/apng/tests.html>
--   * <http://littlesvr.ca/apng/>
Png = class.class(KaitaiStruct)

Png.BlendOpValues = enum.Enum {
  source = 0,
  over = 1,
}

Png.ColorType = enum.Enum {
  greyscale = 0,
  truecolor = 2,
  indexed = 3,
  greyscale_alpha = 4,
  truecolor_alpha = 6,
}

Png.CompressionMethods = enum.Enum {
  zlib = 0,
}

Png.DisposeOpValues = enum.Enum {
  none = 0,
  background = 1,
  previous = 2,
}

Png.FilterMethod = enum.Enum {
  base = 0,
}

Png.InterlaceMethod = enum.Enum {
  none = 0,
  adam7 = 1,
}

Png.PhysUnit = enum.Enum {
  unknown = 0,
  meter = 1,
}

function Png:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Png:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\137\080\078\071\013\010\026\010") then
    error("not equal, expected " .. "\137\080\078\071\013\010\026\010" .. ", but got " .. self.magic)
  end
  self.ihdr_len = self._io:read_u4be()
  if not(self.ihdr_len == 13) then
    error("not equal, expected " .. 13 .. ", but got " .. self.ihdr_len)
  end
  self.ihdr_type = self._io:read_bytes(4)
  if not(self.ihdr_type == "\073\072\068\082") then
    error("not equal, expected " .. "\073\072\068\082" .. ", but got " .. self.ihdr_type)
  end
  self.ihdr = Png.IhdrChunk(self._io, self, self._root)
  self.ihdr_crc = self._io:read_u4be()
  self.chunks = {}
  local i = 0
  while true do
    local _ = Png.Chunk(self._io, self, self._root)
    self.chunks[i + 1] = _
    if  ((_.type == "IEND") or (self._io:is_eof()))  then
      break
    end
    i = i + 1
  end
end


-- 
-- See also: Source (https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285)
Png.AdobeFireworksChunk = class.class(KaitaiStruct)

function Png.AdobeFireworksChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.AdobeFireworksChunk:_read()
  self._raw_preview_data = self._io:read_bytes_full()
  self.preview_data = KaitaiStream.process_zlib(self._raw_preview_data)
end


-- 
-- See also: Source (https://www.w3.org/TR/png/#acTL-chunk)
Png.AnimationControlChunk = class.class(KaitaiStruct)

function Png.AnimationControlChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.AnimationControlChunk:_read()
  self.num_frames = self._io:read_u4be()
  self.num_plays = self._io:read_u4be()
end

-- 
-- Number of frames, must be equal to the number of `fcTL` chunks (i.e.
-- `frame_control_chunk` objects)
-- 
-- Number of times to loop, 0 indicates infinite looping.

-- 
-- See also: Source (https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach)
-- See also: A new protocol and tool for PNG file attachments (https://nullprogram.com/blog/2021/12/31/)
Png.AtchChunk = class.class(KaitaiStruct)

Png.AtchChunk.CompressionAttachMethods = enum.Enum {
  none = 0,
  zlib = 1,
}

function Png.AtchChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.AtchChunk:_read()
  self.file_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
  local _ = self.file_name
  if not( ((string.len(_) ~= 0) and (string.sub(_, 0 + 1, 1) ~= ".")) ) then
    error("ValidationExprError")
  end
  self.compression = Png.AtchChunk.CompressionAttachMethods(self._io:read_u1())
  if self.compression == nil then
    error("ValidationNotInEnumError")
  end
  if self.compression == Png.AtchChunk.CompressionAttachMethods.none then
    self.data_plain = self._io:read_bytes_full()
  end
  if self.compression == Png.AtchChunk.CompressionAttachMethods.zlib then
    self._raw_data_zlib = self._io:read_bytes_full()
    self.data_zlib = KaitaiStream.process_zlib(self._raw_data_zlib)
  end
end

Png.AtchChunk.property.data = {}
function Png.AtchChunk.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  self._m_data = utils.box_unwrap((self.compression == Png.AtchChunk.CompressionAttachMethods.none) and utils.box_wrap(self.data_plain) or (self.data_zlib))
  return self._m_data
end

-- 
-- From the [official
-- specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
-- 
-- > The name can be any length that fits in the chunk, and should be
-- > encoded with UTF-8. It's up to each implementation to determine how
-- > to appropriately interpret the bytestring for the local system.
-- 
-- > The name must be at least one byte long, not counting the null
-- > terminator. It cannot begin with a period (`0x2e`), nor contain
-- > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
-- > backslash (`0x5c`), i.e. no directory hierarchies.
-- 
-- As of Kaitai Struct 0.11, we cannot easily check whether a string
-- contains certain characters, so we only enforce that the file name is
-- not empty and that it doesn't start with a period.

-- 
-- Background chunk stores default background color to display this
-- image against. Contents depend on `color_type` of the image.
-- See also: Source (https://www.w3.org/TR/png/#11bKGD)
Png.BkgdChunk = class.class(KaitaiStruct)

function Png.BkgdChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.BkgdChunk:_read()
  local _on = self._root.ihdr.color_type
  if _on == Png.ColorType.greyscale then
    self.bkgd = Png.BkgdGreyscale(self._io, self, self._root)
  elseif _on == Png.ColorType.greyscale_alpha then
    self.bkgd = Png.BkgdGreyscale(self._io, self, self._root)
  elseif _on == Png.ColorType.indexed then
    self.bkgd = Png.BkgdIndexed(self._io, self, self._root)
  elseif _on == Png.ColorType.truecolor then
    self.bkgd = Png.BkgdTruecolor(self._io, self, self._root)
  elseif _on == Png.ColorType.truecolor_alpha then
    self.bkgd = Png.BkgdTruecolor(self._io, self, self._root)
  end
end


-- 
-- Background chunk for greyscale images.
Png.BkgdGreyscale = class.class(KaitaiStruct)

function Png.BkgdGreyscale:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.BkgdGreyscale:_read()
  self.value = self._io:read_u2be()
end


-- 
-- Background chunk for images with indexed palette.
Png.BkgdIndexed = class.class(KaitaiStruct)

function Png.BkgdIndexed:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.BkgdIndexed:_read()
  self.palette_index = self._io:read_u1()
end


-- 
-- Background chunk for truecolor images.
Png.BkgdTruecolor = class.class(KaitaiStruct)

function Png.BkgdTruecolor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.BkgdTruecolor:_read()
  self.red = self._io:read_u2be()
  self.green = self._io:read_u2be()
  self.blue = self._io:read_u2be()
end


Png.ChrmChromaticity = class.class(KaitaiStruct)

function Png.ChrmChromaticity:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.ChrmChromaticity:_read()
  self.x_int = self._io:read_u4be()
  self.y_int = self._io:read_u4be()
end

Png.ChrmChromaticity.property.x = {}
function Png.ChrmChromaticity.property.x:get()
  if self._m_x ~= nil then
    return self._m_x
  end

  self._m_x = self.x_int / 100000.0
  return self._m_x
end

Png.ChrmChromaticity.property.y = {}
function Png.ChrmChromaticity.property.y:get()
  if self._m_y ~= nil then
    return self._m_y
  end

  self._m_y = self.y_int / 100000.0
  return self._m_y
end


-- 
-- See also: Source (https://www.w3.org/TR/png/#11cHRM)
Png.ChrmChunk = class.class(KaitaiStruct)

function Png.ChrmChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.ChrmChunk:_read()
  self.white_point = Png.ChrmChromaticity(self._io, self, self._root)
  self.red = Png.ChrmChromaticity(self._io, self, self._root)
  self.green = Png.ChrmChromaticity(self._io, self, self._root)
  self.blue = Png.ChrmChromaticity(self._io, self, self._root)
end


Png.Chunk = class.class(KaitaiStruct)

function Png.Chunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.Chunk:_read()
  self.len = self._io:read_u4be()
  self.type_raw = self._io:read_bytes(4)
  local _ = self.type_raw
  if not( (( (( ((string.byte(_, 0 + 1) >= 65) and (string.byte(_, 0 + 1) <= 90)) ) or ( ((string.byte(_, 0 + 1) >= 97) and (string.byte(_, 0 + 1) <= 122)) )) ) and ( (( ((string.byte(_, 1 + 1) >= 65) and (string.byte(_, 1 + 1) <= 90)) ) or ( ((string.byte(_, 1 + 1) >= 97) and (string.byte(_, 1 + 1) <= 122)) )) ) and ( (( ((string.byte(_, 2 + 1) >= 65) and (string.byte(_, 2 + 1) <= 90)) ) or ( ((string.byte(_, 2 + 1) >= 97) and (string.byte(_, 2 + 1) <= 122)) )) ) and ( (( ((string.byte(_, 3 + 1) >= 65) and (string.byte(_, 3 + 1) <= 90)) ) or ( ((string.byte(_, 3 + 1) >= 97) and (string.byte(_, 3 + 1) <= 122)) )) )) ) then
    error("ValidationExprError")
  end
  local _on = self.type
  if _on == "PLTE" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.PlteChunk(_io, self, self._root)
  elseif _on == "acTL" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.AnimationControlChunk(_io, self, self._root)
  elseif _on == "atCh" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.AtchChunk(_io, self, self._root)
  elseif _on == "bKGD" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.BkgdChunk(_io, self, self._root)
  elseif _on == "cHRM" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.ChrmChunk(_io, self, self._root)
  elseif _on == "cICP" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.CicpChunk(_io, self, self._root)
  elseif _on == "cLLI" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.ClliChunk(_io, self, self._root)
  elseif _on == "eXIf" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.ExifChunk(_io, self, self._root)
  elseif _on == "fcTL" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.FrameControlChunk(_io, self, self._root)
  elseif _on == "fdAT" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.FrameDataChunk(_io, self, self._root)
  elseif _on == "gAMA" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.GamaChunk(_io, self, self._root)
  elseif _on == "hIST" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.HistChunk(_io, self, self._root)
  elseif _on == "iCCP" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.IccpChunk(_io, self, self._root)
  elseif _on == "iTXt" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.InternationalTextChunk(_io, self, self._root)
  elseif _on == "mDCV" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.MdcvChunk(_io, self, self._root)
  elseif _on == "mkBS" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.AdobeFireworksChunk(_io, self, self._root)
  elseif _on == "mkTS" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.AdobeFireworksChunk(_io, self, self._root)
  elseif _on == "pHYs" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.PhysChunk(_io, self, self._root)
  elseif _on == "prVW" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.AdobeFireworksChunk(_io, self, self._root)
  elseif _on == "sBIT" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.SbitChunk(_io, self, self._root)
  elseif _on == "sPLT" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.SpltChunk(_io, self, self._root)
  elseif _on == "sRGB" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.SrgbChunk(_io, self, self._root)
  elseif _on == "skMf" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.EvernoteSkmfChunk(_io, self, self._root)
  elseif _on == "skRf" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.EvernoteSkrfChunk(_io, self, self._root)
  elseif _on == "tEXt" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.TextChunk(_io, self, self._root)
  elseif _on == "tIME" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.TimeChunk(_io, self, self._root)
  elseif _on == "tRNS" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.TrnsChunk(_io, self, self._root)
  elseif _on == "zTXt" then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Png.CompressedTextChunk(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len)
  end
  self.crc = self._io:read_u4be()
end

-- 
-- false = critical chunk, true = ancillary chunk
Png.Chunk.property.is_ancillary = {}
function Png.Chunk.property.is_ancillary:get()
  if self._m_is_ancillary ~= nil then
    return self._m_is_ancillary
  end

  self._m_is_ancillary = string.byte(self.type_raw, 0 + 1) & 32 ~= 0
  return self._m_is_ancillary
end

-- 
-- false = public chunk (defined by the W3C), true = private chunk (can
-- be defined by anyone)
Png.Chunk.property.is_private = {}
function Png.Chunk.property.is_private:get()
  if self._m_is_private ~= nil then
    return self._m_is_private
  end

  self._m_is_private = string.byte(self.type_raw, 1 + 1) & 32 ~= 0
  return self._m_is_private
end

-- 
-- Defines whether the chunk may be copied if the image data (i.e.
-- pixels) is modified. This tells PNG editors how to handle unknown
-- chunks - see section [14.2 Behavior of PNG
-- editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
-- the official specification.
Png.Chunk.property.is_safe_to_copy = {}
function Png.Chunk.property.is_safe_to_copy:get()
  if self._m_is_safe_to_copy ~= nil then
    return self._m_is_safe_to_copy
  end

  self._m_is_safe_to_copy = string.byte(self.type_raw, 3 + 1) & 32 ~= 0
  return self._m_is_safe_to_copy
end

-- 
-- Should be `false`, i.e. all chunk types should have uppercase third
-- letters (the lowercase third letter is reserved for possible future
-- extensions to the PNG standard)
Png.Chunk.property.reserved_bit = {}
function Png.Chunk.property.reserved_bit:get()
  if self._m_reserved_bit ~= nil then
    return self._m_reserved_bit
  end

  self._m_reserved_bit = string.byte(self.type_raw, 2 + 1) & 32 ~= 0
  return self._m_reserved_bit
end

Png.Chunk.property.type = {}
function Png.Chunk.property.type:get()
  if self._m_type ~= nil then
    return self._m_type
  end

  self._m_type = str_decode.decode(self.type_raw, "ASCII")
  return self._m_type
end

-- 
-- Each byte of a chunk type is restricted to the hexadecimal values
-- 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
-- (`A-Z` and `a-z`).
-- See also: Source (https://www.w3.org/TR/2025/REC-png-3-20250624/#table51)

-- 
-- See also: Source (https://www.w3.org/TR/png/#cICP-chunk)
-- See also: Source (https://w3c.github.io/png/Implementation_Report_3e/#cicp)
Png.CicpChunk = class.class(KaitaiStruct)

function Png.CicpChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.CicpChunk:_read()
  self.color_primaries = self._io:read_u1()
  self.transfer_function = self._io:read_u1()
  self.matrix_coefficients = self._io:read_u1()
  if not(self.matrix_coefficients == 0) then
    error("not equal, expected " .. 0 .. ", but got " .. self.matrix_coefficients)
  end
  self.video_full_range_flag = self._io:read_u1()
  if not( ((self.video_full_range_flag == 0) or (self.video_full_range_flag == 1)) ) then
    error("ValidationNotAnyOfError")
  end
end

-- 
-- values above 22 are reserved, see
-- <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
-- 
-- values above 18 are reserved, see
-- <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
-- 
-- From the [official
-- specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
-- 
-- > RGB is currently the only supported color model in PNG, and as such
-- > `Matrix Coefficients` shall be set to `0`.
-- 
-- From the [official
-- specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
-- 
-- > If `Video Full Range Flag` value is `1`, then the image is a
-- > full-range image. Typically, images in the RGB color representation
-- > are stored in the full-range signal quantization, therefore the vast
-- > majority of computer graphics and web images, including those used
-- > in traditional PNG workflows, are full-range images.
-- 
-- > If `Video Full Range Flag` value is `0`, then the image is a
-- > narrow-range image.

-- 
-- See also: Source (https://www.w3.org/TR/png/#cLLI-chunk)
-- See also: Source (https://w3c.github.io/png/Implementation_Report_3e/#light)
Png.ClliChunk = class.class(KaitaiStruct)

function Png.ClliChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.ClliChunk:_read()
  self.max_content_light_level_int = self._io:read_u4be()
  self.max_frame_average_light_level_int = self._io:read_u4be()
end

-- 
-- Maximum Content Light Level (MaxCLL), in cd/m^2.
Png.ClliChunk.property.max_content_light_level = {}
function Png.ClliChunk.property.max_content_light_level:get()
  if self._m_max_content_light_level ~= nil then
    return self._m_max_content_light_level
  end

  self._m_max_content_light_level = self.max_content_light_level_int * 0.0001
  return self._m_max_content_light_level
end

-- 
-- Maximum Frame Average Light Level (MaxFALL), in cd/m^2.
Png.ClliChunk.property.max_frame_average_light_level = {}
function Png.ClliChunk.property.max_frame_average_light_level:get()
  if self._m_max_frame_average_light_level ~= nil then
    return self._m_max_frame_average_light_level
  end

  self._m_max_frame_average_light_level = self.max_frame_average_light_level_int * 0.0001
  return self._m_max_frame_average_light_level
end


Png.CompressedText = class.class(KaitaiStruct)

function Png.CompressedText:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.CompressedText:_read()
  self.value = str_decode.decode(self._io:read_bytes_full(), "ISO-8859-1")
end

-- 
-- Text string (the "value" of this key-value pair).
-- 
-- Although it is not null-terminated (unlike the keyword), it must not
-- contain a zero byte (U+0000 NULL character). A newline should be
-- represented by a single U+000A LINE FEED (LF) character (aka `\n`).
-- The remaining control characters (U+0001..U+0009, U+000B..0+001F,
-- U+007F..U+009F) are discouraged.

-- 
-- Compressed textual data (`zTXt`) chunk effectively allows you to store
-- key-value string pairs in the PNG container, compressing the "value" part
-- (which can be quite lengthy) with zlib compression.
-- 
-- The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
-- chunk is recommended for storing large blocks of text.
-- See also: Source (https://www.w3.org/TR/png/#11zTXt)
Png.CompressedTextChunk = class.class(KaitaiStruct)

function Png.CompressedTextChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.CompressedTextChunk:_read()
  self.keyword = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ISO-8859-1")
  self.compression_method = Png.CompressionMethods(self._io:read_u1())
  if not(self.compression_method == Png.CompressionMethods.zlib) then
    error("not equal, expected " .. Png.CompressionMethods.zlib .. ", but got " .. self.compression_method)
  end
  self._raw__raw_text = self._io:read_bytes_full()
  self._raw_text = KaitaiStream.process_zlib(self._raw__raw_text)
  local _io = KaitaiStream(stringstream(self._raw_text))
  self.text = Png.CompressedText(_io, self, self._root)
end

-- 
-- Indicates the type of information represented by the text string.
-- 
-- Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
-- characters and spaces; that is, only code points 0x20-0x7E and
-- 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
-- keyword, leading spaces, trailing spaces, and consecutive spaces are
-- not permitted.
-- See also: Source (https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords)

-- 
-- See also: Source (https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501)
Png.EvernoteSkmfChunk = class.class(KaitaiStruct)

function Png.EvernoteSkmfChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.EvernoteSkmfChunk:_read()
  self.json = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- JSON document with information about editable annotations (text,
-- lines, paths, etc.) in Evernote/Skitch.
-- 
-- It refers to the original image stored in the `skRf` chunk (which
-- usually follows immediately after `skMf`) via the
-- `.children[0].children[0].uri` JSON property. This has the format
-- `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
-- matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
-- 16 bytes of the `skRf` chunk).

-- 
-- See also: Source (https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501)
Png.EvernoteSkrfChunk = class.class(KaitaiStruct)

function Png.EvernoteSkrfChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.EvernoteSkrfChunk:_read()
  self.uuid = self._io:read_bytes(16)
  self.orig_img = self._io:read_bytes_full()
end

-- 
-- Random UUIDv4 value used to identify the image. It is referenced by
-- the `skMf` chunk - see the documentation for the `json` field in
-- `evernote_skmf_chunk`.
-- 
-- The original source image without annotations. It's usually a PNG
-- image as well, but it can also be a JPEG or possibly other formats.

-- 
-- Exchangeable Image File (Exif) Profile (`eXIf`) chunk.
-- 
-- Only one `eXIf` chunk is allowed in a PNG datastream.
-- 
-- The `eXIf` chunk contains metadata concerning the original image data. If
-- the image has been edited subsequent to creation of the Exif profile, this
-- data might no longer apply to the PNG image data.
-- See also: Source (https://www.w3.org/TR/png/#eXIf)
Png.ExifChunk = class.class(KaitaiStruct)

function Png.ExifChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.ExifChunk:_read()
  self.exif = Exif(self._io)
end


-- 
-- See also: Source (https://www.w3.org/TR/png/#fcTL-chunk)
Png.FrameControlChunk = class.class(KaitaiStruct)

function Png.FrameControlChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.FrameControlChunk:_read()
  self.sequence_number = self._io:read_u4be()
  self.width = self._io:read_u4be()
  if not(self.width >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.width <= self._root.ihdr.width) then
    error("ValidationGreaterThanError")
  end
  self.height = self._io:read_u4be()
  if not(self.height >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.height <= self._root.ihdr.height) then
    error("ValidationGreaterThanError")
  end
  self.x_offset = self._io:read_u4be()
  if not(self.x_offset <= self._root.ihdr.width - self.width) then
    error("ValidationGreaterThanError")
  end
  self.y_offset = self._io:read_u4be()
  if not(self.y_offset <= self._root.ihdr.height - self.height) then
    error("ValidationGreaterThanError")
  end
  self.delay_num = self._io:read_u2be()
  self.delay_den = self._io:read_u2be()
  self.dispose_op = Png.DisposeOpValues(self._io:read_u1())
  if self.dispose_op == nil then
    error("ValidationNotInEnumError")
  end
  self.blend_op = Png.BlendOpValues(self._io:read_u1())
  if self.blend_op == nil then
    error("ValidationNotInEnumError")
  end
end

-- 
-- Time to display this frame, in seconds.
Png.FrameControlChunk.property.delay = {}
function Png.FrameControlChunk.property.delay:get()
  if self._m_delay ~= nil then
    return self._m_delay
  end

  self._m_delay = self.delay_num / utils.box_unwrap((self.delay_den == 0) and utils.box_wrap(100.0) or (self.delay_den))
  return self._m_delay
end

-- 
-- Sequence number of the animation chunk, starting from 0.
-- 
-- The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
-- types share the sequence. The purpose of this number is to detect (and
-- optionally correct) sequence errors in an Animated PNG, since the PNG
-- specification does not impose ordering restrictions on ancillary
-- chunks (which means that a PNG editor is technically allowed to
-- reorder them arbitrarily, see [14.2 Behavior of PNG
-- editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
-- 
-- The first `fcTL` chunk must contain sequence number 0, and the
-- sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
-- ascending order, with no gaps or duplicates.
-- 
-- Width of the following frame.
-- 
-- Height of the following frame.
-- 
-- X position at which to render the following frame.
-- 
-- Y position at which to render the following frame.
-- 
-- Frame delay fraction numerator.
-- 
-- Frame delay fraction denominator.
-- 
-- Type of frame area disposal to be done after rendering this frame.
-- 
-- Type of frame area rendering for this frame.

-- 
-- See also: Source (https://www.w3.org/TR/png/#fdAT-chunk)
Png.FrameDataChunk = class.class(KaitaiStruct)

function Png.FrameDataChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.FrameDataChunk:_read()
  self.sequence_number = self._io:read_u4be()
  self.frame_data = self._io:read_bytes_full()
end

-- 
-- Sequence number of the animation chunk, starting from 0.
-- 
-- The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
-- types share the sequence. The purpose of this number is to detect (and
-- optionally correct) sequence errors in an Animated PNG, since the PNG
-- specification does not impose ordering restrictions on ancillary
-- chunks (which means that a PNG editor is technically allowed to
-- reorder them arbitrarily, see [14.2 Behavior of PNG
-- editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
-- 
-- The first `fcTL` chunk must contain sequence number 0, and the
-- sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
-- ascending order, with no gaps or duplicates.
-- 
-- Frame data for the frame. At least one `fdAT` chunk is required for
-- each frame, except for the first frame, if that frame is represented
-- by an `IDAT` chunk. The compressed datastream for each frame is the
-- concatenation of the contents of the data fields of all the `fdAT`
-- chunks within a frame.

-- 
-- See also: Source (https://www.w3.org/TR/png/#11gAMA)
Png.GamaChunk = class.class(KaitaiStruct)

function Png.GamaChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.GamaChunk:_read()
  self.gamma_int = self._io:read_u4be()
  local _ = self.gamma_int
  if not(_ ~= 0) then
    error("ValidationExprError")
  end
end

-- 
-- Image gamma, typically 0.45455 = 1/2.2.
Png.GamaChunk.property.gamma = {}
function Png.GamaChunk.property.gamma:get()
  if self._m_gamma ~= nil then
    return self._m_gamma
  end

  self._m_gamma = self.gamma_int / 100000.0
  return self._m_gamma
end

-- 
-- Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
-- rounding)
Png.GamaChunk.property.inv_gamma = {}
function Png.GamaChunk.property.inv_gamma:get()
  if self._m_inv_gamma ~= nil then
    return self._m_inv_gamma
  end

  self._m_inv_gamma = 100000.0 / self.gamma_int
  return self._m_inv_gamma
end

-- 
-- Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
-- 45455)

-- 
-- Image histogram (`hIST`) chunk gives the approximate usage frequency of
-- each color in the palette. A histogram chunk can appear only when a `PLTE`
-- chunk appears.
-- See also: Source (https://www.w3.org/TR/png/#11hIST)
Png.HistChunk = class.class(KaitaiStruct)

function Png.HistChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.HistChunk:_read()
  self.usage_freqs = {}
  local i = 0
  while not self._io:is_eof() do
    self.usage_freqs[i + 1] = self._io:read_u2be()
    i = i + 1
  end
end

-- 
-- Usage frequencies of each color in the palette.
-- 
-- There must be exactly one entry for each entry in the `PLTE` chunk. Each
-- entry is proportional to the fraction of pixels in the image that have
-- that palette index; the exact scale factor is chosen by the encoder.
-- 
-- Histogram entries are approximate, with the exception that a zero
-- entry specifies that the corresponding palette entry is not used at
-- all in the image. A histogram entry must be nonzero if there are any
-- pixels of that color.

-- 
-- Embedded ICC profile (`iCCP`) chunk.
-- 
-- If the `iCCP` chunk is present, the image samples conform to the color
-- space represented by the embedded ICC profile as defined by the
-- International Color Consortium.
-- 
-- This chunk is ignored unless it is the [highest-precedence color
-- chunk](https://www.w3.org/TR/png/#color-chunk-precendence) understood by
-- the decoder. Unless a `cICP` chunk exists, a PNG datastream should contain
-- at most one embedded profile, whether specified explicitly with an `iCCP`
-- or implicitly with an `sRGB` chunk.
-- 
-- It is recommended that the `sRGB` and `iCCP` chunks do not appear
-- simultaneously in a PNG datastream.
-- See also: Source (https://www.w3.org/TR/png/#11iCCP)
Png.IccpChunk = class.class(KaitaiStruct)

function Png.IccpChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.IccpChunk:_read()
  self.profile_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ISO-8859-1")
  self.compression_method = Png.CompressionMethods(self._io:read_u1())
  if not(self.compression_method == Png.CompressionMethods.zlib) then
    error("not equal, expected " .. Png.CompressionMethods.zlib .. ", but got " .. self.compression_method)
  end
  self._raw__raw_profile = self._io:read_bytes_full()
  self._raw_profile = KaitaiStream.process_zlib(self._raw__raw_profile)
  local _io = KaitaiStream(stringstream(self._raw_profile))
  self.profile = Icc4(_io)
end

-- 
-- Any convenient name for referring to the profile. It is
-- case-sensitive.
-- 
-- Profile names must contain only printable ISO-8859-1 (Latin-1)
-- characters and spaces; that is, only code points 0x20-0x7E and
-- 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
-- not permitted.
-- 
-- Embedded ICC profile.
-- 
-- The color space of the ICC profile must be:
-- 
-- * an RGB color space for color images (color types
--   `color_type::truecolor` = 2, `color_type::indexed` = 3, and
--   `color_type::truecolor_alpha` = 6), or
-- * a greyscale color space for greyscale images (color types
--   `color_type::greyscale` = 0 and `color_type::greyscale_alpha` = 4).
-- 
-- Note that the imported `icc_4.ksy` spec currently in use here supports
-- only the ICC.1 v4 specification (as the name suggests), not ICC.1 v2.
-- This means that PNG files with an embedded v2 profile (for example
-- https://github.com/web-platform-tests/wpt/blob/495d9d7716298588ff49d6e701bf27c5134bde06/css/css-color/support/swap-990000-iCCP.png)
-- will fail to parse.
-- 
-- TODO: extend `icc_4.ksy` to support both v4 and v2 profiles, rename it
-- to `icc.ksy`, and use it here.

-- 
-- See also: Source (https://www.w3.org/TR/png/#11IHDR)
Png.IhdrChunk = class.class(KaitaiStruct)

function Png.IhdrChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.IhdrChunk:_read()
  self.width = self._io:read_u4be()
  if not(self.width >= 1) then
    error("ValidationLessThanError")
  end
  self.height = self._io:read_u4be()
  if not(self.height >= 1) then
    error("ValidationLessThanError")
  end
  self.bit_depth = self._io:read_u1()
  if not( ((self.bit_depth == 1) or (self.bit_depth == 2) or (self.bit_depth == 4) or (self.bit_depth == 8) or (self.bit_depth == 16)) ) then
    error("ValidationNotAnyOfError")
  end
  self.color_type = Png.ColorType(self._io:read_u1())
  if self.color_type == nil then
    error("ValidationNotInEnumError")
  end
  self.compression_method = Png.CompressionMethods(self._io:read_u1())
  if self.compression_method == nil then
    error("ValidationNotInEnumError")
  end
  self.filter_method = Png.FilterMethod(self._io:read_u1())
  if self.filter_method == nil then
    error("ValidationNotInEnumError")
  end
  self.interlace_method = Png.InterlaceMethod(self._io:read_u1())
  if self.interlace_method == nil then
    error("ValidationNotInEnumError")
  end
end


Png.InternationalText = class.class(KaitaiStruct)

function Png.InternationalText:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.InternationalText:_read()
  self.value = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- Text string (the "value" of this key-value pair), written in language
-- specified in `_parent.language_tag`.
-- 
-- Although it is not null-terminated (unlike other textual data in the
-- `iTXt` chunk), it must not contain a zero byte
-- (U+0000 NULL character). A newline should be represented by a single
-- U+000A LINE FEED (LF) character (aka `\n`). The remaining control
-- characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
-- discouraged.

-- 
-- International textual data (`iTXt`) chunk effectively allows you to store
-- key-value string pairs in the PNG container.
-- 
-- The "key" part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
-- characters and spaces. The translated keyword and the "value" part
-- (`text`) are stored in UTF-8 and thus can store text in any language -
-- this language can be indicated via the language tag (`language_tag`).
-- See also: Source (https://www.w3.org/TR/png/#11iTXt)
Png.InternationalTextChunk = class.class(KaitaiStruct)

function Png.InternationalTextChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.InternationalTextChunk:_read()
  self.keyword = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ISO-8859-1")
  self.compression_flag = self._io:read_u1()
  if not( ((self.compression_flag == 0) or (self.compression_flag == 1)) ) then
    error("ValidationNotAnyOfError")
  end
  self.compression_method = Png.CompressionMethods(self._io:read_u1())
  if not(self.compression_method == utils.box_unwrap((self.compression_flag == 1) and utils.box_wrap(Png.CompressionMethods.zlib) or (self.compression_method))) then
    error("not equal, expected " .. utils.box_unwrap((self.compression_flag == 1) and utils.box_wrap(Png.CompressionMethods.zlib) or (self.compression_method)) .. ", but got " .. self.compression_method)
  end
  self.language_tag = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
  self.translated_keyword = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
  if self.compression_flag == 0 then
    self._raw_text_plain = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_text_plain))
    self.text_plain = Png.InternationalText(_io, self, self._root)
  end
  if self.compression_flag == 1 then
    self._raw__raw_text_zlib = self._io:read_bytes_full()
    self._raw_text_zlib = KaitaiStream.process_zlib(self._raw__raw_text_zlib)
    local _io = KaitaiStream(stringstream(self._raw_text_zlib))
    self.text_zlib = Png.InternationalText(_io, self, self._root)
  end
end

-- 
-- Text string (the "value" of this key-value pair), written in language
-- specified in `language_tag`.
-- 
-- Although it is not null-terminated (unlike other textual data in the
-- `iTXt` chunk), it must not contain a zero byte
-- (U+0000 NULL character). A newline should be represented by a single
-- U+000A LINE FEED (LF) character (aka `\n`). The remaining control
-- characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
-- discouraged.
Png.InternationalTextChunk.property.text = {}
function Png.InternationalTextChunk.property.text:get()
  if self._m_text ~= nil then
    return self._m_text
  end

  self._m_text = utils.box_unwrap((self.compression_flag == 0) and utils.box_wrap(self.text_plain) or (self.text_zlib)).value
  return self._m_text
end

-- 
-- Indicates the type of information represented by the text string.
-- 
-- Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
-- characters and spaces; that is, only code points 0x20-0x7E and
-- 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
-- keyword, leading spaces, trailing spaces, and consecutive spaces are
-- not permitted.
-- See also: Source (https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords)
-- 
-- 0 = text is uncompressed, 1 = text is compressed with a
-- method specified in `compression_method`.
-- 
-- Human language used in the `translated_keyword` and `text` fields.
-- 
-- From the [official
-- specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
-- 
-- > The language tag is a well-formed language tag defined by [RFC 5646:
-- > BCP 47: Tags for Identifying
-- > Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
-- > keyword, the language tag is case-insensitive. Subtags must appear
-- > in the [IANA language subtag
-- > registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
-- > If the language tag is empty, the language is unspecified. Examples
-- > of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
-- > `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
-- 
-- The keyword (`keyword`) translated into the language specified in
-- `language_tag`.
-- 
-- It must not contain a zero byte (U+0000 NULL character). Line breaks
-- should not appear. The remaining control characters (U+0001..U+0009,
-- U+000B..0+001F, U+007F..U+009F) are discouraged.

Png.MdcvChromaticity = class.class(KaitaiStruct)

function Png.MdcvChromaticity:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.MdcvChromaticity:_read()
  self.x_int = self._io:read_u2be()
  self.y_int = self._io:read_u2be()
end

Png.MdcvChromaticity.property.x = {}
function Png.MdcvChromaticity.property.x:get()
  if self._m_x ~= nil then
    return self._m_x
  end

  self._m_x = self.x_int * 0.00002
  return self._m_x
end

Png.MdcvChromaticity.property.y = {}
function Png.MdcvChromaticity.property.y:get()
  if self._m_y ~= nil then
    return self._m_y
  end

  self._m_y = self.y_int * 0.00002
  return self._m_y
end


-- 
-- See also: Source (https://www.w3.org/TR/png/#mDCV-chunk)
-- See also: Source (https://w3c.github.io/png/Implementation_Report_3e/#mastering)
Png.MdcvChunk = class.class(KaitaiStruct)

function Png.MdcvChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.MdcvChunk:_read()
  self.red = Png.MdcvChromaticity(self._io, self, self._root)
  self.green = Png.MdcvChromaticity(self._io, self, self._root)
  self.blue = Png.MdcvChromaticity(self._io, self, self._root)
  self.white_point = Png.MdcvChromaticity(self._io, self, self._root)
  self.max_luminance_int = self._io:read_u4be()
  self.min_luminance_int = self._io:read_u4be()
end

-- 
-- Maximum luminance in cd/m^2.
Png.MdcvChunk.property.max_luminance = {}
function Png.MdcvChunk.property.max_luminance:get()
  if self._m_max_luminance ~= nil then
    return self._m_max_luminance
  end

  self._m_max_luminance = self.max_luminance_int * 0.0001
  return self._m_max_luminance
end

-- 
-- Minimum luminance in cd/m^2.
Png.MdcvChunk.property.min_luminance = {}
function Png.MdcvChunk.property.min_luminance:get()
  if self._m_min_luminance ~= nil then
    return self._m_min_luminance
  end

  self._m_min_luminance = self.min_luminance_int * 0.0001
  return self._m_min_luminance
end


-- 
-- Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
-- size of the pixels (in meters) or pixel aspect ratio for display of the
-- image.
-- See also: Source (https://www.w3.org/TR/png/#11pHYs)
Png.PhysChunk = class.class(KaitaiStruct)

function Png.PhysChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.PhysChunk:_read()
  self.pixels_per_unit_x = self._io:read_u4be()
  self.pixels_per_unit_y = self._io:read_u4be()
  self.unit = Png.PhysUnit(self._io:read_u1())
  if self.unit == nil then
    error("ValidationNotInEnumError")
  end
end

-- 
-- Horizontal resolution (DPI).
Png.PhysChunk.property.dots_per_inch_x = {}
function Png.PhysChunk.property.dots_per_inch_x:get()
  if self._m_dots_per_inch_x ~= nil then
    return self._m_dots_per_inch_x
  end

  if self.unit == Png.PhysUnit.meter then
    self._m_dots_per_inch_x = self.pixels_per_unit_x * 0.0254
  end
  return self._m_dots_per_inch_x
end

-- 
-- Vertical resolution (DPI).
Png.PhysChunk.property.dots_per_inch_y = {}
function Png.PhysChunk.property.dots_per_inch_y:get()
  if self._m_dots_per_inch_y ~= nil then
    return self._m_dots_per_inch_y
  end

  if self.unit == Png.PhysUnit.meter then
    self._m_dots_per_inch_y = self.pixels_per_unit_y * 0.0254
  end
  return self._m_dots_per_inch_y
end

-- 
-- Number of pixels per physical unit (typically, 1 meter) by X
-- axis.
-- 
-- Number of pixels per physical unit (typically, 1 meter) by Y
-- axis.

-- 
-- See also: Source (https://www.w3.org/TR/png/#11PLTE)
Png.PlteChunk = class.class(KaitaiStruct)

function Png.PlteChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.PlteChunk:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Png.Rgb(self._io, self, self._root)
    i = i + 1
  end
end


Png.Rgb = class.class(KaitaiStruct)

function Png.Rgb:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.Rgb:_read()
  self.r = self._io:read_u1()
  self.g = self._io:read_u1()
  self.b = self._io:read_u1()
end


-- 
-- Significant bits (`sBIT`) chunk stores the original number of significant
-- bits of the sample values (which can be less than or equal to the sample
-- depth). This allows PNG decoders to recover the original data losslessly
-- even if the data had a sample depth not directly supported by PNG.
-- See also: Source (https://www.w3.org/TR/png/#11sBIT)
Png.SbitChunk = class.class(KaitaiStruct)

function Png.SbitChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.SbitChunk:_read()
  local _on = self._root.ihdr.color_type
  if _on == Png.ColorType.greyscale then
    self.significant_bits = Png.SbitGreyscale(false, self._io, self, self._root)
  elseif _on == Png.ColorType.greyscale_alpha then
    self.significant_bits = Png.SbitGreyscale(true, self._io, self, self._root)
  elseif _on == Png.ColorType.indexed then
    self.significant_bits = Png.SbitTruecolor(false, self._io, self, self._root)
  elseif _on == Png.ColorType.truecolor then
    self.significant_bits = Png.SbitTruecolor(false, self._io, self, self._root)
  elseif _on == Png.ColorType.truecolor_alpha then
    self.significant_bits = Png.SbitTruecolor(true, self._io, self, self._root)
  end
end

Png.SbitChunk.property.sample_depth = {}
function Png.SbitChunk.property.sample_depth:get()
  if self._m_sample_depth ~= nil then
    return self._m_sample_depth
  end

  self._m_sample_depth = utils.box_unwrap((self._root.ihdr.color_type == Png.ColorType.indexed) and utils.box_wrap(8) or (self._root.ihdr.bit_depth))
  return self._m_sample_depth
end


Png.SbitGreyscale = class.class(KaitaiStruct)

function Png.SbitGreyscale:_init(has_alpha, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.has_alpha = has_alpha
  self:_read()
end

function Png.SbitGreyscale:_read()
  self.grey = self._io:read_u1()
  if not(self.grey >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.grey <= self._parent.sample_depth) then
    error("ValidationGreaterThanError")
  end
  if self.has_alpha then
    self.alpha = self._io:read_u1()
    if not(self.alpha >= 1) then
      error("ValidationLessThanError")
    end
    if not(self.alpha <= self._parent.sample_depth) then
      error("ValidationGreaterThanError")
    end
  end
end


Png.SbitTruecolor = class.class(KaitaiStruct)

function Png.SbitTruecolor:_init(has_alpha, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.has_alpha = has_alpha
  self:_read()
end

function Png.SbitTruecolor:_read()
  self.red = self._io:read_u1()
  if not(self.red >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.red <= self._parent.sample_depth) then
    error("ValidationGreaterThanError")
  end
  self.green = self._io:read_u1()
  if not(self.green >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.green <= self._parent.sample_depth) then
    error("ValidationGreaterThanError")
  end
  self.blue = self._io:read_u1()
  if not(self.blue >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.blue <= self._parent.sample_depth) then
    error("ValidationGreaterThanError")
  end
  if self.has_alpha then
    self.alpha = self._io:read_u1()
    if not(self.alpha >= 1) then
      error("ValidationLessThanError")
    end
    if not(self.alpha <= self._parent.sample_depth) then
      error("ValidationGreaterThanError")
    end
  end
end


-- 
-- Suggested palette (`sPLT`) chunk.
-- 
-- Multiple `sPLT` chunks are permitted, but each must have a different
-- palette name.
-- See also: Source (https://www.w3.org/TR/png/#11sPLT)
-- See also: Source (https://www.w3.org/TR/png/#12Suggested-palettes)
Png.SpltChunk = class.class(KaitaiStruct)

function Png.SpltChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.SpltChunk:_read()
  self.palette_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ISO-8859-1")
  self.sample_depth = self._io:read_u1()
  if not( ((self.sample_depth == 8) or (self.sample_depth == 16)) ) then
    error("ValidationNotAnyOfError")
  end
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Png.SpltEntry(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- Any convenient name for referring to the palette. It is
-- case-sensitive. The palette name may aid the choice of the appropriate
-- suggested palette when more than one appears in a PNG datastream.
-- 
-- Palette names must contain only printable ISO-8859-1 (Latin-1)
-- characters and spaces; that is, only code points 0x20-0x7E and
-- 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
-- not permitted.
-- 
-- There may be any number of entries. Entries must appear "in decreasing
-- order of frequency" (note: strictly speaking, I think the W3C
-- specification actually meant "non-increasing"). There is no
-- requirement that the entries all be used by the image, nor that they
-- all be different.
-- 
-- The color samples are not premultiplied by alpha, nor are they
-- precomposited against any background.
-- 
-- Entries in `sPLT` use the same gamma value and chromaticity values as
-- the PNG image, but may fall outside the range of values used in the
-- color space of the PNG image; for example, in a greyscale PNG image,
-- each `sPLT` entry would typically have equal red, green, and blue
-- values, but this is not required. Similarly, `sPLT` entries can have
-- non-opaque alpha values even when the PNG image does not use
-- transparency.

Png.SpltEntry = class.class(KaitaiStruct)

function Png.SpltEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.SpltEntry:_read()
  local _on = self._parent.sample_depth
  if _on == 8 then
    self.red = self._io:read_u1()
  else
    self.red = self._io:read_u2be()
  end
  local _on = self._parent.sample_depth
  if _on == 8 then
    self.green = self._io:read_u1()
  else
    self.green = self._io:read_u2be()
  end
  local _on = self._parent.sample_depth
  if _on == 8 then
    self.blue = self._io:read_u1()
  else
    self.blue = self._io:read_u2be()
  end
  local _on = self._parent.sample_depth
  if _on == 8 then
    self.alpha = self._io:read_u1()
  else
    self.alpha = self._io:read_u2be()
  end
  self.freq = self._io:read_u2be()
end

-- 
-- An alpha value of 0 means fully transparent. An alpha value of 255
-- (when `_parent.sample_depth` is 8) or 65535 (when
-- `_parent.sample_depth` is 16) means fully opaque.
-- 
-- Each frequency value is proportional to the fraction of the pixels in
-- the image for which that palette entry is the closest match in RGBA
-- space, before the image has been composited against any background.
-- 
-- The exact scale factor is chosen by the PNG encoder; it is recommended
-- that the resulting range of individual values reasonably fills the
-- range 0 to 65535.
-- 
-- Zero is a valid frequency meaning that the color is "least important"
-- or that it is rarely, if ever, used. When all the frequencies are
-- zero, they are meaningless, that is to say, nothing may be inferred
-- about the actual frequencies with which the colors appear in the PNG
-- image.

-- 
-- See also: Source (https://www.w3.org/TR/png/#11sRGB)
Png.SrgbChunk = class.class(KaitaiStruct)

Png.SrgbChunk.Intent = enum.Enum {
  perceptual = 0,
  relative_colorimetric = 1,
  saturation = 2,
  absolute_colorimetric = 3,
}

function Png.SrgbChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.SrgbChunk:_read()
  self.render_intent = Png.SrgbChunk.Intent(self._io:read_u1())
  if self.render_intent == nil then
    error("ValidationNotInEnumError")
  end
end


-- 
-- Textual data (`tEXt`) chunk effectively allows you to store key-value
-- string pairs in the PNG container.
-- 
-- Both the "key" (`keyword`) and "value" (`text`) parts are restricted to
-- printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
-- exception that `text` can also contain newlines (U+000A LINE FEED (LF)
-- characters) and U+00A0 NON-BREAKING SPACE characters.
-- See also: Source (https://www.w3.org/TR/png/#11tEXt)
Png.TextChunk = class.class(KaitaiStruct)

function Png.TextChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.TextChunk:_read()
  self.keyword = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ISO-8859-1")
  self.text = str_decode.decode(self._io:read_bytes_full(), "ISO-8859-1")
end

-- 
-- Indicates the type of information represented by the text string.
-- 
-- Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
-- characters and spaces; that is, only code points 0x20-0x7E and
-- 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
-- keyword, leading spaces, trailing spaces, and consecutive spaces are
-- not permitted.
-- See also: Source (https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords)
-- 
-- Text string (the "value" of this key-value pair).
-- 
-- Although it is not null-terminated (unlike the keyword), it must not
-- contain a zero byte (U+0000 NULL character). A newline should be
-- represented by a single U+000A LINE FEED (LF) character (aka `\n`).
-- The remaining control characters (U+0001..U+0009, U+000B..0+001F,
-- U+007F..U+009F) are discouraged.

-- 
-- Time chunk stores time stamp of last modification of this image,
-- up to 1 second precision in UTC timezone.
-- See also: Source (https://www.w3.org/TR/png/#11tIME)
Png.TimeChunk = class.class(KaitaiStruct)

function Png.TimeChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.TimeChunk:_read()
  self.year = self._io:read_u2be()
  self.month = self._io:read_u1()
  self.day = self._io:read_u1()
  self.hour = self._io:read_u1()
  self.minute = self._io:read_u1()
  self.second = self._io:read_u1()
end


-- 
-- Transparency (`tRNS`) chunk specifies either alpha values that are
-- associated with palette entries (for indexed-color images) or a single
-- transparent color (for greyscale and truecolor images).
-- 
-- A `tRNS` chunk must not appear for color types
-- `color_type::greyscale_alpha` = 4 and `color_type::truecolor_alpha` = 6,
-- since a full alpha channel is already present in those cases.
-- See also: Source (https://www.w3.org/TR/png/#11tRNS)
Png.TrnsChunk = class.class(KaitaiStruct)

function Png.TrnsChunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.TrnsChunk:_read()
  if self._root.ihdr.color_type == Png.ColorType.indexed then
    self.palette_alphas = {}
    local i = 0
    while not self._io:is_eof() do
      self.palette_alphas[i + 1] = self._io:read_u1()
      i = i + 1
    end
  end
  local _on = self._root.ihdr.color_type
  if _on == Png.ColorType.greyscale then
    self.transparent_color = Png.TrnsGreyscaleColor(self._io, self, self._root)
  elseif _on == Png.ColorType.truecolor then
    self.transparent_color = Png.TrnsTruecolorColor(self._io, self, self._root)
  end
end

Png.TrnsChunk.property.sample_mask = {}
function Png.TrnsChunk.property.sample_mask:get()
  if self._m_sample_mask ~= nil then
    return self._m_sample_mask
  end

  self._m_sample_mask = (1 << self._root.ihdr.bit_depth) - 1
  return self._m_sample_mask
end

-- 
-- Alpha values associated with palette entries in the `PLTE` chunk.
-- 
-- Each entry indicates that pixels of the corresponding palette index
-- shall be treated as having the specified alpha value. Alpha values
-- have the same interpretation as in an 8-bit full alpha channel: 0 is
-- fully transparent, 255 is fully opaque, regardless of image bit depth.
-- 
-- The `tRNS` chunk must not contain more alpha values than there are
-- palette entries, but it may contain fewer values than there are
-- palette entries. In this case, the alpha value for all remaining
-- palette entries is assumed to be 255. If all palette indices are
-- opaque, the `tRNS` chunk may be omitted.
-- 
-- Pixels of the specified grey sample value or RGB sample values are
-- treated as transparent (equivalent to alpha value 0); all other pixels
-- are to be treated as fully opaque (alpha value `2^{bitdepth} - 1`).
-- 
-- If the image bit depth is less than 16, the least significant bits of
-- these sample values are used. Encoders should set the other bits to 0,
-- and decoders must mask the other bits to 0 before the value is used.
-- 
-- Note: in this Kaitai Struct implementation, the bitmask used to
-- implement this masking is stored in the value instance `sample_mask`.

Png.TrnsGreyscaleColor = class.class(KaitaiStruct)

function Png.TrnsGreyscaleColor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.TrnsGreyscaleColor:_read()
  self.grey_raw = self._io:read_u2be()
end

Png.TrnsGreyscaleColor.property.grey = {}
function Png.TrnsGreyscaleColor.property.grey:get()
  if self._m_grey ~= nil then
    return self._m_grey
  end

  self._m_grey = self.grey_raw & self._parent.sample_mask
  return self._m_grey
end


Png.TrnsTruecolorColor = class.class(KaitaiStruct)

function Png.TrnsTruecolorColor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Png.TrnsTruecolorColor:_read()
  self.red_raw = self._io:read_u2be()
  self.green_raw = self._io:read_u2be()
  self.blue_raw = self._io:read_u2be()
end

Png.TrnsTruecolorColor.property.blue = {}
function Png.TrnsTruecolorColor.property.blue:get()
  if self._m_blue ~= nil then
    return self._m_blue
  end

  self._m_blue = self.blue_raw & self._parent.sample_mask
  return self._m_blue
end

Png.TrnsTruecolorColor.property.green = {}
function Png.TrnsTruecolorColor.property.green:get()
  if self._m_green ~= nil then
    return self._m_green
  end

  self._m_green = self.green_raw & self._parent.sample_mask
  return self._m_green
end

Png.TrnsTruecolorColor.property.red = {}
function Png.TrnsTruecolorColor.property.red:get()
  if self._m_red ~= nil then
    return self._m_red
  end

  self._m_red = self.red_raw & self._parent.sample_mask
  return self._m_red
end


