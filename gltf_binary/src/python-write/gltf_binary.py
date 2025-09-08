# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GltfBinary(ReadWriteKaitaiStruct):
    """glTF is a format for distribution of 3D models optimized for being used in software
    
    .. seealso::
       Source - https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout
    """

    class ChunkType(IntEnum):
        bin = 5130562
        json = 1313821514
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GltfBinary, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = GltfBinary.Header(self._io, self, self._root)
        self.header._read()
        self.chunks = []
        i = 0
        while not self._io.is_eof():
            _t_chunks = GltfBinary.Chunk(self._io, self, self._root)
            try:
                _t_chunks._read()
            finally:
                self.chunks.append(_t_chunks)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(GltfBinary, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.chunks)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"chunks", 0, self._io.size() - self._io.pos())
            self.chunks[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"chunks", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        for i in range(len(self.chunks)):
            pass
            if self.chunks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chunks", self._root, self.chunks[i]._root)
            if self.chunks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"chunks", self, self.chunks[i]._parent)

        self._dirty = False

    class Bin(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GltfBinary.Bin, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GltfBinary.Bin, self)._write__seq(io)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GltfBinary.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_data = self._io.read_u4le()
            self.type = KaitaiStream.resolve_enum(GltfBinary.ChunkType, self._io.read_u4le())
            _on = self.type
            if _on == GltfBinary.ChunkType.bin:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = GltfBinary.Bin(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == GltfBinary.ChunkType.json:
                pass
                self._raw_data = self._io.read_bytes(self.len_data)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = GltfBinary.Json(_io__raw_data, self, self._root)
                self.data._read()
            else:
                pass
                self.data = self._io.read_bytes(self.len_data)
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(GltfBinary.Chunk, self)._write__seq(io)
            self._io.write_u4le(self.len_data)
            self._io.write_u4le(int(self.type))
            _on = self.type
            if _on == GltfBinary.ChunkType.bin:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == GltfBinary.ChunkType.json:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            else:
                pass
                self._io.write_bytes(self.data)


        def _check(self):
            _on = self.type
            if _on == GltfBinary.ChunkType.bin:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == GltfBinary.ChunkType.json:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            else:
                pass
                if len(self.data) != self.len_data:
                    raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GltfBinary.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x67\x6C\x54\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x6C\x54\x46", self.magic, self._io, u"/types/header/seq/0")
            self.version = self._io.read_u4le()
            self.length = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GltfBinary.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.version)
            self._io.write_u4le(self.length)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x67\x6C\x54\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x67\x6C\x54\x46", self.magic, None, u"/types/header/seq/0")
            self._dirty = False


    class Json(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GltfBinary.Json, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(GltfBinary.Json, self)._write__seq(io)
            self._io.write_bytes((self.data).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False



