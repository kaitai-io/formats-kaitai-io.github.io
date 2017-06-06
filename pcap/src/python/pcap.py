# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

from ethernet_frame import EthernetFrame
class Pcap(KaitaiStruct):

    class Linktype(Enum):
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

    class PfhType(Enum):
        radio_802_11_common = 2
        radio_802_11n_mac_ext = 3
        radio_802_11n_mac_phy_ext = 4
        spectrum_map = 5
        process_info = 6
        capture_info = 7
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.hdr = self._root.Header(self._io, self, self._root)
        self.packets = []
        while not self._io.is_eof():
            self.packets.append(self._root.Packet(self._io, self, self._root))


    class PacketPpi(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.PacketPpiHeader(self._io, self, self._root)
            self.fields = []
            while not self._io.is_eof():
                self.fields.append(self._root.PacketPpiField(self._io, self, self._root))



    class PacketPpiHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.pph_version = self._io.read_u1()
            self.pph_flags = self._io.read_u1()
            self.pph_len = self._io.read_u2le()
            self.pph_dlt = self._io.read_u4le()


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic_number = self._io.ensure_fixed_contents(struct.pack('4b', -44, -61, -78, -95))
            self.version_major = self._io.read_u2le()
            self.version_minor = self._io.read_u2le()
            self.thiszone = self._io.read_s4le()
            self.sigfigs = self._io.read_u4le()
            self.snaplen = self._io.read_u4le()
            self.network = self._root.Linktype(self._io.read_u4le())


    class Radio80211CommonBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

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


    class PacketPpiField(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.pfh_type = self._io.read_u2le()
            self.pfh_datalen = self._io.read_u2le()
            self.body = self._io.read_bytes(self.pfh_datalen)


    class Packet(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.ts_sec = self._io.read_u4le()
            self.ts_usec = self._io.read_u4le()
            self.incl_len = self._io.read_u4le()
            self.orig_len = self._io.read_u4le()
            _on = self._root.hdr.network
            if _on == self._root.Linktype.ppi:
                self._raw_body = self._io.read_bytes(self.incl_len)
                io = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.PacketPpi(io, self, self._root)
            elif _on == self._root.Linktype.ethernet:
                self._raw_body = self._io.read_bytes(self.incl_len)
                io = KaitaiStream(BytesIO(self._raw_body))
                self.body = EthernetFrame(io)
            else:
                self.body = self._io.read_bytes(self.incl_len)



