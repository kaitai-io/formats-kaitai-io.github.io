# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class HeroesOfMightAndMagicAgg(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(HeroesOfMightAndMagicAgg, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_filenames = False
        self.filenames__enabled = True

    def _read(self):
        self.num_files = self._io.read_u2le()
        self.entries = []
        for i in range(self.num_files):
            _t_entries = HeroesOfMightAndMagicAgg.Entry(self._io, self, self._root)
            try:
                _t_entries._read()
            finally:
                self.entries.append(_t_entries)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()

        _ = self.filenames
        if hasattr(self, '_m_filenames'):
            pass
            for i in range(len(self._m_filenames)):
                pass
                self._m_filenames[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(HeroesOfMightAndMagicAgg, self)._write__seq(io)
        self._should_write_filenames = self.filenames__enabled
        self._io.write_u2le(self.num_files)
        for i in range(len(self.entries)):
            pass
            self.entries[i]._write__seq(self._io)



    def _check(self):
        if len(self.entries) != self.num_files:
            raise kaitaistruct.ConsistencyError(u"entries", self.num_files, len(self.entries))
        for i in range(len(self.entries)):
            pass
            if self.entries[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
            if self.entries[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

        if self.filenames__enabled:
            pass
            if len(self._m_filenames) != self.num_files:
                raise kaitaistruct.ConsistencyError(u"filenames", self.num_files, len(self._m_filenames))
            for i in range(len(self._m_filenames)):
                pass
                if self._m_filenames[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"filenames", self._root, self._m_filenames[i]._root)
                if self._m_filenames[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"filenames", self, self._m_filenames[i]._parent)


        self._dirty = False

    class Entry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(HeroesOfMightAndMagicAgg.Entry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.hash = self._io.read_u2le()
            self.offset = self._io.read_u4le()
            self.size = self._io.read_u4le()
            self.size2 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(HeroesOfMightAndMagicAgg.Entry, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u2le(self.hash)
            self._io.write_u4le(self.offset)
            self._io.write_u4le(self.size)
            self._io.write_u4le(self.size2)


        def _check(self):
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

            _pos = self._io.pos()
            self._io.seek(self.offset)
            self._m_body = self._io.read_bytes(self.size)
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.offset)
            self._io.write_bytes(self._m_body)
            self._io.seek(_pos)


    class Filename(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(HeroesOfMightAndMagicAgg.Filename, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.str = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(HeroesOfMightAndMagicAgg.Filename, self)._write__seq(io)
            self._io.write_bytes((self.str).encode(u"ASCII"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.str).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"str", -1, KaitaiStream.byte_array_index_of((self.str).encode(u"ASCII"), 0))
            self._dirty = False


    @property
    def filenames(self):
        if self._should_write_filenames:
            self._write_filenames()
        if hasattr(self, '_m_filenames'):
            return self._m_filenames

        if not self.filenames__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.entries[-1].offset + self.entries[-1].size)
        self._raw__m_filenames = []
        self._m_filenames = []
        for i in range(self.num_files):
            self._raw__m_filenames.append(self._io.read_bytes(15))
            _io__raw__m_filenames = KaitaiStream(BytesIO(self._raw__m_filenames[i]))
            _t__m_filenames = HeroesOfMightAndMagicAgg.Filename(_io__raw__m_filenames, self, self._root)
            try:
                _t__m_filenames._read()
            finally:
                self._m_filenames.append(_t__m_filenames)

        self._io.seek(_pos)
        return getattr(self, '_m_filenames', None)

    @filenames.setter
    def filenames(self, v):
        self._dirty = True
        self._m_filenames = v

    def _write_filenames(self):
        self._should_write_filenames = False
        _pos = self._io.pos()
        self._io.seek(self.entries[-1].offset + self.entries[-1].size)
        self._raw__m_filenames = []
        for i in range(len(self._m_filenames)):
            pass
            _io__raw__m_filenames = KaitaiStream(BytesIO(bytearray(15)))
            self._io.add_child_stream(_io__raw__m_filenames)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (15))
            def handler(parent, _io__raw__m_filenames=_io__raw__m_filenames, i=i):
                self._raw__m_filenames.append(_io__raw__m_filenames.to_byte_array())
                if len(self._raw__m_filenames[i]) != 15:
                    raise kaitaistruct.ConsistencyError(u"raw(filenames)", 15, len(self._raw__m_filenames[i]))
                parent.write_bytes(self._raw__m_filenames[i])
            _io__raw__m_filenames.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_filenames[i]._write__seq(_io__raw__m_filenames)

        self._io.seek(_pos)


