# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Lvm2(ReadWriteKaitaiStruct):
    """### Building a test file
    
    ```
    dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
    sudo losetup /dev/loop1 image.img
    sudo pvcreate /dev/loop1
    sudo vgcreate vg_test /dev/loop1
    sudo lvcreate --name lv_test1 vg_test
    sudo losetup -d /dev/loop1
    ```
    
    .. seealso::
       Source - https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Lvm2, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.pv = Lvm2.PhysicalVolume(self._io, self, self._root)
        self.pv._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.pv._fetch_instances()


    def _write__seq(self, io=None):
        super(Lvm2, self)._write__seq(io)
        self.pv._write__seq(self._io)


    def _check(self):
        if self.pv._root != self._root:
            raise kaitaistruct.ConsistencyError(u"pv", self._root, self.pv._root)
        if self.pv._parent != self:
            raise kaitaistruct.ConsistencyError(u"pv", self, self.pv._parent)
        self._dirty = False

    class PhysicalVolume(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Lvm2.PhysicalVolume, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.empty_sector = self._io.read_bytes(self._root.sector_size)
            self.label = Lvm2.PhysicalVolume.Label(self._io, self, self._root)
            self.label._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.label._fetch_instances()


        def _write__seq(self, io=None):
            super(Lvm2.PhysicalVolume, self)._write__seq(io)
            self._io.write_bytes(self.empty_sector)
            self.label._write__seq(self._io)


        def _check(self):
            if len(self.empty_sector) != self._root.sector_size:
                raise kaitaistruct.ConsistencyError(u"empty_sector", self._root.sector_size, len(self.empty_sector))
            if self.label._root != self._root:
                raise kaitaistruct.ConsistencyError(u"label", self._root, self.label._root)
            if self.label._parent != self:
                raise kaitaistruct.ConsistencyError(u"label", self, self.label._parent)
            self._dirty = False

        class Label(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Lvm2.PhysicalVolume.Label, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.label_header = Lvm2.PhysicalVolume.Label.LabelHeader(self._io, self, self._root)
                self.label_header._read()
                self.volume_header = Lvm2.PhysicalVolume.Label.VolumeHeader(self._io, self, self._root)
                self.volume_header._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.label_header._fetch_instances()
                self.volume_header._fetch_instances()


            def _write__seq(self, io=None):
                super(Lvm2.PhysicalVolume.Label, self)._write__seq(io)
                self.label_header._write__seq(self._io)
                self.volume_header._write__seq(self._io)


            def _check(self):
                if self.label_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"label_header", self._root, self.label_header._root)
                if self.label_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"label_header", self, self.label_header._parent)
                if self.volume_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"volume_header", self._root, self.volume_header._root)
                if self.volume_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"volume_header", self, self.volume_header._parent)
                self._dirty = False

            class LabelHeader(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Lvm2.PhysicalVolume.Label.LabelHeader, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.signature = self._io.read_bytes(8)
                    if not self.signature == b"\x4C\x41\x42\x45\x4C\x4F\x4E\x45":
                        raise kaitaistruct.ValidationNotEqualError(b"\x4C\x41\x42\x45\x4C\x4F\x4E\x45", self.signature, self._io, u"/types/physical_volume/types/label/types/label_header/seq/0")
                    self.sector_number = self._io.read_u8le()
                    self.checksum = self._io.read_u4le()
                    self.label_header_ = Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader(self._io, self, self._root)
                    self.label_header_._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.label_header_._fetch_instances()


                def _write__seq(self, io=None):
                    super(Lvm2.PhysicalVolume.Label.LabelHeader, self)._write__seq(io)
                    self._io.write_bytes(self.signature)
                    self._io.write_u8le(self.sector_number)
                    self._io.write_u4le(self.checksum)
                    self.label_header_._write__seq(self._io)


                def _check(self):
                    if len(self.signature) != 8:
                        raise kaitaistruct.ConsistencyError(u"signature", 8, len(self.signature))
                    if not self.signature == b"\x4C\x41\x42\x45\x4C\x4F\x4E\x45":
                        raise kaitaistruct.ValidationNotEqualError(b"\x4C\x41\x42\x45\x4C\x4F\x4E\x45", self.signature, None, u"/types/physical_volume/types/label/types/label_header/seq/0")
                    if self.label_header_._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"label_header_", self._root, self.label_header_._root)
                    if self.label_header_._parent != self:
                        raise kaitaistruct.ConsistencyError(u"label_header_", self, self.label_header_._parent)
                    self._dirty = False

                class LabelHeader(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.data_offset = self._io.read_u4le()
                        self.type_indicator = self._io.read_bytes(8)
                        if not self.type_indicator == b"\x4C\x56\x4D\x32\x20\x30\x30\x31":
                            raise kaitaistruct.ValidationNotEqualError(b"\x4C\x56\x4D\x32\x20\x30\x30\x31", self.type_indicator, self._io, u"/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1")
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader, self)._write__seq(io)
                        self._io.write_u4le(self.data_offset)
                        self._io.write_bytes(self.type_indicator)


                    def _check(self):
                        if len(self.type_indicator) != 8:
                            raise kaitaistruct.ConsistencyError(u"type_indicator", 8, len(self.type_indicator))
                        if not self.type_indicator == b"\x4C\x56\x4D\x32\x20\x30\x30\x31":
                            raise kaitaistruct.ValidationNotEqualError(b"\x4C\x56\x4D\x32\x20\x30\x30\x31", self.type_indicator, None, u"/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1")
                        self._dirty = False



            class VolumeHeader(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Lvm2.PhysicalVolume.Label.VolumeHeader, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.id = (self._io.read_bytes(32)).decode(u"ASCII")
                    self.size = self._io.read_u8le()
                    self.data_area_descriptors = []
                    i = 0
                    while True:
                        _t_data_area_descriptors = Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor(self._io, self, self._root)
                        try:
                            _t_data_area_descriptors._read()
                        finally:
                            _ = _t_data_area_descriptors
                            self.data_area_descriptors.append(_)
                        if  ((_.size != 0) and (_.offset != 0)) :
                            break
                        i += 1
                    self.metadata_area_descriptors = []
                    i = 0
                    while True:
                        _t_metadata_area_descriptors = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor(self._io, self, self._root)
                        try:
                            _t_metadata_area_descriptors._read()
                        finally:
                            _ = _t_metadata_area_descriptors
                            self.metadata_area_descriptors.append(_)
                        if  ((_.size != 0) and (_.offset != 0)) :
                            break
                        i += 1
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.data_area_descriptors)):
                        pass
                        self.data_area_descriptors[i]._fetch_instances()

                    for i in range(len(self.metadata_area_descriptors)):
                        pass
                        self.metadata_area_descriptors[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Lvm2.PhysicalVolume.Label.VolumeHeader, self)._write__seq(io)
                    self._io.write_bytes((self.id).encode(u"ASCII"))
                    self._io.write_u8le(self.size)
                    for i in range(len(self.data_area_descriptors)):
                        pass
                        self.data_area_descriptors[i]._write__seq(self._io)

                    for i in range(len(self.metadata_area_descriptors)):
                        pass
                        self.metadata_area_descriptors[i]._write__seq(self._io)



                def _check(self):
                    if len((self.id).encode(u"ASCII")) != 32:
                        raise kaitaistruct.ConsistencyError(u"id", 32, len((self.id).encode(u"ASCII")))
                    if len(self.data_area_descriptors) == 0:
                        raise kaitaistruct.ConsistencyError(u"data_area_descriptors", 0, len(self.data_area_descriptors))
                    for i in range(len(self.data_area_descriptors)):
                        pass
                        if self.data_area_descriptors[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"data_area_descriptors", self._root, self.data_area_descriptors[i]._root)
                        if self.data_area_descriptors[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"data_area_descriptors", self, self.data_area_descriptors[i]._parent)
                        _ = self.data_area_descriptors[i]
                        if  ((_.size != 0) and (_.offset != 0))  != (i == len(self.data_area_descriptors) - 1):
                            raise kaitaistruct.ConsistencyError(u"data_area_descriptors", i == len(self.data_area_descriptors) - 1,  ((_.size != 0) and (_.offset != 0)) )

                    if len(self.metadata_area_descriptors) == 0:
                        raise kaitaistruct.ConsistencyError(u"metadata_area_descriptors", 0, len(self.metadata_area_descriptors))
                    for i in range(len(self.metadata_area_descriptors)):
                        pass
                        if self.metadata_area_descriptors[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"metadata_area_descriptors", self._root, self.metadata_area_descriptors[i]._root)
                        if self.metadata_area_descriptors[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"metadata_area_descriptors", self, self.metadata_area_descriptors[i]._parent)
                        _ = self.metadata_area_descriptors[i]
                        if  ((_.size != 0) and (_.offset != 0))  != (i == len(self.metadata_area_descriptors) - 1):
                            raise kaitaistruct.ConsistencyError(u"metadata_area_descriptors", i == len(self.metadata_area_descriptors) - 1,  ((_.size != 0) and (_.offset != 0)) )

                    self._dirty = False

                class DataAreaDescriptor(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._should_write_data = False
                        self.data__enabled = True

                    def _read(self):
                        self.offset = self._io.read_u8le()
                        self.size = self._io.read_u8le()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        _ = self.data
                        if hasattr(self, '_m_data'):
                            pass



                    def _write__seq(self, io=None):
                        super(Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor, self)._write__seq(io)
                        self._should_write_data = self.data__enabled
                        self._io.write_u8le(self.offset)
                        self._io.write_u8le(self.size)


                    def _check(self):
                        if self.data__enabled:
                            pass
                            if self.size != 0:
                                pass
                                if len((self._m_data).encode(u"ASCII")) != self.size:
                                    raise kaitaistruct.ConsistencyError(u"data", self.size, len((self._m_data).encode(u"ASCII")))


                        self._dirty = False

                    @property
                    def data(self):
                        if self._should_write_data:
                            self._write_data()
                        if hasattr(self, '_m_data'):
                            return self._m_data

                        if not self.data__enabled:
                            return None

                        if self.size != 0:
                            pass
                            _pos = self._io.pos()
                            self._io.seek(self.offset)
                            self._m_data = (self._io.read_bytes(self.size)).decode(u"ASCII")
                            self._io.seek(_pos)

                        return getattr(self, '_m_data', None)

                    @data.setter
                    def data(self, v):
                        self._dirty = True
                        self._m_data = v

                    def _write_data(self):
                        self._should_write_data = False
                        if self.size != 0:
                            pass
                            _pos = self._io.pos()
                            self._io.seek(self.offset)
                            self._io.write_bytes((self._m_data).encode(u"ASCII"))
                            self._io.seek(_pos)



                class MetadataArea(ReadWriteKaitaiStruct):
                    """According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata."""
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.header = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader(self._io, self, self._root)
                        self.header._read()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        self.header._fetch_instances()


                    def _write__seq(self, io=None):
                        super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea, self)._write__seq(io)
                        self.header._write__seq(self._io)


                    def _check(self):
                        if self.header._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                        if self.header._parent != self:
                            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
                        self._dirty = False

                    class MetadataAreaHeader(ReadWriteKaitaiStruct):
                        def __init__(self, _io=None, _parent=None, _root=None):
                            super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader, self).__init__(_io)
                            self._parent = _parent
                            self._root = _root
                            self._should_write_metadata = False
                            self.metadata__enabled = True

                        def _read(self):
                            self.checksum = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader(self._io, self, self._root)
                            self.checksum._read()
                            self.signature = self._io.read_bytes(16)
                            if not self.signature == b"\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E":
                                raise kaitaistruct.ValidationNotEqualError(b"\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E", self.signature, self._io, u"/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1")
                            self.version = self._io.read_u4le()
                            self.metadata_area_offset = self._io.read_u8le()
                            self.metadata_area_size = self._io.read_u8le()
                            self.raw_location_descriptors = []
                            i = 0
                            while True:
                                _t_raw_location_descriptors = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor(self._io, self, self._root)
                                try:
                                    _t_raw_location_descriptors._read()
                                finally:
                                    _ = _t_raw_location_descriptors
                                    self.raw_location_descriptors.append(_)
                                if  ((_.offset != 0) and (_.size != 0) and (_.checksum != 0)) :
                                    break
                                i += 1
                            self._dirty = False


                        def _fetch_instances(self):
                            pass
                            self.checksum._fetch_instances()
                            for i in range(len(self.raw_location_descriptors)):
                                pass
                                self.raw_location_descriptors[i]._fetch_instances()

                            _ = self.metadata
                            if hasattr(self, '_m_metadata'):
                                pass



                        def _write__seq(self, io=None):
                            super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader, self)._write__seq(io)
                            self._should_write_metadata = self.metadata__enabled
                            self.checksum._write__seq(self._io)
                            self._io.write_bytes(self.signature)
                            self._io.write_u4le(self.version)
                            self._io.write_u8le(self.metadata_area_offset)
                            self._io.write_u8le(self.metadata_area_size)
                            for i in range(len(self.raw_location_descriptors)):
                                pass
                                self.raw_location_descriptors[i]._write__seq(self._io)



                        def _check(self):
                            if self.checksum._root != self._root:
                                raise kaitaistruct.ConsistencyError(u"checksum", self._root, self.checksum._root)
                            if self.checksum._parent != self:
                                raise kaitaistruct.ConsistencyError(u"checksum", self, self.checksum._parent)
                            if len(self.signature) != 16:
                                raise kaitaistruct.ConsistencyError(u"signature", 16, len(self.signature))
                            if not self.signature == b"\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E":
                                raise kaitaistruct.ValidationNotEqualError(b"\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E", self.signature, None, u"/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1")
                            if len(self.raw_location_descriptors) == 0:
                                raise kaitaistruct.ConsistencyError(u"raw_location_descriptors", 0, len(self.raw_location_descriptors))
                            for i in range(len(self.raw_location_descriptors)):
                                pass
                                if self.raw_location_descriptors[i]._root != self._root:
                                    raise kaitaistruct.ConsistencyError(u"raw_location_descriptors", self._root, self.raw_location_descriptors[i]._root)
                                if self.raw_location_descriptors[i]._parent != self:
                                    raise kaitaistruct.ConsistencyError(u"raw_location_descriptors", self, self.raw_location_descriptors[i]._parent)
                                _ = self.raw_location_descriptors[i]
                                if  ((_.offset != 0) and (_.size != 0) and (_.checksum != 0))  != (i == len(self.raw_location_descriptors) - 1):
                                    raise kaitaistruct.ConsistencyError(u"raw_location_descriptors", i == len(self.raw_location_descriptors) - 1,  ((_.offset != 0) and (_.size != 0) and (_.checksum != 0)) )

                            if self.metadata__enabled:
                                pass
                                if len(self._m_metadata) != self.metadata_area_size:
                                    raise kaitaistruct.ConsistencyError(u"metadata", self.metadata_area_size, len(self._m_metadata))

                            self._dirty = False

                        class RawLocationDescriptor(ReadWriteKaitaiStruct):
                            """The data area size can be 0. It is assumed it represents the remaining  available data."""

                            class RawLocationDescriptorFlags(IntEnum):
                                raw_location_ignored = 1
                            def __init__(self, _io=None, _parent=None, _root=None):
                                super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor, self).__init__(_io)
                                self._parent = _parent
                                self._root = _root

                            def _read(self):
                                self.offset = self._io.read_u8le()
                                self.size = self._io.read_u8le()
                                self.checksum = self._io.read_u4le()
                                self.flags = KaitaiStream.resolve_enum(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor.RawLocationDescriptorFlags, self._io.read_u4le())
                                self._dirty = False


                            def _fetch_instances(self):
                                pass


                            def _write__seq(self, io=None):
                                super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor, self)._write__seq(io)
                                self._io.write_u8le(self.offset)
                                self._io.write_u8le(self.size)
                                self._io.write_u4le(self.checksum)
                                self._io.write_u4le(int(self.flags))


                            def _check(self):
                                self._dirty = False


                        @property
                        def metadata(self):
                            if self._should_write_metadata:
                                self._write_metadata()
                            if hasattr(self, '_m_metadata'):
                                return self._m_metadata

                            if not self.metadata__enabled:
                                return None

                            _pos = self._io.pos()
                            self._io.seek(self.metadata_area_offset)
                            self._m_metadata = self._io.read_bytes(self.metadata_area_size)
                            self._io.seek(_pos)
                            return getattr(self, '_m_metadata', None)

                        @metadata.setter
                        def metadata(self, v):
                            self._dirty = True
                            self._m_metadata = v

                        def _write_metadata(self):
                            self._should_write_metadata = False
                            _pos = self._io.pos()
                            self._io.seek(self.metadata_area_offset)
                            self._io.write_bytes(self._m_metadata)
                            self._io.seek(_pos)



                class MetadataAreaDescriptor(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._should_write_data = False
                        self.data__enabled = True

                    def _read(self):
                        self.offset = self._io.read_u8le()
                        self.size = self._io.read_u8le()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        _ = self.data
                        if hasattr(self, '_m_data'):
                            pass
                            self._m_data._fetch_instances()



                    def _write__seq(self, io=None):
                        super(Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor, self)._write__seq(io)
                        self._should_write_data = self.data__enabled
                        self._io.write_u8le(self.offset)
                        self._io.write_u8le(self.size)


                    def _check(self):
                        if self.data__enabled:
                            pass
                            if self.size != 0:
                                pass
                                if self._m_data._root != self._root:
                                    raise kaitaistruct.ConsistencyError(u"data", self._root, self._m_data._root)
                                if self._m_data._parent != self:
                                    raise kaitaistruct.ConsistencyError(u"data", self, self._m_data._parent)


                        self._dirty = False

                    @property
                    def data(self):
                        if self._should_write_data:
                            self._write_data()
                        if hasattr(self, '_m_data'):
                            return self._m_data

                        if not self.data__enabled:
                            return None

                        if self.size != 0:
                            pass
                            _pos = self._io.pos()
                            self._io.seek(self.offset)
                            self._raw__m_data = self._io.read_bytes(self.size)
                            _io__raw__m_data = KaitaiStream(BytesIO(self._raw__m_data))
                            self._m_data = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea(_io__raw__m_data, self, self._root)
                            self._m_data._read()
                            self._io.seek(_pos)

                        return getattr(self, '_m_data', None)

                    @data.setter
                    def data(self, v):
                        self._dirty = True
                        self._m_data = v

                    def _write_data(self):
                        self._should_write_data = False
                        if self.size != 0:
                            pass
                            _pos = self._io.pos()
                            self._io.seek(self.offset)
                            _io__raw__m_data = KaitaiStream(BytesIO(bytearray(self.size)))
                            self._io.add_child_stream(_io__raw__m_data)
                            _pos2 = self._io.pos()
                            self._io.seek(self._io.pos() + (self.size))
                            def handler(parent, _io__raw__m_data=_io__raw__m_data):
                                self._raw__m_data = _io__raw__m_data.to_byte_array()
                                if len(self._raw__m_data) != self.size:
                                    raise kaitaistruct.ConsistencyError(u"raw(data)", self.size, len(self._raw__m_data))
                                parent.write_bytes(self._raw__m_data)
                            _io__raw__m_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                            self._m_data._write__seq(_io__raw__m_data)
                            self._io.seek(_pos)






    @property
    def sector_size(self):
        if hasattr(self, '_m_sector_size'):
            return self._m_sector_size

        self._m_sector_size = 512
        return getattr(self, '_m_sector_size', None)

    def _invalidate_sector_size(self):
        del self._m_sector_size

