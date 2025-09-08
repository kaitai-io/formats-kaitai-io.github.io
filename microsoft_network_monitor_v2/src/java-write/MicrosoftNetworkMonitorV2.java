// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;


/**
 * Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
 * network packet sniffing and analysis tool. It can save captured
 * traffic as .cap files, which usually contain the packets and may
 * contain some additional info - enhanced network info, calculated
 * statistics, etc.
 * 
 * There are at least 2 different versions of the format: v1 and
 * v2. Netmon v3 seems to use the same file format as v1.
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values">Source</a>
 */
public class MicrosoftNetworkMonitorV2 extends KaitaiStruct.ReadWrite {
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
    public MicrosoftNetworkMonitorV2() {
        this(null, null, null);
    }

    public MicrosoftNetworkMonitorV2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MicrosoftNetworkMonitorV2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MicrosoftNetworkMonitorV2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MicrosoftNetworkMonitorV2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.signature = this._io.readBytes(4);
        if (!(Arrays.equals(this.signature, new byte[] { 71, 77, 66, 85 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 77, 66, 85 }, this.signature, this._io, "/seq/0");
        }
        this.versionMinor = this._io.readU1();
        this.versionMajor = this._io.readU1();
        this.macType = Linktype.byId(this._io.readU2le());
        this.timeCaptureStart = new WindowsSystemtime(this._io);
        this.timeCaptureStart._read();
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
        _dirty = false;
    }

    public void _fetchInstances() {
        this.timeCaptureStart._fetchInstances();
        frameTable();
        if (this.frameTable != null) {
            this.frameTable._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFrameTable = _enabledFrameTable;
        this._io.writeBytes(this.signature);
        this._io.writeU1(this.versionMinor);
        this._io.writeU1(this.versionMajor);
        this._io.writeU2le(((Number) (this.macType.id())).intValue());
        this.timeCaptureStart._write_Seq(this._io);
        this._io.writeU4le(this.frameTableOfs);
        this._io.writeU4le(this.frameTableLen);
        this._io.writeU4le(this.userDataOfs);
        this._io.writeU4le(this.userDataLen);
        this._io.writeU4le(this.commentOfs);
        this._io.writeU4le(this.commentLen);
        this._io.writeU4le(this.statisticsOfs);
        this._io.writeU4le(this.statisticsLen);
        this._io.writeU4le(this.networkInfoOfs);
        this._io.writeU4le(this.networkInfoLen);
        this._io.writeU4le(this.conversationStatsOfs);
        this._io.writeU4le(this.conversationStatsLen);
    }

    public void _check() {
        if (this.signature.length != 4)
            throw new ConsistencyError("signature", 4, this.signature.length);
        if (!(Arrays.equals(this.signature, new byte[] { 71, 77, 66, 85 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 77, 66, 85 }, this.signature, null, "/seq/0");
        }
        if (_enabledFrameTable) {
            if (!Objects.equals(this.frameTable._root(), _root()))
                throw new ConsistencyError("frame_table", _root(), this.frameTable._root());
            if (!Objects.equals(this.frameTable._parent(), this))
                throw new ConsistencyError("frame_table", this, this.frameTable._parent());
        }
        _dirty = false;
    }

    /**
     * A container for actually captured network data. Allow to
     * timestamp individual frames and designates how much data from
     * the original packet was actually written into the file.
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/netmon2/frame">Source</a>
     */
    public static class Frame extends KaitaiStruct.ReadWrite {
        public static Frame fromFile(String fileName) throws IOException {
            return new Frame(new ByteBufferKaitaiStream(fileName));
        }
        public Frame() {
            this(null, null, null);
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
        }
        public void _read() {
            this.tsDelta = this._io.readU8le();
            this.origLen = this._io.readU4le();
            this.incLen = this._io.readU4le();
            {
                Linktype on = _root().macType();
                if (on != null) {
                    switch (_root().macType()) {
                    case ETHERNET: {
                        this._raw_body = this._io.readBytes(incLen());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new EthernetFrame(_io__raw_body);
                        ((EthernetFrame) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(incLen());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(incLen());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Linktype on = _root().macType();
                if (on != null) {
                    switch (_root().macType()) {
                    case ETHERNET: {
                        ((EthernetFrame) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.tsDelta);
            this._io.writeU4le(this.origLen);
            this._io.writeU4le(this.incLen);
            {
                Linktype on = _root().macType();
                if (on != null) {
                    switch (_root().macType()) {
                    case ETHERNET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(incLen());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (incLen()));
                            final Frame _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != incLen())
                                        throw new ConsistencyError("raw(body)", incLen(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((EthernetFrame) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            {
                Linktype on = _root().macType();
                if (on != null) {
                    switch (_root().macType()) {
                    case ETHERNET: {
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != incLen())
                            throw new ConsistencyError("body", incLen(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != incLen())
                        throw new ConsistencyError("body", incLen(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
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
        public void setTsDelta(long _v) { _dirty = true; tsDelta = _v; }

        /**
         * Actual length of packet
         */
        public long origLen() { return origLen; }
        public void setOrigLen(long _v) { _dirty = true; origLen = _v; }

        /**
         * Number of octets captured in file
         */
        public long incLen() { return incLen; }
        public void setIncLen(long _v) { _dirty = true; incLen = _v; }

        /**
         * Actual packet captured from the network
         */
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public MicrosoftNetworkMonitorV2 _root() { return _root; }
        public void set_root(MicrosoftNetworkMonitorV2 _v) { _dirty = true; _root = _v; }
        public MicrosoftNetworkMonitorV2.FrameIndexEntry _parent() { return _parent; }
        public void set_parent(MicrosoftNetworkMonitorV2.FrameIndexEntry _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class FrameIndex extends KaitaiStruct.ReadWrite {
        public static FrameIndex fromFile(String fileName) throws IOException {
            return new FrameIndex(new ByteBufferKaitaiStream(fileName));
        }
        public FrameIndex() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<FrameIndexEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    FrameIndexEntry _t_entries = new FrameIndexEntry(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<FrameIndexEntry> entries;
        private MicrosoftNetworkMonitorV2 _root;
        private MicrosoftNetworkMonitorV2 _parent;
        public List<FrameIndexEntry> entries() { return entries; }
        public void setEntries(List<FrameIndexEntry> _v) { _dirty = true; entries = _v; }
        public MicrosoftNetworkMonitorV2 _root() { return _root; }
        public void set_root(MicrosoftNetworkMonitorV2 _v) { _dirty = true; _root = _v; }
        public MicrosoftNetworkMonitorV2 _parent() { return _parent; }
        public void set_parent(MicrosoftNetworkMonitorV2 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Each index entry is just a pointer to where the frame data is
     * stored in the file.
     */
    public static class FrameIndexEntry extends KaitaiStruct.ReadWrite {
        public static FrameIndexEntry fromFile(String fileName) throws IOException {
            return new FrameIndexEntry(new ByteBufferKaitaiStream(fileName));
        }
        public FrameIndexEntry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ofs = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                this.body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4le(this.ofs);
        }

        public void _check() {
            if (_enabledBody) {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
            }
            _dirty = false;
        }
        private Frame body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;

        /**
         * Frame body itself
         */
        public Frame body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofs());
            this.body = new Frame(io, this, _root);
            this.body._read();
            io.seek(_pos);
            return this.body;
        }
        public void setBody(Frame _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofs());
            this.body._write_Seq(io);
            io.seek(_pos);
        }
        private long ofs;
        private MicrosoftNetworkMonitorV2 _root;
        private MicrosoftNetworkMonitorV2.FrameIndex _parent;

        /**
         * Absolute pointer to frame data in the file
         */
        public long ofs() { return ofs; }
        public void setOfs(long _v) { _dirty = true; ofs = _v; }
        public MicrosoftNetworkMonitorV2 _root() { return _root; }
        public void set_root(MicrosoftNetworkMonitorV2 _v) { _dirty = true; _root = _v; }
        public MicrosoftNetworkMonitorV2.FrameIndex _parent() { return _parent; }
        public void set_parent(MicrosoftNetworkMonitorV2.FrameIndex _v) { _dirty = true; _parent = _v; }
    }
    private FrameIndex frameTable;
    private boolean _shouldWriteFrameTable = false;
    private boolean _enabledFrameTable = true;

    /**
     * Index that is used to access individual captured frames
     */
    public FrameIndex frameTable() {
        if (_shouldWriteFrameTable)
            _writeFrameTable();
        if (this.frameTable != null)
            return this.frameTable;
        if (!_enabledFrameTable)
            return null;
        long _pos = this._io.pos();
        this._io.seek(frameTableOfs());
        this._raw_frameTable = this._io.readBytes(frameTableLen());
        KaitaiStream _io__raw_frameTable = new ByteBufferKaitaiStream(this._raw_frameTable);
        this.frameTable = new FrameIndex(_io__raw_frameTable, this, _root);
        this.frameTable._read();
        this._io.seek(_pos);
        return this.frameTable;
    }
    public void setFrameTable(FrameIndex _v) { _dirty = true; frameTable = _v; }
    public void setFrameTable_Enabled(boolean _v) { _dirty = true; _enabledFrameTable = _v; }

    private void _writeFrameTable() {
        _shouldWriteFrameTable = false;
        long _pos = this._io.pos();
        this._io.seek(frameTableOfs());
        final KaitaiStream _io__raw_frameTable = new ByteBufferKaitaiStream(frameTableLen());
        this._io.addChildStream(_io__raw_frameTable);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (frameTableLen()));
            final MicrosoftNetworkMonitorV2 _this = this;
            _io__raw_frameTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_frameTable = _io__raw_frameTable.toByteArray();
                    if (_this._raw_frameTable.length != frameTableLen())
                        throw new ConsistencyError("raw(frame_table)", frameTableLen(), _this._raw_frameTable.length);
                    parent.writeBytes(_this._raw_frameTable);
                }
            });
        }
        this.frameTable._write_Seq(_io__raw_frameTable);
        this._io.seek(_pos);
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
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_frameTable;
    public byte[] signature() { return signature; }
    public void setSignature(byte[] _v) { _dirty = true; signature = _v; }

    /**
     * Format version (minor), BCD
     */
    public int versionMinor() { return versionMinor; }
    public void setVersionMinor(int _v) { _dirty = true; versionMinor = _v; }

    /**
     * Format version (major), BCD
     */
    public int versionMajor() { return versionMajor; }
    public void setVersionMajor(int _v) { _dirty = true; versionMajor = _v; }

    /**
     * Network topology type of captured data
     */
    public Linktype macType() { return macType; }
    public void setMacType(Linktype _v) { _dirty = true; macType = _v; }

    /**
     * Timestamp of capture start
     */
    public WindowsSystemtime timeCaptureStart() { return timeCaptureStart; }
    public void setTimeCaptureStart(WindowsSystemtime _v) { _dirty = true; timeCaptureStart = _v; }
    public long frameTableOfs() { return frameTableOfs; }
    public void setFrameTableOfs(long _v) { _dirty = true; frameTableOfs = _v; }
    public long frameTableLen() { return frameTableLen; }
    public void setFrameTableLen(long _v) { _dirty = true; frameTableLen = _v; }
    public long userDataOfs() { return userDataOfs; }
    public void setUserDataOfs(long _v) { _dirty = true; userDataOfs = _v; }
    public long userDataLen() { return userDataLen; }
    public void setUserDataLen(long _v) { _dirty = true; userDataLen = _v; }
    public long commentOfs() { return commentOfs; }
    public void setCommentOfs(long _v) { _dirty = true; commentOfs = _v; }
    public long commentLen() { return commentLen; }
    public void setCommentLen(long _v) { _dirty = true; commentLen = _v; }
    public long statisticsOfs() { return statisticsOfs; }
    public void setStatisticsOfs(long _v) { _dirty = true; statisticsOfs = _v; }
    public long statisticsLen() { return statisticsLen; }
    public void setStatisticsLen(long _v) { _dirty = true; statisticsLen = _v; }
    public long networkInfoOfs() { return networkInfoOfs; }
    public void setNetworkInfoOfs(long _v) { _dirty = true; networkInfoOfs = _v; }
    public long networkInfoLen() { return networkInfoLen; }
    public void setNetworkInfoLen(long _v) { _dirty = true; networkInfoLen = _v; }
    public long conversationStatsOfs() { return conversationStatsOfs; }
    public void setConversationStatsOfs(long _v) { _dirty = true; conversationStatsOfs = _v; }
    public long conversationStatsLen() { return conversationStatsLen; }
    public void setConversationStatsLen(long _v) { _dirty = true; conversationStatsLen = _v; }
    public MicrosoftNetworkMonitorV2 _root() { return _root; }
    public void set_root(MicrosoftNetworkMonitorV2 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_frameTable() { return _raw_frameTable; }
    public void set_raw_FrameTable(byte[] _v) { _dirty = true; _raw_frameTable = _v; }
}
