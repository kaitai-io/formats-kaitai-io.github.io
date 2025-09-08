# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dbf(ReadWriteKaitaiStruct):
    """.dbf is a relational database format introduced in DOS database
    management system dBASE in 1982.
    
    One .dbf file corresponds to one table and contains a series of headers,
    specification of fields, and a number of fixed-size records.
    
    .. seealso::
       Source - http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm
    """

    class DeleteState(IntEnum):
        false = 32
        true = 42
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Dbf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header1 = Dbf.Header1(self._io, self, self._root)
        self.header1._read()
        self._raw_header2 = self._io.read_bytes((self.header1.len_header - 12) - 1)
        _io__raw_header2 = KaitaiStream(BytesIO(self._raw_header2))
        self.header2 = Dbf.Header2(_io__raw_header2, self, self._root)
        self.header2._read()
        self.header_terminator = self._io.read_bytes(1)
        if not self.header_terminator == b"\x0D":
            raise kaitaistruct.ValidationNotEqualError(b"\x0D", self.header_terminator, self._io, u"/seq/2")
        self._raw_records = []
        self.records = []
        for i in range(self.header1.num_records):
            self._raw_records.append(self._io.read_bytes(self.header1.len_record))
            _io__raw_records = KaitaiStream(BytesIO(self._raw_records[i]))
            _t_records = Dbf.Record(_io__raw_records, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header1._fetch_instances()
        self.header2._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Dbf, self)._write__seq(io)
        self.header1._write__seq(self._io)
        _io__raw_header2 = KaitaiStream(BytesIO(bytearray((self.header1.len_header - 12) - 1)))
        self._io.add_child_stream(_io__raw_header2)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + ((self.header1.len_header - 12) - 1))
        def handler(parent, _io__raw_header2=_io__raw_header2):
            self._raw_header2 = _io__raw_header2.to_byte_array()
            if len(self._raw_header2) != (self.header1.len_header - 12) - 1:
                raise kaitaistruct.ConsistencyError(u"raw(header2)", (self.header1.len_header - 12) - 1, len(self._raw_header2))
            parent.write_bytes(self._raw_header2)
        _io__raw_header2.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header2._write__seq(_io__raw_header2)
        self._io.write_bytes(self.header_terminator)
        self._raw_records = []
        for i in range(len(self.records)):
            pass
            _io__raw_records = KaitaiStream(BytesIO(bytearray(self.header1.len_record)))
            self._io.add_child_stream(_io__raw_records)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header1.len_record))
            def handler(parent, _io__raw_records=_io__raw_records, i=i):
                self._raw_records.append(_io__raw_records.to_byte_array())
                if len(self._raw_records[i]) != self.header1.len_record:
                    raise kaitaistruct.ConsistencyError(u"raw(records)", self.header1.len_record, len(self._raw_records[i]))
                parent.write_bytes(self._raw_records[i])
            _io__raw_records.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.records[i]._write__seq(_io__raw_records)



    def _check(self):
        if self.header1._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header1", self._root, self.header1._root)
        if self.header1._parent != self:
            raise kaitaistruct.ConsistencyError(u"header1", self, self.header1._parent)
        if self.header2._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header2", self._root, self.header2._root)
        if self.header2._parent != self:
            raise kaitaistruct.ConsistencyError(u"header2", self, self.header2._parent)
        if len(self.header_terminator) != 1:
            raise kaitaistruct.ConsistencyError(u"header_terminator", 1, len(self.header_terminator))
        if not self.header_terminator == b"\x0D":
            raise kaitaistruct.ValidationNotEqualError(b"\x0D", self.header_terminator, None, u"/seq/2")
        if len(self.records) != self.header1.num_records:
            raise kaitaistruct.ConsistencyError(u"records", self.header1.num_records, len(self.records))
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class Field(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dbf.Field, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(11), 0, False)).decode(u"ASCII")
            self.datatype = self._io.read_u1()
            self.data_address = self._io.read_u4le()
            self.length = self._io.read_u1()
            self.decimal_count = self._io.read_u1()
            self.reserved1 = self._io.read_bytes(2)
            self.work_area_id = self._io.read_u1()
            self.reserved2 = self._io.read_bytes(2)
            self.set_fields_flag = self._io.read_u1()
            self.reserved3 = self._io.read_bytes(8)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dbf.Field, self)._write__seq(io)
            self._io.write_bytes_limit((self.name).encode(u"ASCII"), 11, 0, 0)
            self._io.write_u1(self.datatype)
            self._io.write_u4le(self.data_address)
            self._io.write_u1(self.length)
            self._io.write_u1(self.decimal_count)
            self._io.write_bytes(self.reserved1)
            self._io.write_u1(self.work_area_id)
            self._io.write_bytes(self.reserved2)
            self._io.write_u1(self.set_fields_flag)
            self._io.write_bytes(self.reserved3)


        def _check(self):
            if len((self.name).encode(u"ASCII")) > 11:
                raise kaitaistruct.ConsistencyError(u"name", 11, len((self.name).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            if len(self.reserved1) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved1", 2, len(self.reserved1))
            if len(self.reserved2) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved2", 2, len(self.reserved2))
            if len(self.reserved3) != 8:
                raise kaitaistruct.ConsistencyError(u"reserved3", 8, len(self.reserved3))
            self._dirty = False


    class Header1(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - section 1.1 - http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dbf.Header1, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u1()
            self.last_update_y = self._io.read_u1()
            self.last_update_m = self._io.read_u1()
            self.last_update_d = self._io.read_u1()
            self.num_records = self._io.read_u4le()
            self.len_header = self._io.read_u2le()
            self.len_record = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dbf.Header1, self)._write__seq(io)
            self._io.write_u1(self.version)
            self._io.write_u1(self.last_update_y)
            self._io.write_u1(self.last_update_m)
            self._io.write_u1(self.last_update_d)
            self._io.write_u4le(self.num_records)
            self._io.write_u2le(self.len_header)
            self._io.write_u2le(self.len_record)


        def _check(self):
            self._dirty = False

        @property
        def dbase_level(self):
            if hasattr(self, '_m_dbase_level'):
                return self._m_dbase_level

            self._m_dbase_level = self.version & 7
            return getattr(self, '_m_dbase_level', None)

        def _invalidate_dbase_level(self):
            del self._m_dbase_level

    class Header2(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dbf.Header2, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            if self._root.header1.dbase_level == 3:
                pass
                self.header_dbase_3 = Dbf.HeaderDbase3(self._io, self, self._root)
                self.header_dbase_3._read()

            if self._root.header1.dbase_level == 7:
                pass
                self.header_dbase_7 = Dbf.HeaderDbase7(self._io, self, self._root)
                self.header_dbase_7._read()

            self.fields = []
            i = 0
            while not self._io.is_eof():
                _t_fields = Dbf.Field(self._io, self, self._root)
                try:
                    _t_fields._read()
                finally:
                    self.fields.append(_t_fields)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self._root.header1.dbase_level == 3:
                pass
                self.header_dbase_3._fetch_instances()

            if self._root.header1.dbase_level == 7:
                pass
                self.header_dbase_7._fetch_instances()

            for i in range(len(self.fields)):
                pass
                self.fields[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Dbf.Header2, self)._write__seq(io)
            if self._root.header1.dbase_level == 3:
                pass
                self.header_dbase_3._write__seq(self._io)

            if self._root.header1.dbase_level == 7:
                pass
                self.header_dbase_7._write__seq(self._io)

            for i in range(len(self.fields)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"fields", 0, self._io.size() - self._io.pos())
                self.fields[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"fields", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self._root.header1.dbase_level == 3:
                pass
                if self.header_dbase_3._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header_dbase_3", self._root, self.header_dbase_3._root)
                if self.header_dbase_3._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header_dbase_3", self, self.header_dbase_3._parent)

            if self._root.header1.dbase_level == 7:
                pass
                if self.header_dbase_7._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header_dbase_7", self._root, self.header_dbase_7._root)
                if self.header_dbase_7._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header_dbase_7", self, self.header_dbase_7._parent)

            for i in range(len(self.fields)):
                pass
                if self.fields[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"fields", self._root, self.fields[i]._root)
                if self.fields[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"fields", self, self.fields[i]._parent)

            self._dirty = False


    class HeaderDbase3(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dbf.HeaderDbase3, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved1 = self._io.read_bytes(3)
            self.reserved2 = self._io.read_bytes(13)
            self.reserved3 = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dbf.HeaderDbase3, self)._write__seq(io)
            self._io.write_bytes(self.reserved1)
            self._io.write_bytes(self.reserved2)
            self._io.write_bytes(self.reserved3)


        def _check(self):
            if len(self.reserved1) != 3:
                raise kaitaistruct.ConsistencyError(u"reserved1", 3, len(self.reserved1))
            if len(self.reserved2) != 13:
                raise kaitaistruct.ConsistencyError(u"reserved2", 13, len(self.reserved2))
            if len(self.reserved3) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved3", 4, len(self.reserved3))
            self._dirty = False


    class HeaderDbase7(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dbf.HeaderDbase7, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved1 = self._io.read_bytes(2)
            if not self.reserved1 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved1, self._io, u"/types/header_dbase_7/seq/0")
            self.has_incomplete_transaction = self._io.read_u1()
            self.dbase_iv_encryption = self._io.read_u1()
            self.reserved2 = self._io.read_bytes(12)
            self.production_mdx = self._io.read_u1()
            self.language_driver_id = self._io.read_u1()
            self.reserved3 = self._io.read_bytes(2)
            if not self.reserved3 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved3, self._io, u"/types/header_dbase_7/seq/6")
            self.language_driver_name = self._io.read_bytes(32)
            self.reserved4 = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Dbf.HeaderDbase7, self)._write__seq(io)
            self._io.write_bytes(self.reserved1)
            self._io.write_u1(self.has_incomplete_transaction)
            self._io.write_u1(self.dbase_iv_encryption)
            self._io.write_bytes(self.reserved2)
            self._io.write_u1(self.production_mdx)
            self._io.write_u1(self.language_driver_id)
            self._io.write_bytes(self.reserved3)
            self._io.write_bytes(self.language_driver_name)
            self._io.write_bytes(self.reserved4)


        def _check(self):
            if len(self.reserved1) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved1", 2, len(self.reserved1))
            if not self.reserved1 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved1, None, u"/types/header_dbase_7/seq/0")
            if len(self.reserved2) != 12:
                raise kaitaistruct.ConsistencyError(u"reserved2", 12, len(self.reserved2))
            if len(self.reserved3) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved3", 2, len(self.reserved3))
            if not self.reserved3 == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved3, None, u"/types/header_dbase_7/seq/6")
            if len(self.language_driver_name) != 32:
                raise kaitaistruct.ConsistencyError(u"language_driver_name", 32, len(self.language_driver_name))
            if len(self.reserved4) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved4", 4, len(self.reserved4))
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Dbf.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.deleted = KaitaiStream.resolve_enum(Dbf.DeleteState, self._io.read_u1())
            self.record_fields = []
            for i in range(len(self._root.header2.fields)):
                self.record_fields.append(self._io.read_bytes(self._root.header2.fields[i].length))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.record_fields)):
                pass



        def _write__seq(self, io=None):
            super(Dbf.Record, self)._write__seq(io)
            self._io.write_u1(int(self.deleted))
            for i in range(len(self.record_fields)):
                pass
                self._io.write_bytes(self.record_fields[i])



        def _check(self):
            if len(self.record_fields) != len(self._root.header2.fields):
                raise kaitaistruct.ConsistencyError(u"record_fields", len(self._root.header2.fields), len(self.record_fields))
            for i in range(len(self.record_fields)):
                pass
                if len(self.record_fields[i]) != self._root.header2.fields[i].length:
                    raise kaitaistruct.ConsistencyError(u"record_fields", self._root.header2.fields[i].length, len(self.record_fields[i]))

            self._dirty = False



