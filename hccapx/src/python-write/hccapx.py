# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Hccapx(ReadWriteKaitaiStruct):
    """Native format of Hashcat password "recovery" utility
    
    .. seealso::
       Source - https://hashcat.net/wiki/doku.php?id=hccapx
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Hccapx, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = Hccapx.HccapxRecord(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Hccapx, self)._write__seq(io)
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            self.records[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class HccapxRecord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Hccapx.HccapxRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x48\x43\x50\x58":
                raise kaitaistruct.ValidationNotEqualError(b"\x48\x43\x50\x58", self.magic, self._io, u"/types/hccapx_record/seq/0")
            self.version = self._io.read_u4le()
            self.ignore_replay_counter = self._io.read_bits_int_be(1) != 0
            self.message_pair = self._io.read_bits_int_be(7)
            self.len_essid = self._io.read_u1()
            self.essid = self._io.read_bytes(self.len_essid)
            self.padding1 = self._io.read_bytes(32 - self.len_essid)
            self.keyver = self._io.read_u1()
            self.keymic = self._io.read_bytes(16)
            self.mac_ap = self._io.read_bytes(6)
            self.nonce_ap = self._io.read_bytes(32)
            self.mac_station = self._io.read_bytes(6)
            self.nonce_station = self._io.read_bytes(32)
            self.len_eapol = self._io.read_u2le()
            self.eapol = self._io.read_bytes(self.len_eapol)
            self.padding2 = self._io.read_bytes(256 - self.len_eapol)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Hccapx.HccapxRecord, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.version)
            self._io.write_bits_int_be(1, int(self.ignore_replay_counter))
            self._io.write_bits_int_be(7, self.message_pair)
            self._io.write_u1(self.len_essid)
            self._io.write_bytes(self.essid)
            self._io.write_bytes(self.padding1)
            self._io.write_u1(self.keyver)
            self._io.write_bytes(self.keymic)
            self._io.write_bytes(self.mac_ap)
            self._io.write_bytes(self.nonce_ap)
            self._io.write_bytes(self.mac_station)
            self._io.write_bytes(self.nonce_station)
            self._io.write_u2le(self.len_eapol)
            self._io.write_bytes(self.eapol)
            self._io.write_bytes(self.padding2)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x48\x43\x50\x58":
                raise kaitaistruct.ValidationNotEqualError(b"\x48\x43\x50\x58", self.magic, None, u"/types/hccapx_record/seq/0")
            if len(self.essid) != self.len_essid:
                raise kaitaistruct.ConsistencyError(u"essid", self.len_essid, len(self.essid))
            if len(self.padding1) != 32 - self.len_essid:
                raise kaitaistruct.ConsistencyError(u"padding1", 32 - self.len_essid, len(self.padding1))
            if len(self.keymic) != 16:
                raise kaitaistruct.ConsistencyError(u"keymic", 16, len(self.keymic))
            if len(self.mac_ap) != 6:
                raise kaitaistruct.ConsistencyError(u"mac_ap", 6, len(self.mac_ap))
            if len(self.nonce_ap) != 32:
                raise kaitaistruct.ConsistencyError(u"nonce_ap", 32, len(self.nonce_ap))
            if len(self.mac_station) != 6:
                raise kaitaistruct.ConsistencyError(u"mac_station", 6, len(self.mac_station))
            if len(self.nonce_station) != 32:
                raise kaitaistruct.ConsistencyError(u"nonce_station", 32, len(self.nonce_station))
            if len(self.eapol) != self.len_eapol:
                raise kaitaistruct.ConsistencyError(u"eapol", self.len_eapol, len(self.eapol))
            if len(self.padding2) != 256 - self.len_eapol:
                raise kaitaistruct.ConsistencyError(u"padding2", 256 - self.len_eapol, len(self.padding2))
            self._dirty = False



