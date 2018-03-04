# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Hccap(KaitaiStruct):
    """Native format of Hashcat password "recovery" utility.
    
    A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
    
    .. seealso::
       Source - https://hashcat.net/wiki/doku.php?id=hccap
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(self._root.HccapRecord(self._io, self, self._root))
            i += 1


    class HccapRecord(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.essid = self._io.read_bytes(36)
            self.mac_ap = self._io.read_bytes(6)
            self.mac_station = self._io.read_bytes(6)
            self.nonce_station = self._io.read_bytes(32)
            self.nonce_ap = self._io.read_bytes(32)
            self._raw_eapol_buffer = self._io.read_bytes(256)
            io = KaitaiStream(BytesIO(self._raw_eapol_buffer))
            self.eapol_buffer = self._root.EapolDummy(io, self, self._root)
            self.len_eapol = self._io.read_u4le()
            self.keyver = self._io.read_u4le()
            self.keymic = self._io.read_bytes(16)

        @property
        def eapol(self):
            if hasattr(self, '_m_eapol'):
                return self._m_eapol

            io = self.eapol_buffer._io
            _pos = io.pos()
            io.seek(0)
            self._m_eapol = io.read_bytes(self.len_eapol)
            io.seek(_pos)
            return self._m_eapol


    class EapolDummy(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            pass



