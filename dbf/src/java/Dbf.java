// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.util.List;


/**
 * .dbf is a relational database format introduced in DOS database
 * management system dBASE in 1982.
 * 
 * One .dbf file corresponds to one table and contains a series of headers,
 * specification of fields, and a number of fixed-size records.
 * @see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">Source</a>
 */
public class Dbf extends KaitaiStruct {
    public static Dbf fromFile(String fileName) throws IOException {
        return new Dbf(new ByteBufferKaitaiStream(fileName));
    }

    public enum DeleteState {
        FALSE(32),
        TRUE(42);

        private final long id;
        DeleteState(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DeleteState> byId = new HashMap<Long, DeleteState>(2);
        static {
            for (DeleteState e : DeleteState.values())
                byId.put(e.id(), e);
        }
        public static DeleteState byId(long id) { return byId.get(id); }
    }

    public Dbf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dbf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Dbf(KaitaiStream _io, KaitaiStruct _parent, Dbf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header1 = new Header1(this._io, this, _root);
        KaitaiStream _io_header2 = this._io.substream((header1().lenHeader() - 12) - 1);
        this.header2 = new Header2(_io_header2, this, _root);
        this.headerTerminator = this._io.readBytes(1);
        if (!(Arrays.equals(this.headerTerminator, new byte[] { 13 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 13 }, this.headerTerminator, this._io, "/seq/2");
        }
        this.records = new ArrayList<Record>();
        for (int i = 0; i < header1().numRecords(); i++) {
            KaitaiStream _io_records = this._io.substream(header1().lenRecord());
            this.records.add(new Record(_io_records, this, _root));
        }
    }

    public void _fetchInstances() {
        this.header1._fetchInstances();
        this.header2._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Field extends KaitaiStruct {
        public static Field fromFile(String fileName) throws IOException {
            return new Field(new ByteBufferKaitaiStream(fileName));
        }

        public Field(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Field(KaitaiStream _io, Dbf.Header2 _parent) {
            this(_io, _parent, null);
        }

        public Field(KaitaiStream _io, Dbf.Header2 _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(11), (byte) 0, false), StandardCharsets.US_ASCII);
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

        public void _fetchInstances() {
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

    /**
     * @see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">- section 1.1</a>
     */
    public static class Header1 extends KaitaiStruct {
        public static Header1 fromFile(String fileName) throws IOException {
            return new Header1(new ByteBufferKaitaiStream(fileName));
        }

        public Header1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header1(KaitaiStream _io, Dbf _parent) {
            this(_io, _parent, null);
        }

        public Header1(KaitaiStream _io, Dbf _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU1();
            this.lastUpdateY = this._io.readU1();
            this.lastUpdateM = this._io.readU1();
            this.lastUpdateD = this._io.readU1();
            this.numRecords = this._io.readU4le();
            this.lenHeader = this._io.readU2le();
            this.lenRecord = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private Integer dbaseLevel;
        public Integer dbaseLevel() {
            if (this.dbaseLevel != null)
                return this.dbaseLevel;
            this.dbaseLevel = ((Number) (version() & 7)).intValue();
            return this.dbaseLevel;
        }
        private int version;
        private int lastUpdateY;
        private int lastUpdateM;
        private int lastUpdateD;
        private long numRecords;
        private int lenHeader;
        private int lenRecord;
        private Dbf _root;
        private Dbf _parent;
        public int version() { return version; }
        public int lastUpdateY() { return lastUpdateY; }
        public int lastUpdateM() { return lastUpdateM; }
        public int lastUpdateD() { return lastUpdateD; }
        public long numRecords() { return numRecords; }
        public int lenHeader() { return lenHeader; }
        public int lenRecord() { return lenRecord; }
        public Dbf _root() { return _root; }
        public Dbf _parent() { return _parent; }
    }
    public static class Header2 extends KaitaiStruct {
        public static Header2 fromFile(String fileName) throws IOException {
            return new Header2(new ByteBufferKaitaiStream(fileName));
        }

        public Header2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header2(KaitaiStream _io, Dbf _parent) {
            this(_io, _parent, null);
        }

        public Header2(KaitaiStream _io, Dbf _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            if (_root().header1().dbaseLevel() == 3) {
                this.headerDbase3 = new HeaderDbase3(this._io, this, _root);
            }
            if (_root().header1().dbaseLevel() == 7) {
                this.headerDbase7 = new HeaderDbase7(this._io, this, _root);
            }
            this.fields = new ArrayList<Field>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.fields.add(new Field(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            if (_root().header1().dbaseLevel() == 3) {
                this.headerDbase3._fetchInstances();
            }
            if (_root().header1().dbaseLevel() == 7) {
                this.headerDbase7._fetchInstances();
            }
            for (int i = 0; i < this.fields.size(); i++) {
                this.fields.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private HeaderDbase3 headerDbase3;
        private HeaderDbase7 headerDbase7;
        private List<Field> fields;
        private Dbf _root;
        private Dbf _parent;
        public HeaderDbase3 headerDbase3() { return headerDbase3; }
        public HeaderDbase7 headerDbase7() { return headerDbase7; }
        public List<Field> fields() { return fields; }
        public Dbf _root() { return _root; }
        public Dbf _parent() { return _parent; }
    }
    public static class HeaderDbase3 extends KaitaiStruct {
        public static HeaderDbase3 fromFile(String fileName) throws IOException {
            return new HeaderDbase3(new ByteBufferKaitaiStream(fileName));
        }

        public HeaderDbase3(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderDbase3(KaitaiStream _io, Dbf.Header2 _parent) {
            this(_io, _parent, null);
        }

        public HeaderDbase3(KaitaiStream _io, Dbf.Header2 _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.readBytes(3);
            this.reserved2 = this._io.readBytes(13);
            this.reserved3 = this._io.readBytes(4);
        }

        public void _fetchInstances() {
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
            return new HeaderDbase7(new ByteBufferKaitaiStream(fileName));
        }

        public HeaderDbase7(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderDbase7(KaitaiStream _io, Dbf.Header2 _parent) {
            this(_io, _parent, null);
        }

        public HeaderDbase7(KaitaiStream _io, Dbf.Header2 _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.readBytes(2);
            if (!(Arrays.equals(this.reserved1, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved1, this._io, "/types/header_dbase_7/seq/0");
            }
            this.hasIncompleteTransaction = this._io.readU1();
            this.dbaseIvEncryption = this._io.readU1();
            this.reserved2 = this._io.readBytes(12);
            this.productionMdx = this._io.readU1();
            this.languageDriverId = this._io.readU1();
            this.reserved3 = this._io.readBytes(2);
            if (!(Arrays.equals(this.reserved3, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved3, this._io, "/types/header_dbase_7/seq/6");
            }
            this.languageDriverName = this._io.readBytes(32);
            this.reserved4 = this._io.readBytes(4);
        }

        public void _fetchInstances() {
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
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, Dbf _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, Dbf _parent, Dbf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.deleted = Dbf.DeleteState.byId(this._io.readU1());
            this.recordFields = new ArrayList<byte[]>();
            for (int i = 0; i < _root().header2().fields().size(); i++) {
                this.recordFields.add(this._io.readBytes(_root().header2().fields().get(((Number) (i)).intValue()).length()));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.recordFields.size(); i++) {
            }
        }
        private DeleteState deleted;
        private List<byte[]> recordFields;
        private Dbf _root;
        private Dbf _parent;
        public DeleteState deleted() { return deleted; }
        public List<byte[]> recordFields() { return recordFields; }
        public Dbf _root() { return _root; }
        public Dbf _parent() { return _parent; }
    }
    private Header1 header1;
    private Header2 header2;
    private byte[] headerTerminator;
    private List<Record> records;
    private Dbf _root;
    private KaitaiStruct _parent;
    public Header1 header1() { return header1; }
    public Header2 header2() { return header2; }
    public byte[] headerTerminator() { return headerTerminator; }
    public List<Record> records() { return records; }
    public Dbf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
