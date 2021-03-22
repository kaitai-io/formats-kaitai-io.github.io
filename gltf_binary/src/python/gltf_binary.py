# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class GltfBinary(KaitaiStruct):
    """glTF is a format for distribution of 3D models optimized for being used in software
    
    .. seealso::
       Source - https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout
    """

    class ChunkType(Enum):
        bin = 5130562
        json = 1313821514
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = GltfBinary.Header(self._io, self, self._root)
        self.chunks = []
        i = 0
        while not self._io.is_eof():
            self.chunks.append(GltfBinary.Chunk(self._io, self, self._root))
            i += 1


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x67\x6C\x54\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x6C\x54\x46", self.magic, self._io, u"/types/header/seq/0")
            self.version = self._io.read_u4le()
            self.length = self._io.read_u4le()


    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.type = KaitaiStream.resolve_enum(GltfBinary.ChunkType, self._io.read_u4le())
            _on = self.type
            if _on == GltfBinary.ChunkType.json:
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = GltfBinary.Json(_io__raw_data, self, self._root)
            elif _on == GltfBinary.ChunkType.bin:
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = GltfBinary.Bin(_io__raw_data, self, self._root)
            else:
                self.data = self._io.read_bytes(self.len_data)


    class Json(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.data = (self._io.read_bytes_full()).decode(u"UTF-8")


    class Bin(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.data = self._io.read_bytes_full()



