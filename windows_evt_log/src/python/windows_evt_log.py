# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class WindowsEvtLog(KaitaiStruct):
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
    [ReportEvent](https://msdn.microsoft.com/en-us/library/aa363679(v=vs.85).aspx)
    function of Windows API.
    
    Internally, EVT files consist of a fixed-size header and event
    records. There are several usage scenarios (non-wrapping vs wrapping
    log files) which result in slightly different organization of
    records.
    
    .. seealso::
       Source - https://msdn.microsoft.com/en-us/library/bb309026(v=vs.85).aspx
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.Header(self._io, self, self._root)
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(self._root.Record(self._io, self, self._root))
            i += 1


    class Header(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/bb309024(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_header = self._io.read_u4le()
            self.magic = self._io.ensure_fixed_contents(b"\x4C\x66\x4C\x65")
            self.version_major = self._io.read_u4le()
            self.version_minor = self._io.read_u4le()
            self.ofs_start = self._io.read_u4le()
            self.ofs_end = self._io.read_u4le()
            self.cur_rec_idx = self._io.read_u4le()
            self.oldest_rec_idx = self._io.read_u4le()
            self.len_file_max = self._io.read_u4le()
            self.flags = self._root.Header.Flags(self._io, self, self._root)
            self.retention = self._io.read_u4le()
            self.len_header_2 = self._io.read_u4le()

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_bits_int(28)
                self.archive = self._io.read_bits_int(1) != 0
                self.log_full = self._io.read_bits_int(1) != 0
                self.wrap = self._io.read_bits_int(1) != 0
                self.dirty = self._io.read_bits_int(1) != 0



    class Record(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_record = self._io.read_u4le()
            self.type = self._io.read_u4le()
            _on = self.type
            if _on == 1699505740:
                self._raw_body = self._io.read_bytes((self.len_record - 12))
                io = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.RecordBody(io, self, self._root)
            elif _on == 286331153:
                self._raw_body = self._io.read_bytes((self.len_record - 12))
                io = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.CursorRecordBody(io, self, self._root)
            else:
                self.body = self._io.read_bytes((self.len_record - 12))
            self.len_record2 = self._io.read_u4le()


    class RecordBody(KaitaiStruct):
        """
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx
        """

        class EventTypes(Enum):
            error = 1
            audit_failure = 2
            audit_success = 3
            info = 4
            warning = 5
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.idx = self._io.read_u4le()
            self.time_generated = self._io.read_u4le()
            self.time_written = self._io.read_u4le()
            self.event_id = self._io.read_u4le()
            self.event_type = self._root.RecordBody.EventTypes(self._io.read_u2le())
            self.num_strings = self._io.read_u2le()
            self.event_category = self._io.read_u2le()
            self.reserved = self._io.read_bytes(6)
            self.ofs_strings = self._io.read_u4le()
            self.len_user_sid = self._io.read_u4le()
            self.ofs_user_sid = self._io.read_u4le()
            self.len_data = self._io.read_u4le()
            self.ofs_data = self._io.read_u4le()

        @property
        def user_sid(self):
            if hasattr(self, '_m_user_sid'):
                return self._m_user_sid

            _pos = self._io.pos()
            self._io.seek((self.ofs_user_sid - 8))
            self._m_user_sid = self._io.read_bytes(self.len_user_sid)
            self._io.seek(_pos)
            return self._m_user_sid

        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            _pos = self._io.pos()
            self._io.seek((self.ofs_data - 8))
            self._m_data = self._io.read_bytes(self.len_data)
            self._io.seek(_pos)
            return self._m_data


    class CursorRecordBody(KaitaiStruct):
        """
        .. seealso::
           Source - http://www.forensicswiki.org/wiki/Windows_Event_Log_(EVT)#Cursor_Record
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x22\x22\x22\x22\x33\x33\x33\x33\x44\x44\x44\x44")
            self.ofs_first_record = self._io.read_u4le()
            self.ofs_next_record = self._io.read_u4le()
            self.idx_next_record = self._io.read_u4le()
            self.idx_first_record = self._io.read_u4le()



