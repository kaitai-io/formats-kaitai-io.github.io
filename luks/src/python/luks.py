# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Luks(KaitaiStruct):
    """Linux Unified Key Setup (LUKS) is a format specification for storing disk
    encryption parameters and up to 8 user keys (which can unlock the master key).
    
    .. seealso::
       Source - https://gitlab.com/cryptsetup/cryptsetup/wikis/LUKS-standard/on-disk-format.pdf
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.partition_header = self._root.PartitionHeader(self._io, self, self._root)

    class PartitionHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x4C\x55\x4B\x53\xBA\xBE")
            self.version = self._io.ensure_fixed_contents(b"\x00\x01")
            self.cipher_name_specification = (self._io.read_bytes(32)).decode(u"ASCII")
            self.cipher_mode_specification = (self._io.read_bytes(32)).decode(u"ASCII")
            self.hash_specification = (self._io.read_bytes(32)).decode(u"ASCII")
            self.payload_offset = self._io.read_u4be()
            self.number_of_key_bytes = self._io.read_u4be()
            self.master_key_checksum = self._io.read_bytes(20)
            self.master_key_salt_parameter = self._io.read_bytes(32)
            self.master_key_iterations_parameter = self._io.read_u4be()
            self.uuid = (self._io.read_bytes(40)).decode(u"ASCII")
            self.key_slots = [None] * (8)
            for i in range(8):
                self.key_slots[i] = self._root.PartitionHeader.KeySlot(self._io, self, self._root)


        class KeySlot(KaitaiStruct):

            class KeySlotStates(Enum):
                disabled_key_slot = 57005
                enabled_key_slot = 11301363
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.state_of_key_slot = KaitaiStream.resolve_enum(self._root.PartitionHeader.KeySlot.KeySlotStates, self._io.read_u4be())
                self.iteration_parameter = self._io.read_u4be()
                self.salt_parameter = self._io.read_bytes(32)
                self.start_sector_of_key_material = self._io.read_u4be()
                self.number_of_anti_forensic_stripes = self._io.read_u4be()

            @property
            def key_material(self):
                if hasattr(self, '_m_key_material'):
                    return self._m_key_material if hasattr(self, '_m_key_material') else None

                _pos = self._io.pos()
                self._io.seek((self.start_sector_of_key_material * 512))
                self._m_key_material = self._io.read_bytes((self._parent.number_of_key_bytes * self.number_of_anti_forensic_stripes))
                self._io.seek(_pos)
                return self._m_key_material if hasattr(self, '_m_key_material') else None



    @property
    def payload(self):
        if hasattr(self, '_m_payload'):
            return self._m_payload if hasattr(self, '_m_payload') else None

        _pos = self._io.pos()
        self._io.seek((self.partition_header.payload_offset * 512))
        self._m_payload = self._io.read_bytes_full()
        self._io.seek(_pos)
        return self._m_payload if hasattr(self, '_m_payload') else None


