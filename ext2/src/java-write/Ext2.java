// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Arrays;

public class Ext2 extends KaitaiStruct.ReadWrite {
    public static Ext2 fromFile(String fileName) throws IOException {
        return new Ext2(new ByteBufferKaitaiStream(fileName));
    }
    public Ext2() {
        this(null, null, null);
    }

    public Ext2(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ext2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ext2(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ext2 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
    }

    public void _fetchInstances() {
        bg1();
        if (this.bg1 != null) {
            this.bg1._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteBg1 = _enabledBg1;
    }

    public void _check() {
        if (_enabledBg1) {
            if (!Objects.equals(this.bg1._root(), _root()))
                throw new ConsistencyError("bg1", _root(), this.bg1._root());
            if (!Objects.equals(this.bg1._parent(), this))
                throw new ConsistencyError("bg1", this, this.bg1._parent());
        }
        _dirty = false;
    }
    public static class Bgd extends KaitaiStruct.ReadWrite {
        public static Bgd fromFile(String fileName) throws IOException {
            return new Bgd(new ByteBufferKaitaiStream(fileName));
        }
        public Bgd() {
            this(null, null, null);
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
        }
        public void _read() {
            this.blockBitmapBlock = this._io.readU4le();
            this.inodeBitmapBlock = this._io.readU4le();
            this.inodeTableBlock = this._io.readU4le();
            this.freeBlocksCount = this._io.readU2le();
            this.freeInodesCount = this._io.readU2le();
            this.usedDirsCount = this._io.readU2le();
            this.padReserved = this._io.readBytes(2 + 12);
            _dirty = false;
        }

        public void _fetchInstances() {
            blockBitmap();
            if (this.blockBitmap != null) {
            }
            inodeBitmap();
            if (this.inodeBitmap != null) {
            }
            inodes();
            if (this.inodes != null) {
                for (int i = 0; i < this.inodes.size(); i++) {
                    this.inodes.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBlockBitmap = _enabledBlockBitmap;
            _shouldWriteInodeBitmap = _enabledInodeBitmap;
            _shouldWriteInodes = _enabledInodes;
            this._io.writeU4le(this.blockBitmapBlock);
            this._io.writeU4le(this.inodeBitmapBlock);
            this._io.writeU4le(this.inodeTableBlock);
            this._io.writeU2le(this.freeBlocksCount);
            this._io.writeU2le(this.freeInodesCount);
            this._io.writeU2le(this.usedDirsCount);
            this._io.writeBytes(this.padReserved);
        }

        public void _check() {
            if (this.padReserved.length != 2 + 12)
                throw new ConsistencyError("pad_reserved", 2 + 12, this.padReserved.length);
            if (_enabledBlockBitmap) {
                if (this.blockBitmap.length != 1024)
                    throw new ConsistencyError("block_bitmap", 1024, this.blockBitmap.length);
            }
            if (_enabledInodeBitmap) {
                if (this.inodeBitmap.length != 1024)
                    throw new ConsistencyError("inode_bitmap", 1024, this.inodeBitmap.length);
            }
            if (_enabledInodes) {
                if (this.inodes.size() != _root().bg1().superBlock().inodesPerGroup())
                    throw new ConsistencyError("inodes", _root().bg1().superBlock().inodesPerGroup(), this.inodes.size());
                for (int i = 0; i < this.inodes.size(); i++) {
                    if (!Objects.equals(this.inodes.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("inodes", _root(), this.inodes.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.inodes.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("inodes", this, this.inodes.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        private byte[] blockBitmap;
        private boolean _shouldWriteBlockBitmap = false;
        private boolean _enabledBlockBitmap = true;
        public byte[] blockBitmap() {
            if (_shouldWriteBlockBitmap)
                _writeBlockBitmap();
            if (this.blockBitmap != null)
                return this.blockBitmap;
            if (!_enabledBlockBitmap)
                return null;
            long _pos = this._io.pos();
            this._io.seek(blockBitmapBlock() * _root().bg1().superBlock().blockSize());
            this.blockBitmap = this._io.readBytes(1024);
            this._io.seek(_pos);
            return this.blockBitmap;
        }
        public void setBlockBitmap(byte[] _v) { _dirty = true; blockBitmap = _v; }
        public void setBlockBitmap_Enabled(boolean _v) { _dirty = true; _enabledBlockBitmap = _v; }

        private void _writeBlockBitmap() {
            _shouldWriteBlockBitmap = false;
            long _pos = this._io.pos();
            this._io.seek(blockBitmapBlock() * _root().bg1().superBlock().blockSize());
            this._io.writeBytes(this.blockBitmap);
            this._io.seek(_pos);
        }
        private byte[] inodeBitmap;
        private boolean _shouldWriteInodeBitmap = false;
        private boolean _enabledInodeBitmap = true;
        public byte[] inodeBitmap() {
            if (_shouldWriteInodeBitmap)
                _writeInodeBitmap();
            if (this.inodeBitmap != null)
                return this.inodeBitmap;
            if (!_enabledInodeBitmap)
                return null;
            long _pos = this._io.pos();
            this._io.seek(inodeBitmapBlock() * _root().bg1().superBlock().blockSize());
            this.inodeBitmap = this._io.readBytes(1024);
            this._io.seek(_pos);
            return this.inodeBitmap;
        }
        public void setInodeBitmap(byte[] _v) { _dirty = true; inodeBitmap = _v; }
        public void setInodeBitmap_Enabled(boolean _v) { _dirty = true; _enabledInodeBitmap = _v; }

        private void _writeInodeBitmap() {
            _shouldWriteInodeBitmap = false;
            long _pos = this._io.pos();
            this._io.seek(inodeBitmapBlock() * _root().bg1().superBlock().blockSize());
            this._io.writeBytes(this.inodeBitmap);
            this._io.seek(_pos);
        }
        private List<Inode> inodes;
        private boolean _shouldWriteInodes = false;
        private boolean _enabledInodes = true;
        public List<Inode> inodes() {
            if (_shouldWriteInodes)
                _writeInodes();
            if (this.inodes != null)
                return this.inodes;
            if (!_enabledInodes)
                return null;
            long _pos = this._io.pos();
            this._io.seek(inodeTableBlock() * _root().bg1().superBlock().blockSize());
            this.inodes = new ArrayList<Inode>();
            for (int i = 0; i < _root().bg1().superBlock().inodesPerGroup(); i++) {
                Inode _t_inodes = new Inode(this._io, this, _root);
                try {
                    _t_inodes._read();
                } finally {
                    this.inodes.add(_t_inodes);
                }
            }
            this._io.seek(_pos);
            return this.inodes;
        }
        public void setInodes(List<Inode> _v) { _dirty = true; inodes = _v; }
        public void setInodes_Enabled(boolean _v) { _dirty = true; _enabledInodes = _v; }

        private void _writeInodes() {
            _shouldWriteInodes = false;
            long _pos = this._io.pos();
            this._io.seek(inodeTableBlock() * _root().bg1().superBlock().blockSize());
            for (int i = 0; i < this.inodes.size(); i++) {
                this.inodes.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.seek(_pos);
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
        public void setBlockBitmapBlock(long _v) { _dirty = true; blockBitmapBlock = _v; }
        public long inodeBitmapBlock() { return inodeBitmapBlock; }
        public void setInodeBitmapBlock(long _v) { _dirty = true; inodeBitmapBlock = _v; }
        public long inodeTableBlock() { return inodeTableBlock; }
        public void setInodeTableBlock(long _v) { _dirty = true; inodeTableBlock = _v; }
        public int freeBlocksCount() { return freeBlocksCount; }
        public void setFreeBlocksCount(int _v) { _dirty = true; freeBlocksCount = _v; }
        public int freeInodesCount() { return freeInodesCount; }
        public void setFreeInodesCount(int _v) { _dirty = true; freeInodesCount = _v; }
        public int usedDirsCount() { return usedDirsCount; }
        public void setUsedDirsCount(int _v) { _dirty = true; usedDirsCount = _v; }
        public byte[] padReserved() { return padReserved; }
        public void setPadReserved(byte[] _v) { _dirty = true; padReserved = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.BlockGroup _parent() { return _parent; }
        public void set_parent(Ext2.BlockGroup _v) { _dirty = true; _parent = _v; }
    }
    public static class BlockGroup extends KaitaiStruct.ReadWrite {
        public static BlockGroup fromFile(String fileName) throws IOException {
            return new BlockGroup(new ByteBufferKaitaiStream(fileName));
        }
        public BlockGroup() {
            this(null, null, null);
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
        }
        public void _read() {
            this._raw_superBlock = this._io.readBytes(1024);
            KaitaiStream _io__raw_superBlock = new ByteBufferKaitaiStream(this._raw_superBlock);
            this.superBlock = new SuperBlockStruct(_io__raw_superBlock, this, _root);
            this.superBlock._read();
            this.blockGroups = new ArrayList<Bgd>();
            for (int i = 0; i < superBlock().blockGroupCount(); i++) {
                Bgd _t_blockGroups = new Bgd(this._io, this, _root);
                try {
                    _t_blockGroups._read();
                } finally {
                    this.blockGroups.add(_t_blockGroups);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.superBlock._fetchInstances();
            for (int i = 0; i < this.blockGroups.size(); i++) {
                this.blockGroups.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_superBlock = new ByteBufferKaitaiStream(1024);
            this._io.addChildStream(_io__raw_superBlock);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (1024));
                final BlockGroup _this = this;
                _io__raw_superBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_superBlock = _io__raw_superBlock.toByteArray();
                        if (_this._raw_superBlock.length != 1024)
                            throw new ConsistencyError("raw(super_block)", 1024, _this._raw_superBlock.length);
                        parent.writeBytes(_this._raw_superBlock);
                    }
                });
            }
            this.superBlock._write_Seq(_io__raw_superBlock);
            for (int i = 0; i < this.blockGroups.size(); i++) {
                this.blockGroups.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.superBlock._root(), _root()))
                throw new ConsistencyError("super_block", _root(), this.superBlock._root());
            if (!Objects.equals(this.superBlock._parent(), this))
                throw new ConsistencyError("super_block", this, this.superBlock._parent());
            if (this.blockGroups.size() != superBlock().blockGroupCount())
                throw new ConsistencyError("block_groups", superBlock().blockGroupCount(), this.blockGroups.size());
            for (int i = 0; i < this.blockGroups.size(); i++) {
                if (!Objects.equals(this.blockGroups.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("block_groups", _root(), this.blockGroups.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.blockGroups.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("block_groups", this, this.blockGroups.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private SuperBlockStruct superBlock;
        private List<Bgd> blockGroups;
        private Ext2 _root;
        private Ext2 _parent;
        private byte[] _raw_superBlock;
        public SuperBlockStruct superBlock() { return superBlock; }
        public void setSuperBlock(SuperBlockStruct _v) { _dirty = true; superBlock = _v; }
        public List<Bgd> blockGroups() { return blockGroups; }
        public void setBlockGroups(List<Bgd> _v) { _dirty = true; blockGroups = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2 _parent() { return _parent; }
        public void set_parent(Ext2 _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_superBlock() { return _raw_superBlock; }
        public void set_raw_SuperBlock(byte[] _v) { _dirty = true; _raw_superBlock = _v; }
    }
    public static class BlockPtr extends KaitaiStruct.ReadWrite {
        public static BlockPtr fromFile(String fileName) throws IOException {
            return new BlockPtr(new ByteBufferKaitaiStream(fileName));
        }
        public BlockPtr() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ptr = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                this.body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4le(this.ptr);
        }

        public void _check() {
            if (_enabledBody) {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
            }
            _dirty = false;
        }
        private RawBlock body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public RawBlock body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ptr() * _root().bg1().superBlock().blockSize());
            this._raw_body = this._io.readBytes(_root().bg1().superBlock().blockSize());
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
            this.body = new RawBlock(_io__raw_body, this, _root);
            this.body._read();
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(RawBlock _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(ptr() * _root().bg1().superBlock().blockSize());
            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_root().bg1().superBlock().blockSize());
            this._io.addChildStream(_io__raw_body);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (_root().bg1().superBlock().blockSize()));
                final BlockPtr _this = this;
                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_body = _io__raw_body.toByteArray();
                        if (_this._raw_body.length != _root().bg1().superBlock().blockSize())
                            throw new ConsistencyError("raw(body)", _root().bg1().superBlock().blockSize(), _this._raw_body.length);
                        parent.writeBytes(_this._raw_body);
                    }
                });
            }
            this.body._write_Seq(_io__raw_body);
            this._io.seek(_pos);
        }
        private long ptr;
        private Ext2 _root;
        private Ext2.Inode _parent;
        private byte[] _raw_body;
        public long ptr() { return ptr; }
        public void setPtr(long _v) { _dirty = true; ptr = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.Inode _parent() { return _parent; }
        public void set_parent(Ext2.Inode _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class Dir extends KaitaiStruct.ReadWrite {
        public static Dir fromFile(String fileName) throws IOException {
            return new Dir(new ByteBufferKaitaiStream(fileName));
        }
        public Dir() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<DirEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    DirEntry _t_entries = new DirEntry(this._io, this, _root);
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
        private List<DirEntry> entries;
        private Ext2 _root;
        private Ext2.Inode _parent;
        public List<DirEntry> entries() { return entries; }
        public void setEntries(List<DirEntry> _v) { _dirty = true; entries = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.Inode _parent() { return _parent; }
        public void set_parent(Ext2.Inode _v) { _dirty = true; _parent = _v; }
    }
    public static class DirEntry extends KaitaiStruct.ReadWrite {
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
        public DirEntry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.inodePtr = this._io.readU4le();
            this.recLen = this._io.readU2le();
            this.nameLen = this._io.readU1();
            this.fileType = FileTypeEnum.byId(this._io.readU1());
            this.name = new String(this._io.readBytes(nameLen()), StandardCharsets.UTF_8);
            this.padding = this._io.readBytes((recLen() - nameLen()) - 8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.inodePtr);
            this._io.writeU2le(this.recLen);
            this._io.writeU1(this.nameLen);
            this._io.writeU1(((Number) (this.fileType.id())).intValue());
            this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("UTF-8")).length != nameLen())
                throw new ConsistencyError("name", nameLen(), (this.name).getBytes(Charset.forName("UTF-8")).length);
            if (this.padding.length != (recLen() - nameLen()) - 8)
                throw new ConsistencyError("padding", (recLen() - nameLen()) - 8, this.padding.length);
            _dirty = false;
        }
        private Inode inode;
        public Inode inode() {
            if (this.inode != null)
                return this.inode;
            this.inode = _root().bg1().blockGroups().get(((Number) ((inodePtr() - 1) / _root().bg1().superBlock().inodesPerGroup())).intValue()).inodes().get(((Number) (KaitaiStream.mod(inodePtr() - 1, _root().bg1().superBlock().inodesPerGroup()))).intValue());
            return this.inode;
        }
        public void _invalidateInode() { this.inode = null; }
        private long inodePtr;
        private int recLen;
        private int nameLen;
        private FileTypeEnum fileType;
        private String name;
        private byte[] padding;
        private Ext2 _root;
        private Ext2.Dir _parent;
        public long inodePtr() { return inodePtr; }
        public void setInodePtr(long _v) { _dirty = true; inodePtr = _v; }
        public int recLen() { return recLen; }
        public void setRecLen(int _v) { _dirty = true; recLen = _v; }
        public int nameLen() { return nameLen; }
        public void setNameLen(int _v) { _dirty = true; nameLen = _v; }
        public FileTypeEnum fileType() { return fileType; }
        public void setFileType(FileTypeEnum _v) { _dirty = true; fileType = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.Dir _parent() { return _parent; }
        public void set_parent(Ext2.Dir _v) { _dirty = true; _parent = _v; }
    }
    public static class Inode extends KaitaiStruct.ReadWrite {
        public static Inode fromFile(String fileName) throws IOException {
            return new Inode(new ByteBufferKaitaiStream(fileName));
        }
        public Inode() {
            this(null, null, null);
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
        }
        public void _read() {
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
            this.block = new ArrayList<BlockPtr>();
            for (int i = 0; i < 15; i++) {
                BlockPtr _t_block = new BlockPtr(this._io, this, _root);
                try {
                    _t_block._read();
                } finally {
                    this.block.add(_t_block);
                }
            }
            this.generation = this._io.readU4le();
            this.fileAcl = this._io.readU4le();
            this.dirAcl = this._io.readU4le();
            this.faddr = this._io.readU4le();
            this.osd2 = this._io.readBytes(12);
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.block.size(); i++) {
                this.block.get(((Number) (i)).intValue())._fetchInstances();
            }
            asDir();
            if (this.asDir != null) {
                this.asDir._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteAsDir = _enabledAsDir;
            this._io.writeU2le(this.mode);
            this._io.writeU2le(this.uid);
            this._io.writeU4le(this.size);
            this._io.writeU4le(this.atime);
            this._io.writeU4le(this.ctime);
            this._io.writeU4le(this.mtime);
            this._io.writeU4le(this.dtime);
            this._io.writeU2le(this.gid);
            this._io.writeU2le(this.linksCount);
            this._io.writeU4le(this.blocks);
            this._io.writeU4le(this.flags);
            this._io.writeU4le(this.osd1);
            for (int i = 0; i < this.block.size(); i++) {
                this.block.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeU4le(this.generation);
            this._io.writeU4le(this.fileAcl);
            this._io.writeU4le(this.dirAcl);
            this._io.writeU4le(this.faddr);
            this._io.writeBytes(this.osd2);
        }

        public void _check() {
            if (this.block.size() != 15)
                throw new ConsistencyError("block", 15, this.block.size());
            for (int i = 0; i < this.block.size(); i++) {
                if (!Objects.equals(this.block.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("block", _root(), this.block.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.block.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("block", this, this.block.get(((Number) (i)).intValue())._parent());
            }
            if (this.osd2.length != 12)
                throw new ConsistencyError("osd2", 12, this.osd2.length);
            if (_enabledAsDir) {
                if (!Objects.equals(this.asDir._root(), _root()))
                    throw new ConsistencyError("as_dir", _root(), this.asDir._root());
                if (!Objects.equals(this.asDir._parent(), this))
                    throw new ConsistencyError("as_dir", this, this.asDir._parent());
            }
            _dirty = false;
        }
        private Dir asDir;
        private boolean _shouldWriteAsDir = false;
        private boolean _enabledAsDir = true;
        public Dir asDir() {
            if (_shouldWriteAsDir)
                _writeAsDir();
            if (this.asDir != null)
                return this.asDir;
            if (!_enabledAsDir)
                return null;
            KaitaiStream io = block().get(((int) 0)).body()._io();
            long _pos = io.pos();
            io.seek(0);
            this.asDir = new Dir(io, this, _root);
            this.asDir._read();
            io.seek(_pos);
            return this.asDir;
        }
        public void setAsDir(Dir _v) { _dirty = true; asDir = _v; }
        public void setAsDir_Enabled(boolean _v) { _dirty = true; _enabledAsDir = _v; }

        private void _writeAsDir() {
            _shouldWriteAsDir = false;
            KaitaiStream io = block().get(((int) 0)).body()._io();
            long _pos = io.pos();
            io.seek(0);
            this.asDir._write_Seq(io);
            io.seek(_pos);
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
        private List<BlockPtr> block;
        private long generation;
        private long fileAcl;
        private long dirAcl;
        private long faddr;
        private byte[] osd2;
        private Ext2 _root;
        private Ext2.Bgd _parent;
        public int mode() { return mode; }
        public void setMode(int _v) { _dirty = true; mode = _v; }
        public int uid() { return uid; }
        public void setUid(int _v) { _dirty = true; uid = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public long atime() { return atime; }
        public void setAtime(long _v) { _dirty = true; atime = _v; }
        public long ctime() { return ctime; }
        public void setCtime(long _v) { _dirty = true; ctime = _v; }
        public long mtime() { return mtime; }
        public void setMtime(long _v) { _dirty = true; mtime = _v; }
        public long dtime() { return dtime; }
        public void setDtime(long _v) { _dirty = true; dtime = _v; }
        public int gid() { return gid; }
        public void setGid(int _v) { _dirty = true; gid = _v; }
        public int linksCount() { return linksCount; }
        public void setLinksCount(int _v) { _dirty = true; linksCount = _v; }
        public long blocks() { return blocks; }
        public void setBlocks(long _v) { _dirty = true; blocks = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public long osd1() { return osd1; }
        public void setOsd1(long _v) { _dirty = true; osd1 = _v; }
        public List<BlockPtr> block() { return block; }
        public void setBlock(List<BlockPtr> _v) { _dirty = true; block = _v; }
        public long generation() { return generation; }
        public void setGeneration(long _v) { _dirty = true; generation = _v; }
        public long fileAcl() { return fileAcl; }
        public void setFileAcl(long _v) { _dirty = true; fileAcl = _v; }
        public long dirAcl() { return dirAcl; }
        public void setDirAcl(long _v) { _dirty = true; dirAcl = _v; }
        public long faddr() { return faddr; }
        public void setFaddr(long _v) { _dirty = true; faddr = _v; }
        public byte[] osd2() { return osd2; }
        public void setOsd2(byte[] _v) { _dirty = true; osd2 = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.Bgd _parent() { return _parent; }
        public void set_parent(Ext2.Bgd _v) { _dirty = true; _parent = _v; }
    }
    public static class RawBlock extends KaitaiStruct.ReadWrite {
        public static RawBlock fromFile(String fileName) throws IOException {
            return new RawBlock(new ByteBufferKaitaiStream(fileName));
        }
        public RawBlock() {
            this(null, null, null);
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
        }
        public void _read() {
            this.body = this._io.readBytes(_root().bg1().superBlock().blockSize());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != _root().bg1().superBlock().blockSize())
                throw new ConsistencyError("body", _root().bg1().superBlock().blockSize(), this.body.length);
            _dirty = false;
        }
        private byte[] body;
        private Ext2 _root;
        private Ext2.BlockPtr _parent;
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.BlockPtr _parent() { return _parent; }
        public void set_parent(Ext2.BlockPtr _v) { _dirty = true; _parent = _v; }
    }
    public static class SuperBlockStruct extends KaitaiStruct.ReadWrite {
        public static SuperBlockStruct fromFile(String fileName) throws IOException {
            return new SuperBlockStruct(new ByteBufferKaitaiStream(fileName));
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
        public SuperBlockStruct() {
            this(null, null, null);
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
        }
        public void _read() {
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
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { 83, -17 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, -17 }, this.magic, this._io, "/types/super_block_struct/seq/15");
            }
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
            this.hashSeed = new ArrayList<Long>();
            for (int i = 0; i < 4; i++) {
                this.hashSeed.add(this._io.readU4le());
            }
            this.defHashVersion = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.hashSeed.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.inodesCount);
            this._io.writeU4le(this.blocksCount);
            this._io.writeU4le(this.rBlocksCount);
            this._io.writeU4le(this.freeBlocksCount);
            this._io.writeU4le(this.freeInodesCount);
            this._io.writeU4le(this.firstDataBlock);
            this._io.writeU4le(this.logBlockSize);
            this._io.writeU4le(this.logFragSize);
            this._io.writeU4le(this.blocksPerGroup);
            this._io.writeU4le(this.fragsPerGroup);
            this._io.writeU4le(this.inodesPerGroup);
            this._io.writeU4le(this.mtime);
            this._io.writeU4le(this.wtime);
            this._io.writeU2le(this.mntCount);
            this._io.writeU2le(this.maxMntCount);
            this._io.writeBytes(this.magic);
            this._io.writeU2le(((Number) (this.state.id())).intValue());
            this._io.writeU2le(((Number) (this.errors.id())).intValue());
            this._io.writeU2le(this.minorRevLevel);
            this._io.writeU4le(this.lastcheck);
            this._io.writeU4le(this.checkinterval);
            this._io.writeU4le(this.creatorOs);
            this._io.writeU4le(this.revLevel);
            this._io.writeU2le(this.defResuid);
            this._io.writeU2le(this.defResgid);
            this._io.writeU4le(this.firstIno);
            this._io.writeU2le(this.inodeSize);
            this._io.writeU2le(this.blockGroupNr);
            this._io.writeU4le(this.featureCompat);
            this._io.writeU4le(this.featureIncompat);
            this._io.writeU4le(this.featureRoCompat);
            this._io.writeBytes(this.uuid);
            this._io.writeBytes(this.volumeName);
            this._io.writeBytes(this.lastMounted);
            this._io.writeU4le(this.algoBitmap);
            this._io.writeU1(this.preallocBlocks);
            this._io.writeU1(this.preallocDirBlocks);
            this._io.writeBytes(this.padding1);
            this._io.writeBytes(this.journalUuid);
            this._io.writeU4le(this.journalInum);
            this._io.writeU4le(this.journalDev);
            this._io.writeU4le(this.lastOrphan);
            for (int i = 0; i < this.hashSeed.size(); i++) {
                this._io.writeU4le(this.hashSeed.get(((Number) (i)).intValue()));
            }
            this._io.writeU1(this.defHashVersion);
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 83, -17 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, -17 }, this.magic, null, "/types/super_block_struct/seq/15");
            }
            if (this.uuid.length != 16)
                throw new ConsistencyError("uuid", 16, this.uuid.length);
            if (this.volumeName.length != 16)
                throw new ConsistencyError("volume_name", 16, this.volumeName.length);
            if (this.lastMounted.length != 64)
                throw new ConsistencyError("last_mounted", 64, this.lastMounted.length);
            if (this.padding1.length != 2)
                throw new ConsistencyError("padding1", 2, this.padding1.length);
            if (this.journalUuid.length != 16)
                throw new ConsistencyError("journal_uuid", 16, this.journalUuid.length);
            if (this.hashSeed.size() != 4)
                throw new ConsistencyError("hash_seed", 4, this.hashSeed.size());
            for (int i = 0; i < this.hashSeed.size(); i++) {
            }
            _dirty = false;
        }
        private Integer blockGroupCount;
        public Integer blockGroupCount() {
            if (this.blockGroupCount != null)
                return this.blockGroupCount;
            this.blockGroupCount = ((Number) (blocksCount() / blocksPerGroup())).intValue();
            return this.blockGroupCount;
        }
        public void _invalidateBlockGroupCount() { this.blockGroupCount = null; }
        private Integer blockSize;
        public Integer blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            this.blockSize = ((Number) (1024 << logBlockSize())).intValue();
            return this.blockSize;
        }
        public void _invalidateBlockSize() { this.blockSize = null; }
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
        private List<Long> hashSeed;
        private int defHashVersion;
        private Ext2 _root;
        private Ext2.BlockGroup _parent;
        public long inodesCount() { return inodesCount; }
        public void setInodesCount(long _v) { _dirty = true; inodesCount = _v; }
        public long blocksCount() { return blocksCount; }
        public void setBlocksCount(long _v) { _dirty = true; blocksCount = _v; }
        public long rBlocksCount() { return rBlocksCount; }
        public void setRBlocksCount(long _v) { _dirty = true; rBlocksCount = _v; }
        public long freeBlocksCount() { return freeBlocksCount; }
        public void setFreeBlocksCount(long _v) { _dirty = true; freeBlocksCount = _v; }
        public long freeInodesCount() { return freeInodesCount; }
        public void setFreeInodesCount(long _v) { _dirty = true; freeInodesCount = _v; }
        public long firstDataBlock() { return firstDataBlock; }
        public void setFirstDataBlock(long _v) { _dirty = true; firstDataBlock = _v; }
        public long logBlockSize() { return logBlockSize; }
        public void setLogBlockSize(long _v) { _dirty = true; logBlockSize = _v; }
        public long logFragSize() { return logFragSize; }
        public void setLogFragSize(long _v) { _dirty = true; logFragSize = _v; }
        public long blocksPerGroup() { return blocksPerGroup; }
        public void setBlocksPerGroup(long _v) { _dirty = true; blocksPerGroup = _v; }
        public long fragsPerGroup() { return fragsPerGroup; }
        public void setFragsPerGroup(long _v) { _dirty = true; fragsPerGroup = _v; }
        public long inodesPerGroup() { return inodesPerGroup; }
        public void setInodesPerGroup(long _v) { _dirty = true; inodesPerGroup = _v; }
        public long mtime() { return mtime; }
        public void setMtime(long _v) { _dirty = true; mtime = _v; }
        public long wtime() { return wtime; }
        public void setWtime(long _v) { _dirty = true; wtime = _v; }
        public int mntCount() { return mntCount; }
        public void setMntCount(int _v) { _dirty = true; mntCount = _v; }
        public int maxMntCount() { return maxMntCount; }
        public void setMaxMntCount(int _v) { _dirty = true; maxMntCount = _v; }
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public StateEnum state() { return state; }
        public void setState(StateEnum _v) { _dirty = true; state = _v; }
        public ErrorsEnum errors() { return errors; }
        public void setErrors(ErrorsEnum _v) { _dirty = true; errors = _v; }
        public int minorRevLevel() { return minorRevLevel; }
        public void setMinorRevLevel(int _v) { _dirty = true; minorRevLevel = _v; }
        public long lastcheck() { return lastcheck; }
        public void setLastcheck(long _v) { _dirty = true; lastcheck = _v; }
        public long checkinterval() { return checkinterval; }
        public void setCheckinterval(long _v) { _dirty = true; checkinterval = _v; }
        public long creatorOs() { return creatorOs; }
        public void setCreatorOs(long _v) { _dirty = true; creatorOs = _v; }
        public long revLevel() { return revLevel; }
        public void setRevLevel(long _v) { _dirty = true; revLevel = _v; }
        public int defResuid() { return defResuid; }
        public void setDefResuid(int _v) { _dirty = true; defResuid = _v; }
        public int defResgid() { return defResgid; }
        public void setDefResgid(int _v) { _dirty = true; defResgid = _v; }
        public long firstIno() { return firstIno; }
        public void setFirstIno(long _v) { _dirty = true; firstIno = _v; }
        public int inodeSize() { return inodeSize; }
        public void setInodeSize(int _v) { _dirty = true; inodeSize = _v; }
        public int blockGroupNr() { return blockGroupNr; }
        public void setBlockGroupNr(int _v) { _dirty = true; blockGroupNr = _v; }
        public long featureCompat() { return featureCompat; }
        public void setFeatureCompat(long _v) { _dirty = true; featureCompat = _v; }
        public long featureIncompat() { return featureIncompat; }
        public void setFeatureIncompat(long _v) { _dirty = true; featureIncompat = _v; }
        public long featureRoCompat() { return featureRoCompat; }
        public void setFeatureRoCompat(long _v) { _dirty = true; featureRoCompat = _v; }
        public byte[] uuid() { return uuid; }
        public void setUuid(byte[] _v) { _dirty = true; uuid = _v; }
        public byte[] volumeName() { return volumeName; }
        public void setVolumeName(byte[] _v) { _dirty = true; volumeName = _v; }
        public byte[] lastMounted() { return lastMounted; }
        public void setLastMounted(byte[] _v) { _dirty = true; lastMounted = _v; }
        public long algoBitmap() { return algoBitmap; }
        public void setAlgoBitmap(long _v) { _dirty = true; algoBitmap = _v; }
        public int preallocBlocks() { return preallocBlocks; }
        public void setPreallocBlocks(int _v) { _dirty = true; preallocBlocks = _v; }
        public int preallocDirBlocks() { return preallocDirBlocks; }
        public void setPreallocDirBlocks(int _v) { _dirty = true; preallocDirBlocks = _v; }
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }
        public byte[] journalUuid() { return journalUuid; }
        public void setJournalUuid(byte[] _v) { _dirty = true; journalUuid = _v; }
        public long journalInum() { return journalInum; }
        public void setJournalInum(long _v) { _dirty = true; journalInum = _v; }
        public long journalDev() { return journalDev; }
        public void setJournalDev(long _v) { _dirty = true; journalDev = _v; }
        public long lastOrphan() { return lastOrphan; }
        public void setLastOrphan(long _v) { _dirty = true; lastOrphan = _v; }
        public List<Long> hashSeed() { return hashSeed; }
        public void setHashSeed(List<Long> _v) { _dirty = true; hashSeed = _v; }
        public int defHashVersion() { return defHashVersion; }
        public void setDefHashVersion(int _v) { _dirty = true; defHashVersion = _v; }
        public Ext2 _root() { return _root; }
        public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
        public Ext2.BlockGroup _parent() { return _parent; }
        public void set_parent(Ext2.BlockGroup _v) { _dirty = true; _parent = _v; }
    }
    private BlockGroup bg1;
    private boolean _shouldWriteBg1 = false;
    private boolean _enabledBg1 = true;
    public BlockGroup bg1() {
        if (_shouldWriteBg1)
            _writeBg1();
        if (this.bg1 != null)
            return this.bg1;
        if (!_enabledBg1)
            return null;
        long _pos = this._io.pos();
        this._io.seek(1024);
        this.bg1 = new BlockGroup(this._io, this, _root);
        this.bg1._read();
        this._io.seek(_pos);
        return this.bg1;
    }
    public void setBg1(BlockGroup _v) { _dirty = true; bg1 = _v; }
    public void setBg1_Enabled(boolean _v) { _dirty = true; _enabledBg1 = _v; }

    private void _writeBg1() {
        _shouldWriteBg1 = false;
        long _pos = this._io.pos();
        this._io.seek(1024);
        this.bg1._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Dir rootDir;
    public Dir rootDir() {
        if (this.rootDir != null)
            return this.rootDir;
        this.rootDir = bg1().blockGroups().get(((int) 0)).inodes().get(((int) 1)).asDir();
        return this.rootDir;
    }
    public void _invalidateRootDir() { this.rootDir = null; }
    private Ext2 _root;
    private KaitaiStruct.ReadWrite _parent;
    public Ext2 _root() { return _root; }
    public void set_root(Ext2 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
