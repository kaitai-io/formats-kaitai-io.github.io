// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


/**
 * (No support for Auth-Name + Add-Name for simplicity)
 */
public class DnsPacket extends KaitaiStruct {
    public static DnsPacket fromFile(String fileName) throws IOException {
        return new DnsPacket(new ByteBufferKaitaiStream(fileName));
    }

    public enum ClassType {
        IN_CLASS(1),
        CS(2),
        CH(3),
        HS(4);

        private final long id;
        ClassType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ClassType> byId = new HashMap<Long, ClassType>(4);
        static {
            for (ClassType e : ClassType.values())
                byId.put(e.id(), e);
        }
        public static ClassType byId(long id) { return byId.get(id); }
    }

    public enum TypeType {
        A(1),
        NS(2),
        MD(3),
        MF(4),
        CNAME(5),
        SOA(6),
        MB(7),
        MG(8),
        MR(9),
        NULL(10),
        WKS(11),
        PTR(12),
        HINFO(13),
        MINFO(14),
        MX(15),
        TXT(16),
        AAAA(28),
        SRV(33);

        private final long id;
        TypeType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TypeType> byId = new HashMap<Long, TypeType>(18);
        static {
            for (TypeType e : TypeType.values())
                byId.put(e.id(), e);
        }
        public static TypeType byId(long id) { return byId.get(id); }
    }

    public DnsPacket(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DnsPacket(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DnsPacket(KaitaiStream _io, KaitaiStruct _parent, DnsPacket _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.transactionId = this._io.readU2be();
        this.flags = new PacketFlags(this._io, this, _root);
        if (flags().isOpcodeValid()) {
            this.qdcount = this._io.readU2be();
        }
        if (flags().isOpcodeValid()) {
            this.ancount = this._io.readU2be();
        }
        if (flags().isOpcodeValid()) {
            this.nscount = this._io.readU2be();
        }
        if (flags().isOpcodeValid()) {
            this.arcount = this._io.readU2be();
        }
        if (flags().isOpcodeValid()) {
            this.queries = new ArrayList<Query>();
            for (int i = 0; i < qdcount(); i++) {
                this.queries.add(new Query(this._io, this, _root));
            }
        }
        if (flags().isOpcodeValid()) {
            this.answers = new ArrayList<Answer>();
            for (int i = 0; i < ancount(); i++) {
                this.answers.add(new Answer(this._io, this, _root));
            }
        }
        if (flags().isOpcodeValid()) {
            this.authorities = new ArrayList<Answer>();
            for (int i = 0; i < nscount(); i++) {
                this.authorities.add(new Answer(this._io, this, _root));
            }
        }
        if (flags().isOpcodeValid()) {
            this.additionals = new ArrayList<Answer>();
            for (int i = 0; i < arcount(); i++) {
                this.additionals.add(new Answer(this._io, this, _root));
            }
        }
    }

    public void _fetchInstances() {
        this.flags._fetchInstances();
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.queries.size(); i++) {
                this.queries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.answers.size(); i++) {
                this.answers.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.authorities.size(); i++) {
                this.authorities.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.additionals.size(); i++) {
                this.additionals.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }
    public static class Address extends KaitaiStruct {
        public static Address fromFile(String fileName) throws IOException {
            return new Address(new ByteBufferKaitaiStream(fileName));
        }

        public Address(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Address(KaitaiStream _io, DnsPacket.Answer _parent) {
            this(_io, _parent, null);
        }

        public Address(KaitaiStream _io, DnsPacket.Answer _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ip = this._io.readBytes(4);
        }

        public void _fetchInstances() {
        }
        private byte[] ip;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public byte[] ip() { return ip; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Answer _parent() { return _parent; }
    }
    public static class AddressV6 extends KaitaiStruct {
        public static AddressV6 fromFile(String fileName) throws IOException {
            return new AddressV6(new ByteBufferKaitaiStream(fileName));
        }

        public AddressV6(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AddressV6(KaitaiStream _io, DnsPacket.Answer _parent) {
            this(_io, _parent, null);
        }

        public AddressV6(KaitaiStream _io, DnsPacket.Answer _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ipV6 = this._io.readBytes(16);
        }

        public void _fetchInstances() {
        }
        private byte[] ipV6;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public byte[] ipV6() { return ipV6; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Answer _parent() { return _parent; }
    }
    public static class Answer extends KaitaiStruct {
        public static Answer fromFile(String fileName) throws IOException {
            return new Answer(new ByteBufferKaitaiStream(fileName));
        }

        public Answer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Answer(KaitaiStream _io, DnsPacket _parent) {
            this(_io, _parent, null);
        }

        public Answer(KaitaiStream _io, DnsPacket _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new DomainName(this._io, this, _root);
            this.type = DnsPacket.TypeType.byId(this._io.readU2be());
            this.answerClass = DnsPacket.ClassType.byId(this._io.readU2be());
            this.ttl = this._io.readS4be();
            this.rdlength = this._io.readU2be();
            {
                TypeType on = type();
                if (on != null) {
                    switch (type()) {
                    case A: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new Address(_io_payload, this, _root);
                        break;
                    }
                    case AAAA: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new AddressV6(_io_payload, this, _root);
                        break;
                    }
                    case CNAME: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new DomainName(_io_payload, this, _root);
                        break;
                    }
                    case MX: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new MxInfo(_io_payload, this, _root);
                        break;
                    }
                    case NS: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new DomainName(_io_payload, this, _root);
                        break;
                    }
                    case PTR: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new DomainName(_io_payload, this, _root);
                        break;
                    }
                    case SOA: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new AuthorityInfo(_io_payload, this, _root);
                        break;
                    }
                    case SRV: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new Service(_io_payload, this, _root);
                        break;
                    }
                    case TXT: {
                        KaitaiStream _io_payload = this._io.substream(rdlength());
                        this.payload = new TxtBody(_io_payload, this, _root);
                        break;
                    }
                    default: {
                        this.payload = this._io.readBytes(rdlength());
                        break;
                    }
                    }
                } else {
                    this.payload = this._io.readBytes(rdlength());
                }
            }
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            {
                TypeType on = type();
                if (on != null) {
                    switch (type()) {
                    case A: {
                        ((Address) (this.payload))._fetchInstances();
                        break;
                    }
                    case AAAA: {
                        ((AddressV6) (this.payload))._fetchInstances();
                        break;
                    }
                    case CNAME: {
                        ((DomainName) (this.payload))._fetchInstances();
                        break;
                    }
                    case MX: {
                        ((MxInfo) (this.payload))._fetchInstances();
                        break;
                    }
                    case NS: {
                        ((DomainName) (this.payload))._fetchInstances();
                        break;
                    }
                    case PTR: {
                        ((DomainName) (this.payload))._fetchInstances();
                        break;
                    }
                    case SOA: {
                        ((AuthorityInfo) (this.payload))._fetchInstances();
                        break;
                    }
                    case SRV: {
                        ((Service) (this.payload))._fetchInstances();
                        break;
                    }
                    case TXT: {
                        ((TxtBody) (this.payload))._fetchInstances();
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
        private DomainName name;
        private TypeType type;
        private ClassType answerClass;
        private int ttl;
        private int rdlength;
        private Object payload;
        private DnsPacket _root;
        private DnsPacket _parent;
        public DomainName name() { return name; }
        public TypeType type() { return type; }
        public ClassType answerClass() { return answerClass; }

        /**
         * Time to live (in seconds)
         */
        public int ttl() { return ttl; }

        /**
         * Length in octets of the following payload
         */
        public int rdlength() { return rdlength; }
        public Object payload() { return payload; }
        public DnsPacket _root() { return _root; }
        public DnsPacket _parent() { return _parent; }
    }
    public static class AuthorityInfo extends KaitaiStruct {
        public static AuthorityInfo fromFile(String fileName) throws IOException {
            return new AuthorityInfo(new ByteBufferKaitaiStream(fileName));
        }

        public AuthorityInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AuthorityInfo(KaitaiStream _io, DnsPacket.Answer _parent) {
            this(_io, _parent, null);
        }

        public AuthorityInfo(KaitaiStream _io, DnsPacket.Answer _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.primaryNs = new DomainName(this._io, this, _root);
            this.resoponsibleMailbox = new DomainName(this._io, this, _root);
            this.serial = this._io.readU4be();
            this.refreshInterval = this._io.readU4be();
            this.retryInterval = this._io.readU4be();
            this.expireLimit = this._io.readU4be();
            this.minTtl = this._io.readU4be();
        }

        public void _fetchInstances() {
            this.primaryNs._fetchInstances();
            this.resoponsibleMailbox._fetchInstances();
        }
        private DomainName primaryNs;
        private DomainName resoponsibleMailbox;
        private long serial;
        private long refreshInterval;
        private long retryInterval;
        private long expireLimit;
        private long minTtl;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public DomainName primaryNs() { return primaryNs; }
        public DomainName resoponsibleMailbox() { return resoponsibleMailbox; }
        public long serial() { return serial; }
        public long refreshInterval() { return refreshInterval; }
        public long retryInterval() { return retryInterval; }
        public long expireLimit() { return expireLimit; }
        public long minTtl() { return minTtl; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Answer _parent() { return _parent; }
    }
    public static class DomainName extends KaitaiStruct {
        public static DomainName fromFile(String fileName) throws IOException {
            return new DomainName(new ByteBufferKaitaiStream(fileName));
        }

        public DomainName(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DomainName(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DomainName(KaitaiStream _io, KaitaiStruct _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new ArrayList<Label>();
            {
                Label _it;
                int i = 0;
                do {
                    _it = new Label(this._io, this, _root);
                    this.name.add(_it);
                    i++;
                } while (!( ((_it.length() == 0) || (_it.length() >= 192)) ));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.name.size(); i++) {
                this.name.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<Label> name;
        private DnsPacket _root;
        private KaitaiStruct _parent;

        /**
         * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
         */
        public List<Label> name() { return name; }
        public DnsPacket _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Label extends KaitaiStruct {
        public static Label fromFile(String fileName) throws IOException {
            return new Label(new ByteBufferKaitaiStream(fileName));
        }

        public Label(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Label(KaitaiStream _io, DnsPacket.DomainName _parent) {
            this(_io, _parent, null);
        }

        public Label(KaitaiStream _io, DnsPacket.DomainName _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.length = this._io.readU1();
            if (isPointer()) {
                this.pointer = new PointerStruct(this._io, this, _root);
            }
            if (!(isPointer())) {
                this.name = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
            }
        }

        public void _fetchInstances() {
            if (isPointer()) {
                this.pointer._fetchInstances();
            }
            if (!(isPointer())) {
            }
        }
        private Boolean isPointer;
        public Boolean isPointer() {
            if (this.isPointer != null)
                return this.isPointer;
            this.isPointer = length() >= 192;
            return this.isPointer;
        }
        private int length;
        private PointerStruct pointer;
        private String name;
        private DnsPacket _root;
        private DnsPacket.DomainName _parent;

        /**
         * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
         */
        public int length() { return length; }
        public PointerStruct pointer() { return pointer; }

        /**
         * Otherwise its a string the length of the length value
         */
        public String name() { return name; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.DomainName _parent() { return _parent; }
    }
    public static class MxInfo extends KaitaiStruct {
        public static MxInfo fromFile(String fileName) throws IOException {
            return new MxInfo(new ByteBufferKaitaiStream(fileName));
        }

        public MxInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MxInfo(KaitaiStream _io, DnsPacket.Answer _parent) {
            this(_io, _parent, null);
        }

        public MxInfo(KaitaiStream _io, DnsPacket.Answer _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.preference = this._io.readU2be();
            this.mx = new DomainName(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.mx._fetchInstances();
        }
        private int preference;
        private DomainName mx;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public int preference() { return preference; }
        public DomainName mx() { return mx; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Answer _parent() { return _parent; }
    }
    public static class PacketFlags extends KaitaiStruct {
        public static PacketFlags fromFile(String fileName) throws IOException {
            return new PacketFlags(new ByteBufferKaitaiStream(fileName));
        }

        public PacketFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketFlags(KaitaiStream _io, DnsPacket _parent) {
            this(_io, _parent, null);
        }

        public PacketFlags(KaitaiStream _io, DnsPacket _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.flag = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private Integer aa;
        public Integer aa() {
            if (this.aa != null)
                return this.aa;
            this.aa = ((Number) ((flag() & 1024) >> 10)).intValue();
            return this.aa;
        }
        private Integer ad;
        public Integer ad() {
            if (this.ad != null)
                return this.ad;
            this.ad = ((Number) ((flag() & 32) >> 5)).intValue();
            return this.ad;
        }
        private Integer cd;
        public Integer cd() {
            if (this.cd != null)
                return this.cd;
            this.cd = ((Number) ((flag() & 16) >> 4)).intValue();
            return this.cd;
        }
        private Boolean isOpcodeValid;
        public Boolean isOpcodeValid() {
            if (this.isOpcodeValid != null)
                return this.isOpcodeValid;
            this.isOpcodeValid =  ((opcode() == 0) || (opcode() == 1) || (opcode() == 2)) ;
            return this.isOpcodeValid;
        }
        private Integer opcode;
        public Integer opcode() {
            if (this.opcode != null)
                return this.opcode;
            this.opcode = ((Number) ((flag() & 30720) >> 11)).intValue();
            return this.opcode;
        }
        private Integer qr;
        public Integer qr() {
            if (this.qr != null)
                return this.qr;
            this.qr = ((Number) ((flag() & 32768) >> 15)).intValue();
            return this.qr;
        }
        private Integer ra;
        public Integer ra() {
            if (this.ra != null)
                return this.ra;
            this.ra = ((Number) ((flag() & 128) >> 7)).intValue();
            return this.ra;
        }
        private Integer rcode;
        public Integer rcode() {
            if (this.rcode != null)
                return this.rcode;
            this.rcode = ((Number) ((flag() & 15) >> 0)).intValue();
            return this.rcode;
        }
        private Integer rd;
        public Integer rd() {
            if (this.rd != null)
                return this.rd;
            this.rd = ((Number) ((flag() & 256) >> 8)).intValue();
            return this.rd;
        }
        private Integer tc;
        public Integer tc() {
            if (this.tc != null)
                return this.tc;
            this.tc = ((Number) ((flag() & 512) >> 9)).intValue();
            return this.tc;
        }
        private Integer z;
        public Integer z() {
            if (this.z != null)
                return this.z;
            this.z = ((Number) ((flag() & 64) >> 6)).intValue();
            return this.z;
        }
        private int flag;
        private DnsPacket _root;
        private DnsPacket _parent;
        public int flag() { return flag; }
        public DnsPacket _root() { return _root; }
        public DnsPacket _parent() { return _parent; }
    }
    public static class PointerStruct extends KaitaiStruct {
        public static PointerStruct fromFile(String fileName) throws IOException {
            return new PointerStruct(new ByteBufferKaitaiStream(fileName));
        }

        public PointerStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PointerStruct(KaitaiStream _io, DnsPacket.Label _parent) {
            this(_io, _parent, null);
        }

        public PointerStruct(KaitaiStream _io, DnsPacket.Label _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = this._io.readU1();
        }

        public void _fetchInstances() {
            contents();
            if (this.contents != null) {
                this.contents._fetchInstances();
            }
        }
        private DomainName contents;
        public DomainName contents() {
            if (this.contents != null)
                return this.contents;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(value() + (_parent().length() - 192 << 8));
            this.contents = new DomainName(io, this, _root);
            io.seek(_pos);
            return this.contents;
        }
        private int value;
        private DnsPacket _root;
        private DnsPacket.Label _parent;

        /**
         * Read one byte, then offset to that position, read one domain-name and return
         */
        public int value() { return value; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Label _parent() { return _parent; }
    }
    public static class Query extends KaitaiStruct {
        public static Query fromFile(String fileName) throws IOException {
            return new Query(new ByteBufferKaitaiStream(fileName));
        }

        public Query(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Query(KaitaiStream _io, DnsPacket _parent) {
            this(_io, _parent, null);
        }

        public Query(KaitaiStream _io, DnsPacket _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new DomainName(this._io, this, _root);
            this.type = DnsPacket.TypeType.byId(this._io.readU2be());
            this.queryClass = DnsPacket.ClassType.byId(this._io.readU2be());
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
        }
        private DomainName name;
        private TypeType type;
        private ClassType queryClass;
        private DnsPacket _root;
        private DnsPacket _parent;
        public DomainName name() { return name; }
        public TypeType type() { return type; }
        public ClassType queryClass() { return queryClass; }
        public DnsPacket _root() { return _root; }
        public DnsPacket _parent() { return _parent; }
    }
    public static class Service extends KaitaiStruct {
        public static Service fromFile(String fileName) throws IOException {
            return new Service(new ByteBufferKaitaiStream(fileName));
        }

        public Service(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Service(KaitaiStream _io, DnsPacket.Answer _parent) {
            this(_io, _parent, null);
        }

        public Service(KaitaiStream _io, DnsPacket.Answer _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.priority = this._io.readU2be();
            this.weight = this._io.readU2be();
            this.port = this._io.readU2be();
            this.target = new DomainName(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.target._fetchInstances();
        }
        private int priority;
        private int weight;
        private int port;
        private DomainName target;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public int priority() { return priority; }
        public int weight() { return weight; }
        public int port() { return port; }
        public DomainName target() { return target; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Answer _parent() { return _parent; }
    }
    public static class Txt extends KaitaiStruct {
        public static Txt fromFile(String fileName) throws IOException {
            return new Txt(new ByteBufferKaitaiStream(fileName));
        }

        public Txt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Txt(KaitaiStream _io, DnsPacket.TxtBody _parent) {
            this(_io, _parent, null);
        }

        public Txt(KaitaiStream _io, DnsPacket.TxtBody _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.length = this._io.readU1();
            this.text = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private int length;
        private String text;
        private DnsPacket _root;
        private DnsPacket.TxtBody _parent;
        public int length() { return length; }
        public String text() { return text; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.TxtBody _parent() { return _parent; }
    }
    public static class TxtBody extends KaitaiStruct {
        public static TxtBody fromFile(String fileName) throws IOException {
            return new TxtBody(new ByteBufferKaitaiStream(fileName));
        }

        public TxtBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TxtBody(KaitaiStream _io, DnsPacket.Answer _parent) {
            this(_io, _parent, null);
        }

        public TxtBody(KaitaiStream _io, DnsPacket.Answer _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.data = new ArrayList<Txt>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.data.add(new Txt(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.data.size(); i++) {
                this.data.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<Txt> data;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public List<Txt> data() { return data; }
        public DnsPacket _root() { return _root; }
        public DnsPacket.Answer _parent() { return _parent; }
    }
    private int transactionId;
    private PacketFlags flags;
    private Integer qdcount;
    private Integer ancount;
    private Integer nscount;
    private Integer arcount;
    private List<Query> queries;
    private List<Answer> answers;
    private List<Answer> authorities;
    private List<Answer> additionals;
    private DnsPacket _root;
    private KaitaiStruct _parent;

    /**
     * ID to keep track of request/responces
     */
    public int transactionId() { return transactionId; }
    public PacketFlags flags() { return flags; }

    /**
     * How many questions are there
     */
    public Integer qdcount() { return qdcount; }

    /**
     * Number of resource records answering the question
     */
    public Integer ancount() { return ancount; }

    /**
     * Number of resource records pointing toward an authority
     */
    public Integer nscount() { return nscount; }

    /**
     * Number of resource records holding additional information
     */
    public Integer arcount() { return arcount; }
    public List<Query> queries() { return queries; }
    public List<Answer> answers() { return answers; }
    public List<Answer> authorities() { return authorities; }
    public List<Answer> additionals() { return additionals; }
    public DnsPacket _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
