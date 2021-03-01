-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")

-- 
-- EVT files are Windows Event Log files written by older Windows
-- operating systems (2000, XP, 2003). They are used as binary log
-- files by several major Windows subsystems and
-- applications. Typically, several of them can be found in
-- `%WINDIR%\system32\config` directory:
-- 
-- * Application = `AppEvent.evt`
-- * System = `SysEvent.evt`
-- * Security = `SecEvent.evt`
-- 
-- Alternatively, one can export any system event log as distinct .evt
-- file using relevant option in Event Viewer application.
-- 
-- A Windows application can submit an entry into these logs using
-- [ReportEventA](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
-- function of Windows API.
-- 
-- Internally, EVT files consist of a fixed-size header and event
-- records. There are several usage scenarios (non-wrapping vs wrapping
-- log files) which result in slightly different organization of
-- records.
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format)
WindowsEvtLog = class.class(KaitaiStruct)

function WindowsEvtLog:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsEvtLog:_read()
  self.header = WindowsEvtLog.Header(self._io, self, self._root)
  self.records = {}
  local i = 0
  while not self._io:is_eof() do
    self.records[i + 1] = WindowsEvtLog.Record(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- See also: Source (https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85))
WindowsEvtLog.Header = class.class(KaitaiStruct)

function WindowsEvtLog.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsEvtLog.Header:_read()
  self.len_header = self._io:read_u4le()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\076\102\076\101") then
    error("not equal, expected " ..  "\076\102\076\101" .. ", but got " .. self.magic)
  end
  self.version_major = self._io:read_u4le()
  self.version_minor = self._io:read_u4le()
  self.ofs_start = self._io:read_u4le()
  self.ofs_end = self._io:read_u4le()
  self.cur_rec_idx = self._io:read_u4le()
  self.oldest_rec_idx = self._io:read_u4le()
  self.len_file_max = self._io:read_u4le()
  self.flags = WindowsEvtLog.Header.Flags(self._io, self, self._root)
  self.retention = self._io:read_u4le()
  self.len_header_2 = self._io:read_u4le()
end

-- 
-- Size of the header structure, must be 0x30.
-- 
-- Offset of oldest record kept in this log file.
-- 
-- Offset of EOF log record, which is a placeholder for new record.
-- 
-- Index of current record, where a new submission would be
-- written to (normally there should to EOF log record there).
-- 
-- Index of oldest record in the log file.
-- 
-- Total maximum size of the log file.
-- 
-- Size of the header structure repeated again, and again it must be 0x30.

WindowsEvtLog.Header.Flags = class.class(KaitaiStruct)

function WindowsEvtLog.Header.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsEvtLog.Header.Flags:_read()
  self.reserved = self._io:read_bits_int_be(28)
  self.archive = self._io:read_bits_int_be(1)
  self.log_full = self._io:read_bits_int_be(1)
  self.wrap = self._io:read_bits_int_be(1)
  self.dirty = self._io:read_bits_int_be(1)
end

-- 
-- True if archive attribute has been set for this log file.
-- 
-- True if last write operation failed due to log being full.
-- 
-- True if wrapping of record has occured.
-- 
-- True if write operation was in progress, but log file
-- wasn't properly closed.

-- 
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord)
WindowsEvtLog.Record = class.class(KaitaiStruct)

function WindowsEvtLog.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsEvtLog.Record:_read()
  self.len_record = self._io:read_u4le()
  self.type = self._io:read_u4le()
  local _on = self.type
  if _on == 1699505740 then
    self._raw_body = self._io:read_bytes((self.len_record - 12))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = WindowsEvtLog.RecordBody(_io, self, self._root)
  elseif _on == 286331153 then
    self._raw_body = self._io:read_bytes((self.len_record - 12))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = WindowsEvtLog.CursorRecordBody(_io, self, self._root)
  else
    self.body = self._io:read_bytes((self.len_record - 12))
  end
  self.len_record2 = self._io:read_u4le()
end

-- 
-- Size of whole record, including all headers, footers and data.
-- 
-- Type of record. Normal log records specify "LfLe"
-- (0x654c664c) in this field, cursor records use 0x11111111.
-- 
-- Record body interpretation depends on type of record. Body
-- size is specified in a way that it won't include a 8-byte
-- "header" (`len_record` + `type`) and a "footer"
-- (`len_record2`).
-- 
-- Size of whole record again.

-- 
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord)
WindowsEvtLog.RecordBody = class.class(KaitaiStruct)

WindowsEvtLog.RecordBody.EventTypes = enum.Enum {
  error = 1,
  audit_failure = 2,
  audit_success = 3,
  info = 4,
  warning = 5,
}

function WindowsEvtLog.RecordBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsEvtLog.RecordBody:_read()
  self.idx = self._io:read_u4le()
  self.time_generated = self._io:read_u4le()
  self.time_written = self._io:read_u4le()
  self.event_id = self._io:read_u4le()
  self.event_type = WindowsEvtLog.RecordBody.EventTypes(self._io:read_u2le())
  self.num_strings = self._io:read_u2le()
  self.event_category = self._io:read_u2le()
  self.reserved = self._io:read_bytes(6)
  self.ofs_strings = self._io:read_u4le()
  self.len_user_sid = self._io:read_u4le()
  self.ofs_user_sid = self._io:read_u4le()
  self.len_data = self._io:read_u4le()
  self.ofs_data = self._io:read_u4le()
end

WindowsEvtLog.RecordBody.property.user_sid = {}
function WindowsEvtLog.RecordBody.property.user_sid:get()
  if self._m_user_sid ~= nil then
    return self._m_user_sid
  end

  local _pos = self._io:pos()
  self._io:seek((self.ofs_user_sid - 8))
  self._m_user_sid = self._io:read_bytes(self.len_user_sid)
  self._io:seek(_pos)
  return self._m_user_sid
end

WindowsEvtLog.RecordBody.property.data = {}
function WindowsEvtLog.RecordBody.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _pos = self._io:pos()
  self._io:seek((self.ofs_data - 8))
  self._m_data = self._io:read_bytes(self.len_data)
  self._io:seek(_pos)
  return self._m_data
end

-- 
-- Index of record in the file.
-- 
-- Time when this record was generated, POSIX timestamp format.
-- 
-- Time when thsi record was written into the log file, POSIX timestamp format.
-- 
-- Identifier of an event, meaning is specific to particular
-- source of events / event type.
-- 
-- Type of event.
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/eventlog/event-types)
-- 
-- Number of strings present in the log.
-- 
-- See also: Source (https://docs.microsoft.com/en-us/windows/win32/eventlog/event-categories)
-- 
-- Offset of strings present in the log.

-- 
-- See also: Source (http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record)
WindowsEvtLog.CursorRecordBody = class.class(KaitaiStruct)

function WindowsEvtLog.CursorRecordBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsEvtLog.CursorRecordBody:_read()
  self.magic = self._io:read_bytes(12)
  if not(self.magic == "\034\034\034\034\051\051\051\051\068\068\068\068") then
    error("not equal, expected " ..  "\034\034\034\034\051\051\051\051\068\068\068\068" .. ", but got " .. self.magic)
  end
  self.ofs_first_record = self._io:read_u4le()
  self.ofs_next_record = self._io:read_u4le()
  self.idx_next_record = self._io:read_u4le()
  self.idx_first_record = self._io:read_u4le()
end


