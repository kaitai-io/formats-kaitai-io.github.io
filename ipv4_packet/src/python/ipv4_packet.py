# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

from protocol_body import ProtocolBody
class Ipv4Packet(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.b1 = self._io.read_u1()
        self.b2 = self._io.read_u1()
        self.total_length = self._io.read_u2be()
        self.identification = self._io.read_u2be()
        self.b67 = self._io.read_u2be()
        self.ttl = self._io.read_u1()
        self.protocol = self._io.read_u1()
        self.header_checksum = self._io.read_u2be()
        self.src_ip_addr = self._io.read_bytes(4)
        self.dst_ip_addr = self._io.read_bytes(4)
        self._raw_options = self._io.read_bytes((self.ihl_bytes - 20))
        io = KaitaiStream(BytesIO(self._raw_options))
        self.options = self._root.Ipv4Options(io, self, self._root)
        self._raw_body = self._io.read_bytes((self.total_length - self.ihl_bytes))
        io = KaitaiStream(BytesIO(self._raw_body))
        self.body = ProtocolBody(self.protocol, io)

    class Ipv4Options(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(self._root.Ipv4Option(self._io, self, self._root))
                i += 1



    class Ipv4Option(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.b1 = self._io.read_u1()
            self.len = self._io.read_u1()
            self.body = self._io.read_bytes(((self.len - 2) if self.len > 2 else 0))

        @property
        def copy(self):
            if hasattr(self, '_m_copy'):
                return self._m_copy if hasattr(self, '_m_copy') else None

            self._m_copy = ((self.b1 & 128) >> 7)
            return self._m_copy if hasattr(self, '_m_copy') else None

        @property
        def opt_class(self):
            if hasattr(self, '_m_opt_class'):
                return self._m_opt_class if hasattr(self, '_m_opt_class') else None

            self._m_opt_class = ((self.b1 & 96) >> 5)
            return self._m_opt_class if hasattr(self, '_m_opt_class') else None

        @property
        def number(self):
            if hasattr(self, '_m_number'):
                return self._m_number if hasattr(self, '_m_number') else None

            self._m_number = (self.b1 & 31)
            return self._m_number if hasattr(self, '_m_number') else None


    @property
    def version(self):
        if hasattr(self, '_m_version'):
            return self._m_version if hasattr(self, '_m_version') else None

        self._m_version = ((self.b1 & 240) >> 4)
        return self._m_version if hasattr(self, '_m_version') else None

    @property
    def ihl(self):
        if hasattr(self, '_m_ihl'):
            return self._m_ihl if hasattr(self, '_m_ihl') else None

        self._m_ihl = (self.b1 & 15)
        return self._m_ihl if hasattr(self, '_m_ihl') else None

    @property
    def ihl_bytes(self):
        if hasattr(self, '_m_ihl_bytes'):
            return self._m_ihl_bytes if hasattr(self, '_m_ihl_bytes') else None

        self._m_ihl_bytes = (self.ihl * 4)
        return self._m_ihl_bytes if hasattr(self, '_m_ihl_bytes') else None


