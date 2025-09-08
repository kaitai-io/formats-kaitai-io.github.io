# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AmlogicEmmcPartitions(ReadWriteKaitaiStruct):
    """This is an unnamed and undocumented partition table format implemented by
    the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
    series at least, and probably others). They appear to use this rather than GPT,
    the industry standard, because their BootROM loads and executes the next stage
    loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
    header would have to start. So instead of changing their BootROM, Amlogic
    devised this partition table, which lives at an offset of 36MiB (0x240_0000)
    on the eMMC and so doesn't conflict. This parser expects as input just the
    partition table from that offset. The maximum number of partitions in a table
    is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
    
    .. seealso::
       Source - http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef
    
    
    .. seealso::
       Source - http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AmlogicEmmcPartitions, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x4D\x50\x54\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x50\x54\x00", self.magic, self._io, u"/seq/0")
        self.version = (KaitaiStream.bytes_terminate(self._io.read_bytes(12), 0, False)).decode(u"UTF-8")
        self.num_partitions = self._io.read_s4le()
        if not self.num_partitions >= 1:
            raise kaitaistruct.ValidationLessThanError(1, self.num_partitions, self._io, u"/seq/2")
        if not self.num_partitions <= 32:
            raise kaitaistruct.ValidationGreaterThanError(32, self.num_partitions, self._io, u"/seq/2")
        self.checksum = self._io.read_u4le()
        self.partitions = []
        for i in range(self.num_partitions):
            _t_partitions = AmlogicEmmcPartitions.Partition(self._io, self, self._root)
            try:
                _t_partitions._read()
            finally:
                self.partitions.append(_t_partitions)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.partitions)):
            pass
            self.partitions[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AmlogicEmmcPartitions, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_bytes_limit((self.version).encode(u"UTF-8"), 12, 0, 0)
        self._io.write_s4le(self.num_partitions)
        self._io.write_u4le(self.checksum)
        for i in range(len(self.partitions)):
            pass
            self.partitions[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x4D\x50\x54\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x50\x54\x00", self.magic, None, u"/seq/0")
        if len((self.version).encode(u"UTF-8")) > 12:
            raise kaitaistruct.ConsistencyError(u"version", 12, len((self.version).encode(u"UTF-8")))
        if KaitaiStream.byte_array_index_of((self.version).encode(u"UTF-8"), 0) != -1:
            raise kaitaistruct.ConsistencyError(u"version", -1, KaitaiStream.byte_array_index_of((self.version).encode(u"UTF-8"), 0))
        if not self.num_partitions >= 1:
            raise kaitaistruct.ValidationLessThanError(1, self.num_partitions, None, u"/seq/2")
        if not self.num_partitions <= 32:
            raise kaitaistruct.ValidationGreaterThanError(32, self.num_partitions, None, u"/seq/2")
        if len(self.partitions) != self.num_partitions:
            raise kaitaistruct.ConsistencyError(u"partitions", self.num_partitions, len(self.partitions))
        for i in range(len(self.partitions)):
            pass
            if self.partitions[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"partitions", self._root, self.partitions[i]._root)
            if self.partitions[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"partitions", self, self.partitions[i]._parent)

        self._dirty = False

    class Partition(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AmlogicEmmcPartitions.Partition, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"UTF-8")
            self.size = self._io.read_u8le()
            self.offset = self._io.read_u8le()
            self._raw_flags = self._io.read_bytes(4)
            _io__raw_flags = KaitaiStream(BytesIO(self._raw_flags))
            self.flags = AmlogicEmmcPartitions.Partition.PartFlags(_io__raw_flags, self, self._root)
            self.flags._read()
            self.padding = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()


        def _write__seq(self, io=None):
            super(AmlogicEmmcPartitions.Partition, self)._write__seq(io)
            self._io.write_bytes_limit((self.name).encode(u"UTF-8"), 16, 0, 0)
            self._io.write_u8le(self.size)
            self._io.write_u8le(self.offset)
            _io__raw_flags = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_flags)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_flags=_io__raw_flags):
                self._raw_flags = _io__raw_flags.to_byte_array()
                if len(self._raw_flags) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(flags)", 4, len(self._raw_flags))
                parent.write_bytes(self._raw_flags)
            _io__raw_flags.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.flags._write__seq(_io__raw_flags)
            self._io.write_bytes(self.padding)


        def _check(self):
            if len((self.name).encode(u"UTF-8")) > 16:
                raise kaitaistruct.ConsistencyError(u"name", 16, len((self.name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"UTF-8"), 0))
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.padding) != 4:
                raise kaitaistruct.ConsistencyError(u"padding", 4, len(self.padding))
            self._dirty = False

        class PartFlags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AmlogicEmmcPartitions.Partition.PartFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.is_code = self._io.read_bits_int_le(1) != 0
                self.is_cache = self._io.read_bits_int_le(1) != 0
                self.is_data = self._io.read_bits_int_le(1) != 0
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AmlogicEmmcPartitions.Partition.PartFlags, self)._write__seq(io)
                self._io.write_bits_int_le(1, int(self.is_code))
                self._io.write_bits_int_le(1, int(self.is_cache))
                self._io.write_bits_int_le(1, int(self.is_data))


            def _check(self):
                self._dirty = False




