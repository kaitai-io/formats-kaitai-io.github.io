# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GltfBinary(KaitaiStruct):
    """glTF is a format for distribution of 3D models optimized for being used in software
    
    .. seealso::
       Source - https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout
    """

    class ChunkType(IntEnum):
        bin = 5130562
        json = 1313821514
    def __init__(self, _io, _parent=None, _root=None):
        super(GltfBinary, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = GltfBinary.Header(self._io, self, self._root)
        self.chunks = []
        i = 0
        while not self._io.is_eof():
            self.chunks.append(GltfBinary.Chunk(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._fetch_instances()


    class Bin(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GltfBinary.Bin, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GltfBinary.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.type = KaitaiStream.resolve_enum(GltfBinary.ChunkType, self._io.read_u4le())
            _on = self.type
            if _on == GltfBinary.ChunkType.bin:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = GltfBinary.Bin(_io__raw_data, self, self._root)
            elif _on == GltfBinary.ChunkType.json:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = GltfBinary.Json(_io__raw_data, self, self._root)
            else:
                pass
                self.data = self._io.read_bytes(self.len_data)


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == GltfBinary.ChunkType.bin:
                pass
                self.data._fetch_instances()
            elif _on == GltfBinary.ChunkType.json:
                pass
                self.data._fetch_instances()
            else:
                pass


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GltfBinary.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x67\x6C\x54\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x6C\x54\x46", self.magic, self._io, u"/types/header/seq/0")
            self.version = self._io.read_u4le()
            self.length = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Json(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GltfBinary.Json, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data = (self._io.read_bytes_full()).decode(u"UTF-8")


        def _fetch_instances(self):
            pass



