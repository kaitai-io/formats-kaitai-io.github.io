# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class UdpDatagram(ReadWriteKaitaiStruct):
    """UDP is a simple stateless transport layer (AKA OSI layer 4)
    protocol, one of the core Internet protocols. It provides source and
    destination ports, basic checksumming, but provides not guarantees
    of delivery, order of packets, or duplicate delivery.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(UdpDatagram, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.src_port = self._io.read_u2be()
        self.dst_port = self._io.read_u2be()
        self.length = self._io.read_u2be()
        self.checksum = self._io.read_u2be()
        self.body = self._io.read_bytes(self.length - 8)
        self._dirty = False


    def _fetch_instances(self):
        pass


    def _write__seq(self, io=None):
        super(UdpDatagram, self)._write__seq(io)
        self._io.write_u2be(self.src_port)
        self._io.write_u2be(self.dst_port)
        self._io.write_u2be(self.length)
        self._io.write_u2be(self.checksum)
        self._io.write_bytes(self.body)


    def _check(self):
        if len(self.body) != self.length - 8:
            raise kaitaistruct.ConsistencyError(u"body", self.length - 8, len(self.body))
        self._dirty = False


