// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class Ipv4Packet extends KaitaiStruct {
    public static Ipv4Packet fromFile(String fileName) throws IOException {
        return new Ipv4Packet(new ByteBufferKaitaiStream(fileName));
    }

    public enum ProtocolEnum {
        HOPOPT(0),
        ICMP(1),
        IGMP(2),
        GGP(3),
        IPV4(4),
        ST(5),
        TCP(6),
        CBT(7),
        EGP(8),
        IGP(9),
        BBN_RCC_MON(10),
        NVP_II(11),
        PUP(12),
        ARGUS(13),
        EMCON(14),
        XNET(15),
        CHAOS(16),
        UDP(17),
        MUX(18),
        DCN_MEAS(19),
        HMP(20),
        PRM(21),
        XNS_IDP(22),
        TRUNK_1(23),
        TRUNK_2(24),
        LEAF_1(25),
        LEAF_2(26),
        RDP(27),
        IRTP(28),
        ISO_TP4(29),
        NETBLT(30),
        MFE_NSP(31),
        MERIT_INP(32),
        DCCP(33),
        X_3PC(34),
        IDPR(35),
        XTP(36),
        DDP(37),
        IDPR_CMTP(38),
        TP_PLUS_PLUS(39),
        IL(40),
        IPV6(41),
        SDRP(42),
        IPV6_ROUTE(43),
        IPV6_FRAG(44),
        IDRP(45),
        RSVP(46),
        GRE(47),
        DSR(48),
        BNA(49),
        ESP(50),
        AH(51),
        I_NLSP(52),
        SWIPE(53),
        NARP(54),
        MOBILE(55),
        TLSP(56),
        SKIP(57),
        IPV6_ICMP(58),
        IPV6_NONXT(59),
        IPV6_OPTS(60),
        ANY_HOST_INTERNAL_PROTOCOL(61),
        CFTP(62),
        ANY_LOCAL_NETWORK(63),
        SAT_EXPAK(64),
        KRYPTOLAN(65),
        RVD(66),
        IPPC(67),
        ANY_DISTRIBUTED_FILE_SYSTEM(68),
        SAT_MON(69),
        VISA(70),
        IPCV(71),
        CPNX(72),
        CPHB(73),
        WSN(74),
        PVP(75),
        BR_SAT_MON(76),
        SUN_ND(77),
        WB_MON(78),
        WB_EXPAK(79),
        ISO_IP(80),
        VMTP(81),
        SECURE_VMTP(82),
        VINES(83),
        IPTM(84),
        NSFNET_IGP(85),
        DGP(86),
        TCF(87),
        EIGRP(88),
        OSPFIGP(89),
        SPRITE_RPC(90),
        LARP(91),
        MTP(92),
        AX_25(93),
        IPIP(94),
        MICP(95),
        SCC_SP(96),
        ETHERIP(97),
        ENCAP(98),
        ANY_PRIVATE_ENCRYPTION_SCHEME(99),
        GMTP(100),
        IFMP(101),
        PNNI(102),
        PIM(103),
        ARIS(104),
        SCPS(105),
        QNX(106),
        A_N(107),
        IPCOMP(108),
        SNP(109),
        COMPAQ_PEER(110),
        IPX_IN_IP(111),
        VRRP(112),
        PGM(113),
        ANY_0_HOP(114),
        L2TP(115),
        DDX(116),
        IATP(117),
        STP(118),
        SRP(119),
        UTI(120),
        SMP(121),
        SM(122),
        PTP(123),
        ISIS_OVER_IPV4(124),
        FIRE(125),
        CRTP(126),
        CRUDP(127),
        SSCOPMCE(128),
        IPLT(129),
        SPS(130),
        PIPE(131),
        SCTP(132),
        FC(133),
        RSVP_E2E_IGNORE(134),
        MOBILITY_HEADER(135),
        UDPLITE(136),
        MPLS_IN_IP(137),
        MANET(138),
        HIP(139),
        SHIM6(140),
        WESP(141),
        ROHC(142),
        RESERVED_255(255);

        private final long id;
        ProtocolEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ProtocolEnum> byId = new HashMap<Long, ProtocolEnum>(144);
        static {
            for (ProtocolEnum e : ProtocolEnum.values())
                byId.put(e.id(), e);
        }
        public static ProtocolEnum byId(long id) { return byId.get(id); }
    }

    public Ipv4Packet(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ipv4Packet(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ipv4Packet(KaitaiStream _io, KaitaiStruct _parent, Ipv4Packet _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.b1 = this._io.readU1();
        this.b2 = this._io.readU1();
        this.totalLength = this._io.readU2be();
        this.identification = this._io.readU2be();
        this.b67 = this._io.readU2be();
        this.ttl = this._io.readU1();
        this.protocol = ProtocolEnum.byId(this._io.readU1());
        this.headerChecksum = this._io.readU2be();
        this.srcIpAddr = this._io.readBytes(4);
        this.dstIpAddr = this._io.readBytes(4);
        this._raw_options = this._io.readBytes((ihlBytes() - 20));
        KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(_raw_options);
        this.options = new Ipv4Options(_io__raw_options, this, _root);
        switch (protocol()) {
        case TCP: {
            this._raw_body = this._io.readBytes((totalLength() - ihlBytes()));
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new TcpSegment(_io__raw_body);
            break;
        }
        case ICMP: {
            this._raw_body = this._io.readBytes((totalLength() - ihlBytes()));
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new IcmpPacket(_io__raw_body);
            break;
        }
        case UDP: {
            this._raw_body = this._io.readBytes((totalLength() - ihlBytes()));
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new UdpDatagram(_io__raw_body);
            break;
        }
        case IPV6: {
            this._raw_body = this._io.readBytes((totalLength() - ihlBytes()));
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new Ipv6Packet(_io__raw_body);
            break;
        }
        default: {
            this.body = this._io.readBytes((totalLength() - ihlBytes()));
            break;
        }
        }
    }
    public static class Ipv4Options extends KaitaiStruct {
        public static Ipv4Options fromFile(String fileName) throws IOException {
            return new Ipv4Options(new ByteBufferKaitaiStream(fileName));
        }

        public Ipv4Options(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Ipv4Options(KaitaiStream _io, Ipv4Packet _parent) {
            this(_io, _parent, null);
        }

        public Ipv4Options(KaitaiStream _io, Ipv4Packet _parent, Ipv4Packet _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Ipv4Option>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Ipv4Option(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Ipv4Option> entries;
        private Ipv4Packet _root;
        private Ipv4Packet _parent;
        public ArrayList<Ipv4Option> entries() { return entries; }
        public Ipv4Packet _root() { return _root; }
        public Ipv4Packet _parent() { return _parent; }
    }
    public static class Ipv4Option extends KaitaiStruct {
        public static Ipv4Option fromFile(String fileName) throws IOException {
            return new Ipv4Option(new ByteBufferKaitaiStream(fileName));
        }

        public Ipv4Option(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Ipv4Option(KaitaiStream _io, Ipv4Packet.Ipv4Options _parent) {
            this(_io, _parent, null);
        }

        public Ipv4Option(KaitaiStream _io, Ipv4Packet.Ipv4Options _parent, Ipv4Packet _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.b1 = this._io.readU1();
            this.len = this._io.readU1();
            this.body = this._io.readBytes((len() > 2 ? (len() - 2) : 0));
        }
        private Integer copy;
        public Integer copy() {
            if (this.copy != null)
                return this.copy;
            int _tmp = (int) (((b1() & 128) >> 7));
            this.copy = _tmp;
            return this.copy;
        }
        private Integer optClass;
        public Integer optClass() {
            if (this.optClass != null)
                return this.optClass;
            int _tmp = (int) (((b1() & 96) >> 5));
            this.optClass = _tmp;
            return this.optClass;
        }
        private Integer number;
        public Integer number() {
            if (this.number != null)
                return this.number;
            int _tmp = (int) ((b1() & 31));
            this.number = _tmp;
            return this.number;
        }
        private int b1;
        private int len;
        private byte[] body;
        private Ipv4Packet _root;
        private Ipv4Packet.Ipv4Options _parent;
        public int b1() { return b1; }
        public int len() { return len; }
        public byte[] body() { return body; }
        public Ipv4Packet _root() { return _root; }
        public Ipv4Packet.Ipv4Options _parent() { return _parent; }
    }
    private Integer version;
    public Integer version() {
        if (this.version != null)
            return this.version;
        int _tmp = (int) (((b1() & 240) >> 4));
        this.version = _tmp;
        return this.version;
    }
    private Integer ihl;
    public Integer ihl() {
        if (this.ihl != null)
            return this.ihl;
        int _tmp = (int) ((b1() & 15));
        this.ihl = _tmp;
        return this.ihl;
    }
    private Integer ihlBytes;
    public Integer ihlBytes() {
        if (this.ihlBytes != null)
            return this.ihlBytes;
        int _tmp = (int) ((ihl() * 4));
        this.ihlBytes = _tmp;
        return this.ihlBytes;
    }
    private int b1;
    private int b2;
    private int totalLength;
    private int identification;
    private int b67;
    private int ttl;
    private ProtocolEnum protocol;
    private int headerChecksum;
    private byte[] srcIpAddr;
    private byte[] dstIpAddr;
    private Ipv4Options options;
    private Object body;
    private Ipv4Packet _root;
    private KaitaiStruct _parent;
    private byte[] _raw_options;
    private byte[] _raw_body;
    public int b1() { return b1; }
    public int b2() { return b2; }
    public int totalLength() { return totalLength; }
    public int identification() { return identification; }
    public int b67() { return b67; }
    public int ttl() { return ttl; }
    public ProtocolEnum protocol() { return protocol; }
    public int headerChecksum() { return headerChecksum; }
    public byte[] srcIpAddr() { return srcIpAddr; }
    public byte[] dstIpAddr() { return dstIpAddr; }
    public Ipv4Options options() { return options; }
    public Object body() { return body; }
    public Ipv4Packet _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_options() { return _raw_options; }
    public byte[] _raw_body() { return _raw_body; }
}
