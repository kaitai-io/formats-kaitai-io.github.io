# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SudoersTs(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SudoersTs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = SudoersTs.Record(self._io, self, self._root)
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
        super(SudoersTs, self)._write__seq(io)
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

    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SudoersTs.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u2le()
            self.len_record = self._io.read_u2le()
            _on = self.version
            if _on == 1:
                pass
                self._raw_payload = self._io.read_bytes(self.len_record - 4)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = SudoersTs.RecordV1(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == 2:
                pass
                self._raw_payload = self._io.read_bytes(self.len_record - 4)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = SudoersTs.RecordV2(_io__raw_payload, self, self._root)
                self.payload._read()
            else:
                pass
                self.payload = self._io.read_bytes(self.len_record - 4)
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(SudoersTs.Record, self)._write__seq(io)
            self._io.write_u2le(self.version)
            self._io.write_u2le(self.len_record)
            _on = self.version
            if _on == 1:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_record - 4)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_record - 4))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.len_record - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_record - 4, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == 2:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_record - 4)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_record - 4))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.len_record - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_record - 4, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            else:
                pass
                self._io.write_bytes(self.payload)


        def _check(self):
            _on = self.version
            if _on == 1:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == 2:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            else:
                pass
                if len(self.payload) != self.len_record - 4:
                    raise kaitaistruct.ConsistencyError(u"payload", self.len_record - 4, len(self.payload))
            self._dirty = False


    class RecordV1(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SudoersTs.RecordV1, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(SudoersTs.TsType, self._io.read_u2le())
            self.flags = SudoersTs.TsFlag(self._io, self, self._root)
            self.flags._read()
            self.auth_uid = self._io.read_u4le()
            self.sid = self._io.read_u4le()
            self.ts = SudoersTs.Timespec(self._io, self, self._root)
            self.ts._read()
            if self.type == SudoersTs.TsType.tty:
                pass
                self.ttydev = self._io.read_u4le()

            if self.type == SudoersTs.TsType.ppid:
                pass
                self.ppid = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.ts._fetch_instances()
            if self.type == SudoersTs.TsType.tty:
                pass

            if self.type == SudoersTs.TsType.ppid:
                pass



        def _write__seq(self, io=None):
            super(SudoersTs.RecordV1, self)._write__seq(io)
            self._io.write_u2le(int(self.type))
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.auth_uid)
            self._io.write_u4le(self.sid)
            self.ts._write__seq(self._io)
            if self.type == SudoersTs.TsType.tty:
                pass
                self._io.write_u4le(self.ttydev)

            if self.type == SudoersTs.TsType.ppid:
                pass
                self._io.write_u4le(self.ppid)



        def _check(self):
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if self.ts._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ts", self._root, self.ts._root)
            if self.ts._parent != self:
                raise kaitaistruct.ConsistencyError(u"ts", self, self.ts._parent)
            if self.type == SudoersTs.TsType.tty:
                pass

            if self.type == SudoersTs.TsType.ppid:
                pass

            self._dirty = False


    class RecordV2(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SudoersTs.RecordV2, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(SudoersTs.TsType, self._io.read_u2le())
            self.flags = SudoersTs.TsFlag(self._io, self, self._root)
            self.flags._read()
            self.auth_uid = self._io.read_u4le()
            self.sid = self._io.read_u4le()
            self.start_time = SudoersTs.Timespec(self._io, self, self._root)
            self.start_time._read()
            self.ts = SudoersTs.Timespec(self._io, self, self._root)
            self.ts._read()
            if self.type == SudoersTs.TsType.tty:
                pass
                self.ttydev = self._io.read_u4le()

            if self.type == SudoersTs.TsType.ppid:
                pass
                self.ppid = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.start_time._fetch_instances()
            self.ts._fetch_instances()
            if self.type == SudoersTs.TsType.tty:
                pass

            if self.type == SudoersTs.TsType.ppid:
                pass



        def _write__seq(self, io=None):
            super(SudoersTs.RecordV2, self)._write__seq(io)
            self._io.write_u2le(int(self.type))
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.auth_uid)
            self._io.write_u4le(self.sid)
            self.start_time._write__seq(self._io)
            self.ts._write__seq(self._io)
            if self.type == SudoersTs.TsType.tty:
                pass
                self._io.write_u4le(self.ttydev)

            if self.type == SudoersTs.TsType.ppid:
                pass
                self._io.write_u4le(self.ppid)



        def _check(self):
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if self.start_time._root != self._root:
                raise kaitaistruct.ConsistencyError(u"start_time", self._root, self.start_time._root)
            if self.start_time._parent != self:
                raise kaitaistruct.ConsistencyError(u"start_time", self, self.start_time._parent)
            if self.ts._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ts", self._root, self.ts._root)
            if self.ts._parent != self:
                raise kaitaistruct.ConsistencyError(u"ts", self, self.ts._parent)
            if self.type == SudoersTs.TsType.tty:
                pass

            if self.type == SudoersTs.TsType.ppid:
                pass

            self._dirty = False


    class Timespec(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SudoersTs.Timespec, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sec = self._io.read_s8le()
            self.nsec = self._io.read_s8le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SudoersTs.Timespec, self)._write__seq(io)
            self._io.write_s8le(self.sec)
            self._io.write_s8le(self.nsec)


        def _check(self):
            self._dirty = False


    class TsFlag(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SudoersTs.TsFlag, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved0 = self._io.read_bits_int_be(6)
            self.anyuid = self._io.read_bits_int_be(1) != 0
            self.disabled = self._io.read_bits_int_be(1) != 0
            self.reserved1 = self._io.read_bits_int_be(8)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SudoersTs.TsFlag, self)._write__seq(io)
            self._io.write_bits_int_be(6, self.reserved0)
            self._io.write_bits_int_be(1, int(self.anyuid))
            self._io.write_bits_int_be(1, int(self.disabled))
            self._io.write_bits_int_be(8, self.reserved1)


        def _check(self):
            self._dirty = False



