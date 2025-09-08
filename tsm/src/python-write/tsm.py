# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Tsm(ReadWriteKaitaiStruct):
    """InfluxDB is a scalable database optimized for storage of time
    series, real-time application metrics, operations monitoring events,
    etc, written in Go.
    
    Data is stored in .tsm files, which are kept pretty simple
    conceptually. Each .tsm file contains a header and footer, which
    stores offset to an index. Index is used to find a data block for a
    requested time boundary.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Tsm, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_index = False
        self.index__enabled = True

    def _read(self):
        self.header = Tsm.Header(self._io, self, self._root)
        self.header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()



    def _write__seq(self, io=None):
        super(Tsm, self)._write__seq(io)
        self._should_write_index = self.index__enabled
        self.header._write__seq(self._io)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.index__enabled:
            pass
            if self._m_index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index", self._root, self._m_index._root)
            if self._m_index._parent != self:
                raise kaitaistruct.ConsistencyError(u"index", self, self._m_index._parent)

        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Tsm.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x16\xD1\x16\xD1":
                raise kaitaistruct.ValidationNotEqualError(b"\x16\xD1\x16\xD1", self.magic, self._io, u"/types/header/seq/0")
            self.version = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Tsm.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u1(self.version)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x16\xD1\x16\xD1":
                raise kaitaistruct.ValidationNotEqualError(b"\x16\xD1\x16\xD1", self.magic, None, u"/types/header/seq/0")
            self._dirty = False


    class Index(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Tsm.Index, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_entries = False
            self.entries__enabled = True

        def _read(self):
            self.offset = self._io.read_u8be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.entries
            if hasattr(self, '_m_entries'):
                pass
                for i in range(len(self._m_entries)):
                    pass
                    self._m_entries[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(Tsm.Index, self)._write__seq(io)
            self._should_write_entries = self.entries__enabled
            self._io.write_u8be(self.offset)


        def _check(self):
            if self.entries__enabled:
                pass
                if len(self._m_entries) == 0:
                    raise kaitaistruct.ConsistencyError(u"entries", 0, len(self._m_entries))
                for i in range(len(self._m_entries)):
                    pass
                    if self._m_entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entries", self._root, self._m_entries[i]._root)
                    if self._m_entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entries", self, self._m_entries[i]._parent)


            self._dirty = False

        class IndexHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Tsm.Index.IndexHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.key_len = self._io.read_u2be()
                self.key = (self._io.read_bytes(self.key_len)).decode(u"UTF-8")
                self.type = self._io.read_u1()
                self.entry_count = self._io.read_u2be()
                self.index_entries = []
                for i in range(self.entry_count):
                    _t_index_entries = Tsm.Index.IndexHeader.IndexEntry(self._io, self, self._root)
                    try:
                        _t_index_entries._read()
                    finally:
                        self.index_entries.append(_t_index_entries)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.index_entries)):
                    pass
                    self.index_entries[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Tsm.Index.IndexHeader, self)._write__seq(io)
                self._io.write_u2be(self.key_len)
                self._io.write_bytes((self.key).encode(u"UTF-8"))
                self._io.write_u1(self.type)
                self._io.write_u2be(self.entry_count)
                for i in range(len(self.index_entries)):
                    pass
                    self.index_entries[i]._write__seq(self._io)



            def _check(self):
                if len((self.key).encode(u"UTF-8")) != self.key_len:
                    raise kaitaistruct.ConsistencyError(u"key", self.key_len, len((self.key).encode(u"UTF-8")))
                if len(self.index_entries) != self.entry_count:
                    raise kaitaistruct.ConsistencyError(u"index_entries", self.entry_count, len(self.index_entries))
                for i in range(len(self.index_entries)):
                    pass
                    if self.index_entries[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"index_entries", self._root, self.index_entries[i]._root)
                    if self.index_entries[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"index_entries", self, self.index_entries[i]._parent)

                self._dirty = False

            class IndexEntry(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Tsm.Index.IndexHeader.IndexEntry, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._should_write_block = False
                    self.block__enabled = True

                def _read(self):
                    self.min_time = self._io.read_u8be()
                    self.max_time = self._io.read_u8be()
                    self.block_offset = self._io.read_u8be()
                    self.block_size = self._io.read_u4be()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _ = self.block
                    if hasattr(self, '_m_block'):
                        pass
                        self._m_block._fetch_instances()



                def _write__seq(self, io=None):
                    super(Tsm.Index.IndexHeader.IndexEntry, self)._write__seq(io)
                    self._should_write_block = self.block__enabled
                    self._io.write_u8be(self.min_time)
                    self._io.write_u8be(self.max_time)
                    self._io.write_u8be(self.block_offset)
                    self._io.write_u4be(self.block_size)


                def _check(self):
                    if self.block__enabled:
                        pass
                        if self._m_block._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"block", self._root, self._m_block._root)
                        if self._m_block._parent != self:
                            raise kaitaistruct.ConsistencyError(u"block", self, self._m_block._parent)

                    self._dirty = False

                class BlockEntry(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Tsm.Index.IndexHeader.IndexEntry.BlockEntry, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.crc32 = self._io.read_u4be()
                        self.data = self._io.read_bytes(self._parent.block_size - 4)
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Tsm.Index.IndexHeader.IndexEntry.BlockEntry, self)._write__seq(io)
                        self._io.write_u4be(self.crc32)
                        self._io.write_bytes(self.data)


                    def _check(self):
                        if len(self.data) != self._parent.block_size - 4:
                            raise kaitaistruct.ConsistencyError(u"data", self._parent.block_size - 4, len(self.data))
                        self._dirty = False


                @property
                def block(self):
                    if self._should_write_block:
                        self._write_block()
                    if hasattr(self, '_m_block'):
                        return self._m_block

                    if not self.block__enabled:
                        return None

                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.block_offset)
                    self._m_block = Tsm.Index.IndexHeader.IndexEntry.BlockEntry(io, self, self._root)
                    self._m_block._read()
                    io.seek(_pos)
                    return getattr(self, '_m_block', None)

                @block.setter
                def block(self, v):
                    self._dirty = True
                    self._m_block = v

                def _write_block(self):
                    self._should_write_block = False
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.block_offset)
                    self._m_block._write__seq(io)
                    io.seek(_pos)



        @property
        def entries(self):
            if self._should_write_entries:
                self._write_entries()
            if hasattr(self, '_m_entries'):
                return self._m_entries

            if not self.entries__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.offset)
            self._m_entries = []
            i = 0
            while True:
                _t__m_entries = Tsm.Index.IndexHeader(self._io, self, self._root)
                try:
                    _t__m_entries._read()
                finally:
                    _ = _t__m_entries
                    self._m_entries.append(_)
                if self._io.pos() == self._io.size() - 8:
                    break
                i += 1
            self._io.seek(_pos)
            return getattr(self, '_m_entries', None)

        @entries.setter
        def entries(self, v):
            self._dirty = True
            self._m_entries = v

        def _write_entries(self):
            self._should_write_entries = False
            _pos = self._io.pos()
            self._io.seek(self.offset)
            for i in range(len(self._m_entries)):
                pass
                self._m_entries[i]._write__seq(self._io)
                _ = self._m_entries[i]
                if (self._io.pos() == self._io.size() - 8) != (i == len(self._m_entries) - 1):
                    raise kaitaistruct.ConsistencyError(u"entries", i == len(self._m_entries) - 1, self._io.pos() == self._io.size() - 8)

            self._io.seek(_pos)


    @property
    def index(self):
        if self._should_write_index:
            self._write_index()
        if hasattr(self, '_m_index'):
            return self._m_index

        if not self.index__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self._io.size() - 8)
        self._m_index = Tsm.Index(self._io, self, self._root)
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
        self._io.seek(self._io.size() - 8)
        self._m_index._write__seq(self._io)
        self._io.seek(_pos)


