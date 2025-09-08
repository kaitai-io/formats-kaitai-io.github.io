# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Pcx(ReadWriteKaitaiStruct):
    """PCX is a bitmap image format originally used by PC Paintbrush from
    ZSoft Corporation. Originally, it was a relatively simple 128-byte
    header + uncompressed bitmap format, but latest versions introduced
    more complicated palette support and RLE compression.
    
    There's an option to encode 32-bit or 16-bit RGBA pixels, and thus
    it can potentially include transparency. Theoretically, it's
    possible to encode resolution or pixel density in the some of the
    header fields too, but in reality there's no uniform standard for
    these, so different implementations treat these differently.
    
    PCX format was never made a formal standard. "ZSoft Corporation
    Technical Reference Manual" for "Image File (.PCX) Format", last
    updated in 1991, is likely the closest authoritative source.
    
    .. seealso::
       Source - https://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt
    """

    class Encodings(IntEnum):
        rle = 1

    class Versions(IntEnum):
        v2_5 = 0
        v2_8_with_palette = 2
        v2_8_without_palette = 3
        paintbrush_for_windows = 4
        v3_0 = 5
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Pcx, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_palette_256 = False
        self.palette_256__enabled = True

    def _read(self):
        self._raw_hdr = self._io.read_bytes(128)
        _io__raw_hdr = KaitaiStream(BytesIO(self._raw_hdr))
        self.hdr = Pcx.Header(_io__raw_hdr, self, self._root)
        self.hdr._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        _ = self.palette_256
        if hasattr(self, '_m_palette_256'):
            pass
            self._m_palette_256._fetch_instances()



    def _write__seq(self, io=None):
        super(Pcx, self)._write__seq(io)
        self._should_write_palette_256 = self.palette_256__enabled
        _io__raw_hdr = KaitaiStream(BytesIO(bytearray(128)))
        self._io.add_child_stream(_io__raw_hdr)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (128))
        def handler(parent, _io__raw_hdr=_io__raw_hdr):
            self._raw_hdr = _io__raw_hdr.to_byte_array()
            if len(self._raw_hdr) != 128:
                raise kaitaistruct.ConsistencyError(u"raw(hdr)", 128, len(self._raw_hdr))
            parent.write_bytes(self._raw_hdr)
        _io__raw_hdr.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.hdr._write__seq(_io__raw_hdr)


    def _check(self):
        if self.hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"hdr", self._root, self.hdr._root)
        if self.hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"hdr", self, self.hdr._parent)
        if self.palette_256__enabled:
            pass
            if  ((self.hdr.version == Pcx.Versions.v3_0) and (self.hdr.bits_per_pixel == 8) and (self.hdr.num_planes == 1)) :
                pass
                if self._m_palette_256._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"palette_256", self._root, self._m_palette_256._root)
                if self._m_palette_256._parent != self:
                    raise kaitaistruct.ConsistencyError(u"palette_256", self, self._m_palette_256._parent)


        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - "ZSoft .PCX FILE HEADER FORMAT" - https://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pcx.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(1)
            if not self.magic == b"\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x0A", self.magic, self._io, u"/types/header/seq/0")
            self.version = KaitaiStream.resolve_enum(Pcx.Versions, self._io.read_u1())
            self.encoding = KaitaiStream.resolve_enum(Pcx.Encodings, self._io.read_u1())
            self.bits_per_pixel = self._io.read_u1()
            self.img_x_min = self._io.read_u2le()
            self.img_y_min = self._io.read_u2le()
            self.img_x_max = self._io.read_u2le()
            self.img_y_max = self._io.read_u2le()
            self.hdpi = self._io.read_u2le()
            self.vdpi = self._io.read_u2le()
            self.palette_16 = self._io.read_bytes(48)
            self.reserved = self._io.read_bytes(1)
            if not self.reserved == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.reserved, self._io, u"/types/header/seq/11")
            self.num_planes = self._io.read_u1()
            self.bytes_per_line = self._io.read_u2le()
            self.palette_info = self._io.read_u2le()
            self.h_screen_size = self._io.read_u2le()
            self.v_screen_size = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Pcx.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u1(int(self.version))
            self._io.write_u1(int(self.encoding))
            self._io.write_u1(self.bits_per_pixel)
            self._io.write_u2le(self.img_x_min)
            self._io.write_u2le(self.img_y_min)
            self._io.write_u2le(self.img_x_max)
            self._io.write_u2le(self.img_y_max)
            self._io.write_u2le(self.hdpi)
            self._io.write_u2le(self.vdpi)
            self._io.write_bytes(self.palette_16)
            self._io.write_bytes(self.reserved)
            self._io.write_u1(self.num_planes)
            self._io.write_u2le(self.bytes_per_line)
            self._io.write_u2le(self.palette_info)
            self._io.write_u2le(self.h_screen_size)
            self._io.write_u2le(self.v_screen_size)


        def _check(self):
            if len(self.magic) != 1:
                raise kaitaistruct.ConsistencyError(u"magic", 1, len(self.magic))
            if not self.magic == b"\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x0A", self.magic, None, u"/types/header/seq/0")
            if len(self.palette_16) != 48:
                raise kaitaistruct.ConsistencyError(u"palette_16", 48, len(self.palette_16))
            if len(self.reserved) != 1:
                raise kaitaistruct.ConsistencyError(u"reserved", 1, len(self.reserved))
            if not self.reserved == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.reserved, None, u"/types/header/seq/11")
            self._dirty = False


    class Rgb(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pcx.Rgb, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Pcx.Rgb, self)._write__seq(io)
            self._io.write_u1(self.r)
            self._io.write_u1(self.g)
            self._io.write_u1(self.b)


        def _check(self):
            self._dirty = False


    class TPalette256(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pcx.TPalette256, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(1)
            if not self.magic == b"\x0C":
                raise kaitaistruct.ValidationNotEqualError(b"\x0C", self.magic, self._io, u"/types/t_palette_256/seq/0")
            self.colors = []
            for i in range(256):
                _t_colors = Pcx.Rgb(self._io, self, self._root)
                try:
                    _t_colors._read()
                finally:
                    self.colors.append(_t_colors)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.colors)):
                pass
                self.colors[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Pcx.TPalette256, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            for i in range(len(self.colors)):
                pass
                self.colors[i]._write__seq(self._io)



        def _check(self):
            if len(self.magic) != 1:
                raise kaitaistruct.ConsistencyError(u"magic", 1, len(self.magic))
            if not self.magic == b"\x0C":
                raise kaitaistruct.ValidationNotEqualError(b"\x0C", self.magic, None, u"/types/t_palette_256/seq/0")
            if len(self.colors) != 256:
                raise kaitaistruct.ConsistencyError(u"colors", 256, len(self.colors))
            for i in range(len(self.colors)):
                pass
                if self.colors[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"colors", self._root, self.colors[i]._root)
                if self.colors[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"colors", self, self.colors[i]._parent)

            self._dirty = False


    @property
    def palette_256(self):
        """
        .. seealso::
           - "VGA 256 Color Palette Information" - https://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt
        """
        if self._should_write_palette_256:
            self._write_palette_256()
        if hasattr(self, '_m_palette_256'):
            return self._m_palette_256

        if not self.palette_256__enabled:
            return None

        if  ((self.hdr.version == Pcx.Versions.v3_0) and (self.hdr.bits_per_pixel == 8) and (self.hdr.num_planes == 1)) :
            pass
            _pos = self._io.pos()
            self._io.seek(self._io.size() - 769)
            self._m_palette_256 = Pcx.TPalette256(self._io, self, self._root)
            self._m_palette_256._read()
            self._io.seek(_pos)

        return getattr(self, '_m_palette_256', None)

    @palette_256.setter
    def palette_256(self, v):
        self._dirty = True
        self._m_palette_256 = v

    def _write_palette_256(self):
        self._should_write_palette_256 = False
        if  ((self.hdr.version == Pcx.Versions.v3_0) and (self.hdr.bits_per_pixel == 8) and (self.hdr.num_planes == 1)) :
            pass
            _pos = self._io.pos()
            self._io.seek(self._io.size() - 769)
            self._m_palette_256._write__seq(self._io)
            self._io.seek(_pos)



