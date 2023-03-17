# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Dune2Pak(KaitaiStruct):
    """
    .. seealso::
       Source - https://moddingwiki.shikadi.net/wiki/PAK_Format_(Westwood)
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self._raw_dir = self._io.read_bytes(self.dir_size)
        _io__raw_dir = KaitaiStream(BytesIO(self._raw_dir))
        self.dir = Dune2Pak.Files(_io__raw_dir, self, self._root)

    class Files(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.files = []
            i = 0
            while not self._io.is_eof():
                self.files.append(Dune2Pak.File(i, self._io, self, self._root))
                i += 1



    class File(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.idx = idx
            self._read()

        def _read(self):
            self.ofs = self._io.read_u4le()
            if self.ofs != 0:
                self.file_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")


        @property
        def next_ofs0(self):
            if hasattr(self, '_m_next_ofs0'):
                return self._m_next_ofs0

            if self.ofs != 0:
                self._m_next_ofs0 = self._root.dir.files[(self.idx + 1)].ofs

            return getattr(self, '_m_next_ofs0', None)

        @property
        def next_ofs(self):
            if hasattr(self, '_m_next_ofs'):
                return self._m_next_ofs

            if self.ofs != 0:
                self._m_next_ofs = (self._root._io.size() if self.next_ofs0 == 0 else self.next_ofs0)

            return getattr(self, '_m_next_ofs', None)

        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body

            if self.ofs != 0:
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs)
                self._m_body = io.read_bytes((self.next_ofs - self.ofs))
                io.seek(_pos)

            return getattr(self, '_m_body', None)


    @property
    def dir_size(self):
        if hasattr(self, '_m_dir_size'):
            return self._m_dir_size

        _pos = self._io.pos()
        self._io.seek(0)
        self._m_dir_size = self._io.read_u4le()
        self._io.seek(_pos)
        return getattr(self, '_m_dir_size', None)


