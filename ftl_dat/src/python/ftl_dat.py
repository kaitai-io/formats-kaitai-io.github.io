# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class FtlDat(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.num_files = self._io.read_u4le()
        self.files = [None] * (self.num_files)
        for i in range(self.num_files):
            self.files[i] = self._root.File(self._io, self, self._root)


    class File(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.meta_ofs = self._io.read_u4le()

        @property
        def meta(self):
            if hasattr(self, '_m_meta'):
                return self._m_meta if hasattr(self, '_m_meta') else None

            if self.meta_ofs != 0:
                _pos = self._io.pos()
                self._io.seek(self.meta_ofs)
                self._m_meta = self._root.Meta(self._io, self, self._root)
                self._io.seek(_pos)

            return self._m_meta if hasattr(self, '_m_meta') else None


    class Meta(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.file_size = self._io.read_u4le()
            self.filename_size = self._io.read_u4le()
            self.filename = (self._io.read_bytes(self.filename_size)).decode(u"UTF-8")
            self.body = self._io.read_bytes(self.file_size)



