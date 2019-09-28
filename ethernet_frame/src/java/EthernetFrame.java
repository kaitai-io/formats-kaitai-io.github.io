// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;


/**
 * Ethernet frame is a OSI data link layer (layer 2) protocol data unit
 * for Ethernet networks. In practice, many other networks and/or
 * in-file dumps adopted the same format for encapsulation purposes.
 * @see <a href="https://ieeexplore.ieee.org/document/7428776">Source</a>
 */
public class EthernetFrame extends KaitaiStruct {
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
        IPV6(34525);

        private final long id;
        EtherTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, EtherTypeEnum> byId = new HashMap<Long, EtherTypeEnum>(8);
        static {
            for (EtherTypeEnum e : EtherTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static EtherTypeEnum byId(long id) { return byId.get(id); }
    }

    public EthernetFrame(KaitaiStream _io) {
        this(_io, null, null);
    }

    public EthernetFrame(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public EthernetFrame(KaitaiStream _io, KaitaiStruct _parent, EthernetFrame _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.dstMac = this._io.readBytes(6);
        this.srcMac = this._io.readBytes(6);
        this.etherType = EtherTypeEnum.byId(this._io.readU2be());
        {
            EtherTypeEnum on = etherType();
            if (on != null) {
                switch (etherType()) {
                case IPV4: {
                    this._raw_body = this._io.readBytesFull();
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new Ipv4Packet(_io__raw_body);
                    break;
                }
                case IPV6: {
                    this._raw_body = this._io.readBytesFull();
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new Ipv6Packet(_io__raw_body);
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
    }
    private byte[] dstMac;
    private byte[] srcMac;
    private EtherTypeEnum etherType;
    private Object body;
    private EthernetFrame _root;
    private KaitaiStruct _parent;
    private byte[] _raw_body;

    /**
     * Destination MAC address.
     */
    public byte[] dstMac() { return dstMac; }

    /**
     * Source MAC address.
     */
    public byte[] srcMac() { return srcMac; }
    public EtherTypeEnum etherType() { return etherType; }
    public Object body() { return body; }
    public EthernetFrame _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_body() { return _raw_body; }
}
