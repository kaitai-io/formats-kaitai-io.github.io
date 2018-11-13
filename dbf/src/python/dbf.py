# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Dbf(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header1 = self._root.Header1(self._io, self, self._root)
        self._raw_header2 = self._io.read_bytes((self.header1.len_header - 12))
        io = KaitaiStream(BytesIO(self._raw_header2))
        self.header2 = self._root.Header2(io, self, self._root)
        self.records = [None] * (self.header1.num_records)
        for i in range(self.header1.num_records):
            self.records[i] = self._io.read_bytes(self.header1.len_record)


    class Header2(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            if self._root.header1.dbase_level == 3:
                self.header_dbase_3 = self._root.HeaderDbase3(self._io, self, self._root)

            if self._root.header1.dbase_level == 7:
                self.header_dbase_7 = self._root.HeaderDbase7(self._io, self, self._root)

            self.fields = [None] * (11)
            for i in range(11):
                self.fields[i] = self._root.Field(self._io, self, self._root)



    class Field(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.name = (self._io.read_bytes(11)).decode(u"ASCII")
            self.datatype = self._io.read_u1()
            self.data_address = self._io.read_u4le()
            self.length = self._io.read_u1()
            self.decimal_count = self._io.read_u1()
            self.reserved1 = self._io.read_bytes(2)
            self.work_area_id = self._io.read_u1()
            self.reserved2 = self._io.read_bytes(2)
            self.set_fields_flag = self._io.read_u1()
            self.reserved3 = self._io.read_bytes(8)


    class Header1(KaitaiStruct):
        """
        .. seealso::
           - section 1.1 - http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.version = self._io.read_u1()
            self.last_update_y = self._io.read_u1()
            self.last_update_m = self._io.read_u1()
            self.last_update_d = self._io.read_u1()
            self.num_records = self._io.read_u4le()
            self.len_header = self._io.read_u2le()
            self.len_record = self._io.read_u2le()

        @property
        def dbase_level(self):
            if hasattr(self, '_m_dbase_level'):
                return self._m_dbase_level if hasattr(self, '_m_dbase_level') else None

            self._m_dbase_level = (self.version & 7)
            return self._m_dbase_level if hasattr(self, '_m_dbase_level') else None


    class HeaderDbase3(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reserved1 = self._io.read_bytes(3)
            self.reserved2 = self._io.read_bytes(13)
            self.reserved3 = self._io.read_bytes(4)


    class HeaderDbase7(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reserved1 = self._io.ensure_fixed_contents(b"\x00\x00")
            self.has_incomplete_transaction = self._io.read_u1()
            self.dbase_iv_encryption = self._io.read_u1()
            self.reserved2 = self._io.read_bytes(12)
            self.production_mdx = self._io.read_u1()
            self.language_driver_id = self._io.read_u1()
            self.reserved3 = self._io.ensure_fixed_contents(b"\x00\x00")
            self.language_driver_name = self._io.read_bytes(32)
            self.reserved4 = self._io.read_bytes(4)



