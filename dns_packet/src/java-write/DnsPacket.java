// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * (No support for Auth-Name + Add-Name for simplicity)
 */
public class DnsPacket extends KaitaiStruct.ReadWrite {
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
    public DnsPacket() {
        this(null, null, null);
    }

    public DnsPacket(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DnsPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DnsPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DnsPacket _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.transactionId = this._io.readU2be();
        this.flags = new PacketFlags(this._io, this, _root);
        this.flags._read();
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
                Query _t_queries = new Query(this._io, this, _root);
                try {
                    _t_queries._read();
                } finally {
                    this.queries.add(_t_queries);
                }
            }
        }
        if (flags().isOpcodeValid()) {
            this.answers = new ArrayList<Answer>();
            for (int i = 0; i < ancount(); i++) {
                Answer _t_answers = new Answer(this._io, this, _root);
                try {
                    _t_answers._read();
                } finally {
                    this.answers.add(_t_answers);
                }
            }
        }
        if (flags().isOpcodeValid()) {
            this.authorities = new ArrayList<Answer>();
            for (int i = 0; i < nscount(); i++) {
                Answer _t_authorities = new Answer(this._io, this, _root);
                try {
                    _t_authorities._read();
                } finally {
                    this.authorities.add(_t_authorities);
                }
            }
        }
        if (flags().isOpcodeValid()) {
            this.additionals = new ArrayList<Answer>();
            for (int i = 0; i < arcount(); i++) {
                Answer _t_additionals = new Answer(this._io, this, _root);
                try {
                    _t_additionals._read();
                } finally {
                    this.additionals.add(_t_additionals);
                }
            }
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2be(this.transactionId);
        this.flags._write_Seq(this._io);
        if (flags().isOpcodeValid()) {
            this._io.writeU2be(this.qdcount);
        }
        if (flags().isOpcodeValid()) {
            this._io.writeU2be(this.ancount);
        }
        if (flags().isOpcodeValid()) {
            this._io.writeU2be(this.nscount);
        }
        if (flags().isOpcodeValid()) {
            this._io.writeU2be(this.arcount);
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.queries.size(); i++) {
                this.queries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.answers.size(); i++) {
                this.answers.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.authorities.size(); i++) {
                this.authorities.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
        if (flags().isOpcodeValid()) {
            for (int i = 0; i < this.additionals.size(); i++) {
                this.additionals.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }
    }

    public void _check() {
        if (!Objects.equals(this.flags._root(), _root()))
            throw new ConsistencyError("flags", _root(), this.flags._root());
        if (!Objects.equals(this.flags._parent(), this))
            throw new ConsistencyError("flags", this, this.flags._parent());
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
        }
        if (flags().isOpcodeValid()) {
            if (this.queries.size() != qdcount())
                throw new ConsistencyError("queries", qdcount(), this.queries.size());
            for (int i = 0; i < this.queries.size(); i++) {
                if (!Objects.equals(this.queries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("queries", _root(), this.queries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.queries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("queries", this, this.queries.get(((Number) (i)).intValue())._parent());
            }
        }
        if (flags().isOpcodeValid()) {
            if (this.answers.size() != ancount())
                throw new ConsistencyError("answers", ancount(), this.answers.size());
            for (int i = 0; i < this.answers.size(); i++) {
                if (!Objects.equals(this.answers.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("answers", _root(), this.answers.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.answers.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("answers", this, this.answers.get(((Number) (i)).intValue())._parent());
            }
        }
        if (flags().isOpcodeValid()) {
            if (this.authorities.size() != nscount())
                throw new ConsistencyError("authorities", nscount(), this.authorities.size());
            for (int i = 0; i < this.authorities.size(); i++) {
                if (!Objects.equals(this.authorities.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("authorities", _root(), this.authorities.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.authorities.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("authorities", this, this.authorities.get(((Number) (i)).intValue())._parent());
            }
        }
        if (flags().isOpcodeValid()) {
            if (this.additionals.size() != arcount())
                throw new ConsistencyError("additionals", arcount(), this.additionals.size());
            for (int i = 0; i < this.additionals.size(); i++) {
                if (!Objects.equals(this.additionals.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("additionals", _root(), this.additionals.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.additionals.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("additionals", this, this.additionals.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class Address extends KaitaiStruct.ReadWrite {
        public static Address fromFile(String fileName) throws IOException {
            return new Address(new ByteBufferKaitaiStream(fileName));
        }
        public Address() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ip = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.ip);
        }

        public void _check() {
            if (this.ip.length != 4)
                throw new ConsistencyError("ip", 4, this.ip.length);
            _dirty = false;
        }
        private byte[] ip;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public byte[] ip() { return ip; }
        public void setIp(byte[] _v) { _dirty = true; ip = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Answer _parent() { return _parent; }
        public void set_parent(DnsPacket.Answer _v) { _dirty = true; _parent = _v; }
    }
    public static class AddressV6 extends KaitaiStruct.ReadWrite {
        public static AddressV6 fromFile(String fileName) throws IOException {
            return new AddressV6(new ByteBufferKaitaiStream(fileName));
        }
        public AddressV6() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ipV6 = this._io.readBytes(16);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.ipV6);
        }

        public void _check() {
            if (this.ipV6.length != 16)
                throw new ConsistencyError("ip_v6", 16, this.ipV6.length);
            _dirty = false;
        }
        private byte[] ipV6;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public byte[] ipV6() { return ipV6; }
        public void setIpV6(byte[] _v) { _dirty = true; ipV6 = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Answer _parent() { return _parent; }
        public void set_parent(DnsPacket.Answer _v) { _dirty = true; _parent = _v; }
    }
    public static class Answer extends KaitaiStruct.ReadWrite {
        public static Answer fromFile(String fileName) throws IOException {
            return new Answer(new ByteBufferKaitaiStream(fileName));
        }
        public Answer() {
            this(null, null, null);
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
        }
        public void _read() {
            this.name = new DomainName(this._io, this, _root);
            this.name._read();
            this.type = DnsPacket.TypeType.byId(this._io.readU2be());
            this.answerClass = DnsPacket.ClassType.byId(this._io.readU2be());
            this.ttl = this._io.readS4be();
            this.rdlength = this._io.readU2be();
            {
                TypeType on = type();
                if (on != null) {
                    switch (type()) {
                    case A: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new Address(_io__raw_payload, this, _root);
                        ((Address) (this.payload))._read();
                        break;
                    }
                    case AAAA: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new AddressV6(_io__raw_payload, this, _root);
                        ((AddressV6) (this.payload))._read();
                        break;
                    }
                    case CNAME: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new DomainName(_io__raw_payload, this, _root);
                        ((DomainName) (this.payload))._read();
                        break;
                    }
                    case MX: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new MxInfo(_io__raw_payload, this, _root);
                        ((MxInfo) (this.payload))._read();
                        break;
                    }
                    case NS: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new DomainName(_io__raw_payload, this, _root);
                        ((DomainName) (this.payload))._read();
                        break;
                    }
                    case PTR: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new DomainName(_io__raw_payload, this, _root);
                        ((DomainName) (this.payload))._read();
                        break;
                    }
                    case SOA: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new AuthorityInfo(_io__raw_payload, this, _root);
                        ((AuthorityInfo) (this.payload))._read();
                        break;
                    }
                    case SRV: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new Service(_io__raw_payload, this, _root);
                        ((Service) (this.payload))._read();
                        break;
                    }
                    case TXT: {
                        this._raw_payload = this._io.readBytes(rdlength());
                        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
                        this.payload = new TxtBody(_io__raw_payload, this, _root);
                        ((TxtBody) (this.payload))._read();
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
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.name._write_Seq(this._io);
            this._io.writeU2be(((Number) (this.type.id())).intValue());
            this._io.writeU2be(((Number) (this.answerClass.id())).intValue());
            this._io.writeS4be(this.ttl);
            this._io.writeU2be(this.rdlength);
            {
                TypeType on = type();
                if (on != null) {
                    switch (type()) {
                    case A: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((Address) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case AAAA: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((AddressV6) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case CNAME: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((DomainName) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case MX: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((MxInfo) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case NS: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((DomainName) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case PTR: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((DomainName) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case SOA: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((AuthorityInfo) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case SRV: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((Service) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    case TXT: {
                        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(rdlength());
                        this._io.addChildStream(_io__raw_payload);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (rdlength()));
                            final Answer _this = this;
                            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_payload = _io__raw_payload.toByteArray();
                                    if (((byte[]) (_this._raw_payload)).length != rdlength())
                                        throw new ConsistencyError("raw(payload)", rdlength(), ((byte[]) (_this._raw_payload)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                                }
                            });
                        }
                        ((TxtBody) (this.payload))._write_Seq(_io__raw_payload);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.payload)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.payload)))));
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            {
                TypeType on = type();
                if (on != null) {
                    switch (type()) {
                    case A: {
                        if (!Objects.equals(((DnsPacket.Address) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.Address) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.Address) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.Address) (this.payload))._parent());
                        break;
                    }
                    case AAAA: {
                        if (!Objects.equals(((DnsPacket.AddressV6) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.AddressV6) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.AddressV6) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.AddressV6) (this.payload))._parent());
                        break;
                    }
                    case CNAME: {
                        if (!Objects.equals(((DnsPacket.DomainName) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.DomainName) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.DomainName) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.DomainName) (this.payload))._parent());
                        break;
                    }
                    case MX: {
                        if (!Objects.equals(((DnsPacket.MxInfo) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.MxInfo) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.MxInfo) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.MxInfo) (this.payload))._parent());
                        break;
                    }
                    case NS: {
                        if (!Objects.equals(((DnsPacket.DomainName) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.DomainName) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.DomainName) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.DomainName) (this.payload))._parent());
                        break;
                    }
                    case PTR: {
                        if (!Objects.equals(((DnsPacket.DomainName) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.DomainName) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.DomainName) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.DomainName) (this.payload))._parent());
                        break;
                    }
                    case SOA: {
                        if (!Objects.equals(((DnsPacket.AuthorityInfo) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.AuthorityInfo) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.AuthorityInfo) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.AuthorityInfo) (this.payload))._parent());
                        break;
                    }
                    case SRV: {
                        if (!Objects.equals(((DnsPacket.Service) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.Service) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.Service) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.Service) (this.payload))._parent());
                        break;
                    }
                    case TXT: {
                        if (!Objects.equals(((DnsPacket.TxtBody) (this.payload))._root(), _root()))
                            throw new ConsistencyError("payload", _root(), ((DnsPacket.TxtBody) (this.payload))._root());
                        if (!Objects.equals(((DnsPacket.TxtBody) (this.payload))._parent(), this))
                            throw new ConsistencyError("payload", this, ((DnsPacket.TxtBody) (this.payload))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.payload)).length != rdlength())
                            throw new ConsistencyError("payload", rdlength(), ((byte[]) (this.payload)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.payload)).length != rdlength())
                        throw new ConsistencyError("payload", rdlength(), ((byte[]) (this.payload)).length);
                }
            }
            _dirty = false;
        }
        private DomainName name;
        private TypeType type;
        private ClassType answerClass;
        private int ttl;
        private int rdlength;
        private Object payload;
        private DnsPacket _root;
        private DnsPacket _parent;
        private byte[] _raw_payload;
        public DomainName name() { return name; }
        public void setName(DomainName _v) { _dirty = true; name = _v; }
        public TypeType type() { return type; }
        public void setType(TypeType _v) { _dirty = true; type = _v; }
        public ClassType answerClass() { return answerClass; }
        public void setAnswerClass(ClassType _v) { _dirty = true; answerClass = _v; }

        /**
         * Time to live (in seconds)
         */
        public int ttl() { return ttl; }
        public void setTtl(int _v) { _dirty = true; ttl = _v; }

        /**
         * Length in octets of the following payload
         */
        public int rdlength() { return rdlength; }
        public void setRdlength(int _v) { _dirty = true; rdlength = _v; }
        public Object payload() { return payload; }
        public void setPayload(Object _v) { _dirty = true; payload = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket _parent() { return _parent; }
        public void set_parent(DnsPacket _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_payload() { return _raw_payload; }
        public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
    }
    public static class AuthorityInfo extends KaitaiStruct.ReadWrite {
        public static AuthorityInfo fromFile(String fileName) throws IOException {
            return new AuthorityInfo(new ByteBufferKaitaiStream(fileName));
        }
        public AuthorityInfo() {
            this(null, null, null);
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
        }
        public void _read() {
            this.primaryNs = new DomainName(this._io, this, _root);
            this.primaryNs._read();
            this.resoponsibleMailbox = new DomainName(this._io, this, _root);
            this.resoponsibleMailbox._read();
            this.serial = this._io.readU4be();
            this.refreshInterval = this._io.readU4be();
            this.retryInterval = this._io.readU4be();
            this.expireLimit = this._io.readU4be();
            this.minTtl = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.primaryNs._fetchInstances();
            this.resoponsibleMailbox._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.primaryNs._write_Seq(this._io);
            this.resoponsibleMailbox._write_Seq(this._io);
            this._io.writeU4be(this.serial);
            this._io.writeU4be(this.refreshInterval);
            this._io.writeU4be(this.retryInterval);
            this._io.writeU4be(this.expireLimit);
            this._io.writeU4be(this.minTtl);
        }

        public void _check() {
            if (!Objects.equals(this.primaryNs._root(), _root()))
                throw new ConsistencyError("primary_ns", _root(), this.primaryNs._root());
            if (!Objects.equals(this.primaryNs._parent(), this))
                throw new ConsistencyError("primary_ns", this, this.primaryNs._parent());
            if (!Objects.equals(this.resoponsibleMailbox._root(), _root()))
                throw new ConsistencyError("resoponsible_mailbox", _root(), this.resoponsibleMailbox._root());
            if (!Objects.equals(this.resoponsibleMailbox._parent(), this))
                throw new ConsistencyError("resoponsible_mailbox", this, this.resoponsibleMailbox._parent());
            _dirty = false;
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
        public void setPrimaryNs(DomainName _v) { _dirty = true; primaryNs = _v; }
        public DomainName resoponsibleMailbox() { return resoponsibleMailbox; }
        public void setResoponsibleMailbox(DomainName _v) { _dirty = true; resoponsibleMailbox = _v; }
        public long serial() { return serial; }
        public void setSerial(long _v) { _dirty = true; serial = _v; }
        public long refreshInterval() { return refreshInterval; }
        public void setRefreshInterval(long _v) { _dirty = true; refreshInterval = _v; }
        public long retryInterval() { return retryInterval; }
        public void setRetryInterval(long _v) { _dirty = true; retryInterval = _v; }
        public long expireLimit() { return expireLimit; }
        public void setExpireLimit(long _v) { _dirty = true; expireLimit = _v; }
        public long minTtl() { return minTtl; }
        public void setMinTtl(long _v) { _dirty = true; minTtl = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Answer _parent() { return _parent; }
        public void set_parent(DnsPacket.Answer _v) { _dirty = true; _parent = _v; }
    }
    public static class DomainName extends KaitaiStruct.ReadWrite {
        public static DomainName fromFile(String fileName) throws IOException {
            return new DomainName(new ByteBufferKaitaiStream(fileName));
        }
        public DomainName() {
            this(null, null, null);
        }

        public DomainName(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DomainName(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DomainName(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DnsPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new ArrayList<Label>();
            {
                Label _it;
                int i = 0;
                do {
                    Label _t_name = new Label(this._io, this, _root);
                    try {
                        _t_name._read();
                    } finally {
                        _it = _t_name;
                        this.name.add(_it);
                    }
                    i++;
                } while (!( ((_it.length() == 0) || (_it.length() >= 192)) ));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.name.size(); i++) {
                this.name.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.name.size(); i++) {
                this.name.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.name.size() == 0)
                throw new ConsistencyError("name", 0, this.name.size());
            for (int i = 0; i < this.name.size(); i++) {
                if (!Objects.equals(this.name.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("name", _root(), this.name.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.name.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("name", this, this.name.get(((Number) (i)).intValue())._parent());
                {
                    Label _it = this.name.get(((Number) (i)).intValue());
                    if ( ((_it.length() == 0) || (_it.length() >= 192))  != (i == this.name.size() - 1))
                        throw new ConsistencyError("name", i == this.name.size() - 1,  ((_it.length() == 0) || (_it.length() >= 192)) );
                }
            }
            _dirty = false;
        }
        private List<Label> name;
        private DnsPacket _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
         */
        public List<Label> name() { return name; }
        public void setName(List<Label> _v) { _dirty = true; name = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Label extends KaitaiStruct.ReadWrite {
        public static Label fromFile(String fileName) throws IOException {
            return new Label(new ByteBufferKaitaiStream(fileName));
        }
        public Label() {
            this(null, null, null);
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
        }
        public void _read() {
            this.length = this._io.readU1();
            if (isPointer()) {
                this.pointer = new PointerStruct(this._io, this, _root);
                this.pointer._read();
            }
            if (!(isPointer())) {
                this.name = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (isPointer()) {
                this.pointer._fetchInstances();
            }
            if (!(isPointer())) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.length);
            if (isPointer()) {
                this.pointer._write_Seq(this._io);
            }
            if (!(isPointer())) {
                this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
            }
        }

        public void _check() {
            if (isPointer()) {
                if (!Objects.equals(this.pointer._root(), _root()))
                    throw new ConsistencyError("pointer", _root(), this.pointer._root());
                if (!Objects.equals(this.pointer._parent(), this))
                    throw new ConsistencyError("pointer", this, this.pointer._parent());
            }
            if (!(isPointer())) {
                if ((this.name).getBytes(Charset.forName("UTF-8")).length != length())
                    throw new ConsistencyError("name", length(), (this.name).getBytes(Charset.forName("UTF-8")).length);
            }
            _dirty = false;
        }
        private Boolean isPointer;
        public Boolean isPointer() {
            if (this.isPointer != null)
                return this.isPointer;
            this.isPointer = length() >= 192;
            return this.isPointer;
        }
        public void _invalidateIsPointer() { this.isPointer = null; }
        private int length;
        private PointerStruct pointer;
        private String name;
        private DnsPacket _root;
        private DnsPacket.DomainName _parent;

        /**
         * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
         */
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public PointerStruct pointer() { return pointer; }
        public void setPointer(PointerStruct _v) { _dirty = true; pointer = _v; }

        /**
         * Otherwise its a string the length of the length value
         */
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.DomainName _parent() { return _parent; }
        public void set_parent(DnsPacket.DomainName _v) { _dirty = true; _parent = _v; }
    }
    public static class MxInfo extends KaitaiStruct.ReadWrite {
        public static MxInfo fromFile(String fileName) throws IOException {
            return new MxInfo(new ByteBufferKaitaiStream(fileName));
        }
        public MxInfo() {
            this(null, null, null);
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
        }
        public void _read() {
            this.preference = this._io.readU2be();
            this.mx = new DomainName(this._io, this, _root);
            this.mx._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.mx._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.preference);
            this.mx._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.mx._root(), _root()))
                throw new ConsistencyError("mx", _root(), this.mx._root());
            if (!Objects.equals(this.mx._parent(), this))
                throw new ConsistencyError("mx", this, this.mx._parent());
            _dirty = false;
        }
        private int preference;
        private DomainName mx;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public int preference() { return preference; }
        public void setPreference(int _v) { _dirty = true; preference = _v; }
        public DomainName mx() { return mx; }
        public void setMx(DomainName _v) { _dirty = true; mx = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Answer _parent() { return _parent; }
        public void set_parent(DnsPacket.Answer _v) { _dirty = true; _parent = _v; }
    }
    public static class PacketFlags extends KaitaiStruct.ReadWrite {
        public static PacketFlags fromFile(String fileName) throws IOException {
            return new PacketFlags(new ByteBufferKaitaiStream(fileName));
        }
        public PacketFlags() {
            this(null, null, null);
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
        }
        public void _read() {
            this.flag = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.flag);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer aa;
        public Integer aa() {
            if (this.aa != null)
                return this.aa;
            this.aa = ((Number) ((flag() & 1024) >> 10)).intValue();
            return this.aa;
        }
        public void _invalidateAa() { this.aa = null; }
        private Integer ad;
        public Integer ad() {
            if (this.ad != null)
                return this.ad;
            this.ad = ((Number) ((flag() & 32) >> 5)).intValue();
            return this.ad;
        }
        public void _invalidateAd() { this.ad = null; }
        private Integer cd;
        public Integer cd() {
            if (this.cd != null)
                return this.cd;
            this.cd = ((Number) ((flag() & 16) >> 4)).intValue();
            return this.cd;
        }
        public void _invalidateCd() { this.cd = null; }
        private Boolean isOpcodeValid;
        public Boolean isOpcodeValid() {
            if (this.isOpcodeValid != null)
                return this.isOpcodeValid;
            this.isOpcodeValid =  ((opcode() == 0) || (opcode() == 1) || (opcode() == 2)) ;
            return this.isOpcodeValid;
        }
        public void _invalidateIsOpcodeValid() { this.isOpcodeValid = null; }
        private Integer opcode;
        public Integer opcode() {
            if (this.opcode != null)
                return this.opcode;
            this.opcode = ((Number) ((flag() & 30720) >> 11)).intValue();
            return this.opcode;
        }
        public void _invalidateOpcode() { this.opcode = null; }
        private Integer qr;
        public Integer qr() {
            if (this.qr != null)
                return this.qr;
            this.qr = ((Number) ((flag() & 32768) >> 15)).intValue();
            return this.qr;
        }
        public void _invalidateQr() { this.qr = null; }
        private Integer ra;
        public Integer ra() {
            if (this.ra != null)
                return this.ra;
            this.ra = ((Number) ((flag() & 128) >> 7)).intValue();
            return this.ra;
        }
        public void _invalidateRa() { this.ra = null; }
        private Integer rcode;
        public Integer rcode() {
            if (this.rcode != null)
                return this.rcode;
            this.rcode = ((Number) ((flag() & 15) >> 0)).intValue();
            return this.rcode;
        }
        public void _invalidateRcode() { this.rcode = null; }
        private Integer rd;
        public Integer rd() {
            if (this.rd != null)
                return this.rd;
            this.rd = ((Number) ((flag() & 256) >> 8)).intValue();
            return this.rd;
        }
        public void _invalidateRd() { this.rd = null; }
        private Integer tc;
        public Integer tc() {
            if (this.tc != null)
                return this.tc;
            this.tc = ((Number) ((flag() & 512) >> 9)).intValue();
            return this.tc;
        }
        public void _invalidateTc() { this.tc = null; }
        private Integer z;
        public Integer z() {
            if (this.z != null)
                return this.z;
            this.z = ((Number) ((flag() & 64) >> 6)).intValue();
            return this.z;
        }
        public void _invalidateZ() { this.z = null; }
        private int flag;
        private DnsPacket _root;
        private DnsPacket _parent;
        public int flag() { return flag; }
        public void setFlag(int _v) { _dirty = true; flag = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket _parent() { return _parent; }
        public void set_parent(DnsPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PointerStruct extends KaitaiStruct.ReadWrite {
        public static PointerStruct fromFile(String fileName) throws IOException {
            return new PointerStruct(new ByteBufferKaitaiStream(fileName));
        }
        public PointerStruct() {
            this(null, null, null);
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
        }
        public void _read() {
            this.value = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            contents();
            if (this.contents != null) {
                this.contents._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteContents = _enabledContents;
            this._io.writeU1(this.value);
        }

        public void _check() {
            if (_enabledContents) {
                if (!Objects.equals(this.contents._root(), _root()))
                    throw new ConsistencyError("contents", _root(), this.contents._root());
                if (!Objects.equals(this.contents._parent(), this))
                    throw new ConsistencyError("contents", this, this.contents._parent());
            }
            _dirty = false;
        }
        private DomainName contents;
        private boolean _shouldWriteContents = false;
        private boolean _enabledContents = true;
        public DomainName contents() {
            if (_shouldWriteContents)
                _writeContents();
            if (this.contents != null)
                return this.contents;
            if (!_enabledContents)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(value() + (_parent().length() - 192 << 8));
            this.contents = new DomainName(io, this, _root);
            this.contents._read();
            io.seek(_pos);
            return this.contents;
        }
        public void setContents(DomainName _v) { _dirty = true; contents = _v; }
        public void setContents_Enabled(boolean _v) { _dirty = true; _enabledContents = _v; }

        private void _writeContents() {
            _shouldWriteContents = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(value() + (_parent().length() - 192 << 8));
            this.contents._write_Seq(io);
            io.seek(_pos);
        }
        private int value;
        private DnsPacket _root;
        private DnsPacket.Label _parent;

        /**
         * Read one byte, then offset to that position, read one domain-name and return
         */
        public int value() { return value; }
        public void setValue(int _v) { _dirty = true; value = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Label _parent() { return _parent; }
        public void set_parent(DnsPacket.Label _v) { _dirty = true; _parent = _v; }
    }
    public static class Query extends KaitaiStruct.ReadWrite {
        public static Query fromFile(String fileName) throws IOException {
            return new Query(new ByteBufferKaitaiStream(fileName));
        }
        public Query() {
            this(null, null, null);
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
        }
        public void _read() {
            this.name = new DomainName(this._io, this, _root);
            this.name._read();
            this.type = DnsPacket.TypeType.byId(this._io.readU2be());
            this.queryClass = DnsPacket.ClassType.byId(this._io.readU2be());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.name._write_Seq(this._io);
            this._io.writeU2be(((Number) (this.type.id())).intValue());
            this._io.writeU2be(((Number) (this.queryClass.id())).intValue());
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            _dirty = false;
        }
        private DomainName name;
        private TypeType type;
        private ClassType queryClass;
        private DnsPacket _root;
        private DnsPacket _parent;
        public DomainName name() { return name; }
        public void setName(DomainName _v) { _dirty = true; name = _v; }
        public TypeType type() { return type; }
        public void setType(TypeType _v) { _dirty = true; type = _v; }
        public ClassType queryClass() { return queryClass; }
        public void setQueryClass(ClassType _v) { _dirty = true; queryClass = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket _parent() { return _parent; }
        public void set_parent(DnsPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class Service extends KaitaiStruct.ReadWrite {
        public static Service fromFile(String fileName) throws IOException {
            return new Service(new ByteBufferKaitaiStream(fileName));
        }
        public Service() {
            this(null, null, null);
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
        }
        public void _read() {
            this.priority = this._io.readU2be();
            this.weight = this._io.readU2be();
            this.port = this._io.readU2be();
            this.target = new DomainName(this._io, this, _root);
            this.target._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.target._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.priority);
            this._io.writeU2be(this.weight);
            this._io.writeU2be(this.port);
            this.target._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.target._root(), _root()))
                throw new ConsistencyError("target", _root(), this.target._root());
            if (!Objects.equals(this.target._parent(), this))
                throw new ConsistencyError("target", this, this.target._parent());
            _dirty = false;
        }
        private int priority;
        private int weight;
        private int port;
        private DomainName target;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public int priority() { return priority; }
        public void setPriority(int _v) { _dirty = true; priority = _v; }
        public int weight() { return weight; }
        public void setWeight(int _v) { _dirty = true; weight = _v; }
        public int port() { return port; }
        public void setPort(int _v) { _dirty = true; port = _v; }
        public DomainName target() { return target; }
        public void setTarget(DomainName _v) { _dirty = true; target = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Answer _parent() { return _parent; }
        public void set_parent(DnsPacket.Answer _v) { _dirty = true; _parent = _v; }
    }
    public static class Txt extends KaitaiStruct.ReadWrite {
        public static Txt fromFile(String fileName) throws IOException {
            return new Txt(new ByteBufferKaitaiStream(fileName));
        }
        public Txt() {
            this(null, null, null);
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
        }
        public void _read() {
            this.length = this._io.readU1();
            this.text = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.length);
            this._io.writeBytes((this.text).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.text).getBytes(Charset.forName("UTF-8")).length != length())
                throw new ConsistencyError("text", length(), (this.text).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private int length;
        private String text;
        private DnsPacket _root;
        private DnsPacket.TxtBody _parent;
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public String text() { return text; }
        public void setText(String _v) { _dirty = true; text = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.TxtBody _parent() { return _parent; }
        public void set_parent(DnsPacket.TxtBody _v) { _dirty = true; _parent = _v; }
    }
    public static class TxtBody extends KaitaiStruct.ReadWrite {
        public static TxtBody fromFile(String fileName) throws IOException {
            return new TxtBody(new ByteBufferKaitaiStream(fileName));
        }
        public TxtBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.data = new ArrayList<Txt>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Txt _t_data = new Txt(this._io, this, _root);
                    try {
                        _t_data._read();
                    } finally {
                        this.data.add(_t_data);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.data.size(); i++) {
                this.data.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.data.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
                this.data.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.data.size(); i++) {
                if (!Objects.equals(this.data.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("data", _root(), this.data.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.data.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("data", this, this.data.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Txt> data;
        private DnsPacket _root;
        private DnsPacket.Answer _parent;
        public List<Txt> data() { return data; }
        public void setData(List<Txt> _v) { _dirty = true; data = _v; }
        public DnsPacket _root() { return _root; }
        public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
        public DnsPacket.Answer _parent() { return _parent; }
        public void set_parent(DnsPacket.Answer _v) { _dirty = true; _parent = _v; }
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
    private KaitaiStruct.ReadWrite _parent;

    /**
     * ID to keep track of request/responces
     */
    public int transactionId() { return transactionId; }
    public void setTransactionId(int _v) { _dirty = true; transactionId = _v; }
    public PacketFlags flags() { return flags; }
    public void setFlags(PacketFlags _v) { _dirty = true; flags = _v; }

    /**
     * How many questions are there
     */
    public Integer qdcount() { return qdcount; }
    public void setQdcount(Integer _v) { _dirty = true; qdcount = _v; }

    /**
     * Number of resource records answering the question
     */
    public Integer ancount() { return ancount; }
    public void setAncount(Integer _v) { _dirty = true; ancount = _v; }

    /**
     * Number of resource records pointing toward an authority
     */
    public Integer nscount() { return nscount; }
    public void setNscount(Integer _v) { _dirty = true; nscount = _v; }

    /**
     * Number of resource records holding additional information
     */
    public Integer arcount() { return arcount; }
    public void setArcount(Integer _v) { _dirty = true; arcount = _v; }
    public List<Query> queries() { return queries; }
    public void setQueries(List<Query> _v) { _dirty = true; queries = _v; }
    public List<Answer> answers() { return answers; }
    public void setAnswers(List<Answer> _v) { _dirty = true; answers = _v; }
    public List<Answer> authorities() { return authorities; }
    public void setAuthorities(List<Answer> _v) { _dirty = true; authorities = _v; }
    public List<Answer> additionals() { return additionals; }
    public void setAdditionals(List<Answer> _v) { _dirty = true; additionals = _v; }
    public DnsPacket _root() { return _root; }
    public void set_root(DnsPacket _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
