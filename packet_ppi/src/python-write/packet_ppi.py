# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import ethernet_frame
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PacketPpi(ReadWriteKaitaiStruct):
    """PPI is a standard for link layer packet encapsulation, proposed as
    generic extensible container to store both captured in-band data and
    out-of-band data. Originally it was developed to provide 802.11n
    radio information, but can be used for other purposes as well.
    
    Sample capture:
    <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
    
    .. seealso::
       PPI header format spec, section 3 - https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf
    """

    class Linktype(IntEnum):
        null_linktype = 0
        ethernet = 1
        ax25 = 3
        ieee802_5 = 6
        arcnet_bsd = 7
        slip = 8
        ppp = 9
        fddi = 10
        ppp_hdlc = 50
        ppp_ether = 51
        atm_rfc1483 = 100
        raw = 101
        c_hdlc = 104
        ieee802_11 = 105
        frelay = 107
        loop = 108
        linux_sll = 113
        ltalk = 114
        pflog = 117
        ieee802_11_prism = 119
        ip_over_fc = 122
        sunatm = 123
        ieee802_11_radiotap = 127
        arcnet_linux = 129
        apple_ip_over_ieee1394 = 138
        mtp2_with_phdr = 139
        mtp2 = 140
        mtp3 = 141
        sccp = 142
        docsis = 143
        linux_irda = 144
        user0 = 147
        user1 = 148
        user2 = 149
        user3 = 150
        user4 = 151
        user5 = 152
        user6 = 153
        user7 = 154
        user8 = 155
        user9 = 156
        user10 = 157
        user11 = 158
        user12 = 159
        user13 = 160
        user14 = 161
        user15 = 162
        ieee802_11_avs = 163
        bacnet_ms_tp = 165
        ppp_pppd = 166
        gprs_llc = 169
        gpf_t = 170
        gpf_f = 171
        linux_lapd = 177
        bluetooth_hci_h4 = 187
        usb_linux = 189
        ppi = 192
        ieee802_15_4 = 195
        sita = 196
        erf = 197
        bluetooth_hci_h4_with_phdr = 201
        ax25_kiss = 202
        lapd = 203
        ppp_with_dir = 204
        c_hdlc_with_dir = 205
        frelay_with_dir = 206
        ipmb_linux = 209
        ieee802_15_4_nonask_phy = 215
        usb_linux_mmapped = 220
        fc_2 = 224
        fc_2_with_frame_delims = 225
        ipnet = 226
        can_socketcan = 227
        ipv4 = 228
        ipv6 = 229
        ieee802_15_4_nofcs = 230
        dbus = 231
        dvb_ci = 235
        mux27010 = 236
        stanag_5066_d_pdu = 237
        nflog = 239
        netanalyzer = 240
        netanalyzer_transparent = 241
        ipoib = 242
        mpeg_2_ts = 243
        ng40 = 244
        nfc_llcp = 245
        infiniband = 247
        sctp = 248
        usbpcap = 249
        rtac_serial = 250
        bluetooth_le_ll = 251
        netlink = 253
        bluetooth_linux_monitor = 254
        bluetooth_bredr_bb = 255
        bluetooth_le_ll_with_phdr = 256
        profibus_dl = 257
        pktap = 258
        epon = 259
        ipmi_hpm_2 = 260
        zwave_r1_r2 = 261
        zwave_r3 = 262
        wattstopper_dlm = 263
        iso_14443 = 264

    class PfhType(IntEnum):
        radio_802_11_common = 2
        radio_802_11n_mac_ext = 3
        radio_802_11n_mac_phy_ext = 4
        spectrum_map = 5
        process_info = 6
        capture_info = 7
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PacketPpi, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = PacketPpi.PacketPpiHeader(self._io, self, self._root)
        self.header._read()
        self._raw_fields = self._io.read_bytes(self.header.pph_len - 8)
        _io__raw_fields = KaitaiStream(BytesIO(self._raw_fields))
        self.fields = PacketPpi.PacketPpiFields(_io__raw_fields, self, self._root)
        self.fields._read()
        _on = self.header.pph_dlt
        if _on == PacketPpi.Linktype.ethernet:
            pass
            self._raw_body = self._io.read_bytes_full()
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = ethernet_frame.EthernetFrame(_io__raw_body)
            self.body._read()
        elif _on == PacketPpi.Linktype.ppi:
            pass
            self._raw_body = self._io.read_bytes_full()
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = PacketPpi(_io__raw_body, self, self._root)
            self.body._read()
        else:
            pass
            self.body = self._io.read_bytes_full()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        self.fields._fetch_instances()
        _on = self.header.pph_dlt
        if _on == PacketPpi.Linktype.ethernet:
            pass
            self.body._fetch_instances()
        elif _on == PacketPpi.Linktype.ppi:
            pass
            self.body._fetch_instances()
        else:
            pass


    def _write__seq(self, io=None):
        super(PacketPpi, self)._write__seq(io)
        self.header._write__seq(self._io)
        _io__raw_fields = KaitaiStream(BytesIO(bytearray(self.header.pph_len - 8)))
        self._io.add_child_stream(_io__raw_fields)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header.pph_len - 8))
        def handler(parent, _io__raw_fields=_io__raw_fields):
            self._raw_fields = _io__raw_fields.to_byte_array()
            if len(self._raw_fields) != self.header.pph_len - 8:
                raise kaitaistruct.ConsistencyError(u"raw(fields)", self.header.pph_len - 8, len(self._raw_fields))
            parent.write_bytes(self._raw_fields)
        _io__raw_fields.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.fields._write__seq(_io__raw_fields)
        _on = self.header.pph_dlt
        if _on == PacketPpi.Linktype.ethernet:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                parent.write_bytes(self._raw_body)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(body)", 0, parent.size() - parent.pos())
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == PacketPpi.Linktype.ppi:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                parent.write_bytes(self._raw_body)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(body)", 0, parent.size() - parent.pos())
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        else:
            pass
            self._io.write_bytes(self.body)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"body", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.fields._root != self._root:
            raise kaitaistruct.ConsistencyError(u"fields", self._root, self.fields._root)
        if self.fields._parent != self:
            raise kaitaistruct.ConsistencyError(u"fields", self, self.fields._parent)
        _on = self.header.pph_dlt
        if _on == PacketPpi.Linktype.ethernet:
            pass
        elif _on == PacketPpi.Linktype.ppi:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        else:
            pass
        self._dirty = False

    class MacFlags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.MacFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.unused1 = self._io.read_bits_int_be(1) != 0
            self.aggregate_delimiter = self._io.read_bits_int_be(1) != 0
            self.more_aggregates = self._io.read_bits_int_be(1) != 0
            self.aggregate = self._io.read_bits_int_be(1) != 0
            self.dup_rx = self._io.read_bits_int_be(1) != 0
            self.rx_short_guard = self._io.read_bits_int_be(1) != 0
            self.is_ht_40 = self._io.read_bits_int_be(1) != 0
            self.greenfield = self._io.read_bits_int_be(1) != 0
            self.unused2 = self._io.read_bytes(3)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PacketPpi.MacFlags, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.unused1))
            self._io.write_bits_int_be(1, int(self.aggregate_delimiter))
            self._io.write_bits_int_be(1, int(self.more_aggregates))
            self._io.write_bits_int_be(1, int(self.aggregate))
            self._io.write_bits_int_be(1, int(self.dup_rx))
            self._io.write_bits_int_be(1, int(self.rx_short_guard))
            self._io.write_bits_int_be(1, int(self.is_ht_40))
            self._io.write_bits_int_be(1, int(self.greenfield))
            self._io.write_bytes(self.unused2)


        def _check(self):
            if len(self.unused2) != 3:
                raise kaitaistruct.ConsistencyError(u"unused2", 3, len(self.unused2))
            self._dirty = False


    class PacketPpiField(ReadWriteKaitaiStruct):
        """
        .. seealso::
           PPI header format spec, section 3.1 - https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.PacketPpiField, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.pfh_type = KaitaiStream.resolve_enum(PacketPpi.PfhType, self._io.read_u2le())
            self.pfh_datalen = self._io.read_u2le()
            _on = self.pfh_type
            if _on == PacketPpi.PfhType.radio_802_11_common:
                pass
                self._raw_body = self._io.read_bytes(self.pfh_datalen)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = PacketPpi.Radio80211CommonBody(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_ext:
                pass
                self._raw_body = self._io.read_bytes(self.pfh_datalen)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = PacketPpi.Radio80211nMacExtBody(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_phy_ext:
                pass
                self._raw_body = self._io.read_bytes(self.pfh_datalen)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = PacketPpi.Radio80211nMacPhyExtBody(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.pfh_datalen)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.pfh_type
            if _on == PacketPpi.PfhType.radio_802_11_common:
                pass
                self.body._fetch_instances()
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_ext:
                pass
                self.body._fetch_instances()
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_phy_ext:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(PacketPpi.PacketPpiField, self)._write__seq(io)
            self._io.write_u2le(int(self.pfh_type))
            self._io.write_u2le(self.pfh_datalen)
            _on = self.pfh_type
            if _on == PacketPpi.PfhType.radio_802_11_common:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.pfh_datalen)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.pfh_datalen))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.pfh_datalen:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.pfh_datalen, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_ext:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.pfh_datalen)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.pfh_datalen))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.pfh_datalen:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.pfh_datalen, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_phy_ext:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.pfh_datalen)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.pfh_datalen))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.pfh_datalen:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.pfh_datalen, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.pfh_type
            if _on == PacketPpi.PfhType.radio_802_11_common:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_ext:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == PacketPpi.PfhType.radio_802_11n_mac_phy_ext:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.pfh_datalen:
                    raise kaitaistruct.ConsistencyError(u"body", self.pfh_datalen, len(self.body))
            self._dirty = False


    class PacketPpiFields(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.PacketPpiFields, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = PacketPpi.PacketPpiField(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(PacketPpi.PacketPpiFields, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class PacketPpiHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           PPI header format spec, section 3.1 - https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.PacketPpiHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.pph_version = self._io.read_u1()
            self.pph_flags = self._io.read_u1()
            self.pph_len = self._io.read_u2le()
            self.pph_dlt = KaitaiStream.resolve_enum(PacketPpi.Linktype, self._io.read_u4le())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PacketPpi.PacketPpiHeader, self)._write__seq(io)
            self._io.write_u1(self.pph_version)
            self._io.write_u1(self.pph_flags)
            self._io.write_u2le(self.pph_len)
            self._io.write_u4le(int(self.pph_dlt))


        def _check(self):
            self._dirty = False


    class Radio80211CommonBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           PPI header format spec, section 4.1.2 - https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.Radio80211CommonBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.tsf_timer = self._io.read_u8le()
            self.flags = self._io.read_u2le()
            self.rate = self._io.read_u2le()
            self.channel_freq = self._io.read_u2le()
            self.channel_flags = self._io.read_u2le()
            self.fhss_hopset = self._io.read_u1()
            self.fhss_pattern = self._io.read_u1()
            self.dbm_antsignal = self._io.read_s1()
            self.dbm_antnoise = self._io.read_s1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PacketPpi.Radio80211CommonBody, self)._write__seq(io)
            self._io.write_u8le(self.tsf_timer)
            self._io.write_u2le(self.flags)
            self._io.write_u2le(self.rate)
            self._io.write_u2le(self.channel_freq)
            self._io.write_u2le(self.channel_flags)
            self._io.write_u1(self.fhss_hopset)
            self._io.write_u1(self.fhss_pattern)
            self._io.write_s1(self.dbm_antsignal)
            self._io.write_s1(self.dbm_antnoise)


        def _check(self):
            self._dirty = False


    class Radio80211nMacExtBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           PPI header format spec, section 4.1.3 - https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.Radio80211nMacExtBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = PacketPpi.MacFlags(self._io, self, self._root)
            self.flags._read()
            self.a_mpdu_id = self._io.read_u4le()
            self.num_delimiters = self._io.read_u1()
            self.reserved = self._io.read_bytes(3)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()


        def _write__seq(self, io=None):
            super(PacketPpi.Radio80211nMacExtBody, self)._write__seq(io)
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.a_mpdu_id)
            self._io.write_u1(self.num_delimiters)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.reserved) != 3:
                raise kaitaistruct.ConsistencyError(u"reserved", 3, len(self.reserved))
            self._dirty = False


    class Radio80211nMacPhyExtBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           PPI header format spec, section 4.1.4 - https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PacketPpi.Radio80211nMacPhyExtBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = PacketPpi.MacFlags(self._io, self, self._root)
            self.flags._read()
            self.a_mpdu_id = self._io.read_u4le()
            self.num_delimiters = self._io.read_u1()
            self.mcs = self._io.read_u1()
            self.num_streams = self._io.read_u1()
            self.rssi_combined = self._io.read_u1()
            self.rssi_ant_ctl = []
            for i in range(4):
                self.rssi_ant_ctl.append(self._io.read_u1())

            self.rssi_ant_ext = []
            for i in range(4):
                self.rssi_ant_ext.append(self._io.read_u1())

            self.ext_channel_freq = self._io.read_u2le()
            self.ext_channel_flags = PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags(self._io, self, self._root)
            self.ext_channel_flags._read()
            self.rf_signal_noise = []
            for i in range(4):
                _t_rf_signal_noise = PacketPpi.Radio80211nMacPhyExtBody.SignalNoise(self._io, self, self._root)
                try:
                    _t_rf_signal_noise._read()
                finally:
                    self.rf_signal_noise.append(_t_rf_signal_noise)

            self.evm = []
            for i in range(4):
                self.evm.append(self._io.read_u4le())

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            for i in range(len(self.rssi_ant_ctl)):
                pass

            for i in range(len(self.rssi_ant_ext)):
                pass

            self.ext_channel_flags._fetch_instances()
            for i in range(len(self.rf_signal_noise)):
                pass
                self.rf_signal_noise[i]._fetch_instances()

            for i in range(len(self.evm)):
                pass



        def _write__seq(self, io=None):
            super(PacketPpi.Radio80211nMacPhyExtBody, self)._write__seq(io)
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.a_mpdu_id)
            self._io.write_u1(self.num_delimiters)
            self._io.write_u1(self.mcs)
            self._io.write_u1(self.num_streams)
            self._io.write_u1(self.rssi_combined)
            for i in range(len(self.rssi_ant_ctl)):
                pass
                self._io.write_u1(self.rssi_ant_ctl[i])

            for i in range(len(self.rssi_ant_ext)):
                pass
                self._io.write_u1(self.rssi_ant_ext[i])

            self._io.write_u2le(self.ext_channel_freq)
            self.ext_channel_flags._write__seq(self._io)
            for i in range(len(self.rf_signal_noise)):
                pass
                self.rf_signal_noise[i]._write__seq(self._io)

            for i in range(len(self.evm)):
                pass
                self._io.write_u4le(self.evm[i])



        def _check(self):
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.rssi_ant_ctl) != 4:
                raise kaitaistruct.ConsistencyError(u"rssi_ant_ctl", 4, len(self.rssi_ant_ctl))
            for i in range(len(self.rssi_ant_ctl)):
                pass

            if len(self.rssi_ant_ext) != 4:
                raise kaitaistruct.ConsistencyError(u"rssi_ant_ext", 4, len(self.rssi_ant_ext))
            for i in range(len(self.rssi_ant_ext)):
                pass

            if self.ext_channel_flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"ext_channel_flags", self._root, self.ext_channel_flags._root)
            if self.ext_channel_flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"ext_channel_flags", self, self.ext_channel_flags._parent)
            if len(self.rf_signal_noise) != 4:
                raise kaitaistruct.ConsistencyError(u"rf_signal_noise", 4, len(self.rf_signal_noise))
            for i in range(len(self.rf_signal_noise)):
                pass
                if self.rf_signal_noise[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"rf_signal_noise", self._root, self.rf_signal_noise[i]._root)
                if self.rf_signal_noise[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"rf_signal_noise", self, self.rf_signal_noise[i]._parent)

            if len(self.evm) != 4:
                raise kaitaistruct.ConsistencyError(u"evm", 4, len(self.evm))
            for i in range(len(self.evm)):
                pass

            self._dirty = False

        class ChannelFlags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.spectrum_2ghz = self._io.read_bits_int_be(1) != 0
                self.ofdm = self._io.read_bits_int_be(1) != 0
                self.cck = self._io.read_bits_int_be(1) != 0
                self.turbo = self._io.read_bits_int_be(1) != 0
                self.unused = self._io.read_bits_int_be(8)
                self.gfsk = self._io.read_bits_int_be(1) != 0
                self.dyn_cck_ofdm = self._io.read_bits_int_be(1) != 0
                self.only_passive_scan = self._io.read_bits_int_be(1) != 0
                self.spectrum_5ghz = self._io.read_bits_int_be(1) != 0
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PacketPpi.Radio80211nMacPhyExtBody.ChannelFlags, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.spectrum_2ghz))
                self._io.write_bits_int_be(1, int(self.ofdm))
                self._io.write_bits_int_be(1, int(self.cck))
                self._io.write_bits_int_be(1, int(self.turbo))
                self._io.write_bits_int_be(8, self.unused)
                self._io.write_bits_int_be(1, int(self.gfsk))
                self._io.write_bits_int_be(1, int(self.dyn_cck_ofdm))
                self._io.write_bits_int_be(1, int(self.only_passive_scan))
                self._io.write_bits_int_be(1, int(self.spectrum_5ghz))


            def _check(self):
                self._dirty = False


        class SignalNoise(ReadWriteKaitaiStruct):
            """RF signal + noise pair at a single antenna."""
            def __init__(self, _io=None, _parent=None, _root=None):
                super(PacketPpi.Radio80211nMacPhyExtBody.SignalNoise, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.signal = self._io.read_s1()
                self.noise = self._io.read_s1()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(PacketPpi.Radio80211nMacPhyExtBody.SignalNoise, self)._write__seq(io)
                self._io.write_s1(self.signal)
                self._io.write_s1(self.noise)


            def _check(self):
                self._dirty = False




