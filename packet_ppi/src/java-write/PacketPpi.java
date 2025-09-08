// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;


/**
 * PPI is a standard for link layer packet encapsulation, proposed as
 * generic extensible container to store both captured in-band data and
 * out-of-band data. Originally it was developed to provide 802.11n
 * radio information, but can be used for other purposes as well.
 * 
 * Sample capture:
 * <https://wiki.wireshark.org/uploads/27707187aeb30df68e70c8fb9d614981/http.cap>
 * @see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3</a>
 */
public class PacketPpi extends KaitaiStruct.ReadWrite {
    public static PacketPpi fromFile(String fileName) throws IOException {
        return new PacketPpi(new ByteBufferKaitaiStream(fileName));
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
    public PacketPpi() {
        this(null, null, null);
    }

    public PacketPpi(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PacketPpi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PacketPpi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PacketPpi _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new PacketPpiHeader(this._io, this, _root);
        this.header._read();
        this._raw_fields = this._io.readBytes(header().pphLen() - 8);
        KaitaiStream _io__raw_fields = new ByteBufferKaitaiStream(this._raw_fields);
        this.fields = new PacketPpiFields(_io__raw_fields, this, _root);
        this.fields._read();
        {
            Linktype on = header().pphDlt();
            if (on != null) {
                switch (header().pphDlt()) {
                case ETHERNET: {
                    this._raw_body = this._io.readBytesFull();
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new EthernetFrame(_io__raw_body);
                    ((EthernetFrame) (this.body))._read();
                    break;
                }
                case PPI: {
                    this._raw_body = this._io.readBytesFull();
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new PacketPpi(_io__raw_body, this, _root);
                    ((PacketPpi) (this.body))._read();
                    break;
                }
                default: {
                    this.body = this._io.readBytesFull();
                    break;
                }
                }
            } else {
                this.body = this._io.readBytesFull();
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        this.fields._fetchInstances();
        {
            Linktype on = header().pphDlt();
            if (on != null) {
                switch (header().pphDlt()) {
                case ETHERNET: {
                    ((EthernetFrame) (this.body))._fetchInstances();
                    break;
                }
                case PPI: {
                    ((PacketPpi) (this.body))._fetchInstances();
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
        this.header._write_Seq(this._io);
        final KaitaiStream _io__raw_fields = new ByteBufferKaitaiStream(header().pphLen() - 8);
        this._io.addChildStream(_io__raw_fields);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (header().pphLen() - 8));
            final PacketPpi _this = this;
            _io__raw_fields.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_fields = _io__raw_fields.toByteArray();
                    if (_this._raw_fields.length != header().pphLen() - 8)
                        throw new ConsistencyError("raw(fields)", header().pphLen() - 8, _this._raw_fields.length);
                    parent.writeBytes(_this._raw_fields);
                }
            });
        }
        this.fields._write_Seq(_io__raw_fields);
        {
            Linktype on = header().pphDlt();
            if (on != null) {
                switch (header().pphDlt()) {
                case ETHERNET: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                        final PacketPpi _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                if (!(parent.isEof()))
                                    throw new ConsistencyError("raw(body)", 0, parent.size() - parent.pos());
                            }
                        });
                    }
                    ((EthernetFrame) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case PPI: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                        final PacketPpi _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                if (!(parent.isEof()))
                                    throw new ConsistencyError("raw(body)", 0, parent.size() - parent.pos());
                            }
                        });
                    }
                    ((PacketPpi) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                default: {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("body", 0, this._io.size() - this._io.pos());
                    break;
                }
                }
            } else {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                if (!(this._io.isEof()))
                    throw new ConsistencyError("body", 0, this._io.size() - this._io.pos());
            }
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (!Objects.equals(this.fields._root(), _root()))
            throw new ConsistencyError("fields", _root(), this.fields._root());
        if (!Objects.equals(this.fields._parent(), this))
            throw new ConsistencyError("fields", this, this.fields._parent());
        {
            Linktype on = header().pphDlt();
            if (on != null) {
                switch (header().pphDlt()) {
                case ETHERNET: {
                    break;
                }
                case PPI: {
                    if (!Objects.equals(((PacketPpi) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((PacketPpi) (this.body))._root());
                    if (!Objects.equals(((PacketPpi) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((PacketPpi) (this.body))._parent());
                    break;
                }
                default: {
                    break;
                }
                }
            } else {
            }
        }
        _dirty = false;
    }
    public static class MacFlags extends KaitaiStruct.ReadWrite {
        public static MacFlags fromFile(String fileName) throws IOException {
            return new MacFlags(new ByteBufferKaitaiStream(fileName));
        }
        public MacFlags() {
            this(null, null, null);
        }

        public MacFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MacFlags(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public MacFlags(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.unused1 = this._io.readBitsIntBe(1) != 0;
            this.aggregateDelimiter = this._io.readBitsIntBe(1) != 0;
            this.moreAggregates = this._io.readBitsIntBe(1) != 0;
            this.aggregate = this._io.readBitsIntBe(1) != 0;
            this.dupRx = this._io.readBitsIntBe(1) != 0;
            this.rxShortGuard = this._io.readBitsIntBe(1) != 0;
            this.isHt40 = this._io.readBitsIntBe(1) != 0;
            this.greenfield = this._io.readBitsIntBe(1) != 0;
            this.unused2 = this._io.readBytes(3);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.unused1 ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.aggregateDelimiter ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.moreAggregates ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.aggregate ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.dupRx ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.rxShortGuard ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isHt40 ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.greenfield ? 1 : 0));
            this._io.writeBytes(this.unused2);
        }

        public void _check() {
            if (this.unused2.length != 3)
                throw new ConsistencyError("unused2", 3, this.unused2.length);
            _dirty = false;
        }
        private boolean unused1;
        private boolean aggregateDelimiter;
        private boolean moreAggregates;
        private boolean aggregate;
        private boolean dupRx;
        private boolean rxShortGuard;
        private boolean isHt40;
        private boolean greenfield;
        private byte[] unused2;
        private PacketPpi _root;
        private KaitaiStruct.ReadWrite _parent;
        public boolean unused1() { return unused1; }
        public void setUnused1(boolean _v) { _dirty = true; unused1 = _v; }

        /**
         * Aggregate delimiter CRC error after this frame
         */
        public boolean aggregateDelimiter() { return aggregateDelimiter; }
        public void setAggregateDelimiter(boolean _v) { _dirty = true; aggregateDelimiter = _v; }

        /**
         * More aggregates
         */
        public boolean moreAggregates() { return moreAggregates; }
        public void setMoreAggregates(boolean _v) { _dirty = true; moreAggregates = _v; }

        /**
         * Aggregate
         */
        public boolean aggregate() { return aggregate; }
        public void setAggregate(boolean _v) { _dirty = true; aggregate = _v; }

        /**
         * Duplicate RX
         */
        public boolean dupRx() { return dupRx; }
        public void setDupRx(boolean _v) { _dirty = true; dupRx = _v; }

        /**
         * RX short guard interval (SGI)
         */
        public boolean rxShortGuard() { return rxShortGuard; }
        public void setRxShortGuard(boolean _v) { _dirty = true; rxShortGuard = _v; }

        /**
         * true = HT40, false = HT20
         */
        public boolean isHt40() { return isHt40; }
        public void setIsHt40(boolean _v) { _dirty = true; isHt40 = _v; }

        /**
         * Greenfield
         */
        public boolean greenfield() { return greenfield; }
        public void setGreenfield(boolean _v) { _dirty = true; greenfield = _v; }
        public byte[] unused2() { return unused2; }
        public void setUnused2(byte[] _v) { _dirty = true; unused2 = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
     */
    public static class PacketPpiField extends KaitaiStruct.ReadWrite {
        public static PacketPpiField fromFile(String fileName) throws IOException {
            return new PacketPpiField(new ByteBufferKaitaiStream(fileName));
        }
        public PacketPpiField() {
            this(null, null, null);
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
        }
        public void _read() {
            this.pfhType = PacketPpi.PfhType.byId(this._io.readU2le());
            this.pfhDatalen = this._io.readU2le();
            {
                PfhType on = pfhType();
                if (on != null) {
                    switch (pfhType()) {
                    case RADIO_802_11_COMMON: {
                        this._raw_body = this._io.readBytes(pfhDatalen());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Radio80211CommonBody(_io__raw_body, this, _root);
                        ((Radio80211CommonBody) (this.body))._read();
                        break;
                    }
                    case RADIO_802_11N_MAC_EXT: {
                        this._raw_body = this._io.readBytes(pfhDatalen());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Radio80211nMacExtBody(_io__raw_body, this, _root);
                        ((Radio80211nMacExtBody) (this.body))._read();
                        break;
                    }
                    case RADIO_802_11N_MAC_PHY_EXT: {
                        this._raw_body = this._io.readBytes(pfhDatalen());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Radio80211nMacPhyExtBody(_io__raw_body, this, _root);
                        ((Radio80211nMacPhyExtBody) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(pfhDatalen());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(pfhDatalen());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                PfhType on = pfhType();
                if (on != null) {
                    switch (pfhType()) {
                    case RADIO_802_11_COMMON: {
                        ((Radio80211CommonBody) (this.body))._fetchInstances();
                        break;
                    }
                    case RADIO_802_11N_MAC_EXT: {
                        ((Radio80211nMacExtBody) (this.body))._fetchInstances();
                        break;
                    }
                    case RADIO_802_11N_MAC_PHY_EXT: {
                        ((Radio80211nMacPhyExtBody) (this.body))._fetchInstances();
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
            this._io.writeU2le(((Number) (this.pfhType.id())).intValue());
            this._io.writeU2le(this.pfhDatalen);
            {
                PfhType on = pfhType();
                if (on != null) {
                    switch (pfhType()) {
                    case RADIO_802_11_COMMON: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(pfhDatalen());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (pfhDatalen()));
                            final PacketPpiField _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != pfhDatalen())
                                        throw new ConsistencyError("raw(body)", pfhDatalen(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Radio80211CommonBody) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case RADIO_802_11N_MAC_EXT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(pfhDatalen());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (pfhDatalen()));
                            final PacketPpiField _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != pfhDatalen())
                                        throw new ConsistencyError("raw(body)", pfhDatalen(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Radio80211nMacExtBody) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case RADIO_802_11N_MAC_PHY_EXT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(pfhDatalen());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (pfhDatalen()));
                            final PacketPpiField _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != pfhDatalen())
                                        throw new ConsistencyError("raw(body)", pfhDatalen(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Radio80211nMacPhyExtBody) (this.body))._write_Seq(_io__raw_body);
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
                PfhType on = pfhType();
                if (on != null) {
                    switch (pfhType()) {
                    case RADIO_802_11_COMMON: {
                        if (!Objects.equals(((PacketPpi.Radio80211CommonBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((PacketPpi.Radio80211CommonBody) (this.body))._root());
                        if (!Objects.equals(((PacketPpi.Radio80211CommonBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((PacketPpi.Radio80211CommonBody) (this.body))._parent());
                        break;
                    }
                    case RADIO_802_11N_MAC_EXT: {
                        if (!Objects.equals(((PacketPpi.Radio80211nMacExtBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((PacketPpi.Radio80211nMacExtBody) (this.body))._root());
                        if (!Objects.equals(((PacketPpi.Radio80211nMacExtBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((PacketPpi.Radio80211nMacExtBody) (this.body))._parent());
                        break;
                    }
                    case RADIO_802_11N_MAC_PHY_EXT: {
                        if (!Objects.equals(((PacketPpi.Radio80211nMacPhyExtBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((PacketPpi.Radio80211nMacPhyExtBody) (this.body))._root());
                        if (!Objects.equals(((PacketPpi.Radio80211nMacPhyExtBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((PacketPpi.Radio80211nMacPhyExtBody) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != pfhDatalen())
                            throw new ConsistencyError("body", pfhDatalen(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != pfhDatalen())
                        throw new ConsistencyError("body", pfhDatalen(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }
        private PfhType pfhType;
        private int pfhDatalen;
        private Object body;
        private PacketPpi _root;
        private PacketPpi.PacketPpiFields _parent;
        private byte[] _raw_body;
        public PfhType pfhType() { return pfhType; }
        public void setPfhType(PfhType _v) { _dirty = true; pfhType = _v; }
        public int pfhDatalen() { return pfhDatalen; }
        public void setPfhDatalen(int _v) { _dirty = true; pfhDatalen = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public PacketPpi.PacketPpiFields _parent() { return _parent; }
        public void set_parent(PacketPpi.PacketPpiFields _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class PacketPpiFields extends KaitaiStruct.ReadWrite {
        public static PacketPpiFields fromFile(String fileName) throws IOException {
            return new PacketPpiFields(new ByteBufferKaitaiStream(fileName));
        }
        public PacketPpiFields() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<PacketPpiField>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    PacketPpiField _t_entries = new PacketPpiField(this._io, this, _root);
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
        private List<PacketPpiField> entries;
        private PacketPpi _root;
        private PacketPpi _parent;
        public List<PacketPpiField> entries() { return entries; }
        public void setEntries(List<PacketPpiField> _v) { _dirty = true; entries = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public PacketPpi _parent() { return _parent; }
        public void set_parent(PacketPpi _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
     */
    public static class PacketPpiHeader extends KaitaiStruct.ReadWrite {
        public static PacketPpiHeader fromFile(String fileName) throws IOException {
            return new PacketPpiHeader(new ByteBufferKaitaiStream(fileName));
        }
        public PacketPpiHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.pphVersion = this._io.readU1();
            this.pphFlags = this._io.readU1();
            this.pphLen = this._io.readU2le();
            this.pphDlt = PacketPpi.Linktype.byId(this._io.readU4le());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.pphVersion);
            this._io.writeU1(this.pphFlags);
            this._io.writeU2le(this.pphLen);
            this._io.writeU4le(((Number) (this.pphDlt.id())).longValue());
        }

        public void _check() {
            _dirty = false;
        }
        private int pphVersion;
        private int pphFlags;
        private int pphLen;
        private Linktype pphDlt;
        private PacketPpi _root;
        private PacketPpi _parent;
        public int pphVersion() { return pphVersion; }
        public void setPphVersion(int _v) { _dirty = true; pphVersion = _v; }
        public int pphFlags() { return pphFlags; }
        public void setPphFlags(int _v) { _dirty = true; pphFlags = _v; }
        public int pphLen() { return pphLen; }
        public void setPphLen(int _v) { _dirty = true; pphLen = _v; }
        public Linktype pphDlt() { return pphDlt; }
        public void setPphDlt(Linktype _v) { _dirty = true; pphDlt = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public PacketPpi _parent() { return _parent; }
        public void set_parent(PacketPpi _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.2</a>
     */
    public static class Radio80211CommonBody extends KaitaiStruct.ReadWrite {
        public static Radio80211CommonBody fromFile(String fileName) throws IOException {
            return new Radio80211CommonBody(new ByteBufferKaitaiStream(fileName));
        }
        public Radio80211CommonBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.tsfTimer = this._io.readU8le();
            this.flags = this._io.readU2le();
            this.rate = this._io.readU2le();
            this.channelFreq = this._io.readU2le();
            this.channelFlags = this._io.readU2le();
            this.fhssHopset = this._io.readU1();
            this.fhssPattern = this._io.readU1();
            this.dbmAntsignal = this._io.readS1();
            this.dbmAntnoise = this._io.readS1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.tsfTimer);
            this._io.writeU2le(this.flags);
            this._io.writeU2le(this.rate);
            this._io.writeU2le(this.channelFreq);
            this._io.writeU2le(this.channelFlags);
            this._io.writeU1(this.fhssHopset);
            this._io.writeU1(this.fhssPattern);
            this._io.writeS1(this.dbmAntsignal);
            this._io.writeS1(this.dbmAntnoise);
        }

        public void _check() {
            _dirty = false;
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
        public void setTsfTimer(long _v) { _dirty = true; tsfTimer = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int rate() { return rate; }
        public void setRate(int _v) { _dirty = true; rate = _v; }
        public int channelFreq() { return channelFreq; }
        public void setChannelFreq(int _v) { _dirty = true; channelFreq = _v; }
        public int channelFlags() { return channelFlags; }
        public void setChannelFlags(int _v) { _dirty = true; channelFlags = _v; }
        public int fhssHopset() { return fhssHopset; }
        public void setFhssHopset(int _v) { _dirty = true; fhssHopset = _v; }
        public int fhssPattern() { return fhssPattern; }
        public void setFhssPattern(int _v) { _dirty = true; fhssPattern = _v; }
        public byte dbmAntsignal() { return dbmAntsignal; }
        public void setDbmAntsignal(byte _v) { _dirty = true; dbmAntsignal = _v; }
        public byte dbmAntnoise() { return dbmAntnoise; }
        public void setDbmAntnoise(byte _v) { _dirty = true; dbmAntnoise = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public PacketPpi.PacketPpiField _parent() { return _parent; }
        public void set_parent(PacketPpi.PacketPpiField _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.3</a>
     */
    public static class Radio80211nMacExtBody extends KaitaiStruct.ReadWrite {
        public static Radio80211nMacExtBody fromFile(String fileName) throws IOException {
            return new Radio80211nMacExtBody(new ByteBufferKaitaiStream(fileName));
        }
        public Radio80211nMacExtBody() {
            this(null, null, null);
        }

        public Radio80211nMacExtBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Radio80211nMacExtBody(KaitaiStream _io, PacketPpi.PacketPpiField _parent) {
            this(_io, _parent, null);
        }

        public Radio80211nMacExtBody(KaitaiStream _io, PacketPpi.PacketPpiField _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flags = new MacFlags(this._io, this, _root);
            this.flags._read();
            this.aMpduId = this._io.readU4le();
            this.numDelimiters = this._io.readU1();
            this.reserved = this._io.readBytes(3);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.aMpduId);
            this._io.writeU1(this.numDelimiters);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.reserved.length != 3)
                throw new ConsistencyError("reserved", 3, this.reserved.length);
            _dirty = false;
        }
        private MacFlags flags;
        private long aMpduId;
        private int numDelimiters;
        private byte[] reserved;
        private PacketPpi _root;
        private PacketPpi.PacketPpiField _parent;
        public MacFlags flags() { return flags; }
        public void setFlags(MacFlags _v) { _dirty = true; flags = _v; }
        public long aMpduId() { return aMpduId; }
        public void setAMpduId(long _v) { _dirty = true; aMpduId = _v; }
        public int numDelimiters() { return numDelimiters; }
        public void setNumDelimiters(int _v) { _dirty = true; numDelimiters = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public PacketPpi.PacketPpiField _parent() { return _parent; }
        public void set_parent(PacketPpi.PacketPpiField _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://web.archive.org/web/20090206112419/https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.4</a>
     */
    public static class Radio80211nMacPhyExtBody extends KaitaiStruct.ReadWrite {
        public static Radio80211nMacPhyExtBody fromFile(String fileName) throws IOException {
            return new Radio80211nMacPhyExtBody(new ByteBufferKaitaiStream(fileName));
        }
        public Radio80211nMacPhyExtBody() {
            this(null, null, null);
        }

        public Radio80211nMacPhyExtBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Radio80211nMacPhyExtBody(KaitaiStream _io, PacketPpi.PacketPpiField _parent) {
            this(_io, _parent, null);
        }

        public Radio80211nMacPhyExtBody(KaitaiStream _io, PacketPpi.PacketPpiField _parent, PacketPpi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flags = new MacFlags(this._io, this, _root);
            this.flags._read();
            this.aMpduId = this._io.readU4le();
            this.numDelimiters = this._io.readU1();
            this.mcs = this._io.readU1();
            this.numStreams = this._io.readU1();
            this.rssiCombined = this._io.readU1();
            this.rssiAntCtl = new ArrayList<Integer>();
            for (int i = 0; i < 4; i++) {
                this.rssiAntCtl.add(this._io.readU1());
            }
            this.rssiAntExt = new ArrayList<Integer>();
            for (int i = 0; i < 4; i++) {
                this.rssiAntExt.add(this._io.readU1());
            }
            this.extChannelFreq = this._io.readU2le();
            this.extChannelFlags = new ChannelFlags(this._io, this, _root);
            this.extChannelFlags._read();
            this.rfSignalNoise = new ArrayList<SignalNoise>();
            for (int i = 0; i < 4; i++) {
                SignalNoise _t_rfSignalNoise = new SignalNoise(this._io, this, _root);
                try {
                    _t_rfSignalNoise._read();
                } finally {
                    this.rfSignalNoise.add(_t_rfSignalNoise);
                }
            }
            this.evm = new ArrayList<Long>();
            for (int i = 0; i < 4; i++) {
                this.evm.add(this._io.readU4le());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            for (int i = 0; i < this.rssiAntCtl.size(); i++) {
            }
            for (int i = 0; i < this.rssiAntExt.size(); i++) {
            }
            this.extChannelFlags._fetchInstances();
            for (int i = 0; i < this.rfSignalNoise.size(); i++) {
                this.rfSignalNoise.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.evm.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.aMpduId);
            this._io.writeU1(this.numDelimiters);
            this._io.writeU1(this.mcs);
            this._io.writeU1(this.numStreams);
            this._io.writeU1(this.rssiCombined);
            for (int i = 0; i < this.rssiAntCtl.size(); i++) {
                this._io.writeU1(this.rssiAntCtl.get(((Number) (i)).intValue()));
            }
            for (int i = 0; i < this.rssiAntExt.size(); i++) {
                this._io.writeU1(this.rssiAntExt.get(((Number) (i)).intValue()));
            }
            this._io.writeU2le(this.extChannelFreq);
            this.extChannelFlags._write_Seq(this._io);
            for (int i = 0; i < this.rfSignalNoise.size(); i++) {
                this.rfSignalNoise.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            for (int i = 0; i < this.evm.size(); i++) {
                this._io.writeU4le(this.evm.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.rssiAntCtl.size() != 4)
                throw new ConsistencyError("rssi_ant_ctl", 4, this.rssiAntCtl.size());
            for (int i = 0; i < this.rssiAntCtl.size(); i++) {
            }
            if (this.rssiAntExt.size() != 4)
                throw new ConsistencyError("rssi_ant_ext", 4, this.rssiAntExt.size());
            for (int i = 0; i < this.rssiAntExt.size(); i++) {
            }
            if (!Objects.equals(this.extChannelFlags._root(), _root()))
                throw new ConsistencyError("ext_channel_flags", _root(), this.extChannelFlags._root());
            if (!Objects.equals(this.extChannelFlags._parent(), this))
                throw new ConsistencyError("ext_channel_flags", this, this.extChannelFlags._parent());
            if (this.rfSignalNoise.size() != 4)
                throw new ConsistencyError("rf_signal_noise", 4, this.rfSignalNoise.size());
            for (int i = 0; i < this.rfSignalNoise.size(); i++) {
                if (!Objects.equals(this.rfSignalNoise.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("rf_signal_noise", _root(), this.rfSignalNoise.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.rfSignalNoise.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("rf_signal_noise", this, this.rfSignalNoise.get(((Number) (i)).intValue())._parent());
            }
            if (this.evm.size() != 4)
                throw new ConsistencyError("evm", 4, this.evm.size());
            for (int i = 0; i < this.evm.size(); i++) {
            }
            _dirty = false;
        }
        public static class ChannelFlags extends KaitaiStruct.ReadWrite {
            public static ChannelFlags fromFile(String fileName) throws IOException {
                return new ChannelFlags(new ByteBufferKaitaiStream(fileName));
            }
            public ChannelFlags() {
                this(null, null, null);
            }

            public ChannelFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ChannelFlags(KaitaiStream _io, PacketPpi.Radio80211nMacPhyExtBody _parent) {
                this(_io, _parent, null);
            }

            public ChannelFlags(KaitaiStream _io, PacketPpi.Radio80211nMacPhyExtBody _parent, PacketPpi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.spectrum2ghz = this._io.readBitsIntBe(1) != 0;
                this.ofdm = this._io.readBitsIntBe(1) != 0;
                this.cck = this._io.readBitsIntBe(1) != 0;
                this.turbo = this._io.readBitsIntBe(1) != 0;
                this.unused = this._io.readBitsIntBe(8);
                this.gfsk = this._io.readBitsIntBe(1) != 0;
                this.dynCckOfdm = this._io.readBitsIntBe(1) != 0;
                this.onlyPassiveScan = this._io.readBitsIntBe(1) != 0;
                this.spectrum5ghz = this._io.readBitsIntBe(1) != 0;
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.spectrum2ghz ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.ofdm ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.cck ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.turbo ? 1 : 0));
                this._io.writeBitsIntBe(8, this.unused);
                this._io.writeBitsIntBe(1, (this.gfsk ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.dynCckOfdm ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.onlyPassiveScan ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.spectrum5ghz ? 1 : 0));
            }

            public void _check() {
                _dirty = false;
            }
            private boolean spectrum2ghz;
            private boolean ofdm;
            private boolean cck;
            private boolean turbo;
            private long unused;
            private boolean gfsk;
            private boolean dynCckOfdm;
            private boolean onlyPassiveScan;
            private boolean spectrum5ghz;
            private PacketPpi _root;
            private PacketPpi.Radio80211nMacPhyExtBody _parent;

            /**
             * 2 GHz spectrum
             */
            public boolean spectrum2ghz() { return spectrum2ghz; }
            public void setSpectrum2ghz(boolean _v) { _dirty = true; spectrum2ghz = _v; }

            /**
             * OFDM (Orthogonal Frequency-Division Multiplexing)
             */
            public boolean ofdm() { return ofdm; }
            public void setOfdm(boolean _v) { _dirty = true; ofdm = _v; }

            /**
             * CCK (Complementary Code Keying)
             */
            public boolean cck() { return cck; }
            public void setCck(boolean _v) { _dirty = true; cck = _v; }
            public boolean turbo() { return turbo; }
            public void setTurbo(boolean _v) { _dirty = true; turbo = _v; }
            public long unused() { return unused; }
            public void setUnused(long _v) { _dirty = true; unused = _v; }

            /**
             * Gaussian Frequency Shift Keying
             */
            public boolean gfsk() { return gfsk; }
            public void setGfsk(boolean _v) { _dirty = true; gfsk = _v; }

            /**
             * Dynamic CCK-OFDM
             */
            public boolean dynCckOfdm() { return dynCckOfdm; }
            public void setDynCckOfdm(boolean _v) { _dirty = true; dynCckOfdm = _v; }

            /**
             * Only passive scan allowed
             */
            public boolean onlyPassiveScan() { return onlyPassiveScan; }
            public void setOnlyPassiveScan(boolean _v) { _dirty = true; onlyPassiveScan = _v; }

            /**
             * 5 GHz spectrum
             */
            public boolean spectrum5ghz() { return spectrum5ghz; }
            public void setSpectrum5ghz(boolean _v) { _dirty = true; spectrum5ghz = _v; }
            public PacketPpi _root() { return _root; }
            public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
            public PacketPpi.Radio80211nMacPhyExtBody _parent() { return _parent; }
            public void set_parent(PacketPpi.Radio80211nMacPhyExtBody _v) { _dirty = true; _parent = _v; }
        }

        /**
         * RF signal + noise pair at a single antenna
         */
        public static class SignalNoise extends KaitaiStruct.ReadWrite {
            public static SignalNoise fromFile(String fileName) throws IOException {
                return new SignalNoise(new ByteBufferKaitaiStream(fileName));
            }
            public SignalNoise() {
                this(null, null, null);
            }

            public SignalNoise(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SignalNoise(KaitaiStream _io, PacketPpi.Radio80211nMacPhyExtBody _parent) {
                this(_io, _parent, null);
            }

            public SignalNoise(KaitaiStream _io, PacketPpi.Radio80211nMacPhyExtBody _parent, PacketPpi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.signal = this._io.readS1();
                this.noise = this._io.readS1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeS1(this.signal);
                this._io.writeS1(this.noise);
            }

            public void _check() {
                _dirty = false;
            }
            private byte signal;
            private byte noise;
            private PacketPpi _root;
            private PacketPpi.Radio80211nMacPhyExtBody _parent;

            /**
             * RF signal, dBm
             */
            public byte signal() { return signal; }
            public void setSignal(byte _v) { _dirty = true; signal = _v; }

            /**
             * RF noise, dBm
             */
            public byte noise() { return noise; }
            public void setNoise(byte _v) { _dirty = true; noise = _v; }
            public PacketPpi _root() { return _root; }
            public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
            public PacketPpi.Radio80211nMacPhyExtBody _parent() { return _parent; }
            public void set_parent(PacketPpi.Radio80211nMacPhyExtBody _v) { _dirty = true; _parent = _v; }
        }
        private MacFlags flags;
        private long aMpduId;
        private int numDelimiters;
        private int mcs;
        private int numStreams;
        private int rssiCombined;
        private List<Integer> rssiAntCtl;
        private List<Integer> rssiAntExt;
        private int extChannelFreq;
        private ChannelFlags extChannelFlags;
        private List<SignalNoise> rfSignalNoise;
        private List<Long> evm;
        private PacketPpi _root;
        private PacketPpi.PacketPpiField _parent;
        public MacFlags flags() { return flags; }
        public void setFlags(MacFlags _v) { _dirty = true; flags = _v; }
        public long aMpduId() { return aMpduId; }
        public void setAMpduId(long _v) { _dirty = true; aMpduId = _v; }
        public int numDelimiters() { return numDelimiters; }
        public void setNumDelimiters(int _v) { _dirty = true; numDelimiters = _v; }

        /**
         * Modulation Coding Scheme (MCS)
         */
        public int mcs() { return mcs; }
        public void setMcs(int _v) { _dirty = true; mcs = _v; }

        /**
         * Number of spatial streams (0 = unknown)
         */
        public int numStreams() { return numStreams; }
        public void setNumStreams(int _v) { _dirty = true; numStreams = _v; }

        /**
         * RSSI (Received Signal Strength Indication), combined from all active antennas / channels
         */
        public int rssiCombined() { return rssiCombined; }
        public void setRssiCombined(int _v) { _dirty = true; rssiCombined = _v; }

        /**
         * RSSI (Received Signal Strength Indication) for antennas 0-3, control channel
         */
        public List<Integer> rssiAntCtl() { return rssiAntCtl; }
        public void setRssiAntCtl(List<Integer> _v) { _dirty = true; rssiAntCtl = _v; }

        /**
         * RSSI (Received Signal Strength Indication) for antennas 0-3, extension channel
         */
        public List<Integer> rssiAntExt() { return rssiAntExt; }
        public void setRssiAntExt(List<Integer> _v) { _dirty = true; rssiAntExt = _v; }

        /**
         * Extension channel frequency (MHz)
         */
        public int extChannelFreq() { return extChannelFreq; }
        public void setExtChannelFreq(int _v) { _dirty = true; extChannelFreq = _v; }

        /**
         * Extension channel flags
         */
        public ChannelFlags extChannelFlags() { return extChannelFlags; }
        public void setExtChannelFlags(ChannelFlags _v) { _dirty = true; extChannelFlags = _v; }

        /**
         * Signal + noise values for antennas 0-3
         */
        public List<SignalNoise> rfSignalNoise() { return rfSignalNoise; }
        public void setRfSignalNoise(List<SignalNoise> _v) { _dirty = true; rfSignalNoise = _v; }

        /**
         * EVM (Error Vector Magnitude) for chains 0-3
         */
        public List<Long> evm() { return evm; }
        public void setEvm(List<Long> _v) { _dirty = true; evm = _v; }
        public PacketPpi _root() { return _root; }
        public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
        public PacketPpi.PacketPpiField _parent() { return _parent; }
        public void set_parent(PacketPpi.PacketPpiField _v) { _dirty = true; _parent = _v; }
    }
    private PacketPpiHeader header;
    private PacketPpiFields fields;
    private Object body;
    private PacketPpi _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_fields;
    private byte[] _raw_body;
    public PacketPpiHeader header() { return header; }
    public void setHeader(PacketPpiHeader _v) { _dirty = true; header = _v; }
    public PacketPpiFields fields() { return fields; }
    public void setFields(PacketPpiFields _v) { _dirty = true; fields = _v; }
    public Object body() { return body; }
    public void setBody(Object _v) { _dirty = true; body = _v; }
    public PacketPpi _root() { return _root; }
    public void set_root(PacketPpi _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_fields() { return _raw_fields; }
    public void set_raw_Fields(byte[] _v) { _dirty = true; _raw_fields = _v; }
    public byte[] _raw_body() { return _raw_body; }
    public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
}
