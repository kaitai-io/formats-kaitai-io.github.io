# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class BlenderBlend(KaitaiStruct):

    class PtrSize(Enum):
        bits_64 = 45
        bits_32 = 95

    class Endian(Enum):
        be = 86
        le = 118
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.hdr = self._root.Header(self._io, self, self._root)
        self.blocks = []
        while not self._io.is_eof():
            self.blocks.append(self._root.FileBlock(self._io, self, self._root))


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(struct.pack('7b', 66, 76, 69, 78, 68, 69, 82))
            self.ptr_size_id = self._root.PtrSize(self._io.read_u1())
            self.endian = self._root.Endian(self._io.read_u1())
            self.version = (self._io.read_bytes(3)).decode(u"ASCII")

        @property
        def psize(self):
            """Number of bytes that a pointer occupies."""
            if hasattr(self, '_m_psize'):
                return self._m_psize if hasattr(self, '_m_psize') else None

            self._m_psize = (8 if self.ptr_size_id == self._root.PtrSize.bits_64 else 4)
            return self._m_psize if hasattr(self, '_m_psize') else None


    class FileBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.code = (self._io.read_bytes(4)).decode(u"ASCII")
            self.size = self._io.read_u4le()
            self.mem_addr = self._io.read_bytes(self._root.hdr.psize)
            self.sdna_index = self._io.read_u4le()
            self.count = self._io.read_u4le()
            self.body = self._io.read_bytes(self.size)



