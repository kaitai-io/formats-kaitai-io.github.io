// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class Cramfs extends KaitaiStruct {
    public static Cramfs fromFile(String fileName) throws IOException {
        return new Cramfs(new ByteBufferKaitaiStream(fileName));
    }

    public Cramfs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Cramfs(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Cramfs(KaitaiStream _io, KaitaiStruct _parent, Cramfs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.superBlock = new SuperBlockStruct(this._io, this, _root);
    }
    public static class SuperBlockStruct extends KaitaiStruct {
        public static SuperBlockStruct fromFile(String fileName) throws IOException {
            return new SuperBlockStruct(new ByteBufferKaitaiStream(fileName));
        }

        public SuperBlockStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SuperBlockStruct(KaitaiStream _io, Cramfs _parent) {
            this(_io, _parent, null);
        }

        public SuperBlockStruct(KaitaiStream _io, Cramfs _parent, Cramfs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 69, 61, -51, 40 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 61, -51, 40 }, magic(), _io(), "/types/super_block_struct/seq/0");
            }
            this.size = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.future = this._io.readU4le();
            this.signature = this._io.readBytes(16);
            if (!(Arrays.equals(signature(), new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }, signature(), _io(), "/types/super_block_struct/seq/4");
            }
            this.fsid = new Info(this._io, this, _root);
            this.name = new String(this._io.readBytes(16), Charset.forName("ASCII"));
            this.root = new Inode(this._io, this, _root);
        }
        private Integer flagFsidV2;
        public Integer flagFsidV2() {
            if (this.flagFsidV2 != null)
                return this.flagFsidV2;
            int _tmp = (int) (((flags() >> 0) & 1));
            this.flagFsidV2 = _tmp;
            return this.flagFsidV2;
        }
        private Integer flagHoles;
        public Integer flagHoles() {
            if (this.flagHoles != null)
                return this.flagHoles;
            int _tmp = (int) (((flags() >> 8) & 1));
            this.flagHoles = _tmp;
            return this.flagHoles;
        }
        private Integer flagWrongSignature;
        public Integer flagWrongSignature() {
            if (this.flagWrongSignature != null)
                return this.flagWrongSignature;
            int _tmp = (int) (((flags() >> 9) & 1));
            this.flagWrongSignature = _tmp;
            return this.flagWrongSignature;
        }
        private Integer flagSortedDirs;
        public Integer flagSortedDirs() {
            if (this.flagSortedDirs != null)
                return this.flagSortedDirs;
            int _tmp = (int) (((flags() >> 1) & 1));
            this.flagSortedDirs = _tmp;
            return this.flagSortedDirs;
        }
        private Integer flagShiftedRootOffset;
        public Integer flagShiftedRootOffset() {
            if (this.flagShiftedRootOffset != null)
                return this.flagShiftedRootOffset;
            int _tmp = (int) (((flags() >> 10) & 1));
            this.flagShiftedRootOffset = _tmp;
            return this.flagShiftedRootOffset;
        }
        private byte[] magic;
        private long size;
        private long flags;
        private long future;
        private byte[] signature;
        private Info fsid;
        private String name;
        private Inode root;
        private Cramfs _root;
        private Cramfs _parent;
        public byte[] magic() { return magic; }
        public long size() { return size; }
        public long flags() { return flags; }
        public long future() { return future; }
        public byte[] signature() { return signature; }
        public Info fsid() { return fsid; }
        public String name() { return name; }
        public Inode root() { return root; }
        public Cramfs _root() { return _root; }
        public Cramfs _parent() { return _parent; }
    }
    public static class ChunkedDataInode extends KaitaiStruct {
        public static ChunkedDataInode fromFile(String fileName) throws IOException {
            return new ChunkedDataInode(new ByteBufferKaitaiStream(fileName));
        }

        public ChunkedDataInode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunkedDataInode(KaitaiStream _io, Cramfs.Inode _parent) {
            this(_io, _parent, null);
        }

        public ChunkedDataInode(KaitaiStream _io, Cramfs.Inode _parent, Cramfs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            blockEndIndex = new ArrayList<Long>(((Number) ((((_parent().size() + _root.pageSize()) - 1) / _root.pageSize()))).intValue());
            for (int i = 0; i < (((_parent().size() + _root.pageSize()) - 1) / _root.pageSize()); i++) {
                this.blockEndIndex.add(this._io.readU4le());
            }
            this.rawBlocks = this._io.readBytesFull();
        }
        private ArrayList<Long> blockEndIndex;
        private byte[] rawBlocks;
        private Cramfs _root;
        private Cramfs.Inode _parent;
        public ArrayList<Long> blockEndIndex() { return blockEndIndex; }
        public byte[] rawBlocks() { return rawBlocks; }
        public Cramfs _root() { return _root; }
        public Cramfs.Inode _parent() { return _parent; }
    }
    public static class Inode extends KaitaiStruct {
        public static Inode fromFile(String fileName) throws IOException {
            return new Inode(new ByteBufferKaitaiStream(fileName));
        }

        public enum FileType {
            FIFO(1),
            CHRDEV(2),
            DIR(4),
            BLKDEV(6),
            REG_FILE(8),
            SYMLINK(10),
            SOCKET(12);

            private final long id;
            FileType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FileType> byId = new HashMap<Long, FileType>(7);
            static {
                for (FileType e : FileType.values())
                    byId.put(e.id(), e);
            }
            public static FileType byId(long id) { return byId.get(id); }
        }

        public Inode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Inode(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Inode(KaitaiStream _io, KaitaiStruct _parent, Cramfs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.mode = this._io.readU2le();
            this.uid = this._io.readU2le();
            this.sizeGid = this._io.readU4le();
            this.namelenOffset = this._io.readU4le();
            this.name = new String(this._io.readBytes(namelen()), Charset.forName("utf-8"));
        }
        private Integer attr;
        public Integer attr() {
            if (this.attr != null)
                return this.attr;
            int _tmp = (int) (((mode() >> 9) & 7));
            this.attr = _tmp;
            return this.attr;
        }
        private ChunkedDataInode asRegFile;
        public ChunkedDataInode asRegFile() {
            if (this.asRegFile != null)
                return this.asRegFile;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(offset());
            this.asRegFile = new ChunkedDataInode(io, this, _root);
            io.seek(_pos);
            return this.asRegFile;
        }
        private Integer permU;
        public Integer permU() {
            if (this.permU != null)
                return this.permU;
            int _tmp = (int) (((mode() >> 6) & 7));
            this.permU = _tmp;
            return this.permU;
        }
        private ChunkedDataInode asSymlink;
        public ChunkedDataInode asSymlink() {
            if (this.asSymlink != null)
                return this.asSymlink;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(offset());
            this.asSymlink = new ChunkedDataInode(io, this, _root);
            io.seek(_pos);
            return this.asSymlink;
        }
        private Integer permO;
        public Integer permO() {
            if (this.permO != null)
                return this.permO;
            int _tmp = (int) ((mode() & 7));
            this.permO = _tmp;
            return this.permO;
        }
        private Integer size;
        public Integer size() {
            if (this.size != null)
                return this.size;
            int _tmp = (int) ((sizeGid() & 16777215));
            this.size = _tmp;
            return this.size;
        }
        private Integer gid;
        public Integer gid() {
            if (this.gid != null)
                return this.gid;
            int _tmp = (int) ((sizeGid() >> 24));
            this.gid = _tmp;
            return this.gid;
        }
        private Integer permG;
        public Integer permG() {
            if (this.permG != null)
                return this.permG;
            int _tmp = (int) (((mode() >> 3) & 7));
            this.permG = _tmp;
            return this.permG;
        }
        private Integer namelen;
        public Integer namelen() {
            if (this.namelen != null)
                return this.namelen;
            int _tmp = (int) (((namelenOffset() & 63) << 2));
            this.namelen = _tmp;
            return this.namelen;
        }
        private DirInode asDir;
        public DirInode asDir() {
            if (this.asDir != null)
                return this.asDir;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(offset());
            this._raw_asDir = io.readBytes(size());
            KaitaiStream _io__raw_asDir = new ByteBufferKaitaiStream(_raw_asDir);
            this.asDir = new DirInode(_io__raw_asDir, this, _root);
            io.seek(_pos);
            return this.asDir;
        }
        private FileType type;
        public FileType type() {
            if (this.type != null)
                return this.type;
            this.type = FileType.byId(((mode() >> 12) & 15));
            return this.type;
        }
        private Integer offset;
        public Integer offset() {
            if (this.offset != null)
                return this.offset;
            int _tmp = (int) ((((namelenOffset() >> 6) & 67108863) << 2));
            this.offset = _tmp;
            return this.offset;
        }
        private int mode;
        private int uid;
        private long sizeGid;
        private long namelenOffset;
        private String name;
        private Cramfs _root;
        private KaitaiStruct _parent;
        private byte[] _raw_asDir;
        public int mode() { return mode; }
        public int uid() { return uid; }
        public long sizeGid() { return sizeGid; }
        public long namelenOffset() { return namelenOffset; }
        public String name() { return name; }
        public Cramfs _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
        public byte[] _raw_asDir() { return _raw_asDir; }
    }
    public static class DirInode extends KaitaiStruct {
        public static DirInode fromFile(String fileName) throws IOException {
            return new DirInode(new ByteBufferKaitaiStream(fileName));
        }

        public DirInode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirInode(KaitaiStream _io, Cramfs.Inode _parent) {
            this(_io, _parent, null);
        }

        public DirInode(KaitaiStream _io, Cramfs.Inode _parent, Cramfs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            if (_io().size() > 0) {
                this.children = new ArrayList<Inode>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.children.add(new Inode(this._io, this, _root));
                        i++;
                    }
                }
            }
        }
        private ArrayList<Inode> children;
        private Cramfs _root;
        private Cramfs.Inode _parent;
        public ArrayList<Inode> children() { return children; }
        public Cramfs _root() { return _root; }
        public Cramfs.Inode _parent() { return _parent; }
    }
    public static class Info extends KaitaiStruct {
        public static Info fromFile(String fileName) throws IOException {
            return new Info(new ByteBufferKaitaiStream(fileName));
        }

        public Info(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Info(KaitaiStream _io, Cramfs.SuperBlockStruct _parent) {
            this(_io, _parent, null);
        }

        public Info(KaitaiStream _io, Cramfs.SuperBlockStruct _parent, Cramfs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.crc = this._io.readU4le();
            this.edition = this._io.readU4le();
            this.blocks = this._io.readU4le();
            this.files = this._io.readU4le();
        }
        private long crc;
        private long edition;
        private long blocks;
        private long files;
        private Cramfs _root;
        private Cramfs.SuperBlockStruct _parent;
        public long crc() { return crc; }
        public long edition() { return edition; }
        public long blocks() { return blocks; }
        public long files() { return files; }
        public Cramfs _root() { return _root; }
        public Cramfs.SuperBlockStruct _parent() { return _parent; }
    }
    private Integer pageSize;
    public Integer pageSize() {
        if (this.pageSize != null)
            return this.pageSize;
        int _tmp = (int) (4096);
        this.pageSize = _tmp;
        return this.pageSize;
    }
    private SuperBlockStruct superBlock;
    private Cramfs _root;
    private KaitaiStruct _parent;
    public SuperBlockStruct superBlock() { return superBlock; }
    public Cramfs _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
