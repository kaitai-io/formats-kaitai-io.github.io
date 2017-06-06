// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class Pcap extends KaitaiStruct {
    public static Pcap fromFile(String fileName) throws IOException {
        return new Pcap(new KaitaiStream(fileName));
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

    public Pcap(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Pcap(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Pcap(KaitaiStream _io, KaitaiStruct _parent, Pcap _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.packets = new ArrayList<Packet>();
        while (!this._io.isEof()) {
            this.packets.add(new Packet(this._io, this, _root));
        }
    }
    public static class PacketPpi extends KaitaiStruct {
        public static PacketPpi fromFile(String fileName) throws IOException {
            return new PacketPpi(new KaitaiStream(fileName));
        }

        public PacketPpi(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public PacketPpi(KaitaiStream _io, Pcap.Packet _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public PacketPpi(KaitaiStream _io, Pcap.Packet _parent, Pcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.header = new PacketPpiHeader(this._io, this, _root);
            this.fields = new ArrayList<PacketPpiField>();
            while (!this._io.isEof()) {
                this.fields.add(new PacketPpiField(this._io, this, _root));
            }
        }
        private PacketPpiHeader header;
        private ArrayList<PacketPpiField> fields;
        private Pcap _root;
        private Pcap.Packet _parent;
        public PacketPpiHeader header() { return header; }
        public ArrayList<PacketPpiField> fields() { return fields; }
        public Pcap _root() { return _root; }
        public Pcap.Packet _parent() { return _parent; }
    }
    public static class PacketPpiHeader extends KaitaiStruct {
        public static PacketPpiHeader fromFile(String fileName) throws IOException {
            return new PacketPpiHeader(new KaitaiStream(fileName));
        }

        public PacketPpiHeader(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public PacketPpiHeader(KaitaiStream _io, Pcap.PacketPpi _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public PacketPpiHeader(KaitaiStream _io, Pcap.PacketPpi _parent, Pcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.pphVersion = this._io.readU1();
            this.pphFlags = this._io.readU1();
            this.pphLen = this._io.readU2le();
            this.pphDlt = this._io.readU4le();
        }
        private int pphVersion;
        private int pphFlags;
        private int pphLen;
        private long pphDlt;
        private Pcap _root;
        private Pcap.PacketPpi _parent;
        public int pphVersion() { return pphVersion; }
        public int pphFlags() { return pphFlags; }
        public int pphLen() { return pphLen; }
        public long pphDlt() { return pphDlt; }
        public Pcap _root() { return _root; }
        public Pcap.PacketPpi _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new KaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header(KaitaiStream _io, Pcap _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header(KaitaiStream _io, Pcap _parent, Pcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.magicNumber = this._io.ensureFixedContents(new byte[] { -44, -61, -78, -95 });
            this.versionMajor = this._io.readU2le();
            this.versionMinor = this._io.readU2le();
            this.thiszone = this._io.readS4le();
            this.sigfigs = this._io.readU4le();
            this.snaplen = this._io.readU4le();
            this.network = Pcap.Linktype.byId(this._io.readU4le());
        }
        private byte[] magicNumber;
        private int versionMajor;
        private int versionMinor;
        private int thiszone;
        private long sigfigs;
        private long snaplen;
        private Linktype network;
        private Pcap _root;
        private Pcap _parent;
        public byte[] magicNumber() { return magicNumber; }
        public int versionMajor() { return versionMajor; }
        public int versionMinor() { return versionMinor; }

        /**
         * Correction time in seconds between UTC and the local
         * timezone of the following packet header timestamps.
         */
        public int thiszone() { return thiszone; }

        /**
         * In theory, the accuracy of time stamps in the capture; in
         * practice, all tools set it to 0.
         */
        public long sigfigs() { return sigfigs; }

        /**
         * The "snapshot length" for the capture (typically 65535 or
         * even more, but might be limited by the user), see: incl_len
         * vs. orig_len.
         */
        public long snaplen() { return snaplen; }

        /**
         * Link-layer header type, specifying the type of headers at
         * the beginning of the packet.
         */
        public Linktype network() { return network; }
        public Pcap _root() { return _root; }
        public Pcap _parent() { return _parent; }
    }
    public static class Radio80211CommonBody extends KaitaiStruct {
        public static Radio80211CommonBody fromFile(String fileName) throws IOException {
            return new Radio80211CommonBody(new KaitaiStream(fileName));
        }

        public Radio80211CommonBody(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Radio80211CommonBody(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Radio80211CommonBody(KaitaiStream _io, KaitaiStruct _parent, Pcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
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
        private Pcap _root;
        private KaitaiStruct _parent;
        public long tsfTimer() { return tsfTimer; }
        public int flags() { return flags; }
        public int rate() { return rate; }
        public int channelFreq() { return channelFreq; }
        public int channelFlags() { return channelFlags; }
        public int fhssHopset() { return fhssHopset; }
        public int fhssPattern() { return fhssPattern; }
        public byte dbmAntsignal() { return dbmAntsignal; }
        public byte dbmAntnoise() { return dbmAntnoise; }
        public Pcap _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class PacketPpiField extends KaitaiStruct {
        public static PacketPpiField fromFile(String fileName) throws IOException {
            return new PacketPpiField(new KaitaiStream(fileName));
        }

        public PacketPpiField(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public PacketPpiField(KaitaiStream _io, Pcap.PacketPpi _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public PacketPpiField(KaitaiStream _io, Pcap.PacketPpi _parent, Pcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.pfhType = this._io.readU2le();
            this.pfhDatalen = this._io.readU2le();
            this.body = this._io.readBytes(pfhDatalen());
        }
        private int pfhType;
        private int pfhDatalen;
        private byte[] body;
        private Pcap _root;
        private Pcap.PacketPpi _parent;
        public int pfhType() { return pfhType; }
        public int pfhDatalen() { return pfhDatalen; }
        public byte[] body() { return body; }
        public Pcap _root() { return _root; }
        public Pcap.PacketPpi _parent() { return _parent; }
    }
    public static class Packet extends KaitaiStruct {
        public static Packet fromFile(String fileName) throws IOException {
            return new Packet(new KaitaiStream(fileName));
        }

        public Packet(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Packet(KaitaiStream _io, Pcap _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Packet(KaitaiStream _io, Pcap _parent, Pcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.tsSec = this._io.readU4le();
            this.tsUsec = this._io.readU4le();
            this.inclLen = this._io.readU4le();
            this.origLen = this._io.readU4le();
            switch (_root.hdr().network()) {
            case PPI: {
                this._raw_body = this._io.readBytes(inclLen());
                KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
                this.body = new PacketPpi(_io__raw_body, this, _root);
                break;
            }
            case ETHERNET: {
                this._raw_body = this._io.readBytes(inclLen());
                KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
                this.body = new EthernetFrame(_io__raw_body);
                break;
            }
            default: {
                this.body = this._io.readBytes(inclLen());
                break;
            }
            }
        }
        private long tsSec;
        private long tsUsec;
        private long inclLen;
        private long origLen;
        private Object body;
        private Pcap _root;
        private Pcap _parent;
        private byte[] _raw_body;
        public long tsSec() { return tsSec; }
        public long tsUsec() { return tsUsec; }

        /**
         * Number of bytes of packet data actually captured and saved in the file.
         */
        public long inclLen() { return inclLen; }

        /**
         * Length of the packet as it appeared on the network when it was captured.
         */
        public long origLen() { return origLen; }
        public Object body() { return body; }
        public Pcap _root() { return _root; }
        public Pcap _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    private Header hdr;
    private ArrayList<Packet> packets;
    private Pcap _root;
    private KaitaiStruct _parent;
    public Header hdr() { return hdr; }
    public ArrayList<Packet> packets() { return packets; }
    public Pcap _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
