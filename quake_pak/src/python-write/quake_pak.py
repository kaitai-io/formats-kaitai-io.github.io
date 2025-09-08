# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class QuakePak(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://quakewiki.org/wiki/.pak#Format_specification
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(QuakePak, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_index = False
        self.index__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x50\x41\x43\x4B":
            raise kaitaistruct.ValidationNotEqualError(b"\x50\x41\x43\x4B", self.magic, self._io, u"/seq/0")
        self.ofs_index = self._io.read_u4le()
        self.len_index = self._io.read_u4le()
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()



    def _write__seq(self, io=None):
        super(QuakePak, self)._write__seq(io)
        self._should_write_index = self.index__enabled
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.ofs_index)
        self._io.write_u4le(self.len_index)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x50\x41\x43\x4B":
            raise kaitaistruct.ValidationNotEqualError(b"\x50\x41\x43\x4B", self.magic, None, u"/seq/0")
        if self.index__enabled:
            pass
            if self._m_index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index", self._root, self._m_index._root)
            if self._m_index._parent != self:
                raise kaitaistruct.ConsistencyError(u"index", self, self._m_index._parent)

        self._dirty = False

    class IndexEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakePak.IndexEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(56), 0, False)).decode(u"UTF-8")
            self.ofs = self._io.read_u4le()
            self.size = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(QuakePak.IndexEntry, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 56, 0, 0)
            self._io.write_u4le(self.ofs)
            self._io.write_u4le(self.size)


        def _check(self):
            if len((self.name).encode(u"UTF-8")) > 56:
                raise kaitaistruct.ConsistencyError(u"name", 56, len((self.name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
            if self.body__enabled:
                pass
                if len(self._m_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"body", self.size, len(self._m_body))

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs)
            self._m_body = io.read_bytes(self.size)
            io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs)
            io.write_bytes(self._m_body)
            io.seek(_pos)


    class IndexStruct(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakePak.IndexStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = QuakePak.IndexEntry(self._io, self, self._root)
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
            super(QuakePak.IndexStruct, self)._write__seq(io)
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
    def index(self):
        if self._should_write_index:
            self._write_index()
        if hasattr(self, '_m_index'):
            return self._m_index

        if not self.index__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_index)
        self._raw__m_index = self._io.read_bytes(self.len_index)
        _io__raw__m_index = KaitaiStream(BytesIO(self._raw__m_index))
        self._m_index = QuakePak.IndexStruct(_io__raw__m_index, self, self._root)
        self._m_index._read()
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)

    @index.setter
    def index(self, v):
        self._dirty = True
        self._m_index = v

    def _write_index(self):
        self._should_write_index = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_index)
        _io__raw__m_index = KaitaiStream(BytesIO(bytearray(self.len_index)))
        self._io.add_child_stream(_io__raw__m_index)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_index))
        def handler(parent, _io__raw__m_index=_io__raw__m_index):
            self._raw__m_index = _io__raw__m_index.to_byte_array()
            if len(self._raw__m_index) != self.len_index:
                raise kaitaistruct.ConsistencyError(u"raw(index)", self.len_index, len(self._raw__m_index))
            parent.write_bytes(self._raw__m_index)
        _io__raw__m_index.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_index._write__seq(_io__raw__m_index)
        self._io.seek(_pos)


