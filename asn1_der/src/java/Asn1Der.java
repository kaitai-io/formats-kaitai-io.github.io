// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class Asn1Der extends KaitaiStruct {
    public static Asn1Der fromFile(String fileName) throws IOException {
        return new Asn1Der(new KaitaiStream(fileName));
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
        switch (typeTag()) {
        case SEQUENCE_30: {
            this._raw_body = this._io.readBytes(len().result());
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new BodySequence(_io__raw_body, this, _root);
            break;
        }
        case SEQUENCE_10: {
            this._raw_body = this._io.readBytes(len().result());
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new BodySequence(_io__raw_body, this, _root);
            break;
        }
        case UTF8STRING: {
            this._raw_body = this._io.readBytes(len().result());
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new BodyUtf8string(_io__raw_body, this, _root);
            break;
        }
        case PRINTABLE_STRING: {
            this._raw_body = this._io.readBytes(len().result());
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new BodyPrintableString(_io__raw_body, this, _root);
            break;
        }
        case SET: {
            this._raw_body = this._io.readBytes(len().result());
            KaitaiStream _io__raw_body = new KaitaiStream(_raw_body);
            this.body = new BodySequence(_io__raw_body, this, _root);
            break;
        }
        default: {
            this.body = this._io.readBytes(len().result());
            break;
        }
        }
    }
    public static class LenEncoded extends KaitaiStruct {
        public static LenEncoded fromFile(String fileName) throws IOException {
            return new LenEncoded(new KaitaiStream(fileName));
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
        }
        private Integer result;
        public Integer result() {
            if (this.result != null)
                return this.result;
            int _tmp = (int) (((b1() & 128) == 0 ? b1() : int2()));
            this.result = _tmp;
            return this.result;
        }
        private int b1;
        private Integer int2;
        private Asn1Der _root;
        private Asn1Der _parent;
        public int b1() { return b1; }
        public Integer int2() { return int2; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class BodySequence extends KaitaiStruct {
        public static BodySequence fromFile(String fileName) throws IOException {
            return new BodySequence(new KaitaiStream(fileName));
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
            while (!this._io.isEof()) {
                this.entries.add(new Asn1Der(this._io));
            }
        }
        private ArrayList<Asn1Der> entries;
        private Asn1Der _root;
        private Asn1Der _parent;
        public ArrayList<Asn1Der> entries() { return entries; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class BodyUtf8string extends KaitaiStruct {
        public static BodyUtf8string fromFile(String fileName) throws IOException {
            return new BodyUtf8string(new KaitaiStream(fileName));
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
            this.str = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private String str;
        private Asn1Der _root;
        private Asn1Der _parent;
        public String str() { return str; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    public static class BodyPrintableString extends KaitaiStruct {
        public static BodyPrintableString fromFile(String fileName) throws IOException {
            return new BodyPrintableString(new KaitaiStream(fileName));
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
            this.str = new String(this._io.readBytesFull(), Charset.forName("ASCII"));
        }
        private String str;
        private Asn1Der _root;
        private Asn1Der _parent;
        public String str() { return str; }
        public Asn1Der _root() { return _root; }
        public Asn1Der _parent() { return _parent; }
    }
    private TypeTag typeTag;
    private LenEncoded len;
    private Object body;
    private Asn1Der _root;
    private KaitaiStruct _parent;
    private byte[] _raw_body;
    public TypeTag typeTag() { return typeTag; }
    public LenEncoded len() { return len; }
    public Object body() { return body; }
    public Asn1Der _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_body() { return _raw_body; }
}
