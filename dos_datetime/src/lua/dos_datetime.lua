-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")

-- 
-- MS-DOS date and time are packed 16-bit values that specify local date/time.
-- The time is always stored in the current UTC time offset set on the computer
-- which created the file. Note that the daylight saving time (DST) shifts
-- also change the UTC time offset.
-- 
-- For example, if you pack two files A and B into a ZIP archive, file A last modified
-- at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
-- the file modification times saved in MS-DOS format in the ZIP file will vary depending
-- on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
-- 
--   - If set to GMT:
--       - file A: 2020-03-29 00:59 (UTC+00:00)
--       - file B: 2020-03-29 01:00 (UTC+00:00)
--   - If set to BST:
--       - file A: 2020-03-29 01:59 (UTC+01:00)
--       - file B: 2020-03-29 02:00 (UTC+01:00)
-- 
-- It follows that you are unable to determine the actual last modified time
-- of any file stored in the ZIP archive, if you don't know the locale time
-- setting of the computer at the time it created the ZIP.
-- 
-- This format is used in some data formats from the MS-DOS era, for example:
-- 
--   - [zip](/zip/)
--   - [rar](/rar/)
--   - [vfat](/vfat/) (FAT12)
--   - [lzh](/lzh/)
--   - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time)
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime)
-- See also: DosDateTimeToFileTime (https://github.com/reactos/reactos/blob/c6b6444/dll/win32/kernel32/client/time.c#L82-L87)
-- See also: page 25/34 (https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc)
DosDatetime = class.class(KaitaiStruct)

function DosDatetime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosDatetime:_read()
  self.time = DosDatetime.Time(self._io, self, self._root)
  self.date = DosDatetime.Date(self._io, self, self._root)
end


DosDatetime.Time = class.class(KaitaiStruct)

function DosDatetime.Time:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosDatetime.Time:_read()
  self.second_div_2 = self._io:read_bits_int_le(5)
  if not(self.second_div_2 <= 29) then
    error("ValidationGreaterThanError")
  end
  self.minute = self._io:read_bits_int_le(6)
  if not(self.minute <= 59) then
    error("ValidationGreaterThanError")
  end
  self.hour = self._io:read_bits_int_le(5)
  if not(self.hour <= 23) then
    error("ValidationGreaterThanError")
  end
end

DosDatetime.Time.property.second = {}
function DosDatetime.Time.property.second:get()
  if self._m_second ~= nil then
    return self._m_second
  end

  self._m_second = (2 * self.second_div_2)
  return self._m_second
end

DosDatetime.Time.property.padded_second = {}
function DosDatetime.Time.property.padded_second:get()
  if self._m_padded_second ~= nil then
    return self._m_padded_second
  end

  self._m_padded_second = utils.box_unwrap((self.second <= 9) and utils.box_wrap("0") or ("")) .. tostring(self.second)
  return self._m_padded_second
end

DosDatetime.Time.property.padded_minute = {}
function DosDatetime.Time.property.padded_minute:get()
  if self._m_padded_minute ~= nil then
    return self._m_padded_minute
  end

  self._m_padded_minute = utils.box_unwrap((self.minute <= 9) and utils.box_wrap("0") or ("")) .. tostring(self.minute)
  return self._m_padded_minute
end

DosDatetime.Time.property.padded_hour = {}
function DosDatetime.Time.property.padded_hour:get()
  if self._m_padded_hour ~= nil then
    return self._m_padded_hour
  end

  self._m_padded_hour = utils.box_unwrap((self.hour <= 9) and utils.box_wrap("0") or ("")) .. tostring(self.hour)
  return self._m_padded_hour
end


DosDatetime.Date = class.class(KaitaiStruct)

function DosDatetime.Date:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosDatetime.Date:_read()
  self.day = self._io:read_bits_int_le(5)
  if not(self.day >= 1) then
    error("ValidationLessThanError")
  end
  self.month = self._io:read_bits_int_le(4)
  if not(self.month >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.month <= 12) then
    error("ValidationGreaterThanError")
  end
  self.year_minus_1980 = self._io:read_bits_int_le(7)
end

-- 
-- only years from 1980 to 2107 (1980 + 127) can be represented.
DosDatetime.Date.property.year = {}
function DosDatetime.Date.property.year:get()
  if self._m_year ~= nil then
    return self._m_year
  end

  self._m_year = (1980 + self.year_minus_1980)
  return self._m_year
end

DosDatetime.Date.property.padded_day = {}
function DosDatetime.Date.property.padded_day:get()
  if self._m_padded_day ~= nil then
    return self._m_padded_day
  end

  self._m_padded_day = utils.box_unwrap((self.day <= 9) and utils.box_wrap("0") or ("")) .. tostring(self.day)
  return self._m_padded_day
end

DosDatetime.Date.property.padded_month = {}
function DosDatetime.Date.property.padded_month:get()
  if self._m_padded_month ~= nil then
    return self._m_padded_month
  end

  self._m_padded_month = utils.box_unwrap((self.month <= 9) and utils.box_wrap("0") or ("")) .. tostring(self.month)
  return self._m_padded_month
end

DosDatetime.Date.property.padded_year = {}
function DosDatetime.Date.property.padded_year:get()
  if self._m_padded_year ~= nil then
    return self._m_padded_year
  end

  self._m_padded_year = utils.box_unwrap((self.year <= 999) and utils.box_wrap("0" .. utils.box_unwrap((self.year <= 99) and utils.box_wrap("0" .. utils.box_unwrap((self.year <= 9) and utils.box_wrap("0") or (""))) or (""))) or ("")) .. tostring(self.year)
  return self._m_padded_year
end


