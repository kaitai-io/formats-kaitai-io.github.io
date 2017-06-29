// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture: https://wiki.wireshark.org/SampleCaptures?action=AttachFile&do=get&target=Http.cap  
 * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3</a>
 */
public class PacketPpi extends KaitaiStruct {
    public static PacketPpi fromFile(String fileName) throws IOException {
        return new PacketPpi(new KaitaiStream(fileName));
    }

    public enum PfhType {
        RADIO_802_11_COMMON(2),
        RADIO_802_11N_MAC_EXT(3),
        RADIO_802_11N_MAC_PHY_EXT(4),
        SPECTRUM_MAP(5),
        PROCESS_INFO(6),
        CAPTURE_INFO(7);

        private final long id;
        PfhType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PfhType> byId = new HashMap<Long, PfhType>(6);
        static {
            for (PfhType e : PfhType.values())
                byId.put(e.id(), e);
        }
        public static PfhType byId(long id) { return byId.get(id); }
    }

    public enum Linktype {
        NULL_LINKTYPE(0),
        ETHERNET(1),
        AX25(3),
        IEEE802_5(6),
        ARCNET_BSD(7),
        SLIP(8),
        PPP(9),
        FDDI(10),
        PPP_HDLC(50),
        PPP_ETHER(51),
        ATM_RFC1483(100),
        RAW(101),
        C_HDLC(104),
        IEEE802_11(105),
        FRELAY(107),
        LOOP(108),
        LINUX_SLL(113),
        LTALK(114),
        PFLOG(117),
        IEEE802_11_PRISM(119),
        IP_OVER_FC(122),
        SUNATM(123),
        IEEE802_11_RADIOTAP(127),
        ARCNET_LINUX(129),
        APPLE_IP_OVER_IEEE1394(138),
        MTP2_WITH_PHDR(139),
        MTP2(140),
        MTP3(141),
        SCCP(142),
        DOCSIS(143),
        LINUX_IRDA(144),
        USER0(147),
        USER1(148),
        USER2(149),
        USER3(150),
        USER4(151),
        USER5(152),
        USER6(153),
        USER7(154),
        USER8(155),
        USER9(156),
        USER10(157),
        USER11(158),
        USER12(159),
        USER13(160),
        USER14(161),
        USER15(162),
        IEEE802_11_AVS(163),
        BACNET_MS_TP(165),
        PPP_PPPD(166),
        GPRS_LLC(169),
        GPF_T(170),
        GPF_F(171),
        LINUX_LAPD(177),
        BLUETOOTH_HCI_H4(187),
        USB_LINUX(189),
        PPI(192),
        IEEE802_15_4(195),
        SITA(196),
        ERF(197),
        BLUETOOTH_HCI_H4_WITH_PHDR(201),
        AX25_KISS(202),
        LAPD(203),
        PPP_WITH_DIR(204),
        C_HDLC_WITH_DIR(205),
        FRELAY_WITH_DIR(206),
        IPMB_LINUX(209),
        IEEE802_15_4_NONASK_PHY(215),
        USB_LINUX_MMAPPED(220),
        FC_2(224),
        FC_2_WITH_FRAME_DELIMS(225),
        IPNET(226),
        CAN_SOCKETCAN(227),
        IPV4(228),
        IPV6(229),
        IEEE802_15_4_NOFCS(230),
        DBUS(231),
        DVB_CI(235),
        MUX27010(236),
        STANAG_5066_D_PDU(237),
        NFLOG(239),
        NETANALYZER(240),
        NETANALYZER_TRANSPARENT(241),
        IPOIB(242),
        MPEG_2_TS(243),
        NG40(244),
        NFC_LLCP(245),
        INFINIBAND(247),
        SCTP(248),
        USBPCAP(249),
        RTAC_SERIAL(250),
        BLUETOOTH_LE_LL(251),
        NETLINK(253),
        BLUETOOTH_LINUX_MONITOR(254),
        BLUETOOTH_BREDR_BB(255),
        BLUETOOTH_LE_LL_WITH_PHDR(256),
        PROFIBUS_DL(257),
        PKTAP(258),
        EPON(259),
        IPMI_HPM_2(260),
        ZWAVE_R1_R2(261),
        ZWAVE_R3(262),
        WATTSTOPPER_DLM(263),
        ISO_14443(264);

        private final long id;
        Linktype(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Linktype> byId = new HashMap<Long, Linktype>(104);
        static {
            for (Linktype e : Linktype.values())
                byId.put(e.id(), e);
        }
        public static Linktype byId(long id) { return byId.get(id); }
    }

    public PacketPpi(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PacketPpi(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PacketPpi(KaitaiStream _io, KaitaiStruct _parent, PacketPpi _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new PacketPpiHeader(this._io, this, _root);
        this._raw_fields = this._io.readBytes((header().pphLen() - 8));
        KaitaiStream _io__raw_fields = new KaitaiStream(_raw_fields);
        this.fields = new PacketPpiFields(_io__raw_fields, this, _root);
        switch (header().pphDlt()) {
        case PPI: {
            this._raw_body = this._io.readBytesFull();
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new PacketPpi(_io__raw_body);
            break;
        }
        case ETHERNET: {
            this._raw_body = this._io.readBytesFull();
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new EthernetFrame(_io__raw_body);
            break;
        }
        default: {
            this.body = this._io.readBytesFull();
            break;
        }
        }
    }

    /**
     * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
     */
    public static class PacketPpiHeader extends KaitaiStruct {
        public static PacketPpiHeader fromFile(String fileName) throws IOException {
            return new PacketPpiHeader(new KaitaiStream(fileName));
        }

        public PacketPpiHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketPpiHeader(KaitaiStream _io, PacketPpi _parent) {
            this(_io, _parent, null);
        }

        public PacketPpiHeader(KaitaiStream _io, PacketPpi _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.pphVersion = this._io.readU1();
            this.pphFlags = this._io.readU1();
            this.pphLen = this._io.readU2le();
            this.pphDlt = PacketPpi.Linktype.byId(this._io.readU4le());
        }
        private int pphVersion;
        private int pphFlags;
        private int pphLen;
        private Linktype pphDlt;
        private PacketPpi _root;
        private PacketPpi _parent;
        public int pphVersion() { return pphVersion; }
        public int pphFlags() { return pphFlags; }
        public int pphLen() { return pphLen; }
        public Linktype pphDlt() { return pphDlt; }
        public PacketPpi _root() { return _root; }
        public PacketPpi _parent() { return _parent; }
    }
    public static class PacketPpiFields extends KaitaiStruct {
        public static PacketPpiFields fromFile(String fileName) throws IOException {
            return new PacketPpiFields(new KaitaiStream(fileName));
        }

        public PacketPpiFields(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketPpiFields(KaitaiStream _io, PacketPpi _parent) {
            this(_io, _parent, null);
        }

        public PacketPpiFields(KaitaiStream _io, PacketPpi _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<PacketPpiField>();
            while (!this._io.isEof()) {
                this.entries.add(new PacketPpiField(this._io, this, _root));
            }
        }
        private ArrayList<PacketPpiField> entries;
        private PacketPpi _root;
        private PacketPpi _parent;
        public ArrayList<PacketPpiField> entries() { return entries; }
        public PacketPpi _root() { return _root; }
        public PacketPpi _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
     */
    public static class PacketPpiField extends KaitaiStruct {
        public static PacketPpiField fromFile(String fileName) throws IOException {
            return new PacketPpiField(new KaitaiStream(fileName));
        }

        public PacketPpiField(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketPpiField(KaitaiStream _io, PacketPpi.PacketPpiFields _parent) {
            this(_io, _parent, null);
        }

        public PacketPpiField(KaitaiStream _io, PacketPpi.PacketPpiFields _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.pfhType = PacketPpi.PfhType.byId(this._io.readU2le());
            this.pfhDatalen = this._io.readU2le();
            switch (pfhType()) {
            case RADIO_802_11_COMMON: {
                this._raw_body = this._io.readBytes(pfhDatalen());
                KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
                this.body = new Radio80211CommonBody(_io__raw_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(pfhDatalen());
                break;
            }
            }
        }
        private PfhType pfhType;
        private int pfhDatalen;
        private Object body;
        private PacketPpi _root;
        private PacketPpi.PacketPpiFields _parent;
        private byte[] _raw_body;
        public PfhType pfhType() { return pfhType; }
        public int pfhDatalen() { return pfhDatalen; }
        public Object body() { return body; }
        public PacketPpi _root() { return _root; }
        public PacketPpi.PacketPpiFields _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * @see <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.2</a>
     */
    public static class Radio80211CommonBody extends KaitaiStruct {
        public static Radio80211CommonBody fromFile(String fileName) throws IOException {
            return new Radio80211CommonBody(new KaitaiStream(fileName));
        }

        public Radio80211CommonBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Radio80211CommonBody(KaitaiStream _io, PacketPpi.PacketPpiField _parent) {
            this(_io, _parent, null);
        }

        public Radio80211CommonBody(KaitaiStream _io, PacketPpi.PacketPpiField _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tsfTimer = this._io.readU8le();
            this.flags = this._io.readU2le();
            this.rate = this._io.readU2le();
            this.channelFreq = this._io.readU2le();
            this.channelFlags = this._io.readU2le();
            this.fhssHopset = this._io.readU1();
            this.fhssPattern = this._io.readU1();
            this.dbmAntsignal = this._io.readS1();
            this.dbmAntnoise = this._io.readS1();
        }
        private long tsfTimer;
        private int flags;
        private int rate;
        private int channelFreq;
        private int channelFlags;
        private int fhssHopset;
        private int fhssPattern;
        private byte dbmAntsignal;
        private byte dbmAntnoise;
        private PacketPpi _root;
        private PacketPpi.PacketPpiField _parent;
        public long tsfTimer() { return tsfTimer; }
        public int flags() { return flags; }
        public int rate() { return rate; }
        public int channelFreq() { return channelFreq; }
        public int channelFlags() { return channelFlags; }
        public int fhssHopset() { return fhssHopset; }
        public int fhssPattern() { return fhssPattern; }
        public byte dbmAntsignal() { return dbmAntsignal; }
        public byte dbmAntnoise() { return dbmAntnoise; }
        public PacketPpi _root() { return _root; }
        public PacketPpi.PacketPpiField _parent() { return _parent; }
    }
    private PacketPpiHeader header;
    private PacketPpiFields fields;
    private Object body;
    private PacketPpi _root;
    private KaitaiStruct _parent;
    private byte[] _raw_fields;
    private byte[] _raw_body;
    public PacketPpiHeader header() { return header; }
    public PacketPpiFields fields() { return fields; }
    public Object body() { return body; }
    public PacketPpi _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_fields() { return _raw_fields; }
    public byte[] _raw_body() { return _raw_body; }
}
