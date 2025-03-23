-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

GlibcUtmp = class.class(KaitaiStruct)

GlibcUtmp.EntryType = enum.Enum {
  empty = 0,
  run_lvl = 1,
  boot_time = 2,
  new_time = 3,
  old_time = 4,
  init_process = 5,
  login_process = 6,
  user_process = 7,
  dead_process = 8,
  accounting = 9,
}

function GlibcUtmp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GlibcUtmp:_read()
  self._raw_records = {}
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self._raw_records[i + 1] = self._io:read_bytes(384)
    local _io = KaitaiStream(stringstream(self._raw_records[#self._raw_records]))
    self.records[i + 1] = GlibcUtmp.Record(_io, self, self._root)
    i = i + 1
  end
end


GlibcUtmp.Record = class.class(KaitaiStruct)

function GlibcUtmp.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GlibcUtmp.Record:_read()
  self.ut_type = GlibcUtmp.EntryType(self._io:read_s4le())
  self.pid = self._io:read_u4le()
  self.line = str_decode.decode(self._io:read_bytes(32), "UTF-8")
  self.id = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.user = str_decode.decode(self._io:read_bytes(32), "UTF-8")
  self.host = str_decode.decode(self._io:read_bytes(256), "UTF-8")
  self.exit = self._io:read_u4le()
  self.session = self._io:read_s4le()
  self.tv = GlibcUtmp.Timeval(self._io, self, self._root)
  self.addr_v6 = self._io:read_bytes(16)
  self.reserved = self._io:read_bytes(20)
end

-- 
-- Type of login.
-- 
-- Process ID of login process.
-- 
-- Devicename.
-- 
-- Inittab ID.
-- 
-- Username.
-- 
-- Hostname for remote login.
-- 
-- Exit status of a process marked as DEAD_PROCESS.
-- 
-- Session ID, used for windowing.
-- 
-- Time entry was made.
-- 
-- Internet address of remote host.

GlibcUtmp.Timeval = class.class(KaitaiStruct)

function GlibcUtmp.Timeval:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GlibcUtmp.Timeval:_read()
  self.sec = self._io:read_u4le()
  self.usec = self._io:read_s4le()
end

-- 
-- Seconds.
-- 
-- Microseconds.

