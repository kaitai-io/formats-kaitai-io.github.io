# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dbf(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Dbf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header1 = Dbf.Header1(self._io, self, self._root)
        self._raw_header2 = self._io.read_bytes((self.header1.len_header - 12) - 1)
        _io__raw_header2 = KaitaiStream(BytesIO(self._raw_header2))
        self.header2 = Dbf.Header2(_io__raw_header2, self, self._root)
        self.header_terminator = self._io.read_bytes(1)
        if not self.header_terminator == b"\x0D":
            raise kaitaistruct.ValidationNotEqualError(b"\x0D", self.header_terminator, self._io, u"/seq/2")
        self._raw_records = []
        self.records = []
        for i in range(self.header1.num_records):
            self._raw_records.append(self._io.read_bytes(self.header1.len_record))
            _io__raw_records = KaitaiStream(BytesIO(self._raw_records[i]))
            self.records.append(Dbf.Record(_io__raw_records, self, self._root))



    def _fetch_instances(self):
        pass
        self.header1._fetch_instances()
        self.header2._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()


    class Field(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dbf.Field, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class Header1(KaitaiStruct):
        """
        .. seealso::
           - section 1.1 - http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Dbf.Header1, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.version = self._io.read_u1()
            self.last_update_y = self._io.read_u1()
            self.last_update_m = self._io.read_u1()
            self.last_update_d = self._io.read_u1()
            self.num_records = self._io.read_u4le()
            self.len_header = self._io.read_u2le()
            self.len_record = self._io.read_u2le()


        def _fetch_instances(self):
            pass

        @property
        def dbase_level(self):
            if hasattr(self, '_m_dbase_level'):
                return self._m_dbase_level

            self._m_dbase_level = self.version & 7
            return getattr(self, '_m_dbase_level', None)


    class Header2(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dbf.Header2, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            if self._root.header1.dbase_level == 3:
                pass
                self.header_dbase_3 = Dbf.HeaderDbase3(self._io, self, self._root)

            if self._root.header1.dbase_level == 7:
                pass
                self.header_dbase_7 = Dbf.HeaderDbase7(self._io, self, self._root)

            self.fields = []
            i = 0
            while not self._io.is_eof():
                self.fields.append(Dbf.Field(self._io, self, self._root))
                i += 1



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



    class HeaderDbase3(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dbf.HeaderDbase3, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved1 = self._io.read_bytes(3)
            self.reserved2 = self._io.read_bytes(13)
            self.reserved3 = self._io.read_bytes(4)


        def _fetch_instances(self):
            pass


    class HeaderDbase7(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dbf.HeaderDbase7, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Dbf.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.deleted = KaitaiStream.resolve_enum(Dbf.DeleteState, self._io.read_u1())
            self.record_fields = []
            for i in range(len(self._root.header2.fields)):
                self.record_fields.append(self._io.read_bytes(self._root.header2.fields[i].length))



        def _fetch_instances(self):
            pass
            for i in range(len(self.record_fields)):
                pass




