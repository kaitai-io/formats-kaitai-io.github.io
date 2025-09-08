# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import ethernet_frame
import packet_ppi
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Pcap(ReadWriteKaitaiStruct):
    """PCAP (named after libpcap / winpcap) is a popular format for saving
    network traffic grabbed by network sniffers. It is typically
    produced by tools like [tcpdump](https://www.tcpdump.org/) or
    [Wireshark](https://www.wireshark.org/).
    
    .. seealso::
       Source - https://wiki.wireshark.org/Development/LibpcapFileFormat
    """

    class Linktype(IntEnum):
        null_linktype = 0
        ethernet = 1
        exp_ethernet = 2
        ax25 = 3
        pronet = 4
        chaos = 5
        ieee802_5 = 6
        arcnet_bsd = 7
        slip = 8
        ppp = 9
        fddi = 10
        redback_smartedge = 32
        ppp_hdlc = 50
        ppp_ether = 51
        symantec_firewall = 99
        atm_rfc1483 = 100
        raw = 101
        c_hdlc = 104
        ieee802_11 = 105
        atm_clip = 106
        frelay = 107
        loop = 108
        enc = 109
        netbsd_hdlc = 112
        linux_sll = 113
        ltalk = 114
        econet = 115
        ipfilter = 116
        pflog = 117
        cisco_ios = 118
        ieee802_11_prism = 119
        aironet_header = 120
        ip_over_fc = 122
        sunatm = 123
        rio = 124
        pci_exp = 125
        aurora = 126
        ieee802_11_radiotap = 127
        tzsp = 128
        arcnet_linux = 129
        juniper_mlppp = 130
        juniper_mlfr = 131
        juniper_es = 132
        juniper_ggsn = 133
        juniper_mfr = 134
        juniper_atm2 = 135
        juniper_services = 136
        juniper_atm1 = 137
        apple_ip_over_ieee1394 = 138
        mtp2_with_phdr = 139
        mtp2 = 140
        mtp3 = 141
        sccp = 142
        docsis = 143
        linux_irda = 144
        ibm_sp = 145
        ibm_sn = 146
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
        juniper_monitor = 164
        bacnet_ms_tp = 165
        ppp_pppd = 166
        juniper_pppoe = 167
        juniper_pppoe_atm = 168
        gprs_llc = 169
        gpf_t = 170
        gpf_f = 171
        gcom_t1e1 = 172
        gcom_serial = 173
        juniper_pic_peer = 174
        erf_eth = 175
        erf_pos = 176
        linux_lapd = 177
        juniper_ether = 178
        juniper_ppp = 179
        juniper_frelay = 180
        juniper_chdlc = 181
        mfr = 182
        juniper_vp = 183
        a429 = 184
        a653_icm = 185
        usb_freebsd = 186
        bluetooth_hci_h4 = 187
        ieee802_16_mac_cps = 188
        usb_linux = 189
        can20b = 190
        ieee802_15_4_linux = 191
        ppi = 192
        ieee802_16_mac_cps_radio = 193
        juniper_ism = 194
        ieee802_15_4_withfcs = 195
        sita = 196
        erf = 197
        raif1 = 198
        ipmb_kontron = 199
        juniper_st = 200
        bluetooth_hci_h4_with_phdr = 201
        ax25_kiss = 202
        lapd = 203
        ppp_with_dir = 204
        c_hdlc_with_dir = 205
        frelay_with_dir = 206
        lapb_with_dir = 207
        ipmb_linux = 209
        flexray = 210
        most = 211
        lin = 212
        x2e_serial = 213
        x2e_xoraya = 214
        ieee802_15_4_nonask_phy = 215
        linux_evdev = 216
        gsmtap_um = 217
        gsmtap_abis = 218
        mpls = 219
        usb_linux_mmapped = 220
        dect = 221
        aos = 222
        wihart = 223
        fc_2 = 224
        fc_2_with_frame_delims = 225
        ipnet = 226
        can_socketcan = 227
        ipv4 = 228
        ipv6 = 229
        ieee802_15_4_nofcs = 230
        dbus = 231
        juniper_vs = 232
        juniper_srx_e2e = 233
        juniper_fibrechannel = 234
        dvb_ci = 235
        mux27010 = 236
        stanag_5066_d_pdu = 237
        juniper_atm_cemic = 238
        nflog = 239
        netanalyzer = 240
        netanalyzer_transparent = 241
        ipoib = 242
        mpeg_2_ts = 243
        ng40 = 244
        nfc_llcp = 245
        pfsync = 246
        infiniband = 247
        sctp = 248
        usbpcap = 249
        rtac_serial = 250
        bluetooth_le_ll = 251
        wireshark_upper_pdu = 252
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
        rds = 265
        usb_darwin = 266
        openflow = 267
        sdlc = 268
        ti_lln_sniffer = 269
        loratap = 270
        vsock = 271
        nordic_ble = 272
        docsis31_xra31 = 273
        ethernet_mpacket = 274
        displayport_aux = 275
        linux_sll2 = 276
        sercos_monitor = 277
        openvizsla = 278
        ebhscr = 279
        vpp_dispatch = 280
        dsa_tag_brcm = 281
        dsa_tag_brcm_prepend = 282
        ieee802_15_4_tap = 283
        dsa_tag_dsa = 284
        dsa_tag_edsa = 285
        elee = 286
        zwave_serial = 287
        usb_2_0 = 288
        atsc_alp = 289
        etw = 290
        netanalyzer_ng = 291
        zboss_ncp = 292
        usb_2_0_low_speed = 293
        usb_2_0_full_speed = 294
        usb_2_0_high_speed = 295
        auerswald_log = 296
        zwave_tap = 297
        silabs_debug_channel = 298
        fira_uci = 299
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Pcap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.hdr = Pcap.Header(self._io, self, self._root)
        self.hdr._read()
        self.packets = []
        i = 0
        while not self._io.is_eof():
            _t_packets = Pcap.Packet(self._io, self, self._root)
            try:
                _t_packets._read()
            finally:
                self.packets.append(_t_packets)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        for i in range(len(self.packets)):
            pass
            self.packets[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Pcap, self)._write__seq(io)
        self.hdr._write__seq(self._io)
        for i in range(len(self.packets)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"packets", 0, self._io.size() - self._io.pos())
            self.packets[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"packets", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"hdr", self._root, self.hdr._root)
        if self.hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"hdr", self, self.hdr._parent)
        for i in range(len(self.packets)):
            pass
            if self.packets[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"packets", self._root, self.packets[i]._root)
            if self.packets[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"packets", self, self.packets[i]._parent)

        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pcap.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic_number = self._io.read_bytes(4)
            if not self.magic_number == b"\xD4\xC3\xB2\xA1":
                raise kaitaistruct.ValidationNotEqualError(b"\xD4\xC3\xB2\xA1", self.magic_number, self._io, u"/types/header/seq/0")
            self.version_major = self._io.read_u2le()
            if not self.version_major == 2:
                raise kaitaistruct.ValidationNotEqualError(2, self.version_major, self._io, u"/types/header/seq/1")
            self.version_minor = self._io.read_u2le()
            self.thiszone = self._io.read_s4le()
            self.sigfigs = self._io.read_u4le()
            self.snaplen = self._io.read_u4le()
            self.network = KaitaiStream.resolve_enum(Pcap.Linktype, self._io.read_u4le())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Pcap.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic_number)
            self._io.write_u2le(self.version_major)
            self._io.write_u2le(self.version_minor)
            self._io.write_s4le(self.thiszone)
            self._io.write_u4le(self.sigfigs)
            self._io.write_u4le(self.snaplen)
            self._io.write_u4le(int(self.network))


        def _check(self):
            if len(self.magic_number) != 4:
                raise kaitaistruct.ConsistencyError(u"magic_number", 4, len(self.magic_number))
            if not self.magic_number == b"\xD4\xC3\xB2\xA1":
                raise kaitaistruct.ValidationNotEqualError(b"\xD4\xC3\xB2\xA1", self.magic_number, None, u"/types/header/seq/0")
            if not self.version_major == 2:
                raise kaitaistruct.ValidationNotEqualError(2, self.version_major, None, u"/types/header/seq/1")
            self._dirty = False


    class Packet(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pcap.Packet, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ts_sec = self._io.read_u4le()
            self.ts_usec = self._io.read_u4le()
            self.incl_len = self._io.read_u4le()
            self.orig_len = self._io.read_u4le()
            _on = self._root.hdr.network
            if _on == Pcap.Linktype.ethernet:
                pass
                self._raw_body = self._io.read_bytes((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen))
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = ethernet_frame.EthernetFrame(_io__raw_body)
                self.body._read()
            elif _on == Pcap.Linktype.ppi:
                pass
                self._raw_body = self._io.read_bytes((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen))
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = packet_ppi.PacketPpi(_io__raw_body)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen))
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self._root.hdr.network
            if _on == Pcap.Linktype.ethernet:
                pass
                self.body._fetch_instances()
            elif _on == Pcap.Linktype.ppi:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Pcap.Packet, self)._write__seq(io)
            self._io.write_u4le(self.ts_sec)
            self._io.write_u4le(self.ts_usec)
            self._io.write_u4le(self.incl_len)
            self._io.write_u4le(self.orig_len)
            _on = self._root.hdr.network
            if _on == Pcap.Linktype.ethernet:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen))))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen)))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != (self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen):
                        raise kaitaistruct.ConsistencyError(u"raw(body)", (self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen), len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Pcap.Linktype.ppi:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen))))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen)))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != (self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen):
                        raise kaitaistruct.ConsistencyError(u"raw(body)", (self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen), len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self._root.hdr.network
            if _on == Pcap.Linktype.ethernet:
                pass
            elif _on == Pcap.Linktype.ppi:
                pass
            else:
                pass
                if len(self.body) != (self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen):
                    raise kaitaistruct.ConsistencyError(u"body", (self.incl_len if self.incl_len < self._root.hdr.snaplen else self._root.hdr.snaplen), len(self.body))
            self._dirty = False



