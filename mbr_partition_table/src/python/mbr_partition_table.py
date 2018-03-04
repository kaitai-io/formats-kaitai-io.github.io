# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

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
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.bootstrap_code = self._io.read_bytes(446)
        self.partitions = [None] * (4)
        for i in range(4):
            self.partitions[i] = self._root.PartitionEntry(self._io, self, self._root)

        self.boot_signature = self._io.ensure_fixed_contents(b"\x55\xAA")

    class PartitionEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.status = self._io.read_u1()
            self.chs_start = self._root.Chs(self._io, self, self._root)
            self.partition_type = self._io.read_u1()
            self.chs_end = self._root.Chs(self._io, self, self._root)
            self.lba_start = self._io.read_u4le()
            self.num_sectors = self._io.read_u4le()


    class Chs(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.head = self._io.read_u1()
            self.b2 = self._io.read_u1()
            self.b3 = self._io.read_u1()

        @property
        def sector(self):
            if hasattr(self, '_m_sector'):
                return self._m_sector

            self._m_sector = (self.b2 & 63)
            return self._m_sector

        @property
        def cylinder(self):
            if hasattr(self, '_m_cylinder'):
                return self._m_cylinder

            self._m_cylinder = (self.b3 + ((self.b2 & 192) << 2))
            return self._m_cylinder



