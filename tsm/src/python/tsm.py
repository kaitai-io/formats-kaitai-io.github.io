# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Tsm(KaitaiStruct):
    """InfluxDB is a scalable database optimized for storage of time
    series, real-time application metrics, operations monitoring events,
    etc, written in Go.
    
    Data is stored in .tsm files, which are kept pretty simple
    conceptually. Each .tsm file contains a header and footer, which
    stores offset to an index. Index is used to find a data block for a
    requested time boundary.
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Tsm, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = Tsm.Header(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Tsm.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x16\xD1\x16\xD1":
                raise kaitaistruct.ValidationNotEqualError(b"\x16\xD1\x16\xD1", self.magic, self._io, u"/types/header/seq/0")
            self.version = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class Index(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Tsm.Index, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.offset = self._io.read_u8be()


        def _fetch_instances(self):
            pass
            _ = self.entries
            if hasattr(self, '_m_entries'):
                pass
                for i in range(len(self._m_entries)):
                    pass
                    self._m_entries[i]._fetch_instances()



        class IndexHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Tsm.Index.IndexHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.key_len = self._io.read_u2be()
                self.key = (self._io.read_bytes(self.key_len)).decode(u"UTF-8")
                self.type = self._io.read_u1()
                self.entry_count = self._io.read_u2be()
                self.index_entries = []
                for i in range(self.entry_count):
                    self.index_entries.append(Tsm.Index.IndexHeader.IndexEntry(self._io, self, self._root))



            def _fetch_instances(self):
                pass
                for i in range(len(self.index_entries)):
                    pass
                    self.index_entries[i]._fetch_instances()


            class IndexEntry(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    super(Tsm.Index.IndexHeader.IndexEntry, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._read()

                def _read(self):
                    self.min_time = self._io.read_u8be()
                    self.max_time = self._io.read_u8be()
                    self.block_offset = self._io.read_u8be()
                    self.block_size = self._io.read_u4be()


                def _fetch_instances(self):
                    pass
                    _ = self.block
                    if hasattr(self, '_m_block'):
                        pass
                        self._m_block._fetch_instances()


                class BlockEntry(KaitaiStruct):
                    def __init__(self, _io, _parent=None, _root=None):
                        super(Tsm.Index.IndexHeader.IndexEntry.BlockEntry, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._read()

                    def _read(self):
                        self.crc32 = self._io.read_u4be()
                        self.data = self._io.read_bytes(self._parent.block_size - 4)


                    def _fetch_instances(self):
                        pass


                @property
                def block(self):
                    if hasattr(self, '_m_block'):
                        return self._m_block

                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self.block_offset)
                    self._m_block = Tsm.Index.IndexHeader.IndexEntry.BlockEntry(io, self, self._root)
                    io.seek(_pos)
                    return getattr(self, '_m_block', None)



        @property
        def entries(self):
            if hasattr(self, '_m_entries'):
                return self._m_entries

            _pos = self._io.pos()
            self._io.seek(self.offset)
            self._m_entries = []
            i = 0
            while True:
                _ = Tsm.Index.IndexHeader(self._io, self, self._root)
                self._m_entries.append(_)
                if self._io.pos() == self._io.size() - 8:
                    break
                i += 1
            self._io.seek(_pos)
            return getattr(self, '_m_entries', None)


    @property
    def index(self):
        if hasattr(self, '_m_index'):
            return self._m_index

        _pos = self._io.pos()
        self._io.seek(self._io.size() - 8)
        self._m_index = Tsm.Index(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)


