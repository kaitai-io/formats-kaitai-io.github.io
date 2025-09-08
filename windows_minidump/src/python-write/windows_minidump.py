# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsMinidump(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(WindowsMinidump, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_streams = False
        self.streams__enabled = True

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
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.streams
        if hasattr(self, '_m_streams'):
            pass
            for i in range(len(self._m_streams)):
                pass
                self._m_streams[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(WindowsMinidump, self)._write__seq(io)
        self._should_write_streams = self.streams__enabled
        self._io.write_bytes(self.magic1)
        self._io.write_bytes(self.magic2)
        self._io.write_u2le(self.version)
        self._io.write_u4le(self.num_streams)
        self._io.write_u4le(self.ofs_streams)
        self._io.write_u4le(self.checksum)
        self._io.write_u4le(self.timestamp)
        self._io.write_u8le(self.flags)


    def _check(self):
        if len(self.magic1) != 4:
            raise kaitaistruct.ConsistencyError(u"magic1", 4, len(self.magic1))
        if not self.magic1 == b"\x4D\x44\x4D\x50":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x44\x4D\x50", self.magic1, None, u"/seq/0")
        if len(self.magic2) != 2:
            raise kaitaistruct.ConsistencyError(u"magic2", 2, len(self.magic2))
        if not self.magic2 == b"\x93\xA7":
            raise kaitaistruct.ValidationNotEqualError(b"\x93\xA7", self.magic2, None, u"/seq/1")
        if self.streams__enabled:
            pass
            if len(self._m_streams) != self.num_streams:
                raise kaitaistruct.ConsistencyError(u"streams", self.num_streams, len(self._m_streams))
            for i in range(len(self._m_streams)):
                pass
                if self._m_streams[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"streams", self._root, self._m_streams[i]._root)
                if self._m_streams[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"streams", self, self._m_streams[i]._parent)


        self._dirty = False

    class Dir(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.Dir, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_data = False
            self.data__enabled = True

        def _read(self):
            self.stream_type = KaitaiStream.resolve_enum(WindowsMinidump.StreamTypes, self._io.read_u4le())
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()
            self._dirty = False


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



        def _write__seq(self, io=None):
            super(WindowsMinidump.Dir, self)._write__seq(io)
            self._should_write_data = self.data__enabled
            self._io.write_u4le(int(self.stream_type))
            self._io.write_u4le(self.len_data)
            self._io.write_u4le(self.ofs_data)


        def _check(self):
            if self.data__enabled:
                pass
                _on = self.stream_type
                if _on == WindowsMinidump.StreamTypes.exception:
                    pass
                    if self._m_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                    if self._m_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                elif _on == WindowsMinidump.StreamTypes.memory_list:
                    pass
                    if self._m_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                    if self._m_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                elif _on == WindowsMinidump.StreamTypes.misc_info:
                    pass
                    if self._m_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                    if self._m_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                elif _on == WindowsMinidump.StreamTypes.system_info:
                    pass
                    if self._m_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                    if self._m_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                elif _on == WindowsMinidump.StreamTypes.thread_list:
                    pass
                    if self._m_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                    if self._m_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)
                else:
                    pass
                    if len(self._m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self._m_data))

            self._dirty = False

        @property
        def data(self):
            if self._should_write_data:
                self._write_data()
            if hasattr(self, '_m_data'):
                return self._m_data

            if not self.data__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_data)
            _on = self.stream_type
            if _on == WindowsMinidump.StreamTypes.exception:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.ExceptionStream(_io__raw__m_data, self, self._root)
                self._m_data._read()
            elif _on == WindowsMinidump.StreamTypes.memory_list:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.MemoryList(_io__raw__m_data, self, self._root)
                self._m_data._read()
            elif _on == WindowsMinidump.StreamTypes.misc_info:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.MiscInfo(_io__raw__m_data, self, self._root)
                self._m_data._read()
            elif _on == WindowsMinidump.StreamTypes.system_info:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.SystemInfo(_io__raw__m_data, self, self._root)
                self._m_data._read()
            elif _on == WindowsMinidump.StreamTypes.thread_list:
                pass
                self._raw__m_data = self._io.read_bytes(self.len_data)
                _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                self._m_data = WindowsMinidump.ThreadList(_io__raw__m_data, self, self._root)
                self._m_data._read()
            else:
                pass
                self._m_data = self._io.read_bytes(self.len_data)
            self._io.seek(_pos)
            return getattr(self, '_m_data', None)

        @data.setter
        def data(self, v):
            self._dirty = True
            self._m_data = v

        def _write_data(self):
            self._should_write_data = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_data)
            _on = self.stream_type
            if _on == WindowsMinidump.StreamTypes.exception:
                pass
                _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw__m_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw__m_data=_io__raw__m_data):
                    self._raw__m_data = _io__raw__m_data.to_byte_array()
                    if len(self._raw__m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw__m_data))
                    parent.write_bytes(self._raw__m_data)
                _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_data._write__seq(_io__raw__m_data)
            elif _on == WindowsMinidump.StreamTypes.memory_list:
                pass
                _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw__m_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw__m_data=_io__raw__m_data):
                    self._raw__m_data = _io__raw__m_data.to_byte_array()
                    if len(self._raw__m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw__m_data))
                    parent.write_bytes(self._raw__m_data)
                _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_data._write__seq(_io__raw__m_data)
            elif _on == WindowsMinidump.StreamTypes.misc_info:
                pass
                _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw__m_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw__m_data=_io__raw__m_data):
                    self._raw__m_data = _io__raw__m_data.to_byte_array()
                    if len(self._raw__m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw__m_data))
                    parent.write_bytes(self._raw__m_data)
                _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_data._write__seq(_io__raw__m_data)
            elif _on == WindowsMinidump.StreamTypes.system_info:
                pass
                _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw__m_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw__m_data=_io__raw__m_data):
                    self._raw__m_data = _io__raw__m_data.to_byte_array()
                    if len(self._raw__m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw__m_data))
                    parent.write_bytes(self._raw__m_data)
                _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_data._write__seq(_io__raw__m_data)
            elif _on == WindowsMinidump.StreamTypes.thread_list:
                pass
                _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw__m_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw__m_data=_io__raw__m_data):
                    self._raw__m_data = _io__raw__m_data.to_byte_array()
                    if len(self._raw__m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw__m_data))
                    parent.write_bytes(self._raw__m_data)
                _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_data._write__seq(_io__raw__m_data)
            else:
                pass
                self._io.write_bytes(self._m_data)
            self._io.seek(_pos)


    class ExceptionRecord(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.ExceptionRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.params)):
                pass



        def _write__seq(self, io=None):
            super(WindowsMinidump.ExceptionRecord, self)._write__seq(io)
            self._io.write_u4le(self.code)
            self._io.write_u4le(self.flags)
            self._io.write_u8le(self.inner_exception)
            self._io.write_u8le(self.addr)
            self._io.write_u4le(self.num_params)
            self._io.write_u4le(self.reserved)
            for i in range(len(self.params)):
                pass
                self._io.write_u8le(self.params[i])



        def _check(self):
            if len(self.params) != 15:
                raise kaitaistruct.ConsistencyError(u"params", 15, len(self.params))
            for i in range(len(self.params)):
                pass

            self._dirty = False


    class ExceptionStream(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.ExceptionStream, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.thread_id = self._io.read_u4le()
            self.reserved = self._io.read_u4le()
            self.exception_rec = WindowsMinidump.ExceptionRecord(self._io, self, self._root)
            self.exception_rec._read()
            self.thread_context = WindowsMinidump.LocationDescriptor(self._io, self, self._root)
            self.thread_context._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.exception_rec._fetch_instances()
            self.thread_context._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsMinidump.ExceptionStream, self)._write__seq(io)
            self._io.write_u4le(self.thread_id)
            self._io.write_u4le(self.reserved)
            self.exception_rec._write__seq(self._io)
            self.thread_context._write__seq(self._io)


        def _check(self):
            if self.exception_rec._root != self._root:
                raise kaitaistruct.ConsistencyError(u"exception_rec", self._root, self.exception_rec._root)
            if self.exception_rec._parent != self:
                raise kaitaistruct.ConsistencyError(u"exception_rec", self, self.exception_rec._parent)
            if self.thread_context._root != self._root:
                raise kaitaistruct.ConsistencyError(u"thread_context", self._root, self.thread_context._root)
            if self.thread_context._parent != self:
                raise kaitaistruct.ConsistencyError(u"thread_context", self, self.thread_context._parent)
            self._dirty = False


    class LocationDescriptor(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.LocationDescriptor, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_data = False
            self.data__enabled = True

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.data
            if hasattr(self, '_m_data'):
                pass



        def _write__seq(self, io=None):
            super(WindowsMinidump.LocationDescriptor, self)._write__seq(io)
            self._should_write_data = self.data__enabled
            self._io.write_u4le(self.len_data)
            self._io.write_u4le(self.ofs_data)


        def _check(self):
            if self.data__enabled:
                pass
                if len(self._m_data) != self.len_data:
                    raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self._m_data))

            self._dirty = False

        @property
        def data(self):
            if self._should_write_data:
                self._write_data()
            if hasattr(self, '_m_data'):
                return self._m_data

            if not self.data__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_data)
            self._m_data = io.read_bytes(self.len_data)
            io.seek(_pos)
            return getattr(self, '_m_data', None)

        @data.setter
        def data(self, v):
            self._dirty = True
            self._m_data = v

        def _write_data(self):
            self._should_write_data = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_data)
            io.write_bytes(self._m_data)
            io.seek(_pos)


    class MemoryDescriptor(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.MemoryDescriptor, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.addr_memory_range = self._io.read_u8le()
            self.memory = WindowsMinidump.LocationDescriptor(self._io, self, self._root)
            self.memory._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.memory._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsMinidump.MemoryDescriptor, self)._write__seq(io)
            self._io.write_u8le(self.addr_memory_range)
            self.memory._write__seq(self._io)


        def _check(self):
            if self.memory._root != self._root:
                raise kaitaistruct.ConsistencyError(u"memory", self._root, self.memory._root)
            if self.memory._parent != self:
                raise kaitaistruct.ConsistencyError(u"memory", self, self.memory._parent)
            self._dirty = False


    class MemoryList(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.MemoryList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_mem_ranges = self._io.read_u4le()
            self.mem_ranges = []
            for i in range(self.num_mem_ranges):
                _t_mem_ranges = WindowsMinidump.MemoryDescriptor(self._io, self, self._root)
                try:
                    _t_mem_ranges._read()
                finally:
                    self.mem_ranges.append(_t_mem_ranges)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.mem_ranges)):
                pass
                self.mem_ranges[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(WindowsMinidump.MemoryList, self)._write__seq(io)
            self._io.write_u4le(self.num_mem_ranges)
            for i in range(len(self.mem_ranges)):
                pass
                self.mem_ranges[i]._write__seq(self._io)



        def _check(self):
            if len(self.mem_ranges) != self.num_mem_ranges:
                raise kaitaistruct.ConsistencyError(u"mem_ranges", self.num_mem_ranges, len(self.mem_ranges))
            for i in range(len(self.mem_ranges)):
                pass
                if self.mem_ranges[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"mem_ranges", self._root, self.mem_ranges[i]._root)
                if self.mem_ranges[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"mem_ranges", self, self.mem_ranges[i]._parent)

            self._dirty = False


    class MinidumpString(ReadWriteKaitaiStruct):
        """Specific string serialization scheme used in MiniDump format is
        actually a simple 32-bit length-prefixed UTF-16 string.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.MinidumpString, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.len_str)).decode(u"UTF-16LE")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsMinidump.MinidumpString, self)._write__seq(io)
            self._io.write_u4le(self.len_str)
            self._io.write_bytes((self.str).encode(u"UTF-16LE"))


        def _check(self):
            if len((self.str).encode(u"UTF-16LE")) != self.len_str:
                raise kaitaistruct.ConsistencyError(u"str", self.len_str, len((self.str).encode(u"UTF-16LE")))
            self._dirty = False


    class MiscInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.MiscInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsMinidump.MiscInfo, self)._write__seq(io)
            self._io.write_u4le(self.len_info)
            self._io.write_u4le(self.flags1)
            self._io.write_u4le(self.process_id)
            self._io.write_u4le(self.process_create_time)
            self._io.write_u4le(self.process_user_time)
            self._io.write_u4le(self.process_kernel_time)
            self._io.write_u4le(self.cpu_max_mhz)
            self._io.write_u4le(self.cpu_cur_mhz)
            self._io.write_u4le(self.cpu_limit_mhz)
            self._io.write_u4le(self.cpu_max_idle_state)
            self._io.write_u4le(self.cpu_cur_idle_state)


        def _check(self):
            self._dirty = False


    class SystemInfo(ReadWriteKaitaiStruct):
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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.SystemInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_service_pack = False
            self.service_pack__enabled = True

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
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.service_pack
            if hasattr(self, '_m_service_pack'):
                pass
                self._m_service_pack._fetch_instances()



        def _write__seq(self, io=None):
            super(WindowsMinidump.SystemInfo, self)._write__seq(io)
            self._should_write_service_pack = self.service_pack__enabled
            self._io.write_u2le(int(self.cpu_arch))
            self._io.write_u2le(self.cpu_level)
            self._io.write_u2le(self.cpu_revision)
            self._io.write_u1(self.num_cpus)
            self._io.write_u1(self.os_type)
            self._io.write_u4le(self.os_ver_major)
            self._io.write_u4le(self.os_ver_minor)
            self._io.write_u4le(self.os_build)
            self._io.write_u4le(self.os_platform)
            self._io.write_u4le(self.ofs_service_pack)
            self._io.write_u2le(self.os_suite_mask)
            self._io.write_u2le(self.reserved2)


        def _check(self):
            if self.service_pack__enabled:
                pass
                if self.ofs_service_pack > 0:
                    pass
                    if self._m_service_pack._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"service_pack", self._root, self._m_service_pack._root)
                    if self._m_service_pack._parent != self:
                        raise kaitaistruct.ConsistencyError(u"service_pack", self, self._m_service_pack._parent)


            self._dirty = False

        @property
        def service_pack(self):
            if self._should_write_service_pack:
                self._write_service_pack()
            if hasattr(self, '_m_service_pack'):
                return self._m_service_pack

            if not self.service_pack__enabled:
                return None

            if self.ofs_service_pack > 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_service_pack)
                self._m_service_pack = WindowsMinidump.MinidumpString(io, self, self._root)
                self._m_service_pack._read()
                io.seek(_pos)

            return getattr(self, '_m_service_pack', None)

        @service_pack.setter
        def service_pack(self, v):
            self._dirty = True
            self._m_service_pack = v

        def _write_service_pack(self):
            self._should_write_service_pack = False
            if self.ofs_service_pack > 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_service_pack)
                self._m_service_pack._write__seq(io)
                io.seek(_pos)



    class Thread(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.Thread, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.thread_id = self._io.read_u4le()
            self.suspend_count = self._io.read_u4le()
            self.priority_class = self._io.read_u4le()
            self.priority = self._io.read_u4le()
            self.teb = self._io.read_u8le()
            self.stack = WindowsMinidump.MemoryDescriptor(self._io, self, self._root)
            self.stack._read()
            self.thread_context = WindowsMinidump.LocationDescriptor(self._io, self, self._root)
            self.thread_context._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.stack._fetch_instances()
            self.thread_context._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsMinidump.Thread, self)._write__seq(io)
            self._io.write_u4le(self.thread_id)
            self._io.write_u4le(self.suspend_count)
            self._io.write_u4le(self.priority_class)
            self._io.write_u4le(self.priority)
            self._io.write_u8le(self.teb)
            self.stack._write__seq(self._io)
            self.thread_context._write__seq(self._io)


        def _check(self):
            if self.stack._root != self._root:
                raise kaitaistruct.ConsistencyError(u"stack", self._root, self.stack._root)
            if self.stack._parent != self:
                raise kaitaistruct.ConsistencyError(u"stack", self, self.stack._parent)
            if self.thread_context._root != self._root:
                raise kaitaistruct.ConsistencyError(u"thread_context", self._root, self.thread_context._root)
            if self.thread_context._parent != self:
                raise kaitaistruct.ConsistencyError(u"thread_context", self, self.thread_context._parent)
            self._dirty = False


    class ThreadList(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsMinidump.ThreadList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_threads = self._io.read_u4le()
            self.threads = []
            for i in range(self.num_threads):
                _t_threads = WindowsMinidump.Thread(self._io, self, self._root)
                try:
                    _t_threads._read()
                finally:
                    self.threads.append(_t_threads)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.threads)):
                pass
                self.threads[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(WindowsMinidump.ThreadList, self)._write__seq(io)
            self._io.write_u4le(self.num_threads)
            for i in range(len(self.threads)):
                pass
                self.threads[i]._write__seq(self._io)



        def _check(self):
            if len(self.threads) != self.num_threads:
                raise kaitaistruct.ConsistencyError(u"threads", self.num_threads, len(self.threads))
            for i in range(len(self.threads)):
                pass
                if self.threads[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"threads", self._root, self.threads[i]._root)
                if self.threads[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"threads", self, self.threads[i]._parent)

            self._dirty = False


    @property
    def streams(self):
        if self._should_write_streams:
            self._write_streams()
        if hasattr(self, '_m_streams'):
            return self._m_streams

        if not self.streams__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_streams)
        self._m_streams = []
        for i in range(self.num_streams):
            _t__m_streams = WindowsMinidump.Dir(self._io, self, self._root)
            try:
                _t__m_streams._read()
            finally:
                self._m_streams.append(_t__m_streams)

        self._io.seek(_pos)
        return getattr(self, '_m_streams', None)

    @streams.setter
    def streams(self, v):
        self._dirty = True
        self._m_streams = v

    def _write_streams(self):
        self._should_write_streams = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_streams)
        for i in range(len(self._m_streams)):
            pass
            self._m_streams[i]._write__seq(self._io)

        self._io.seek(_pos)


