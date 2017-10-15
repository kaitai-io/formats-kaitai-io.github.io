# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Hccap(KaitaiStruct):
    """Native format of Hashcat password "recovery" utility
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
            self.records.append(self._root.Hccap(self._io, self, self._root))
            i += 1


    class Hccap(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.essid = (KaitaiStream.bytes_terminate(self._io.read_bytes(36), 0, False)).decode(u"utf-8")
            self.ap_mac = self._io.read_bytes(6)
            self.stantion_mac = self._io.read_bytes(6)
            self.stantion_nonce = self._io.read_bytes(32)
            self.ap_nonce = self._io.read_bytes(32)
            self._raw_eapol = self._io.read_bytes(256)
            io = KaitaiStream(BytesIO(self._raw_eapol))
            self.eapol = self._root.EapolFrame(io, self, self._root)
            self.eapol_size = self._io.read_u4le()
            self.keyver = self._io.read_u4le()
            self.keymic = self._io.read_bytes(16)


    class EapolFrame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            pass

        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body if hasattr(self, '_m_body') else None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_body = self._io.read_bytes(self._parent.eapol_size)
            self._io.seek(_pos)
            return self._m_body if hasattr(self, '_m_body') else None



