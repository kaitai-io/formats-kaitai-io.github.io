# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PsxTim(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PsxTim, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x10\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x10\x00\x00\x00", self.magic, self._io, u"/seq/0")
        self.flags = self._io.read_u4le()
        if self.has_clut:
            pass
            self.clut = PsxTim.Bitmap(self._io, self, self._root)
            self.clut._read()

        self.img = PsxTim.Bitmap(self._io, self, self._root)
        self.img._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.has_clut:
            pass
            self.clut._fetch_instances()

        self.img._fetch_instances()


    def _write__seq(self, io=None):
        super(PsxTim, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.flags)
        if self.has_clut:
            pass
            self.clut._write__seq(self._io)

        self.img._write__seq(self._io)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x10\x00\x00\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x10\x00\x00\x00", self.magic, None, u"/seq/0")
        if self.has_clut:
            pass
            if self.clut._root != self._root:
                raise kaitaistruct.ConsistencyError(u"clut", self._root, self.clut._root)
            if self.clut._parent != self:
                raise kaitaistruct.ConsistencyError(u"clut", self, self.clut._parent)

        if self.img._root != self._root:
            raise kaitaistruct.ConsistencyError(u"img", self._root, self.img._root)
        if self.img._parent != self:
            raise kaitaistruct.ConsistencyError(u"img", self, self.img._parent)
        self._dirty = False

    class Bitmap(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PsxTim.Bitmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u4le()
            self.origin_x = self._io.read_u2le()
            self.origin_y = self._io.read_u2le()
            self.width = self._io.read_u2le()
            self.height = self._io.read_u2le()
            self.body = self._io.read_bytes(self.len - 12)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PsxTim.Bitmap, self)._write__seq(io)
            self._io.write_u4le(self.len)
            self._io.write_u2le(self.origin_x)
            self._io.write_u2le(self.origin_y)
            self._io.write_u2le(self.width)
            self._io.write_u2le(self.height)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != self.len - 12:
                raise kaitaistruct.ConsistencyError(u"body", self.len - 12, len(self.body))
            self._dirty = False


    @property
    def bpp(self):
        if hasattr(self, '_m_bpp'):
            return self._m_bpp

        self._m_bpp = self.flags & 3
        return getattr(self, '_m_bpp', None)

    def _invalidate_bpp(self):
        del self._m_bpp
    @property
    def has_clut(self):
        if hasattr(self, '_m_has_clut'):
            return self._m_has_clut

        self._m_has_clut = self.flags & 8 != 0
        return getattr(self, '_m_has_clut', None)

    def _invalidate_has_clut(self):
        del self._m_has_clut

