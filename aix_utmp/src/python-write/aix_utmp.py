# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AixUtmp(ReadWriteKaitaiStruct):
    """This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
    
    .. seealso::
       Source - https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file
    """

    class EntryType(IntEnum):
        empty = 0
        run_lvl = 1
        boot_time = 2
        old_time = 3
        new_time = 4
        init_process = 5
        login_process = 6
        user_process = 7
        dead_process = 8
        accounting = 9
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AixUtmp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = AixUtmp.Record(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AixUtmp, self)._write__seq(io)
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            self.records[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class ExitStatus(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AixUtmp.ExitStatus, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.termination_code = self._io.read_s2be()
            self.exit_code = self._io.read_s2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AixUtmp.ExitStatus, self)._write__seq(io)
            self._io.write_s2be(self.termination_code)
            self._io.write_s2be(self.exit_code)


        def _check(self):
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AixUtmp.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.user = (self._io.read_bytes(256)).decode(u"ASCII")
            self.inittab_id = (self._io.read_bytes(14)).decode(u"ASCII")
            self.device = (self._io.read_bytes(64)).decode(u"ASCII")
            self.pid = self._io.read_u8be()
            self.type = KaitaiStream.resolve_enum(AixUtmp.EntryType, self._io.read_s2be())
            self.timestamp = self._io.read_s8be()
            self.exit_status = AixUtmp.ExitStatus(self._io, self, self._root)
            self.exit_status._read()
            self.hostname = (self._io.read_bytes(256)).decode(u"ASCII")
            self.dbl_word_pad = self._io.read_s4be()
            self.reserved_a = self._io.read_bytes(8)
            self.reserved_v = self._io.read_bytes(24)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.exit_status._fetch_instances()


        def _write__seq(self, io=None):
            super(AixUtmp.Record, self)._write__seq(io)
            self._io.write_bytes((self.user).encode(u"ASCII"))
            self._io.write_bytes((self.inittab_id).encode(u"ASCII"))
            self._io.write_bytes((self.device).encode(u"ASCII"))
            self._io.write_u8be(self.pid)
            self._io.write_s2be(int(self.type))
            self._io.write_s8be(self.timestamp)
            self.exit_status._write__seq(self._io)
            self._io.write_bytes((self.hostname).encode(u"ASCII"))
            self._io.write_s4be(self.dbl_word_pad)
            self._io.write_bytes(self.reserved_a)
            self._io.write_bytes(self.reserved_v)


        def _check(self):
            if len((self.user).encode(u"ASCII")) != 256:
                raise kaitaistruct.ConsistencyError(u"user", 256, len((self.user).encode(u"ASCII")))
            if len((self.inittab_id).encode(u"ASCII")) != 14:
                raise kaitaistruct.ConsistencyError(u"inittab_id", 14, len((self.inittab_id).encode(u"ASCII")))
            if len((self.device).encode(u"ASCII")) != 64:
                raise kaitaistruct.ConsistencyError(u"device", 64, len((self.device).encode(u"ASCII")))
            if self.exit_status._root != self._root:
                raise kaitaistruct.ConsistencyError(u"exit_status", self._root, self.exit_status._root)
            if self.exit_status._parent != self:
                raise kaitaistruct.ConsistencyError(u"exit_status", self, self.exit_status._parent)
            if len((self.hostname).encode(u"ASCII")) != 256:
                raise kaitaistruct.ConsistencyError(u"hostname", 256, len((self.hostname).encode(u"ASCII")))
            if len(self.reserved_a) != 8:
                raise kaitaistruct.ConsistencyError(u"reserved_a", 8, len(self.reserved_a))
            if len(self.reserved_v) != 24:
                raise kaitaistruct.ConsistencyError(u"reserved_v", 24, len(self.reserved_v))
            self._dirty = False



