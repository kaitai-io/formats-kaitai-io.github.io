-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- This spec can be used to parse sudo time stamp files located in directories
-- such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
-- See also: Source (https://www.sudo.ws/man/1.8.27/sudoers_timestamp.man.html)
SudoersTs = class.class(KaitaiStruct)

SudoersTs.TsType = enum.Enum {
  global = 1,
  tty = 2,
  ppid = 3,
  lockexcl = 4,
}

function SudoersTs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SudoersTs:_read()
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = SudoersTs.Record(self._io, self, self._root)
    i = i + 1
  end
end


SudoersTs.RecordV2 = class.class(KaitaiStruct)

function SudoersTs.RecordV2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SudoersTs.RecordV2:_read()
  self.type = SudoersTs.TsType(self._io:read_u2le())
  self.flags = SudoersTs.TsFlag(self._io, self, self._root)
  self.auth_uid = self._io:read_u4le()
  self.sid = self._io:read_u4le()
  self.start_time = SudoersTs.Timespec(self._io, self, self._root)
  self.ts = SudoersTs.Timespec(self._io, self, self._root)
  if self.type == SudoersTs.TsType.tty then
    self.ttydev = self._io:read_u4le()
  end
  if self.type == SudoersTs.TsType.ppid then
    self.ppid = self._io:read_u4le()
  end
end

-- 
-- record type.
-- 
-- record flags.
-- 
-- user ID that was used for authentication.
-- 
-- ID of the user's terminal session, if present (when type is TS_TTY).
-- 
-- start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID.
-- 
-- actual time stamp, from a monotonic time source.
-- 
-- device number of the terminal associated with the session.
-- 
-- ID of the parent process.

SudoersTs.TsFlag = class.class(KaitaiStruct)

function SudoersTs.TsFlag:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SudoersTs.TsFlag:_read()
  self.reserved0 = self._io:read_bits_int_be(6)
  self.anyuid = self._io:read_bits_int_be(1) ~= 0
  self.disabled = self._io:read_bits_int_be(1) ~= 0
  self.reserved1 = self._io:read_bits_int_be(8)
end

-- 
-- Reserved (unused) bits.
-- 
-- ignore uid.
-- 
-- entry disabled.
-- 
-- Reserved (unused) bits.

SudoersTs.RecordV1 = class.class(KaitaiStruct)

function SudoersTs.RecordV1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SudoersTs.RecordV1:_read()
  self.type = SudoersTs.TsType(self._io:read_u2le())
  self.flags = SudoersTs.TsFlag(self._io, self, self._root)
  self.auth_uid = self._io:read_u4le()
  self.sid = self._io:read_u4le()
  self.ts = SudoersTs.Timespec(self._io, self, self._root)
  if self.type == SudoersTs.TsType.tty then
    self.ttydev = self._io:read_u4le()
  end
  if self.type == SudoersTs.TsType.ppid then
    self.ppid = self._io:read_u4le()
  end
end

-- 
-- record type.
-- 
-- record flags.
-- 
-- user ID that was used for authentication.
-- 
-- session ID associated with tty/ppid.
-- 
-- time stamp, from a monotonic time source.
-- 
-- device number of the terminal associated with the session.
-- 
-- ID of the parent process.

SudoersTs.Timespec = class.class(KaitaiStruct)

function SudoersTs.Timespec:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SudoersTs.Timespec:_read()
  self.sec = self._io:read_s8le()
  self.nsec = self._io:read_s8le()
end

-- 
-- seconds.
-- 
-- nanoseconds.

SudoersTs.Record = class.class(KaitaiStruct)

function SudoersTs.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SudoersTs.Record:_read()
  self.version = self._io:read_u2le()
  self.len_record = self._io:read_u2le()
  local _on = self.version
  if _on == 1 then
    self._raw_payload = self._io:read_bytes((self.len_record - 4))
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = SudoersTs.RecordV1(_io, self, self._root)
  elseif _on == 2 then
    self._raw_payload = self._io:read_bytes((self.len_record - 4))
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = SudoersTs.RecordV2(_io, self, self._root)
  else
    self.payload = self._io:read_bytes((self.len_record - 4))
  end
end

-- 
-- version number of the timestamp_entry struct.
-- 
-- size of the record in bytes.

