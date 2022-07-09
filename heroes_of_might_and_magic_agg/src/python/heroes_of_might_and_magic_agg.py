# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class HeroesOfMightAndMagicAgg(KaitaiStruct):
    """
    .. seealso::
       Source - https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.num_files = self._io.read_u2le()
        self.entries = []
        for i in range(self.num_files):
            self.entries.append(HeroesOfMightAndMagicAgg.Entry(self._io, self, self._root))


    class Entry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.hash = self._io.read_u2le()
            self.offset = self._io.read_u4le()
            self.size = self._io.read_u4le()
            self.size2 = self._io.read_u4le()

        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body

            _pos = self._io.pos()
            self._io.seek(self.offset)
            self._m_body = self._io.read_bytes(self.size)
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)


    class Filename(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.str = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


    @property
    def filenames(self):
        if hasattr(self, '_m_filenames'):
            return self._m_filenames

        _pos = self._io.pos()
        self._io.seek((self.entries[-1].offset + self.entries[-1].size))
        self._raw__m_filenames = []
        self._m_filenames = []
        for i in range(self.num_files):
            self._raw__m_filenames.append(self._io.read_bytes(15))
            _io__raw__m_filenames = KaitaiStream(BytesIO(self._raw__m_filenames[i]))
            self._m_filenames.append(HeroesOfMightAndMagicAgg.Filename(_io__raw__m_filenames, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_filenames', None)


