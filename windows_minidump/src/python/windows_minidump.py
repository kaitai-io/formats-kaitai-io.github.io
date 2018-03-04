# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class WindowsMinidump(KaitaiStruct):
    """Windows MiniDump (MDMP) file provides a concise way to store process
    core dumps, which is useful for debugging. Given its small size,
    modularity, some cross-platform features and native support in some
    debuggers, it is particularly useful for crash reporting, and is
    used for that purpose in Windows and Google Chrome projects.
    
    The file itself is a container, which contains a number of typed
    "streams", which contain some data according to its type attribute.
    
    .. seealso::
       Source - https://msdn.microsoft.com/en-us/library/ms680378(VS.85).aspx
    """

    class StreamTypes(Enum):
        unused = 0
        reserved_0 = 1
        reserved_1 = 2
        thread_list = 3
        module_list = 4
        memory_list = 5
        exception = 6
        system_info = 7
        thread_ex_list = 8
        memory_64_list = 9
        comment_a = 10
        comment_w = 11
        handle_data = 12
        function_table = 13
        unloaded_module_list = 14
        misc_info = 15
        memory_info_list = 16
        thread_info_list = 17
        handle_operation_list = 18
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic1 = self._io.ensure_fixed_contents(b"\x4D\x44\x4D\x50")
        self.magic2 = self._io.ensure_fixed_contents(b"\x93\xA7")
        self.version = self._io.read_u2le()
        self.num_streams = self._io.read_u4le()
        self.ofs_streams = self._io.read_u4le()
        self.checksum = self._io.read_u4le()
        self.timestamp = self._io.read_u4le()
        self.flags = self._io.read_u8le()

    class ThreadList(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680515(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.num_threads = self._io.read_u4le()
            self.threads = [None] * (self.num_threads)
            for i in range(self.num_threads):
                self.threads[i] = self._root.Thread(self._io, self, self._root)



    class LocationDescriptor(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680383(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()

        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_data)
            self._m_data = io.read_bytes(self.len_data)
            io.seek(_pos)
            return self._m_data


    class MinidumpString(KaitaiStruct):
        """Specific string serialization scheme used in MiniDump format is
        actually a simple 32-bit length-prefixed UTF-16 string.
        
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680395(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.len_str)).decode(u"UTF-16LE")


    class SystemInfo(KaitaiStruct):
        """"System info" stream provides basic information about the
        hardware and operating system which produces this dump.
        
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680396(v=vs.85).aspx
        """

        class CpuArchs(Enum):
            intel = 0
            arm = 5
            ia64 = 6
            amd64 = 9
            unknown = 65535
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.cpu_arch = self._root.SystemInfo.CpuArchs(self._io.read_u2le())
            self.cpu_level = self._io.read_u2le()
            self.cpu_revision = self._io.read_u2le()
            self.num_cpus = self._io.read_u1()
            self.os_type = self._io.read_u1()
            self.os_ver_major = self._io.read_u4le()
            self.os_ver_minor = self._io.read_u4le()
            self.os_build = self._io.read_u4le()
            self.os_platform = self._io.read_u4le()
            self.ofs_service_pack = self._io.read_u4le()
            self.os_suite_mask = self._io.read_u2le()
            self.reserved2 = self._io.read_u2le()

        @property
        def service_pack(self):
            if hasattr(self, '_m_service_pack'):
                return self._m_service_pack

            if self.ofs_service_pack > 0:
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_service_pack)
                self._m_service_pack = self._root.MinidumpString(io, self, self._root)
                io.seek(_pos)

            return self._m_service_pack


    class ExceptionRecord(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680367(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.code = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.inner_exception = self._io.read_u8le()
            self.addr = self._io.read_u8le()
            self.num_params = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self.params = [None] * (15)
            for i in range(15):
                self.params[i] = self._io.read_u8le()



    class MiscInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680389(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_info = self._io.read_u4le()
            self.flags1 = self._io.read_u4le()
            self.process_id = self._io.read_u4le()
            self.process_create_time = self._io.read_u4le()
            self.process_user_time = self._io.read_u4le()
            self.process_kernel_time = self._io.read_u4le()
            self.cpu_max_mhz = self._io.read_u4le()
            self.cpu_cur_mhz = self._io.read_u4le()
            self.cpu_limit_mhz = self._io.read_u4le()
            self.cpu_max_idle_state = self._io.read_u4le()
            self.cpu_cur_idle_state = self._io.read_u4le()


    class Dir(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680365(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.stream_type = self._root.StreamTypes(self._io.read_u4le())
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()

        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            _pos = self._io.pos()
            self._io.seek(self.ofs_data)
            _on = self.stream_type
            if _on == self._root.StreamTypes.misc_info:
                self._raw__m_data = self._io.read_bytes(self.len_data)
                io = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = self._root.MiscInfo(io, self, self._root)
            elif _on == self._root.StreamTypes.exception:
                self._raw__m_data = self._io.read_bytes(self.len_data)
                io = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = self._root.ExceptionStream(io, self, self._root)
            elif _on == self._root.StreamTypes.memory_list:
                self._raw__m_data = self._io.read_bytes(self.len_data)
                io = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = self._root.MemoryList(io, self, self._root)
            elif _on == self._root.StreamTypes.system_info:
                self._raw__m_data = self._io.read_bytes(self.len_data)
                io = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = self._root.SystemInfo(io, self, self._root)
            elif _on == self._root.StreamTypes.thread_list:
                self._raw__m_data = self._io.read_bytes(self.len_data)
                io = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = self._root.ThreadList(io, self, self._root)
            else:
                self._m_data = self._io.read_bytes(self.len_data)
            self._io.seek(_pos)
            return self._m_data


    class Thread(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680517(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.thread_id = self._io.read_u4le()
            self.suspend_count = self._io.read_u4le()
            self.priority_class = self._io.read_u4le()
            self.priority = self._io.read_u4le()
            self.teb = self._io.read_u8le()
            self.stack = self._root.MemoryDescriptor(self._io, self, self._root)
            self.thread_context = self._root.LocationDescriptor(self._io, self, self._root)


    class MemoryList(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680387(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.num_mem_ranges = self._io.read_u4le()
            self.mem_ranges = [None] * (self.num_mem_ranges)
            for i in range(self.num_mem_ranges):
                self.mem_ranges[i] = self._root.MemoryDescriptor(self._io, self, self._root)



    class MemoryDescriptor(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680384(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.addr_memory_range = self._io.read_u8le()
            self.memory = self._root.LocationDescriptor(self._io, self, self._root)


    class ExceptionStream(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms680368(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.thread_id = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self.exception_rec = self._root.ExceptionRecord(self._io, self, self._root)
            self.thread_context = self._root.LocationDescriptor(self._io, self, self._root)


    @property
    def streams(self):
        if hasattr(self, '_m_streams'):
            return self._m_streams

        _pos = self._io.pos()
        self._io.seek(self.ofs_streams)
        self._m_streams = [None] * (self.num_streams)
        for i in range(self.num_streams):
            self._m_streams[i] = self._root.Dir(self._io, self, self._root)

        self._io.seek(_pos)
        return self._m_streams


