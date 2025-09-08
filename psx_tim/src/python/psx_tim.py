# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PsxTim(KaitaiStruct):
    """
    .. seealso::
       Source - http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics)
    
    
    .. seealso::
       Source - https://mrclick.zophar.net/TilEd/download/timgfx.txt
    
    
    .. seealso::
       Source - https://www.romhacking.net/documents/31/
    """

    class BppType(IntEnum):
        bpp_4 = 0
        bpp_8 = 1
        bpp_16 = 2
        bpp_24 = 3
    def __init__(self, _io, _parent=None, _root=None):
        super(PsxTim, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x10\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x10\x00\x00\x00", self.magic, self._io, u"/seq/0")
        self.flags = self._io.read_u4le()
        if self.has_clut:
            pass
            self.clut = PsxTim.Bitmap(self._io, self, self._root)

        self.img = PsxTim.Bitmap(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        if self.has_clut:
            pass
            self.clut._fetch_instances()

        self.img._fetch_instances()

    class Bitmap(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(PsxTim.Bitmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = self._io.read_u4le()
            self.origin_x = self._io.read_u2le()
            self.origin_y = self._io.read_u2le()
            self.width = self._io.read_u2le()
            self.height = self._io.read_u2le()
            self.body = self._io.read_bytes(self.len - 12)


        def _fetch_instances(self):
            pass


    @property
    def bpp(self):
        if hasattr(self, '_m_bpp'):
            return self._m_bpp

        self._m_bpp = self.flags & 3
        return getattr(self, '_m_bpp', None)

    @property
    def has_clut(self):
        if hasattr(self, '_m_has_clut'):
            return self._m_has_clut

        self._m_has_clut = self.flags & 8 != 0
        return getattr(self, '_m_has_clut', None)


