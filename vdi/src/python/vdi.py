# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Vdi(KaitaiStruct):
    """A native VirtualBox file format
    
    Images for testing can be downloaded from
    
     * <https://www.osboxes.org/virtualbox-images/>
     * <https://virtualboxes.org/images/>
    
    or you can convert images of other formats.
    
    .. seealso::
       Source - https://github.com/qemu/qemu/blob/master/block/vdi.c
    """

    class ImageType(Enum):
        dynamic = 1
        static = 2
        undo = 3
        diff = 4
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = Vdi.Header(self._io, self, self._root)

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.text = (self._io.read_bytes(64)).decode(u"utf-8")
            self.signature = self._io.read_bytes(4)
            if not self.signature == b"\x7F\x10\xDA\xBE":
                raise kaitaistruct.ValidationNotEqualError(b"\x7F\x10\xDA\xBE", self.signature, self._io, u"/types/header/seq/1")
            self.version = Vdi.Header.Version(self._io, self, self._root)
            if self.subheader_size_is_dynamic:
                self.header_size_optional = self._io.read_u4le()

            self._raw_header_main = self._io.read_bytes(self.header_size)
            _io__raw_header_main = KaitaiStream(BytesIO(self._raw_header_main))
            self.header_main = Vdi.Header.HeaderMain(_io__raw_header_main, self, self._root)

        class Uuid(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.uuid = self._io.read_bytes(16)


        class Version(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.major = self._io.read_u2le()
                self.minor = self._io.read_u2le()


        class HeaderMain(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.image_type = KaitaiStream.resolve_enum(Vdi.ImageType, self._io.read_u4le())
                self.image_flags = Vdi.Header.HeaderMain.Flags(self._io, self, self._root)
                self.description = (self._io.read_bytes(256)).decode(u"utf-8")
                if self._parent.version.major >= 1:
                    self.blocks_map_offset = self._io.read_u4le()

                if self._parent.version.major >= 1:
                    self.offset_data = self._io.read_u4le()

                self.geometry = Vdi.Header.HeaderMain.Geometry(self._io, self, self._root)
                if self._parent.version.major >= 1:
                    self.reserved1 = self._io.read_u4le()

                self.disk_size = self._io.read_u8le()
                self.block_data_size = self._io.read_u4le()
                if self._parent.version.major >= 1:
                    self.block_metadata_size = self._io.read_u4le()

                self.blocks_in_image = self._io.read_u4le()
                self.blocks_allocated = self._io.read_u4le()
                self.uuid_image = Vdi.Header.Uuid(self._io, self, self._root)
                self.uuid_last_snap = Vdi.Header.Uuid(self._io, self, self._root)
                self.uuid_link = Vdi.Header.Uuid(self._io, self, self._root)
                if self._parent.version.major >= 1:
                    self.uuid_parent = Vdi.Header.Uuid(self._io, self, self._root)

                if  ((self._parent.version.major >= 1) and ((self._io.pos() + 16) <= self._io.size())) :
                    self.lchc_geometry = Vdi.Header.HeaderMain.Geometry(self._io, self, self._root)


            class Geometry(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.cylinders = self._io.read_u4le()
                    self.heads = self._io.read_u4le()
                    self.sectors = self._io.read_u4le()
                    self.sector_size = self._io.read_u4le()


            class Flags(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.reserved0 = self._io.read_bits_int_be(15)
                    self.zero_expand = self._io.read_bits_int_be(1) != 0
                    self.reserved1 = self._io.read_bits_int_be(6)
                    self.diff = self._io.read_bits_int_be(1) != 0
                    self.fixed = self._io.read_bits_int_be(1) != 0
                    self.reserved2 = self._io.read_bits_int_be(8)



        @property
        def header_size(self):
            if hasattr(self, '_m_header_size'):
                return self._m_header_size

            self._m_header_size = (self.header_size_optional if self.subheader_size_is_dynamic else 336)
            return getattr(self, '_m_header_size', None)

        @property
        def blocks_map_offset(self):
            if hasattr(self, '_m_blocks_map_offset'):
                return self._m_blocks_map_offset

            self._m_blocks_map_offset = self.header_main.blocks_map_offset
            return getattr(self, '_m_blocks_map_offset', None)

        @property
        def subheader_size_is_dynamic(self):
            if hasattr(self, '_m_subheader_size_is_dynamic'):
                return self._m_subheader_size_is_dynamic

            self._m_subheader_size_is_dynamic = self.version.major >= 1
            return getattr(self, '_m_subheader_size_is_dynamic', None)

        @property
        def blocks_offset(self):
            if hasattr(self, '_m_blocks_offset'):
                return self._m_blocks_offset

            self._m_blocks_offset = self.header_main.offset_data
            return getattr(self, '_m_blocks_offset', None)

        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = (self.header_main.block_metadata_size + self.header_main.block_data_size)
            return getattr(self, '_m_block_size', None)

        @property
        def blocks_map_size(self):
            if hasattr(self, '_m_blocks_map_size'):
                return self._m_blocks_map_size

            self._m_blocks_map_size = ((((self.header_main.blocks_in_image * 4) + self.header_main.geometry.sector_size) - 1) // self.header_main.geometry.sector_size * self.header_main.geometry.sector_size)
            return getattr(self, '_m_blocks_map_size', None)


    class BlocksMap(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.index = []
            for i in range(self._root.header.header_main.blocks_in_image):
                self.index.append(Vdi.BlocksMap.BlockIndex(self._io, self, self._root))


        class BlockIndex(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.index = self._io.read_u4le()

            @property
            def is_allocated(self):
                if hasattr(self, '_m_is_allocated'):
                    return self._m_is_allocated

                self._m_is_allocated = self.index < self._root.block_discarded
                return getattr(self, '_m_is_allocated', None)

            @property
            def block(self):
                if hasattr(self, '_m_block'):
                    return self._m_block

                if self.is_allocated:
                    self._m_block = self._root.disk.blocks[self.index]

                return getattr(self, '_m_block', None)



    class Disk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.blocks = []
            for i in range(self._root.header.header_main.blocks_in_image):
                self.blocks.append(Vdi.Disk.Block(self._io, self, self._root))


        class Block(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.metadata = self._io.read_bytes(self._root.header.header_main.block_metadata_size)
                self._raw_data = []
                self.data = []
                i = 0
                while not self._io.is_eof():
                    self._raw_data.append(self._io.read_bytes(self._root.header.header_main.block_data_size))
                    _io__raw_data = KaitaiStream(BytesIO(self._raw_data[-1]))
                    self.data.append(Vdi.Disk.Block.Sector(_io__raw_data, self, self._root))
                    i += 1


            class Sector(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.data = self._io.read_bytes(self._root.header.header_main.geometry.sector_size)




    @property
    def block_discarded(self):
        if hasattr(self, '_m_block_discarded'):
            return self._m_block_discarded

        self._m_block_discarded = 4294967294
        return getattr(self, '_m_block_discarded', None)

    @property
    def block_unallocated(self):
        if hasattr(self, '_m_block_unallocated'):
            return self._m_block_unallocated

        self._m_block_unallocated = 4294967295
        return getattr(self, '_m_block_unallocated', None)

    @property
    def blocks_map(self):
        """block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
        The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
        """
        if hasattr(self, '_m_blocks_map'):
            return self._m_blocks_map

        _pos = self._io.pos()
        self._io.seek(self.header.blocks_map_offset)
        self._raw__m_blocks_map = self._io.read_bytes(self.header.blocks_map_size)
        _io__raw__m_blocks_map = KaitaiStream(BytesIO(self._raw__m_blocks_map))
        self._m_blocks_map = Vdi.BlocksMap(_io__raw__m_blocks_map, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_blocks_map', None)

    @property
    def disk(self):
        if hasattr(self, '_m_disk'):
            return self._m_disk

        _pos = self._io.pos()
        self._io.seek(self.header.blocks_offset)
        self._m_disk = Vdi.Disk(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_disk', None)


