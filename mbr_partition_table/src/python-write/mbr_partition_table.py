# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MbrPartitionTable(ReadWriteKaitaiStruct):
    """MBR (Master Boot Record) partition table is a traditional way of
    MS-DOS to partition larger hard disc drives into distinct
    partitions.
    
    This table is stored in the end of the boot sector (first sector) of
    the drive, after the bootstrap code. Original DOS 2.0 specification
    allowed only 4 partitions per disc, but DOS 3.2 introduced concept
    of "extended partitions", which work as nested extra "boot records"
    which are pointed to by original ("primary") partitions in MBR.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MbrPartitionTable, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.bootstrap_code = self._io.read_bytes(446)
        self.partitions = []
        for i in range(4):
            _t_partitions = MbrPartitionTable.PartitionEntry(self._io, self, self._root)
            try:
                _t_partitions._read()
            finally:
                self.partitions.append(_t_partitions)

        self.boot_signature = self._io.read_bytes(2)
        if not self.boot_signature == b"\x55\xAA":
            raise kaitaistruct.ValidationNotEqualError(b"\x55\xAA", self.boot_signature, self._io, u"/seq/2")
        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.partitions)):
            pass
            self.partitions[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(MbrPartitionTable, self)._write__seq(io)
        self._io.write_bytes(self.bootstrap_code)
        for i in range(len(self.partitions)):
            pass
            self.partitions[i]._write__seq(self._io)

        self._io.write_bytes(self.boot_signature)


    def _check(self):
        if len(self.bootstrap_code) != 446:
            raise kaitaistruct.ConsistencyError(u"bootstrap_code", 446, len(self.bootstrap_code))
        if len(self.partitions) != 4:
            raise kaitaistruct.ConsistencyError(u"partitions", 4, len(self.partitions))
        for i in range(len(self.partitions)):
            pass
            if self.partitions[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"partitions", self._root, self.partitions[i]._root)
            if self.partitions[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"partitions", self, self.partitions[i]._parent)

        if len(self.boot_signature) != 2:
            raise kaitaistruct.ConsistencyError(u"boot_signature", 2, len(self.boot_signature))
        if not self.boot_signature == b"\x55\xAA":
            raise kaitaistruct.ValidationNotEqualError(b"\x55\xAA", self.boot_signature, None, u"/seq/2")
        self._dirty = False

    class Chs(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MbrPartitionTable.Chs, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.head = self._io.read_u1()
            self.b2 = self._io.read_u1()
            self.b3 = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MbrPartitionTable.Chs, self)._write__seq(io)
            self._io.write_u1(self.head)
            self._io.write_u1(self.b2)
            self._io.write_u1(self.b3)


        def _check(self):
            self._dirty = False

        @property
        def cylinder(self):
            if hasattr(self, '_m_cylinder'):
                return self._m_cylinder

            self._m_cylinder = self.b3 + ((self.b2 & 192) << 2)
            return getattr(self, '_m_cylinder', None)

        def _invalidate_cylinder(self):
            del self._m_cylinder
        @property
        def sector(self):
            if hasattr(self, '_m_sector'):
                return self._m_sector

            self._m_sector = self.b2 & 63
            return getattr(self, '_m_sector', None)

        def _invalidate_sector(self):
            del self._m_sector

    class PartitionEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MbrPartitionTable.PartitionEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.status = self._io.read_u1()
            self.chs_start = MbrPartitionTable.Chs(self._io, self, self._root)
            self.chs_start._read()
            self.partition_type = self._io.read_u1()
            self.chs_end = MbrPartitionTable.Chs(self._io, self, self._root)
            self.chs_end._read()
            self.lba_start = self._io.read_u4le()
            self.num_sectors = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.chs_start._fetch_instances()
            self.chs_end._fetch_instances()


        def _write__seq(self, io=None):
            super(MbrPartitionTable.PartitionEntry, self)._write__seq(io)
            self._io.write_u1(self.status)
            self.chs_start._write__seq(self._io)
            self._io.write_u1(self.partition_type)
            self.chs_end._write__seq(self._io)
            self._io.write_u4le(self.lba_start)
            self._io.write_u4le(self.num_sectors)


        def _check(self):
            if self.chs_start._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chs_start", self._root, self.chs_start._root)
            if self.chs_start._parent != self:
                raise kaitaistruct.ConsistencyError(u"chs_start", self, self.chs_start._parent)
            if self.chs_end._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chs_end", self._root, self.chs_end._root)
            if self.chs_end._parent != self:
                raise kaitaistruct.ConsistencyError(u"chs_end", self, self.chs_end._parent)
            self._dirty = False



