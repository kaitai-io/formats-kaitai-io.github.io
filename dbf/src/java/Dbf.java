// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class Dbf extends KaitaiStruct {
    public static Dbf fromFile(String fileName) throws IOException {
        return new Dbf(new KaitaiStream(fileName));
    }

    public Dbf(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Dbf(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Dbf(KaitaiStream _io, KaitaiStruct _parent, Dbf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.header1 = new Header1(this._io, this, _root);
        this._raw_header2 = this._io.readBytes((header1().headerSize() - 12));
        KaitaiStream _io__raw_header2 = new KaitaiStream(_raw_header2);
        this.header2 = new Header2(_io__raw_header2, this, _root);
        records = new ArrayList<byte[]>((int) (header1().numRecords()));
        for (int i = 0; i < header1().numRecords(); i++) {
            this.records.add(this._io.readBytes(header1().recordSize()));
        }
    }
    public static class Header2 extends KaitaiStruct {
        public static Header2 fromFile(String fileName) throws IOException {
            return new Header2(new KaitaiStream(fileName));
        }

        public Header2(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header2(KaitaiStream _io, Dbf _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header2(KaitaiStream _io, Dbf _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            if (_root.header1().dbaseLevel() == 3) {
                this.headerDbase3 = new HeaderDbase3(this._io, this, _root);
            }
            if (_root.header1().dbaseLevel() == 7) {
                this.headerDbase7 = new HeaderDbase7(this._io, this, _root);
            }
            fields = new ArrayList<Field>((int) (11));
            for (int i = 0; i < 11; i++) {
                this.fields.add(new Field(this._io, this, _root));
            }
        }
        private HeaderDbase3 headerDbase3;
        private HeaderDbase7 headerDbase7;
        private ArrayList<Field> fields;
        private Dbf _root;
        private Dbf _parent;
        public HeaderDbase3 headerDbase3() { return headerDbase3; }
        public HeaderDbase7 headerDbase7() { return headerDbase7; }
        public ArrayList<Field> fields() { return fields; }
        public Dbf _root() { return _root; }
        public Dbf _parent() { return _parent; }
    }
    public static class Field extends KaitaiStruct {
        public static Field fromFile(String fileName) throws IOException {
            return new Field(new KaitaiStream(fileName));
        }

        public Field(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Field(KaitaiStream _io, Dbf.Header2 _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Field(KaitaiStream _io, Dbf.Header2 _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.name = new String(this._io.readBytes(11), Charset.forName("ASCII"));
            this.datatype = this._io.readU1();
            this.dataAddress = this._io.readU4le();
            this.length = this._io.readU1();
            this.decimalCount = this._io.readU1();
            this.reserved1 = this._io.readBytes(2);
            this.workAreaId = this._io.readU1();
            this.reserved2 = this._io.readBytes(2);
            this.setFieldsFlag = this._io.readU1();
            this.reserved3 = this._io.readBytes(8);
        }
        private String name;
        private int datatype;
        private long dataAddress;
        private int length;
        private int decimalCount;
        private byte[] reserved1;
        private int workAreaId;
        private byte[] reserved2;
        private int setFieldsFlag;
        private byte[] reserved3;
        private Dbf _root;
        private Dbf.Header2 _parent;
        public String name() { return name; }
        public int datatype() { return datatype; }
        public long dataAddress() { return dataAddress; }
        public int length() { return length; }
        public int decimalCount() { return decimalCount; }
        public byte[] reserved1() { return reserved1; }
        public int workAreaId() { return workAreaId; }
        public byte[] reserved2() { return reserved2; }
        public int setFieldsFlag() { return setFieldsFlag; }
        public byte[] reserved3() { return reserved3; }
        public Dbf _root() { return _root; }
        public Dbf.Header2 _parent() { return _parent; }
    }
    public static class Header1 extends KaitaiStruct {
        public static Header1 fromFile(String fileName) throws IOException {
            return new Header1(new KaitaiStream(fileName));
        }

        public Header1(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header1(KaitaiStream _io, Dbf _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header1(KaitaiStream _io, Dbf _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.version = this._io.readU1();
            this.lastUpdateY = this._io.readU1();
            this.lastUpdateM = this._io.readU1();
            this.lastUpdateD = this._io.readU1();
            this.numRecords = this._io.readU4le();
            this.headerSize = this._io.readU2le();
            this.recordSize = this._io.readU2le();
        }
        private Integer dbaseLevel;
        public Integer dbaseLevel() {
            if (this.dbaseLevel != null)
                return this.dbaseLevel;
            int _tmp = (int) ((version() & 7));
            this.dbaseLevel = _tmp;
            return this.dbaseLevel;
        }
        private int version;
        private int lastUpdateY;
        private int lastUpdateM;
        private int lastUpdateD;
        private long numRecords;
        private int headerSize;
        private int recordSize;
        private Dbf _root;
        private Dbf _parent;
        public int version() { return version; }
        public int lastUpdateY() { return lastUpdateY; }
        public int lastUpdateM() { return lastUpdateM; }
        public int lastUpdateD() { return lastUpdateD; }
        public long numRecords() { return numRecords; }
        public int headerSize() { return headerSize; }
        public int recordSize() { return recordSize; }
        public Dbf _root() { return _root; }
        public Dbf _parent() { return _parent; }
    }
    public static class HeaderDbase3 extends KaitaiStruct {
        public static HeaderDbase3 fromFile(String fileName) throws IOException {
            return new HeaderDbase3(new KaitaiStream(fileName));
        }

        public HeaderDbase3(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public HeaderDbase3(KaitaiStream _io, Dbf.Header2 _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public HeaderDbase3(KaitaiStream _io, Dbf.Header2 _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.readBytes(3);
            this.reserved2 = this._io.readBytes(13);
            this.reserved3 = this._io.readBytes(4);
        }
        private byte[] reserved1;
        private byte[] reserved2;
        private byte[] reserved3;
        private Dbf _root;
        private Dbf.Header2 _parent;
        public byte[] reserved1() { return reserved1; }
        public byte[] reserved2() { return reserved2; }
        public byte[] reserved3() { return reserved3; }
        public Dbf _root() { return _root; }
        public Dbf.Header2 _parent() { return _parent; }
    }
    public static class HeaderDbase7 extends KaitaiStruct {
        public static HeaderDbase7 fromFile(String fileName) throws IOException {
            return new HeaderDbase7(new KaitaiStream(fileName));
        }

        public HeaderDbase7(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public HeaderDbase7(KaitaiStream _io, Dbf.Header2 _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public HeaderDbase7(KaitaiStream _io, Dbf.Header2 _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.ensureFixedContents(new byte[] { 0, 0 });
            this.hasIncompleteTransaction = this._io.readU1();
            this.dbaseIvEncryption = this._io.readU1();
            this.reserved2 = this._io.readBytes(12);
            this.productionMdx = this._io.readU1();
            this.languageDriverId = this._io.readU1();
            this.reserved3 = this._io.ensureFixedContents(new byte[] { 0, 0 });
            this.languageDriverName = this._io.readBytes(32);
            this.reserved4 = this._io.readBytes(4);
        }
        private byte[] reserved1;
        private int hasIncompleteTransaction;
        private int dbaseIvEncryption;
        private byte[] reserved2;
        private int productionMdx;
        private int languageDriverId;
        private byte[] reserved3;
        private byte[] languageDriverName;
        private byte[] reserved4;
        private Dbf _root;
        private Dbf.Header2 _parent;
        public byte[] reserved1() { return reserved1; }
        public int hasIncompleteTransaction() { return hasIncompleteTransaction; }
        public int dbaseIvEncryption() { return dbaseIvEncryption; }
        public byte[] reserved2() { return reserved2; }
        public int productionMdx() { return productionMdx; }
        public int languageDriverId() { return languageDriverId; }
        public byte[] reserved3() { return reserved3; }
        public byte[] languageDriverName() { return languageDriverName; }
        public byte[] reserved4() { return reserved4; }
        public Dbf _root() { return _root; }
        public Dbf.Header2 _parent() { return _parent; }
    }
    private Header1 header1;
    private Header2 header2;
    private ArrayList<byte[]> records;
    private Dbf _root;
    private KaitaiStruct _parent;
    private byte[] _raw_header2;
    public Header1 header1() { return header1; }
    public Header2 header2() { return header2; }
    public ArrayList<byte[]> records() { return records; }
    public Dbf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_header2() { return _raw_header2; }
}
