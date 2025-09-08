# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Vdi(ReadWriteKaitaiStruct):
    """A native VirtualBox file format
    
    Images for testing can be downloaded from
    
     * <https://www.osboxes.org/virtualbox-images/>
     * <https://virtualboxes.org/images/>
    
    or you can convert images of other formats.
    
    .. seealso::
       Source - https://github.com/qemu/qemu/blob/master/block/vdi.c
    """

    class ImageType(IntEnum):
        dynamic = 1
        static = 2
        undo = 3
        diff = 4
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Vdi, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_blocks_map = False
        self.blocks_map__enabled = True
        self._should_write_disk = False
        self.disk__enabled = True

    def _read(self):
        self.header = Vdi.Header(self._io, self, self._root)
        self.header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.blocks_map
        if hasattr(self, '_m_blocks_map'):
            pass
            self._m_blocks_map._fetch_instances()

        _ = self.disk
        if hasattr(self, '_m_disk'):
            pass
            self._m_disk._fetch_instances()



    def _write__seq(self, io=None):
        super(Vdi, self)._write__seq(io)
        self._should_write_blocks_map = self.blocks_map__enabled
        self._should_write_disk = self.disk__enabled
        self.header._write__seq(self._io)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.blocks_map__enabled:
            pass
            if self._m_blocks_map._root != self._root:
                raise kaitaistruct.ConsistencyError(u"blocks_map", self._root, self._m_blocks_map._root)
            if self._m_blocks_map._parent != self:
                raise kaitaistruct.ConsistencyError(u"blocks_map", self, self._m_blocks_map._parent)

        if self.disk__enabled:
            pass
            if self._m_disk._root != self._root:
                raise kaitaistruct.ConsistencyError(u"disk", self._root, self._m_disk._root)
            if self._m_disk._parent != self:
                raise kaitaistruct.ConsistencyError(u"disk", self, self._m_disk._parent)

        self._dirty = False

    class BlocksMap(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vdi.BlocksMap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.index = []
            for i in range(self._root.header.header_main.blocks_in_image):
                _t_index = Vdi.BlocksMap.BlockIndex(self._io, self, self._root)
                try:
                    _t_index._read()
                finally:
                    self.index.append(_t_index)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.index)):
                pass
                self.index[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Vdi.BlocksMap, self)._write__seq(io)
            for i in range(len(self.index)):
                pass
                self.index[i]._write__seq(self._io)



        def _check(self):
            if len(self.index) != self._root.header.header_main.blocks_in_image:
                raise kaitaistruct.ConsistencyError(u"index", self._root.header.header_main.blocks_in_image, len(self.index))
            for i in range(len(self.index)):
                pass
                if self.index[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"index", self._root, self.index[i]._root)
                if self.index[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"index", self, self.index[i]._parent)

            self._dirty = False

        class BlockIndex(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Vdi.BlocksMap.BlockIndex, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.index = self._io.read_u4le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Vdi.BlocksMap.BlockIndex, self)._write__seq(io)
                self._io.write_u4le(self.index)


            def _check(self):
                self._dirty = False

            @property
            def block(self):
                if hasattr(self, '_m_block'):
                    return self._m_block

                if self.is_allocated:
                    pass
                    self._m_block = self._root.disk.blocks[self.index]

                return getattr(self, '_m_block', None)

            def _invalidate_block(self):
                del self._m_block
            @property
            def is_allocated(self):
                if hasattr(self, '_m_is_allocated'):
                    return self._m_is_allocated

                self._m_is_allocated = self.index < self._root.block_discarded
                return getattr(self, '_m_is_allocated', None)

            def _invalidate_is_allocated(self):
                del self._m_is_allocated


    class Disk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vdi.Disk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.blocks = []
            for i in range(self._root.header.header_main.blocks_in_image):
                _t_blocks = Vdi.Disk.Block(self._io, self, self._root)
                try:
                    _t_blocks._read()
                finally:
                    self.blocks.append(_t_blocks)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.blocks)):
                pass
                self.blocks[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Vdi.Disk, self)._write__seq(io)
            for i in range(len(self.blocks)):
                pass
                self.blocks[i]._write__seq(self._io)



        def _check(self):
            if len(self.blocks) != self._root.header.header_main.blocks_in_image:
                raise kaitaistruct.ConsistencyError(u"blocks", self._root.header.header_main.blocks_in_image, len(self.blocks))
            for i in range(len(self.blocks)):
                pass
                if self.blocks[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
                if self.blocks[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)

            self._dirty = False

        class Block(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Vdi.Disk.Block, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.metadata = self._io.read_bytes(self._root.header.header_main.block_metadata_size)
                self._raw_data = []
                self.data = []
                i = 0
                while not self._io.is_eof():
                    self._raw_data.append(self._io.read_bytes(self._root.header.header_main.block_data_size))
                    _io__raw_data = KaitaiStream(BytesIO(self._raw_data[-1]))
                    _t_data = Vdi.Disk.Block.Sector(_io__raw_data, self, self._root)
                    try:
                        _t_data._read()
                    finally:
                        self.data.append(_t_data)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.data)):
                    pass
                    self.data[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Vdi.Disk.Block, self)._write__seq(io)
                self._io.write_bytes(self.metadata)
                self._raw_data = []
                for i in range(len(self.data)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())
                    _io__raw_data = KaitaiStream(BytesIO(bytearray(self._root.header.header_main.block_data_size)))
                    self._io.add_child_stream(_io__raw_data)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self._root.header.header_main.block_data_size))
                    def handler(parent, _io__raw_data=_io__raw_data, i=i):
                        self._raw_data.append(_io__raw_data.to_byte_array())
                        if len(self._raw_data[i]) != self._root.header.header_main.block_data_size:
                            raise kaitaistruct.ConsistencyError(u"raw(data)", self._root.header.header_main.block_data_size, len(self._raw_data[i]))
                        parent.write_bytes(self._raw_data[i])
                    _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.data[i]._write__seq(_io__raw_data)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


            def _check(self):
                if len(self.metadata) != self._root.header.header_main.block_metadata_size:
                    raise kaitaistruct.ConsistencyError(u"metadata", self._root.header.header_main.block_metadata_size, len(self.metadata))
                for i in range(len(self.data)):
                    pass
                    if self.data[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"data", self._root, self.data[i]._root)
                    if self.data[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"data", self, self.data[i]._parent)

                self._dirty = False

            class Sector(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Vdi.Disk.Block.Sector, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.data = self._io.read_bytes(self._root.header.header_main.geometry.sector_size)
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Vdi.Disk.Block.Sector, self)._write__seq(io)
                    self._io.write_bytes(self.data)


                def _check(self):
                    if len(self.data) != self._root.header.header_main.geometry.sector_size:
                        raise kaitaistruct.ConsistencyError(u"data", self._root.header.header_main.geometry.sector_size, len(self.data))
                    self._dirty = False




    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vdi.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.text = (self._io.read_bytes(64)).decode(u"UTF-8")
            self.signature = self._io.read_bytes(4)
            if not self.signature == b"\x7F\x10\xDA\xBE":
                raise kaitaistruct.ValidationNotEqualError(b"\x7F\x10\xDA\xBE", self.signature, self._io, u"/types/header/seq/1")
            self.version = Vdi.Header.Version(self._io, self, self._root)
            self.version._read()
            if self.subheader_size_is_dynamic:
                pass
                self.header_size_optional = self._io.read_u4le()

            self._raw_header_main = self._io.read_bytes(self.header_size)
            _io__raw_header_main = KaitaiStream(BytesIO(self._raw_header_main))
            self.header_main = Vdi.Header.HeaderMain(_io__raw_header_main, self, self._root)
            self.header_main._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()
            if self.subheader_size_is_dynamic:
                pass

            self.header_main._fetch_instances()


        def _write__seq(self, io=None):
            super(Vdi.Header, self)._write__seq(io)
            self._io.write_bytes((self.text).encode(u"UTF-8"))
            self._io.write_bytes(self.signature)
            self.version._write__seq(self._io)
            if self.subheader_size_is_dynamic:
                pass
                self._io.write_u4le(self.header_size_optional)

            _io__raw_header_main = KaitaiStream(BytesIO(bytearray(self.header_size)))
            self._io.add_child_stream(_io__raw_header_main)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header_size))
            def handler(parent, _io__raw_header_main=_io__raw_header_main):
                self._raw_header_main = _io__raw_header_main.to_byte_array()
                if len(self._raw_header_main) != self.header_size:
                    raise kaitaistruct.ConsistencyError(u"raw(header_main)", self.header_size, len(self._raw_header_main))
                parent.write_bytes(self._raw_header_main)
            _io__raw_header_main.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.header_main._write__seq(_io__raw_header_main)


        def _check(self):
            if len((self.text).encode(u"UTF-8")) != 64:
                raise kaitaistruct.ConsistencyError(u"text", 64, len((self.text).encode(u"UTF-8")))
            if len(self.signature) != 4:
                raise kaitaistruct.ConsistencyError(u"signature", 4, len(self.signature))
            if not self.signature == b"\x7F\x10\xDA\xBE":
                raise kaitaistruct.ValidationNotEqualError(b"\x7F\x10\xDA\xBE", self.signature, None, u"/types/header/seq/1")
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if self.subheader_size_is_dynamic:
                pass

            if self.header_main._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header_main", self._root, self.header_main._root)
            if self.header_main._parent != self:
                raise kaitaistruct.ConsistencyError(u"header_main", self, self.header_main._parent)
            self._dirty = False

        class HeaderMain(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Vdi.Header.HeaderMain, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.image_type = KaitaiStream.resolve_enum(Vdi.ImageType, self._io.read_u4le())
                self.image_flags = Vdi.Header.HeaderMain.Flags(self._io, self, self._root)
                self.image_flags._read()
                self.description = (self._io.read_bytes(256)).decode(u"UTF-8")
                if self._parent.version.major >= 1:
                    pass
                    self.blocks_map_offset = self._io.read_u4le()

                if self._parent.version.major >= 1:
                    pass
                    self.offset_data = self._io.read_u4le()

                self.geometry = Vdi.Header.HeaderMain.Geometry(self._io, self, self._root)
                self.geometry._read()
                if self._parent.version.major >= 1:
                    pass
                    self.reserved1 = self._io.read_u4le()

                self.disk_size = self._io.read_u8le()
                self.block_data_size = self._io.read_u4le()
                if self._parent.version.major >= 1:
                    pass
                    self.block_metadata_size = self._io.read_u4le()

                self.blocks_in_image = self._io.read_u4le()
                self.blocks_allocated = self._io.read_u4le()
                self.uuid_image = Vdi.Header.Uuid(self._io, self, self._root)
                self.uuid_image._read()
                self.uuid_last_snap = Vdi.Header.Uuid(self._io, self, self._root)
                self.uuid_last_snap._read()
                self.uuid_link = Vdi.Header.Uuid(self._io, self, self._root)
                self.uuid_link._read()
                if self._parent.version.major >= 1:
                    pass
                    self.uuid_parent = Vdi.Header.Uuid(self._io, self, self._root)
                    self.uuid_parent._read()

                if  ((self._parent.version.major >= 1) and (self._io.pos() + 16 <= self._io.size())) :
                    pass
                    self.lchc_geometry = Vdi.Header.HeaderMain.Geometry(self._io, self, self._root)
                    self.lchc_geometry._read()

                self._dirty = False


            def _fetch_instances(self):
                pass
                self.image_flags._fetch_instances()
                if self._parent.version.major >= 1:
                    pass

                if self._parent.version.major >= 1:
                    pass

                self.geometry._fetch_instances()
                if self._parent.version.major >= 1:
                    pass

                if self._parent.version.major >= 1:
                    pass

                self.uuid_image._fetch_instances()
                self.uuid_last_snap._fetch_instances()
                self.uuid_link._fetch_instances()
                if self._parent.version.major >= 1:
                    pass
                    self.uuid_parent._fetch_instances()

                if  ((self._parent.version.major >= 1) and (self._io.pos() + 16 <= self._io.size())) :
                    pass
                    self.lchc_geometry._fetch_instances()



            def _write__seq(self, io=None):
                super(Vdi.Header.HeaderMain, self)._write__seq(io)
                self._io.write_u4le(int(self.image_type))
                self.image_flags._write__seq(self._io)
                self._io.write_bytes((self.description).encode(u"UTF-8"))
                if self._parent.version.major >= 1:
                    pass
                    self._io.write_u4le(self.blocks_map_offset)

                if self._parent.version.major >= 1:
                    pass
                    self._io.write_u4le(self.offset_data)

                self.geometry._write__seq(self._io)
                if self._parent.version.major >= 1:
                    pass
                    self._io.write_u4le(self.reserved1)

                self._io.write_u8le(self.disk_size)
                self._io.write_u4le(self.block_data_size)
                if self._parent.version.major >= 1:
                    pass
                    self._io.write_u4le(self.block_metadata_size)

                self._io.write_u4le(self.blocks_in_image)
                self._io.write_u4le(self.blocks_allocated)
                self.uuid_image._write__seq(self._io)
                self.uuid_last_snap._write__seq(self._io)
                self.uuid_link._write__seq(self._io)
                if self._parent.version.major >= 1:
                    pass
                    self.uuid_parent._write__seq(self._io)

                if  ((self._parent.version.major >= 1) and (self._io.pos() + 16 <= self._io.size())) :
                    pass
                    if self.lchc_geometry._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"lchc_geometry", self._root, self.lchc_geometry._root)
                    if self.lchc_geometry._parent != self:
                        raise kaitaistruct.ConsistencyError(u"lchc_geometry", self, self.lchc_geometry._parent)
                    self.lchc_geometry._write__seq(self._io)



            def _check(self):
                if self.image_flags._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"image_flags", self._root, self.image_flags._root)
                if self.image_flags._parent != self:
                    raise kaitaistruct.ConsistencyError(u"image_flags", self, self.image_flags._parent)
                if len((self.description).encode(u"UTF-8")) != 256:
                    raise kaitaistruct.ConsistencyError(u"description", 256, len((self.description).encode(u"UTF-8")))
                if self._parent.version.major >= 1:
                    pass

                if self._parent.version.major >= 1:
                    pass

                if self.geometry._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"geometry", self._root, self.geometry._root)
                if self.geometry._parent != self:
                    raise kaitaistruct.ConsistencyError(u"geometry", self, self.geometry._parent)
                if self._parent.version.major >= 1:
                    pass

                if self._parent.version.major >= 1:
                    pass

                if self.uuid_image._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"uuid_image", self._root, self.uuid_image._root)
                if self.uuid_image._parent != self:
                    raise kaitaistruct.ConsistencyError(u"uuid_image", self, self.uuid_image._parent)
                if self.uuid_last_snap._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"uuid_last_snap", self._root, self.uuid_last_snap._root)
                if self.uuid_last_snap._parent != self:
                    raise kaitaistruct.ConsistencyError(u"uuid_last_snap", self, self.uuid_last_snap._parent)
                if self.uuid_link._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"uuid_link", self._root, self.uuid_link._root)
                if self.uuid_link._parent != self:
                    raise kaitaistruct.ConsistencyError(u"uuid_link", self, self.uuid_link._parent)
                if self._parent.version.major >= 1:
                    pass
                    if self.uuid_parent._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"uuid_parent", self._root, self.uuid_parent._root)
                    if self.uuid_parent._parent != self:
                        raise kaitaistruct.ConsistencyError(u"uuid_parent", self, self.uuid_parent._parent)

                self._dirty = False

            class Flags(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Vdi.Header.HeaderMain.Flags, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved0 = self._io.read_bits_int_be(15)
                    self.zero_expand = self._io.read_bits_int_be(1) != 0
                    self.reserved1 = self._io.read_bits_int_be(6)
                    self.diff = self._io.read_bits_int_be(1) != 0
                    self.fixed = self._io.read_bits_int_be(1) != 0
                    self.reserved2 = self._io.read_bits_int_be(8)
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Vdi.Header.HeaderMain.Flags, self)._write__seq(io)
                    self._io.write_bits_int_be(15, self.reserved0)
                    self._io.write_bits_int_be(1, int(self.zero_expand))
                    self._io.write_bits_int_be(6, self.reserved1)
                    self._io.write_bits_int_be(1, int(self.diff))
                    self._io.write_bits_int_be(1, int(self.fixed))
                    self._io.write_bits_int_be(8, self.reserved2)


                def _check(self):
                    self._dirty = False


            class Geometry(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Vdi.Header.HeaderMain.Geometry, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.cylinders = self._io.read_u4le()
                    self.heads = self._io.read_u4le()
                    self.sectors = self._io.read_u4le()
                    self.sector_size = self._io.read_u4le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Vdi.Header.HeaderMain.Geometry, self)._write__seq(io)
                    self._io.write_u4le(self.cylinders)
                    self._io.write_u4le(self.heads)
                    self._io.write_u4le(self.sectors)
                    self._io.write_u4le(self.sector_size)


                def _check(self):
                    self._dirty = False



        class Uuid(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Vdi.Header.Uuid, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.uuid = self._io.read_bytes(16)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Vdi.Header.Uuid, self)._write__seq(io)
                self._io.write_bytes(self.uuid)


            def _check(self):
                if len(self.uuid) != 16:
                    raise kaitaistruct.ConsistencyError(u"uuid", 16, len(self.uuid))
                self._dirty = False


        class Version(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Vdi.Header.Version, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.major = self._io.read_u2le()
                self.minor = self._io.read_u2le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Vdi.Header.Version, self)._write__seq(io)
                self._io.write_u2le(self.major)
                self._io.write_u2le(self.minor)


            def _check(self):
                self._dirty = False


        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = self.header_main.block_metadata_size + self.header_main.block_data_size
            return getattr(self, '_m_block_size', None)

        def _invalidate_block_size(self):
            del self._m_block_size
        @property
        def blocks_map_offset(self):
            if hasattr(self, '_m_blocks_map_offset'):
                return self._m_blocks_map_offset

            self._m_blocks_map_offset = self.header_main.blocks_map_offset
            return getattr(self, '_m_blocks_map_offset', None)

        def _invalidate_blocks_map_offset(self):
            del self._m_blocks_map_offset
        @property
        def blocks_map_size(self):
            if hasattr(self, '_m_blocks_map_size'):
                return self._m_blocks_map_size

            self._m_blocks_map_size = (((self.header_main.blocks_in_image * 4 + self.header_main.geometry.sector_size) - 1) // self.header_main.geometry.sector_size) * self.header_main.geometry.sector_size
            return getattr(self, '_m_blocks_map_size', None)

        def _invalidate_blocks_map_size(self):
            del self._m_blocks_map_size
        @property
        def blocks_offset(self):
            if hasattr(self, '_m_blocks_offset'):
                return self._m_blocks_offset

            self._m_blocks_offset = self.header_main.offset_data
            return getattr(self, '_m_blocks_offset', None)

        def _invalidate_blocks_offset(self):
            del self._m_blocks_offset
        @property
        def header_size(self):
            if hasattr(self, '_m_header_size'):
                return self._m_header_size

            self._m_header_size = (self.header_size_optional if self.subheader_size_is_dynamic else 336)
            return getattr(self, '_m_header_size', None)

        def _invalidate_header_size(self):
            del self._m_header_size
        @property
        def subheader_size_is_dynamic(self):
            if hasattr(self, '_m_subheader_size_is_dynamic'):
                return self._m_subheader_size_is_dynamic

            self._m_subheader_size_is_dynamic = self.version.major >= 1
            return getattr(self, '_m_subheader_size_is_dynamic', None)

        def _invalidate_subheader_size_is_dynamic(self):
            del self._m_subheader_size_is_dynamic

    @property
    def block_discarded(self):
        if hasattr(self, '_m_block_discarded'):
            return self._m_block_discarded

        self._m_block_discarded = 4294967294
        return getattr(self, '_m_block_discarded', None)

    def _invalidate_block_discarded(self):
        del self._m_block_discarded
    @property
    def block_unallocated(self):
        if hasattr(self, '_m_block_unallocated'):
            return self._m_block_unallocated

        self._m_block_unallocated = 4294967295
        return getattr(self, '_m_block_unallocated', None)

    def _invalidate_block_unallocated(self):
        del self._m_block_unallocated
    @property
    def blocks_map(self):
        """block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
        The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
        """
        if self._should_write_blocks_map:
            self._write_blocks_map()
        if hasattr(self, '_m_blocks_map'):
            return self._m_blocks_map

        if not self.blocks_map__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.blocks_map_offset)
        self._raw__m_blocks_map = self._io.read_bytes(self.header.blocks_map_size)
        _io__raw__m_blocks_map = KaitaiStream(BytesIO(self._raw__m_blocks_map))
        self._m_blocks_map = Vdi.BlocksMap(_io__raw__m_blocks_map, self, self._root)
        self._m_blocks_map._read()
        self._io.seek(_pos)
        return getattr(self, '_m_blocks_map', None)

    @blocks_map.setter
    def blocks_map(self, v):
        self._dirty = True
        self._m_blocks_map = v

    def _write_blocks_map(self):
        self._should_write_blocks_map = False
        _pos = self._io.pos()
        self._io.seek(self.header.blocks_map_offset)
        _io__raw__m_blocks_map = KaitaiStream(BytesIO(bytearray(self.header.blocks_map_size)))
        self._io.add_child_stream(_io__raw__m_blocks_map)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header.blocks_map_size))
        def handler(parent, _io__raw__m_blocks_map=_io__raw__m_blocks_map):
            self._raw__m_blocks_map = _io__raw__m_blocks_map.to_byte_array()
            if len(self._raw__m_blocks_map) != self.header.blocks_map_size:
                raise kaitaistruct.ConsistencyError(u"raw(blocks_map)", self.header.blocks_map_size, len(self._raw__m_blocks_map))
            parent.write_bytes(self._raw__m_blocks_map)
        _io__raw__m_blocks_map.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_blocks_map._write__seq(_io__raw__m_blocks_map)
        self._io.seek(_pos)

    @property
    def disk(self):
        if self._should_write_disk:
            self._write_disk()
        if hasattr(self, '_m_disk'):
            return self._m_disk

        if not self.disk__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.blocks_offset)
        self._m_disk = Vdi.Disk(self._io, self, self._root)
        self._m_disk._read()
        self._io.seek(_pos)
        return getattr(self, '_m_disk', None)

    @disk.setter
    def disk(self, v):
        self._dirty = True
        self._m_disk = v

    def _write_disk(self):
        self._should_write_disk = False
        _pos = self._io.pos()
        self._io.seek(self.header.blocks_offset)
        self._m_disk._write__seq(self._io)
        self._io.seek(_pos)


