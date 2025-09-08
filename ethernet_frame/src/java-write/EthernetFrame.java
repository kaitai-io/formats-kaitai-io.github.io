// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * Ethernet frame is a OSI data link layer (layer 2) protocol data unit
 * for Ethernet networks. In practice, many other networks and/or
 * in-file dumps adopted the same format for encapsulation purposes.
 * @see <a href="https://ieeexplore.ieee.org/document/7428776">Source</a>
 */
public class EthernetFrame extends KaitaiStruct.ReadWrite {
    public static EthernetFrame fromFile(String fileName) throws IOException {
        return new EthernetFrame(new ByteBufferKaitaiStream(fileName));
    }

    public enum EtherTypeEnum {
        IPV4(2048),
        X_75_INTERNET(2049),
        NBS_INTERNET(2050),
        ECMA_INTERNET(2051),
        CHAOSNET(2052),
        X_25_LEVEL_3(2053),
        ARP(2054),
        IEEE_802_1Q_TPID(33024),
        IPV6(34525);

        private final long id;
        EtherTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, EtherTypeEnum> byId = new HashMap<Long, EtherTypeEnum>(9);
        static {
            for (EtherTypeEnum e : EtherTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static EtherTypeEnum byId(long id) { return byId.get(id); }
    }
    public EthernetFrame() {
        this(null, null, null);
    }

    public EthernetFrame(KaitaiStream _io) {
        this(_io, null, null);
    }

    public EthernetFrame(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public EthernetFrame(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, EthernetFrame _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.dstMac = this._io.readBytes(6);
        this.srcMac = this._io.readBytes(6);
        this.etherType1 = EtherTypeEnum.byId(this._io.readU2be());
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
            this.tci = new TagControlInfo(this._io, this, _root);
            this.tci._read();
        }
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
            this.etherType2 = EtherTypeEnum.byId(this._io.readU2be());
        }
        {
            EtherTypeEnum on = etherType();
            if (on != null) {
                switch (etherType()) {
                case IPV4: {
                    this._raw_body = this._io.readBytesFull();
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new Ipv4Packet(_io__raw_body);
                    ((Ipv4Packet) (this.body))._read();
                    break;
                }
                case IPV6: {
                    this._raw_body = this._io.readBytesFull();
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new Ipv6Packet(_io__raw_body);
                    ((Ipv6Packet) (this.body))._read();
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
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
            this.tci._fetchInstances();
        }
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
        }
        {
            EtherTypeEnum on = etherType();
            if (on != null) {
                switch (etherType()) {
                case IPV4: {
                    ((Ipv4Packet) (this.body))._fetchInstances();
                    break;
                }
                case IPV6: {
                    ((Ipv6Packet) (this.body))._fetchInstances();
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
        this._io.writeBytes(this.dstMac);
        this._io.writeBytes(this.srcMac);
        this._io.writeU2be(((Number) (this.etherType1.id())).intValue());
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
            this.tci._write_Seq(this._io);
        }
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
            this._io.writeU2be(((Number) (this.etherType2.id())).intValue());
        }
        {
            EtherTypeEnum on = etherType();
            if (on != null) {
                switch (etherType()) {
                case IPV4: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                        final EthernetFrame _this = this;
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
                    ((Ipv4Packet) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case IPV6: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                        final EthernetFrame _this = this;
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
                    ((Ipv6Packet) (this.body))._write_Seq(_io__raw_body);
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
        if (this.dstMac.length != 6)
            throw new ConsistencyError("dst_mac", 6, this.dstMac.length);
        if (this.srcMac.length != 6)
            throw new ConsistencyError("src_mac", 6, this.srcMac.length);
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
            if (!Objects.equals(this.tci._root(), _root()))
                throw new ConsistencyError("tci", _root(), this.tci._root());
            if (!Objects.equals(this.tci._parent(), this))
                throw new ConsistencyError("tci", this, this.tci._parent());
        }
        if (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID) {
        }
        {
            EtherTypeEnum on = etherType();
            if (on != null) {
                switch (etherType()) {
                case IPV4: {
                    break;
                }
                case IPV6: {
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

    /**
     * Tag Control Information (TCI) is an extension of IEEE 802.1Q to
     * support VLANs on normal IEEE 802.3 Ethernet network.
     */
    public static class TagControlInfo extends KaitaiStruct.ReadWrite {
        public static TagControlInfo fromFile(String fileName) throws IOException {
            return new TagControlInfo(new ByteBufferKaitaiStream(fileName));
        }
        public TagControlInfo() {
            this(null, null, null);
        }

        public TagControlInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TagControlInfo(KaitaiStream _io, EthernetFrame _parent) {
            this(_io, _parent, null);
        }

        public TagControlInfo(KaitaiStream _io, EthernetFrame _parent, EthernetFrame _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.priority = this._io.readBitsIntBe(3);
            this.dropEligible = this._io.readBitsIntBe(1) != 0;
            this.vlanId = this._io.readBitsIntBe(12);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(3, this.priority);
            this._io.writeBitsIntBe(1, (this.dropEligible ? 1 : 0));
            this._io.writeBitsIntBe(12, this.vlanId);
        }

        public void _check() {
            _dirty = false;
        }
        private long priority;
        private boolean dropEligible;
        private long vlanId;
        private EthernetFrame _root;
        private EthernetFrame _parent;

        /**
         * Priority Code Point (PCP) is used to specify priority for
         * different kinds of traffic.
         */
        public long priority() { return priority; }
        public void setPriority(long _v) { _dirty = true; priority = _v; }

        /**
         * Drop Eligible Indicator (DEI) specifies if frame is eligible
         * to dropping while congestion is detected for certain classes
         * of traffic.
         */
        public boolean dropEligible() { return dropEligible; }
        public void setDropEligible(boolean _v) { _dirty = true; dropEligible = _v; }

        /**
         * VLAN Identifier (VID) specifies which VLAN this frame
         * belongs to.
         */
        public long vlanId() { return vlanId; }
        public void setVlanId(long _v) { _dirty = true; vlanId = _v; }
        public EthernetFrame _root() { return _root; }
        public void set_root(EthernetFrame _v) { _dirty = true; _root = _v; }
        public EthernetFrame _parent() { return _parent; }
        public void set_parent(EthernetFrame _v) { _dirty = true; _parent = _v; }
    }
    private EtherTypeEnum etherType;

    /**
     * Ether type can be specied in several places in the frame. If
     * first location bears special marker (0x8100), then it is not the
     * real ether frame yet, an additional payload (`tci`) is expected
     * and real ether type is upcoming next.
     */
    public EtherTypeEnum etherType() {
        if (this.etherType != null)
            return this.etherType;
        this.etherType = (etherType1() == EtherTypeEnum.IEEE_802_1Q_TPID ? etherType2() : etherType1());
        return this.etherType;
    }
    public void _invalidateEtherType() { this.etherType = null; }
    private byte[] dstMac;
    private byte[] srcMac;
    private EtherTypeEnum etherType1;
    private TagControlInfo tci;
    private EtherTypeEnum etherType2;
    private Object body;
    private EthernetFrame _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_body;

    /**
     * Destination MAC address
     */
    public byte[] dstMac() { return dstMac; }
    public void setDstMac(byte[] _v) { _dirty = true; dstMac = _v; }

    /**
     * Source MAC address
     */
    public byte[] srcMac() { return srcMac; }
    public void setSrcMac(byte[] _v) { _dirty = true; srcMac = _v; }

    /**
     * Either ether type or TPID if it is a IEEE 802.1Q frame
     */
    public EtherTypeEnum etherType1() { return etherType1; }
    public void setEtherType1(EtherTypeEnum _v) { _dirty = true; etherType1 = _v; }
    public TagControlInfo tci() { return tci; }
    public void setTci(TagControlInfo _v) { _dirty = true; tci = _v; }
    public EtherTypeEnum etherType2() { return etherType2; }
    public void setEtherType2(EtherTypeEnum _v) { _dirty = true; etherType2 = _v; }
    public Object body() { return body; }
    public void setBody(Object _v) { _dirty = true; body = _v; }
    public EthernetFrame _root() { return _root; }
    public void set_root(EthernetFrame _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_body() { return _raw_body; }
    public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
}
