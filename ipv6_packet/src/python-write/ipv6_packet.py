# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import protocol_body


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ipv6Packet(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ipv6Packet, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

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
        self.next_header._read()
        self.rest = self._io.read_bytes_full()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.next_header._fetch_instances()


    def _write__seq(self, io=None):
        super(Ipv6Packet, self)._write__seq(io)
        self._io.write_bits_int_be(4, self.version)
        self._io.write_bits_int_be(8, self.traffic_class)
        self._io.write_bits_int_be(20, self.flow_label)
        self._io.write_u2be(self.payload_length)
        self._io.write_u1(self.next_header_type)
        self._io.write_u1(self.hop_limit)
        self._io.write_bytes(self.src_ipv6_addr)
        self._io.write_bytes(self.dst_ipv6_addr)
        self.next_header._write__seq(self._io)
        self._io.write_bytes(self.rest)
        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"rest", 0, self._io.size() - self._io.pos())


    def _check(self):
        if len(self.src_ipv6_addr) != 16:
            raise kaitaistruct.ConsistencyError(u"src_ipv6_addr", 16, len(self.src_ipv6_addr))
        if len(self.dst_ipv6_addr) != 16:
            raise kaitaistruct.ConsistencyError(u"dst_ipv6_addr", 16, len(self.dst_ipv6_addr))
        if self.next_header.protocol_num != self.next_header_type:
            raise kaitaistruct.ConsistencyError(u"next_header", self.next_header_type, self.next_header.protocol_num)
        self._dirty = False


