# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class RtcpPayload(KaitaiStruct):
    """RTCP is the Real-Time Control Protocol.
    
    .. seealso::
       Source - https://www.rfc-editor.org/rfc/rfc3550
    """

    class PayloadType(IntEnum):
        fir = 192
        nack = 193
        ij = 195
        sr = 200
        rr = 201
        sdes = 202
        bye = 203
        app = 204
        rtpfb = 205
        psfb = 206
        xr = 207
        avb = 208
        rsi = 209

    class PsfbSubtype(IntEnum):
        pli = 1
        sli = 2
        rpsi = 3
        fir = 4
        tstr = 5
        tstn = 6
        vbcm = 7
        afb = 15

    class RtpfbSubtype(IntEnum):
        nack = 1
        tmmbr = 3
        tmmbn = 4
        rrr = 5
        transport_feedback = 15

    class SdesSubtype(IntEnum):
        pad = 0
        cname = 1
        name = 2
        email = 3
        phone = 4
        loc = 5
        tool = 6
        note = 7
        priv = 8
    def __init__(self, _io, _parent=None, _root=None):
        super(RtcpPayload, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.rtcp_packets = []
        i = 0
        while not self._io.is_eof():
            self.rtcp_packets.append(RtcpPayload.RtcpPacket(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.rtcp_packets)):
            pass
            self.rtcp_packets[i]._fetch_instances()


    class PacketStatusChunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.PacketStatusChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.t = self._io.read_bits_int_be(1) != 0
            if int(self.t) == 0:
                pass
                self.s2 = self._io.read_bits_int_be(2)

            if int(self.t) == 1:
                pass
                self.s1 = self._io.read_bits_int_be(1) != 0

            if int(self.t) == 0:
                pass
                self.rle = self._io.read_bits_int_be(13)

            if int(self.t) == 1:
                pass
                self.symbol_list = self._io.read_bits_int_be(14)



        def _fetch_instances(self):
            pass
            if int(self.t) == 0:
                pass

            if int(self.t) == 1:
                pass

            if int(self.t) == 0:
                pass

            if int(self.t) == 1:
                pass


        @property
        def s(self):
            if hasattr(self, '_m_s'):
                return self._m_s

            self._m_s = (self.s2 if int(self.t) == 0 else (1 if int(self.s1) == 0 else 0))
            return getattr(self, '_m_s', None)


    class PsfbAfbPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.PsfbAfbPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.uid = self._io.read_u4be()
            _on = self.uid
            if _on == 1380273474:
                pass
                self._raw_contents = self._io.read_bytes_full()
                _io__raw_contents = KaitaiStream(BytesIO(self._raw_contents))
                self.contents = RtcpPayload.PsfbAfbRembPacket(_io__raw_contents, self, self._root)
            else:
                pass
                self.contents = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            _on = self.uid
            if _on == 1380273474:
                pass
                self.contents._fetch_instances()
            else:
                pass


    class PsfbAfbRembPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.PsfbAfbRembPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_ssrc = self._io.read_u1()
            self.br_exp = self._io.read_bits_int_be(6)
            self.br_mantissa = self._io.read_bits_int_be(18)
            self.ssrc_list = []
            for i in range(self.num_ssrc):
                self.ssrc_list.append(self._io.read_u4be())



        def _fetch_instances(self):
            pass
            for i in range(len(self.ssrc_list)):
                pass


        @property
        def max_total_bitrate(self):
            if hasattr(self, '_m_max_total_bitrate'):
                return self._m_max_total_bitrate

            self._m_max_total_bitrate = self.br_mantissa * (1 << self.br_exp)
            return getattr(self, '_m_max_total_bitrate', None)


    class PsfbPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.PsfbPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.ssrc_media_source = self._io.read_u4be()
            _on = self.fmt
            if _on == RtcpPayload.PsfbSubtype.afb:
                pass
                self._raw_fci_block = self._io.read_bytes_full()
                _io__raw_fci_block = KaitaiStream(BytesIO(self._raw_fci_block))
                self.fci_block = RtcpPayload.PsfbAfbPacket(_io__raw_fci_block, self, self._root)
            else:
                pass
                self.fci_block = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            _on = self.fmt
            if _on == RtcpPayload.PsfbSubtype.afb:
                pass
                self.fci_block._fetch_instances()
            else:
                pass

        @property
        def fmt(self):
            if hasattr(self, '_m_fmt'):
                return self._m_fmt

            self._m_fmt = KaitaiStream.resolve_enum(RtcpPayload.PsfbSubtype, self._parent.subtype)
            return getattr(self, '_m_fmt', None)


    class ReportBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.ReportBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ssrc_source = self._io.read_u4be()
            self.lost_val = self._io.read_u1()
            self.highest_seq_num_received = self._io.read_u4be()
            self.interarrival_jitter = self._io.read_u4be()
            self.lsr = self._io.read_u4be()
            self.dlsr = self._io.read_u4be()


        def _fetch_instances(self):
            pass

        @property
        def cumulative_packets_lost(self):
            if hasattr(self, '_m_cumulative_packets_lost'):
                return self._m_cumulative_packets_lost

            self._m_cumulative_packets_lost = self.lost_val & 16777215
            return getattr(self, '_m_cumulative_packets_lost', None)

        @property
        def fraction_lost(self):
            if hasattr(self, '_m_fraction_lost'):
                return self._m_fraction_lost

            self._m_fraction_lost = self.lost_val >> 24
            return getattr(self, '_m_fraction_lost', None)


    class RrPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.RrPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.report_block = []
            for i in range(self._parent.subtype):
                self.report_block.append(RtcpPayload.ReportBlock(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.report_block)):
                pass
                self.report_block[i]._fetch_instances()



    class RtcpPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.RtcpPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.version = self._io.read_bits_int_be(2)
            self.padding = self._io.read_bits_int_be(1) != 0
            self.subtype = self._io.read_bits_int_be(5)
            self.payload_type = KaitaiStream.resolve_enum(RtcpPayload.PayloadType, self._io.read_u1())
            self.length = self._io.read_u2be()
            _on = self.payload_type
            if _on == RtcpPayload.PayloadType.psfb:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.PsfbPacket(_io__raw_body, self, self._root)
            elif _on == RtcpPayload.PayloadType.rr:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.RrPacket(_io__raw_body, self, self._root)
            elif _on == RtcpPayload.PayloadType.rtpfb:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.RtpfbPacket(_io__raw_body, self, self._root)
            elif _on == RtcpPayload.PayloadType.sdes:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.SdesPacket(_io__raw_body, self, self._root)
            elif _on == RtcpPayload.PayloadType.sr:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.SrPacket(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(4 * self.length)


        def _fetch_instances(self):
            pass
            _on = self.payload_type
            if _on == RtcpPayload.PayloadType.psfb:
                pass
                self.body._fetch_instances()
            elif _on == RtcpPayload.PayloadType.rr:
                pass
                self.body._fetch_instances()
            elif _on == RtcpPayload.PayloadType.rtpfb:
                pass
                self.body._fetch_instances()
            elif _on == RtcpPayload.PayloadType.sdes:
                pass
                self.body._fetch_instances()
            elif _on == RtcpPayload.PayloadType.sr:
                pass
                self.body._fetch_instances()
            else:
                pass


    class RtpfbPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.RtpfbPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.ssrc_media_source = self._io.read_u4be()
            _on = self.fmt
            if _on == RtcpPayload.RtpfbSubtype.transport_feedback:
                pass
                self._raw_fci_block = self._io.read_bytes_full()
                _io__raw_fci_block = KaitaiStream(BytesIO(self._raw_fci_block))
                self.fci_block = RtcpPayload.RtpfbTransportFeedbackPacket(_io__raw_fci_block, self, self._root)
            else:
                pass
                self.fci_block = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            _on = self.fmt
            if _on == RtcpPayload.RtpfbSubtype.transport_feedback:
                pass
                self.fci_block._fetch_instances()
            else:
                pass

        @property
        def fmt(self):
            if hasattr(self, '_m_fmt'):
                return self._m_fmt

            self._m_fmt = KaitaiStream.resolve_enum(RtcpPayload.RtpfbSubtype, self._parent.subtype)
            return getattr(self, '_m_fmt', None)


    class RtpfbTransportFeedbackPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.RtpfbTransportFeedbackPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.base_sequence_number = self._io.read_u2be()
            self.packet_status_count = self._io.read_u2be()
            self.b4 = self._io.read_u4be()
            self.remaining = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            _ = self.packet_status
            if hasattr(self, '_m_packet_status'):
                pass

            _ = self.recv_delta
            if hasattr(self, '_m_recv_delta'):
                pass


        @property
        def fb_pkt_count(self):
            if hasattr(self, '_m_fb_pkt_count'):
                return self._m_fb_pkt_count

            self._m_fb_pkt_count = self.b4 & 255
            return getattr(self, '_m_fb_pkt_count', None)

        @property
        def packet_status(self):
            if hasattr(self, '_m_packet_status'):
                return self._m_packet_status

            self._m_packet_status = self._io.read_bytes(0)
            return getattr(self, '_m_packet_status', None)

        @property
        def recv_delta(self):
            if hasattr(self, '_m_recv_delta'):
                return self._m_recv_delta

            self._m_recv_delta = self._io.read_bytes(0)
            return getattr(self, '_m_recv_delta', None)

        @property
        def reference_time(self):
            if hasattr(self, '_m_reference_time'):
                return self._m_reference_time

            self._m_reference_time = self.b4 >> 8
            return getattr(self, '_m_reference_time', None)


    class SdesPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.SdesPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.source_chunk = []
            for i in range(self.source_count):
                self.source_chunk.append(RtcpPayload.SourceChunk(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.source_chunk)):
                pass
                self.source_chunk[i]._fetch_instances()


        @property
        def source_count(self):
            if hasattr(self, '_m_source_count'):
                return self._m_source_count

            self._m_source_count = self._parent.subtype
            return getattr(self, '_m_source_count', None)


    class SdesTlv(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.SdesTlv, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.type = KaitaiStream.resolve_enum(RtcpPayload.SdesSubtype, self._io.read_u1())
            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                self.length = self._io.read_u1()

            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                self.value = self._io.read_bytes(self.length)



        def _fetch_instances(self):
            pass
            if self.type != RtcpPayload.SdesSubtype.pad:
                pass

            if self.type != RtcpPayload.SdesSubtype.pad:
                pass



    class SourceChunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.SourceChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.sdes_tlv = []
            i = 0
            while not self._io.is_eof():
                self.sdes_tlv.append(RtcpPayload.SdesTlv(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.sdes_tlv)):
                pass
                self.sdes_tlv[i]._fetch_instances()



    class SrPacket(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RtcpPayload.SrPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.ntp_msw = self._io.read_u4be()
            self.ntp_lsw = self._io.read_u4be()
            self.rtp_timestamp = self._io.read_u4be()
            self.sender_packet_count = self._io.read_u4be()
            self.sender_octet_count = self._io.read_u4be()
            self.report_block = []
            for i in range(self._parent.subtype):
                self.report_block.append(RtcpPayload.ReportBlock(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.report_block)):
                pass
                self.report_block[i]._fetch_instances()


        @property
        def ntp(self):
            if hasattr(self, '_m_ntp'):
                return self._m_ntp

            self._m_ntp = self.ntp_msw << 32 & self.ntp_lsw
            return getattr(self, '_m_ntp', None)



