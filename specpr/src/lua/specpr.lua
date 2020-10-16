-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- Specpr records are fixed format, 1536 bytes/record. Record number
-- counting starts at 0. Binary data are in IEEE format real numbers
-- and non-byte swapped integers (compatiible with all Sun
-- Microsystems, and Hewlett Packard workstations (Intel and some DEC
-- machines are byte swapped relative to Suns and HPs). Each record may
-- contain different information according to the following scheme.
-- 
-- You can get some library of spectra from
-- ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
Specpr = class.class(KaitaiStruct)

Specpr.RecordType = enum.Enum {
  data_initial = 0,
  text_initial = 1,
  data_continuation = 2,
  text_continuation = 3,
}

function Specpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr:_read()
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = Specpr.Record(self._io, self, self._root)
    i = i + 1
  end
end


Specpr.DataInitial = class.class(KaitaiStruct)

function Specpr.DataInitial:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.DataInitial:_read()
  self.ids = Specpr.Identifiers(self._io, self, self._root)
  self.iscta = Specpr.CoarseTimestamp(self._io, self, self._root)
  self.isctb = Specpr.CoarseTimestamp(self._io, self, self._root)
  self.jdatea = self._io:read_s4be()
  self.jdateb = self._io:read_s4be()
  self.istb = Specpr.CoarseTimestamp(self._io, self, self._root)
  self.isra = self._io:read_s4be()
  self.isdec = self._io:read_s4be()
  self.itchan = self._io:read_s4be()
  self.irmas = self._io:read_s4be()
  self.revs = self._io:read_s4be()
  self.iband = {}
  for i = 0, 2 - 1 do
    self.iband[i + 1] = self._io:read_s4be()
  end
  self.irwav = self._io:read_s4be()
  self.irespt = self._io:read_s4be()
  self.irecno = self._io:read_s4be()
  self.itpntr = self._io:read_s4be()
  self.ihist = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(60), 32), "ascii")
  self.mhist = {}
  for i = 0, 4 - 1 do
    self.mhist[i + 1] = str_decode.decode(self._io:read_bytes(74), "ascii")
  end
  self.nruns = self._io:read_s4be()
  self.siangl = Specpr.IllumAngle(self._io, self, self._root)
  self.seangl = Specpr.IllumAngle(self._io, self, self._root)
  self.sphase = self._io:read_s4be()
  self.iwtrns = self._io:read_s4be()
  self.itimch = self._io:read_s4be()
  self.xnrm = self._io:read_f4be()
  self.scatim = self._io:read_f4be()
  self.timint = self._io:read_f4be()
  self.tempd = self._io:read_f4be()
  self.data = {}
  for i = 0, 256 - 1 do
    self.data[i + 1] = self._io:read_f4be()
  end
end

-- 
-- The phase angle between iangl and eangl in seconds.
Specpr.DataInitial.property.phase_angle_arcsec = {}
function Specpr.DataInitial.property.phase_angle_arcsec:get()
  if self._m_phase_angle_arcsec ~= nil then
    return self._m_phase_angle_arcsec
  end

  self._m_phase_angle_arcsec = (self.sphase / 1500)
  return self._m_phase_angle_arcsec
end

-- 
-- Civil or Universal time when data was last processed.
-- 
-- Civil or Universal time at the start of the spectral run.
-- 
-- Date when data was last processed. Stored as integer*4 Julian Day number *10.
-- 
-- Date when the spectral run began. Stored as integer*4 Julian Day number *10.
-- 
-- Siderial time when the spectral run started. See flag #05.
-- 
-- Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
-- 
-- Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
-- 
-- Total number of channels in the spectrum (integer*4 value from 1 to 4852).
-- 
-- The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
-- 
-- The number of independent spectral scans which were added to make the spectrum (integer*4 number).
-- 
-- The channel numbers which define the band normalization (scaling to unity). (integers*4).
-- 
-- The record number within the file where the wavelengths are found (integer*4).
-- 
-- The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
-- 
-- The record number within the file where the data is located (integer*4 number).
-- 
-- Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer).
-- 
-- The program automatic 60 character history.
-- 
-- Manual history. Program automatic for large history requirements.
-- 
-- The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
-- 
-- The angle of incidence of illuminating radiation
--       integrating sphere = 2000000000
--       Geometric albedo   = 2000000001
-- 
-- The angle of emission of illuminating radiation
--       integrating sphere = 2000000000
--       Geometric albedo   = 2000000001
-- 
-- The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
--       integrating sphere = 2000000000
-- 
-- Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
-- 
-- The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4).
-- 
-- The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
-- 
-- The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
-- 
-- Total integration time (usually=scatime * nruns) (32 bit real number).
-- 
-- Temperature in degrees Kelvin (32 bit real number).
-- 
-- The spectral data (256 channels of 32 bit real data numbers).

Specpr.CoarseTimestamp = class.class(KaitaiStruct)

function Specpr.CoarseTimestamp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.CoarseTimestamp:_read()
  self.scaled_seconds = self._io:read_s4be()
end

Specpr.CoarseTimestamp.property.seconds = {}
function Specpr.CoarseTimestamp.property.seconds:get()
  if self._m_seconds ~= nil then
    return self._m_seconds
  end

  self._m_seconds = (self.scaled_seconds * 24000)
  return self._m_seconds
end


-- 
-- it is big endian.
Specpr.Icflag = class.class(KaitaiStruct)

function Specpr.Icflag:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.Icflag:_read()
  self.reserved = self._io:read_bits_int_be(26)
  self.isctb_type = self._io:read_bits_int_be(1)
  self.iscta_type = self._io:read_bits_int_be(1)
  self.coordinate_mode = self._io:read_bits_int_be(1)
  self.errors = self._io:read_bits_int_be(1)
  self.text = self._io:read_bits_int_be(1)
  self.continuation = self._io:read_bits_int_be(1)
end

Specpr.Icflag.property.type = {}
function Specpr.Icflag.property.type:get()
  if self._m_type ~= nil then
    return self._m_type
  end

  self._m_type = Specpr.RecordType((((self.text and 1 or 0) * 1) + ((self.continuation and 1 or 0) * 2)))
  return self._m_type
end

-- 
-- =0 ctb is civil time
-- =1 ctb is universal time
-- 
-- =0 cta is civil time
-- =1 cta is universal time
-- 
-- RA, Dec / Long., Lat flag
-- =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
-- =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
-- 
-- flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
-- 
-- =0 the data in the array "data" is data
-- =1 the data in the array "data" is ascii text as is most of the header info.
-- 
-- =0 first record of a spectrum consists of: header then 256 data channels
-- =1 continuation data record consisting of:
--   # bit flags followed by 1532 bytes of
--   # real data (bit 1=0) (383 channels)
--   # or 1532 bytes of text (bit 1=1).
--   # A maximum of 12 continuation records
--   # are allowed for a total of 4852
--   # channels (limited by arrays of 4864)
--   # or 19860 characters of text (bit 1=1).

Specpr.DataContinuation = class.class(KaitaiStruct)

function Specpr.DataContinuation:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.DataContinuation:_read()
  self.cdata = {}
  for i = 0, 383 - 1 do
    self.cdata[i + 1] = self._io:read_f4be()
  end
end

-- 
-- The continuation of the data values (383 channels of 32 bit real numbers).

Specpr.Identifiers = class.class(KaitaiStruct)

function Specpr.Identifiers:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.Identifiers:_read()
  self.ititle = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(40), 32), "ascii")
  self.usernm = str_decode.decode(self._io:read_bytes(8), "ascii")
end

-- 
-- Title which describes the data.
-- 
-- The name of the user who created the data record.

Specpr.IllumAngle = class.class(KaitaiStruct)

function Specpr.IllumAngle:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.IllumAngle:_read()
  self.angl = self._io:read_s4be()
end

Specpr.IllumAngle.property.seconds_total = {}
function Specpr.IllumAngle.property.seconds_total:get()
  if self._m_seconds_total ~= nil then
    return self._m_seconds_total
  end

  self._m_seconds_total = math.floor(self.angl / 6000)
  return self._m_seconds_total
end

Specpr.IllumAngle.property.minutes_total = {}
function Specpr.IllumAngle.property.minutes_total:get()
  if self._m_minutes_total ~= nil then
    return self._m_minutes_total
  end

  self._m_minutes_total = math.floor(self.seconds_total / 60)
  return self._m_minutes_total
end

Specpr.IllumAngle.property.degrees_total = {}
function Specpr.IllumAngle.property.degrees_total:get()
  if self._m_degrees_total ~= nil then
    return self._m_degrees_total
  end

  self._m_degrees_total = math.floor(self.minutes_total / 60)
  return self._m_degrees_total
end

-- 
-- (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)

Specpr.TextInitial = class.class(KaitaiStruct)

function Specpr.TextInitial:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.TextInitial:_read()
  self.ids = Specpr.Identifiers(self._io, self, self._root)
  self.itxtpt = self._io:read_u4be()
  self.itxtch = self._io:read_s4be()
  self.itext = str_decode.decode(self._io:read_bytes(1476), "ascii")
end

-- 
-- Text data record pointer. This pointer points  to a data record where additional text may be may be found.
-- 
-- The number of text characters (maximum= 19860).
-- 
-- 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.

Specpr.Record = class.class(KaitaiStruct)

function Specpr.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.Record:_read()
  self.icflag = Specpr.Icflag(self._io, self, self._root)
  local _on = self.icflag.type
  if _on == Specpr.RecordType.data_initial then
    self._raw_content = self._io:read_bytes((1536 - 4))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = Specpr.DataInitial(_io, self, self._root)
  elseif _on == Specpr.RecordType.data_continuation then
    self._raw_content = self._io:read_bytes((1536 - 4))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = Specpr.DataContinuation(_io, self, self._root)
  elseif _on == Specpr.RecordType.text_continuation then
    self._raw_content = self._io:read_bytes((1536 - 4))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = Specpr.TextContinuation(_io, self, self._root)
  elseif _on == Specpr.RecordType.text_initial then
    self._raw_content = self._io:read_bytes((1536 - 4))
    local _io = KaitaiStream(stringstream(self._raw_content))
    self.content = Specpr.TextInitial(_io, self, self._root)
  else
    self.content = self._io:read_bytes((1536 - 4))
  end
end

-- 
-- Total number of bytes comprising the document.

Specpr.TextContinuation = class.class(KaitaiStruct)

function Specpr.TextContinuation:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Specpr.TextContinuation:_read()
  self.tdata = str_decode.decode(self._io:read_bytes(1532), "ascii")
end

-- 
-- 1532 characters of text.

