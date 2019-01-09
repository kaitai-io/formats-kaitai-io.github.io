# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class RtpPacket(KaitaiStruct):
    """The Real-time Transport Protocol (RTP) is a widely used network protocol for transmitting audio or video. 
    It usually works with the RTP Control Protocol (RTCP). 
    The transmission can be based on Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
    """

    class PayloadTypeEnum(Enum):
        pcmu = 0
        reserved1 = 1
        reserved2 = 2
        gsm = 3
        g723 = 4
        dvi4_1 = 5
        dvi4_2 = 6
        lpc = 7
        pama = 8
        g722 = 9
        l16_1 = 10
        l16_2 = 11
        qcelp = 12
        cn = 13
        mpa = 14
        g728 = 15
        dvi4_3 = 16
        dvi4_4 = 17
        g729 = 18
        reserved3 = 19
        unassigned1 = 20
        unassigned2 = 21
        unassigned3 = 22
        unassigned4 = 23
        unassigned5 = 24
        celb = 25
        jpeg = 26
        unassigned6 = 27
        nv = 28
        unassigned7 = 29
        unassigned8 = 30
        h261 = 31
        mpv = 32
        mp2t = 33
        h263 = 34
        mpeg_ps = 96
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.version = self._io.read_bits_int(2)
        self.has_padding = self._io.read_bits_int(1) != 0
        self.has_extension = self._io.read_bits_int(1) != 0
        self.csrc_count = self._io.read_bits_int(4)
        self.marker = self._io.read_bits_int(1) != 0
        self.payload_type = self._root.PayloadTypeEnum(self._io.read_bits_int(7))
        self._io.align_to_byte()
        self.sequence_number = self._io.read_u2be()
        self.timestamp = self._io.read_u4be()
        self.ssrc = self._io.read_u4be()
        if self.has_extension:
            self.header_extension = self._root.HeaderExtention(self._io, self, self._root)

        self.data = self._io.read_bytes_full()

    class HeaderExtention(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.id = self._io.read_u2be()
            self.length = self._io.read_u2be()



