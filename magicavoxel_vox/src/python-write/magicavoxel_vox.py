# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MagicavoxelVox(ReadWriteKaitaiStruct):
    """
    .. seealso::
       MagicaVoxel Homepage - https://ephtracy.github.io/
    
    
    .. seealso::
       Format Description - https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt
    """

    class ChunkType(IntEnum):
        main = 1296124238
        matt = 1296127060
        pack = 1346454347
        rgba = 1380401729
        size = 1397316165
        xyzi = 1482250825

    class MaterialType(IntEnum):
        diffuse = 0
        metal = 1
        glass = 2
        emissive = 3

    class PropertyBitsType(IntEnum):
        plastic = 1
        roughness = 2
        specular = 4
        ior = 8
        attenuation = 16
        power = 32
        glow = 64
        is_total_power = 128
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MagicavoxelVox, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x56\x4F\x58\x20":
            raise kaitaistruct.ValidationNotEqualError(b"\x56\x4F\x58\x20", self.magic, self._io, u"/seq/0")
        self.version = self._io.read_u4le()
        self.main = MagicavoxelVox.Chunk(self._io, self, self._root)
        self.main._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.main._fetch_instances()


    def _write__seq(self, io=None):
        super(MagicavoxelVox, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.version)
        self.main._write__seq(self._io)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x56\x4F\x58\x20":
            raise kaitaistruct.ValidationNotEqualError(b"\x56\x4F\x58\x20", self.magic, None, u"/seq/0")
        if self.main._root != self._root:
            raise kaitaistruct.ConsistencyError(u"main", self._root, self.main._root)
        if self.main._parent != self:
            raise kaitaistruct.ConsistencyError(u"main", self, self.main._parent)
        self._dirty = False

    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chunk_id = KaitaiStream.resolve_enum(MagicavoxelVox.ChunkType, self._io.read_u4be())
            self.num_bytes_of_chunk_content = self._io.read_u4le()
            self.num_bytes_of_children_chunks = self._io.read_u4le()
            if self.num_bytes_of_chunk_content != 0:
                pass
                _on = self.chunk_id
                if _on == MagicavoxelVox.ChunkType.matt:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Matt(_io__raw_chunk_content, self, self._root)
                    self.chunk_content._read()
                elif _on == MagicavoxelVox.ChunkType.pack:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Pack(_io__raw_chunk_content, self, self._root)
                    self.chunk_content._read()
                elif _on == MagicavoxelVox.ChunkType.rgba:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Rgba(_io__raw_chunk_content, self, self._root)
                    self.chunk_content._read()
                elif _on == MagicavoxelVox.ChunkType.size:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Size(_io__raw_chunk_content, self, self._root)
                    self.chunk_content._read()
                elif _on == MagicavoxelVox.ChunkType.xyzi:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Xyzi(_io__raw_chunk_content, self, self._root)
                    self.chunk_content._read()
                else:
                    pass
                    self.chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)

            if self.num_bytes_of_children_chunks != 0:
                pass
                self.children_chunks = []
                i = 0
                while not self._io.is_eof():
                    _t_children_chunks = MagicavoxelVox.Chunk(self._io, self, self._root)
                    try:
                        _t_children_chunks._read()
                    finally:
                        self.children_chunks.append(_t_children_chunks)
                    i += 1


            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.num_bytes_of_chunk_content != 0:
                pass
                _on = self.chunk_id
                if _on == MagicavoxelVox.ChunkType.matt:
                    pass
                    self.chunk_content._fetch_instances()
                elif _on == MagicavoxelVox.ChunkType.pack:
                    pass
                    self.chunk_content._fetch_instances()
                elif _on == MagicavoxelVox.ChunkType.rgba:
                    pass
                    self.chunk_content._fetch_instances()
                elif _on == MagicavoxelVox.ChunkType.size:
                    pass
                    self.chunk_content._fetch_instances()
                elif _on == MagicavoxelVox.ChunkType.xyzi:
                    pass
                    self.chunk_content._fetch_instances()
                else:
                    pass

            if self.num_bytes_of_children_chunks != 0:
                pass
                for i in range(len(self.children_chunks)):
                    pass
                    self.children_chunks[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(MagicavoxelVox.Chunk, self)._write__seq(io)
            self._io.write_u4be(int(self.chunk_id))
            self._io.write_u4le(self.num_bytes_of_chunk_content)
            self._io.write_u4le(self.num_bytes_of_children_chunks)
            if self.num_bytes_of_chunk_content != 0:
                pass
                _on = self.chunk_id
                if _on == MagicavoxelVox.ChunkType.matt:
                    pass
                    _io__raw_chunk_content = KaitaiStream(BytesIO(bytearray(self.num_bytes_of_chunk_content)))
                    self._io.add_child_stream(_io__raw_chunk_content)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.num_bytes_of_chunk_content))
                    def handler(parent, _io__raw_chunk_content=_io__raw_chunk_content):
                        self._raw_chunk_content = _io__raw_chunk_content.to_byte_array()
                        if len(self._raw_chunk_content) != self.num_bytes_of_chunk_content:
                            raise kaitaistruct.ConsistencyError(u"raw(chunk_content)", self.num_bytes_of_chunk_content, len(self._raw_chunk_content))
                        parent.write_bytes(self._raw_chunk_content)
                    _io__raw_chunk_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.chunk_content._write__seq(_io__raw_chunk_content)
                elif _on == MagicavoxelVox.ChunkType.pack:
                    pass
                    _io__raw_chunk_content = KaitaiStream(BytesIO(bytearray(self.num_bytes_of_chunk_content)))
                    self._io.add_child_stream(_io__raw_chunk_content)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.num_bytes_of_chunk_content))
                    def handler(parent, _io__raw_chunk_content=_io__raw_chunk_content):
                        self._raw_chunk_content = _io__raw_chunk_content.to_byte_array()
                        if len(self._raw_chunk_content) != self.num_bytes_of_chunk_content:
                            raise kaitaistruct.ConsistencyError(u"raw(chunk_content)", self.num_bytes_of_chunk_content, len(self._raw_chunk_content))
                        parent.write_bytes(self._raw_chunk_content)
                    _io__raw_chunk_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.chunk_content._write__seq(_io__raw_chunk_content)
                elif _on == MagicavoxelVox.ChunkType.rgba:
                    pass
                    _io__raw_chunk_content = KaitaiStream(BytesIO(bytearray(self.num_bytes_of_chunk_content)))
                    self._io.add_child_stream(_io__raw_chunk_content)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.num_bytes_of_chunk_content))
                    def handler(parent, _io__raw_chunk_content=_io__raw_chunk_content):
                        self._raw_chunk_content = _io__raw_chunk_content.to_byte_array()
                        if len(self._raw_chunk_content) != self.num_bytes_of_chunk_content:
                            raise kaitaistruct.ConsistencyError(u"raw(chunk_content)", self.num_bytes_of_chunk_content, len(self._raw_chunk_content))
                        parent.write_bytes(self._raw_chunk_content)
                    _io__raw_chunk_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.chunk_content._write__seq(_io__raw_chunk_content)
                elif _on == MagicavoxelVox.ChunkType.size:
                    pass
                    _io__raw_chunk_content = KaitaiStream(BytesIO(bytearray(self.num_bytes_of_chunk_content)))
                    self._io.add_child_stream(_io__raw_chunk_content)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.num_bytes_of_chunk_content))
                    def handler(parent, _io__raw_chunk_content=_io__raw_chunk_content):
                        self._raw_chunk_content = _io__raw_chunk_content.to_byte_array()
                        if len(self._raw_chunk_content) != self.num_bytes_of_chunk_content:
                            raise kaitaistruct.ConsistencyError(u"raw(chunk_content)", self.num_bytes_of_chunk_content, len(self._raw_chunk_content))
                        parent.write_bytes(self._raw_chunk_content)
                    _io__raw_chunk_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.chunk_content._write__seq(_io__raw_chunk_content)
                elif _on == MagicavoxelVox.ChunkType.xyzi:
                    pass
                    _io__raw_chunk_content = KaitaiStream(BytesIO(bytearray(self.num_bytes_of_chunk_content)))
                    self._io.add_child_stream(_io__raw_chunk_content)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.num_bytes_of_chunk_content))
                    def handler(parent, _io__raw_chunk_content=_io__raw_chunk_content):
                        self._raw_chunk_content = _io__raw_chunk_content.to_byte_array()
                        if len(self._raw_chunk_content) != self.num_bytes_of_chunk_content:
                            raise kaitaistruct.ConsistencyError(u"raw(chunk_content)", self.num_bytes_of_chunk_content, len(self._raw_chunk_content))
                        parent.write_bytes(self._raw_chunk_content)
                    _io__raw_chunk_content.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.chunk_content._write__seq(_io__raw_chunk_content)
                else:
                    pass
                    self._io.write_bytes(self.chunk_content)

            if self.num_bytes_of_children_chunks != 0:
                pass
                for i in range(len(self.children_chunks)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"children_chunks", 0, self._io.size() - self._io.pos())
                    self.children_chunks[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"children_chunks", 0, self._io.size() - self._io.pos())



        def _check(self):
            if self.num_bytes_of_chunk_content != 0:
                pass
                _on = self.chunk_id
                if _on == MagicavoxelVox.ChunkType.matt:
                    pass
                    if self.chunk_content._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self._root, self.chunk_content._root)
                    if self.chunk_content._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self, self.chunk_content._parent)
                elif _on == MagicavoxelVox.ChunkType.pack:
                    pass
                    if self.chunk_content._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self._root, self.chunk_content._root)
                    if self.chunk_content._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self, self.chunk_content._parent)
                elif _on == MagicavoxelVox.ChunkType.rgba:
                    pass
                    if self.chunk_content._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self._root, self.chunk_content._root)
                    if self.chunk_content._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self, self.chunk_content._parent)
                elif _on == MagicavoxelVox.ChunkType.size:
                    pass
                    if self.chunk_content._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self._root, self.chunk_content._root)
                    if self.chunk_content._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self, self.chunk_content._parent)
                elif _on == MagicavoxelVox.ChunkType.xyzi:
                    pass
                    if self.chunk_content._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self._root, self.chunk_content._root)
                    if self.chunk_content._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self, self.chunk_content._parent)
                else:
                    pass
                    if len(self.chunk_content) != self.num_bytes_of_chunk_content:
                        raise kaitaistruct.ConsistencyError(u"chunk_content", self.num_bytes_of_chunk_content, len(self.chunk_content))

            if self.num_bytes_of_children_chunks != 0:
                pass
                for i in range(len(self.children_chunks)):
                    pass
                    if self.children_chunks[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"children_chunks", self._root, self.children_chunks[i]._root)
                    if self.children_chunks[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"children_chunks", self, self.children_chunks[i]._parent)


            self._dirty = False


    class Color(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Color, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self.a = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MagicavoxelVox.Color, self)._write__seq(io)
            self._io.write_u1(self.r)
            self._io.write_u1(self.g)
            self._io.write_u1(self.b)
            self._io.write_u1(self.a)


        def _check(self):
            self._dirty = False


    class Matt(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Matt, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u4le()
            self.material_type = KaitaiStream.resolve_enum(MagicavoxelVox.MaterialType, self._io.read_u4le())
            self.material_weight = self._io.read_f4le()
            self.property_bits = self._io.read_u4le()
            if self.has_plastic:
                pass
                self.plastic = self._io.read_f4le()

            if self.has_roughness:
                pass
                self.roughness = self._io.read_f4le()

            if self.has_specular:
                pass
                self.specular = self._io.read_f4le()

            if self.has_ior:
                pass
                self.ior = self._io.read_f4le()

            if self.has_attenuation:
                pass
                self.attenuation = self._io.read_f4le()

            if self.has_power:
                pass
                self.power = self._io.read_f4le()

            if self.has_glow:
                pass
                self.glow = self._io.read_f4le()

            if self.has_is_total_power:
                pass
                self.is_total_power = self._io.read_f4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_plastic:
                pass

            if self.has_roughness:
                pass

            if self.has_specular:
                pass

            if self.has_ior:
                pass

            if self.has_attenuation:
                pass

            if self.has_power:
                pass

            if self.has_glow:
                pass

            if self.has_is_total_power:
                pass



        def _write__seq(self, io=None):
            super(MagicavoxelVox.Matt, self)._write__seq(io)
            self._io.write_u4le(self.id)
            self._io.write_u4le(int(self.material_type))
            self._io.write_f4le(self.material_weight)
            self._io.write_u4le(self.property_bits)
            if self.has_plastic:
                pass
                self._io.write_f4le(self.plastic)

            if self.has_roughness:
                pass
                self._io.write_f4le(self.roughness)

            if self.has_specular:
                pass
                self._io.write_f4le(self.specular)

            if self.has_ior:
                pass
                self._io.write_f4le(self.ior)

            if self.has_attenuation:
                pass
                self._io.write_f4le(self.attenuation)

            if self.has_power:
                pass
                self._io.write_f4le(self.power)

            if self.has_glow:
                pass
                self._io.write_f4le(self.glow)

            if self.has_is_total_power:
                pass
                self._io.write_f4le(self.is_total_power)



        def _check(self):
            if self.has_plastic:
                pass

            if self.has_roughness:
                pass

            if self.has_specular:
                pass

            if self.has_ior:
                pass

            if self.has_attenuation:
                pass

            if self.has_power:
                pass

            if self.has_glow:
                pass

            if self.has_is_total_power:
                pass

            self._dirty = False

        @property
        def has_attenuation(self):
            if hasattr(self, '_m_has_attenuation'):
                return self._m_has_attenuation

            self._m_has_attenuation = self.property_bits & 16 != 0
            return getattr(self, '_m_has_attenuation', None)

        def _invalidate_has_attenuation(self):
            del self._m_has_attenuation
        @property
        def has_glow(self):
            if hasattr(self, '_m_has_glow'):
                return self._m_has_glow

            self._m_has_glow = self.property_bits & 64 != 0
            return getattr(self, '_m_has_glow', None)

        def _invalidate_has_glow(self):
            del self._m_has_glow
        @property
        def has_ior(self):
            if hasattr(self, '_m_has_ior'):
                return self._m_has_ior

            self._m_has_ior = self.property_bits & 8 != 0
            return getattr(self, '_m_has_ior', None)

        def _invalidate_has_ior(self):
            del self._m_has_ior
        @property
        def has_is_total_power(self):
            if hasattr(self, '_m_has_is_total_power'):
                return self._m_has_is_total_power

            self._m_has_is_total_power = self.property_bits & 128 != 0
            return getattr(self, '_m_has_is_total_power', None)

        def _invalidate_has_is_total_power(self):
            del self._m_has_is_total_power
        @property
        def has_plastic(self):
            if hasattr(self, '_m_has_plastic'):
                return self._m_has_plastic

            self._m_has_plastic = self.property_bits & 1 != 0
            return getattr(self, '_m_has_plastic', None)

        def _invalidate_has_plastic(self):
            del self._m_has_plastic
        @property
        def has_power(self):
            if hasattr(self, '_m_has_power'):
                return self._m_has_power

            self._m_has_power = self.property_bits & 32 != 0
            return getattr(self, '_m_has_power', None)

        def _invalidate_has_power(self):
            del self._m_has_power
        @property
        def has_roughness(self):
            if hasattr(self, '_m_has_roughness'):
                return self._m_has_roughness

            self._m_has_roughness = self.property_bits & 2 != 0
            return getattr(self, '_m_has_roughness', None)

        def _invalidate_has_roughness(self):
            del self._m_has_roughness
        @property
        def has_specular(self):
            if hasattr(self, '_m_has_specular'):
                return self._m_has_specular

            self._m_has_specular = self.property_bits & 4 != 0
            return getattr(self, '_m_has_specular', None)

        def _invalidate_has_specular(self):
            del self._m_has_specular

    class Pack(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Pack, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_models = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MagicavoxelVox.Pack, self)._write__seq(io)
            self._io.write_u4le(self.num_models)


        def _check(self):
            self._dirty = False


    class Rgba(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Rgba, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.colors = []
            for i in range(256):
                _t_colors = MagicavoxelVox.Color(self._io, self, self._root)
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
            super(MagicavoxelVox.Rgba, self)._write__seq(io)
            for i in range(len(self.colors)):
                pass
                self.colors[i]._write__seq(self._io)



        def _check(self):
            if len(self.colors) != 256:
                raise kaitaistruct.ConsistencyError(u"colors", 256, len(self.colors))
            for i in range(len(self.colors)):
                pass
                if self.colors[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"colors", self._root, self.colors[i]._root)
                if self.colors[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"colors", self, self.colors[i]._parent)

            self._dirty = False


    class Size(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Size, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size_x = self._io.read_u4le()
            self.size_y = self._io.read_u4le()
            self.size_z = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MagicavoxelVox.Size, self)._write__seq(io)
            self._io.write_u4le(self.size_x)
            self._io.write_u4le(self.size_y)
            self._io.write_u4le(self.size_z)


        def _check(self):
            self._dirty = False


    class Voxel(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Voxel, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_u1()
            self.y = self._io.read_u1()
            self.z = self._io.read_u1()
            self.color_index = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MagicavoxelVox.Voxel, self)._write__seq(io)
            self._io.write_u1(self.x)
            self._io.write_u1(self.y)
            self._io.write_u1(self.z)
            self._io.write_u1(self.color_index)


        def _check(self):
            self._dirty = False


    class Xyzi(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MagicavoxelVox.Xyzi, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_voxels = self._io.read_u4le()
            self.voxels = []
            for i in range(self.num_voxels):
                _t_voxels = MagicavoxelVox.Voxel(self._io, self, self._root)
                try:
                    _t_voxels._read()
                finally:
                    self.voxels.append(_t_voxels)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.voxels)):
                pass
                self.voxels[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(MagicavoxelVox.Xyzi, self)._write__seq(io)
            self._io.write_u4le(self.num_voxels)
            for i in range(len(self.voxels)):
                pass
                self.voxels[i]._write__seq(self._io)



        def _check(self):
            if len(self.voxels) != self.num_voxels:
                raise kaitaistruct.ConsistencyError(u"voxels", self.num_voxels, len(self.voxels))
            for i in range(len(self.voxels)):
                pass
                if self.voxels[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"voxels", self._root, self.voxels[i]._root)
                if self.voxels[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"voxels", self, self.voxels[i]._parent)

            self._dirty = False



