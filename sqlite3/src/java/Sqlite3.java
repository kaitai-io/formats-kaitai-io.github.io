// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
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
public class Sqlite3 extends KaitaiStruct {
    public static Sqlite3 fromFile(String fileName) throws IOException {
        return new Sqlite3(new ByteBufferKaitaiStream(fileName));
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

    public Sqlite3(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Sqlite3(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Sqlite3(KaitaiStream _io, KaitaiStruct _parent, Sqlite3 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(16);
        if (!(Arrays.equals(magic(), new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }, magic(), _io(), "/seq/0");
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
    }
    public static class Serial extends KaitaiStruct {
        public static Serial fromFile(String fileName) throws IOException {
            return new Serial(new ByteBufferKaitaiStream(fileName));
        }

        public Serial(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Serial(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Serial(KaitaiStream _io, KaitaiStruct _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = new VlqBase128Be(this._io);
        }
        private Boolean isBlob;
        public Boolean isBlob() {
            if (this.isBlob != null)
                return this.isBlob;
            boolean _tmp = (boolean) ( ((code().value() >= 12) && (KaitaiStream.mod(code().value(), 2) == 0)) );
            this.isBlob = _tmp;
            return this.isBlob;
        }
        private Boolean isString;
        public Boolean isString() {
            if (this.isString != null)
                return this.isString;
            boolean _tmp = (boolean) ( ((code().value() >= 13) && (KaitaiStream.mod(code().value(), 2) == 1)) );
            this.isString = _tmp;
            return this.isString;
        }
        private Integer lenContent;
        public Integer lenContent() {
            if (this.lenContent != null)
                return this.lenContent;
            if (code().value() >= 12) {
                int _tmp = (int) (((code().value() - 12) / 2));
                this.lenContent = _tmp;
            }
            return this.lenContent;
        }
        private VlqBase128Be code;
        private Sqlite3 _root;
        private KaitaiStruct _parent;
        public VlqBase128Be code() { return code; }
        public Sqlite3 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class BtreePage extends KaitaiStruct {
        public static BtreePage fromFile(String fileName) throws IOException {
            return new BtreePage(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.pageType = this._io.readU1();
            this.firstFreeblock = this._io.readU2be();
            this.numCells = this._io.readU2be();
            this.ofsCells = this._io.readU2be();
            this.numFragFreeBytes = this._io.readU1();
            if ( ((pageType() == 2) || (pageType() == 5)) ) {
                this.rightPtr = this._io.readU4be();
            }
            cells = new ArrayList<RefCell>(((Number) (numCells())).intValue());
            for (int i = 0; i < numCells(); i++) {
                this.cells.add(new RefCell(this._io, this, _root));
            }
        }
        private int pageType;
        private int firstFreeblock;
        private int numCells;
        private int ofsCells;
        private int numFragFreeBytes;
        private Long rightPtr;
        private ArrayList<RefCell> cells;
        private Sqlite3 _root;
        private Sqlite3 _parent;
        public int pageType() { return pageType; }
        public int firstFreeblock() { return firstFreeblock; }
        public int numCells() { return numCells; }
        public int ofsCells() { return ofsCells; }
        public int numFragFreeBytes() { return numFragFreeBytes; }
        public Long rightPtr() { return rightPtr; }
        public ArrayList<RefCell> cells() { return cells; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3 _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellIndexLeaf extends KaitaiStruct {
        public static CellIndexLeaf fromFile(String fileName) throws IOException {
            return new CellIndexLeaf(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenPayload = new VlqBase128Be(this._io);
            this._raw_payload = this._io.readBytes(lenPayload().value());
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(_raw_payload);
            this.payload = new CellPayload(_io__raw_payload, this, _root);
        }
        private VlqBase128Be lenPayload;
        private CellPayload payload;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        private byte[] _raw_payload;
        public VlqBase128Be lenPayload() { return lenPayload; }
        public CellPayload payload() { return payload; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public byte[] _raw_payload() { return _raw_payload; }
    }
    public static class Serials extends KaitaiStruct {
        public static Serials fromFile(String fileName) throws IOException {
            return new Serials(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<VlqBase128Be>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new VlqBase128Be(this._io));
                    i++;
                }
            }
        }
        private ArrayList<VlqBase128Be> entries;
        private Sqlite3 _root;
        private Sqlite3.CellPayload _parent;
        public ArrayList<VlqBase128Be> entries() { return entries; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.CellPayload _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellTableLeaf extends KaitaiStruct {
        public static CellTableLeaf fromFile(String fileName) throws IOException {
            return new CellTableLeaf(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenPayload = new VlqBase128Be(this._io);
            this.rowId = new VlqBase128Be(this._io);
            this._raw_payload = this._io.readBytes(lenPayload().value());
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(_raw_payload);
            this.payload = new CellPayload(_io__raw_payload, this, _root);
        }
        private VlqBase128Be lenPayload;
        private VlqBase128Be rowId;
        private CellPayload payload;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        private byte[] _raw_payload;
        public VlqBase128Be lenPayload() { return lenPayload; }
        public VlqBase128Be rowId() { return rowId; }
        public CellPayload payload() { return payload; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public byte[] _raw_payload() { return _raw_payload; }
    }

    /**
     * @see <a href="https://sqlite.org/fileformat2.html#record_format">Source</a>
     */
    public static class CellPayload extends KaitaiStruct {
        public static CellPayload fromFile(String fileName) throws IOException {
            return new CellPayload(new ByteBufferKaitaiStream(fileName));
        }

        public CellPayload(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CellPayload(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public CellPayload(KaitaiStream _io, KaitaiStruct _parent, Sqlite3 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenHeaderAndLen = new VlqBase128Be(this._io);
            this._raw_columnSerials = this._io.readBytes((lenHeaderAndLen().value() - 1));
            KaitaiStream _io__raw_columnSerials = new ByteBufferKaitaiStream(_raw_columnSerials);
            this.columnSerials = new Serials(_io__raw_columnSerials, this, _root);
            columnContents = new ArrayList<ColumnContent>(((Number) (columnSerials().entries().size())).intValue());
            for (int i = 0; i < columnSerials().entries().size(); i++) {
                this.columnContents.add(new ColumnContent(this._io, this, _root, columnSerials().entries().get((int) i)));
            }
        }
        private VlqBase128Be lenHeaderAndLen;
        private Serials columnSerials;
        private ArrayList<ColumnContent> columnContents;
        private Sqlite3 _root;
        private KaitaiStruct _parent;
        private byte[] _raw_columnSerials;
        public VlqBase128Be lenHeaderAndLen() { return lenHeaderAndLen; }
        public Serials columnSerials() { return columnSerials; }
        public ArrayList<ColumnContent> columnContents() { return columnContents; }
        public Sqlite3 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_columnSerials() { return _raw_columnSerials; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellTableInterior extends KaitaiStruct {
        public static CellTableInterior fromFile(String fileName) throws IOException {
            return new CellTableInterior(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.leftChildPage = this._io.readU4be();
            this.rowId = new VlqBase128Be(this._io);
        }
        private long leftChildPage;
        private VlqBase128Be rowId;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        public long leftChildPage() { return leftChildPage; }
        public VlqBase128Be rowId() { return rowId; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.RefCell _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
     */
    public static class CellIndexInterior extends KaitaiStruct {
        public static CellIndexInterior fromFile(String fileName) throws IOException {
            return new CellIndexInterior(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.leftChildPage = this._io.readU4be();
            this.lenPayload = new VlqBase128Be(this._io);
            this._raw_payload = this._io.readBytes(lenPayload().value());
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(_raw_payload);
            this.payload = new CellPayload(_io__raw_payload, this, _root);
        }
        private long leftChildPage;
        private VlqBase128Be lenPayload;
        private CellPayload payload;
        private Sqlite3 _root;
        private Sqlite3.RefCell _parent;
        private byte[] _raw_payload;
        public long leftChildPage() { return leftChildPage; }
        public VlqBase128Be lenPayload() { return lenPayload; }
        public CellPayload payload() { return payload; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.RefCell _parent() { return _parent; }
        public byte[] _raw_payload() { return _raw_payload; }
    }
    public static class ColumnContent extends KaitaiStruct {

        public ColumnContent(KaitaiStream _io, KaitaiStruct ser) {
            this(_io, null, null, ser);
        }

        public ColumnContent(KaitaiStream _io, Sqlite3.CellPayload _parent, KaitaiStruct ser) {
            this(_io, _parent, null, ser);
        }

        public ColumnContent(KaitaiStream _io, Sqlite3.CellPayload _parent, Sqlite3 _root, KaitaiStruct ser) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.ser = ser;
            _read();
        }
        private void _read() {
            if ( ((serialType().code().value() >= 1) && (serialType().code().value() <= 6)) ) {
                switch (serialType().code().value()) {
                case 4: {
                    this.asInt = (int) (this._io.readU4be());
                    break;
                }
                case 6: {
                    this.asInt = (int) (this._io.readU8be());
                    break;
                }
                case 1: {
                    this.asInt = (int) (this._io.readU1());
                    break;
                }
                case 3: {
                    this.asInt = (int) (this._io.readBitsIntBe(24));
                    break;
                }
                case 5: {
                    this.asInt = (int) (this._io.readBitsIntBe(48));
                    break;
                }
                case 2: {
                    this.asInt = (int) (this._io.readU2be());
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
            this.asStr = new String(this._io.readBytes(serialType().lenContent()), Charset.forName("UTF-8"));
        }
        private Sqlite3.Serial serialType;
        public Sqlite3.Serial serialType() {
            if (this.serialType != null)
                return this.serialType;
            this.serialType = ((Sqlite3.Serial) (ser()));
            return this.serialType;
        }
        private Integer asInt;
        private Double asFloat;
        private byte[] asBlob;
        private String asStr;
        private KaitaiStruct ser;
        private Sqlite3 _root;
        private Sqlite3.CellPayload _parent;
        public Integer asInt() { return asInt; }
        public Double asFloat() { return asFloat; }
        public byte[] asBlob() { return asBlob; }
        public String asStr() { return asStr; }
        public KaitaiStruct ser() { return ser; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.CellPayload _parent() { return _parent; }
    }
    public static class RefCell extends KaitaiStruct {
        public static RefCell fromFile(String fileName) throws IOException {
            return new RefCell(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.ofsBody = this._io.readU2be();
        }
        private KaitaiStruct body;
        public KaitaiStruct body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            switch (_parent().pageType()) {
            case 13: {
                this.body = new CellTableLeaf(this._io, this, _root);
                break;
            }
            case 5: {
                this.body = new CellTableInterior(this._io, this, _root);
                break;
            }
            case 10: {
                this.body = new CellIndexLeaf(this._io, this, _root);
                break;
            }
            case 2: {
                this.body = new CellIndexInterior(this._io, this, _root);
                break;
            }
            }
            this._io.seek(_pos);
            return this.body;
        }
        private int ofsBody;
        private Sqlite3 _root;
        private Sqlite3.BtreePage _parent;
        public int ofsBody() { return ofsBody; }
        public Sqlite3 _root() { return _root; }
        public Sqlite3.BtreePage _parent() { return _parent; }
    }
    private Integer lenPage;
    public Integer lenPage() {
        if (this.lenPage != null)
            return this.lenPage;
        int _tmp = (int) ((lenPageMod() == 1 ? 65536 : lenPageMod()));
        this.lenPage = _tmp;
        return this.lenPage;
    }
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
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * The database page size in bytes. Must be a power of two between
     * 512 and 32768 inclusive, or the value 1 representing a page size
     * of 65536.
     */
    public int lenPageMod() { return lenPageMod; }
    public Versions writeVersion() { return writeVersion; }
    public Versions readVersion() { return readVersion; }

    /**
     * Bytes of unused "reserved" space at the end of each page. Usually 0.
     */
    public int reservedSpace() { return reservedSpace; }

    /**
     * Maximum embedded payload fraction. Must be 64.
     */
    public int maxPayloadFrac() { return maxPayloadFrac; }

    /**
     * Minimum embedded payload fraction. Must be 32.
     */
    public int minPayloadFrac() { return minPayloadFrac; }

    /**
     * Leaf payload fraction. Must be 32.
     */
    public int leafPayloadFrac() { return leafPayloadFrac; }
    public long fileChangeCounter() { return fileChangeCounter; }

    /**
     * Size of the database file in pages. The "in-header database size".
     */
    public long numPages() { return numPages; }

    /**
     * Page number of the first freelist trunk page.
     */
    public long firstFreelistTrunkPage() { return firstFreelistTrunkPage; }

    /**
     * Total number of freelist pages.
     */
    public long numFreelistPages() { return numFreelistPages; }
    public long schemaCookie() { return schemaCookie; }

    /**
     * The schema format number. Supported schema formats are 1, 2, 3, and 4.
     */
    public long schemaFormat() { return schemaFormat; }

    /**
     * Default page cache size.
     */
    public long defPageCacheSize() { return defPageCacheSize; }

    /**
     * The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
     */
    public long largestRootPage() { return largestRootPage; }

    /**
     * The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
     */
    public Encodings textEncoding() { return textEncoding; }

    /**
     * The "user version" as read and set by the user_version pragma.
     */
    public long userVersion() { return userVersion; }

    /**
     * True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
     */
    public long isIncrementalVacuum() { return isIncrementalVacuum; }

    /**
     * The "Application ID" set by PRAGMA application_id.
     */
    public long applicationId() { return applicationId; }
    public byte[] reserved() { return reserved; }
    public long versionValidFor() { return versionValidFor; }
    public long sqliteVersionNumber() { return sqliteVersionNumber; }
    public BtreePage rootPage() { return rootPage; }
    public Sqlite3 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
