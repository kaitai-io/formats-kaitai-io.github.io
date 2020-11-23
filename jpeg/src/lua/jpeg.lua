-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

require("exif")
-- 
-- JPEG File Interchange Format, or JFIF, or, more colloquially known
-- as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
-- offering lossy compression which works reasonably well with
-- photographic images.
-- 
-- Format is organized as a container format, serving multiple
-- "segments", each starting with a magic and a marker. JFIF standard
-- dictates order and mandatory apperance of segments:
-- 
-- * SOI
-- * APP0 (with JFIF magic)
-- * APP0 (with JFXX magic, optional)
-- * everything else
-- * SOS
-- * JPEG-compressed stream
-- * EOI
Jpeg = class.class(KaitaiStruct)

Jpeg.ComponentId = enum.Enum {
  y = 1,
  cb = 2,
  cr = 3,
  i = 4,
  q = 5,
}

function Jpeg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg:_read()
  self.segments = {}
  local i = 0
  while not self._io:is_eof() do
    self.segments[i + 1] = Jpeg.Segment(self._io, self, self._root)
    i = i + 1
  end
end


Jpeg.Segment = class.class(KaitaiStruct)

Jpeg.Segment.MarkerEnum = enum.Enum {
  tem = 1,
  sof0 = 192,
  sof1 = 193,
  sof2 = 194,
  sof3 = 195,
  dht = 196,
  sof5 = 197,
  sof6 = 198,
  sof7 = 199,
  soi = 216,
  eoi = 217,
  sos = 218,
  dqt = 219,
  dnl = 220,
  dri = 221,
  dhp = 222,
  app0 = 224,
  app1 = 225,
  app2 = 226,
  app3 = 227,
  app4 = 228,
  app5 = 229,
  app6 = 230,
  app7 = 231,
  app8 = 232,
  app9 = 233,
  app10 = 234,
  app11 = 235,
  app12 = 236,
  app13 = 237,
  app14 = 238,
  app15 = 239,
  com = 254,
}

function Jpeg.Segment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.Segment:_read()
  self.magic = self._io:read_bytes(1)
  if not(self.magic == "\255") then
    error("not equal, expected " ..  "\255" .. ", but got " .. self.magic)
  end
  self.marker = Jpeg.Segment.MarkerEnum(self._io:read_u1())
  if  ((self.marker ~= Jpeg.Segment.MarkerEnum.soi) and (self.marker ~= Jpeg.Segment.MarkerEnum.eoi))  then
    self.length = self._io:read_u2be()
  end
  if  ((self.marker ~= Jpeg.Segment.MarkerEnum.soi) and (self.marker ~= Jpeg.Segment.MarkerEnum.eoi))  then
    local _on = self.marker
    if _on == Jpeg.Segment.MarkerEnum.app1 then
      self._raw_data = self._io:read_bytes((self.length - 2))
      local _io = KaitaiStream(stringstream(self._raw_data))
      self.data = Jpeg.SegmentApp1(_io, self, self._root)
    elseif _on == Jpeg.Segment.MarkerEnum.app0 then
      self._raw_data = self._io:read_bytes((self.length - 2))
      local _io = KaitaiStream(stringstream(self._raw_data))
      self.data = Jpeg.SegmentApp0(_io, self, self._root)
    elseif _on == Jpeg.Segment.MarkerEnum.sof0 then
      self._raw_data = self._io:read_bytes((self.length - 2))
      local _io = KaitaiStream(stringstream(self._raw_data))
      self.data = Jpeg.SegmentSof0(_io, self, self._root)
    elseif _on == Jpeg.Segment.MarkerEnum.sos then
      self._raw_data = self._io:read_bytes((self.length - 2))
      local _io = KaitaiStream(stringstream(self._raw_data))
      self.data = Jpeg.SegmentSos(_io, self, self._root)
    else
      self.data = self._io:read_bytes((self.length - 2))
    end
  end
  if self.marker == Jpeg.Segment.MarkerEnum.sos then
    self.image_data = self._io:read_bytes_full()
  end
end


Jpeg.SegmentSos = class.class(KaitaiStruct)

function Jpeg.SegmentSos:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.SegmentSos:_read()
  self.num_components = self._io:read_u1()
  self.components = {}
  for i = 0, self.num_components - 1 do
    self.components[i + 1] = Jpeg.SegmentSos.Component(self._io, self, self._root)
  end
  self.start_spectral_selection = self._io:read_u1()
  self.end_spectral = self._io:read_u1()
  self.appr_bit_pos = self._io:read_u1()
end

-- 
-- Number of components in scan.
-- 
-- Scan components specification.
-- 
-- Start of spectral selection or predictor selection.
-- 
-- End of spectral selection.
-- 
-- Successive approximation bit position high + Successive approximation bit position low or point transform.

Jpeg.SegmentSos.Component = class.class(KaitaiStruct)

function Jpeg.SegmentSos.Component:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.SegmentSos.Component:_read()
  self.id = Jpeg.ComponentId(self._io:read_u1())
  self.huffman_table = self._io:read_u1()
end

-- 
-- Scan component selector.

Jpeg.SegmentApp1 = class.class(KaitaiStruct)

function Jpeg.SegmentApp1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.SegmentApp1:_read()
  self.magic = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
  local _on = self.magic
  if _on == "Exif" then
    self.body = Jpeg.ExifInJpeg(self._io, self, self._root)
  end
end


Jpeg.SegmentSof0 = class.class(KaitaiStruct)

function Jpeg.SegmentSof0:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.SegmentSof0:_read()
  self.bits_per_sample = self._io:read_u1()
  self.image_height = self._io:read_u2be()
  self.image_width = self._io:read_u2be()
  self.num_components = self._io:read_u1()
  self.components = {}
  for i = 0, self.num_components - 1 do
    self.components[i + 1] = Jpeg.SegmentSof0.Component(self._io, self, self._root)
  end
end


Jpeg.SegmentSof0.Component = class.class(KaitaiStruct)

function Jpeg.SegmentSof0.Component:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.SegmentSof0.Component:_read()
  self.id = Jpeg.ComponentId(self._io:read_u1())
  self.sampling_factors = self._io:read_u1()
  self.quantization_table_id = self._io:read_u1()
end

Jpeg.SegmentSof0.Component.property.sampling_x = {}
function Jpeg.SegmentSof0.Component.property.sampling_x:get()
  if self._m_sampling_x ~= nil then
    return self._m_sampling_x
  end

  self._m_sampling_x = ((self.sampling_factors & 240) >> 4)
  return self._m_sampling_x
end

Jpeg.SegmentSof0.Component.property.sampling_y = {}
function Jpeg.SegmentSof0.Component.property.sampling_y:get()
  if self._m_sampling_y ~= nil then
    return self._m_sampling_y
  end

  self._m_sampling_y = (self.sampling_factors & 15)
  return self._m_sampling_y
end

-- 
-- Component selector.

Jpeg.ExifInJpeg = class.class(KaitaiStruct)

function Jpeg.ExifInJpeg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.ExifInJpeg:_read()
  self.extra_zero = self._io:read_bytes(1)
  if not(self.extra_zero == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.extra_zero)
  end
  self._raw_data = self._io:read_bytes_full()
  local _io = KaitaiStream(stringstream(self._raw_data))
  self.data = Exif(_io)
end


Jpeg.SegmentApp0 = class.class(KaitaiStruct)

Jpeg.SegmentApp0.DensityUnit = enum.Enum {
  no_units = 0,
  pixels_per_inch = 1,
  pixels_per_cm = 2,
}

function Jpeg.SegmentApp0:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Jpeg.SegmentApp0:_read()
  self.magic = str_decode.decode(self._io:read_bytes(5), "ASCII")
  self.version_major = self._io:read_u1()
  self.version_minor = self._io:read_u1()
  self.density_units = Jpeg.SegmentApp0.DensityUnit(self._io:read_u1())
  self.density_x = self._io:read_u2be()
  self.density_y = self._io:read_u2be()
  self.thumbnail_x = self._io:read_u1()
  self.thumbnail_y = self._io:read_u1()
  self.thumbnail = self._io:read_bytes(((self.thumbnail_x * self.thumbnail_y) * 3))
end

-- 
-- Horizontal pixel density. Must not be zero.
-- 
-- Vertical pixel density. Must not be zero.
-- 
-- Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
-- 
-- Vertical pixel count of the following embedded RGB thumbnail. May be zero.
-- 
-- Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn.

