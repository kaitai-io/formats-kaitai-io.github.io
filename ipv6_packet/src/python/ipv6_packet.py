# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import protocol_body


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ipv6Packet(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        super(Ipv6Packet, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.version = self._io.read_bits_int_be(4)
        self.traffic_class = self._io.read_bits_int_be(8)
        self.flow_label = self._io.read_bits_int_be(20)
        self.payload_length = self._io.read_u2be()
        self.next_header_type = self._io.read_u1()
        self.hop_limit = self._io.read_u1()
        self.src_ipv6_addr = self._io.read_bytes(16)
        self.dst_ipv6_addr = self._io.read_bytes(16)
        self.next_header = protocol_body.ProtocolBody(self.next_header_type, self._io)
        self.rest = self._io.read_bytes_full()


    def _fetch_instances(self):
        pass
        self.next_header._fetch_instances()


