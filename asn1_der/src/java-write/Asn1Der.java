// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


/**
 * ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
 * Rules) is a standard-backed serialization scheme used in many
 * different use-cases. Particularly popular usage scenarios are X.509
 * certificates and some telecommunication / networking protocols.
 * 
 * DER is self-describing encoding scheme which allows representation
 * of simple, atomic data elements, such as strings and numbers, and
 * complex objects, such as sequences of other elements.
 * 
 * DER is a subset of BER (Basic Encoding Rules), with an emphasis on
 * being non-ambiguous: there's always exactly one canonical way to
 * encode a data structure defined in terms of ASN.1 using DER.
 * 
 * This spec allows full parsing of format syntax, but to understand
 * the semantics, one would typically require a dictionary of Object
 * Identifiers (OIDs), to match OID bodies against some human-readable
 * list of constants. OIDs are covered by many different standards,
 * so typically it's simpler to use a pre-compiled list of them, such
 * as:
 * 
 * * <https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg>
 * * <http://oid-info.com/>
 * * <https://www.alvestrand.no/objectid/top.html>
 * @see <a href="https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&amp;lang=en">Source</a>
 */
public class Asn1Der extends KaitaiStruct.ReadWrite {
    public static Asn1Der fromFile(String fileName) throws IOException {
        return new Asn1Der(new ByteBufferKaitaiStream(fileName));
    }

    public enum TypeTag {
        END_OF_CONTENT(0),
        BOOLEAN(1),
        INTEGER(2),
        BIT_STRING(3),
        OCTET_STRING(4),
        NULL_VALUE(5),
        OBJECT_ID(6),
        OBJECT_DESCRIPTOR(7),
        EXTERNAL(8),
        REAL(9),
        ENUMERATED(10),
        EMBEDDED_PDV(11),
        UTF8STRING(12),
        RELATIVE_OID(13),
        SEQUENCE_10(16),
        PRINTABLE_STRING(19),
        IA5STRING(22),
        SEQUENCE_30(48),
        SET(49);

        private final long id;
        TypeTag(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TypeTag> byId = new HashMap<Long, TypeTag>(19);
        static {
            for (TypeTag e : TypeTag.values())
                byId.put(e.id(), e);
        }
        public static TypeTag byId(long id) { return byId.get(id); }
    }
    public Asn1Der() {
        this(null, null, null);
    }

    public Asn1Der(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Asn1Der(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Asn1Der(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Asn1Der _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.typeTag = TypeTag.byId(this._io.readU1());
        this.len = new LenEncoded(this._io, this, _root);
        this.len._read();
        {
            TypeTag on = typeTag();
            if (on != null) {
                switch (typeTag()) {
                case OBJECT_ID: {
                    this._raw_body = this._io.readBytes(len().result());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new BodyObjectId(_io__raw_body, this, _root);
                    ((BodyObjectId) (this.body))._read();
                    break;
                }
                case PRINTABLE_STRING: {
                    this._raw_body = this._io.readBytes(len().result());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new BodyPrintableString(_io__raw_body, this, _root);
                    ((BodyPrintableString) (this.body))._read();
                    break;
                }
                case SEQUENCE_10: {
                    this._raw_body = this._io.readBytes(len().result());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new BodySequence(_io__raw_body, this, _root);
                    ((BodySequence) (this.body))._read();
                    break;
                }
                case SEQUENCE_30: {
                    this._raw_body = this._io.readBytes(len().result());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new BodySequence(_io__raw_body, this, _root);
                    ((BodySequence) (this.body))._read();
                    break;
                }
                case SET: {
                    this._raw_body = this._io.readBytes(len().result());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new BodySequence(_io__raw_body, this, _root);
                    ((BodySequence) (this.body))._read();
                    break;
                }
                case UTF8STRING: {
                    this._raw_body = this._io.readBytes(len().result());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new BodyUtf8string(_io__raw_body, this, _root);
                    ((BodyUtf8string) (this.body))._read();
                    break;
                }
                default: {
                    this.body = this._io.readBytes(len().result());
                    break;
                }
                }
            } else {
                this.body = this._io.readBytes(len().result());
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.len._fetchInstances();
        {
            TypeTag on = typeTag();
            if (on != null) {
                switch (typeTag()) {
                case OBJECT_ID: {
                    ((BodyObjectId) (this.body))._fetchInstances();
                    break;
                }
                case PRINTABLE_STRING: {
                    ((BodyPrintableString) (this.body))._fetchInstances();
                    break;
                }
                case SEQUENCE_10: {
                    ((BodySequence) (this.body))._fetchInstances();
                    break;
                }
                case SEQUENCE_30: {
                    ((BodySequence) (this.body))._fetchInstances();
                    break;
                }
                case SET: {
                    ((BodySequence) (this.body))._fetchInstances();
                    break;
                }
                case UTF8STRING: {
                    ((BodyUtf8string) (this.body))._fetchInstances();
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
        this._io.writeU1(((Number) (this.typeTag.id())).intValue());
        this.len._write_Seq(this._io);
        {
            TypeTag on = typeTag();
            if (on != null) {
                switch (typeTag()) {
                case OBJECT_ID: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len().result());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (len().result()));
                        final Asn1Der _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != len().result())
                                    throw new ConsistencyError("raw(body)", len().result(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((BodyObjectId) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case PRINTABLE_STRING: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len().result());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (len().result()));
                        final Asn1Der _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != len().result())
                                    throw new ConsistencyError("raw(body)", len().result(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((BodyPrintableString) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case SEQUENCE_10: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len().result());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (len().result()));
                        final Asn1Der _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != len().result())
                                    throw new ConsistencyError("raw(body)", len().result(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((BodySequence) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case SEQUENCE_30: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len().result());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (len().result()));
                        final Asn1Der _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != len().result())
                                    throw new ConsistencyError("raw(body)", len().result(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((BodySequence) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case SET: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len().result());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (len().result()));
                        final Asn1Der _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != len().result())
                                    throw new ConsistencyError("raw(body)", len().result(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((BodySequence) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case UTF8STRING: {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len().result());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (len().result()));
                        final Asn1Der _this = this;
                        _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_body = _io__raw_body.toByteArray();
                                if (((byte[]) (_this._raw_body)).length != len().result())
                                    throw new ConsistencyError("raw(body)", len().result(), ((byte[]) (_this._raw_body)).length);
                                parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                            }
                        });
                    }
                    ((BodyUtf8string) (this.body))._write_Seq(_io__raw_body);
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
        if (!Objects.equals(this.len._root(), _root()))
            throw new ConsistencyError("len", _root(), this.len._root());
        if (!Objects.equals(this.len._parent(), this))
            throw new ConsistencyError("len", this, this.len._parent());
        {
            TypeTag on = typeTag();
            if (on != null) {
                switch (typeTag()) {
                case OBJECT_ID: {
                    if (!Objects.equals(((Asn1Der.BodyObjectId) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Asn1Der.BodyObjectId) (this.body))._root());
                    if (!Objects.equals(((Asn1Der.BodyObjectId) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Asn1Der.BodyObjectId) (this.body))._parent());
                    break;
                }
                case PRINTABLE_STRING: {
                    if (!Objects.equals(((Asn1Der.BodyPrintableString) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Asn1Der.BodyPrintableString) (this.body))._root());
                    if (!Objects.equals(((Asn1Der.BodyPrintableString) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Asn1Der.BodyPrintableString) (this.body))._parent());
                    break;
                }
                case SEQUENCE_10: {
                    if (!Objects.equals(((Asn1Der.BodySequence) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Asn1Der.BodySequence) (this.body))._root());
                    if (!Objects.equals(((Asn1Der.BodySequence) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Asn1Der.BodySequence) (this.body))._parent());
                    break;
                }
                case SEQUENCE_30: {
                    if (!Objects.equals(((Asn1Der.BodySequence) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Asn1Der.BodySequence) (this.body))._root());
                    if (!Objects.equals(((Asn1Der.BodySequence) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Asn1Der.BodySequence) (this.body))._parent());
                    break;
                }
                case SET: {
                    if (!Objects.equals(((Asn1Der.BodySequence) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Asn1Der.BodySequence) (this.body))._root());
                    if (!Objects.equals(((Asn1Der.BodySequence) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Asn1Der.BodySequence) (this.body))._parent());
                    break;
                }
                case UTF8STRING: {
                    if (!Objects.equals(((Asn1Der.BodyUtf8string) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Asn1Der.BodyUtf8string) (this.body))._root());
                    if (!Objects.equals(((Asn1Der.BodyUtf8string) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Asn1Der.BodyUtf8string) (this.body))._parent());
                    break;
                }
                default: {
                    if (((byte[]) (this.body)).length != len().result())
                        throw new ConsistencyError("body", len().result(), ((byte[]) (this.body)).length);
                    break;
                }
                }
            } else {
                if (((byte[]) (this.body)).length != len().result())
                    throw new ConsistencyError("body", len().result(), ((byte[]) (this.body)).length);
            }
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier">Source</a>
     */
    public static class BodyObjectId extends KaitaiStruct.ReadWrite {
        public static BodyObjectId fromFile(String fileName) throws IOException {
            return new BodyObjectId(new ByteBufferKaitaiStream(fileName));
        }
        public BodyObjectId() {
            this(null, null, null);
        }

        public BodyObjectId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodyObjectId(KaitaiStream _io, Asn1Der _parent) {
            this(_io, _parent, null);
        }

        public BodyObjectId(KaitaiStream _io, Asn1Der _parent, Asn1Der _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.firstAndSecond = this._io.readU1();
            this.rest = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.firstAndSecond);
            this._io.writeBytes(this.rest);
            if (!(this._io.isEof()))
                throw new ConsistencyError("rest", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private Integer first;
        public Integer first() {
            if (this.first != null)
                return this.first;
            this.first = ((Number) (firstAndSecond() / 40)).intValue();
            return this.first;
        }
        public void _invalidateFirst() { this.first = null; }
        private Integer second;
        public Integer second() {
            if (this.second != null)
                return this.second;
            this.second = ((Number) (KaitaiStream.mod(firstAndSecond(), 40))).intValue();
            return this.second;
        }
        public void _invalidateSecond() { this.second = null; }
        private int firstAndSecond;
        private byte[] rest;
        private Asn1Der _root;
        private Asn1Der _parent;
        public int firstAndSecond() { return firstAndSecond; }
        public void setFirstAndSecond(int _v) { _dirty = true; firstAndSecond = _v; }
        public byte[] rest() { return rest; }
        public void setRest(byte[] _v) { _dirty = true; rest = _v; }
        public Asn1Der _root() { return _root; }
        public void set_root(Asn1Der _v) { _dirty = true; _root = _v; }
        public Asn1Der _parent() { return _parent; }
        public void set_parent(Asn1Der _v) { _dirty = true; _parent = _v; }
    }
    public static class BodyPrintableString extends KaitaiStruct.ReadWrite {
        public static BodyPrintableString fromFile(String fileName) throws IOException {
            return new BodyPrintableString(new ByteBufferKaitaiStream(fileName));
        }
        public BodyPrintableString() {
            this(null, null, null);
        }

        public BodyPrintableString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodyPrintableString(KaitaiStream _io, Asn1Der _parent) {
            this(_io, _parent, null);
        }

        public BodyPrintableString(KaitaiStream _io, Asn1Der _parent, Asn1Der _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.str = new String(this._io.readBytesFull(), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.str).getBytes(Charset.forName("ASCII")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("str", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String str;
        private Asn1Der _root;
        private Asn1Der _parent;
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public Asn1Der _root() { return _root; }
        public void set_root(Asn1Der _v) { _dirty = true; _root = _v; }
        public Asn1Der _parent() { return _parent; }
        public void set_parent(Asn1Der _v) { _dirty = true; _parent = _v; }
    }
    public static class BodySequence extends KaitaiStruct.ReadWrite {
        public static BodySequence fromFile(String fileName) throws IOException {
            return new BodySequence(new ByteBufferKaitaiStream(fileName));
        }
        public BodySequence() {
            this(null, null, null);
        }

        public BodySequence(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodySequence(KaitaiStream _io, Asn1Der _parent) {
            this(_io, _parent, null);
        }

        public BodySequence(KaitaiStream _io, Asn1Der _parent, Asn1Der _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Asn1Der>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Asn1Der _t_entries = new Asn1Der(this._io, this, _root);
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
        private List<Asn1Der> entries;
        private Asn1Der _root;
        private Asn1Der _parent;
        public List<Asn1Der> entries() { return entries; }
        public void setEntries(List<Asn1Der> _v) { _dirty = true; entries = _v; }
        public Asn1Der _root() { return _root; }
        public void set_root(Asn1Der _v) { _dirty = true; _root = _v; }
        public Asn1Der _parent() { return _parent; }
        public void set_parent(Asn1Der _v) { _dirty = true; _parent = _v; }
    }
    public static class BodyUtf8string extends KaitaiStruct.ReadWrite {
        public static BodyUtf8string fromFile(String fileName) throws IOException {
            return new BodyUtf8string(new ByteBufferKaitaiStream(fileName));
        }
        public BodyUtf8string() {
            this(null, null, null);
        }

        public BodyUtf8string(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BodyUtf8string(KaitaiStream _io, Asn1Der _parent) {
            this(_io, _parent, null);
        }

        public BodyUtf8string(KaitaiStream _io, Asn1Der _parent, Asn1Der _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.str = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.str).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("str", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String str;
        private Asn1Der _root;
        private Asn1Der _parent;
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public Asn1Der _root() { return _root; }
        public void set_root(Asn1Der _v) { _dirty = true; _root = _v; }
        public Asn1Der _parent() { return _parent; }
        public void set_parent(Asn1Der _v) { _dirty = true; _parent = _v; }
    }
    public static class LenEncoded extends KaitaiStruct.ReadWrite {
        public static LenEncoded fromFile(String fileName) throws IOException {
            return new LenEncoded(new ByteBufferKaitaiStream(fileName));
        }
        public LenEncoded() {
            this(null, null, null);
        }

        public LenEncoded(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LenEncoded(KaitaiStream _io, Asn1Der _parent) {
            this(_io, _parent, null);
        }

        public LenEncoded(KaitaiStream _io, Asn1Der _parent, Asn1Der _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.b1 = this._io.readU1();
            if (b1() == 130) {
                this.int2 = this._io.readU2be();
            }
            if (b1() == 129) {
                this.int1 = this._io.readU1();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (b1() == 130) {
            }
            if (b1() == 129) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.b1);
            if (b1() == 130) {
                this._io.writeU2be(this.int2);
            }
            if (b1() == 129) {
                this._io.writeU1(this.int1);
            }
        }

        public void _check() {
            if (b1() == 130) {
            }
            if (b1() == 129) {
            }
            _dirty = false;
        }
        private Integer result;
        public Integer result() {
            if (this.result != null)
                return this.result;
            this.result = ((Number) ((b1() == 129 ? int1() : (b1() == 130 ? int2() : b1())))).intValue();
            return this.result;
        }
        public void _invalidateResult() { this.result = null; }
        private int b1;
        private Integer int2;
        private Integer int1;
        private Asn1Der _root;
        private Asn1Der _parent;
        public int b1() { return b1; }
        public void setB1(int _v) { _dirty = true; b1 = _v; }
        public Integer int2() { return int2; }
        public void setInt2(Integer _v) { _dirty = true; int2 = _v; }
        public Integer int1() { return int1; }
        public void setInt1(Integer _v) { _dirty = true; int1 = _v; }
        public Asn1Der _root() { return _root; }
        public void set_root(Asn1Der _v) { _dirty = true; _root = _v; }
        public Asn1Der _parent() { return _parent; }
        public void set_parent(Asn1Der _v) { _dirty = true; _parent = _v; }
    }
    private TypeTag typeTag;
    private LenEncoded len;
    private Object body;
    private Asn1Der _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_body;
    public TypeTag typeTag() { return typeTag; }
    public void setTypeTag(TypeTag _v) { _dirty = true; typeTag = _v; }
    public LenEncoded len() { return len; }
    public void setLen(LenEncoded _v) { _dirty = true; len = _v; }
    public Object body() { return body; }
    public void setBody(Object _v) { _dirty = true; body = _v; }
    public Asn1Der _root() { return _root; }
    public void set_root(Asn1Der _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_body() { return _raw_body; }
    public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
}
