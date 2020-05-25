// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


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
        SOE(6),
        MB(7),
        MG(8),
        MR(9),
        NULL(10),
        WKS(11),
        PTR(12),
        HINFO(13),
        MINFO(14),
        MX(15),
        TXT(16);

        private final long id;
        TypeType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TypeType> byId = new HashMap<Long, TypeType>(16);
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
            queries = new ArrayList<Query>((int) (qdcount()));
            for (int i = 0; i < qdcount(); i++) {
                this.queries.add(new Query(this._io, this, _root));
            }
        }
        if (flags().isOpcodeValid()) {
            answers = new ArrayList<Answer>((int) (ancount()));
            for (int i = 0; i < ancount(); i++) {
                this.answers.add(new Answer(this._io, this, _root));
            }
        }
        if (flags().isOpcodeValid()) {
            additionals = new ArrayList<Answer>((int) (arcount()));
            for (int i = 0; i < arcount(); i++) {
                this.additionals.add(new Answer(this._io, this, _root));
            }
        }
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
        private DomainName contents;
        public DomainName contents() {
            if (this.contents != null)
                return this.contents;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(value());
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
                this.name = new String(this._io.readBytes(length()), Charset.forName("ASCII"));
            }
        }
        private Boolean isPointer;
        public Boolean isPointer() {
            if (this.isPointer != null)
                return this.isPointer;
            boolean _tmp = (boolean) (length() == 192);
            this.isPointer = _tmp;
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
                } while (!( ((_it.length() == 0) || (_it.length() == 192)) ));
            }
        }
        private ArrayList<Label> name;
        private DnsPacket _root;
        private KaitaiStruct _parent;

        /**
         * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
         */
        public ArrayList<Label> name() { return name; }
        public DnsPacket _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
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
            ip = new ArrayList<Integer>((int) (4));
            for (int i = 0; i < 4; i++) {
                this.ip.add(this._io.readU1());
            }
        }
        private ArrayList<Integer> ip;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public ArrayList<Integer> ip() { return ip; }
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
            if (type() == DnsPacket.TypeType.PTR) {
                this.ptrdname = new DomainName(this._io, this, _root);
            }
            if (type() == DnsPacket.TypeType.A) {
                this.address = new Address(this._io, this, _root);
            }
        }
        private DomainName name;
        private TypeType type;
        private ClassType answerClass;
        private int ttl;
        private int rdlength;
        private DomainName ptrdname;
        private Address address;
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
        public DomainName ptrdname() { return ptrdname; }
        public Address address() { return address; }
        public DnsPacket _root() { return _root; }
        public DnsPacket _parent() { return _parent; }
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
        private Integer qr;
        public Integer qr() {
            if (this.qr != null)
                return this.qr;
            int _tmp = (int) (((flag() & 32768) >> 15));
            this.qr = _tmp;
            return this.qr;
        }
        private Integer ra;
        public Integer ra() {
            if (this.ra != null)
                return this.ra;
            int _tmp = (int) (((flag() & 128) >> 7));
            this.ra = _tmp;
            return this.ra;
        }
        private Integer tc;
        public Integer tc() {
            if (this.tc != null)
                return this.tc;
            int _tmp = (int) (((flag() & 512) >> 9));
            this.tc = _tmp;
            return this.tc;
        }
        private Boolean isOpcodeValid;
        public Boolean isOpcodeValid() {
            if (this.isOpcodeValid != null)
                return this.isOpcodeValid;
            boolean _tmp = (boolean) ( ((opcode() == 0) || (opcode() == 1) || (opcode() == 2)) );
            this.isOpcodeValid = _tmp;
            return this.isOpcodeValid;
        }
        private Integer rcode;
        public Integer rcode() {
            if (this.rcode != null)
                return this.rcode;
            int _tmp = (int) (((flag() & 15) >> 0));
            this.rcode = _tmp;
            return this.rcode;
        }
        private Integer opcode;
        public Integer opcode() {
            if (this.opcode != null)
                return this.opcode;
            int _tmp = (int) (((flag() & 30720) >> 11));
            this.opcode = _tmp;
            return this.opcode;
        }
        private Integer aa;
        public Integer aa() {
            if (this.aa != null)
                return this.aa;
            int _tmp = (int) (((flag() & 1024) >> 10));
            this.aa = _tmp;
            return this.aa;
        }
        private Integer z;
        public Integer z() {
            if (this.z != null)
                return this.z;
            int _tmp = (int) (((flag() & 64) >> 6));
            this.z = _tmp;
            return this.z;
        }
        private Integer rd;
        public Integer rd() {
            if (this.rd != null)
                return this.rd;
            int _tmp = (int) (((flag() & 256) >> 8));
            this.rd = _tmp;
            return this.rd;
        }
        private Integer cd;
        public Integer cd() {
            if (this.cd != null)
                return this.cd;
            int _tmp = (int) (((flag() & 16) >> 4));
            this.cd = _tmp;
            return this.cd;
        }
        private Integer ad;
        public Integer ad() {
            if (this.ad != null)
                return this.ad;
            int _tmp = (int) (((flag() & 32) >> 5));
            this.ad = _tmp;
            return this.ad;
        }
        private int flag;
        private DnsPacket _root;
        private DnsPacket _parent;
        public int flag() { return flag; }
        public DnsPacket _root() { return _root; }
        public DnsPacket _parent() { return _parent; }
    }
    private int transactionId;
    private PacketFlags flags;
    private Integer qdcount;
    private Integer ancount;
    private Integer nscount;
    private Integer arcount;
    private ArrayList<Query> queries;
    private ArrayList<Answer> answers;
    private ArrayList<Answer> additionals;
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
    public ArrayList<Query> queries() { return queries; }
    public ArrayList<Answer> answers() { return answers; }
    public ArrayList<Answer> additionals() { return additionals; }
    public DnsPacket _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
