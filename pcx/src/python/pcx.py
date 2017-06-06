# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Pcx(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self._raw_hdr = self._io.read_bytes(128)
        io = KaitaiStream(BytesIO(self._raw_hdr))
        self.hdr = self._root.Header(io, self, self._root)

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.manufacturer = self._io.read_u1()
            self.version = self._io.read_u1()
            self.encoding = self._io.read_u1()
            self.bits_per_pixel = self._io.read_u1()
            self.img_x_min = self._io.read_u2le()
            self.img_y_min = self._io.read_u2le()
            self.img_x_max = self._io.read_u2le()
            self.img_y_max = self._io.read_u2le()
            self.hdpi = self._io.read_u2le()
            self.vdpi = self._io.read_u2le()
            self.colormap = self._io.read_bytes(48)
            self.reserved = self._io.read_bytes(1)
            self.num_planes = self._io.read_u1()
            self.bytes_per_line = self._io.read_u2le()
            self.palette_info = self._io.read_u2le()
            self.h_screen_size = self._io.read_u2le()
            self.v_screen_size = self._io.read_u2le()



