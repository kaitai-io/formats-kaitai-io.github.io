// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
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
public class Asn1Der extends KaitaiStruct {
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

    public Asn1Der(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Asn1Der(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Asn1Der(KaitaiStream _io, KaitaiStruct _parent, Asn1Der _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.typeTag = TypeTag.byId(this._io.readU1());
        this.len = new LenEncoded(this._io, this, _root);
        {
            TypeTag on = typeTag();
            if (on != null) {
                switch (typeTag()) {
                case OBJECT_ID: {
                    KaitaiStream _io_body = this._io.substream(len().result());
                    this.body = new BodyObjectId(_io_body, this, _root);
                    break;
                }
                case PRINTABLE_STRING: {
                    KaitaiStream _io_body = this._io.substream(len().result());
                    this.body = new BodyPrintableString(_io_body, this, _root);
                    break;
                }
                case SEQUENCE_10: {
                    KaitaiStream _io_body = this._io.substream(len().result());
                    this.body = new BodySequence(_io_body, this, _root);
                    break;
                }
                case SEQUENCE_30: {
                    KaitaiStream _io_body = this._io.substream(len().result());
                    this.body = new BodySequence(_io_body, this, _root);
                    break;
                }
                case SET: {
                    KaitaiStream _io_body = this._io.substream(len().result());
                    this.body = new BodySequence(_io_body, this, _root);
                    break;
                }
                case UTF8STRING: {
                    KaitaiStream _io_body = this._io.substream(len().result());
                    this.body = new BodyUtf8string(_io_body, this, _root);
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

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier">Source</a>
     */
    public static class BodyObjectId extends KaitaiStruct {
        public static BodyObjectId fromFile(String fileName) throws IOException {
            return new BodyObjectId(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.firstAndSecond = this._io.readU1();
            this.rest = this._io.readBytesFull();
        }

        public void _fetchInstances() {
        }
        private Integer first;
        public Integer first() {
            if (this.first != null)
                return this.first;
            this.first = ((Number) (firstAndSecond() / 40)).intValue();
            return this.first;
        }
        private Integer second;
        public Integer second() {
            if (this.second != null)
                return this.second;
            this.second = ((Number) (KaitaiStream.mod(firstAndSecond(), 40))).intValue();
            return this.second;
        }
        private int firstAndSecond;
        private byte[] rest;
        private Asn1Der _root;
        private Asn1Der _parent;
        public int firstAndSecond() { return firstAndSecond; }
        public byte[] rest() { return rest; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class BodyPrintableString extends KaitaiStruct {
        public static BodyPrintableString fromFile(String fileName) throws IOException {
            return new BodyPrintableString(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.str = new String(this._io.readBytesFull(), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private String str;
        private Asn1Der _root;
        private Asn1Der _parent;
        public String str() { return str; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class BodySequence extends KaitaiStruct {
        public static BodySequence fromFile(String fileName) throws IOException {
            return new BodySequence(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Asn1Der>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Asn1Der(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<Asn1Der> entries;
        private Asn1Der _root;
        private Asn1Der _parent;
        public List<Asn1Der> entries() { return entries; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class BodyUtf8string extends KaitaiStruct {
        public static BodyUtf8string fromFile(String fileName) throws IOException {
            return new BodyUtf8string(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.str = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String str;
        private Asn1Der _root;
        private Asn1Der _parent;
        public String str() { return str; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class LenEncoded extends KaitaiStruct {
        public static LenEncoded fromFile(String fileName) throws IOException {
            return new LenEncoded(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.b1 = this._io.readU1();
            if (b1() == 130) {
                this.int2 = this._io.readU2be();
            }
            if (b1() == 129) {
                this.int1 = this._io.readU1();
            }
        }

        public void _fetchInstances() {
            if (b1() == 130) {
            }
            if (b1() == 129) {
            }
        }
        private Integer result;
        public Integer result() {
            if (this.result != null)
                return this.result;
            this.result = ((Number) ((b1() == 129 ? int1() : (b1() == 130 ? int2() : b1())))).intValue();
            return this.result;
        }
        private int b1;
        private Integer int2;
        private Integer int1;
        private Asn1Der _root;
        private Asn1Der _parent;
        public int b1() { return b1; }
        public Integer int2() { return int2; }
        public Integer int1() { return int1; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    private TypeTag typeTag;
    private LenEncoded len;
    private Object body;
    private Asn1Der _root;
    private KaitaiStruct _parent;
    public TypeTag typeTag() { return typeTag; }
    public LenEncoded len() { return len; }
    public Object body() { return body; }
    public Asn1Der _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
