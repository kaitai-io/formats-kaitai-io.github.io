// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class Ext2 extends KaitaiStruct {
    public static Ext2 fromFile(String fileName) throws IOException {
        return new Ext2(new ByteBufferKaitaiStream(fileName));
    }

    public Ext2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ext2(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ext2(KaitaiStream _io, KaitaiStruct _parent, Ext2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }
    public static class SuperBlockStruct extends KaitaiStruct {
        public static SuperBlockStruct fromFile(String fileName) throws IOException {
            return new SuperBlockStruct(new ByteBufferKaitaiStream(fileName));
        }

        public enum StateEnum {
            VALID_FS(1),
            ERROR_FS(2);

            private final long id;
            StateEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, StateEnum> byId = new HashMap<Long, StateEnum>(2);
            static {
                for (StateEnum e : StateEnum.values())
                    byId.put(e.id(), e);
            }
            public static StateEnum byId(long id) { return byId.get(id); }
        }

        public enum ErrorsEnum {
            ACT_CONTINUE(1),
            ACT_RO(2),
            ACT_PANIC(3);

            private final long id;
            ErrorsEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ErrorsEnum> byId = new HashMap<Long, ErrorsEnum>(3);
            static {
                for (ErrorsEnum e : ErrorsEnum.values())
                    byId.put(e.id(), e);
            }
            public static ErrorsEnum byId(long id) { return byId.get(id); }
        }

        public SuperBlockStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SuperBlockStruct(KaitaiStream _io, Ext2.BlockGroup _parent) {
            this(_io, _parent, null);
        }

        public SuperBlockStruct(KaitaiStream _io, Ext2.BlockGroup _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.inodesCount = this._io.readU4le();
            this.blocksCount = this._io.readU4le();
            this.rBlocksCount = this._io.readU4le();
            this.freeBlocksCount = this._io.readU4le();
            this.freeInodesCount = this._io.readU4le();
            this.firstDataBlock = this._io.readU4le();
            this.logBlockSize = this._io.readU4le();
            this.logFragSize = this._io.readU4le();
            this.blocksPerGroup = this._io.readU4le();
            this.fragsPerGroup = this._io.readU4le();
            this.inodesPerGroup = this._io.readU4le();
            this.mtime = this._io.readU4le();
            this.wtime = this._io.readU4le();
            this.mntCount = this._io.readU2le();
            this.maxMntCount = this._io.readU2le();
            this.magic = this._io.ensureFixedContents(new byte[] { 83, -17 });
            this.state = StateEnum.byId(this._io.readU2le());
            this.errors = ErrorsEnum.byId(this._io.readU2le());
            this.minorRevLevel = this._io.readU2le();
            this.lastcheck = this._io.readU4le();
            this.checkinterval = this._io.readU4le();
            this.creatorOs = this._io.readU4le();
            this.revLevel = this._io.readU4le();
            this.defResuid = this._io.readU2le();
            this.defResgid = this._io.readU2le();
            this.firstIno = this._io.readU4le();
            this.inodeSize = this._io.readU2le();
            this.blockGroupNr = this._io.readU2le();
            this.featureCompat = this._io.readU4le();
            this.featureIncompat = this._io.readU4le();
            this.featureRoCompat = this._io.readU4le();
            this.uuid = this._io.readBytes(16);
            this.volumeName = this._io.readBytes(16);
            this.lastMounted = this._io.readBytes(64);
            this.algoBitmap = this._io.readU4le();
            this.preallocBlocks = this._io.readU1();
            this.preallocDirBlocks = this._io.readU1();
            this.padding1 = this._io.readBytes(2);
            this.journalUuid = this._io.readBytes(16);
            this.journalInum = this._io.readU4le();
            this.journalDev = this._io.readU4le();
            this.lastOrphan = this._io.readU4le();
            hashSeed = new ArrayList<Long>((int) (4));
            for (int i = 0; i < 4; i++) {
                this.hashSeed.add(this._io.readU4le());
            }
            this.defHashVersion = this._io.readU1();
        }
        private Integer blockSize;
        public Integer blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            int _tmp = (int) ((1024 << logBlockSize()));
            this.blockSize = _tmp;
            return this.blockSize;
        }
        private Integer blockGroupCount;
        public Integer blockGroupCount() {
            if (this.blockGroupCount != null)
                return this.blockGroupCount;
            int _tmp = (int) ((blocksCount() / blocksPerGroup()));
            this.blockGroupCount = _tmp;
            return this.blockGroupCount;
        }
        private long inodesCount;
        private long blocksCount;
        private long rBlocksCount;
        private long freeBlocksCount;
        private long freeInodesCount;
        private long firstDataBlock;
        private long logBlockSize;
        private long logFragSize;
        private long blocksPerGroup;
        private long fragsPerGroup;
        private long inodesPerGroup;
        private long mtime;
        private long wtime;
        private int mntCount;
        private int maxMntCount;
        private byte[] magic;
        private StateEnum state;
        private ErrorsEnum errors;
        private int minorRevLevel;
        private long lastcheck;
        private long checkinterval;
        private long creatorOs;
        private long revLevel;
        private int defResuid;
        private int defResgid;
        private long firstIno;
        private int inodeSize;
        private int blockGroupNr;
        private long featureCompat;
        private long featureIncompat;
        private long featureRoCompat;
        private byte[] uuid;
        private byte[] volumeName;
        private byte[] lastMounted;
        private long algoBitmap;
        private int preallocBlocks;
        private int preallocDirBlocks;
        private byte[] padding1;
        private byte[] journalUuid;
        private long journalInum;
        private long journalDev;
        private long lastOrphan;
        private ArrayList<Long> hashSeed;
        private int defHashVersion;
        private Ext2 _root;
        private Ext2.BlockGroup _parent;
        public long inodesCount() { return inodesCount; }
        public long blocksCount() { return blocksCount; }
        public long rBlocksCount() { return rBlocksCount; }
        public long freeBlocksCount() { return freeBlocksCount; }
        public long freeInodesCount() { return freeInodesCount; }
        public long firstDataBlock() { return firstDataBlock; }
        public long logBlockSize() { return logBlockSize; }
        public long logFragSize() { return logFragSize; }
        public long blocksPerGroup() { return blocksPerGroup; }
        public long fragsPerGroup() { return fragsPerGroup; }
        public long inodesPerGroup() { return inodesPerGroup; }
        public long mtime() { return mtime; }
        public long wtime() { return wtime; }
        public int mntCount() { return mntCount; }
        public int maxMntCount() { return maxMntCount; }
        public byte[] magic() { return magic; }
        public StateEnum state() { return state; }
        public ErrorsEnum errors() { return errors; }
        public int minorRevLevel() { return minorRevLevel; }
        public long lastcheck() { return lastcheck; }
        public long checkinterval() { return checkinterval; }
        public long creatorOs() { return creatorOs; }
        public long revLevel() { return revLevel; }
        public int defResuid() { return defResuid; }
        public int defResgid() { return defResgid; }
        public long firstIno() { return firstIno; }
        public int inodeSize() { return inodeSize; }
        public int blockGroupNr() { return blockGroupNr; }
        public long featureCompat() { return featureCompat; }
        public long featureIncompat() { return featureIncompat; }
        public long featureRoCompat() { return featureRoCompat; }
        public byte[] uuid() { return uuid; }
        public byte[] volumeName() { return volumeName; }
        public byte[] lastMounted() { return lastMounted; }
        public long algoBitmap() { return algoBitmap; }
        public int preallocBlocks() { return preallocBlocks; }
        public int preallocDirBlocks() { return preallocDirBlocks; }
        public byte[] padding1() { return padding1; }
        public byte[] journalUuid() { return journalUuid; }
        public long journalInum() { return journalInum; }
        public long journalDev() { return journalDev; }
        public long lastOrphan() { return lastOrphan; }
        public ArrayList<Long> hashSeed() { return hashSeed; }
        public int defHashVersion() { return defHashVersion; }
        public Ext2 _root() { return _root; }
        public Ext2.BlockGroup _parent() { return _parent; }
    }
    public static class DirEntry extends KaitaiStruct {
        public static DirEntry fromFile(String fileName) throws IOException {
            return new DirEntry(new ByteBufferKaitaiStream(fileName));
        }

        public enum FileTypeEnum {
            UNKNOWN(0),
            REG_FILE(1),
            DIR(2),
            CHRDEV(3),
            BLKDEV(4),
            FIFO(5),
            SOCK(6),
            SYMLINK(7);

            private final long id;
            FileTypeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FileTypeEnum> byId = new HashMap<Long, FileTypeEnum>(8);
            static {
                for (FileTypeEnum e : FileTypeEnum.values())
                    byId.put(e.id(), e);
            }
            public static FileTypeEnum byId(long id) { return byId.get(id); }
        }

        public DirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirEntry(KaitaiStream _io, Ext2.Dir _parent) {
            this(_io, _parent, null);
        }

        public DirEntry(KaitaiStream _io, Ext2.Dir _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.inodePtr = this._io.readU4le();
            this.recLen = this._io.readU2le();
            this.nameLen = this._io.readU1();
            this.fileType = FileTypeEnum.byId(this._io.readU1());
            this.name = new String(this._io.readBytes(nameLen()), Charset.forName("UTF-8"));
            this.padding = this._io.readBytes(((recLen() - nameLen()) - 8));
        }
        private Inode inode;
        public Inode inode() {
            if (this.inode != null)
                return this.inode;
            this.inode = _root.bg1().blockGroups().get((int) ((inodePtr() - 1) / _root.bg1().superBlock().inodesPerGroup())).inodes().get((int) KaitaiStream.mod((inodePtr() - 1), _root.bg1().superBlock().inodesPerGroup()));
            return this.inode;
        }
        private long inodePtr;
        private int recLen;
        private int nameLen;
        private FileTypeEnum fileType;
        private String name;
        private byte[] padding;
        private Ext2 _root;
        private Ext2.Dir _parent;
        public long inodePtr() { return inodePtr; }
        public int recLen() { return recLen; }
        public int nameLen() { return nameLen; }
        public FileTypeEnum fileType() { return fileType; }
        public String name() { return name; }
        public byte[] padding() { return padding; }
        public Ext2 _root() { return _root; }
        public Ext2.Dir _parent() { return _parent; }
    }
    public static class Inode extends KaitaiStruct {
        public static Inode fromFile(String fileName) throws IOException {
            return new Inode(new ByteBufferKaitaiStream(fileName));
        }

        public Inode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Inode(KaitaiStream _io, Ext2.Bgd _parent) {
            this(_io, _parent, null);
        }

        public Inode(KaitaiStream _io, Ext2.Bgd _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.mode = this._io.readU2le();
            this.uid = this._io.readU2le();
            this.size = this._io.readU4le();
            this.atime = this._io.readU4le();
            this.ctime = this._io.readU4le();
            this.mtime = this._io.readU4le();
            this.dtime = this._io.readU4le();
            this.gid = this._io.readU2le();
            this.linksCount = this._io.readU2le();
            this.blocks = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.osd1 = this._io.readU4le();
            block = new ArrayList<BlockPtr>((int) (15));
            for (int i = 0; i < 15; i++) {
                this.block.add(new BlockPtr(this._io, this, _root));
            }
            this.generation = this._io.readU4le();
            this.fileAcl = this._io.readU4le();
            this.dirAcl = this._io.readU4le();
            this.faddr = this._io.readU4le();
            this.osd2 = this._io.readBytes(12);
        }
        private Dir asDir;
        public Dir asDir() {
            if (this.asDir != null)
                return this.asDir;
            KaitaiStream io = block().get((int) 0).body()._io();
            long _pos = io.pos();
            io.seek(0);
            this.asDir = new Dir(io, this, _root);
            io.seek(_pos);
            return this.asDir;
        }
        private int mode;
        private int uid;
        private long size;
        private long atime;
        private long ctime;
        private long mtime;
        private long dtime;
        private int gid;
        private int linksCount;
        private long blocks;
        private long flags;
        private long osd1;
        private ArrayList<BlockPtr> block;
        private long generation;
        private long fileAcl;
        private long dirAcl;
        private long faddr;
        private byte[] osd2;
        private Ext2 _root;
        private Ext2.Bgd _parent;
        public int mode() { return mode; }
        public int uid() { return uid; }
        public long size() { return size; }
        public long atime() { return atime; }
        public long ctime() { return ctime; }
        public long mtime() { return mtime; }
        public long dtime() { return dtime; }
        public int gid() { return gid; }
        public int linksCount() { return linksCount; }
        public long blocks() { return blocks; }
        public long flags() { return flags; }
        public long osd1() { return osd1; }
        public ArrayList<BlockPtr> block() { return block; }
        public long generation() { return generation; }
        public long fileAcl() { return fileAcl; }
        public long dirAcl() { return dirAcl; }
        public long faddr() { return faddr; }
        public byte[] osd2() { return osd2; }
        public Ext2 _root() { return _root; }
        public Ext2.Bgd _parent() { return _parent; }
    }
    public static class BlockPtr extends KaitaiStruct {
        public static BlockPtr fromFile(String fileName) throws IOException {
            return new BlockPtr(new ByteBufferKaitaiStream(fileName));
        }

        public BlockPtr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockPtr(KaitaiStream _io, Ext2.Inode _parent) {
            this(_io, _parent, null);
        }

        public BlockPtr(KaitaiStream _io, Ext2.Inode _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ptr = this._io.readU4le();
        }
        private RawBlock body;
        public RawBlock body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek((ptr() * _root.bg1().superBlock().blockSize()));
            this._raw_body = this._io.readBytes(_root.bg1().superBlock().blockSize());
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new RawBlock(_io__raw_body, this, _root);
            this._io.seek(_pos);
            return this.body;
        }
        private long ptr;
        private Ext2 _root;
        private Ext2.Inode _parent;
        private byte[] _raw_body;
        public long ptr() { return ptr; }
        public Ext2 _root() { return _root; }
        public Ext2.Inode _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    public static class Dir extends KaitaiStruct {
        public static Dir fromFile(String fileName) throws IOException {
            return new Dir(new ByteBufferKaitaiStream(fileName));
        }

        public Dir(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Dir(KaitaiStream _io, Ext2.Inode _parent) {
            this(_io, _parent, null);
        }

        public Dir(KaitaiStream _io, Ext2.Inode _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<DirEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new DirEntry(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<DirEntry> entries;
        private Ext2 _root;
        private Ext2.Inode _parent;
        public ArrayList<DirEntry> entries() { return entries; }
        public Ext2 _root() { return _root; }
        public Ext2.Inode _parent() { return _parent; }
    }
    public static class BlockGroup extends KaitaiStruct {
        public static BlockGroup fromFile(String fileName) throws IOException {
            return new BlockGroup(new ByteBufferKaitaiStream(fileName));
        }

        public BlockGroup(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockGroup(KaitaiStream _io, Ext2 _parent) {
            this(_io, _parent, null);
        }

        public BlockGroup(KaitaiStream _io, Ext2 _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this._raw_superBlock = this._io.readBytes(1024);
            KaitaiStream _io__raw_superBlock = new ByteBufferKaitaiStream(_raw_superBlock);
            this.superBlock = new SuperBlockStruct(_io__raw_superBlock, this, _root);
            blockGroups = new ArrayList<Bgd>((int) (superBlock().blockGroupCount()));
            for (int i = 0; i < superBlock().blockGroupCount(); i++) {
                this.blockGroups.add(new Bgd(this._io, this, _root));
            }
        }
        private SuperBlockStruct superBlock;
        private ArrayList<Bgd> blockGroups;
        private Ext2 _root;
        private Ext2 _parent;
        private byte[] _raw_superBlock;
        public SuperBlockStruct superBlock() { return superBlock; }
        public ArrayList<Bgd> blockGroups() { return blockGroups; }
        public Ext2 _root() { return _root; }
        public Ext2 _parent() { return _parent; }
        public byte[] _raw_superBlock() { return _raw_superBlock; }
    }
    public static class Bgd extends KaitaiStruct {
        public static Bgd fromFile(String fileName) throws IOException {
            return new Bgd(new ByteBufferKaitaiStream(fileName));
        }

        public Bgd(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bgd(KaitaiStream _io, Ext2.BlockGroup _parent) {
            this(_io, _parent, null);
        }

        public Bgd(KaitaiStream _io, Ext2.BlockGroup _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.blockBitmapBlock = this._io.readU4le();
            this.inodeBitmapBlock = this._io.readU4le();
            this.inodeTableBlock = this._io.readU4le();
            this.freeBlocksCount = this._io.readU2le();
            this.freeInodesCount = this._io.readU2le();
            this.usedDirsCount = this._io.readU2le();
            this.padReserved = this._io.readBytes((2 + 12));
        }
        private byte[] blockBitmap;
        public byte[] blockBitmap() {
            if (this.blockBitmap != null)
                return this.blockBitmap;
            long _pos = this._io.pos();
            this._io.seek((blockBitmapBlock() * _root.bg1().superBlock().blockSize()));
            this.blockBitmap = this._io.readBytes(1024);
            this._io.seek(_pos);
            return this.blockBitmap;
        }
        private byte[] inodeBitmap;
        public byte[] inodeBitmap() {
            if (this.inodeBitmap != null)
                return this.inodeBitmap;
            long _pos = this._io.pos();
            this._io.seek((inodeBitmapBlock() * _root.bg1().superBlock().blockSize()));
            this.inodeBitmap = this._io.readBytes(1024);
            this._io.seek(_pos);
            return this.inodeBitmap;
        }
        private ArrayList<Inode> inodes;
        public ArrayList<Inode> inodes() {
            if (this.inodes != null)
                return this.inodes;
            long _pos = this._io.pos();
            this._io.seek((inodeTableBlock() * _root.bg1().superBlock().blockSize()));
            inodes = new ArrayList<Inode>((int) (_root.bg1().superBlock().inodesPerGroup()));
            for (int i = 0; i < _root.bg1().superBlock().inodesPerGroup(); i++) {
                this.inodes.add(new Inode(this._io, this, _root));
            }
            this._io.seek(_pos);
            return this.inodes;
        }
        private long blockBitmapBlock;
        private long inodeBitmapBlock;
        private long inodeTableBlock;
        private int freeBlocksCount;
        private int freeInodesCount;
        private int usedDirsCount;
        private byte[] padReserved;
        private Ext2 _root;
        private Ext2.BlockGroup _parent;
        public long blockBitmapBlock() { return blockBitmapBlock; }
        public long inodeBitmapBlock() { return inodeBitmapBlock; }
        public long inodeTableBlock() { return inodeTableBlock; }
        public int freeBlocksCount() { return freeBlocksCount; }
        public int freeInodesCount() { return freeInodesCount; }
        public int usedDirsCount() { return usedDirsCount; }
        public byte[] padReserved() { return padReserved; }
        public Ext2 _root() { return _root; }
        public Ext2.BlockGroup _parent() { return _parent; }
    }
    public static class RawBlock extends KaitaiStruct {
        public static RawBlock fromFile(String fileName) throws IOException {
            return new RawBlock(new ByteBufferKaitaiStream(fileName));
        }

        public RawBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RawBlock(KaitaiStream _io, Ext2.BlockPtr _parent) {
            this(_io, _parent, null);
        }

        public RawBlock(KaitaiStream _io, Ext2.BlockPtr _parent, Ext2 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.body = this._io.readBytes(_root.bg1().superBlock().blockSize());
        }
        private byte[] body;
        private Ext2 _root;
        private Ext2.BlockPtr _parent;
        public byte[] body() { return body; }
        public Ext2 _root() { return _root; }
        public Ext2.BlockPtr _parent() { return _parent; }
    }
    private BlockGroup bg1;
    public BlockGroup bg1() {
        if (this.bg1 != null)
            return this.bg1;
        long _pos = this._io.pos();
        this._io.seek(1024);
        this.bg1 = new BlockGroup(this._io, this, _root);
        this._io.seek(_pos);
        return this.bg1;
    }
    private Dir rootDir;
    public Dir rootDir() {
        if (this.rootDir != null)
            return this.rootDir;
        this.rootDir = bg1().blockGroups().get((int) 0).inodes().get((int) 1).asDir();
        return this.rootDir;
    }
    private Ext2 _root;
    private KaitaiStruct _parent;
    public Ext2 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
