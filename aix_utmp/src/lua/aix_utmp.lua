-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
-- See also: Source (https://www.ibm.com/support/knowledgecenter/en/ssw_aix_71/com.ibm.aix.files/utmp.h.htm)
AixUtmp = class.class(KaitaiStruct)

AixUtmp.EntryType = enum.Enum {
  empty = 0,
  run_lvl = 1,
  boot_time = 2,
  old_time = 3,
  new_time = 4,
  init_process = 5,
  login_process = 6,
  user_process = 7,
  dead_process = 8,
  accounting = 9,
}

function AixUtmp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AixUtmp:_read()
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = AixUtmp.Record(self._io, self, self._root)
    i = i + 1
  end
end


AixUtmp.Record = class.class(KaitaiStruct)

function AixUtmp.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AixUtmp.Record:_read()
  self.user = str_decode.decode(self._io:read_bytes(256), "ascii")
  self.inittab_id = str_decode.decode(self._io:read_bytes(14), "ascii")
  self.device = str_decode.decode(self._io:read_bytes(64), "ascii")
  self.pid = self._io:read_u8be()
  self.type = AixUtmp.EntryType(self._io:read_s2be())
  self.timestamp = self._io:read_s8be()
  self.exit_status = AixUtmp.ExitStatus(self._io, self, self._root)
  self.hostname = str_decode.decode(self._io:read_bytes(256), "ascii")
  self.dbl_word_pad = self._io:read_s4be()
  self.reserved_a = self._io:read_bytes(8)
  self.reserved_v = self._io:read_bytes(24)
end

-- 
-- User login name.
-- 
-- /etc/inittab id.
-- 
-- device name (console, lnxx).
-- 
-- process id.
-- 
-- Type of login.
-- 
-- time entry was made.
-- 
-- the exit status of a process marked as DEAD PROCESS.
-- 
-- host name.

AixUtmp.ExitStatus = class.class(KaitaiStruct)

function AixUtmp.ExitStatus:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AixUtmp.ExitStatus:_read()
  self.termination_code = self._io:read_s2be()
  self.exit_code = self._io:read_s2be()
end

-- 
-- process termination status.
-- 
-- process exit status.

