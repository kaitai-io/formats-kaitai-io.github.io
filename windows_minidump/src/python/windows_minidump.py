# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsMinidump(KaitaiStruct):
    """Windows MiniDump (MDMP) file provides a concise way to store process
    core dumps, which is useful for debugging. Given its small size,
    modularity, some cross-platform features and native support in some
    debuggers, it is particularly useful for crash reporting, and is
    used for that purpose in Windows and Google Chrome projects.
    
    The file itself is a container, which contains a number of typed
    "streams", which contain some data according to its type attribute.
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header
    """

    class StreamTypes(IntEnum):
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
        token = 19
        java_script_data = 20
        system_memory_info = 21
        process_vm_counters = 22
        ipt_trace = 23
        thread_names = 24
        ce_null = 32768
        ce_system_info = 32769
        ce_exception = 32770
        ce_module_list = 32771
        ce_process_list = 32772
        ce_thread_list = 32773
        ce_thread_context_list = 32774
        ce_thread_call_stack_list = 32775
        ce_memory_virtual_list = 32776
        ce_memory_physical_list = 32777
        ce_bucket_parameters = 32778
        ce_process_module_map = 32779
        ce_diagnosis_list = 32780
        md_crashpad_info_stream = 1129316353
        md_raw_breakpad_info = 1197932545
        md_raw_assertion_info = 1197932546
        md_linux_cpu_info = 1197932547
        md_linux_proc_status = 1197932548
        md_linux_lsb_release = 1197932549
        md_linux_cmd_line = 1197932550
        md_linux_environ = 1197932551
        md_linux_auxv = 1197932552
        md_linux_maps = 1197932553
        md_linux_dso_debug = 1197932554
    def __init__(self, _io, _parent=None, _root=None):
        super(WindowsMinidump, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic1 = self._io.read_bytes(4)
        if not self.magic1 == b"\x4D\x44\x4D\x50":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x44\x4D\x50", self.magic1, self._io, u"/seq/0")
        self.magic2 = self._io.read_bytes(2)
        if not self.magic2 == b"\x93\xA7":
            raise kaitaistruct.ValidationNotEqualError(b"\x93\xA7", self.magic2, self._io, u"/seq/1")
        self.version = self._io.read_u2le()
        self.num_streams = self._io.read_u4le()
        self.ofs_streams = self._io.read_u4le()
        self.checksum = self._io.read_u4le()
        self.timestamp = self._io.read_u4le()
        self.flags = self._io.read_u8le()


    def _fetch_instances(self):
        pass
        _ = self.streams
        if hasattr(self, '_m_streams'):
            pass
            for i in range(len(self._m_streams)):
                pass
                self._m_streams[i]._fetch_instances()



    class Dir(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.Dir, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.stream_type = KaitaiStream.resolve_enum(WindowsMinidump.StreamTypes, self._io.read_u4le())
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.data
            if hasattr(self, '_m_data'):
                pass
                _on = self.stream_type
                if _on == WindowsMinidump.StreamTypes.exception:
                    pass
                    self._m_data._fetch_instances()
                elif _on == WindowsMinidump.StreamTypes.memory_list:
                    pass
                    self._m_data._fetch_instances()
                elif _on == WindowsMinidump.StreamTypes.misc_info:
                    pass
                    self._m_data._fetch_instances()
                elif _on == WindowsMinidump.StreamTypes.system_info:
                    pass
                    self._m_data._fetch_instances()
                elif _on == WindowsMinidump.StreamTypes.thread_list:
                    pass
                    self._m_data._fetch_instances()
                else:
                    pass


        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            _pos = self._io.pos()
            self._io.seek(self.ofs_data)
            _on = self.stream_type
            if _on == WindowsMinidump.StreamTypes.exception:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.ExceptionStream(_io__raw__m_data, self, self._root)
            elif _on == WindowsMinidump.StreamTypes.memory_list:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.MemoryList(_io__raw__m_data, self, self._root)
            elif _on == WindowsMinidump.StreamTypes.misc_info:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.MiscInfo(_io__raw__m_data, self, self._root)
            elif _on == WindowsMinidump.StreamTypes.system_info:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.SystemInfo(_io__raw__m_data, self, self._root)
            elif _on == WindowsMinidump.StreamTypes.thread_list:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.ThreadList(_io__raw__m_data, self, self._root)
            else:
                pass
                self._m_data = self._io.read_bytes(self.len_data)
            self._io.seek(_pos)
            return getattr(self, '_m_data', None)


    class ExceptionRecord(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.ExceptionRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.code = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.inner_exception = self._io.read_u8le()
            self.addr = self._io.read_u8le()
            self.num_params = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self.params = []
            for i in range(15):
                self.params.append(self._io.read_u8le())



        def _fetch_instances(self):
            pass
            for i in range(len(self.params)):
                pass



    class ExceptionStream(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.ExceptionStream, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.thread_id = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self.exception_rec = WindowsMinidump.ExceptionRecord(self._io, self, self._root)
            self.thread_context = WindowsMinidump.LocationDescriptor(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.exception_rec._fetch_instances()
            self.thread_context._fetch_instances()


    class LocationDescriptor(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.LocationDescriptor, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.data
            if hasattr(self, '_m_data'):
                pass


        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_data)
            self._m_data = io.read_bytes(self.len_data)
            io.seek(_pos)
            return getattr(self, '_m_data', None)


    class MemoryDescriptor(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.MemoryDescriptor, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.addr_memory_range = self._io.read_u8le()
            self.memory = WindowsMinidump.LocationDescriptor(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.memory._fetch_instances()


    class MemoryList(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.MemoryList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_mem_ranges = self._io.read_u4le()
            self.mem_ranges = []
            for i in range(self.num_mem_ranges):
                self.mem_ranges.append(WindowsMinidump.MemoryDescriptor(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.mem_ranges)):
                pass
                self.mem_ranges[i]._fetch_instances()



    class MinidumpString(KaitaiStruct):
        """Specific string serialization scheme used in MiniDump format is
        actually a simple 32-bit length-prefixed UTF-16 string.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.MinidumpString, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.len_str)).decode(u"UTF-16LE")


        def _fetch_instances(self):
            pass


    class MiscInfo(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.MiscInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
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


        def _fetch_instances(self):
            pass


    class SystemInfo(KaitaiStruct):
        """"System info" stream provides basic information about the
        hardware and operating system which produces this dump.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info
        """

        class CpuArchs(IntEnum):
            intel = 0
            arm = 5
            ia64 = 6
            amd64 = 9
            unknown = 65535
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.SystemInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.cpu_arch = KaitaiStream.resolve_enum(WindowsMinidump.SystemInfo.CpuArchs, self._io.read_u2le())
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


        def _fetch_instances(self):
            pass
            _ = self.service_pack
            if hasattr(self, '_m_service_pack'):
                pass
                self._m_service_pack._fetch_instances()


        @property
        def service_pack(self):
            if hasattr(self, '_m_service_pack'):
                return self._m_service_pack

            if self.ofs_service_pack > 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_service_pack)
                self._m_service_pack = WindowsMinidump.MinidumpString(io, self, self._root)
                io.seek(_pos)

            return getattr(self, '_m_service_pack', None)


    class Thread(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.Thread, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.thread_id = self._io.read_u4le()
            self.suspend_count = self._io.read_u4le()
            self.priority_class = self._io.read_u4le()
            self.priority = self._io.read_u4le()
            self.teb = self._io.read_u8le()
            self.stack = WindowsMinidump.MemoryDescriptor(self._io, self, self._root)
            self.thread_context = WindowsMinidump.LocationDescriptor(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.stack._fetch_instances()
            self.thread_context._fetch_instances()


    class ThreadList(KaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsMinidump.ThreadList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_threads = self._io.read_u4le()
            self.threads = []
            for i in range(self.num_threads):
                self.threads.append(WindowsMinidump.Thread(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.threads)):
                pass
                self.threads[i]._fetch_instances()



    @property
    def streams(self):
        if hasattr(self, '_m_streams'):
            return self._m_streams

        _pos = self._io.pos()
        self._io.seek(self.ofs_streams)
        self._m_streams = []
        for i in range(self.num_streams):
            self._m_streams.append(WindowsMinidump.Dir(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_streams', None)


