# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Vp8Ivf(KaitaiStruct):
    """
    .. seealso::
       Source - https://wiki.multimedia.cx/index.php/IVF
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic1 = self._io.ensure_fixed_contents(b"\x44\x4B\x49\x46")
        self.version = self._io.read_u2le()
        self.len_header = self._io.read_u2le()
        self.codec = self._io.ensure_fixed_contents(b"\x56\x50\x38\x30")
        self.width = self._io.read_u2le()
        self.height = self._io.read_u2le()
        self.framerate = self._io.read_u4le()
        self.timescale = self._io.read_u4le()
        self.num_frames = self._io.read_u4le()
        self.unused = self._io.read_u4le()
        self.image_data = [None] * (self.num_frames)
        for i in range(self.num_frames):
            self.image_data[i] = self._root.Blocks(self._io, self, self._root)


    class Blocks(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = self._root.Block(self._io, self, self._root)


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_frame = self._io.read_u4le()
            self.timestamp = self._io.read_u8le()
            self.framedata = self._io.read_bytes(self.len_frame)



