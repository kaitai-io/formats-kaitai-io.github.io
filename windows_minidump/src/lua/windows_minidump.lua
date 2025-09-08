-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Windows MiniDump (MDMP) file provides a concise way to store process
-- core dumps, which is useful for debugging. Given its small size,
-- modularity, some cross-platform features and native support in some
-- debuggers, it is particularly useful for crash reporting, and is
-- used for that purpose in Windows and Google Chrome projects.
-- 
-- The file itself is a container, which contains a number of typed
-- "streams", which contain some data according to its type attribute.
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header)
WindowsMinidump = class.class(KaitaiStruct)

WindowsMinidump.StreamTypes = enum.Enum {
  unused = 0,
  reserved_0 = 1,
  reserved_1 = 2,
  thread_list = 3,
  module_list = 4,
  memory_list = 5,
  exception = 6,
  system_info = 7,
  thread_ex_list = 8,
  memory_64_list = 9,
  comment_a = 10,
  comment_w = 11,
  handle_data = 12,
  function_table = 13,
  unloaded_module_list = 14,
  misc_info = 15,
  memory_info_list = 16,
  thread_info_list = 17,
  handle_operation_list = 18,
  token = 19,
  java_script_data = 20,
  system_memory_info = 21,
  process_vm_counters = 22,
  ipt_trace = 23,
  thread_names = 24,
  ce_null = 32768,
  ce_system_info = 32769,
  ce_exception = 32770,
  ce_module_list = 32771,
  ce_process_list = 32772,
  ce_thread_list = 32773,
  ce_thread_context_list = 32774,
  ce_thread_call_stack_list = 32775,
  ce_memory_virtual_list = 32776,
  ce_memory_physical_list = 32777,
  ce_bucket_parameters = 32778,
  ce_process_module_map = 32779,
  ce_diagnosis_list = 32780,
  md_crashpad_info_stream = 1129316353,
  md_raw_breakpad_info = 1197932545,
  md_raw_assertion_info = 1197932546,
  md_linux_cpu_info = 1197932547,
  md_linux_proc_status = 1197932548,
  md_linux_lsb_release = 1197932549,
  md_linux_cmd_line = 1197932550,
  md_linux_environ = 1197932551,
  md_linux_auxv = 1197932552,
  md_linux_maps = 1197932553,
  md_linux_dso_debug = 1197932554,
}

function WindowsMinidump:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function WindowsMinidump:_read()
  self.magic1 = self._io:read_bytes(4)
  if not(self.magic1 == "\077\068\077\080") then
    error("not equal, expected " .. "\077\068\077\080" .. ", but got " .. self.magic1)
  end
  self.magic2 = self._io:read_bytes(2)
  if not(self.magic2 == "\147\167") then
    error("not equal, expected " .. "\147\167" .. ", but got " .. self.magic2)
  end
  self.version = self._io:read_u2le()
  self.num_streams = self._io:read_u4le()
  self.ofs_streams = self._io:read_u4le()
  self.checksum = self._io:read_u4le()
  self.timestamp = self._io:read_u4le()
  self.flags = self._io:read_u8le()
end

WindowsMinidump.property.streams = {}
function WindowsMinidump.property.streams:get()
  if self._m_streams ~= nil then
    return self._m_streams
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_streams)
  self._m_streams = {}
  for i = 0, self.num_streams - 1 do
    self._m_streams[i + 1] = WindowsMinidump.Dir(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_streams
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory)
WindowsMinidump.Dir = class.class(KaitaiStruct)

function WindowsMinidump.Dir:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.Dir:_read()
  self.stream_type = WindowsMinidump.StreamTypes(self._io:read_u4le())
  self.len_data = self._io:read_u4le()
  self.ofs_data = self._io:read_u4le()
end

WindowsMinidump.Dir.property.data = {}
function WindowsMinidump.Dir.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_data)
  local _on = self.stream_type
  if _on == WindowsMinidump.StreamTypes.exception then
    self._raw__m_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = WindowsMinidump.ExceptionStream(_io, self, self._root)
  elseif _on == WindowsMinidump.StreamTypes.memory_list then
    self._raw__m_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = WindowsMinidump.MemoryList(_io, self, self._root)
  elseif _on == WindowsMinidump.StreamTypes.misc_info then
    self._raw__m_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = WindowsMinidump.MiscInfo(_io, self, self._root)
  elseif _on == WindowsMinidump.StreamTypes.system_info then
    self._raw__m_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = WindowsMinidump.SystemInfo(_io, self, self._root)
  elseif _on == WindowsMinidump.StreamTypes.thread_list then
    self._raw__m_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = WindowsMinidump.ThreadList(_io, self, self._root)
  else
    self._m_data = self._io:read_bytes(self.len_data)
  end
  self._io:seek(_pos)
  return self._m_data
end

-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor)

-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception)
WindowsMinidump.ExceptionRecord = class.class(KaitaiStruct)

function WindowsMinidump.ExceptionRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.ExceptionRecord:_read()
  self.code = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.inner_exception = self._io:read_u8le()
  self.addr = self._io:read_u8le()
  self.num_params = self._io:read_u4le()
  self.reserved = self._io:read_u4le()
  self.params = {}
  for i = 0, 15 - 1 do
    self.params[i + 1] = self._io:read_u8le()
  end
end

-- 
-- Memory address where exception has occurred.
-- 
-- Additional parameters passed along with exception raise
-- function (for WinAPI, that is `RaiseException`). Meaning is
-- exception-specific. Given that this type is originally
-- defined by a C structure, it is described there as array of
-- fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
-- 15), but in reality only first `num_params` would be used.

-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream)
WindowsMinidump.ExceptionStream = class.class(KaitaiStruct)

function WindowsMinidump.ExceptionStream:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.ExceptionStream:_read()
  self.thread_id = self._io:read_u4le()
  self.reserved = self._io:read_u4le()
  self.exception_rec = WindowsMinidump.ExceptionRecord(self._io, self, self._root)
  self.thread_context = WindowsMinidump.LocationDescriptor(self._io, self, self._root)
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor)
WindowsMinidump.LocationDescriptor = class.class(KaitaiStruct)

function WindowsMinidump.LocationDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.LocationDescriptor:_read()
  self.len_data = self._io:read_u4le()
  self.ofs_data = self._io:read_u4le()
end

WindowsMinidump.LocationDescriptor.property.data = {}
function WindowsMinidump.LocationDescriptor.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_data)
  self._m_data = _io:read_bytes(self.len_data)
  _io:seek(_pos)
  return self._m_data
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor)
WindowsMinidump.MemoryDescriptor = class.class(KaitaiStruct)

function WindowsMinidump.MemoryDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.MemoryDescriptor:_read()
  self.addr_memory_range = self._io:read_u8le()
  self.memory = WindowsMinidump.LocationDescriptor(self._io, self, self._root)
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list)
WindowsMinidump.MemoryList = class.class(KaitaiStruct)

function WindowsMinidump.MemoryList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.MemoryList:_read()
  self.num_mem_ranges = self._io:read_u4le()
  self.mem_ranges = {}
  for i = 0, self.num_mem_ranges - 1 do
    self.mem_ranges[i + 1] = WindowsMinidump.MemoryDescriptor(self._io, self, self._root)
  end
end


-- 
-- Specific string serialization scheme used in MiniDump format is
-- actually a simple 32-bit length-prefixed UTF-16 string.
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string)
WindowsMinidump.MinidumpString = class.class(KaitaiStruct)

function WindowsMinidump.MinidumpString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.MinidumpString:_read()
  self.len_str = self._io:read_u4le()
  self.str = str_decode.decode(self._io:read_bytes(self.len_str), "UTF-16LE")
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info)
WindowsMinidump.MiscInfo = class.class(KaitaiStruct)

function WindowsMinidump.MiscInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.MiscInfo:_read()
  self.len_info = self._io:read_u4le()
  self.flags1 = self._io:read_u4le()
  self.process_id = self._io:read_u4le()
  self.process_create_time = self._io:read_u4le()
  self.process_user_time = self._io:read_u4le()
  self.process_kernel_time = self._io:read_u4le()
  self.cpu_max_mhz = self._io:read_u4le()
  self.cpu_cur_mhz = self._io:read_u4le()
  self.cpu_limit_mhz = self._io:read_u4le()
  self.cpu_max_idle_state = self._io:read_u4le()
  self.cpu_cur_idle_state = self._io:read_u4le()
end


-- 
-- "System info" stream provides basic information about the
-- hardware and operating system which produces this dump.
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info)
WindowsMinidump.SystemInfo = class.class(KaitaiStruct)

WindowsMinidump.SystemInfo.CpuArchs = enum.Enum {
  intel = 0,
  arm = 5,
  ia64 = 6,
  amd64 = 9,
  unknown = 65535,
}

function WindowsMinidump.SystemInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.SystemInfo:_read()
  self.cpu_arch = WindowsMinidump.SystemInfo.CpuArchs(self._io:read_u2le())
  self.cpu_level = self._io:read_u2le()
  self.cpu_revision = self._io:read_u2le()
  self.num_cpus = self._io:read_u1()
  self.os_type = self._io:read_u1()
  self.os_ver_major = self._io:read_u4le()
  self.os_ver_minor = self._io:read_u4le()
  self.os_build = self._io:read_u4le()
  self.os_platform = self._io:read_u4le()
  self.ofs_service_pack = self._io:read_u4le()
  self.os_suite_mask = self._io:read_u2le()
  self.reserved2 = self._io:read_u2le()
end

WindowsMinidump.SystemInfo.property.service_pack = {}
function WindowsMinidump.SystemInfo.property.service_pack:get()
  if self._m_service_pack ~= nil then
    return self._m_service_pack
  end

  if self.ofs_service_pack > 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_service_pack)
    self._m_service_pack = WindowsMinidump.MinidumpString(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_service_pack
end


-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread)
WindowsMinidump.Thread = class.class(KaitaiStruct)

function WindowsMinidump.Thread:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.Thread:_read()
  self.thread_id = self._io:read_u4le()
  self.suspend_count = self._io:read_u4le()
  self.priority_class = self._io:read_u4le()
  self.priority = self._io:read_u4le()
  self.teb = self._io:read_u8le()
  self.stack = WindowsMinidump.MemoryDescriptor(self._io, self, self._root)
  self.thread_context = WindowsMinidump.LocationDescriptor(self._io, self, self._root)
end

-- 
-- Thread Environment Block.

-- 
-- See also: Source (https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list)
WindowsMinidump.ThreadList = class.class(KaitaiStruct)

function WindowsMinidump.ThreadList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function WindowsMinidump.ThreadList:_read()
  self.num_threads = self._io:read_u4le()
  self.threads = {}
  for i = 0, self.num_threads - 1 do
    self.threads[i + 1] = WindowsMinidump.Thread(self._io, self, self._root)
  end
end


