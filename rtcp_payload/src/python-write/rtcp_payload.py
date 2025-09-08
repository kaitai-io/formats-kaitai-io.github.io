# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class RtcpPayload(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(RtcpPayload, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.rtcp_packets = []
        i = 0
        while not self._io.is_eof():
            _t_rtcp_packets = RtcpPayload.RtcpPacket(self._io, self, self._root)
            try:
                _t_rtcp_packets._read()
            finally:
                self.rtcp_packets.append(_t_rtcp_packets)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.rtcp_packets)):
            pass
            self.rtcp_packets[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(RtcpPayload, self)._write__seq(io)
        for i in range(len(self.rtcp_packets)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"rtcp_packets", 0, self._io.size() - self._io.pos())
            self.rtcp_packets[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"rtcp_packets", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.rtcp_packets)):
            pass
            if self.rtcp_packets[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"rtcp_packets", self._root, self.rtcp_packets[i]._root)
            if self.rtcp_packets[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"rtcp_packets", self, self.rtcp_packets[i]._parent)

        self._dirty = False

    class PacketStatusChunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.PacketStatusChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(RtcpPayload.PacketStatusChunk, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.t))
            if int(self.t) == 0:
                pass
                self._io.write_bits_int_be(2, self.s2)

            if int(self.t) == 1:
                pass
                self._io.write_bits_int_be(1, int(self.s1))

            if int(self.t) == 0:
                pass
                self._io.write_bits_int_be(13, self.rle)

            if int(self.t) == 1:
                pass
                self._io.write_bits_int_be(14, self.symbol_list)



        def _check(self):
            if int(self.t) == 0:
                pass

            if int(self.t) == 1:
                pass

            if int(self.t) == 0:
                pass

            if int(self.t) == 1:
                pass

            self._dirty = False

        @property
        def s(self):
            if hasattr(self, '_m_s'):
                return self._m_s

            self._m_s = (self.s2 if int(self.t) == 0 else (1 if int(self.s1) == 0 else 0))
            return getattr(self, '_m_s', None)

        def _invalidate_s(self):
            del self._m_s

    class PsfbAfbPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.PsfbAfbPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.uid = self._io.read_u4be()
            _on = self.uid
            if _on == 1380273474:
                pass
                self._raw_contents = self._io.read_bytes_full()
                _io__raw_contents = KaitaiStream(BytesIO(self._raw_contents))
                self.contents = RtcpPayload.PsfbAfbRembPacket(_io__raw_contents, self, self._root)
                self.contents._read()
            else:
                pass
                self.contents = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.uid
            if _on == 1380273474:
                pass
                self.contents._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(RtcpPayload.PsfbAfbPacket, self)._write__seq(io)
            self._io.write_u4be(self.uid)
            _on = self.uid
            if _on == 1380273474:
                pass
                _io__raw_contents = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                self._io.add_child_stream(_io__raw_contents)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                def handler(parent, _io__raw_contents=_io__raw_contents):
                    self._raw_contents = _io__raw_contents.to_byte_array()
                    parent.write_bytes(self._raw_contents)
                    if not parent.is_eof():
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", 0, parent.size() - parent.pos())
                _io__raw_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.contents._write__seq(_io__raw_contents)
            else:
                pass
                self._io.write_bytes(self.contents)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"contents", 0, self._io.size() - self._io.pos())


        def _check(self):
            _on = self.uid
            if _on == 1380273474:
                pass
                if self.contents._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"contents", self._root, self.contents._root)
                if self.contents._parent != self:
                    raise kaitaistruct.ConsistencyError(u"contents", self, self.contents._parent)
            else:
                pass
            self._dirty = False


    class PsfbAfbRembPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.PsfbAfbRembPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_ssrc = self._io.read_u1()
            self.br_exp = self._io.read_bits_int_be(6)
            self.br_mantissa = self._io.read_bits_int_be(18)
            self.ssrc_list = []
            for i in range(self.num_ssrc):
                self.ssrc_list.append(self._io.read_u4be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.ssrc_list)):
                pass



        def _write__seq(self, io=None):
            super(RtcpPayload.PsfbAfbRembPacket, self)._write__seq(io)
            self._io.write_u1(self.num_ssrc)
            self._io.write_bits_int_be(6, self.br_exp)
            self._io.write_bits_int_be(18, self.br_mantissa)
            for i in range(len(self.ssrc_list)):
                pass
                self._io.write_u4be(self.ssrc_list[i])



        def _check(self):
            if len(self.ssrc_list) != self.num_ssrc:
                raise kaitaistruct.ConsistencyError(u"ssrc_list", self.num_ssrc, len(self.ssrc_list))
            for i in range(len(self.ssrc_list)):
                pass

            self._dirty = False

        @property
        def max_total_bitrate(self):
            if hasattr(self, '_m_max_total_bitrate'):
                return self._m_max_total_bitrate

            self._m_max_total_bitrate = self.br_mantissa * (1 << self.br_exp)
            return getattr(self, '_m_max_total_bitrate', None)

        def _invalidate_max_total_bitrate(self):
            del self._m_max_total_bitrate

    class PsfbPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.PsfbPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.ssrc_media_source = self._io.read_u4be()
            _on = self.fmt
            if _on == RtcpPayload.PsfbSubtype.afb:
                pass
                self._raw_fci_block = self._io.read_bytes_full()
                _io__raw_fci_block = KaitaiStream(BytesIO(self._raw_fci_block))
                self.fci_block = RtcpPayload.PsfbAfbPacket(_io__raw_fci_block, self, self._root)
                self.fci_block._read()
            else:
                pass
                self.fci_block = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.fmt
            if _on == RtcpPayload.PsfbSubtype.afb:
                pass
                self.fci_block._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(RtcpPayload.PsfbPacket, self)._write__seq(io)
            self._io.write_u4be(self.ssrc)
            self._io.write_u4be(self.ssrc_media_source)
            _on = self.fmt
            if _on == RtcpPayload.PsfbSubtype.afb:
                pass
                _io__raw_fci_block = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                self._io.add_child_stream(_io__raw_fci_block)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                def handler(parent, _io__raw_fci_block=_io__raw_fci_block):
                    self._raw_fci_block = _io__raw_fci_block.to_byte_array()
                    parent.write_bytes(self._raw_fci_block)
                    if not parent.is_eof():
                        raise kaitaistruct.ConsistencyError(u"raw(fci_block)", 0, parent.size() - parent.pos())
                _io__raw_fci_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.fci_block._write__seq(_io__raw_fci_block)
            else:
                pass
                self._io.write_bytes(self.fci_block)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"fci_block", 0, self._io.size() - self._io.pos())


        def _check(self):
            _on = self.fmt
            if _on == RtcpPayload.PsfbSubtype.afb:
                pass
                if self.fci_block._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"fci_block", self._root, self.fci_block._root)
                if self.fci_block._parent != self:
                    raise kaitaistruct.ConsistencyError(u"fci_block", self, self.fci_block._parent)
            else:
                pass
            self._dirty = False

        @property
        def fmt(self):
            if hasattr(self, '_m_fmt'):
                return self._m_fmt

            self._m_fmt = KaitaiStream.resolve_enum(RtcpPayload.PsfbSubtype, self._parent.subtype)
            return getattr(self, '_m_fmt', None)

        def _invalidate_fmt(self):
            del self._m_fmt

    class ReportBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.ReportBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ssrc_source = self._io.read_u4be()
            self.lost_val = self._io.read_u1()
            self.highest_seq_num_received = self._io.read_u4be()
            self.interarrival_jitter = self._io.read_u4be()
            self.lsr = self._io.read_u4be()
            self.dlsr = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RtcpPayload.ReportBlock, self)._write__seq(io)
            self._io.write_u4be(self.ssrc_source)
            self._io.write_u1(self.lost_val)
            self._io.write_u4be(self.highest_seq_num_received)
            self._io.write_u4be(self.interarrival_jitter)
            self._io.write_u4be(self.lsr)
            self._io.write_u4be(self.dlsr)


        def _check(self):
            self._dirty = False

        @property
        def cumulative_packets_lost(self):
            if hasattr(self, '_m_cumulative_packets_lost'):
                return self._m_cumulative_packets_lost

            self._m_cumulative_packets_lost = self.lost_val & 16777215
            return getattr(self, '_m_cumulative_packets_lost', None)

        def _invalidate_cumulative_packets_lost(self):
            del self._m_cumulative_packets_lost
        @property
        def fraction_lost(self):
            if hasattr(self, '_m_fraction_lost'):
                return self._m_fraction_lost

            self._m_fraction_lost = self.lost_val >> 24
            return getattr(self, '_m_fraction_lost', None)

        def _invalidate_fraction_lost(self):
            del self._m_fraction_lost

    class RrPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.RrPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.report_block = []
            for i in range(self._parent.subtype):
                _t_report_block = RtcpPayload.ReportBlock(self._io, self, self._root)
                try:
                    _t_report_block._read()
                finally:
                    self.report_block.append(_t_report_block)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.report_block)):
                pass
                self.report_block[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RtcpPayload.RrPacket, self)._write__seq(io)
            self._io.write_u4be(self.ssrc)
            for i in range(len(self.report_block)):
                pass
                self.report_block[i]._write__seq(self._io)



        def _check(self):
            if len(self.report_block) != self._parent.subtype:
                raise kaitaistruct.ConsistencyError(u"report_block", self._parent.subtype, len(self.report_block))
            for i in range(len(self.report_block)):
                pass
                if self.report_block[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"report_block", self._root, self.report_block[i]._root)
                if self.report_block[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"report_block", self, self.report_block[i]._parent)

            self._dirty = False


    class RtcpPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.RtcpPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
                self.body._read()
            elif _on == RtcpPayload.PayloadType.rr:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.RrPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == RtcpPayload.PayloadType.rtpfb:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.RtpfbPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == RtcpPayload.PayloadType.sdes:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.SdesPacket(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == RtcpPayload.PayloadType.sr:
                pass
                self._raw_body = self._io.read_bytes(4 * self.length)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = RtcpPayload.SrPacket(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(4 * self.length)
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(RtcpPayload.RtcpPacket, self)._write__seq(io)
            self._io.write_bits_int_be(2, self.version)
            self._io.write_bits_int_be(1, int(self.padding))
            self._io.write_bits_int_be(5, self.subtype)
            self._io.write_u1(int(self.payload_type))
            self._io.write_u2be(self.length)
            _on = self.payload_type
            if _on == RtcpPayload.PayloadType.psfb:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(4 * self.length)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (4 * self.length))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != 4 * self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", 4 * self.length, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == RtcpPayload.PayloadType.rr:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(4 * self.length)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (4 * self.length))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != 4 * self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", 4 * self.length, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == RtcpPayload.PayloadType.rtpfb:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(4 * self.length)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (4 * self.length))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != 4 * self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", 4 * self.length, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == RtcpPayload.PayloadType.sdes:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(4 * self.length)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (4 * self.length))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != 4 * self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", 4 * self.length, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == RtcpPayload.PayloadType.sr:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(4 * self.length)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (4 * self.length))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != 4 * self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", 4 * self.length, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.payload_type
            if _on == RtcpPayload.PayloadType.psfb:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RtcpPayload.PayloadType.rr:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RtcpPayload.PayloadType.rtpfb:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RtcpPayload.PayloadType.sdes:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RtcpPayload.PayloadType.sr:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != 4 * self.length:
                    raise kaitaistruct.ConsistencyError(u"body", 4 * self.length, len(self.body))
            self._dirty = False


    class RtpfbPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.RtpfbPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.ssrc_media_source = self._io.read_u4be()
            _on = self.fmt
            if _on == RtcpPayload.RtpfbSubtype.transport_feedback:
                pass
                self._raw_fci_block = self._io.read_bytes_full()
                _io__raw_fci_block = KaitaiStream(BytesIO(self._raw_fci_block))
                self.fci_block = RtcpPayload.RtpfbTransportFeedbackPacket(_io__raw_fci_block, self, self._root)
                self.fci_block._read()
            else:
                pass
                self.fci_block = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.fmt
            if _on == RtcpPayload.RtpfbSubtype.transport_feedback:
                pass
                self.fci_block._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(RtcpPayload.RtpfbPacket, self)._write__seq(io)
            self._io.write_u4be(self.ssrc)
            self._io.write_u4be(self.ssrc_media_source)
            _on = self.fmt
            if _on == RtcpPayload.RtpfbSubtype.transport_feedback:
                pass
                _io__raw_fci_block = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
                self._io.add_child_stream(_io__raw_fci_block)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
                def handler(parent, _io__raw_fci_block=_io__raw_fci_block):
                    self._raw_fci_block = _io__raw_fci_block.to_byte_array()
                    parent.write_bytes(self._raw_fci_block)
                    if not parent.is_eof():
                        raise kaitaistruct.ConsistencyError(u"raw(fci_block)", 0, parent.size() - parent.pos())
                _io__raw_fci_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.fci_block._write__seq(_io__raw_fci_block)
            else:
                pass
                self._io.write_bytes(self.fci_block)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"fci_block", 0, self._io.size() - self._io.pos())


        def _check(self):
            _on = self.fmt
            if _on == RtcpPayload.RtpfbSubtype.transport_feedback:
                pass
                if self.fci_block._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"fci_block", self._root, self.fci_block._root)
                if self.fci_block._parent != self:
                    raise kaitaistruct.ConsistencyError(u"fci_block", self, self.fci_block._parent)
            else:
                pass
            self._dirty = False

        @property
        def fmt(self):
            if hasattr(self, '_m_fmt'):
                return self._m_fmt

            self._m_fmt = KaitaiStream.resolve_enum(RtcpPayload.RtpfbSubtype, self._parent.subtype)
            return getattr(self, '_m_fmt', None)

        def _invalidate_fmt(self):
            del self._m_fmt

    class RtpfbTransportFeedbackPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.RtpfbTransportFeedbackPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_packet_status = False
            self.packet_status__enabled = True
            self._should_write_recv_delta = False
            self.recv_delta__enabled = True

        def _read(self):
            self.base_sequence_number = self._io.read_u2be()
            self.packet_status_count = self._io.read_u2be()
            self.b4 = self._io.read_u4be()
            self.remaining = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.packet_status
            if hasattr(self, '_m_packet_status'):
                pass

            _ = self.recv_delta
            if hasattr(self, '_m_recv_delta'):
                pass



        def _write__seq(self, io=None):
            super(RtcpPayload.RtpfbTransportFeedbackPacket, self)._write__seq(io)
            self._should_write_packet_status = self.packet_status__enabled
            self._should_write_recv_delta = self.recv_delta__enabled
            self._io.write_u2be(self.base_sequence_number)
            self._io.write_u2be(self.packet_status_count)
            self._io.write_u4be(self.b4)
            self._io.write_bytes(self.remaining)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"remaining", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.packet_status__enabled:
                pass
                if len(self._m_packet_status) != 0:
                    raise kaitaistruct.ConsistencyError(u"packet_status", 0, len(self._m_packet_status))

            if self.recv_delta__enabled:
                pass
                if len(self._m_recv_delta) != 0:
                    raise kaitaistruct.ConsistencyError(u"recv_delta", 0, len(self._m_recv_delta))

            self._dirty = False

        @property
        def fb_pkt_count(self):
            if hasattr(self, '_m_fb_pkt_count'):
                return self._m_fb_pkt_count

            self._m_fb_pkt_count = self.b4 & 255
            return getattr(self, '_m_fb_pkt_count', None)

        def _invalidate_fb_pkt_count(self):
            del self._m_fb_pkt_count
        @property
        def packet_status(self):
            if self._should_write_packet_status:
                self._write_packet_status()
            if hasattr(self, '_m_packet_status'):
                return self._m_packet_status

            if not self.packet_status__enabled:
                return None

            self._m_packet_status = self._io.read_bytes(0)
            return getattr(self, '_m_packet_status', None)

        @packet_status.setter
        def packet_status(self, v):
            self._dirty = True
            self._m_packet_status = v

        def _write_packet_status(self):
            self._should_write_packet_status = False
            self._io.write_bytes(self._m_packet_status)

        @property
        def recv_delta(self):
            if self._should_write_recv_delta:
                self._write_recv_delta()
            if hasattr(self, '_m_recv_delta'):
                return self._m_recv_delta

            if not self.recv_delta__enabled:
                return None

            self._m_recv_delta = self._io.read_bytes(0)
            return getattr(self, '_m_recv_delta', None)

        @recv_delta.setter
        def recv_delta(self, v):
            self._dirty = True
            self._m_recv_delta = v

        def _write_recv_delta(self):
            self._should_write_recv_delta = False
            self._io.write_bytes(self._m_recv_delta)

        @property
        def reference_time(self):
            if hasattr(self, '_m_reference_time'):
                return self._m_reference_time

            self._m_reference_time = self.b4 >> 8
            return getattr(self, '_m_reference_time', None)

        def _invalidate_reference_time(self):
            del self._m_reference_time

    class SdesPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.SdesPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.source_chunk = []
            for i in range(self.source_count):
                _t_source_chunk = RtcpPayload.SourceChunk(self._io, self, self._root)
                try:
                    _t_source_chunk._read()
                finally:
                    self.source_chunk.append(_t_source_chunk)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.source_chunk)):
                pass
                self.source_chunk[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RtcpPayload.SdesPacket, self)._write__seq(io)
            for i in range(len(self.source_chunk)):
                pass
                self.source_chunk[i]._write__seq(self._io)



        def _check(self):
            if len(self.source_chunk) != self.source_count:
                raise kaitaistruct.ConsistencyError(u"source_chunk", self.source_count, len(self.source_chunk))
            for i in range(len(self.source_chunk)):
                pass
                if self.source_chunk[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"source_chunk", self._root, self.source_chunk[i]._root)
                if self.source_chunk[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"source_chunk", self, self.source_chunk[i]._parent)

            self._dirty = False

        @property
        def source_count(self):
            if hasattr(self, '_m_source_count'):
                return self._m_source_count

            self._m_source_count = self._parent.subtype
            return getattr(self, '_m_source_count', None)

        def _invalidate_source_count(self):
            del self._m_source_count

    class SdesTlv(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.SdesTlv, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = KaitaiStream.resolve_enum(RtcpPayload.SdesSubtype, self._io.read_u1())
            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                self.length = self._io.read_u1()

            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                self.value = self._io.read_bytes(self.length)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.type != RtcpPayload.SdesSubtype.pad:
                pass

            if self.type != RtcpPayload.SdesSubtype.pad:
                pass



        def _write__seq(self, io=None):
            super(RtcpPayload.SdesTlv, self)._write__seq(io)
            self._io.write_u1(int(self.type))
            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                self._io.write_u1(self.length)

            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                self._io.write_bytes(self.value)



        def _check(self):
            if self.type != RtcpPayload.SdesSubtype.pad:
                pass

            if self.type != RtcpPayload.SdesSubtype.pad:
                pass
                if len(self.value) != self.length:
                    raise kaitaistruct.ConsistencyError(u"value", self.length, len(self.value))

            self._dirty = False


    class SourceChunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.SourceChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.sdes_tlv = []
            i = 0
            while not self._io.is_eof():
                _t_sdes_tlv = RtcpPayload.SdesTlv(self._io, self, self._root)
                try:
                    _t_sdes_tlv._read()
                finally:
                    self.sdes_tlv.append(_t_sdes_tlv)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.sdes_tlv)):
                pass
                self.sdes_tlv[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RtcpPayload.SourceChunk, self)._write__seq(io)
            self._io.write_u4be(self.ssrc)
            for i in range(len(self.sdes_tlv)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"sdes_tlv", 0, self._io.size() - self._io.pos())
                self.sdes_tlv[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"sdes_tlv", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.sdes_tlv)):
                pass
                if self.sdes_tlv[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"sdes_tlv", self._root, self.sdes_tlv[i]._root)
                if self.sdes_tlv[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"sdes_tlv", self, self.sdes_tlv[i]._parent)

            self._dirty = False


    class SrPacket(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RtcpPayload.SrPacket, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ssrc = self._io.read_u4be()
            self.ntp_msw = self._io.read_u4be()
            self.ntp_lsw = self._io.read_u4be()
            self.rtp_timestamp = self._io.read_u4be()
            self.sender_packet_count = self._io.read_u4be()
            self.sender_octet_count = self._io.read_u4be()
            self.report_block = []
            for i in range(self._parent.subtype):
                _t_report_block = RtcpPayload.ReportBlock(self._io, self, self._root)
                try:
                    _t_report_block._read()
                finally:
                    self.report_block.append(_t_report_block)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.report_block)):
                pass
                self.report_block[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RtcpPayload.SrPacket, self)._write__seq(io)
            self._io.write_u4be(self.ssrc)
            self._io.write_u4be(self.ntp_msw)
            self._io.write_u4be(self.ntp_lsw)
            self._io.write_u4be(self.rtp_timestamp)
            self._io.write_u4be(self.sender_packet_count)
            self._io.write_u4be(self.sender_octet_count)
            for i in range(len(self.report_block)):
                pass
                self.report_block[i]._write__seq(self._io)



        def _check(self):
            if len(self.report_block) != self._parent.subtype:
                raise kaitaistruct.ConsistencyError(u"report_block", self._parent.subtype, len(self.report_block))
            for i in range(len(self.report_block)):
                pass
                if self.report_block[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"report_block", self._root, self.report_block[i]._root)
                if self.report_block[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"report_block", self, self.report_block[i]._parent)

            self._dirty = False

        @property
        def ntp(self):
            if hasattr(self, '_m_ntp'):
                return self._m_ntp

            self._m_ntp = self.ntp_msw << 32 & self.ntp_lsw
            return getattr(self, '_m_ntp', None)

        def _invalidate_ntp(self):
            del self._m_ntp


