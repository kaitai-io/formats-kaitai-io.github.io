// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
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
public class AppleSingleDouble extends KaitaiStruct {
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

    public AppleSingleDouble(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AppleSingleDouble(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AppleSingleDouble(KaitaiStream _io, KaitaiStruct _parent, AppleSingleDouble _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = FileType.byId(this._io.readU4be());
        this.version = this._io.readU4be();
        this.reserved = this._io.readBytes(16);
        this.numEntries = this._io.readU2be();
        this.entries = new ArrayList<Entry>();
        for (int i = 0; i < numEntries(); i++) {
            this.entries.add(new Entry(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Entry extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.type = Types.byId(this._io.readU4be());
            this.ofsBody = this._io.readU4be();
            this.lenBody = this._io.readU4be();
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
        private Object body;
        public Object body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            {
                Types on = type();
                if (on != null) {
                    switch (type()) {
                    case FINDER_INFO: {
                        KaitaiStream _io_body = this._io.substream(lenBody());
                        this.body = new FinderInfo(_io_body, this, _root);
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
        private Types type;
        private long ofsBody;
        private long lenBody;
        private AppleSingleDouble _root;
        private AppleSingleDouble _parent;
        public Types type() { return type; }
        public long ofsBody() { return ofsBody; }
        public long lenBody() { return lenBody; }
        public AppleSingleDouble _root() { return _root; }
        public AppleSingleDouble _parent() { return _parent; }
    }

    /**
     * Information specific to Finder
     * @see "older Inside Macintosh, Volume II page 84 or Volume IV page 104."
     */
    public static class FinderInfo extends KaitaiStruct {
        public static FinderInfo fromFile(String fileName) throws IOException {
            return new FinderInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.fileType = this._io.readBytes(4);
            this.fileCreator = this._io.readBytes(4);
            this.flags = this._io.readU2be();
            this.location = new Point(this._io, this, _root);
            this.folderId = this._io.readU2be();
        }

        public void _fetchInstances() {
            this.location._fetchInstances();
        }
        private byte[] fileType;
        private byte[] fileCreator;
        private int flags;
        private Point location;
        private int folderId;
        private AppleSingleDouble _root;
        private AppleSingleDouble.Entry _parent;
        public byte[] fileType() { return fileType; }
        public byte[] fileCreator() { return fileCreator; }
        public int flags() { return flags; }

        /**
         * File icon's coordinates when displaying this folder.
         */
        public Point location() { return location; }

        /**
         * File folder ID (=window).
         */
        public int folderId() { return folderId; }
        public AppleSingleDouble _root() { return _root; }
        public AppleSingleDouble.Entry _parent() { return _parent; }
    }

    /**
     * Specifies 2D coordinate in QuickDraw grid.
     */
    public static class Point extends KaitaiStruct {
        public static Point fromFile(String fileName) throws IOException {
            return new Point(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.x = this._io.readU2be();
            this.y = this._io.readU2be();
        }

        public void _fetchInstances() {
        }
        private int x;
        private int y;
        private AppleSingleDouble _root;
        private AppleSingleDouble.FinderInfo _parent;
        public int x() { return x; }
        public int y() { return y; }
        public AppleSingleDouble _root() { return _root; }
        public AppleSingleDouble.FinderInfo _parent() { return _parent; }
    }
    private FileType magic;
    private long version;
    private byte[] reserved;
    private int numEntries;
    private List<Entry> entries;
    private AppleSingleDouble _root;
    private KaitaiStruct _parent;
    public FileType magic() { return magic; }
    public long version() { return version; }

    /**
     * Must be all 0.
     */
    public byte[] reserved() { return reserved; }
    public int numEntries() { return numEntries; }
    public List<Entry> entries() { return entries; }
    public AppleSingleDouble _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
