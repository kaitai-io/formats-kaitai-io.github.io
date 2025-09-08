# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Luks(KaitaiStruct):
    """Linux Unified Key Setup (LUKS) is a format specification for storing disk
    encryption parameters and up to 8 user keys (which can unlock the master key).
    
    .. seealso::
       Source - https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Luks, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.partition_header = Luks.PartitionHeader(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.partition_header._fetch_instances()
        _ = self.payload
        if hasattr(self, '_m_payload'):
            pass


    class PartitionHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Luks.PartitionHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
                self.key_slots.append(Luks.PartitionHeader.KeySlot(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.key_slots)):
                pass
                self.key_slots[i]._fetch_instances()


        class KeySlot(KaitaiStruct):

            class KeySlotStates(IntEnum):
                disabled_key_slot = 57005
                enabled_key_slot = 11301363
            def __init__(self, _io, _parent=None, _root=None):
                super(Luks.PartitionHeader.KeySlot, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.state_of_key_slot = KaitaiStream.resolve_enum(Luks.PartitionHeader.KeySlot.KeySlotStates, self._io.read_u4be())
                self.iteration_parameter = self._io.read_u4be()
                self.salt_parameter = self._io.read_bytes(32)
                self.start_sector_of_key_material = self._io.read_u4be()
                self.number_of_anti_forensic_stripes = self._io.read_u4be()


            def _fetch_instances(self):
                pass
                _ = self.key_material
                if hasattr(self, '_m_key_material'):
                    pass


            @property
            def key_material(self):
                if hasattr(self, '_m_key_material'):
                    return self._m_key_material

                _pos = self._io.pos()
                self._io.seek(self.start_sector_of_key_material * 512)
                self._m_key_material = self._io.read_bytes(self._parent.number_of_key_bytes * self.number_of_anti_forensic_stripes)
                self._io.seek(_pos)
                return getattr(self, '_m_key_material', None)



    @property
    def payload(self):
        if hasattr(self, '_m_payload'):
            return self._m_payload

        _pos = self._io.pos()
        self._io.seek(self.partition_header.payload_offset * 512)
        self._m_payload = self._io.read_bytes_full()
        self._io.seek(_pos)
        return getattr(self, '_m_payload', None)


