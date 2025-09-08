# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class VmwareVmdk(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header
    """

    class CompressionMethods(IntEnum):
        none = 0
        deflate = 1
    def __init__(self, _io=None, _parent=None, _root=None):
        super(VmwareVmdk, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_descriptor = False
        self.descriptor__enabled = True
        self._should_write_grain_primary = False
        self.grain_primary__enabled = True
        self._should_write_grain_secondary = False
        self.grain_secondary__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x4B\x44\x4D\x56":
            raise kaitaistruct.ValidationNotEqualError(b"\x4B\x44\x4D\x56", self.magic, self._io, u"/seq/0")
        self.version = self._io.read_s4le()
        self.flags = VmwareVmdk.HeaderFlags(self._io, self, self._root)
        self.flags._read()
        self.size_max = self._io.read_s8le()
        self.size_grain = self._io.read_s8le()
        self.start_descriptor = self._io.read_s8le()
        self.size_descriptor = self._io.read_s8le()
        self.num_grain_table_entries = self._io.read_s4le()
        self.start_secondary_grain = self._io.read_s8le()
        self.start_primary_grain = self._io.read_s8le()
        self.size_metadata = self._io.read_s8le()
        self.is_dirty = self._io.read_u1()
        self.stuff = self._io.read_bytes(4)
        self.compression_method = KaitaiStream.resolve_enum(VmwareVmdk.CompressionMethods, self._io.read_u2le())
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        _ = self.descriptor
        if hasattr(self, '_m_descriptor'):
            pass

        _ = self.grain_primary
        if hasattr(self, '_m_grain_primary'):
            pass

        _ = self.grain_secondary
        if hasattr(self, '_m_grain_secondary'):
            pass



    def _write__seq(self, io=None):
        super(VmwareVmdk, self)._write__seq(io)
        self._should_write_descriptor = self.descriptor__enabled
        self._should_write_grain_primary = self.grain_primary__enabled
        self._should_write_grain_secondary = self.grain_secondary__enabled
        self._io.write_bytes(self.magic)
        self._io.write_s4le(self.version)
        self.flags._write__seq(self._io)
        self._io.write_s8le(self.size_max)
        self._io.write_s8le(self.size_grain)
        self._io.write_s8le(self.start_descriptor)
        self._io.write_s8le(self.size_descriptor)
        self._io.write_s4le(self.num_grain_table_entries)
        self._io.write_s8le(self.start_secondary_grain)
        self._io.write_s8le(self.start_primary_grain)
        self._io.write_s8le(self.size_metadata)
        self._io.write_u1(self.is_dirty)
        self._io.write_bytes(self.stuff)
        self._io.write_u2le(int(self.compression_method))


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x4B\x44\x4D\x56":
            raise kaitaistruct.ValidationNotEqualError(b"\x4B\x44\x4D\x56", self.magic, None, u"/seq/0")
        if self.flags._root != self._root:
            raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
        if self.flags._parent != self:
            raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
        if len(self.stuff) != 4:
            raise kaitaistruct.ConsistencyError(u"stuff", 4, len(self.stuff))
        if self.descriptor__enabled:
            pass
            if len(self._m_descriptor) != self.size_descriptor * self._root.len_sector:
                raise kaitaistruct.ConsistencyError(u"descriptor", self.size_descriptor * self._root.len_sector, len(self._m_descriptor))

        if self.grain_primary__enabled:
            pass
            if len(self._m_grain_primary) != self.size_grain * self._root.len_sector:
                raise kaitaistruct.ConsistencyError(u"grain_primary", self.size_grain * self._root.len_sector, len(self._m_grain_primary))

        if self.grain_secondary__enabled:
            pass
            if len(self._m_grain_secondary) != self.size_grain * self._root.len_sector:
                raise kaitaistruct.ConsistencyError(u"grain_secondary", self.size_grain * self._root.len_sector, len(self._m_grain_secondary))

        self._dirty = False

    class HeaderFlags(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(VmwareVmdk.HeaderFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved1 = self._io.read_bits_int_be(5)
            self.zeroed_grain_table_entry = self._io.read_bits_int_be(1) != 0
            self.use_secondary_grain_dir = self._io.read_bits_int_be(1) != 0
            self.valid_new_line_detection_test = self._io.read_bits_int_be(1) != 0
            self.reserved2 = self._io.read_u1()
            self.reserved3 = self._io.read_bits_int_be(6)
            self.has_metadata = self._io.read_bits_int_be(1) != 0
            self.has_compressed_grain = self._io.read_bits_int_be(1) != 0
            self.reserved4 = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(VmwareVmdk.HeaderFlags, self)._write__seq(io)
            self._io.write_bits_int_be(5, self.reserved1)
            self._io.write_bits_int_be(1, int(self.zeroed_grain_table_entry))
            self._io.write_bits_int_be(1, int(self.use_secondary_grain_dir))
            self._io.write_bits_int_be(1, int(self.valid_new_line_detection_test))
            self._io.write_u1(self.reserved2)
            self._io.write_bits_int_be(6, self.reserved3)
            self._io.write_bits_int_be(1, int(self.has_metadata))
            self._io.write_bits_int_be(1, int(self.has_compressed_grain))
            self._io.write_u1(self.reserved4)


        def _check(self):
            self._dirty = False


    @property
    def descriptor(self):
        if self._should_write_descriptor:
            self._write_descriptor()
        if hasattr(self, '_m_descriptor'):
            return self._m_descriptor

        if not self.descriptor__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.start_descriptor * self._root.len_sector)
        self._m_descriptor = self._io.read_bytes(self.size_descriptor * self._root.len_sector)
        self._io.seek(_pos)
        return getattr(self, '_m_descriptor', None)

    @descriptor.setter
    def descriptor(self, v):
        self._dirty = True
        self._m_descriptor = v

    def _write_descriptor(self):
        self._should_write_descriptor = False
        _pos = self._io.pos()
        self._io.seek(self.start_descriptor * self._root.len_sector)
        self._io.write_bytes(self._m_descriptor)
        self._io.seek(_pos)

    @property
    def grain_primary(self):
        if self._should_write_grain_primary:
            self._write_grain_primary()
        if hasattr(self, '_m_grain_primary'):
            return self._m_grain_primary

        if not self.grain_primary__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.start_primary_grain * self._root.len_sector)
        self._m_grain_primary = self._io.read_bytes(self.size_grain * self._root.len_sector)
        self._io.seek(_pos)
        return getattr(self, '_m_grain_primary', None)

    @grain_primary.setter
    def grain_primary(self, v):
        self._dirty = True
        self._m_grain_primary = v

    def _write_grain_primary(self):
        self._should_write_grain_primary = False
        _pos = self._io.pos()
        self._io.seek(self.start_primary_grain * self._root.len_sector)
        self._io.write_bytes(self._m_grain_primary)
        self._io.seek(_pos)

    @property
    def grain_secondary(self):
        if self._should_write_grain_secondary:
            self._write_grain_secondary()
        if hasattr(self, '_m_grain_secondary'):
            return self._m_grain_secondary

        if not self.grain_secondary__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.start_secondary_grain * self._root.len_sector)
        self._m_grain_secondary = self._io.read_bytes(self.size_grain * self._root.len_sector)
        self._io.seek(_pos)
        return getattr(self, '_m_grain_secondary', None)

    @grain_secondary.setter
    def grain_secondary(self, v):
        self._dirty = True
        self._m_grain_secondary = v

    def _write_grain_secondary(self):
        self._should_write_grain_secondary = False
        _pos = self._io.pos()
        self._io.seek(self.start_secondary_grain * self._root.len_sector)
        self._io.write_bytes(self._m_grain_secondary)
        self._io.seek(_pos)

    @property
    def len_sector(self):
        if hasattr(self, '_m_len_sector'):
            return self._m_len_sector

        self._m_len_sector = 512
        return getattr(self, '_m_len_sector', None)

    def _invalidate_len_sector(self):
        del self._m_len_sector

