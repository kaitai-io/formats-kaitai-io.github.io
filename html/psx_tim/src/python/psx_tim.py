# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class PsxTim(KaitaiStruct):

    class BppType(Enum):
        bpp_4 = 0
        bpp_8 = 1
        bpp_16 = 2
        bpp_24 = 3
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(b"\x10\x00\x00\x00")
        self.flags = self._io.read_u4le()
        if self.has_clut:
            self.clut = self._root.Bitmap(self._io, self, self._root)

        self.img = self._root.Bitmap(self._io, self, self._root)

    class Bitmap(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len = self._io.read_u4le()
            self.origin_x = self._io.read_u2le()
            self.origin_y = self._io.read_u2le()
            self.width = self._io.read_u2le()
            self.height = self._io.read_u2le()
            self.body = self._io.read_bytes((self.len - 12))


    @property
    def has_clut(self):
        if hasattr(self, '_m_has_clut'):
            return self._m_has_clut if hasattr(self, '_m_has_clut') else None

        self._m_has_clut = (self.flags & 8) != 0
        return self._m_has_clut if hasattr(self, '_m_has_clut') else None

    @property
    def bpp(self):
        if hasattr(self, '_m_bpp'):
            return self._m_bpp if hasattr(self, '_m_bpp') else None

        self._m_bpp = (self.flags & 3)
        return self._m_bpp if hasattr(self, '_m_bpp') else None


