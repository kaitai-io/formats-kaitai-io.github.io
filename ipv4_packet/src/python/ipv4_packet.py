# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

import protocol_body
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
        _io__raw_options = KaitaiStream(BytesIO(self._raw_options))
        self.options = Ipv4Packet.Ipv4Options(_io__raw_options, self, self._root)
        self._raw_body = self._io.read_bytes((self.total_length - self.ihl_bytes))
        _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
        self.body = protocol_body.ProtocolBody(self.protocol, _io__raw_body)

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
                self.entries.append(Ipv4Packet.Ipv4Option(self._io, self, self._root))
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
                return self._m_copy

            self._m_copy = ((self.b1 & 128) >> 7)
            return getattr(self, '_m_copy', None)

        @property
        def opt_class(self):
            if hasattr(self, '_m_opt_class'):
                return self._m_opt_class

            self._m_opt_class = ((self.b1 & 96) >> 5)
            return getattr(self, '_m_opt_class', None)

        @property
        def number(self):
            if hasattr(self, '_m_number'):
                return self._m_number

            self._m_number = (self.b1 & 31)
            return getattr(self, '_m_number', None)


    @property
    def version(self):
        if hasattr(self, '_m_version'):
            return self._m_version

        self._m_version = ((self.b1 & 240) >> 4)
        return getattr(self, '_m_version', None)

    @property
    def ihl(self):
        if hasattr(self, '_m_ihl'):
            return self._m_ihl

        self._m_ihl = (self.b1 & 15)
        return getattr(self, '_m_ihl', None)

    @property
    def ihl_bytes(self):
        if hasattr(self, '_m_ihl_bytes'):
            return self._m_ihl_bytes

        self._m_ihl_bytes = (self.ihl * 4)
        return getattr(self, '_m_ihl_bytes', None)


