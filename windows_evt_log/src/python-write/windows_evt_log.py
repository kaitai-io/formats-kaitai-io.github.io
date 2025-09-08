# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsEvtLog(ReadWriteKaitaiStruct):
    """EVT files are Windows Event Log files written by older Windows
    operating systems (2000, XP, 2003). They are used as binary log
    files by several major Windows subsystems and
    applications. Typically, several of them can be found in
    `%WINDIR%\system32\config` directory:
    
    * Application = `AppEvent.evt`
    * System = `SysEvent.evt`
    * Security = `SecEvent.evt`
    
    Alternatively, one can export any system event log as distinct .evt
    file using relevant option in Event Viewer application.
    
    A Windows application can submit an entry into these logs using
    [ReportEventA](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
    function of Windows API.
    
    Internally, EVT files consist of a fixed-size header and event
    records. There are several usage scenarios (non-wrapping vs wrapping
    log files) which result in slightly different organization of
    records.
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(WindowsEvtLog, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = WindowsEvtLog.Header(self._io, self, self._root)
        self.header._read()
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = WindowsEvtLog.Record(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(WindowsEvtLog, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            self.records[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class CursorRecordBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://forensics.wiki/windows_event_log_(evt)/#cursor-record
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsEvtLog.CursorRecordBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(12)
            if not self.magic == b"\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44":
                raise kaitaistruct.ValidationNotEqualError(b"\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44", self.magic, self._io, u"/types/cursor_record_body/seq/0")
            self.ofs_first_record = self._io.read_u4le()
            self.ofs_next_record = self._io.read_u4le()
            self.idx_next_record = self._io.read_u4le()
            self.idx_first_record = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsEvtLog.CursorRecordBody, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.ofs_first_record)
            self._io.write_u4le(self.ofs_next_record)
            self._io.write_u4le(self.idx_next_record)
            self._io.write_u4le(self.idx_first_record)


        def _check(self):
            if len(self.magic) != 12:
                raise kaitaistruct.ConsistencyError(u"magic", 12, len(self.magic))
            if not self.magic == b"\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44":
                raise kaitaistruct.ValidationNotEqualError(b"\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44", self.magic, None, u"/types/cursor_record_body/seq/0")
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85)
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsEvtLog.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_header = self._io.read_u4le()
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x4C\x66\x4C\x65":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x66\x4C\x65", self.magic, self._io, u"/types/header/seq/1")
            self.version_major = self._io.read_u4le()
            self.version_minor = self._io.read_u4le()
            self.ofs_start = self._io.read_u4le()
            self.ofs_end = self._io.read_u4le()
            self.cur_rec_idx = self._io.read_u4le()
            self.oldest_rec_idx = self._io.read_u4le()
            self.len_file_max = self._io.read_u4le()
            self.flags = WindowsEvtLog.Header.Flags(self._io, self, self._root)
            self.flags._read()
            self.retention = self._io.read_u4le()
            self.len_header_2 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsEvtLog.Header, self)._write__seq(io)
            self._io.write_u4le(self.len_header)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.version_major)
            self._io.write_u4le(self.version_minor)
            self._io.write_u4le(self.ofs_start)
            self._io.write_u4le(self.ofs_end)
            self._io.write_u4le(self.cur_rec_idx)
            self._io.write_u4le(self.oldest_rec_idx)
            self._io.write_u4le(self.len_file_max)
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.retention)
            self._io.write_u4le(self.len_header_2)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x4C\x66\x4C\x65":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x66\x4C\x65", self.magic, None, u"/types/header/seq/1")
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            self._dirty = False

        class Flags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(WindowsEvtLog.Header.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_bits_int_be(28)
                self.archive = self._io.read_bits_int_be(1) != 0
                self.log_full = self._io.read_bits_int_be(1) != 0
                self.wrap = self._io.read_bits_int_be(1) != 0
                self.dirty = self._io.read_bits_int_be(1) != 0
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(WindowsEvtLog.Header.Flags, self)._write__seq(io)
                self._io.write_bits_int_be(28, self.reserved)
                self._io.write_bits_int_be(1, int(self.archive))
                self._io.write_bits_int_be(1, int(self.log_full))
                self._io.write_bits_int_be(1, int(self.wrap))
                self._io.write_bits_int_be(1, int(self.dirty))


            def _check(self):
                self._dirty = False



    class Record(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsEvtLog.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_record = self._io.read_u4le()
            self.type = self._io.read_u4le()
            _on = self.type
            if _on == 1699505740:
                pass
                self._raw_body = self._io.read_bytes(self.len_record - 12)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = WindowsEvtLog.RecordBody(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == 286331153:
                pass
                self._raw_body = self._io.read_bytes(self.len_record - 12)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = WindowsEvtLog.CursorRecordBody(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len_record - 12)
            self.len_record2 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == 1699505740:
                pass
                self.body._fetch_instances()
            elif _on == 286331153:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(WindowsEvtLog.Record, self)._write__seq(io)
            self._io.write_u4le(self.len_record)
            self._io.write_u4le(self.type)
            _on = self.type
            if _on == 1699505740:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_record - 12)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_record - 12))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_record - 12:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_record - 12, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == 286331153:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_record - 12)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_record - 12))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_record - 12:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_record - 12, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)
            self._io.write_u4le(self.len_record2)


        def _check(self):
            _on = self.type
            if _on == 1699505740:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 286331153:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len_record - 12:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_record - 12, len(self.body))
            self._dirty = False


    class RecordBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord
        """

        class EventTypes(IntEnum):
            error = 1
            audit_failure = 2
            audit_success = 3
            info = 4
            warning = 5
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsEvtLog.RecordBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_data = False
            self.data__enabled = True
            self._should_write_user_sid = False
            self.user_sid__enabled = True

        def _read(self):
            self.idx = self._io.read_u4le()
            self.time_generated = self._io.read_u4le()
            self.time_written = self._io.read_u4le()
            self.event_id = self._io.read_u4le()
            self.event_type = KaitaiStream.resolve_enum(WindowsEvtLog.RecordBody.EventTypes, self._io.read_u2le())
            self.num_strings = self._io.read_u2le()
            self.event_category = self._io.read_u2le()
            self.reserved = self._io.read_bytes(6)
            self.ofs_strings = self._io.read_u4le()
            self.len_user_sid = self._io.read_u4le()
            self.ofs_user_sid = self._io.read_u4le()
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.data
            if hasattr(self, '_m_data'):
                pass

            _ = self.user_sid
            if hasattr(self, '_m_user_sid'):
                pass



        def _write__seq(self, io=None):
            super(WindowsEvtLog.RecordBody, self)._write__seq(io)
            self._should_write_data = self.data__enabled
            self._should_write_user_sid = self.user_sid__enabled
            self._io.write_u4le(self.idx)
            self._io.write_u4le(self.time_generated)
            self._io.write_u4le(self.time_written)
            self._io.write_u4le(self.event_id)
            self._io.write_u2le(int(self.event_type))
            self._io.write_u2le(self.num_strings)
            self._io.write_u2le(self.event_category)
            self._io.write_bytes(self.reserved)
            self._io.write_u4le(self.ofs_strings)
            self._io.write_u4le(self.len_user_sid)
            self._io.write_u4le(self.ofs_user_sid)
            self._io.write_u4le(self.len_data)
            self._io.write_u4le(self.ofs_data)


        def _check(self):
            if len(self.reserved) != 6:
                raise kaitaistruct.ConsistencyError(u"reserved", 6, len(self.reserved))
            if self.data__enabled:
                pass
                if len(self._m_data) != self.len_data:
                    raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self._m_data))

            if self.user_sid__enabled:
                pass
                if len(self._m_user_sid) != self.len_user_sid:
                    raise kaitaistruct.ConsistencyError(u"user_sid", self.len_user_sid, len(self._m_user_sid))

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
            self._io.seek(self.ofs_data - 8)
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
            self._io.seek(self.ofs_data - 8)
            self._io.write_bytes(self._m_data)
            self._io.seek(_pos)

        @property
        def user_sid(self):
            if self._should_write_user_sid:
                self._write_user_sid()
            if hasattr(self, '_m_user_sid'):
                return self._m_user_sid

            if not self.user_sid__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_user_sid - 8)
            self._m_user_sid = self._io.read_bytes(self.len_user_sid)
            self._io.seek(_pos)
            return getattr(self, '_m_user_sid', None)

        @user_sid.setter
        def user_sid(self, v):
            self._dirty = True
            self._m_user_sid = v

        def _write_user_sid(self):
            self._should_write_user_sid = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_user_sid - 8)
            self._io.write_bytes(self._m_user_sid)
            self._io.seek(_pos)



