# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class TcpSegment(ReadWriteKaitaiStruct):
    """TCP is one of the core Internet protocols on transport layer (AKA
    OSI layer 4), providing stateful connections with error checking,
    guarantees of delivery, order of segments and avoidance of duplicate
    delivery.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(TcpSegment, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.src_port = self._io.read_u2be()
        self.dst_port = self._io.read_u2be()
        self.seq_num = self._io.read_u4be()
        self.ack_num = self._io.read_u4be()
        self.data_offset = self._io.read_bits_int_be(4)
        self.reserved = self._io.read_bits_int_be(4)
        self.flags = TcpSegment.Flags(self._io, self, self._root)
        self.flags._read()
        self.window_size = self._io.read_u2be()
        self.checksum = self._io.read_u2be()
        self.urgent_pointer = self._io.read_u2be()
        if self.data_offset * 4 - 20 != 0:
            pass
            self.options = self._io.read_bytes(self.data_offset * 4 - 20)

        self.body = self._io.read_bytes_full()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        if self.data_offset * 4 - 20 != 0:
            pass



    def _write__seq(self, io=None):
        super(TcpSegment, self)._write__seq(io)
        self._io.write_u2be(self.src_port)
        self._io.write_u2be(self.dst_port)
        self._io.write_u4be(self.seq_num)
        self._io.write_u4be(self.ack_num)
        self._io.write_bits_int_be(4, self.data_offset)
        self._io.write_bits_int_be(4, self.reserved)
        self.flags._write__seq(self._io)
        self._io.write_u2be(self.window_size)
        self._io.write_u2be(self.checksum)
        self._io.write_u2be(self.urgent_pointer)
        if self.data_offset * 4 - 20 != 0:
            pass
            self._io.write_bytes(self.options)

        self._io.write_bytes(self.body)
        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"body", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.flags._root != self._root:
            raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
        if self.flags._parent != self:
            raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
        if self.data_offset * 4 - 20 != 0:
            pass
            if len(self.options) != self.data_offset * 4 - 20:
                raise kaitaistruct.ConsistencyError(u"options", self.data_offset * 4 - 20, len(self.options))

        self._dirty = False

    class Flags(ReadWriteKaitaiStruct):
        """TCP header flags as defined "TCP Header Flags" registry.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(TcpSegment.Flags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.cwr = self._io.read_bits_int_be(1) != 0
            self.ece = self._io.read_bits_int_be(1) != 0
            self.urg = self._io.read_bits_int_be(1) != 0
            self.ack = self._io.read_bits_int_be(1) != 0
            self.psh = self._io.read_bits_int_be(1) != 0
            self.rst = self._io.read_bits_int_be(1) != 0
            self.syn = self._io.read_bits_int_be(1) != 0
            self.fin = self._io.read_bits_int_be(1) != 0
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(TcpSegment.Flags, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.cwr))
            self._io.write_bits_int_be(1, int(self.ece))
            self._io.write_bits_int_be(1, int(self.urg))
            self._io.write_bits_int_be(1, int(self.ack))
            self._io.write_bits_int_be(1, int(self.psh))
            self._io.write_bits_int_be(1, int(self.rst))
            self._io.write_bits_int_be(1, int(self.syn))
            self._io.write_bits_int_be(1, int(self.fin))


        def _check(self):
            self._dirty = False


        def __str__(self):
            return (((((((u"|CWR" if self.cwr else u"") + (u"|ECE" if self.ece else u"")) + (u"|URG" if self.urg else u"")) + (u"|ACK" if self.ack else u"")) + (u"|PSH" if self.psh else u"")) + (u"|RST" if self.rst else u"")) + (u"|SYN" if self.syn else u"")) + (u"|FIN" if self.fin else u"")


