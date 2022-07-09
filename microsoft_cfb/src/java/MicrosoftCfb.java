// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;

public class MicrosoftCfb extends KaitaiStruct {
    public static MicrosoftCfb fromFile(String fileName) throws IOException {
        return new MicrosoftCfb(new ByteBufferKaitaiStream(fileName));
    }

    public MicrosoftCfb(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MicrosoftCfb(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MicrosoftCfb(KaitaiStream _io, KaitaiStruct _parent, MicrosoftCfb _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new CfbHeader(this._io, this, _root);
    }
    public static class CfbHeader extends KaitaiStruct {
        public static CfbHeader fromFile(String fileName) throws IOException {
            return new CfbHeader(new ByteBufferKaitaiStream(fileName));
        }

        public CfbHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CfbHeader(KaitaiStream _io, MicrosoftCfb _parent) {
            this(_io, _parent, null);
        }

        public CfbHeader(KaitaiStream _io, MicrosoftCfb _parent, MicrosoftCfb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.signature = this._io.readBytes(8);
            if (!(Arrays.equals(signature(), new byte[] { -48, -49, 17, -32, -95, -79, 26, -31 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -48, -49, 17, -32, -95, -79, 26, -31 }, signature(), _io(), "/types/cfb_header/seq/0");
            }
            this.clsid = this._io.readBytes(16);
            if (!(Arrays.equals(clsid(), new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, clsid(), _io(), "/types/cfb_header/seq/1");
            }
            this.versionMinor = this._io.readU2le();
            this.versionMajor = this._io.readU2le();
            this.byteOrder = this._io.readBytes(2);
            if (!(Arrays.equals(byteOrder(), new byte[] { -2, -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -2, -1 }, byteOrder(), _io(), "/types/cfb_header/seq/4");
            }
            this.sectorShift = this._io.readU2le();
            this.miniSectorShift = this._io.readU2le();
            this.reserved1 = this._io.readBytes(6);
            this.sizeDir = this._io.readS4le();
            this.sizeFat = this._io.readS4le();
            this.ofsDir = this._io.readS4le();
            this.transactionSeq = this._io.readS4le();
            this.miniStreamCutoffSize = this._io.readS4le();
            this.ofsMiniFat = this._io.readS4le();
            this.sizeMiniFat = this._io.readS4le();
            this.ofsDifat = this._io.readS4le();
            this.sizeDifat = this._io.readS4le();
            this.difat = new ArrayList<Integer>();
            for (int i = 0; i < 109; i++) {
                this.difat.add(this._io.readS4le());
            }
        }
        private byte[] signature;
        private byte[] clsid;
        private int versionMinor;
        private int versionMajor;
        private byte[] byteOrder;
        private int sectorShift;
        private int miniSectorShift;
        private byte[] reserved1;
        private int sizeDir;
        private int sizeFat;
        private int ofsDir;
        private int transactionSeq;
        private int miniStreamCutoffSize;
        private int ofsMiniFat;
        private int sizeMiniFat;
        private int ofsDifat;
        private int sizeDifat;
        private ArrayList<Integer> difat;
        private MicrosoftCfb _root;
        private MicrosoftCfb _parent;

        /**
         * Magic bytes that confirm that this is a CFB file
         */
        public byte[] signature() { return signature; }

        /**
         * Reserved class ID field, must be all 0
         */
        public byte[] clsid() { return clsid; }
        public int versionMinor() { return versionMinor; }
        public int versionMajor() { return versionMajor; }

        /**
         * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
         */
        public byte[] byteOrder() { return byteOrder; }

        /**
         * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
         */
        public int sectorShift() { return sectorShift; }
        public int miniSectorShift() { return miniSectorShift; }
        public byte[] reserved1() { return reserved1; }

        /**
         * Number of directory sectors in this file. For major version 3, must be 0.
         */
        public int sizeDir() { return sizeDir; }

        /**
         * Number of FAT sectors in this file.
         */
        public int sizeFat() { return sizeFat; }

        /**
         * Starting sector number for directory stream.
         */
        public int ofsDir() { return ofsDir; }

        /**
         * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
         */
        public int transactionSeq() { return transactionSeq; }
        public int miniStreamCutoffSize() { return miniStreamCutoffSize; }

        /**
         * Starting sector number for mini FAT.
         */
        public int ofsMiniFat() { return ofsMiniFat; }

        /**
         * Number of mini FAT sectors in this file.
         */
        public int sizeMiniFat() { return sizeMiniFat; }

        /**
         * Starting sector number for DIFAT.
         */
        public int ofsDifat() { return ofsDifat; }

        /**
         * Number of DIFAT sectors in this file.
         */
        public int sizeDifat() { return sizeDifat; }
        public ArrayList<Integer> difat() { return difat; }
        public MicrosoftCfb _root() { return _root; }
        public MicrosoftCfb _parent() { return _parent; }
    }
    public static class FatEntries extends KaitaiStruct {
        public static FatEntries fromFile(String fileName) throws IOException {
            return new FatEntries(new ByteBufferKaitaiStream(fileName));
        }

        public FatEntries(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FatEntries(KaitaiStream _io, MicrosoftCfb _parent) {
            this(_io, _parent, null);
        }

        public FatEntries(KaitaiStream _io, MicrosoftCfb _parent, MicrosoftCfb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Integer>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(this._io.readS4le());
                    i++;
                }
            }
        }
        private ArrayList<Integer> entries;
        private MicrosoftCfb _root;
        private MicrosoftCfb _parent;
        public ArrayList<Integer> entries() { return entries; }
        public MicrosoftCfb _root() { return _root; }
        public MicrosoftCfb _parent() { return _parent; }
    }
    public static class DirEntry extends KaitaiStruct {
        public static DirEntry fromFile(String fileName) throws IOException {
            return new DirEntry(new ByteBufferKaitaiStream(fileName));
        }

        public enum ObjType {
            UNKNOWN(0),
            STORAGE(1),
            STREAM(2),
            ROOT_STORAGE(5);

            private final long id;
            ObjType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ObjType> byId = new HashMap<Long, ObjType>(4);
            static {
                for (ObjType e : ObjType.values())
                    byId.put(e.id(), e);
            }
            public static ObjType byId(long id) { return byId.get(id); }
        }

        public enum RbColor {
            RED(0),
            BLACK(1);

            private final long id;
            RbColor(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, RbColor> byId = new HashMap<Long, RbColor>(2);
            static {
                for (RbColor e : RbColor.values())
                    byId.put(e.id(), e);
            }
            public static RbColor byId(long id) { return byId.get(id); }
        }

        public DirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DirEntry(KaitaiStream _io, KaitaiStruct _parent, MicrosoftCfb _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new String(this._io.readBytes(64), Charset.forName("UTF-16LE"));
            this.nameLen = this._io.readU2le();
            this.objectType = ObjType.byId(this._io.readU1());
            this.colorFlag = RbColor.byId(this._io.readU1());
            this.leftSiblingId = this._io.readS4le();
            this.rightSiblingId = this._io.readS4le();
            this.childId = this._io.readS4le();
            this.clsid = this._io.readBytes(16);
            this.state = this._io.readU4le();
            this.timeCreate = this._io.readU8le();
            this.timeMod = this._io.readU8le();
            this.ofs = this._io.readS4le();
            this.size = this._io.readU8le();
        }
        private byte[] miniStream;
        public byte[] miniStream() {
            if (this.miniStream != null)
                return this.miniStream;
            if (objectType() == ObjType.ROOT_STORAGE) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(((ofs() + 1) * _root().sectorSize()));
                this.miniStream = io.readBytes(size());
                io.seek(_pos);
            }
            return this.miniStream;
        }
        private DirEntry child;
        public DirEntry child() {
            if (this.child != null)
                return this.child;
            if (childId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((((_root().header().ofsDir() + 1) * _root().sectorSize()) + (childId() * 128)));
                this.child = new DirEntry(io, this, _root);
                io.seek(_pos);
            }
            return this.child;
        }
        private DirEntry leftSibling;
        public DirEntry leftSibling() {
            if (this.leftSibling != null)
                return this.leftSibling;
            if (leftSiblingId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((((_root().header().ofsDir() + 1) * _root().sectorSize()) + (leftSiblingId() * 128)));
                this.leftSibling = new DirEntry(io, this, _root);
                io.seek(_pos);
            }
            return this.leftSibling;
        }
        private DirEntry rightSibling;
        public DirEntry rightSibling() {
            if (this.rightSibling != null)
                return this.rightSibling;
            if (rightSiblingId() != -1) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((((_root().header().ofsDir() + 1) * _root().sectorSize()) + (rightSiblingId() * 128)));
                this.rightSibling = new DirEntry(io, this, _root);
                io.seek(_pos);
            }
            return this.rightSibling;
        }
        private String name;
        private int nameLen;
        private ObjType objectType;
        private RbColor colorFlag;
        private int leftSiblingId;
        private int rightSiblingId;
        private int childId;
        private byte[] clsid;
        private long state;
        private long timeCreate;
        private long timeMod;
        private int ofs;
        private long size;
        private MicrosoftCfb _root;
        private KaitaiStruct _parent;
        public String name() { return name; }
        public int nameLen() { return nameLen; }
        public ObjType objectType() { return objectType; }
        public RbColor colorFlag() { return colorFlag; }
        public int leftSiblingId() { return leftSiblingId; }
        public int rightSiblingId() { return rightSiblingId; }
        public int childId() { return childId; }
        public byte[] clsid() { return clsid; }

        /**
         * User-defined flags for storage or root storage objects
         */
        public long state() { return state; }

        /**
         * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
         */
        public long timeCreate() { return timeCreate; }

        /**
         * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
         */
        public long timeMod() { return timeMod; }

        /**
         * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
         */
        public int ofs() { return ofs; }

        /**
         * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
         */
        public long size() { return size; }
        public MicrosoftCfb _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Integer sectorSize;
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        int _tmp = (int) ((1 << header().sectorShift()));
        this.sectorSize = _tmp;
        return this.sectorSize;
    }
    private FatEntries fat;
    public FatEntries fat() {
        if (this.fat != null)
            return this.fat;
        long _pos = this._io.pos();
        this._io.seek(sectorSize());
        this._raw_fat = this._io.readBytes((header().sizeFat() * sectorSize()));
        KaitaiStream _io__raw_fat = new ByteBufferKaitaiStream(_raw_fat);
        this.fat = new FatEntries(_io__raw_fat, this, _root);
        this._io.seek(_pos);
        return this.fat;
    }
    private DirEntry dir;
    public DirEntry dir() {
        if (this.dir != null)
            return this.dir;
        long _pos = this._io.pos();
        this._io.seek(((header().ofsDir() + 1) * sectorSize()));
        this.dir = new DirEntry(this._io, this, _root);
        this._io.seek(_pos);
        return this.dir;
    }
    private CfbHeader header;
    private MicrosoftCfb _root;
    private KaitaiStruct _parent;
    private byte[] _raw_fat;
    public CfbHeader header() { return header; }
    public MicrosoftCfb _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_fat() { return _raw_fat; }
}
