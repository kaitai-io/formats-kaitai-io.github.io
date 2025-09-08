# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MagicavoxelVox(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(MagicavoxelVox, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x56\x4F\x58\x20":
            raise kaitaistruct.ValidationNotEqualError(b"\x56\x4F\x58\x20", self.magic, self._io, u"/seq/0")
        self.version = self._io.read_u4le()
        self.main = MagicavoxelVox.Chunk(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.main._fetch_instances()

    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
                elif _on == MagicavoxelVox.ChunkType.pack:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Pack(_io__raw_chunk_content, self, self._root)
                elif _on == MagicavoxelVox.ChunkType.rgba:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Rgba(_io__raw_chunk_content, self, self._root)
                elif _on == MagicavoxelVox.ChunkType.size:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Size(_io__raw_chunk_content, self, self._root)
                elif _on == MagicavoxelVox.ChunkType.xyzi:
                    pass
                    self._raw_chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)
                    _io__raw_chunk_content = KaitaiStream(BytesIO(self._raw_chunk_content))
                    self.chunk_content = MagicavoxelVox.Xyzi(_io__raw_chunk_content, self, self._root)
                else:
                    pass
                    self.chunk_content = self._io.read_bytes(self.num_bytes_of_chunk_content)

            if self.num_bytes_of_children_chunks != 0:
                pass
                self.children_chunks = []
                i = 0
                while not self._io.is_eof():
                    self.children_chunks.append(MagicavoxelVox.Chunk(self._io, self, self._root))
                    i += 1




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




    class Color(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Color, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self.a = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class Matt(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Matt, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        @property
        def has_attenuation(self):
            if hasattr(self, '_m_has_attenuation'):
                return self._m_has_attenuation

            self._m_has_attenuation = self.property_bits & 16 != 0
            return getattr(self, '_m_has_attenuation', None)

        @property
        def has_glow(self):
            if hasattr(self, '_m_has_glow'):
                return self._m_has_glow

            self._m_has_glow = self.property_bits & 64 != 0
            return getattr(self, '_m_has_glow', None)

        @property
        def has_ior(self):
            if hasattr(self, '_m_has_ior'):
                return self._m_has_ior

            self._m_has_ior = self.property_bits & 8 != 0
            return getattr(self, '_m_has_ior', None)

        @property
        def has_is_total_power(self):
            if hasattr(self, '_m_has_is_total_power'):
                return self._m_has_is_total_power

            self._m_has_is_total_power = self.property_bits & 128 != 0
            return getattr(self, '_m_has_is_total_power', None)

        @property
        def has_plastic(self):
            if hasattr(self, '_m_has_plastic'):
                return self._m_has_plastic

            self._m_has_plastic = self.property_bits & 1 != 0
            return getattr(self, '_m_has_plastic', None)

        @property
        def has_power(self):
            if hasattr(self, '_m_has_power'):
                return self._m_has_power

            self._m_has_power = self.property_bits & 32 != 0
            return getattr(self, '_m_has_power', None)

        @property
        def has_roughness(self):
            if hasattr(self, '_m_has_roughness'):
                return self._m_has_roughness

            self._m_has_roughness = self.property_bits & 2 != 0
            return getattr(self, '_m_has_roughness', None)

        @property
        def has_specular(self):
            if hasattr(self, '_m_has_specular'):
                return self._m_has_specular

            self._m_has_specular = self.property_bits & 4 != 0
            return getattr(self, '_m_has_specular', None)


    class Pack(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Pack, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_models = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Rgba(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Rgba, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.colors = []
            for i in range(256):
                self.colors.append(MagicavoxelVox.Color(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.colors)):
                pass
                self.colors[i]._fetch_instances()



    class Size(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Size, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size_x = self._io.read_u4le()
            self.size_y = self._io.read_u4le()
            self.size_z = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Voxel(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Voxel, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = self._io.read_u1()
            self.y = self._io.read_u1()
            self.z = self._io.read_u1()
            self.color_index = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class Xyzi(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MagicavoxelVox.Xyzi, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_voxels = self._io.read_u4le()
            self.voxels = []
            for i in range(self.num_voxels):
                self.voxels.append(MagicavoxelVox.Voxel(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.voxels)):
                pass
                self.voxels[i]._fetch_instances()




