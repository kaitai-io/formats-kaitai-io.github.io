# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class TcpSegment(KaitaiStruct):
    """TCP is one of the core Internet protocols on transport layer (AKA
    OSI layer 4), providing stateful connections with error checking,
    guarantees of delivery, order of segments and avoidance of duplicate
    delivery.
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(TcpSegment, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.src_port = self._io.read_u2be()
        self.dst_port = self._io.read_u2be()
        self.seq_num = self._io.read_u4be()
        self.ack_num = self._io.read_u4be()
        self.data_offset = self._io.read_bits_int_be(4)
        self.reserved = self._io.read_bits_int_be(4)
        self.flags = TcpSegment.Flags(self._io, self, self._root)
        self.window_size = self._io.read_u2be()
        self.checksum = self._io.read_u2be()
        self.urgent_pointer = self._io.read_u2be()
        if self.data_offset * 4 - 20 != 0:
            pass
            self.options = self._io.read_bytes(self.data_offset * 4 - 20)

        self.body = self._io.read_bytes_full()


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        if self.data_offset * 4 - 20 != 0:
            pass


    class Flags(KaitaiStruct):
        """TCP header flags as defined "TCP Header Flags" registry.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(TcpSegment.Flags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.cwr = self._io.read_bits_int_be(1) != 0
            self.ece = self._io.read_bits_int_be(1) != 0
            self.urg = self._io.read_bits_int_be(1) != 0
            self.ack = self._io.read_bits_int_be(1) != 0
            self.psh = self._io.read_bits_int_be(1) != 0
            self.rst = self._io.read_bits_int_be(1) != 0
            self.syn = self._io.read_bits_int_be(1) != 0
            self.fin = self._io.read_bits_int_be(1) != 0


        def _fetch_instances(self):
            pass


        def __str__(self):
            return (((((((u"|CWR" if self.cwr else u"") + (u"|ECE" if self.ece else u"")) + (u"|URG" if self.urg else u"")) + (u"|ACK" if self.ack else u"")) + (u"|PSH" if self.psh else u"")) + (u"|RST" if self.rst else u"")) + (u"|SYN" if self.syn else u"")) + (u"|FIN" if self.fin else u"")


