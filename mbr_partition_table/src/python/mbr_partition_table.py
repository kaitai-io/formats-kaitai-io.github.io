# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MbrPartitionTable(KaitaiStruct):
    """MBR (Master Boot Record) partition table is a traditional way of
    MS-DOS to partition larger hard disc drives into distinct
    partitions.
    
    This table is stored in the end of the boot sector (first sector) of
    the drive, after the bootstrap code. Original DOS 2.0 specification
    allowed only 4 partitions per disc, but DOS 3.2 introduced concept
    of "extended partitions", which work as nested extra "boot records"
    which are pointed to by original ("primary") partitions in MBR.
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(MbrPartitionTable, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.bootstrap_code = self._io.read_bytes(446)
        self.partitions = []
        for i in range(4):
            self.partitions.append(MbrPartitionTable.PartitionEntry(self._io, self, self._root))

        self.boot_signature = self._io.read_bytes(2)
        if not self.boot_signature == b"\x55\xAA":
            raise kaitaistruct.ValidationNotEqualError(b"\x55\xAA", self.boot_signature, self._io, u"/seq/2")


    def _fetch_instances(self):
        pass
        for i in range(len(self.partitions)):
            pass
            self.partitions[i]._fetch_instances()


    class Chs(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MbrPartitionTable.Chs, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.head = self._io.read_u1()
            self.b2 = self._io.read_u1()
            self.b3 = self._io.read_u1()


        def _fetch_instances(self):
            pass

        @property
        def cylinder(self):
            if hasattr(self, '_m_cylinder'):
                return self._m_cylinder

            self._m_cylinder = self.b3 + ((self.b2 & 192) << 2)
            return getattr(self, '_m_cylinder', None)

        @property
        def sector(self):
            if hasattr(self, '_m_sector'):
                return self._m_sector

            self._m_sector = self.b2 & 63
            return getattr(self, '_m_sector', None)


    class PartitionEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MbrPartitionTable.PartitionEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.status = self._io.read_u1()
            self.chs_start = MbrPartitionTable.Chs(self._io, self, self._root)
            self.partition_type = self._io.read_u1()
            self.chs_end = MbrPartitionTable.Chs(self._io, self, self._root)
            self.lba_start = self._io.read_u4le()
            self.num_sectors = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            self.chs_start._fetch_instances()
            self.chs_end._fetch_instances()



