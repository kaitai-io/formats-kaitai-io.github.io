// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * AppleSingle and AppleDouble files are used by certain Mac
 * applications (e.g. Finder) to store Mac-specific file attributes on
 * filesystems that do not support that.
 * 
 * Syntactically, both formats are the same, the only difference is how
 * they are being used:
 * 
 * * AppleSingle means that only one file will be created on external
 *   filesystem that will hold both the data (AKA "data fork" in Apple
 *   terminology), and the attributes (AKA "resource fork").
 * * AppleDouble means that two files will be created: a normal file
 *   that keeps the data ("data fork") is kept separately from an
 *   auxiliary file that contains attributes ("resource fork"), which
 *   is kept with the same name, but starting with an extra dot and
 *   underscore `._` to keep it hidden.
 * 
 * In modern practice (Mac OS X), Finder only uses AppleDouble to keep
 * compatibility with other OSes, as virtually nobody outside of Mac
 * understands how to access data in AppleSingle container.
 * @see <a href="http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf">Source</a>
 */
public class AppleSingleDouble extends KaitaiStruct.ReadWrite {
    public static AppleSingleDouble fromFile(String fileName) throws IOException {
        return new AppleSingleDouble(new ByteBufferKaitaiStream(fileName));
    }

    public enum FileType {
        APPLE_SINGLE(333312),
        APPLE_DOUBLE(333319);

        private final long id;
        FileType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, FileType> byId = new HashMap<Long, FileType>(2);
        static {
            for (FileType e : FileType.values())
                byId.put(e.id(), e);
        }
        public static FileType byId(long id) { return byId.get(id); }
    }
    public AppleSingleDouble() {
        this(null, null, null);
    }

    public AppleSingleDouble(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AppleSingleDouble(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AppleSingleDouble(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AppleSingleDouble _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = FileType.byId(this._io.readU4be());
        this.version = this._io.readU4be();
        this.reserved = this._io.readBytes(16);
        this.numEntries = this._io.readU2be();
        this.entries = new ArrayList<Entry>();
        for (int i = 0; i < numEntries(); i++) {
            Entry _t_entries = new Entry(this._io, this, _root);
            try {
                _t_entries._read();
            } finally {
                this.entries.add(_t_entries);
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
        this._io.writeU4be(((Number) (this.magic.id())).longValue());
        this._io.writeU4be(this.version);
        this._io.writeBytes(this.reserved);
        this._io.writeU2be(this.numEntries);
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.reserved.length != 16)
            throw new ConsistencyError("reserved", 16, this.reserved.length);
        if (this.entries.size() != numEntries())
            throw new ConsistencyError("entries", numEntries(), this.entries.size());
        for (int i = 0; i < this.entries.size(); i++) {
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Entry extends KaitaiStruct.ReadWrite {
        public static Entry fromFile(String fileName) throws IOException {
            return new Entry(new ByteBufferKaitaiStream(fileName));
        }

        public enum Types {
            DATA_FORK(1),
            RESOURCE_FORK(2),
            REAL_NAME(3),
            COMMENT(4),
            ICON_BW(5),
            ICON_COLOR(6),
            FILE_DATES_INFO(8),
            FINDER_INFO(9),
            MACINTOSH_FILE_INFO(10),
            PRODOS_FILE_INFO(11),
            MSDOS_FILE_INFO(12),
            AFP_SHORT_NAME(13),
            AFP_FILE_INFO(14),
            AFP_DIRECTORY_ID(15);

            private final long id;
            Types(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Types> byId = new HashMap<Long, Types>(14);
            static {
                for (Types e : Types.values())
                    byId.put(e.id(), e);
            }
            public static Types byId(long id) { return byId.get(id); }
        }
        public Entry() {
            this(null, null, null);
        }

        public Entry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Entry(KaitaiStream _io, AppleSingleDouble _parent) {
            this(_io, _parent, null);
        }

        public Entry(KaitaiStream _io, AppleSingleDouble _parent, AppleSingleDouble _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.type = Types.byId(this._io.readU4be());
            this.ofsBody = this._io.readU4be();
            this.lenBody = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                {
                    Types on = type();
                    if (on != null) {
                        switch (type()) {
                        case FINDER_INFO: {
                            ((FinderInfo) (this.body))._fetchInstances();
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
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4be(((Number) (this.type.id())).longValue());
            this._io.writeU4be(this.ofsBody);
            this._io.writeU4be(this.lenBody);
        }

        public void _check() {
            if (_enabledBody) {
                {
                    Types on = type();
                    if (on != null) {
                        switch (type()) {
                        case FINDER_INFO: {
                            if (!Objects.equals(((AppleSingleDouble.FinderInfo) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((AppleSingleDouble.FinderInfo) (this.body))._root());
                            if (!Objects.equals(((AppleSingleDouble.FinderInfo) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((AppleSingleDouble.FinderInfo) (this.body))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.body)).length != lenBody())
                                throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.body)).length != lenBody())
                            throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                    }
                }
            }
            _dirty = false;
        }
        private Object body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public Object body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            {
                Types on = type();
                if (on != null) {
                    switch (type()) {
                    case FINDER_INFO: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new FinderInfo(_io__raw_body, this, _root);
                        ((FinderInfo) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(lenBody());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(lenBody());
                }
            }
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            {
                Types on = type();
                if (on != null) {
                    switch (type()) {
                    case FINDER_INFO: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Entry _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((FinderInfo) (this.body))._write_Seq(_io__raw_body);
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
            this._io.seek(_pos);
        }
        private Types type;
        private long ofsBody;
        private long lenBody;
        private AppleSingleDouble _root;
        private AppleSingleDouble _parent;
        private byte[] _raw_body;
        public Types type() { return type; }
        public void setType(Types _v) { _dirty = true; type = _v; }
        public long ofsBody() { return ofsBody; }
        public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public AppleSingleDouble _root() { return _root; }
        public void set_root(AppleSingleDouble _v) { _dirty = true; _root = _v; }
        public AppleSingleDouble _parent() { return _parent; }
        public void set_parent(AppleSingleDouble _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }

    /**
     * Information specific to Finder
     * @see "older Inside Macintosh, Volume II page 84 or Volume IV page 104."
     */
    public static class FinderInfo extends KaitaiStruct.ReadWrite {
        public static FinderInfo fromFile(String fileName) throws IOException {
            return new FinderInfo(new ByteBufferKaitaiStream(fileName));
        }
        public FinderInfo() {
            this(null, null, null);
        }

        public FinderInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FinderInfo(KaitaiStream _io, AppleSingleDouble.Entry _parent) {
            this(_io, _parent, null);
        }

        public FinderInfo(KaitaiStream _io, AppleSingleDouble.Entry _parent, AppleSingleDouble _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.fileType = this._io.readBytes(4);
            this.fileCreator = this._io.readBytes(4);
            this.flags = this._io.readU2be();
            this.location = new Point(this._io, this, _root);
            this.location._read();
            this.folderId = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.location._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.fileType);
            this._io.writeBytes(this.fileCreator);
            this._io.writeU2be(this.flags);
            this.location._write_Seq(this._io);
            this._io.writeU2be(this.folderId);
        }

        public void _check() {
            if (this.fileType.length != 4)
                throw new ConsistencyError("file_type", 4, this.fileType.length);
            if (this.fileCreator.length != 4)
                throw new ConsistencyError("file_creator", 4, this.fileCreator.length);
            if (!Objects.equals(this.location._root(), _root()))
                throw new ConsistencyError("location", _root(), this.location._root());
            if (!Objects.equals(this.location._parent(), this))
                throw new ConsistencyError("location", this, this.location._parent());
            _dirty = false;
        }
        private byte[] fileType;
        private byte[] fileCreator;
        private int flags;
        private Point location;
        private int folderId;
        private AppleSingleDouble _root;
        private AppleSingleDouble.Entry _parent;
        public byte[] fileType() { return fileType; }
        public void setFileType(byte[] _v) { _dirty = true; fileType = _v; }
        public byte[] fileCreator() { return fileCreator; }
        public void setFileCreator(byte[] _v) { _dirty = true; fileCreator = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }

        /**
         * File icon's coordinates when displaying this folder.
         */
        public Point location() { return location; }
        public void setLocation(Point _v) { _dirty = true; location = _v; }

        /**
         * File folder ID (=window).
         */
        public int folderId() { return folderId; }
        public void setFolderId(int _v) { _dirty = true; folderId = _v; }
        public AppleSingleDouble _root() { return _root; }
        public void set_root(AppleSingleDouble _v) { _dirty = true; _root = _v; }
        public AppleSingleDouble.Entry _parent() { return _parent; }
        public void set_parent(AppleSingleDouble.Entry _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Specifies 2D coordinate in QuickDraw grid.
     */
    public static class Point extends KaitaiStruct.ReadWrite {
        public static Point fromFile(String fileName) throws IOException {
            return new Point(new ByteBufferKaitaiStream(fileName));
        }
        public Point() {
            this(null, null, null);
        }

        public Point(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Point(KaitaiStream _io, AppleSingleDouble.FinderInfo _parent) {
            this(_io, _parent, null);
        }

        public Point(KaitaiStream _io, AppleSingleDouble.FinderInfo _parent, AppleSingleDouble _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readU2be();
            this.y = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.x);
            this._io.writeU2be(this.y);
        }

        public void _check() {
            _dirty = false;
        }
        private int x;
        private int y;
        private AppleSingleDouble _root;
        private AppleSingleDouble.FinderInfo _parent;
        public int x() { return x; }
        public void setX(int _v) { _dirty = true; x = _v; }
        public int y() { return y; }
        public void setY(int _v) { _dirty = true; y = _v; }
        public AppleSingleDouble _root() { return _root; }
        public void set_root(AppleSingleDouble _v) { _dirty = true; _root = _v; }
        public AppleSingleDouble.FinderInfo _parent() { return _parent; }
        public void set_parent(AppleSingleDouble.FinderInfo _v) { _dirty = true; _parent = _v; }
    }
    private FileType magic;
    private long version;
    private byte[] reserved;
    private int numEntries;
    private List<Entry> entries;
    private AppleSingleDouble _root;
    private KaitaiStruct.ReadWrite _parent;
    public FileType magic() { return magic; }
    public void setMagic(FileType _v) { _dirty = true; magic = _v; }
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }

    /**
     * Must be all 0.
     */
    public byte[] reserved() { return reserved; }
    public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
    public int numEntries() { return numEntries; }
    public void setNumEntries(int _v) { _dirty = true; numEntries = _v; }
    public List<Entry> entries() { return entries; }
    public void setEntries(List<Entry> _v) { _dirty = true; entries = _v; }
    public AppleSingleDouble _root() { return _root; }
    public void set_root(AppleSingleDouble _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
