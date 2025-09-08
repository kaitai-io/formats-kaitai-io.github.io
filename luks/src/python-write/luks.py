# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Luks(ReadWriteKaitaiStruct):
    """Linux Unified Key Setup (LUKS) is a format specification for storing disk
    encryption parameters and up to 8 user keys (which can unlock the master key).
    
    .. seealso::
       Source - https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Luks, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_payload = False
        self.payload__enabled = True

    def _read(self):
        self.partition_header = Luks.PartitionHeader(self._io, self, self._root)
        self.partition_header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.partition_header._fetch_instances()
        _ = self.payload
        if hasattr(self, '_m_payload'):
            pass



    def _write__seq(self, io=None):
        super(Luks, self)._write__seq(io)
        self._should_write_payload = self.payload__enabled
        self.partition_header._write__seq(self._io)


    def _check(self):
        if self.partition_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"partition_header", self._root, self.partition_header._root)
        if self.partition_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"partition_header", self, self.partition_header._parent)
        if self.payload__enabled:
            pass

        self._dirty = False

    class PartitionHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Luks.PartitionHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(6)
            if not self.magic == b"\x4C\x55\x4B\x53\xBA\xBE":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x55\x4B\x53\xBA\xBE", self.magic, self._io, u"/types/partition_header/seq/0")
            self.version = self._io.read_bytes(2)
            if not self.version == b"\x00\x01":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x01", self.version, self._io, u"/types/partition_header/seq/1")
            self.cipher_name_specification = (self._io.read_bytes(32)).decode(u"ASCII")
            self.cipher_mode_specification = (self._io.read_bytes(32)).decode(u"ASCII")
            self.hash_specification = (self._io.read_bytes(32)).decode(u"ASCII")
            self.payload_offset = self._io.read_u4be()
            self.number_of_key_bytes = self._io.read_u4be()
            self.master_key_checksum = self._io.read_bytes(20)
            self.master_key_salt_parameter = self._io.read_bytes(32)
            self.master_key_iterations_parameter = self._io.read_u4be()
            self.uuid = (self._io.read_bytes(40)).decode(u"ASCII")
            self.key_slots = []
            for i in range(8):
                _t_key_slots = Luks.PartitionHeader.KeySlot(self._io, self, self._root)
                try:
                    _t_key_slots._read()
                finally:
                    self.key_slots.append(_t_key_slots)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.key_slots)):
                pass
                self.key_slots[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Luks.PartitionHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes(self.version)
            self._io.write_bytes((self.cipher_name_specification).encode(u"ASCII"))
            self._io.write_bytes((self.cipher_mode_specification).encode(u"ASCII"))
            self._io.write_bytes((self.hash_specification).encode(u"ASCII"))
            self._io.write_u4be(self.payload_offset)
            self._io.write_u4be(self.number_of_key_bytes)
            self._io.write_bytes(self.master_key_checksum)
            self._io.write_bytes(self.master_key_salt_parameter)
            self._io.write_u4be(self.master_key_iterations_parameter)
            self._io.write_bytes((self.uuid).encode(u"ASCII"))
            for i in range(len(self.key_slots)):
                pass
                self.key_slots[i]._write__seq(self._io)



        def _check(self):
            if len(self.magic) != 6:
                raise kaitaistruct.ConsistencyError(u"magic", 6, len(self.magic))
            if not self.magic == b"\x4C\x55\x4B\x53\xBA\xBE":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x55\x4B\x53\xBA\xBE", self.magic, None, u"/types/partition_header/seq/0")
            if len(self.version) != 2:
                raise kaitaistruct.ConsistencyError(u"version", 2, len(self.version))
            if not self.version == b"\x00\x01":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x01", self.version, None, u"/types/partition_header/seq/1")
            if len((self.cipher_name_specification).encode(u"ASCII")) != 32:
                raise kaitaistruct.ConsistencyError(u"cipher_name_specification", 32, len((self.cipher_name_specification).encode(u"ASCII")))
            if len((self.cipher_mode_specification).encode(u"ASCII")) != 32:
                raise kaitaistruct.ConsistencyError(u"cipher_mode_specification", 32, len((self.cipher_mode_specification).encode(u"ASCII")))
            if len((self.hash_specification).encode(u"ASCII")) != 32:
                raise kaitaistruct.ConsistencyError(u"hash_specification", 32, len((self.hash_specification).encode(u"ASCII")))
            if len(self.master_key_checksum) != 20:
                raise kaitaistruct.ConsistencyError(u"master_key_checksum", 20, len(self.master_key_checksum))
            if len(self.master_key_salt_parameter) != 32:
                raise kaitaistruct.ConsistencyError(u"master_key_salt_parameter", 32, len(self.master_key_salt_parameter))
            if len((self.uuid).encode(u"ASCII")) != 40:
                raise kaitaistruct.ConsistencyError(u"uuid", 40, len((self.uuid).encode(u"ASCII")))
            if len(self.key_slots) != 8:
                raise kaitaistruct.ConsistencyError(u"key_slots", 8, len(self.key_slots))
            for i in range(len(self.key_slots)):
                pass
                if self.key_slots[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"key_slots", self._root, self.key_slots[i]._root)
                if self.key_slots[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"key_slots", self, self.key_slots[i]._parent)

            self._dirty = False

        class KeySlot(ReadWriteKaitaiStruct):

            class KeySlotStates(IntEnum):
                disabled_key_slot = 57005
                enabled_key_slot = 11301363
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Luks.PartitionHeader.KeySlot, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_key_material = False
                self.key_material__enabled = True

            def _read(self):
                self.state_of_key_slot = KaitaiStream.resolve_enum(Luks.PartitionHeader.KeySlot.KeySlotStates, self._io.read_u4be())
                self.iteration_parameter = self._io.read_u4be()
                self.salt_parameter = self._io.read_bytes(32)
                self.start_sector_of_key_material = self._io.read_u4be()
                self.number_of_anti_forensic_stripes = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.key_material
                if hasattr(self, '_m_key_material'):
                    pass



            def _write__seq(self, io=None):
                super(Luks.PartitionHeader.KeySlot, self)._write__seq(io)
                self._should_write_key_material = self.key_material__enabled
                self._io.write_u4be(int(self.state_of_key_slot))
                self._io.write_u4be(self.iteration_parameter)
                self._io.write_bytes(self.salt_parameter)
                self._io.write_u4be(self.start_sector_of_key_material)
                self._io.write_u4be(self.number_of_anti_forensic_stripes)


            def _check(self):
                if len(self.salt_parameter) != 32:
                    raise kaitaistruct.ConsistencyError(u"salt_parameter", 32, len(self.salt_parameter))
                if self.key_material__enabled:
                    pass
                    if len(self._m_key_material) != self._parent.number_of_key_bytes * self.number_of_anti_forensic_stripes:
                        raise kaitaistruct.ConsistencyError(u"key_material", self._parent.number_of_key_bytes * self.number_of_anti_forensic_stripes, len(self._m_key_material))

                self._dirty = False

            @property
            def key_material(self):
                if self._should_write_key_material:
                    self._write_key_material()
                if hasattr(self, '_m_key_material'):
                    return self._m_key_material

                if not self.key_material__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.start_sector_of_key_material * 512)
                self._m_key_material = self._io.read_bytes(self._parent.number_of_key_bytes * self.number_of_anti_forensic_stripes)
                self._io.seek(_pos)
                return getattr(self, '_m_key_material', None)

            @key_material.setter
            def key_material(self, v):
                self._dirty = True
                self._m_key_material = v

            def _write_key_material(self):
                self._should_write_key_material = False
                _pos = self._io.pos()
                self._io.seek(self.start_sector_of_key_material * 512)
                self._io.write_bytes(self._m_key_material)
                self._io.seek(_pos)



    @property
    def payload(self):
        if self._should_write_payload:
            self._write_payload()
        if hasattr(self, '_m_payload'):
            return self._m_payload

        if not self.payload__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.partition_header.payload_offset * 512)
        self._m_payload = self._io.read_bytes_full()
        self._io.seek(_pos)
        return getattr(self, '_m_payload', None)

    @payload.setter
    def payload(self, v):
        self._dirty = True
        self._m_payload = v

    def _write_payload(self):
        self._should_write_payload = False
        _pos = self._io.pos()
        self._io.seek(self.partition_header.payload_offset * 512)
        self._io.write_bytes(self._m_payload)
        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"payload", 0, self._io.size() - self._io.pos())
        self._io.seek(_pos)


