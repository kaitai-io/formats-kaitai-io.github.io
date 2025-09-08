// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * .dbf is a relational database format introduced in DOS database
 * management system dBASE in 1982.
 * 
 * One .dbf file corresponds to one table and contains a series of headers,
 * specification of fields, and a number of fixed-size records.
 * @see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">Source</a>
 */
public class Dbf extends KaitaiStruct.ReadWrite {
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
    public Dbf() {
        this(null, null, null);
    }

    public Dbf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dbf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Dbf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dbf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header1 = new Header1(this._io, this, _root);
        this.header1._read();
        this._raw_header2 = this._io.readBytes((header1().lenHeader() - 12) - 1);
        KaitaiStream _io__raw_header2 = new ByteBufferKaitaiStream(this._raw_header2);
        this.header2 = new Header2(_io__raw_header2, this, _root);
        this.header2._read();
        this.headerTerminator = this._io.readBytes(1);
        if (!(Arrays.equals(this.headerTerminator, new byte[] { 13 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 13 }, this.headerTerminator, this._io, "/seq/2");
        }
        this._raw_records = new ArrayList<byte[]>();
        this.records = new ArrayList<Record>();
        for (int i = 0; i < header1().numRecords(); i++) {
            this._raw_records.add(this._io.readBytes(header1().lenRecord()));
            KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(this._raw_records.get(i));
            Record _t_records = new Record(_io__raw_records, this, _root);
            try {
                _t_records._read();
            } finally {
                this.records.add(_t_records);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header1._fetchInstances();
        this.header2._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header1._write_Seq(this._io);
        final KaitaiStream _io__raw_header2 = new ByteBufferKaitaiStream((header1().lenHeader() - 12) - 1);
        this._io.addChildStream(_io__raw_header2);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + ((header1().lenHeader() - 12) - 1));
            final Dbf _this = this;
            _io__raw_header2.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header2 = _io__raw_header2.toByteArray();
                    if (_this._raw_header2.length != (header1().lenHeader() - 12) - 1)
                        throw new ConsistencyError("raw(header2)", (header1().lenHeader() - 12) - 1, _this._raw_header2.length);
                    parent.writeBytes(_this._raw_header2);
                }
            });
        }
        this.header2._write_Seq(_io__raw_header2);
        this._io.writeBytes(this.headerTerminator);
        this._raw_records = new ArrayList<byte[]>();
        for (int i = 0; i < this.records.size(); i++) {
            final KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(header1().lenRecord());
            this._io.addChildStream(_io__raw_records);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (header1().lenRecord()));
                final Dbf _this = this;
                final int _i = i;
                _io__raw_records.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_records.add(_io__raw_records.toByteArray());
                        if (_this._raw_records.get(((Number) (_i)).intValue()).length != header1().lenRecord())
                            throw new ConsistencyError("raw(records)", header1().lenRecord(), _this._raw_records.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_records.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.records.get(((Number) (i)).intValue())._write_Seq(_io__raw_records);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header1._root(), _root()))
            throw new ConsistencyError("header1", _root(), this.header1._root());
        if (!Objects.equals(this.header1._parent(), this))
            throw new ConsistencyError("header1", this, this.header1._parent());
        if (!Objects.equals(this.header2._root(), _root()))
            throw new ConsistencyError("header2", _root(), this.header2._root());
        if (!Objects.equals(this.header2._parent(), this))
            throw new ConsistencyError("header2", this, this.header2._parent());
        if (this.headerTerminator.length != 1)
            throw new ConsistencyError("header_terminator", 1, this.headerTerminator.length);
        if (!(Arrays.equals(this.headerTerminator, new byte[] { 13 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 13 }, this.headerTerminator, null, "/seq/2");
        }
        if (this.records.size() != header1().numRecords())
            throw new ConsistencyError("records", header1().numRecords(), this.records.size());
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Field extends KaitaiStruct.ReadWrite {
        public static Field fromFile(String fileName) throws IOException {
            return new Field(new ByteBufferKaitaiStream(fileName));
        }
        public Field() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 11, (byte) 0, (byte) 0);
            this._io.writeU1(this.datatype);
            this._io.writeU4le(this.dataAddress);
            this._io.writeU1(this.length);
            this._io.writeU1(this.decimalCount);
            this._io.writeBytes(this.reserved1);
            this._io.writeU1(this.workAreaId);
            this._io.writeBytes(this.reserved2);
            this._io.writeU1(this.setFieldsFlag);
            this._io.writeBytes(this.reserved3);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 11)
                throw new ConsistencyError("name", 11, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (this.reserved1.length != 2)
                throw new ConsistencyError("reserved1", 2, this.reserved1.length);
            if (this.reserved2.length != 2)
                throw new ConsistencyError("reserved2", 2, this.reserved2.length);
            if (this.reserved3.length != 8)
                throw new ConsistencyError("reserved3", 8, this.reserved3.length);
            _dirty = false;
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
        public void setName(String _v) { _dirty = true; name = _v; }
        public int datatype() { return datatype; }
        public void setDatatype(int _v) { _dirty = true; datatype = _v; }
        public long dataAddress() { return dataAddress; }
        public void setDataAddress(long _v) { _dirty = true; dataAddress = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public int decimalCount() { return decimalCount; }
        public void setDecimalCount(int _v) { _dirty = true; decimalCount = _v; }
        public byte[] reserved1() { return reserved1; }
        public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }
        public int workAreaId() { return workAreaId; }
        public void setWorkAreaId(int _v) { _dirty = true; workAreaId = _v; }
        public byte[] reserved2() { return reserved2; }
        public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }
        public int setFieldsFlag() { return setFieldsFlag; }
        public void setSetFieldsFlag(int _v) { _dirty = true; setFieldsFlag = _v; }
        public byte[] reserved3() { return reserved3; }
        public void setReserved3(byte[] _v) { _dirty = true; reserved3 = _v; }
        public Dbf _root() { return _root; }
        public void set_root(Dbf _v) { _dirty = true; _root = _v; }
        public Dbf.Header2 _parent() { return _parent; }
        public void set_parent(Dbf.Header2 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">- section 1.1</a>
     */
    public static class Header1 extends KaitaiStruct.ReadWrite {
        public static Header1 fromFile(String fileName) throws IOException {
            return new Header1(new ByteBufferKaitaiStream(fileName));
        }
        public Header1() {
            this(null, null, null);
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
        }
        public void _read() {
            this.version = this._io.readU1();
            this.lastUpdateY = this._io.readU1();
            this.lastUpdateM = this._io.readU1();
            this.lastUpdateD = this._io.readU1();
            this.numRecords = this._io.readU4le();
            this.lenHeader = this._io.readU2le();
            this.lenRecord = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.version);
            this._io.writeU1(this.lastUpdateY);
            this._io.writeU1(this.lastUpdateM);
            this._io.writeU1(this.lastUpdateD);
            this._io.writeU4le(this.numRecords);
            this._io.writeU2le(this.lenHeader);
            this._io.writeU2le(this.lenRecord);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer dbaseLevel;
        public Integer dbaseLevel() {
            if (this.dbaseLevel != null)
                return this.dbaseLevel;
            this.dbaseLevel = ((Number) (version() & 7)).intValue();
            return this.dbaseLevel;
        }
        public void _invalidateDbaseLevel() { this.dbaseLevel = null; }
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
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public int lastUpdateY() { return lastUpdateY; }
        public void setLastUpdateY(int _v) { _dirty = true; lastUpdateY = _v; }
        public int lastUpdateM() { return lastUpdateM; }
        public void setLastUpdateM(int _v) { _dirty = true; lastUpdateM = _v; }
        public int lastUpdateD() { return lastUpdateD; }
        public void setLastUpdateD(int _v) { _dirty = true; lastUpdateD = _v; }
        public long numRecords() { return numRecords; }
        public void setNumRecords(long _v) { _dirty = true; numRecords = _v; }
        public int lenHeader() { return lenHeader; }
        public void setLenHeader(int _v) { _dirty = true; lenHeader = _v; }
        public int lenRecord() { return lenRecord; }
        public void setLenRecord(int _v) { _dirty = true; lenRecord = _v; }
        public Dbf _root() { return _root; }
        public void set_root(Dbf _v) { _dirty = true; _root = _v; }
        public Dbf _parent() { return _parent; }
        public void set_parent(Dbf _v) { _dirty = true; _parent = _v; }
    }
    public static class Header2 extends KaitaiStruct.ReadWrite {
        public static Header2 fromFile(String fileName) throws IOException {
            return new Header2(new ByteBufferKaitaiStream(fileName));
        }
        public Header2() {
            this(null, null, null);
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
        }
        public void _read() {
            if (_root().header1().dbaseLevel() == 3) {
                this.headerDbase3 = new HeaderDbase3(this._io, this, _root);
                this.headerDbase3._read();
            }
            if (_root().header1().dbaseLevel() == 7) {
                this.headerDbase7 = new HeaderDbase7(this._io, this, _root);
                this.headerDbase7._read();
            }
            this.fields = new ArrayList<Field>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Field _t_fields = new Field(this._io, this, _root);
                    try {
                        _t_fields._read();
                    } finally {
                        this.fields.add(_t_fields);
                    }
                    i++;
                }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            if (_root().header1().dbaseLevel() == 3) {
                this.headerDbase3._write_Seq(this._io);
            }
            if (_root().header1().dbaseLevel() == 7) {
                this.headerDbase7._write_Seq(this._io);
            }
            for (int i = 0; i < this.fields.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("fields", 0, this._io.size() - this._io.pos());
                this.fields.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("fields", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (_root().header1().dbaseLevel() == 3) {
                if (!Objects.equals(this.headerDbase3._root(), _root()))
                    throw new ConsistencyError("header_dbase_3", _root(), this.headerDbase3._root());
                if (!Objects.equals(this.headerDbase3._parent(), this))
                    throw new ConsistencyError("header_dbase_3", this, this.headerDbase3._parent());
            }
            if (_root().header1().dbaseLevel() == 7) {
                if (!Objects.equals(this.headerDbase7._root(), _root()))
                    throw new ConsistencyError("header_dbase_7", _root(), this.headerDbase7._root());
                if (!Objects.equals(this.headerDbase7._parent(), this))
                    throw new ConsistencyError("header_dbase_7", this, this.headerDbase7._parent());
            }
            for (int i = 0; i < this.fields.size(); i++) {
                if (!Objects.equals(this.fields.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("fields", _root(), this.fields.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.fields.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("fields", this, this.fields.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private HeaderDbase3 headerDbase3;
        private HeaderDbase7 headerDbase7;
        private List<Field> fields;
        private Dbf _root;
        private Dbf _parent;
        public HeaderDbase3 headerDbase3() { return headerDbase3; }
        public void setHeaderDbase3(HeaderDbase3 _v) { _dirty = true; headerDbase3 = _v; }
        public HeaderDbase7 headerDbase7() { return headerDbase7; }
        public void setHeaderDbase7(HeaderDbase7 _v) { _dirty = true; headerDbase7 = _v; }
        public List<Field> fields() { return fields; }
        public void setFields(List<Field> _v) { _dirty = true; fields = _v; }
        public Dbf _root() { return _root; }
        public void set_root(Dbf _v) { _dirty = true; _root = _v; }
        public Dbf _parent() { return _parent; }
        public void set_parent(Dbf _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderDbase3 extends KaitaiStruct.ReadWrite {
        public static HeaderDbase3 fromFile(String fileName) throws IOException {
            return new HeaderDbase3(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderDbase3() {
            this(null, null, null);
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
        }
        public void _read() {
            this.reserved1 = this._io.readBytes(3);
            this.reserved2 = this._io.readBytes(13);
            this.reserved3 = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.reserved1);
            this._io.writeBytes(this.reserved2);
            this._io.writeBytes(this.reserved3);
        }

        public void _check() {
            if (this.reserved1.length != 3)
                throw new ConsistencyError("reserved1", 3, this.reserved1.length);
            if (this.reserved2.length != 13)
                throw new ConsistencyError("reserved2", 13, this.reserved2.length);
            if (this.reserved3.length != 4)
                throw new ConsistencyError("reserved3", 4, this.reserved3.length);
            _dirty = false;
        }
        private byte[] reserved1;
        private byte[] reserved2;
        private byte[] reserved3;
        private Dbf _root;
        private Dbf.Header2 _parent;
        public byte[] reserved1() { return reserved1; }
        public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }
        public byte[] reserved2() { return reserved2; }
        public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }
        public byte[] reserved3() { return reserved3; }
        public void setReserved3(byte[] _v) { _dirty = true; reserved3 = _v; }
        public Dbf _root() { return _root; }
        public void set_root(Dbf _v) { _dirty = true; _root = _v; }
        public Dbf.Header2 _parent() { return _parent; }
        public void set_parent(Dbf.Header2 _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderDbase7 extends KaitaiStruct.ReadWrite {
        public static HeaderDbase7 fromFile(String fileName) throws IOException {
            return new HeaderDbase7(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderDbase7() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.reserved1);
            this._io.writeU1(this.hasIncompleteTransaction);
            this._io.writeU1(this.dbaseIvEncryption);
            this._io.writeBytes(this.reserved2);
            this._io.writeU1(this.productionMdx);
            this._io.writeU1(this.languageDriverId);
            this._io.writeBytes(this.reserved3);
            this._io.writeBytes(this.languageDriverName);
            this._io.writeBytes(this.reserved4);
        }

        public void _check() {
            if (this.reserved1.length != 2)
                throw new ConsistencyError("reserved1", 2, this.reserved1.length);
            if (!(Arrays.equals(this.reserved1, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved1, null, "/types/header_dbase_7/seq/0");
            }
            if (this.reserved2.length != 12)
                throw new ConsistencyError("reserved2", 12, this.reserved2.length);
            if (this.reserved3.length != 2)
                throw new ConsistencyError("reserved3", 2, this.reserved3.length);
            if (!(Arrays.equals(this.reserved3, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved3, null, "/types/header_dbase_7/seq/6");
            }
            if (this.languageDriverName.length != 32)
                throw new ConsistencyError("language_driver_name", 32, this.languageDriverName.length);
            if (this.reserved4.length != 4)
                throw new ConsistencyError("reserved4", 4, this.reserved4.length);
            _dirty = false;
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
        public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }
        public int hasIncompleteTransaction() { return hasIncompleteTransaction; }
        public void setHasIncompleteTransaction(int _v) { _dirty = true; hasIncompleteTransaction = _v; }
        public int dbaseIvEncryption() { return dbaseIvEncryption; }
        public void setDbaseIvEncryption(int _v) { _dirty = true; dbaseIvEncryption = _v; }
        public byte[] reserved2() { return reserved2; }
        public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }
        public int productionMdx() { return productionMdx; }
        public void setProductionMdx(int _v) { _dirty = true; productionMdx = _v; }
        public int languageDriverId() { return languageDriverId; }
        public void setLanguageDriverId(int _v) { _dirty = true; languageDriverId = _v; }
        public byte[] reserved3() { return reserved3; }
        public void setReserved3(byte[] _v) { _dirty = true; reserved3 = _v; }
        public byte[] languageDriverName() { return languageDriverName; }
        public void setLanguageDriverName(byte[] _v) { _dirty = true; languageDriverName = _v; }
        public byte[] reserved4() { return reserved4; }
        public void setReserved4(byte[] _v) { _dirty = true; reserved4 = _v; }
        public Dbf _root() { return _root; }
        public void set_root(Dbf _v) { _dirty = true; _root = _v; }
        public Dbf.Header2 _parent() { return _parent; }
        public void set_parent(Dbf.Header2 _v) { _dirty = true; _parent = _v; }
    }
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
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
        }
        public void _read() {
            this.deleted = Dbf.DeleteState.byId(this._io.readU1());
            this.recordFields = new ArrayList<byte[]>();
            for (int i = 0; i < _root().header2().fields().size(); i++) {
                this.recordFields.add(this._io.readBytes(_root().header2().fields().get(((Number) (i)).intValue()).length()));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.recordFields.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.deleted.id())).intValue());
            for (int i = 0; i < this.recordFields.size(); i++) {
                this._io.writeBytes(this.recordFields.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.recordFields.size() != _root().header2().fields().size())
                throw new ConsistencyError("record_fields", _root().header2().fields().size(), this.recordFields.size());
            for (int i = 0; i < this.recordFields.size(); i++) {
                if (this.recordFields.get(((Number) (i)).intValue()).length != _root().header2().fields().get(((Number) (i)).intValue()).length())
                    throw new ConsistencyError("record_fields", _root().header2().fields().get(((Number) (i)).intValue()).length(), this.recordFields.get(((Number) (i)).intValue()).length);
            }
            _dirty = false;
        }
        private DeleteState deleted;
        private List<byte[]> recordFields;
        private Dbf _root;
        private Dbf _parent;
        public DeleteState deleted() { return deleted; }
        public void setDeleted(DeleteState _v) { _dirty = true; deleted = _v; }
        public List<byte[]> recordFields() { return recordFields; }
        public void setRecordFields(List<byte[]> _v) { _dirty = true; recordFields = _v; }
        public Dbf _root() { return _root; }
        public void set_root(Dbf _v) { _dirty = true; _root = _v; }
        public Dbf _parent() { return _parent; }
        public void set_parent(Dbf _v) { _dirty = true; _parent = _v; }
    }
    private Header1 header1;
    private Header2 header2;
    private byte[] headerTerminator;
    private List<Record> records;
    private Dbf _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header2;
    private List<byte[]> _raw_records;
    public Header1 header1() { return header1; }
    public void setHeader1(Header1 _v) { _dirty = true; header1 = _v; }
    public Header2 header2() { return header2; }
    public void setHeader2(Header2 _v) { _dirty = true; header2 = _v; }
    public byte[] headerTerminator() { return headerTerminator; }
    public void setHeaderTerminator(byte[] _v) { _dirty = true; headerTerminator = _v; }
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public Dbf _root() { return _root; }
    public void set_root(Dbf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header2() { return _raw_header2; }
    public void set_raw_Header2(byte[] _v) { _dirty = true; _raw_header2 = _v; }
    public List<byte[]> _raw_records() { return _raw_records; }
    public void set_raw_Records(List<byte[]> _v) { _dirty = true; _raw_records = _v; }
}
