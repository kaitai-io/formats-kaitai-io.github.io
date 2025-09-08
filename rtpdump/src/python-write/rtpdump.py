# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import rtp_packet


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Rtpdump(ReadWriteKaitaiStruct):
    """rtpdump is a format used by rtptools to record and replay
    rtp data from network capture.
    
    .. seealso::
       Source - https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Rtpdump, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.file_header = Rtpdump.HeaderT(self._io, self, self._root)
        self.file_header._read()
        self.packets = []
        i = 0
        while not self._io.is_eof():
            _t_packets = Rtpdump.PacketT(self._io, self, self._root)
            try:
                _t_packets._read()
            finally:
                self.packets.append(_t_packets)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.file_header._fetch_instances()
        for i in range(len(self.packets)):
            pass
            self.packets[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Rtpdump, self)._write__seq(io)
        self.file_header._write__seq(self._io)
        for i in range(len(self.packets)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"packets", 0, self._io.size() - self._io.pos())
            self.packets[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"packets", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.file_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"file_header", self._root, self.file_header._root)
        if self.file_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"file_header", self, self.file_header._parent)
        for i in range(len(self.packets)):
            pass
            if self.packets[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"packets", self._root, self.packets[i]._root)
            if self.packets[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"packets", self, self.packets[i]._parent)

        self._dirty = False

    class HeaderT(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rtpdump.HeaderT, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.shebang = self._io.read_bytes(12)
            if not self.shebang == b"\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30", self.shebang, self._io, u"/types/header_t/seq/0")
            self.space = self._io.read_bytes(1)
            if not self.space == b"\x20":
                raise kaitaistruct.ValidationNotEqualError(b"\x20", self.space, self._io, u"/types/header_t/seq/1")
            self.ip = (self._io.read_bytes_term(47, False, True, True)).decode(u"ASCII")
            self.port = (self._io.read_bytes_term(10, False, True, True)).decode(u"ASCII")
            self.start_sec = self._io.read_u4be()
            self.start_usec = self._io.read_u4be()
            self.ip2 = self._io.read_u4be()
            self.port2 = self._io.read_u2be()
            self.padding = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Rtpdump.HeaderT, self)._write__seq(io)
            self._io.write_bytes(self.shebang)
            self._io.write_bytes(self.space)
            self._io.write_bytes((self.ip).encode(u"ASCII"))
            self._io.write_u1(47)
            self._io.write_bytes((self.port).encode(u"ASCII"))
            self._io.write_u1(10)
            self._io.write_u4be(self.start_sec)
            self._io.write_u4be(self.start_usec)
            self._io.write_u4be(self.ip2)
            self._io.write_u2be(self.port2)
            self._io.write_u2be(self.padding)


        def _check(self):
            if len(self.shebang) != 12:
                raise kaitaistruct.ConsistencyError(u"shebang", 12, len(self.shebang))
            if not self.shebang == b"\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30":
                raise kaitaistruct.ValidationNotEqualError(b"\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30", self.shebang, None, u"/types/header_t/seq/0")
            if len(self.space) != 1:
                raise kaitaistruct.ConsistencyError(u"space", 1, len(self.space))
            if not self.space == b"\x20":
                raise kaitaistruct.ValidationNotEqualError(b"\x20", self.space, None, u"/types/header_t/seq/1")
            if KaitaiStream.byte_array_index_of((self.ip).encode(u"ASCII"), 47) != -1:
                raise kaitaistruct.ConsistencyError(u"ip", -1, KaitaiStream.byte_array_index_of((self.ip).encode(u"ASCII"), 47))
            if KaitaiStream.byte_array_index_of((self.port).encode(u"ASCII"), 10) != -1:
                raise kaitaistruct.ConsistencyError(u"port", -1, KaitaiStream.byte_array_index_of((self.port).encode(u"ASCII"), 10))
            self._dirty = False


    class PacketT(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rtpdump.PacketT, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length = self._io.read_u2be()
            self.len_body = self._io.read_u2be()
            self.packet_usec = self._io.read_u4be()
            self._raw_body = self._io.read_bytes(self.len_body)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = rtp_packet.RtpPacket(_io__raw_body)
            self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(Rtpdump.PacketT, self)._write__seq(io)
            self._io.write_u2be(self.length)
            self._io.write_u2be(self.len_body)
            self._io.write_u4be(self.packet_usec)
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_body))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len_body:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)


        def _check(self):
            self._dirty = False



