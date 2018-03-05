// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
 * network packet sniffing and analysis tool. It can save captured
 * traffic as .cap files, which usually contain the packets and may
 * contain some additional info - enhanced network info, calculated
 * statistics, etc.
 * 
 * There are at least 2 different versions of the format: v1 and
 * v2. Netmon v3 seems to use the same file format as v1.
 * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ee817717.aspx">Source</a>
 */
public class MicrosoftNetworkMonitorV2 extends KaitaiStruct {
    public static MicrosoftNetworkMonitorV2 fromFile(String fileName) throws IOException {
        return new MicrosoftNetworkMonitorV2(new ByteBufferKaitaiStream(fileName));
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

    public MicrosoftNetworkMonitorV2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MicrosoftNetworkMonitorV2(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MicrosoftNetworkMonitorV2(KaitaiStream _io, KaitaiStruct _parent, MicrosoftNetworkMonitorV2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.signature = this._io.ensureFixedContents(new byte[] { 71, 77, 66, 85 });
        this.versionMinor = this._io.readU1();
        this.versionMajor = this._io.readU1();
        this.macType = Linktype.byId(this._io.readU2le());
        this.timeCaptureStart = new WindowsSystemtime(this._io);
        this.frameTableOfs = this._io.readU4le();
        this.frameTableLen = this._io.readU4le();
        this.userDataOfs = this._io.readU4le();
        this.userDataLen = this._io.readU4le();
        this.commentOfs = this._io.readU4le();
        this.commentLen = this._io.readU4le();
        this.statisticsOfs = this._io.readU4le();
        this.statisticsLen = this._io.readU4le();
        this.networkInfoOfs = this._io.readU4le();
        this.networkInfoLen = this._io.readU4le();
        this.conversationStatsOfs = this._io.readU4le();
        this.conversationStatsLen = this._io.readU4le();
    }
    public static class FrameIndex extends KaitaiStruct {
        public static FrameIndex fromFile(String fileName) throws IOException {
            return new FrameIndex(new ByteBufferKaitaiStream(fileName));
        }

        public FrameIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameIndex(KaitaiStream _io, MicrosoftNetworkMonitorV2 _parent) {
            this(_io, _parent, null);
        }

        public FrameIndex(KaitaiStream _io, MicrosoftNetworkMonitorV2 _parent, MicrosoftNetworkMonitorV2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<FrameIndexEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new FrameIndexEntry(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<FrameIndexEntry> entries;
        private MicrosoftNetworkMonitorV2 _root;
        private MicrosoftNetworkMonitorV2 _parent;
        public ArrayList<FrameIndexEntry> entries() { return entries; }
        public MicrosoftNetworkMonitorV2 _root() { return _root; }
        public MicrosoftNetworkMonitorV2 _parent() { return _parent; }
    }

    /**
     * Each index entry is just a pointer to where the frame data is
     * stored in the file.
     */
    public static class FrameIndexEntry extends KaitaiStruct {
        public static FrameIndexEntry fromFile(String fileName) throws IOException {
            return new FrameIndexEntry(new ByteBufferKaitaiStream(fileName));
        }

        public FrameIndexEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameIndexEntry(KaitaiStream _io, MicrosoftNetworkMonitorV2.FrameIndex _parent) {
            this(_io, _parent, null);
        }

        public FrameIndexEntry(KaitaiStream _io, MicrosoftNetworkMonitorV2.FrameIndex _parent, MicrosoftNetworkMonitorV2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ofs = this._io.readU4le();
        }
        private Frame body;

        /**
         * Frame body itself
         */
        public Frame body() {
            if (this.body != null)
                return this.body;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofs());
            this.body = new Frame(io, this, _root);
            io.seek(_pos);
            return this.body;
        }
        private long ofs;
        private MicrosoftNetworkMonitorV2 _root;
        private MicrosoftNetworkMonitorV2.FrameIndex _parent;

        /**
         * Absolute pointer to frame data in the file
         */
        public long ofs() { return ofs; }
        public MicrosoftNetworkMonitorV2 _root() { return _root; }
        public MicrosoftNetworkMonitorV2.FrameIndex _parent() { return _parent; }
    }

    /**
     * A container for actually captured network data. Allow to
     * timestamp individual frames and designates how much data from
     * the original packet was actually written into the file.
     * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ee831821.aspx">Source</a>
     */
    public static class Frame extends KaitaiStruct {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }

        public Frame(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Frame(KaitaiStream _io, MicrosoftNetworkMonitorV2.FrameIndexEntry _parent) {
            this(_io, _parent, null);
        }

        public Frame(KaitaiStream _io, MicrosoftNetworkMonitorV2.FrameIndexEntry _parent, MicrosoftNetworkMonitorV2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tsDelta = this._io.readU8le();
            this.origLen = this._io.readU4le();
            this.incLen = this._io.readU4le();
            switch (_root.macType()) {
            case ETHERNET: {
                this._raw_body = this._io.readBytes(incLen());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new EthernetFrame(_io__raw_body);
                break;
            }
            default: {
                this.body = this._io.readBytes(incLen());
                break;
            }
            }
        }
        private long tsDelta;
        private long origLen;
        private long incLen;
        private Object body;
        private MicrosoftNetworkMonitorV2 _root;
        private MicrosoftNetworkMonitorV2.FrameIndexEntry _parent;
        private byte[] _raw_body;

        /**
         * Time stamp - usecs since start of capture
         */
        public long tsDelta() { return tsDelta; }

        /**
         * Actual length of packet
         */
        public long origLen() { return origLen; }

        /**
         * Number of octets captured in file
         */
        public long incLen() { return incLen; }

        /**
         * Actual packet captured from the network
         */
        public Object body() { return body; }
        public MicrosoftNetworkMonitorV2 _root() { return _root; }
        public MicrosoftNetworkMonitorV2.FrameIndexEntry _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    private FrameIndex frameTable;

    /**
     * Index that is used to access individual captured frames
     */
    public FrameIndex frameTable() {
        if (this.frameTable != null)
            return this.frameTable;
        long _pos = this._io.pos();
        this._io.seek(frameTableOfs());
        this._raw_frameTable = this._io.readBytes(frameTableLen());
        KaitaiStream _io__raw_frameTable = new ByteBufferKaitaiStream(_raw_frameTable);
        this.frameTable = new FrameIndex(_io__raw_frameTable, this, _root);
        this._io.seek(_pos);
        return this.frameTable;
    }
    private byte[] signature;
    private int versionMinor;
    private int versionMajor;
    private Linktype macType;
    private WindowsSystemtime timeCaptureStart;
    private long frameTableOfs;
    private long frameTableLen;
    private long userDataOfs;
    private long userDataLen;
    private long commentOfs;
    private long commentLen;
    private long statisticsOfs;
    private long statisticsLen;
    private long networkInfoOfs;
    private long networkInfoLen;
    private long conversationStatsOfs;
    private long conversationStatsLen;
    private MicrosoftNetworkMonitorV2 _root;
    private KaitaiStruct _parent;
    private byte[] _raw_frameTable;
    public byte[] signature() { return signature; }

    /**
     * Format version (minor), BCD
     */
    public int versionMinor() { return versionMinor; }

    /**
     * Format version (major), BCD
     */
    public int versionMajor() { return versionMajor; }

    /**
     * Network topology type of captured data
     */
    public Linktype macType() { return macType; }

    /**
     * Timestamp of capture start
     */
    public WindowsSystemtime timeCaptureStart() { return timeCaptureStart; }
    public long frameTableOfs() { return frameTableOfs; }
    public long frameTableLen() { return frameTableLen; }
    public long userDataOfs() { return userDataOfs; }
    public long userDataLen() { return userDataLen; }
    public long commentOfs() { return commentOfs; }
    public long commentLen() { return commentLen; }
    public long statisticsOfs() { return statisticsOfs; }
    public long statisticsLen() { return statisticsLen; }
    public long networkInfoOfs() { return networkInfoOfs; }
    public long networkInfoLen() { return networkInfoLen; }
    public long conversationStatsOfs() { return conversationStatsOfs; }
    public long conversationStatsLen() { return conversationStatsLen; }
    public MicrosoftNetworkMonitorV2 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_frameTable() { return _raw_frameTable; }
}
