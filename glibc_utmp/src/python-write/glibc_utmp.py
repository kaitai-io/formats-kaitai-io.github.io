# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GlibcUtmp(ReadWriteKaitaiStruct):

    class EntryType(IntEnum):
        empty = 0
        run_lvl = 1
        boot_time = 2
        new_time = 3
        old_time = 4
        init_process = 5
        login_process = 6
        user_process = 7
        dead_process = 8
        accounting = 9
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GlibcUtmp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self._raw_records = []
        self.records = []
        i = 0
        while not self._io.is_eof():
            self._raw_records.append(self._io.read_bytes(384))
            _io__raw_records = KaitaiStream(BytesIO(self._raw_records[-1]))
            _t_records = GlibcUtmp.Record(_io__raw_records, self, self._root)
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
        super(GlibcUtmp, self)._write__seq(io)
        self._raw_records = []
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            _io__raw_records = KaitaiStream(BytesIO(bytearray(384)))
            self._io.add_child_stream(_io__raw_records)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (384))
            def handler(parent, _io__raw_records=_io__raw_records, i=i):
                self._raw_records.append(_io__raw_records.to_byte_array())
                if len(self._raw_records[i]) != 384:
                    raise kaitaistruct.ConsistencyError(u"raw(records)", 384, len(self._raw_records[i]))
                parent.write_bytes(self._raw_records[i])
            _io__raw_records.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.records[i]._write__seq(_io__raw_records)

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

    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GlibcUtmp.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ut_type = KaitaiStream.resolve_enum(GlibcUtmp.EntryType, self._io.read_s4le())
            self.pid = self._io.read_s4le()
            self.line = (self._io.read_bytes(32)).decode(u"UTF-8")
            self.id = (self._io.read_bytes(4)).decode(u"UTF-8")
            self.user = (self._io.read_bytes(32)).decode(u"UTF-8")
            self.host = (self._io.read_bytes(256)).decode(u"UTF-8")
            self.exit = self._io.read_u4le()
            self.session = self._io.read_s4le()
            self.tv = GlibcUtmp.Timeval(self._io, self, self._root)
            self.tv._read()
            self.addr_v6 = self._io.read_bytes(16)
            self.reserved = self._io.read_bytes(20)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.tv._fetch_instances()


        def _write__seq(self, io=None):
            super(GlibcUtmp.Record, self)._write__seq(io)
            self._io.write_s4le(int(self.ut_type))
            self._io.write_s4le(self.pid)
            self._io.write_bytes((self.line).encode(u"UTF-8"))
            self._io.write_bytes((self.id).encode(u"UTF-8"))
            self._io.write_bytes((self.user).encode(u"UTF-8"))
            self._io.write_bytes((self.host).encode(u"UTF-8"))
            self._io.write_u4le(self.exit)
            self._io.write_s4le(self.session)
            self.tv._write__seq(self._io)
            self._io.write_bytes(self.addr_v6)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len((self.line).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"line", 32, len((self.line).encode(u"UTF-8")))
            if len((self.id).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"id", 4, len((self.id).encode(u"UTF-8")))
            if len((self.user).encode(u"UTF-8")) != 32:
                raise kaitaistruct.ConsistencyError(u"user", 32, len((self.user).encode(u"UTF-8")))
            if len((self.host).encode(u"UTF-8")) != 256:
                raise kaitaistruct.ConsistencyError(u"host", 256, len((self.host).encode(u"UTF-8")))
            if self.tv._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tv", self._root, self.tv._root)
            if self.tv._parent != self:
                raise kaitaistruct.ConsistencyError(u"tv", self, self.tv._parent)
            if len(self.addr_v6) != 16:
                raise kaitaistruct.ConsistencyError(u"addr_v6", 16, len(self.addr_v6))
            if len(self.reserved) != 20:
                raise kaitaistruct.ConsistencyError(u"reserved", 20, len(self.reserved))
            self._dirty = False


    class Timeval(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GlibcUtmp.Timeval, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sec = self._io.read_u4le()
            self.usec = self._io.read_s4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GlibcUtmp.Timeval, self)._write__seq(io)
            self._io.write_u4le(self.sec)
            self._io.write_s4le(self.usec)


        def _check(self):
            self._dirty = False



