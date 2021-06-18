-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")

Edid = class.class(KaitaiStruct)

function Edid:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Edid:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\000\255\255\255\255\255\255\000") then
    error("not equal, expected " ..  "\000\255\255\255\255\255\255\000" .. ", but got " .. self.magic)
  end
  self.mfg_bytes = self._io:read_u2be()
  self.product_code = self._io:read_u2le()
  self.serial = self._io:read_u4le()
  self.mfg_week = self._io:read_u1()
  self.mfg_year_mod = self._io:read_u1()
  self.edid_version_major = self._io:read_u1()
  self.edid_version_minor = self._io:read_u1()
  self.input_flags = self._io:read_u1()
  self.screen_size_h = self._io:read_u1()
  self.screen_size_v = self._io:read_u1()
  self.gamma_mod = self._io:read_u1()
  self.features_flags = self._io:read_u1()
  self.chromacity = Edid.ChromacityInfo(self._io, self, self._root)
  self.est_timings = Edid.EstTimingsInfo(self._io, self, self._root)
  self._raw_std_timings = {}
  self.std_timings = {}
  for i = 0, 8 - 1 do
    self._raw_std_timings[i + 1] = self._io:read_bytes(2)
    local _io = KaitaiStream(stringstream(self._raw_std_timings[i + 1]))
    self.std_timings[i + 1] = Edid.StdTiming(_io, self, self._root)
  end
end

Edid.property.mfg_year = {}
function Edid.property.mfg_year:get()
  if self._m_mfg_year ~= nil then
    return self._m_mfg_year
  end

  self._m_mfg_year = (self.mfg_year_mod + 1990)
  return self._m_mfg_year
end

Edid.property.mfg_id_ch1 = {}
function Edid.property.mfg_id_ch1:get()
  if self._m_mfg_id_ch1 ~= nil then
    return self._m_mfg_id_ch1
  end

  self._m_mfg_id_ch1 = ((self.mfg_bytes & 31744) >> 10)
  return self._m_mfg_id_ch1
end

Edid.property.mfg_id_ch3 = {}
function Edid.property.mfg_id_ch3:get()
  if self._m_mfg_id_ch3 ~= nil then
    return self._m_mfg_id_ch3
  end

  self._m_mfg_id_ch3 = (self.mfg_bytes & 31)
  return self._m_mfg_id_ch3
end

Edid.property.gamma = {}
function Edid.property.gamma:get()
  if self._m_gamma ~= nil then
    return self._m_gamma
  end

  if self.gamma_mod ~= 255 then
    self._m_gamma = ((self.gamma_mod + 100) / 100.0)
  end
  return self._m_gamma
end

Edid.property.mfg_id_ch2 = {}
function Edid.property.mfg_id_ch2:get()
  if self._m_mfg_id_ch2 ~= nil then
    return self._m_mfg_id_ch2
  end

  self._m_mfg_id_ch2 = ((self.mfg_bytes & 992) >> 5)
  return self._m_mfg_id_ch2
end

-- 
-- Manufacturer product code.
-- 
-- Serial number.
-- 
-- Week of manufacture. Week numbering is not consistent between manufacturers.
-- 
-- Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
-- 
-- EDID version, usually 1 (for 1.3).
-- 
-- EDID revision, usually 3 (for 1.3).
-- 
-- Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio).
-- 
-- Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector).
-- 
-- Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54).
-- 
-- Phosphor or filter chromaticity structure, which provides info on colorimetry and white point.
-- See also: Standard, section 3.7
-- 
-- Block of bit flags that indicates support of so called
-- "established timings", which is a commonly used subset of VESA
-- DMT (Discrete Monitor Timings) modes.
-- See also: Standard, section 3.8
-- 
-- Array of descriptions of so called "standard timings", which are
-- used to specify up to 8 additional timings not included in
-- "established timings".

-- 
-- Chromaticity information: colorimetry and white point
-- coordinates. All coordinates are stored as fixed precision
-- 10-bit numbers, bits are shuffled for compactness.
Edid.ChromacityInfo = class.class(KaitaiStruct)

function Edid.ChromacityInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Edid.ChromacityInfo:_read()
  self.red_x_1_0 = self._io:read_bits_int_be(2)
  self.red_y_1_0 = self._io:read_bits_int_be(2)
  self.green_x_1_0 = self._io:read_bits_int_be(2)
  self.green_y_1_0 = self._io:read_bits_int_be(2)
  self.blue_x_1_0 = self._io:read_bits_int_be(2)
  self.blue_y_1_0 = self._io:read_bits_int_be(2)
  self.white_x_1_0 = self._io:read_bits_int_be(2)
  self.white_y_1_0 = self._io:read_bits_int_be(2)
  self._io:align_to_byte()
  self.red_x_9_2 = self._io:read_u1()
  self.red_y_9_2 = self._io:read_u1()
  self.green_x_9_2 = self._io:read_u1()
  self.green_y_9_2 = self._io:read_u1()
  self.blue_x_9_2 = self._io:read_u1()
  self.blue_y_9_2 = self._io:read_u1()
  self.white_x_9_2 = self._io:read_u1()
  self.white_y_9_2 = self._io:read_u1()
end

Edid.ChromacityInfo.property.green_x_int = {}
function Edid.ChromacityInfo.property.green_x_int:get()
  if self._m_green_x_int ~= nil then
    return self._m_green_x_int
  end

  self._m_green_x_int = ((self.green_x_9_2 << 2) | self.green_x_1_0)
  return self._m_green_x_int
end

-- 
-- Red Y coordinate.
Edid.ChromacityInfo.property.red_y = {}
function Edid.ChromacityInfo.property.red_y:get()
  if self._m_red_y ~= nil then
    return self._m_red_y
  end

  self._m_red_y = (self.red_y_int / 1024.0)
  return self._m_red_y
end

Edid.ChromacityInfo.property.green_y_int = {}
function Edid.ChromacityInfo.property.green_y_int:get()
  if self._m_green_y_int ~= nil then
    return self._m_green_y_int
  end

  self._m_green_y_int = ((self.green_y_9_2 << 2) | self.green_y_1_0)
  return self._m_green_y_int
end

-- 
-- White Y coordinate.
Edid.ChromacityInfo.property.white_y = {}
function Edid.ChromacityInfo.property.white_y:get()
  if self._m_white_y ~= nil then
    return self._m_white_y
  end

  self._m_white_y = (self.white_y_int / 1024.0)
  return self._m_white_y
end

-- 
-- Red X coordinate.
Edid.ChromacityInfo.property.red_x = {}
function Edid.ChromacityInfo.property.red_x:get()
  if self._m_red_x ~= nil then
    return self._m_red_x
  end

  self._m_red_x = (self.red_x_int / 1024.0)
  return self._m_red_x
end

-- 
-- White X coordinate.
Edid.ChromacityInfo.property.white_x = {}
function Edid.ChromacityInfo.property.white_x:get()
  if self._m_white_x ~= nil then
    return self._m_white_x
  end

  self._m_white_x = (self.white_x_int / 1024.0)
  return self._m_white_x
end

-- 
-- Blue X coordinate.
Edid.ChromacityInfo.property.blue_x = {}
function Edid.ChromacityInfo.property.blue_x:get()
  if self._m_blue_x ~= nil then
    return self._m_blue_x
  end

  self._m_blue_x = (self.blue_x_int / 1024.0)
  return self._m_blue_x
end

Edid.ChromacityInfo.property.white_x_int = {}
function Edid.ChromacityInfo.property.white_x_int:get()
  if self._m_white_x_int ~= nil then
    return self._m_white_x_int
  end

  self._m_white_x_int = ((self.white_x_9_2 << 2) | self.white_x_1_0)
  return self._m_white_x_int
end

Edid.ChromacityInfo.property.white_y_int = {}
function Edid.ChromacityInfo.property.white_y_int:get()
  if self._m_white_y_int ~= nil then
    return self._m_white_y_int
  end

  self._m_white_y_int = ((self.white_y_9_2 << 2) | self.white_y_1_0)
  return self._m_white_y_int
end

-- 
-- Green X coordinate.
Edid.ChromacityInfo.property.green_x = {}
function Edid.ChromacityInfo.property.green_x:get()
  if self._m_green_x ~= nil then
    return self._m_green_x
  end

  self._m_green_x = (self.green_x_int / 1024.0)
  return self._m_green_x
end

Edid.ChromacityInfo.property.red_x_int = {}
function Edid.ChromacityInfo.property.red_x_int:get()
  if self._m_red_x_int ~= nil then
    return self._m_red_x_int
  end

  self._m_red_x_int = ((self.red_x_9_2 << 2) | self.red_x_1_0)
  return self._m_red_x_int
end

Edid.ChromacityInfo.property.red_y_int = {}
function Edid.ChromacityInfo.property.red_y_int:get()
  if self._m_red_y_int ~= nil then
    return self._m_red_y_int
  end

  self._m_red_y_int = ((self.red_y_9_2 << 2) | self.red_y_1_0)
  return self._m_red_y_int
end

Edid.ChromacityInfo.property.blue_x_int = {}
function Edid.ChromacityInfo.property.blue_x_int:get()
  if self._m_blue_x_int ~= nil then
    return self._m_blue_x_int
  end

  self._m_blue_x_int = ((self.blue_x_9_2 << 2) | self.blue_x_1_0)
  return self._m_blue_x_int
end

-- 
-- Blue Y coordinate.
Edid.ChromacityInfo.property.blue_y = {}
function Edid.ChromacityInfo.property.blue_y:get()
  if self._m_blue_y ~= nil then
    return self._m_blue_y
  end

  self._m_blue_y = (self.blue_y_int / 1024.0)
  return self._m_blue_y
end

-- 
-- Green Y coordinate.
Edid.ChromacityInfo.property.green_y = {}
function Edid.ChromacityInfo.property.green_y:get()
  if self._m_green_y ~= nil then
    return self._m_green_y
  end

  self._m_green_y = (self.green_y_int / 1024.0)
  return self._m_green_y
end

Edid.ChromacityInfo.property.blue_y_int = {}
function Edid.ChromacityInfo.property.blue_y_int:get()
  if self._m_blue_y_int ~= nil then
    return self._m_blue_y_int
  end

  self._m_blue_y_int = ((self.blue_y_9_2 << 2) | self.blue_y_1_0)
  return self._m_blue_y_int
end

-- 
-- Red X, bits 1..0.
-- 
-- Red Y, bits 1..0.
-- 
-- Green X, bits 1..0.
-- 
-- Green Y, bits 1..0.
-- 
-- Blue X, bits 1..0.
-- 
-- Blue Y, bits 1..0.
-- 
-- White X, bits 1..0.
-- 
-- White Y, bits 1..0.
-- 
-- Red X, bits 9..2.
-- 
-- Red Y, bits 9..2.
-- 
-- Green X, bits 9..2.
-- 
-- Green Y, bits 9..2.
-- 
-- Blue X, bits 9..2.
-- 
-- Blue Y, bits 9..2.
-- 
-- White X, bits 9..2.
-- 
-- White Y, bits 9..2.

Edid.EstTimingsInfo = class.class(KaitaiStruct)

function Edid.EstTimingsInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Edid.EstTimingsInfo:_read()
  self.can_720_400_70 = self._io:read_bits_int_be(1)
  self.can_720_400_88 = self._io:read_bits_int_be(1)
  self.can_640_480_60 = self._io:read_bits_int_be(1)
  self.can_640_480_67 = self._io:read_bits_int_be(1)
  self.can_640_480_72 = self._io:read_bits_int_be(1)
  self.can_640_480_75 = self._io:read_bits_int_be(1)
  self.can_800_600_56 = self._io:read_bits_int_be(1)
  self.can_800_600_60 = self._io:read_bits_int_be(1)
  self.can_800_600_72 = self._io:read_bits_int_be(1)
  self.can_800_600_75 = self._io:read_bits_int_be(1)
  self.can_832_624_75 = self._io:read_bits_int_be(1)
  self.can_1024_768_87_i = self._io:read_bits_int_be(1)
  self.can_1024_768_60 = self._io:read_bits_int_be(1)
  self.can_1024_768_70 = self._io:read_bits_int_be(1)
  self.can_1024_768_75 = self._io:read_bits_int_be(1)
  self.can_1280_1024_75 = self._io:read_bits_int_be(1)
  self.can_1152_870_75 = self._io:read_bits_int_be(1)
  self.reserved = self._io:read_bits_int_be(7)
end

-- 
-- Supports 720 x 400 @ 70Hz.
-- 
-- Supports 720 x 400 @ 88Hz.
-- 
-- Supports 640 x 480 @ 60Hz.
-- 
-- Supports 640 x 480 @ 67Hz.
-- 
-- Supports 640 x 480 @ 72Hz.
-- 
-- Supports 640 x 480 @ 75Hz.
-- 
-- Supports 800 x 600 @ 56Hz.
-- 
-- Supports 800 x 600 @ 60Hz.
-- 
-- Supports 800 x 600 @ 72Hz.
-- 
-- Supports 800 x 600 @ 75Hz.
-- 
-- Supports 832 x 624 @ 75Hz.
-- 
-- Supports 1024 x 768 @ 87Hz(I).
-- 
-- Supports 1024 x 768 @ 60Hz.
-- 
-- Supports 1024 x 768 @ 70Hz.
-- 
-- Supports 1024 x 768 @ 75Hz.
-- 
-- Supports 1280 x 1024 @ 75Hz.
-- 
-- Supports 1152 x 870 @ 75Hz.

Edid.StdTiming = class.class(KaitaiStruct)

Edid.StdTiming.AspectRatios = enum.Enum {
  ratio_16_10 = 0,
  ratio_4_3 = 1,
  ratio_5_4 = 2,
  ratio_16_9 = 3,
}

function Edid.StdTiming:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Edid.StdTiming:_read()
  self.horiz_active_pixels_mod = self._io:read_u1()
  self.aspect_ratio = Edid.StdTiming.AspectRatios(self._io:read_bits_int_be(2))
  self.refresh_rate_mod = self._io:read_bits_int_be(6)
end

Edid.StdTiming.property.bytes_lookahead = {}
function Edid.StdTiming.property.bytes_lookahead:get()
  if self._m_bytes_lookahead ~= nil then
    return self._m_bytes_lookahead
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_bytes_lookahead = self._io:read_bytes(2)
  self._io:seek(_pos)
  return self._m_bytes_lookahead
end

Edid.StdTiming.property.is_used = {}
function Edid.StdTiming.property.is_used:get()
  if self._m_is_used ~= nil then
    return self._m_is_used
  end

  self._m_is_used = self.bytes_lookahead ~= "\001\001"
  return self._m_is_used
end

-- 
-- Range of horizontal active pixels.
Edid.StdTiming.property.horiz_active_pixels = {}
function Edid.StdTiming.property.horiz_active_pixels:get()
  if self._m_horiz_active_pixels ~= nil then
    return self._m_horiz_active_pixels
  end

  if self.is_used then
    self._m_horiz_active_pixels = ((self.horiz_active_pixels_mod + 31) * 8)
  end
  return self._m_horiz_active_pixels
end

-- 
-- Vertical refresh rate, Hz.
Edid.StdTiming.property.refresh_rate = {}
function Edid.StdTiming.property.refresh_rate:get()
  if self._m_refresh_rate ~= nil then
    return self._m_refresh_rate
  end

  if self.is_used then
    self._m_refresh_rate = (self.refresh_rate_mod + 60)
  end
  return self._m_refresh_rate
end

-- 
-- Range of horizontal active pixels, written in modified form:
-- `(horiz_active_pixels / 8) - 31`. This yields an effective
-- range of 256..2288, with steps of 8 pixels.
-- 
-- Aspect ratio of the image. Can be used to calculate number
-- of vertical pixels.
-- 
-- Refresh rate in Hz, written in modified form: `refresh_rate
-- - 60`. This yields an effective range of 60..123 Hz.

