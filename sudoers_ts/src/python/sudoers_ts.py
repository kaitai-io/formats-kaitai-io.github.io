# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SudoersTs(KaitaiStruct):
    """This spec can be used to parse sudo time stamp files located in directories
    such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
    
    .. seealso::
       Source - https://www.sudo.ws/docs/man/1.8.27/sudoers_timestamp.man/
    """

    class TsType(IntEnum):
        global = 1
        tty = 2
        ppid = 3
        lockexcl = 4
    def __init__(self, _io, _parent=None, _root=None):
        super(SudoersTs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(SudoersTs.Record(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(SudoersTs.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.version = self._io.read_u2le()
            self.len_record = self._io.read_u2le()
            _on = self.version
            if _on == 1:
                pass
                self._raw_payload = self._io.read_bytes(self.len_record - 4)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = SudoersTs.RecordV1(_io__raw_payload, self, self._root)
            elif _on == 2:
                pass
                self._raw_payload = self._io.read_bytes(self.len_record - 4)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = SudoersTs.RecordV2(_io__raw_payload, self, self._root)
            else:
                pass
                self.payload = self._io.read_bytes(self.len_record - 4)


        def _fetch_instances(self):
            pass
            _on = self.version
            if _on == 1:
                pass
                self.payload._fetch_instances()
            elif _on == 2:
                pass
                self.payload._fetch_instances()
            else:
                pass


    class RecordV1(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(SudoersTs.RecordV1, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(SudoersTs.TsType, self._io.read_u2le())
            self.flags = SudoersTs.TsFlag(self._io, self, self._root)
            self.auth_uid = self._io.read_u4le()
            self.sid = self._io.read_u4le()
            self.ts = SudoersTs.Timespec(self._io, self, self._root)
            if self.type == SudoersTs.TsType.tty:
                pass
                self.ttydev = self._io.read_u4le()

            if self.type == SudoersTs.TsType.ppid:
                pass
                self.ppid = self._io.read_u4le()



        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.ts._fetch_instances()
            if self.type == SudoersTs.TsType.tty:
                pass

            if self.type == SudoersTs.TsType.ppid:
                pass



    class RecordV2(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(SudoersTs.RecordV2, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(SudoersTs.TsType, self._io.read_u2le())
            self.flags = SudoersTs.TsFlag(self._io, self, self._root)
            self.auth_uid = self._io.read_u4le()
            self.sid = self._io.read_u4le()
            self.start_time = SudoersTs.Timespec(self._io, self, self._root)
            self.ts = SudoersTs.Timespec(self._io, self, self._root)
            if self.type == SudoersTs.TsType.tty:
                pass
                self.ttydev = self._io.read_u4le()

            if self.type == SudoersTs.TsType.ppid:
                pass
                self.ppid = self._io.read_u4le()



        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.start_time._fetch_instances()
            self.ts._fetch_instances()
            if self.type == SudoersTs.TsType.tty:
                pass

            if self.type == SudoersTs.TsType.ppid:
                pass



    class Timespec(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(SudoersTs.Timespec, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.sec = self._io.read_s8le()
            self.nsec = self._io.read_s8le()


        def _fetch_instances(self):
            pass


    class TsFlag(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(SudoersTs.TsFlag, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved0 = self._io.read_bits_int_be(6)
            self.anyuid = self._io.read_bits_int_be(1) != 0
            self.disabled = self._io.read_bits_int_be(1) != 0
            self.reserved1 = self._io.read_bits_int_be(8)


        def _fetch_instances(self):
            pass



