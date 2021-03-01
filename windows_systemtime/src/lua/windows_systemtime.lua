-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Microsoft Windows SYSTEMTIME structure, stores individual components
-- of date and time as individual fields, up to millisecond precision.
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime)
WindowsSystemtime = class.class(KaitaiStruct)

function WindowsSystemtime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsSystemtime:_read()
  self.year = self._io:read_u2le()
  self.month = self._io:read_u2le()
  self.dow = self._io:read_u2le()
  self.day = self._io:read_u2le()
  self.hour = self._io:read_u2le()
  self.min = self._io:read_u2le()
  self.sec = self._io:read_u2le()
  self.msec = self._io:read_u2le()
end

-- 
-- Year.
-- 
-- Month (January = 1).
-- 
-- Day of week (Sun = 0).
-- 
-- Day of month.
-- 
-- Hours.
-- 
-- Minutes.
-- 
-- Seconds.
-- 
-- Milliseconds.

