# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import vlq_base128_be
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Sqlite3(ReadWriteKaitaiStruct):
    """SQLite3 is a popular serverless SQL engine, implemented as a library
    to be used within other applications. It keeps its databases as
    regular disk files.
    
    Every database file is segmented into pages. First page (starting at
    the very beginning) is special: it contains a file-global header
    which specifies some data relevant to proper parsing (i.e. format
    versions, size of page, etc). After the header, normal contents of
    the first page follow.
    
    Each page would be of some type, and generally, they would be
    reached via the links starting from the first page. First page type
    (`root_page`) is always "btree_page".
    
    .. seealso::
       Source - https://www.sqlite.org/fileformat.html
    """

    class Encodings(IntEnum):
        utf_8 = 1
        utf_16le = 2
        utf_16be = 3

    class Versions(IntEnum):
        legacy = 1
        wal = 2
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Sqlite3, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(16)
        if not self.magic == b"\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00", self.magic, self._io, u"/seq/0")
        self.len_page_mod = self._io.read_u2be()
        self.write_version = KaitaiStream.resolve_enum(Sqlite3.Versions, self._io.read_u1())
        self.read_version = KaitaiStream.resolve_enum(Sqlite3.Versions, self._io.read_u1())
        self.reserved_space = self._io.read_u1()
        self.max_payload_frac = self._io.read_u1()
        self.min_payload_frac = self._io.read_u1()
        self.leaf_payload_frac = self._io.read_u1()
        self.file_change_counter = self._io.read_u4be()
        self.num_pages = self._io.read_u4be()
        self.first_freelist_trunk_page = self._io.read_u4be()
        self.num_freelist_pages = self._io.read_u4be()
        self.schema_cookie = self._io.read_u4be()
        self.schema_format = self._io.read_u4be()
        self.def_page_cache_size = self._io.read_u4be()
        self.largest_root_page = self._io.read_u4be()
        self.text_encoding = KaitaiStream.resolve_enum(Sqlite3.Encodings, self._io.read_u4be())
        self.user_version = self._io.read_u4be()
        self.is_incremental_vacuum = self._io.read_u4be()
        self.application_id = self._io.read_u4be()
        self.reserved = self._io.read_bytes(20)
        self.version_valid_for = self._io.read_u4be()
        self.sqlite_version_number = self._io.read_u4be()
        self.root_page = Sqlite3.BtreePage(self._io, self, self._root)
        self.root_page._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.root_page._fetch_instances()


    def _write__seq(self, io=None):
        super(Sqlite3, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u2be(self.len_page_mod)
        self._io.write_u1(int(self.write_version))
        self._io.write_u1(int(self.read_version))
        self._io.write_u1(self.reserved_space)
        self._io.write_u1(self.max_payload_frac)
        self._io.write_u1(self.min_payload_frac)
        self._io.write_u1(self.leaf_payload_frac)
        self._io.write_u4be(self.file_change_counter)
        self._io.write_u4be(self.num_pages)
        self._io.write_u4be(self.first_freelist_trunk_page)
        self._io.write_u4be(self.num_freelist_pages)
        self._io.write_u4be(self.schema_cookie)
        self._io.write_u4be(self.schema_format)
        self._io.write_u4be(self.def_page_cache_size)
        self._io.write_u4be(self.largest_root_page)
        self._io.write_u4be(int(self.text_encoding))
        self._io.write_u4be(self.user_version)
        self._io.write_u4be(self.is_incremental_vacuum)
        self._io.write_u4be(self.application_id)
        self._io.write_bytes(self.reserved)
        self._io.write_u4be(self.version_valid_for)
        self._io.write_u4be(self.sqlite_version_number)
        self.root_page._write__seq(self._io)


    def _check(self):
        if len(self.magic) != 16:
            raise kaitaistruct.ConsistencyError(u"magic", 16, len(self.magic))
        if not self.magic == b"\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00", self.magic, None, u"/seq/0")
        if len(self.reserved) != 20:
            raise kaitaistruct.ConsistencyError(u"reserved", 20, len(self.reserved))
        if self.root_page._root != self._root:
            raise kaitaistruct.ConsistencyError(u"root_page", self._root, self.root_page._root)
        if self.root_page._parent != self:
            raise kaitaistruct.ConsistencyError(u"root_page", self, self.root_page._parent)
        self._dirty = False

    class BtreePage(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.BtreePage, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.page_type = self._io.read_u1()
            self.first_freeblock = self._io.read_u2be()
            self.num_cells = self._io.read_u2be()
            self.ofs_cells = self._io.read_u2be()
            self.num_frag_free_bytes = self._io.read_u1()
            if  ((self.page_type == 2) or (self.page_type == 5)) :
                pass
                self.right_ptr = self._io.read_u4be()

            self.cells = []
            for i in range(self.num_cells):
                _t_cells = Sqlite3.RefCell(self._io, self, self._root)
                try:
                    _t_cells._read()
                finally:
                    self.cells.append(_t_cells)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self.page_type == 2) or (self.page_type == 5)) :
                pass

            for i in range(len(self.cells)):
                pass
                self.cells[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Sqlite3.BtreePage, self)._write__seq(io)
            self._io.write_u1(self.page_type)
            self._io.write_u2be(self.first_freeblock)
            self._io.write_u2be(self.num_cells)
            self._io.write_u2be(self.ofs_cells)
            self._io.write_u1(self.num_frag_free_bytes)
            if  ((self.page_type == 2) or (self.page_type == 5)) :
                pass
                self._io.write_u4be(self.right_ptr)

            for i in range(len(self.cells)):
                pass
                self.cells[i]._write__seq(self._io)



        def _check(self):
            if  ((self.page_type == 2) or (self.page_type == 5)) :
                pass

            if len(self.cells) != self.num_cells:
                raise kaitaistruct.ConsistencyError(u"cells", self.num_cells, len(self.cells))
            for i in range(len(self.cells)):
                pass
                if self.cells[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"cells", self._root, self.cells[i]._root)
                if self.cells[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"cells", self, self.cells[i]._parent)

            self._dirty = False


    class CellIndexInterior(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.sqlite.org/fileformat.html#b_tree_pages
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.CellIndexInterior, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.left_child_page = self._io.read_u4be()
            self.len_payload = vlq_base128_be.VlqBase128Be(self._io)
            self.len_payload._read()
            self._raw_payload = self._io.read_bytes(self.len_payload.value)
            _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
            self.payload = Sqlite3.CellPayload(_io__raw_payload, self, self._root)
            self.payload._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len_payload._fetch_instances()
            self.payload._fetch_instances()


        def _write__seq(self, io=None):
            super(Sqlite3.CellIndexInterior, self)._write__seq(io)
            self._io.write_u4be(self.left_child_page)
            self.len_payload._write__seq(self._io)
            _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_payload.value)))
            self._io.add_child_stream(_io__raw_payload)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_payload.value))
            def handler(parent, _io__raw_payload=_io__raw_payload):
                self._raw_payload = _io__raw_payload.to_byte_array()
                if len(self._raw_payload) != self.len_payload.value:
                    raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_payload.value, len(self._raw_payload))
                parent.write_bytes(self._raw_payload)
            _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.payload._write__seq(_io__raw_payload)


        def _check(self):
            if self.payload._root != self._root:
                raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
            if self.payload._parent != self:
                raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            self._dirty = False


    class CellIndexLeaf(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.sqlite.org/fileformat.html#b_tree_pages
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.CellIndexLeaf, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_payload = vlq_base128_be.VlqBase128Be(self._io)
            self.len_payload._read()
            self._raw_payload = self._io.read_bytes(self.len_payload.value)
            _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
            self.payload = Sqlite3.CellPayload(_io__raw_payload, self, self._root)
            self.payload._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len_payload._fetch_instances()
            self.payload._fetch_instances()


        def _write__seq(self, io=None):
            super(Sqlite3.CellIndexLeaf, self)._write__seq(io)
            self.len_payload._write__seq(self._io)
            _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_payload.value)))
            self._io.add_child_stream(_io__raw_payload)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_payload.value))
            def handler(parent, _io__raw_payload=_io__raw_payload):
                self._raw_payload = _io__raw_payload.to_byte_array()
                if len(self._raw_payload) != self.len_payload.value:
                    raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_payload.value, len(self._raw_payload))
                parent.write_bytes(self._raw_payload)
            _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.payload._write__seq(_io__raw_payload)


        def _check(self):
            if self.payload._root != self._root:
                raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
            if self.payload._parent != self:
                raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            self._dirty = False


    class CellPayload(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://sqlite.org/fileformat2.html#record_format
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.CellPayload, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_header_and_len = vlq_base128_be.VlqBase128Be(self._io)
            self.len_header_and_len._read()
            self._raw_column_serials = self._io.read_bytes(self.len_header_and_len.value - 1)
            _io__raw_column_serials = KaitaiStream(BytesIO(self._raw_column_serials))
            self.column_serials = Sqlite3.Serials(_io__raw_column_serials, self, self._root)
            self.column_serials._read()
            self.column_contents = []
            for i in range(len(self.column_serials.entries)):
                _t_column_contents = Sqlite3.ColumnContent(self.column_serials.entries[i], self._io, self, self._root)
                try:
                    _t_column_contents._read()
                finally:
                    self.column_contents.append(_t_column_contents)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len_header_and_len._fetch_instances()
            self.column_serials._fetch_instances()
            for i in range(len(self.column_contents)):
                pass
                self.column_contents[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Sqlite3.CellPayload, self)._write__seq(io)
            self.len_header_and_len._write__seq(self._io)
            _io__raw_column_serials = KaitaiStream(BytesIO(bytearray(self.len_header_and_len.value - 1)))
            self._io.add_child_stream(_io__raw_column_serials)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_header_and_len.value - 1))
            def handler(parent, _io__raw_column_serials=_io__raw_column_serials):
                self._raw_column_serials = _io__raw_column_serials.to_byte_array()
                if len(self._raw_column_serials) != self.len_header_and_len.value - 1:
                    raise kaitaistruct.ConsistencyError(u"raw(column_serials)", self.len_header_and_len.value - 1, len(self._raw_column_serials))
                parent.write_bytes(self._raw_column_serials)
            _io__raw_column_serials.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.column_serials._write__seq(_io__raw_column_serials)
            for i in range(len(self.column_contents)):
                pass
                self.column_contents[i]._write__seq(self._io)



        def _check(self):
            if self.column_serials._root != self._root:
                raise kaitaistruct.ConsistencyError(u"column_serials", self._root, self.column_serials._root)
            if self.column_serials._parent != self:
                raise kaitaistruct.ConsistencyError(u"column_serials", self, self.column_serials._parent)
            if len(self.column_contents) != len(self.column_serials.entries):
                raise kaitaistruct.ConsistencyError(u"column_contents", len(self.column_serials.entries), len(self.column_contents))
            for i in range(len(self.column_contents)):
                pass
                if self.column_contents[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"column_contents", self._root, self.column_contents[i]._root)
                if self.column_contents[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"column_contents", self, self.column_contents[i]._parent)
                if self.column_contents[i].serial_type != self.column_serials.entries[i]:
                    raise kaitaistruct.ConsistencyError(u"column_contents", self.column_serials.entries[i], self.column_contents[i].serial_type)

            self._dirty = False


    class CellTableInterior(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.sqlite.org/fileformat.html#b_tree_pages
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.CellTableInterior, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.left_child_page = self._io.read_u4be()
            self.row_id = vlq_base128_be.VlqBase128Be(self._io)
            self.row_id._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.row_id._fetch_instances()


        def _write__seq(self, io=None):
            super(Sqlite3.CellTableInterior, self)._write__seq(io)
            self._io.write_u4be(self.left_child_page)
            self.row_id._write__seq(self._io)


        def _check(self):
            self._dirty = False


    class CellTableLeaf(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.sqlite.org/fileformat.html#b_tree_pages
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.CellTableLeaf, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_payload = vlq_base128_be.VlqBase128Be(self._io)
            self.len_payload._read()
            self.row_id = vlq_base128_be.VlqBase128Be(self._io)
            self.row_id._read()
            self._raw_payload = self._io.read_bytes(self.len_payload.value)
            _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
            self.payload = Sqlite3.CellPayload(_io__raw_payload, self, self._root)
            self.payload._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len_payload._fetch_instances()
            self.row_id._fetch_instances()
            self.payload._fetch_instances()


        def _write__seq(self, io=None):
            super(Sqlite3.CellTableLeaf, self)._write__seq(io)
            self.len_payload._write__seq(self._io)
            self.row_id._write__seq(self._io)
            _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_payload.value)))
            self._io.add_child_stream(_io__raw_payload)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_payload.value))
            def handler(parent, _io__raw_payload=_io__raw_payload):
                self._raw_payload = _io__raw_payload.to_byte_array()
                if len(self._raw_payload) != self.len_payload.value:
                    raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_payload.value, len(self._raw_payload))
                parent.write_bytes(self._raw_payload)
            _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.payload._write__seq(_io__raw_payload)


        def _check(self):
            if self.payload._root != self._root:
                raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
            if self.payload._parent != self:
                raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            self._dirty = False


    class ColumnContent(ReadWriteKaitaiStruct):
        def __init__(self, serial_type, _io=None, _parent=None, _root=None):
            super(Sqlite3.ColumnContent, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.serial_type = serial_type

        def _read(self):
            if  ((self.serial_type.code.value >= 1) and (self.serial_type.code.value <= 6)) :
                pass
                _on = self.serial_type.code.value
                if _on == 1:
                    pass
                    self.as_int = self._io.read_u1()
                elif _on == 2:
                    pass
                    self.as_int = self._io.read_u2be()
                elif _on == 3:
                    pass
                    self.as_int = self._io.read_bits_int_be(24)
                elif _on == 4:
                    pass
                    self.as_int = self._io.read_u4be()
                elif _on == 5:
                    pass
                    self.as_int = self._io.read_bits_int_be(48)
                elif _on == 6:
                    pass
                    self.as_int = self._io.read_u8be()

            if self.serial_type.code.value == 7:
                pass
                self.as_float = self._io.read_f8be()

            if self.serial_type.is_blob:
                pass
                self.as_blob = self._io.read_bytes(self.serial_type.len_content)

            self.as_str = (self._io.read_bytes(self.serial_type.len_content)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self.serial_type.code.value >= 1) and (self.serial_type.code.value <= 6)) :
                pass
                _on = self.serial_type.code.value
                if _on == 1:
                    pass
                elif _on == 2:
                    pass
                elif _on == 3:
                    pass
                elif _on == 4:
                    pass
                elif _on == 5:
                    pass
                elif _on == 6:
                    pass

            if self.serial_type.code.value == 7:
                pass

            if self.serial_type.is_blob:
                pass



        def _write__seq(self, io=None):
            super(Sqlite3.ColumnContent, self)._write__seq(io)
            if  ((self.serial_type.code.value >= 1) and (self.serial_type.code.value <= 6)) :
                pass
                _on = self.serial_type.code.value
                if _on == 1:
                    pass
                    self._io.write_u1(self.as_int)
                elif _on == 2:
                    pass
                    self._io.write_u2be(self.as_int)
                elif _on == 3:
                    pass
                    self._io.write_bits_int_be(24, self.as_int)
                elif _on == 4:
                    pass
                    self._io.write_u4be(self.as_int)
                elif _on == 5:
                    pass
                    self._io.write_bits_int_be(48, self.as_int)
                elif _on == 6:
                    pass
                    self._io.write_u8be(self.as_int)

            if self.serial_type.code.value == 7:
                pass
                self._io.write_f8be(self.as_float)

            if self.serial_type.is_blob:
                pass
                self._io.write_bytes(self.as_blob)

            self._io.write_bytes((self.as_str).encode(u"UTF-8"))


        def _check(self):
            if  ((self.serial_type.code.value >= 1) and (self.serial_type.code.value <= 6)) :
                pass
                _on = self.serial_type.code.value
                if _on == 1:
                    pass
                elif _on == 2:
                    pass
                elif _on == 3:
                    pass
                elif _on == 4:
                    pass
                elif _on == 5:
                    pass
                elif _on == 6:
                    pass

            if self.serial_type.code.value == 7:
                pass

            if self.serial_type.is_blob:
                pass
                if len(self.as_blob) != self.serial_type.len_content:
                    raise kaitaistruct.ConsistencyError(u"as_blob", self.serial_type.len_content, len(self.as_blob))

            if len((self.as_str).encode(u"UTF-8")) != self.serial_type.len_content:
                raise kaitaistruct.ConsistencyError(u"as_str", self.serial_type.len_content, len((self.as_str).encode(u"UTF-8")))
            self._dirty = False


    class RefCell(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.RefCell, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.ofs_body = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                _on = self._parent.page_type
                if _on == 10:
                    pass
                    self._m_body._fetch_instances()
                elif _on == 13:
                    pass
                    self._m_body._fetch_instances()
                elif _on == 2:
                    pass
                    self._m_body._fetch_instances()
                elif _on == 5:
                    pass
                    self._m_body._fetch_instances()



        def _write__seq(self, io=None):
            super(Sqlite3.RefCell, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u2be(self.ofs_body)


        def _check(self):
            if self.body__enabled:
                pass
                _on = self._parent.page_type
                if _on == 10:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == 13:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == 2:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == 5:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self._parent.page_type
            if _on == 10:
                pass
                self._m_body = Sqlite3.CellIndexLeaf(self._io, self, self._root)
                self._m_body._read()
            elif _on == 13:
                pass
                self._m_body = Sqlite3.CellTableLeaf(self._io, self, self._root)
                self._m_body._read()
            elif _on == 2:
                pass
                self._m_body = Sqlite3.CellIndexInterior(self._io, self, self._root)
                self._m_body._read()
            elif _on == 5:
                pass
                self._m_body = Sqlite3.CellTableInterior(self._io, self, self._root)
                self._m_body._read()
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self._parent.page_type
            if _on == 10:
                pass
                self._m_body._write__seq(self._io)
            elif _on == 13:
                pass
                self._m_body._write__seq(self._io)
            elif _on == 2:
                pass
                self._m_body._write__seq(self._io)
            elif _on == 5:
                pass
                self._m_body._write__seq(self._io)
            self._io.seek(_pos)


    class Serial(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.Serial, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = vlq_base128_be.VlqBase128Be(self._io)
            self.code._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.code._fetch_instances()


        def _write__seq(self, io=None):
            super(Sqlite3.Serial, self)._write__seq(io)
            self.code._write__seq(self._io)


        def _check(self):
            self._dirty = False

        @property
        def is_blob(self):
            if hasattr(self, '_m_is_blob'):
                return self._m_is_blob

            self._m_is_blob =  ((self.code.value >= 12) and (self.code.value % 2 == 0)) 
            return getattr(self, '_m_is_blob', None)

        def _invalidate_is_blob(self):
            del self._m_is_blob
        @property
        def is_string(self):
            if hasattr(self, '_m_is_string'):
                return self._m_is_string

            self._m_is_string =  ((self.code.value >= 13) and (self.code.value % 2 == 1)) 
            return getattr(self, '_m_is_string', None)

        def _invalidate_is_string(self):
            del self._m_is_string
        @property
        def len_content(self):
            if hasattr(self, '_m_len_content'):
                return self._m_len_content

            if self.code.value >= 12:
                pass
                self._m_len_content = (self.code.value - 12) // 2

            return getattr(self, '_m_len_content', None)

        def _invalidate_len_content(self):
            del self._m_len_content

    class Serials(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Sqlite3.Serials, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Sqlite3.Serial(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Sqlite3.Serials, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    @property
    def len_page(self):
        if hasattr(self, '_m_len_page'):
            return self._m_len_page

        self._m_len_page = (65536 if self.len_page_mod == 1 else self.len_page_mod)
        return getattr(self, '_m_len_page', None)

    def _invalidate_len_page(self):
        del self._m_len_page

