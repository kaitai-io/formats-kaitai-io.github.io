# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Hccap(KaitaiStruct):
    """Native format of Hashcat password "recovery" utility.
    
    A sample of file for testing can be downloaded from
    <https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap>
    
    .. seealso::
       Source - https://hashcat.net/wiki/doku.php?id=hccap
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Hccap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(Hccap.HccapRecord(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()


    class EapolDummy(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Hccap.EapolDummy, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            pass


        def _fetch_instances(self):
            pass


    class HccapRecord(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Hccap.HccapRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.essid = self._io.read_bytes(36)
            self.mac_ap = self._io.read_bytes(6)
            self.mac_station = self._io.read_bytes(6)
            self.nonce_station = self._io.read_bytes(32)
            self.nonce_ap = self._io.read_bytes(32)
            self._raw_eapol_buffer = self._io.read_bytes(256)
            _io__raw_eapol_buffer = KaitaiStream(BytesIO(self._raw_eapol_buffer))
            self.eapol_buffer = Hccap.EapolDummy(_io__raw_eapol_buffer, self, self._root)
            self.len_eapol = self._io.read_u4le()
            self.keyver = self._io.read_u4le()
            self.keymic = self._io.read_bytes(16)


        def _fetch_instances(self):
            pass
            self.eapol_buffer._fetch_instances()
            _ = self.eapol
            if hasattr(self, '_m_eapol'):
                pass


        @property
        def eapol(self):
            if hasattr(self, '_m_eapol'):
                return self._m_eapol

            io = self.eapol_buffer._io
            _pos = io.pos()
            io.seek(0)
            self._m_eapol = io.read_bytes(self.len_eapol)
            io.seek(_pos)
            return getattr(self, '_m_eapol', None)



