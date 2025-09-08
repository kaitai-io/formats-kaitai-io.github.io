// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * SQLite3 is a popular serverless SQL engine, implemented as a library
 * to be used within other applications. It keeps its databases as
 * regular disk files.
 * 
 * Every database file is segmented into pages. First page (starting at
 * the very beginning) is special: it contains a file-global header
 * which specifies some data relevant to proper parsing (i.e. format
 * versions, size of page, etc). After the header, normal contents of
 * the first page follow.
 * 
 * Each page would be of some type, and generally, they would be
 * reached via the links starting from the first page. First page type
 * (`root_page`) is always "btree_page".
 * @see <a href="https://www.sqlite.org/fileformat.html">Source</a>
 */
public class Sqlite3 extends KaitaiStruct.ReadWrite {
    public static Sqlite3 fromFile(String fileName) throws IOException {
        return new Sqlite3(new ByteBufferKaitaiStream(fileName));
    }

    public enum Encodings {
        UTF_8(1),
        UTF_16LE(2),
        UTF_16BE(3);

        private final long id;
        Encodings(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Encodings> byId = new HashMap<Long, Encodings>(3);
        static {
            for (Encodings e : Encodings.values())
                byId.put(e.id(), e);
        }
        public static Encodings byId(long id) { return byId.get(id); }
    }

    public enum Versions {
        LEGACY(1),
        WAL(2);

        private final long id;
        Versions(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Versions> byId = new HashMap<Long, Versions>(2);
        static {
            for (Versions e : Versions.values())
                byId.put(e.id(), e);
        }
        public static Versions byId(long id) { return byId.get(id); }
    }
    public Sqlite3() {
        this(null, null, null);
    }

    public Sqlite3(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Sqlite3(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Sqlite3(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Sqlite3 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(16);
        if (!(Arrays.equals(this.magic, new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }, this.magic, this._io, "/seq/0");
        }
        this.lenPageMod = this._io.readU2be();
        this.writeVersion = Versions.byId(this._io.readU1());
        this.readVersion = Versions.byId(this._io.readU1());
        this.reservedSpace = this._io.readU1();
        this.maxPayloadFrac = this._io.readU1();
        this.minPayloadFrac = this._io.readU1();
        this.leafPayloadFrac = this._io.readU1();
        this.fileChangeCounter = this._io.readU4be();
        this.numPages = this._io.readU4be();
        this.firstFreelistTrunkPage = this._io.readU4be();
        this.numFreelistPages = this._io.readU4be();
        this.schemaCookie = this._io.readU4be();
        this.schemaFormat = this._io.readU4be();
        this.defPageCacheSize = this._io.readU4be();
        this.largestRootPage = this._io.readU4be();
        this.textEncoding = Encodings.byId(this._io.readU4be());
        this.userVersion = this._io.readU4be();
        this.isIncrementalVacuum = this._io.readU4be();
        this.applicationId = this._io.readU4be();
        this.reserved = this._io.readBytes(20);
        this.versionValidFor = this._io.readU4be();
        this.sqliteVersionNumber = this._io.readU4be();
        this.rootPage = new BtreePage(this._io, this, _root);
        this.rootPage._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.rootPage._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU2be(this.lenPageMod);
        this._io.writeU1(((Number) (this.writeVersion.id())).intValue());
        this._io.writeU1(((Number) (this.readVersion.id())).intValue());
        this._io.writeU1(this.reservedSpace);
        this._io.writeU1(this.maxPayloadFrac);
        this._io.writeU1(this.minPayloadFrac);
        this._io.writeU1(this.leafPayloadFrac);
        this._io.writeU4be(this.fileChangeCounter);
        this._io.writeU4be(this.numPages);
        this._io.writeU4be(this.firstFreelistTrunkPage);
        this._io.writeU4be(this.numFreelistPages);
        this._io.writeU4be(this.schemaCookie);
        this._io.writeU4be(this.schemaFormat);
        this._io.writeU4be(this.defPageCacheSize);
        this._io.writeU4be(this.largestRootPage);
        this._io.writeU4be(((Number) (this.textEncoding.id())).longValue());
        this._io.writeU4be(this.userVersion);
        this._io.writeU4be(this.isIncrementalVacuum);
        this._io.writeU4be(this.applicationId);
        this._io.writeBytes(this.reserved);
        this._io.writeU4be(this.versionValidFor);
        this._io.writeU4be(this.sqliteVersionNumber);
        this.rootPage._write_Seq(this._io);
    }

    public void _check() {
        if (this.magic.length != 16)
            throw new ConsistencyError("magic", 16, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }, this.magic, null, "/seq/0");
        }
        if (this.reserved.length != 20)
            throw new ConsistencyError("reserved", 20, this.reserved.length);
        if (!Objects.equals(this.rootPage._root(), _root()))
            throw new ConsistencyError("root_page", _root(), this.rootPage._root());
        if (!Objects.equals(this.rootPage._parent(), this))
            throw new ConsistencyError("root_page", this, this.rootPage._parent());
        _dirty = false;
    }
    public static class BtreePage extends KaitaiStruct.ReadWrite {
        public static BtreePage fromFile(String fileName) throws IOException {
            return new BtreePage(new ByteBufferKaitaiStream(fileName));
        }
        public BtreePage() {
            this(null, null, null);
        }

        public BtreePage(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BtreePage(KaitaiStream _io, Sqlite3 _parent) {
            this(_io, _parent, null);
        }

        public BtreePage(KaitaiStream _io, Sqlite3 _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.pageType = this._io.readU1();
            this.firstFreeblock = this._io.readU2be();
            this.numCells = this._io.readU2be();
            this.ofsCells = this._io.readU2be();
            this.numFragFreeBytes = this._io.readU1();
            if ( ((pageType() == 2) || (pageType() == 5)) ) {
                this.rightPtr = this._io.readU4be();
            }
            this.cells = new ArrayList<RefCell>();
            for (int i = 0; i < numCells(); i++) {
                RefCell _t_cells = new RefCell(this._io, this, _root);
                try {
                    _t_cells._read();
                } finally {
                    this.cells.add(_t_cells);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((pageType() == 2) || (pageType() == 5)) ) {
            }
            for (int i = 0; i < this.cells.size(); i++) {
                this.cells.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.pageType);
            this._io.writeU2be(this.firstFreeblock);
            this._io.writeU2be(this.numCells);
            this._io.writeU2be(this.ofsCells);
            this._io.writeU1(this.numFragFreeBytes);
            if ( ((pageType() == 2) || (pageType() == 5)) ) {
                this._io.writeU4be(this.rightPtr);
            }
            for (int i = 0; i < this.cells.size(); i++) {
                this.cells.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if ( ((pageType() == 2) || (pageType() == 5)) ) {
            }
            if (this.cells.size() != numCells())
                throw new ConsistencyError("cells", numCells(), this.cells.size());
            for (int i = 0; i < this.cells.size(); i++) {
                if (!Objects.equals(this.cells.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("cells", _root(), this.cells.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.cells.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("cells", this, this.cells.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int pageType;
        private int firstFreeblock;
        private int numCells;
        private int ofsCells;
        private int numFragFreeBytes;
        private Long rightPtr;
        private List<RefCell> cells;
        private Sqlite3 _root;
        private Sqlite3 _parent;
        public int pageType() { return pageType; }
        public void setPageType(int _v) { _dirty = true; pageType = _v; }
        public int firstFreeblock() { return firstFreeblock; }
        public void setFirstFreeblock(int _v) { _dirty = true; firstFreeblock = _v; }
        public int numCells() { return numCells; }
        public void setNumCells(int _v) { _dirty = true; numCells = _v; }
        public int ofsCells() { return ofsCells; }
        public void setOfsCells(int _v) { _dirty = true; ofsCells = _v; }
        public int numFragFreeBytes() { return numFragFreeBytes; }
        public void setNumFragFreeBytes(int _v) { _dirty = true; numFragFreeBytes = _v; }
        public Long rightPtr() { return rightPtr; }
        public void setRightPtr(Long _v) { _dirty = true; rightPtr = _v; }
        public List<RefCell> cells() { return cells; }
        public void setCells(List<RefCell> _v) { _dirty = true; cells = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3 _parent() { return _parent; }
        public void set_parent(Sqlite3 _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellIndexInterior extends KaitaiStruct.ReadWrite {
        public static CellIndexInterior fromFile(String fileName) throws IOException {
            return new CellIndexInterior(new ByteBufferKaitaiStream(fileName));
        }
        public CellIndexInterior() {
            this(null, null, null);
        }

        public CellIndexInterior(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CellIndexInterior(KaitaiStream _io, Sqlite3.RefCell _parent) {
            this(_io, _parent, null);
        }

        public CellIndexInterior(KaitaiStream _io, Sqlite3.RefCell _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.leftChildPage = this._io.readU4be();
            this.lenPayload = new VlqBase128Be(this._io);
            this.lenPayload._read();
            this._raw_payload = this._io.readBytes(lenPayload().value());
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
            this.payload = new CellPayload(_io__raw_payload, this, _root);
            this.payload._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lenPayload._fetchInstances();
            this.payload._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.leftChildPage);
            this.lenPayload._write_Seq(this._io);
            final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenPayload().value());
            this._io.addChildStream(_io__raw_payload);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenPayload().value()));
                final CellIndexInterior _this = this;
                _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_payload = _io__raw_payload.toByteArray();
                        if (_this._raw_payload.length != lenPayload().value())
                            throw new ConsistencyError("raw(payload)", lenPayload().value(), _this._raw_payload.length);
                        parent.writeBytes(_this._raw_payload);
                    }
                });
            }
            this.payload._write_Seq(_io__raw_payload);
        }

        public void _check() {
            if (!Objects.equals(this.payload._root(), _root()))
                throw new ConsistencyError("payload", _root(), this.payload._root());
            if (!Objects.equals(this.payload._parent(), this))
                throw new ConsistencyError("payload", this, this.payload._parent());
            _dirty = false;
        }
        private long leftChildPage;
        private VlqBase128Be lenPayload;
        private CellPayload payload;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        private byte[] _raw_payload;
        public long leftChildPage() { return leftChildPage; }
        public void setLeftChildPage(long _v) { _dirty = true; leftChildPage = _v; }
        public VlqBase128Be lenPayload() { return lenPayload; }
        public void setLenPayload(VlqBase128Be _v) { _dirty = true; lenPayload = _v; }
        public CellPayload payload() { return payload; }
        public void setPayload(CellPayload _v) { _dirty = true; payload = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public void set_parent(Sqlite3.RefCell _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_payload() { return _raw_payload; }
        public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellIndexLeaf extends KaitaiStruct.ReadWrite {
        public static CellIndexLeaf fromFile(String fileName) throws IOException {
            return new CellIndexLeaf(new ByteBufferKaitaiStream(fileName));
        }
        public CellIndexLeaf() {
            this(null, null, null);
        }

        public CellIndexLeaf(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CellIndexLeaf(KaitaiStream _io, Sqlite3.RefCell _parent) {
            this(_io, _parent, null);
        }

        public CellIndexLeaf(KaitaiStream _io, Sqlite3.RefCell _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenPayload = new VlqBase128Be(this._io);
            this.lenPayload._read();
            this._raw_payload = this._io.readBytes(lenPayload().value());
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
            this.payload = new CellPayload(_io__raw_payload, this, _root);
            this.payload._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lenPayload._fetchInstances();
            this.payload._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.lenPayload._write_Seq(this._io);
            final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenPayload().value());
            this._io.addChildStream(_io__raw_payload);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenPayload().value()));
                final CellIndexLeaf _this = this;
                _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_payload = _io__raw_payload.toByteArray();
                        if (_this._raw_payload.length != lenPayload().value())
                            throw new ConsistencyError("raw(payload)", lenPayload().value(), _this._raw_payload.length);
                        parent.writeBytes(_this._raw_payload);
                    }
                });
            }
            this.payload._write_Seq(_io__raw_payload);
        }

        public void _check() {
            if (!Objects.equals(this.payload._root(), _root()))
                throw new ConsistencyError("payload", _root(), this.payload._root());
            if (!Objects.equals(this.payload._parent(), this))
                throw new ConsistencyError("payload", this, this.payload._parent());
            _dirty = false;
        }
        private VlqBase128Be lenPayload;
        private CellPayload payload;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        private byte[] _raw_payload;
        public VlqBase128Be lenPayload() { return lenPayload; }
        public void setLenPayload(VlqBase128Be _v) { _dirty = true; lenPayload = _v; }
        public CellPayload payload() { return payload; }
        public void setPayload(CellPayload _v) { _dirty = true; payload = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public void set_parent(Sqlite3.RefCell _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_payload() { return _raw_payload; }
        public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
    }

    /**
     * @see <a href="https://sqlite.org/fileformat2.html#record_format">Source</a>
     */
    public static class CellPayload extends KaitaiStruct.ReadWrite {
        public static CellPayload fromFile(String fileName) throws IOException {
            return new CellPayload(new ByteBufferKaitaiStream(fileName));
        }
        public CellPayload() {
            this(null, null, null);
        }

        public CellPayload(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CellPayload(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public CellPayload(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenHeaderAndLen = new VlqBase128Be(this._io);
            this.lenHeaderAndLen._read();
            this._raw_columnSerials = this._io.readBytes(lenHeaderAndLen().value() - 1);
            KaitaiStream _io__raw_columnSerials = new ByteBufferKaitaiStream(this._raw_columnSerials);
            this.columnSerials = new Serials(_io__raw_columnSerials, this, _root);
            this.columnSerials._read();
            this.columnContents = new ArrayList<ColumnContent>();
            for (int i = 0; i < columnSerials().entries().size(); i++) {
                ColumnContent _t_columnContents = new ColumnContent(this._io, this, _root, columnSerials().entries().get(((Number) (i)).intValue()));
                try {
                    _t_columnContents._read();
                } finally {
                    this.columnContents.add(_t_columnContents);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lenHeaderAndLen._fetchInstances();
            this.columnSerials._fetchInstances();
            for (int i = 0; i < this.columnContents.size(); i++) {
                this.columnContents.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.lenHeaderAndLen._write_Seq(this._io);
            final KaitaiStream _io__raw_columnSerials = new ByteBufferKaitaiStream(lenHeaderAndLen().value() - 1);
            this._io.addChildStream(_io__raw_columnSerials);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenHeaderAndLen().value() - 1));
                final CellPayload _this = this;
                _io__raw_columnSerials.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_columnSerials = _io__raw_columnSerials.toByteArray();
                        if (_this._raw_columnSerials.length != lenHeaderAndLen().value() - 1)
                            throw new ConsistencyError("raw(column_serials)", lenHeaderAndLen().value() - 1, _this._raw_columnSerials.length);
                        parent.writeBytes(_this._raw_columnSerials);
                    }
                });
            }
            this.columnSerials._write_Seq(_io__raw_columnSerials);
            for (int i = 0; i < this.columnContents.size(); i++) {
                this.columnContents.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.columnSerials._root(), _root()))
                throw new ConsistencyError("column_serials", _root(), this.columnSerials._root());
            if (!Objects.equals(this.columnSerials._parent(), this))
                throw new ConsistencyError("column_serials", this, this.columnSerials._parent());
            if (this.columnContents.size() != columnSerials().entries().size())
                throw new ConsistencyError("column_contents", columnSerials().entries().size(), this.columnContents.size());
            for (int i = 0; i < this.columnContents.size(); i++) {
                if (!Objects.equals(this.columnContents.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("column_contents", _root(), this.columnContents.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.columnContents.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("column_contents", this, this.columnContents.get(((Number) (i)).intValue())._parent());
                if (!Objects.equals(this.columnContents.get(((Number) (i)).intValue()).serialType(), columnSerials().entries().get(((Number) (i)).intValue())))
                    throw new ConsistencyError("column_contents", columnSerials().entries().get(((Number) (i)).intValue()), this.columnContents.get(((Number) (i)).intValue()).serialType());
            }
            _dirty = false;
        }
        private VlqBase128Be lenHeaderAndLen;
        private Serials columnSerials;
        private List<ColumnContent> columnContents;
        private Sqlite3 _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_columnSerials;
        public VlqBase128Be lenHeaderAndLen() { return lenHeaderAndLen; }
        public void setLenHeaderAndLen(VlqBase128Be _v) { _dirty = true; lenHeaderAndLen = _v; }
        public Serials columnSerials() { return columnSerials; }
        public void setColumnSerials(Serials _v) { _dirty = true; columnSerials = _v; }
        public List<ColumnContent> columnContents() { return columnContents; }
        public void setColumnContents(List<ColumnContent> _v) { _dirty = true; columnContents = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_columnSerials() { return _raw_columnSerials; }
        public void set_raw_ColumnSerials(byte[] _v) { _dirty = true; _raw_columnSerials = _v; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellTableInterior extends KaitaiStruct.ReadWrite {
        public static CellTableInterior fromFile(String fileName) throws IOException {
            return new CellTableInterior(new ByteBufferKaitaiStream(fileName));
        }
        public CellTableInterior() {
            this(null, null, null);
        }

        public CellTableInterior(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CellTableInterior(KaitaiStream _io, Sqlite3.RefCell _parent) {
            this(_io, _parent, null);
        }

        public CellTableInterior(KaitaiStream _io, Sqlite3.RefCell _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.leftChildPage = this._io.readU4be();
            this.rowId = new VlqBase128Be(this._io);
            this.rowId._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.rowId._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.leftChildPage);
            this.rowId._write_Seq(this._io);
        }

        public void _check() {
            _dirty = false;
        }
        private long leftChildPage;
        private VlqBase128Be rowId;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        public long leftChildPage() { return leftChildPage; }
        public void setLeftChildPage(long _v) { _dirty = true; leftChildPage = _v; }
        public VlqBase128Be rowId() { return rowId; }
        public void setRowId(VlqBase128Be _v) { _dirty = true; rowId = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public void set_parent(Sqlite3.RefCell _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellTableLeaf extends KaitaiStruct.ReadWrite {
        public static CellTableLeaf fromFile(String fileName) throws IOException {
            return new CellTableLeaf(new ByteBufferKaitaiStream(fileName));
        }
        public CellTableLeaf() {
            this(null, null, null);
        }

        public CellTableLeaf(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CellTableLeaf(KaitaiStream _io, Sqlite3.RefCell _parent) {
            this(_io, _parent, null);
        }

        public CellTableLeaf(KaitaiStream _io, Sqlite3.RefCell _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenPayload = new VlqBase128Be(this._io);
            this.lenPayload._read();
            this.rowId = new VlqBase128Be(this._io);
            this.rowId._read();
            this._raw_payload = this._io.readBytes(lenPayload().value());
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
            this.payload = new CellPayload(_io__raw_payload, this, _root);
            this.payload._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lenPayload._fetchInstances();
            this.rowId._fetchInstances();
            this.payload._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.lenPayload._write_Seq(this._io);
            this.rowId._write_Seq(this._io);
            final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenPayload().value());
            this._io.addChildStream(_io__raw_payload);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenPayload().value()));
                final CellTableLeaf _this = this;
                _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_payload = _io__raw_payload.toByteArray();
                        if (_this._raw_payload.length != lenPayload().value())
                            throw new ConsistencyError("raw(payload)", lenPayload().value(), _this._raw_payload.length);
                        parent.writeBytes(_this._raw_payload);
                    }
                });
            }
            this.payload._write_Seq(_io__raw_payload);
        }

        public void _check() {
            if (!Objects.equals(this.payload._root(), _root()))
                throw new ConsistencyError("payload", _root(), this.payload._root());
            if (!Objects.equals(this.payload._parent(), this))
                throw new ConsistencyError("payload", this, this.payload._parent());
            _dirty = false;
        }
        private VlqBase128Be lenPayload;
        private VlqBase128Be rowId;
        private CellPayload payload;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        private byte[] _raw_payload;
        public VlqBase128Be lenPayload() { return lenPayload; }
        public void setLenPayload(VlqBase128Be _v) { _dirty = true; lenPayload = _v; }
        public VlqBase128Be rowId() { return rowId; }
        public void setRowId(VlqBase128Be _v) { _dirty = true; rowId = _v; }
        public CellPayload payload() { return payload; }
        public void setPayload(CellPayload _v) { _dirty = true; payload = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public void set_parent(Sqlite3.RefCell _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_payload() { return _raw_payload; }
        public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
    }
    public static class ColumnContent extends KaitaiStruct.ReadWrite {
        public ColumnContent(Serial serialType) {
            this(null, null, null, serialType);
        }

        public ColumnContent(KaitaiStream _io, Serial serialType) {
            this(_io, null, null, serialType);
        }

        public ColumnContent(KaitaiStream _io, Sqlite3.CellPayload _parent, Serial serialType) {
            this(_io, _parent, null, serialType);
        }

        public ColumnContent(KaitaiStream _io, Sqlite3.CellPayload _parent, Sqlite3 _root, Serial serialType) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.serialType = serialType;
        }
        public void _read() {
            if ( ((serialType().code().value() >= 1) && (serialType().code().value() <= 6)) ) {
                switch (serialType().code().value()) {
                case 1: {
                    this.asInt = ((Number) (this._io.readU1())).intValue();
                    break;
                }
                case 2: {
                    this.asInt = ((Number) (this._io.readU2be())).intValue();
                    break;
                }
                case 3: {
                    this.asInt = ((Number) (this._io.readBitsIntBe(24))).intValue();
                    break;
                }
                case 4: {
                    this.asInt = ((Number) (this._io.readU4be())).intValue();
                    break;
                }
                case 5: {
                    this.asInt = ((Number) (this._io.readBitsIntBe(48))).intValue();
                    break;
                }
                case 6: {
                    this.asInt = ((Number) (this._io.readU8be())).intValue();
                    break;
                }
                }
            }
            if (serialType().code().value() == 7) {
                this.asFloat = this._io.readF8be();
            }
            if (serialType().isBlob()) {
                this.asBlob = this._io.readBytes(serialType().lenContent());
            }
            this.asStr = new String(this._io.readBytes(serialType().lenContent()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((serialType().code().value() >= 1) && (serialType().code().value() <= 6)) ) {
                switch (serialType().code().value()) {
                case 1: {
                    break;
                }
                case 2: {
                    break;
                }
                case 3: {
                    break;
                }
                case 4: {
                    break;
                }
                case 5: {
                    break;
                }
                case 6: {
                    break;
                }
                }
            }
            if (serialType().code().value() == 7) {
            }
            if (serialType().isBlob()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if ( ((serialType().code().value() >= 1) && (serialType().code().value() <= 6)) ) {
                switch (serialType().code().value()) {
                case 1: {
                    this._io.writeU1(((Number) (this.asInt)).intValue());
                    break;
                }
                case 2: {
                    this._io.writeU2be(((Number) (this.asInt)).intValue());
                    break;
                }
                case 3: {
                    this._io.writeBitsIntBe(24, ((Number) (this.asInt)).longValue());
                    break;
                }
                case 4: {
                    this._io.writeU4be(((Number) (this.asInt)).longValue());
                    break;
                }
                case 5: {
                    this._io.writeBitsIntBe(48, ((Number) (this.asInt)).longValue());
                    break;
                }
                case 6: {
                    this._io.writeU8be(((Number) (this.asInt)).longValue());
                    break;
                }
                }
            }
            if (serialType().code().value() == 7) {
                this._io.writeF8be(this.asFloat);
            }
            if (serialType().isBlob()) {
                this._io.writeBytes(this.asBlob);
            }
            this._io.writeBytes((this.asStr).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ( ((serialType().code().value() >= 1) && (serialType().code().value() <= 6)) ) {
                switch (serialType().code().value()) {
                case 1: {
                    break;
                }
                case 2: {
                    break;
                }
                case 3: {
                    break;
                }
                case 4: {
                    break;
                }
                case 5: {
                    break;
                }
                case 6: {
                    break;
                }
                }
            }
            if (serialType().code().value() == 7) {
            }
            if (serialType().isBlob()) {
                if (this.asBlob.length != serialType().lenContent())
                    throw new ConsistencyError("as_blob", serialType().lenContent(), this.asBlob.length);
            }
            if ((this.asStr).getBytes(Charset.forName("UTF-8")).length != serialType().lenContent())
                throw new ConsistencyError("as_str", serialType().lenContent(), (this.asStr).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private Integer asInt;
        private Double asFloat;
        private byte[] asBlob;
        private String asStr;
        private Serial serialType;
        private Sqlite3 _root;
        private Sqlite3.CellPayload _parent;
        public Integer asInt() { return asInt; }
        public void setAsInt(Integer _v) { _dirty = true; asInt = _v; }
        public Double asFloat() { return asFloat; }
        public void setAsFloat(Double _v) { _dirty = true; asFloat = _v; }
        public byte[] asBlob() { return asBlob; }
        public void setAsBlob(byte[] _v) { _dirty = true; asBlob = _v; }
        public String asStr() { return asStr; }
        public void setAsStr(String _v) { _dirty = true; asStr = _v; }
        public Serial serialType() { return serialType; }
        public void setSerialType(Serial _v) { _dirty = true; serialType = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.CellPayload _parent() { return _parent; }
        public void set_parent(Sqlite3.CellPayload _v) { _dirty = true; _parent = _v; }
    }
    public static class RefCell extends KaitaiStruct.ReadWrite {
        public static RefCell fromFile(String fileName) throws IOException {
            return new RefCell(new ByteBufferKaitaiStream(fileName));
        }
        public RefCell() {
            this(null, null, null);
        }

        public RefCell(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RefCell(KaitaiStream _io, Sqlite3.BtreePage _parent) {
            this(_io, _parent, null);
        }

        public RefCell(KaitaiStream _io, Sqlite3.BtreePage _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsBody = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                switch (_parent().pageType()) {
                case 10: {
                    ((CellIndexLeaf) (this.body))._fetchInstances();
                    break;
                }
                case 13: {
                    ((CellTableLeaf) (this.body))._fetchInstances();
                    break;
                }
                case 2: {
                    ((CellIndexInterior) (this.body))._fetchInstances();
                    break;
                }
                case 5: {
                    ((CellTableInterior) (this.body))._fetchInstances();
                    break;
                }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU2be(this.ofsBody);
        }

        public void _check() {
            if (_enabledBody) {
                switch (_parent().pageType()) {
                case 10: {
                    if (!Objects.equals(((Sqlite3.CellIndexLeaf) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Sqlite3.CellIndexLeaf) (this.body))._root());
                    if (!Objects.equals(((Sqlite3.CellIndexLeaf) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Sqlite3.CellIndexLeaf) (this.body))._parent());
                    break;
                }
                case 13: {
                    if (!Objects.equals(((Sqlite3.CellTableLeaf) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Sqlite3.CellTableLeaf) (this.body))._root());
                    if (!Objects.equals(((Sqlite3.CellTableLeaf) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Sqlite3.CellTableLeaf) (this.body))._parent());
                    break;
                }
                case 2: {
                    if (!Objects.equals(((Sqlite3.CellIndexInterior) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Sqlite3.CellIndexInterior) (this.body))._root());
                    if (!Objects.equals(((Sqlite3.CellIndexInterior) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Sqlite3.CellIndexInterior) (this.body))._parent());
                    break;
                }
                case 5: {
                    if (!Objects.equals(((Sqlite3.CellTableInterior) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Sqlite3.CellTableInterior) (this.body))._root());
                    if (!Objects.equals(((Sqlite3.CellTableInterior) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Sqlite3.CellTableInterior) (this.body))._parent());
                    break;
                }
                }
            }
            _dirty = false;
        }
        private KaitaiStruct.ReadWrite body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public KaitaiStruct.ReadWrite body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            switch (_parent().pageType()) {
            case 10: {
                this.body = new CellIndexLeaf(this._io, this, _root);
                ((CellIndexLeaf) (this.body))._read();
                break;
            }
            case 13: {
                this.body = new CellTableLeaf(this._io, this, _root);
                ((CellTableLeaf) (this.body))._read();
                break;
            }
            case 2: {
                this.body = new CellIndexInterior(this._io, this, _root);
                ((CellIndexInterior) (this.body))._read();
                break;
            }
            case 5: {
                this.body = new CellTableInterior(this._io, this, _root);
                ((CellTableInterior) (this.body))._read();
                break;
            }
            }
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            switch (_parent().pageType()) {
            case 10: {
                ((CellIndexLeaf) (this.body))._write_Seq(this._io);
                break;
            }
            case 13: {
                ((CellTableLeaf) (this.body))._write_Seq(this._io);
                break;
            }
            case 2: {
                ((CellIndexInterior) (this.body))._write_Seq(this._io);
                break;
            }
            case 5: {
                ((CellTableInterior) (this.body))._write_Seq(this._io);
                break;
            }
            }
            this._io.seek(_pos);
        }
        private int ofsBody;
        private Sqlite3 _root;
        private Sqlite3.BtreePage _parent;
        public int ofsBody() { return ofsBody; }
        public void setOfsBody(int _v) { _dirty = true; ofsBody = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.BtreePage _parent() { return _parent; }
        public void set_parent(Sqlite3.BtreePage _v) { _dirty = true; _parent = _v; }
    }
    public static class Serial extends KaitaiStruct.ReadWrite {
        public static Serial fromFile(String fileName) throws IOException {
            return new Serial(new ByteBufferKaitaiStream(fileName));
        }
        public Serial() {
            this(null, null, null);
        }

        public Serial(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Serial(KaitaiStream _io, Sqlite3.Serials _parent) {
            this(_io, _parent, null);
        }

        public Serial(KaitaiStream _io, Sqlite3.Serials _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = new VlqBase128Be(this._io);
            this.code._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.code._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.code._write_Seq(this._io);
        }

        public void _check() {
            _dirty = false;
        }
        private Boolean isBlob;
        public Boolean isBlob() {
            if (this.isBlob != null)
                return this.isBlob;
            this.isBlob =  ((code().value() >= 12) && (KaitaiStream.mod(code().value(), 2) == 0)) ;
            return this.isBlob;
        }
        public void _invalidateIsBlob() { this.isBlob = null; }
        private Boolean isString;
        public Boolean isString() {
            if (this.isString != null)
                return this.isString;
            this.isString =  ((code().value() >= 13) && (KaitaiStream.mod(code().value(), 2) == 1)) ;
            return this.isString;
        }
        public void _invalidateIsString() { this.isString = null; }
        private Integer lenContent;
        public Integer lenContent() {
            if (this.lenContent != null)
                return this.lenContent;
            if (code().value() >= 12) {
                this.lenContent = ((Number) ((code().value() - 12) / 2)).intValue();
            }
            return this.lenContent;
        }
        public void _invalidateLenContent() { this.lenContent = null; }
        private VlqBase128Be code;
        private Sqlite3 _root;
        private Sqlite3.Serials _parent;
        public VlqBase128Be code() { return code; }
        public void setCode(VlqBase128Be _v) { _dirty = true; code = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.Serials _parent() { return _parent; }
        public void set_parent(Sqlite3.Serials _v) { _dirty = true; _parent = _v; }
    }
    public static class Serials extends KaitaiStruct.ReadWrite {
        public static Serials fromFile(String fileName) throws IOException {
            return new Serials(new ByteBufferKaitaiStream(fileName));
        }
        public Serials() {
            this(null, null, null);
        }

        public Serials(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Serials(KaitaiStream _io, Sqlite3.CellPayload _parent) {
            this(_io, _parent, null);
        }

        public Serials(KaitaiStream _io, Sqlite3.CellPayload _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Serial>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Serial _t_entries = new Serial(this._io, this, _root);
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
        private List<Serial> entries;
        private Sqlite3 _root;
        private Sqlite3.CellPayload _parent;
        public List<Serial> entries() { return entries; }
        public void setEntries(List<Serial> _v) { _dirty = true; entries = _v; }
        public Sqlite3 _root() { return _root; }
        public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
        public Sqlite3.CellPayload _parent() { return _parent; }
        public void set_parent(Sqlite3.CellPayload _v) { _dirty = true; _parent = _v; }
    }
    private Integer lenPage;
    public Integer lenPage() {
        if (this.lenPage != null)
            return this.lenPage;
        this.lenPage = ((Number) ((lenPageMod() == 1 ? 65536 : lenPageMod()))).intValue();
        return this.lenPage;
    }
    public void _invalidateLenPage() { this.lenPage = null; }
    private byte[] magic;
    private int lenPageMod;
    private Versions writeVersion;
    private Versions readVersion;
    private int reservedSpace;
    private int maxPayloadFrac;
    private int minPayloadFrac;
    private int leafPayloadFrac;
    private long fileChangeCounter;
    private long numPages;
    private long firstFreelistTrunkPage;
    private long numFreelistPages;
    private long schemaCookie;
    private long schemaFormat;
    private long defPageCacheSize;
    private long largestRootPage;
    private Encodings textEncoding;
    private long userVersion;
    private long isIncrementalVacuum;
    private long applicationId;
    private byte[] reserved;
    private long versionValidFor;
    private long sqliteVersionNumber;
    private BtreePage rootPage;
    private Sqlite3 _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * The database page size in bytes. Must be a power of two between
     * 512 and 32768 inclusive, or the value 1 representing a page size
     * of 65536.
     */
    public int lenPageMod() { return lenPageMod; }
    public void setLenPageMod(int _v) { _dirty = true; lenPageMod = _v; }
    public Versions writeVersion() { return writeVersion; }
    public void setWriteVersion(Versions _v) { _dirty = true; writeVersion = _v; }
    public Versions readVersion() { return readVersion; }
    public void setReadVersion(Versions _v) { _dirty = true; readVersion = _v; }

    /**
     * Bytes of unused "reserved" space at the end of each page. Usually 0.
     */
    public int reservedSpace() { return reservedSpace; }
    public void setReservedSpace(int _v) { _dirty = true; reservedSpace = _v; }

    /**
     * Maximum embedded payload fraction. Must be 64.
     */
    public int maxPayloadFrac() { return maxPayloadFrac; }
    public void setMaxPayloadFrac(int _v) { _dirty = true; maxPayloadFrac = _v; }

    /**
     * Minimum embedded payload fraction. Must be 32.
     */
    public int minPayloadFrac() { return minPayloadFrac; }
    public void setMinPayloadFrac(int _v) { _dirty = true; minPayloadFrac = _v; }

    /**
     * Leaf payload fraction. Must be 32.
     */
    public int leafPayloadFrac() { return leafPayloadFrac; }
    public void setLeafPayloadFrac(int _v) { _dirty = true; leafPayloadFrac = _v; }
    public long fileChangeCounter() { return fileChangeCounter; }
    public void setFileChangeCounter(long _v) { _dirty = true; fileChangeCounter = _v; }

    /**
     * Size of the database file in pages. The "in-header database size".
     */
    public long numPages() { return numPages; }
    public void setNumPages(long _v) { _dirty = true; numPages = _v; }

    /**
     * Page number of the first freelist trunk page.
     */
    public long firstFreelistTrunkPage() { return firstFreelistTrunkPage; }
    public void setFirstFreelistTrunkPage(long _v) { _dirty = true; firstFreelistTrunkPage = _v; }

    /**
     * Total number of freelist pages.
     */
    public long numFreelistPages() { return numFreelistPages; }
    public void setNumFreelistPages(long _v) { _dirty = true; numFreelistPages = _v; }
    public long schemaCookie() { return schemaCookie; }
    public void setSchemaCookie(long _v) { _dirty = true; schemaCookie = _v; }

    /**
     * The schema format number. Supported schema formats are 1, 2, 3, and 4.
     */
    public long schemaFormat() { return schemaFormat; }
    public void setSchemaFormat(long _v) { _dirty = true; schemaFormat = _v; }

    /**
     * Default page cache size.
     */
    public long defPageCacheSize() { return defPageCacheSize; }
    public void setDefPageCacheSize(long _v) { _dirty = true; defPageCacheSize = _v; }

    /**
     * The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
     */
    public long largestRootPage() { return largestRootPage; }
    public void setLargestRootPage(long _v) { _dirty = true; largestRootPage = _v; }

    /**
     * The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
     */
    public Encodings textEncoding() { return textEncoding; }
    public void setTextEncoding(Encodings _v) { _dirty = true; textEncoding = _v; }

    /**
     * The "user version" as read and set by the user_version pragma.
     */
    public long userVersion() { return userVersion; }
    public void setUserVersion(long _v) { _dirty = true; userVersion = _v; }

    /**
     * True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
     */
    public long isIncrementalVacuum() { return isIncrementalVacuum; }
    public void setIsIncrementalVacuum(long _v) { _dirty = true; isIncrementalVacuum = _v; }

    /**
     * The "Application ID" set by PRAGMA application_id.
     */
    public long applicationId() { return applicationId; }
    public void setApplicationId(long _v) { _dirty = true; applicationId = _v; }
    public byte[] reserved() { return reserved; }
    public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
    public long versionValidFor() { return versionValidFor; }
    public void setVersionValidFor(long _v) { _dirty = true; versionValidFor = _v; }
    public long sqliteVersionNumber() { return sqliteVersionNumber; }
    public void setSqliteVersionNumber(long _v) { _dirty = true; sqliteVersionNumber = _v; }
    public BtreePage rootPage() { return rootPage; }
    public void setRootPage(BtreePage _v) { _dirty = true; rootPage = _v; }
    public Sqlite3 _root() { return _root; }
    public void set_root(Sqlite3 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
