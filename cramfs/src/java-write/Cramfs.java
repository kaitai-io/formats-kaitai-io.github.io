// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Arrays;

public class Cramfs extends KaitaiStruct.ReadWrite {
    public static Cramfs fromFile(String fileName) throws IOException {
        return new Cramfs(new ByteBufferKaitaiStream(fileName));
    }
    public Cramfs() {
        this(null, null, null);
    }

    public Cramfs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Cramfs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Cramfs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Cramfs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.superBlock = new SuperBlockStruct(this._io, this, _root);
        this.superBlock._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.superBlock._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.superBlock._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.superBlock._root(), _root()))
            throw new ConsistencyError("super_block", _root(), this.superBlock._root());
        if (!Objects.equals(this.superBlock._parent(), this))
            throw new ConsistencyError("super_block", this, this.superBlock._parent());
        _dirty = false;
    }
    public static class ChunkedDataInode extends KaitaiStruct.ReadWrite {
        public static ChunkedDataInode fromFile(String fileName) throws IOException {
            return new ChunkedDataInode(new ByteBufferKaitaiStream(fileName));
        }
        public ChunkedDataInode() {
            this(null, null, null);
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
        }
        public void _read() {
            this.blockEndIndex = new ArrayList<Long>();
            for (int i = 0; i < ((_parent().size() + _root().pageSize()) - 1) / _root().pageSize(); i++) {
                this.blockEndIndex.add(this._io.readU4le());
            }
            this.rawBlocks = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.blockEndIndex.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.blockEndIndex.size(); i++) {
                this._io.writeU4le(this.blockEndIndex.get(((Number) (i)).intValue()));
            }
            this._io.writeBytes(this.rawBlocks);
            if (!(this._io.isEof()))
                throw new ConsistencyError("raw_blocks", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.blockEndIndex.size() != ((_parent().size() + _root().pageSize()) - 1) / _root().pageSize())
                throw new ConsistencyError("block_end_index", ((_parent().size() + _root().pageSize()) - 1) / _root().pageSize(), this.blockEndIndex.size());
            for (int i = 0; i < this.blockEndIndex.size(); i++) {
            }
            _dirty = false;
        }
        private List<Long> blockEndIndex;
        private byte[] rawBlocks;
        private Cramfs _root;
        private Cramfs.Inode _parent;
        public List<Long> blockEndIndex() { return blockEndIndex; }
        public void setBlockEndIndex(List<Long> _v) { _dirty = true; blockEndIndex = _v; }
        public byte[] rawBlocks() { return rawBlocks; }
        public void setRawBlocks(byte[] _v) { _dirty = true; rawBlocks = _v; }
        public Cramfs _root() { return _root; }
        public void set_root(Cramfs _v) { _dirty = true; _root = _v; }
        public Cramfs.Inode _parent() { return _parent; }
        public void set_parent(Cramfs.Inode _v) { _dirty = true; _parent = _v; }
    }
    public static class DirInode extends KaitaiStruct.ReadWrite {
        public static DirInode fromFile(String fileName) throws IOException {
            return new DirInode(new ByteBufferKaitaiStream(fileName));
        }
        public DirInode() {
            this(null, null, null);
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
        }
        public void _read() {
            if (_io().size() > 0) {
                this.children = new ArrayList<Inode>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        Inode _t_children = new Inode(this._io, this, _root);
                        try {
                            _t_children._read();
                        } finally {
                            this.children.add(_t_children);
                        }
                        i++;
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (_io().size() > 0) {
                for (int i = 0; i < this.children.size(); i++) {
                    this.children.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (_io().size() > 0) {
                for (int i = 0; i < this.children.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("children", 0, this._io.size() - this._io.pos());
                    if (!Objects.equals(this.children.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("children", _root(), this.children.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.children.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("children", this, this.children.get(((Number) (i)).intValue())._parent());
                    this.children.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("children", 0, this._io.size() - this._io.pos());
            }
        }

        public void _check() {
            _dirty = false;
        }
        private List<Inode> children;
        private Cramfs _root;
        private Cramfs.Inode _parent;
        public List<Inode> children() { return children; }
        public void setChildren(List<Inode> _v) { _dirty = true; children = _v; }
        public Cramfs _root() { return _root; }
        public void set_root(Cramfs _v) { _dirty = true; _root = _v; }
        public Cramfs.Inode _parent() { return _parent; }
        public void set_parent(Cramfs.Inode _v) { _dirty = true; _parent = _v; }
    }
    public static class Info extends KaitaiStruct.ReadWrite {
        public static Info fromFile(String fileName) throws IOException {
            return new Info(new ByteBufferKaitaiStream(fileName));
        }
        public Info() {
            this(null, null, null);
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
        }
        public void _read() {
            this.crc = this._io.readU4le();
            this.edition = this._io.readU4le();
            this.blocks = this._io.readU4le();
            this.files = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.crc);
            this._io.writeU4le(this.edition);
            this._io.writeU4le(this.blocks);
            this._io.writeU4le(this.files);
        }

        public void _check() {
            _dirty = false;
        }
        private long crc;
        private long edition;
        private long blocks;
        private long files;
        private Cramfs _root;
        private Cramfs.SuperBlockStruct _parent;
        public long crc() { return crc; }
        public void setCrc(long _v) { _dirty = true; crc = _v; }
        public long edition() { return edition; }
        public void setEdition(long _v) { _dirty = true; edition = _v; }
        public long blocks() { return blocks; }
        public void setBlocks(long _v) { _dirty = true; blocks = _v; }
        public long files() { return files; }
        public void setFiles(long _v) { _dirty = true; files = _v; }
        public Cramfs _root() { return _root; }
        public void set_root(Cramfs _v) { _dirty = true; _root = _v; }
        public Cramfs.SuperBlockStruct _parent() { return _parent; }
        public void set_parent(Cramfs.SuperBlockStruct _v) { _dirty = true; _parent = _v; }
    }
    public static class Inode extends KaitaiStruct.ReadWrite {
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
        public Inode() {
            this(null, null, null);
        }

        public Inode(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Inode(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Inode(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Cramfs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.mode = this._io.readU2le();
            this.uid = this._io.readU2le();
            this.sizeGid = this._io.readU4le();
            this.namelenOffset = this._io.readU4le();
            this.name = new String(this._io.readBytes(namelen()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            asDir();
            if (this.asDir != null) {
                this.asDir._fetchInstances();
            }
            asRegFile();
            if (this.asRegFile != null) {
                this.asRegFile._fetchInstances();
            }
            asSymlink();
            if (this.asSymlink != null) {
                this.asSymlink._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteAsDir = _enabledAsDir;
            _shouldWriteAsRegFile = _enabledAsRegFile;
            _shouldWriteAsSymlink = _enabledAsSymlink;
            this._io.writeU2le(this.mode);
            this._io.writeU2le(this.uid);
            this._io.writeU4le(this.sizeGid);
            this._io.writeU4le(this.namelenOffset);
            this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("UTF-8")).length != namelen())
                throw new ConsistencyError("name", namelen(), (this.name).getBytes(Charset.forName("UTF-8")).length);
            if (_enabledAsDir) {
                if (!Objects.equals(this.asDir._root(), _root()))
                    throw new ConsistencyError("as_dir", _root(), this.asDir._root());
                if (!Objects.equals(this.asDir._parent(), this))
                    throw new ConsistencyError("as_dir", this, this.asDir._parent());
            }
            if (_enabledAsRegFile) {
                if (!Objects.equals(this.asRegFile._root(), _root()))
                    throw new ConsistencyError("as_reg_file", _root(), this.asRegFile._root());
                if (!Objects.equals(this.asRegFile._parent(), this))
                    throw new ConsistencyError("as_reg_file", this, this.asRegFile._parent());
            }
            if (_enabledAsSymlink) {
                if (!Objects.equals(this.asSymlink._root(), _root()))
                    throw new ConsistencyError("as_symlink", _root(), this.asSymlink._root());
                if (!Objects.equals(this.asSymlink._parent(), this))
                    throw new ConsistencyError("as_symlink", this, this.asSymlink._parent());
            }
            _dirty = false;
        }
        private DirInode asDir;
        private boolean _shouldWriteAsDir = false;
        private boolean _enabledAsDir = true;
        public DirInode asDir() {
            if (_shouldWriteAsDir)
                _writeAsDir();
            if (this.asDir != null)
                return this.asDir;
            if (!_enabledAsDir)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this._raw_asDir = io.readBytes(size());
            KaitaiStream _io__raw_asDir = new ByteBufferKaitaiStream(this._raw_asDir);
            this.asDir = new DirInode(_io__raw_asDir, this, _root);
            this.asDir._read();
            io.seek(_pos);
            return this.asDir;
        }
        public void setAsDir(DirInode _v) { _dirty = true; asDir = _v; }
        public void setAsDir_Enabled(boolean _v) { _dirty = true; _enabledAsDir = _v; }

        private void _writeAsDir() {
            _shouldWriteAsDir = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            final KaitaiStream _io__raw_asDir = new ByteBufferKaitaiStream(size());
            io.addChildStream(_io__raw_asDir);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (size()));
                final Inode _this = this;
                _io__raw_asDir.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_asDir = _io__raw_asDir.toByteArray();
                        if (_this._raw_asDir.length != size())
                            throw new ConsistencyError("raw(as_dir)", size(), _this._raw_asDir.length);
                        parent.writeBytes(_this._raw_asDir);
                    }
                });
            }
            this.asDir._write_Seq(_io__raw_asDir);
            io.seek(_pos);
        }
        private ChunkedDataInode asRegFile;
        private boolean _shouldWriteAsRegFile = false;
        private boolean _enabledAsRegFile = true;
        public ChunkedDataInode asRegFile() {
            if (_shouldWriteAsRegFile)
                _writeAsRegFile();
            if (this.asRegFile != null)
                return this.asRegFile;
            if (!_enabledAsRegFile)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this.asRegFile = new ChunkedDataInode(io, this, _root);
            this.asRegFile._read();
            io.seek(_pos);
            return this.asRegFile;
        }
        public void setAsRegFile(ChunkedDataInode _v) { _dirty = true; asRegFile = _v; }
        public void setAsRegFile_Enabled(boolean _v) { _dirty = true; _enabledAsRegFile = _v; }

        private void _writeAsRegFile() {
            _shouldWriteAsRegFile = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this.asRegFile._write_Seq(io);
            io.seek(_pos);
        }
        private ChunkedDataInode asSymlink;
        private boolean _shouldWriteAsSymlink = false;
        private boolean _enabledAsSymlink = true;
        public ChunkedDataInode asSymlink() {
            if (_shouldWriteAsSymlink)
                _writeAsSymlink();
            if (this.asSymlink != null)
                return this.asSymlink;
            if (!_enabledAsSymlink)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this.asSymlink = new ChunkedDataInode(io, this, _root);
            this.asSymlink._read();
            io.seek(_pos);
            return this.asSymlink;
        }
        public void setAsSymlink(ChunkedDataInode _v) { _dirty = true; asSymlink = _v; }
        public void setAsSymlink_Enabled(boolean _v) { _dirty = true; _enabledAsSymlink = _v; }

        private void _writeAsSymlink() {
            _shouldWriteAsSymlink = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this.asSymlink._write_Seq(io);
            io.seek(_pos);
        }
        private Integer attr;
        public Integer attr() {
            if (this.attr != null)
                return this.attr;
            this.attr = ((Number) (mode() >> 9 & 7)).intValue();
            return this.attr;
        }
        public void _invalidateAttr() { this.attr = null; }
        private Integer gid;
        public Integer gid() {
            if (this.gid != null)
                return this.gid;
            this.gid = ((Number) (sizeGid() >> 24)).intValue();
            return this.gid;
        }
        public void _invalidateGid() { this.gid = null; }
        private Integer namelen;
        public Integer namelen() {
            if (this.namelen != null)
                return this.namelen;
            this.namelen = ((Number) ((namelenOffset() & 63) << 2)).intValue();
            return this.namelen;
        }
        public void _invalidateNamelen() { this.namelen = null; }
        private Integer offset;
        public Integer offset() {
            if (this.offset != null)
                return this.offset;
            this.offset = ((Number) ((namelenOffset() >> 6 & 67108863) << 2)).intValue();
            return this.offset;
        }
        public void _invalidateOffset() { this.offset = null; }
        private Integer permG;
        public Integer permG() {
            if (this.permG != null)
                return this.permG;
            this.permG = ((Number) (mode() >> 3 & 7)).intValue();
            return this.permG;
        }
        public void _invalidatePermG() { this.permG = null; }
        private Integer permO;
        public Integer permO() {
            if (this.permO != null)
                return this.permO;
            this.permO = ((Number) (mode() & 7)).intValue();
            return this.permO;
        }
        public void _invalidatePermO() { this.permO = null; }
        private Integer permU;
        public Integer permU() {
            if (this.permU != null)
                return this.permU;
            this.permU = ((Number) (mode() >> 6 & 7)).intValue();
            return this.permU;
        }
        public void _invalidatePermU() { this.permU = null; }
        private Integer size;
        public Integer size() {
            if (this.size != null)
                return this.size;
            this.size = ((Number) (sizeGid() & 16777215)).intValue();
            return this.size;
        }
        public void _invalidateSize() { this.size = null; }
        private FileType type;
        public FileType type() {
            if (this.type != null)
                return this.type;
            this.type = FileType.byId(mode() >> 12 & 15);
            return this.type;
        }
        public void _invalidateType() { this.type = null; }
        private int mode;
        private int uid;
        private long sizeGid;
        private long namelenOffset;
        private String name;
        private Cramfs _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_asDir;
        public int mode() { return mode; }
        public void setMode(int _v) { _dirty = true; mode = _v; }
        public int uid() { return uid; }
        public void setUid(int _v) { _dirty = true; uid = _v; }
        public long sizeGid() { return sizeGid; }
        public void setSizeGid(long _v) { _dirty = true; sizeGid = _v; }
        public long namelenOffset() { return namelenOffset; }
        public void setNamelenOffset(long _v) { _dirty = true; namelenOffset = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public Cramfs _root() { return _root; }
        public void set_root(Cramfs _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_asDir() { return _raw_asDir; }
        public void set_raw_AsDir(byte[] _v) { _dirty = true; _raw_asDir = _v; }
    }
    public static class SuperBlockStruct extends KaitaiStruct.ReadWrite {
        public static SuperBlockStruct fromFile(String fileName) throws IOException {
            return new SuperBlockStruct(new ByteBufferKaitaiStream(fileName));
        }
        public SuperBlockStruct() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 69, 61, -51, 40 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 61, -51, 40 }, this.magic, this._io, "/types/super_block_struct/seq/0");
            }
            this.size = this._io.readU4le();
            this.flags = this._io.readU4le();
            this.future = this._io.readU4le();
            this.signature = this._io.readBytes(16);
            if (!(Arrays.equals(this.signature, new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }, this.signature, this._io, "/types/super_block_struct/seq/4");
            }
            this.fsid = new Info(this._io, this, _root);
            this.fsid._read();
            this.name = new String(this._io.readBytes(16), StandardCharsets.US_ASCII);
            this.root = new Inode(this._io, this, _root);
            this.root._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.fsid._fetchInstances();
            this.root._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.size);
            this._io.writeU4le(this.flags);
            this._io.writeU4le(this.future);
            this._io.writeBytes(this.signature);
            this.fsid._write_Seq(this._io);
            this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
            this.root._write_Seq(this._io);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 69, 61, -51, 40 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 61, -51, 40 }, this.magic, null, "/types/super_block_struct/seq/0");
            }
            if (this.signature.length != 16)
                throw new ConsistencyError("signature", 16, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }, this.signature, null, "/types/super_block_struct/seq/4");
            }
            if (!Objects.equals(this.fsid._root(), _root()))
                throw new ConsistencyError("fsid", _root(), this.fsid._root());
            if (!Objects.equals(this.fsid._parent(), this))
                throw new ConsistencyError("fsid", this, this.fsid._parent());
            if ((this.name).getBytes(Charset.forName("ASCII")).length != 16)
                throw new ConsistencyError("name", 16, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.root._root(), _root()))
                throw new ConsistencyError("root", _root(), this.root._root());
            if (!Objects.equals(this.root._parent(), this))
                throw new ConsistencyError("root", this, this.root._parent());
            _dirty = false;
        }
        private Integer flagFsidV2;
        public Integer flagFsidV2() {
            if (this.flagFsidV2 != null)
                return this.flagFsidV2;
            this.flagFsidV2 = ((Number) (flags() >> 0 & 1)).intValue();
            return this.flagFsidV2;
        }
        public void _invalidateFlagFsidV2() { this.flagFsidV2 = null; }
        private Integer flagHoles;
        public Integer flagHoles() {
            if (this.flagHoles != null)
                return this.flagHoles;
            this.flagHoles = ((Number) (flags() >> 8 & 1)).intValue();
            return this.flagHoles;
        }
        public void _invalidateFlagHoles() { this.flagHoles = null; }
        private Integer flagShiftedRootOffset;
        public Integer flagShiftedRootOffset() {
            if (this.flagShiftedRootOffset != null)
                return this.flagShiftedRootOffset;
            this.flagShiftedRootOffset = ((Number) (flags() >> 10 & 1)).intValue();
            return this.flagShiftedRootOffset;
        }
        public void _invalidateFlagShiftedRootOffset() { this.flagShiftedRootOffset = null; }
        private Integer flagSortedDirs;
        public Integer flagSortedDirs() {
            if (this.flagSortedDirs != null)
                return this.flagSortedDirs;
            this.flagSortedDirs = ((Number) (flags() >> 1 & 1)).intValue();
            return this.flagSortedDirs;
        }
        public void _invalidateFlagSortedDirs() { this.flagSortedDirs = null; }
        private Integer flagWrongSignature;
        public Integer flagWrongSignature() {
            if (this.flagWrongSignature != null)
                return this.flagWrongSignature;
            this.flagWrongSignature = ((Number) (flags() >> 9 & 1)).intValue();
            return this.flagWrongSignature;
        }
        public void _invalidateFlagWrongSignature() { this.flagWrongSignature = null; }
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public long future() { return future; }
        public void setFuture(long _v) { _dirty = true; future = _v; }
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public Info fsid() { return fsid; }
        public void setFsid(Info _v) { _dirty = true; fsid = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public Inode root() { return root; }
        public void setRoot(Inode _v) { _dirty = true; root = _v; }
        public Cramfs _root() { return _root; }
        public void set_root(Cramfs _v) { _dirty = true; _root = _v; }
        public Cramfs _parent() { return _parent; }
        public void set_parent(Cramfs _v) { _dirty = true; _parent = _v; }
    }
    private Integer pageSize;
    public Integer pageSize() {
        if (this.pageSize != null)
            return this.pageSize;
        this.pageSize = ((int) 4096);
        return this.pageSize;
    }
    public void _invalidatePageSize() { this.pageSize = null; }
    private SuperBlockStruct superBlock;
    private Cramfs _root;
    private KaitaiStruct.ReadWrite _parent;
    public SuperBlockStruct superBlock() { return superBlock; }
    public void setSuperBlock(SuperBlockStruct _v) { _dirty = true; superBlock = _v; }
    public Cramfs _root() { return _root; }
    public void set_root(Cramfs _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
