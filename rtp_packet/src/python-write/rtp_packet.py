# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class RtpPacket(ReadWriteKaitaiStruct):
    """The Real-time Transport Protocol (RTP) is a widely used network
    protocol for transmitting audio or video. It usually works with the
    RTP Control Protocol (RTCP). The transmission can be based on
    Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
    """

    class PayloadTypeEnum(IntEnum):
        pcmu = 0
        reserved1 = 1
        reserved2 = 2
        gsm = 3
        g723 = 4
        dvi4_1 = 5
        dvi4_2 = 6
        lpc = 7
        pcma = 8
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
        reserved19 = 19
        unassigned20 = 20
        unassigned21 = 21
        unassigned22 = 22
        unassigned23 = 23
        unassigned24 = 24
        celb = 25
        jpeg = 26
        unassigned27 = 27
        nv = 28
        unassigned29 = 29
        unassigned30 = 30
        h261 = 31
        mpv = 32
        mp2t = 33
        h263 = 34
        mpeg_ps = 96
    def __init__(self, _io=None, _parent=None, _root=None):
        super(RtpPacket, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_len_padding_if_exists = False
        self.len_padding_if_exists__enabled = True

    def _read(self):
        self.version = self._io.read_bits_int_be(2)
        self.has_padding = self._io.read_bits_int_be(1) != 0
        self.has_extension = self._io.read_bits_int_be(1) != 0
        self.csrc_count = self._io.read_bits_int_be(4)
        self.marker = self._io.read_bits_int_be(1) != 0
        self.payload_type = KaitaiStream.resolve_enum(RtpPacket.PayloadTypeEnum, self._io.read_bits_int_be(7))
        self.sequence_number = self._io.read_u2be()
        self.timestamp = self._io.read_u4be()
        self.ssrc = self._io.read_u4be()
        if self.has_extension:
            pass
            self.header_extension = RtpPacket.HeaderExtention(self._io, self, self._root)
            self.header_extension._read()

        self.data = self._io.read_bytes((self._io.size() - self._io.pos()) - self.len_padding)
        self.padding = self._io.read_bytes(self.len_padding)
        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.has_extension:
            pass
            self.header_extension._fetch_instances()

        _ = self.len_padding_if_exists
        if hasattr(self, '_m_len_padding_if_exists'):
            pass



    def _write__seq(self, io=None):
        super(RtpPacket, self)._write__seq(io)
        self._should_write_len_padding_if_exists = self.len_padding_if_exists__enabled
        self._io.write_bits_int_be(2, self.version)
        self._io.write_bits_int_be(1, int(self.has_padding))
        self._io.write_bits_int_be(1, int(self.has_extension))
        self._io.write_bits_int_be(4, self.csrc_count)
        self._io.write_bits_int_be(1, int(self.marker))
        self._io.write_bits_int_be(7, int(self.payload_type))
        self._io.write_u2be(self.sequence_number)
        self._io.write_u4be(self.timestamp)
        self._io.write_u4be(self.ssrc)
        if self.has_extension:
            pass
            self.header_extension._write__seq(self._io)

        if len(self.data) != (self._io.size() - self._io.pos()) - self.len_padding:
            raise kaitaistruct.ConsistencyError(u"data", (self._io.size() - self._io.pos()) - self.len_padding, len(self.data))
        self._io.write_bytes(self.data)
        if len(self.padding) != self.len_padding:
            raise kaitaistruct.ConsistencyError(u"padding", self.len_padding, len(self.padding))
        self._io.write_bytes(self.padding)


    def _check(self):
        if self.has_extension:
            pass
            if self.header_extension._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header_extension", self._root, self.header_extension._root)
            if self.header_extension._parent != self:
                raise kaitaistruct.ConsistencyError(u"header_extension", self, self.header_extension._parent)

        if self.len_padding_if_exists__enabled:
            pass
            if self.has_padding:
                pass


        self._dirty = False

    class HeaderExtention(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtpPacket.HeaderExtention, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u2be()
            self.length = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RtpPacket.HeaderExtention, self)._write__seq(io)
            self._io.write_u2be(self.id)
            self._io.write_u2be(self.length)


        def _check(self):
            self._dirty = False


    @property
    def len_padding(self):
        """Always returns number of padding bytes to in the payload."""
        if hasattr(self, '_m_len_padding'):
            return self._m_len_padding

        self._m_len_padding = (self.len_padding_if_exists if self.has_padding else 0)
        return getattr(self, '_m_len_padding', None)

    def _invalidate_len_padding(self):
        del self._m_len_padding
    @property
    def len_padding_if_exists(self):
        """If padding bit is enabled, last byte of data contains number of
        bytes appended to the payload as padding.
        """
        if self._should_write_len_padding_if_exists:
            self._write_len_padding_if_exists()
        if hasattr(self, '_m_len_padding_if_exists'):
            return self._m_len_padding_if_exists

        if not self.len_padding_if_exists__enabled:
            return None

        if self.has_padding:
            pass
            _pos = self._io.pos()
            self._io.seek(self._io.size() - 1)
            self._m_len_padding_if_exists = self._io.read_u1()
            self._io.seek(_pos)

        return getattr(self, '_m_len_padding_if_exists', None)

    @len_padding_if_exists.setter
    def len_padding_if_exists(self, v):
        self._dirty = True
        self._m_len_padding_if_exists = v

    def _write_len_padding_if_exists(self):
        self._should_write_len_padding_if_exists = False
        if self.has_padding:
            pass
            _pos = self._io.pos()
            self._io.seek(self._io.size() - 1)
            self._io.write_u1(self._m_len_padding_if_exists)
            self._io.seek(_pos)



