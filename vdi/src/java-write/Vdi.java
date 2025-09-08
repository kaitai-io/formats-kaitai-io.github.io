// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * A native VirtualBox file format
 * 
 * Images for testing can be downloaded from
 * 
 *  * <https://www.osboxes.org/virtualbox-images/>
 *  * <https://virtualboxes.org/images/>
 * 
 * or you can convert images of other formats.
 * @see <a href="https://github.com/qemu/qemu/blob/master/block/vdi.c">Source</a>
 */
public class Vdi extends KaitaiStruct.ReadWrite {
    public static Vdi fromFile(String fileName) throws IOException {
        return new Vdi(new ByteBufferKaitaiStream(fileName));
    }

    public enum ImageType {
        DYNAMIC(1),
        STATIC(2),
        UNDO(3),
        DIFF(4);

        private final long id;
        ImageType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ImageType> byId = new HashMap<Long, ImageType>(4);
        static {
            for (ImageType e : ImageType.values())
                byId.put(e.id(), e);
        }
        public static ImageType byId(long id) { return byId.get(id); }
    }
    public Vdi() {
        this(null, null, null);
    }

    public Vdi(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vdi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Vdi(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Vdi _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        blocksMap();
        if (this.blocksMap != null) {
            this.blocksMap._fetchInstances();
        }
        disk();
        if (this.disk != null) {
            this.disk._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteBlocksMap = _enabledBlocksMap;
        _shouldWriteDisk = _enabledDisk;
        this.header._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (_enabledBlocksMap) {
            if (!Objects.equals(this.blocksMap._root(), _root()))
                throw new ConsistencyError("blocks_map", _root(), this.blocksMap._root());
            if (!Objects.equals(this.blocksMap._parent(), this))
                throw new ConsistencyError("blocks_map", this, this.blocksMap._parent());
        }
        if (_enabledDisk) {
            if (!Objects.equals(this.disk._root(), _root()))
                throw new ConsistencyError("disk", _root(), this.disk._root());
            if (!Objects.equals(this.disk._parent(), this))
                throw new ConsistencyError("disk", this, this.disk._parent());
        }
        _dirty = false;
    }
    public static class BlocksMap extends KaitaiStruct.ReadWrite {
        public static BlocksMap fromFile(String fileName) throws IOException {
            return new BlocksMap(new ByteBufferKaitaiStream(fileName));
        }
        public BlocksMap() {
            this(null, null, null);
        }

        public BlocksMap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlocksMap(KaitaiStream _io, Vdi _parent) {
            this(_io, _parent, null);
        }

        public BlocksMap(KaitaiStream _io, Vdi _parent, Vdi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.index = new ArrayList<BlockIndex>();
            for (int i = 0; i < _root().header().headerMain().blocksInImage(); i++) {
                BlockIndex _t_index = new BlockIndex(this._io, this, _root);
                try {
                    _t_index._read();
                } finally {
                    this.index.add(_t_index);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.index.size(); i++) {
                this.index.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.index.size(); i++) {
                this.index.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.index.size() != _root().header().headerMain().blocksInImage())
                throw new ConsistencyError("index", _root().header().headerMain().blocksInImage(), this.index.size());
            for (int i = 0; i < this.index.size(); i++) {
                if (!Objects.equals(this.index.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("index", _root(), this.index.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.index.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("index", this, this.index.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class BlockIndex extends KaitaiStruct.ReadWrite {
            public static BlockIndex fromFile(String fileName) throws IOException {
                return new BlockIndex(new ByteBufferKaitaiStream(fileName));
            }
            public BlockIndex() {
                this(null, null, null);
            }

            public BlockIndex(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BlockIndex(KaitaiStream _io, Vdi.BlocksMap _parent) {
                this(_io, _parent, null);
            }

            public BlockIndex(KaitaiStream _io, Vdi.BlocksMap _parent, Vdi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.index = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.index);
            }

            public void _check() {
                _dirty = false;
            }
            private Block block;
            public Block block() {
                if (this.block != null)
                    return this.block;
                if (isAllocated()) {
                    this.block = _root().disk().blocks().get(((Number) (index())).intValue());
                }
                return this.block;
            }
            public void _invalidateBlock() { this.block = null; }
            private Boolean isAllocated;
            public Boolean isAllocated() {
                if (this.isAllocated != null)
                    return this.isAllocated;
                this.isAllocated = index() < _root().blockDiscarded();
                return this.isAllocated;
            }
            public void _invalidateIsAllocated() { this.isAllocated = null; }
            private long index;
            private Vdi _root;
            private Vdi.BlocksMap _parent;
            public long index() { return index; }
            public void setIndex(long _v) { _dirty = true; index = _v; }
            public Vdi _root() { return _root; }
            public void set_root(Vdi _v) { _dirty = true; _root = _v; }
            public Vdi.BlocksMap _parent() { return _parent; }
            public void set_parent(Vdi.BlocksMap _v) { _dirty = true; _parent = _v; }
        }
        private List<BlockIndex> index;
        private Vdi _root;
        private Vdi _parent;
        public List<BlockIndex> index() { return index; }
        public void setIndex(List<BlockIndex> _v) { _dirty = true; index = _v; }
        public Vdi _root() { return _root; }
        public void set_root(Vdi _v) { _dirty = true; _root = _v; }
        public Vdi _parent() { return _parent; }
        public void set_parent(Vdi _v) { _dirty = true; _parent = _v; }
    }
    public static class Disk extends KaitaiStruct.ReadWrite {
        public static Disk fromFile(String fileName) throws IOException {
            return new Disk(new ByteBufferKaitaiStream(fileName));
        }
        public Disk() {
            this(null, null, null);
        }

        public Disk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Disk(KaitaiStream _io, Vdi _parent) {
            this(_io, _parent, null);
        }

        public Disk(KaitaiStream _io, Vdi _parent, Vdi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.blocks = new ArrayList<Block>();
            for (int i = 0; i < _root().header().headerMain().blocksInImage(); i++) {
                Block _t_blocks = new Block(this._io, this, _root);
                try {
                    _t_blocks._read();
                } finally {
                    this.blocks.add(_t_blocks);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.blocks.size(); i++) {
                this.blocks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.blocks.size(); i++) {
                this.blocks.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.blocks.size() != _root().header().headerMain().blocksInImage())
                throw new ConsistencyError("blocks", _root().header().headerMain().blocksInImage(), this.blocks.size());
            for (int i = 0; i < this.blocks.size(); i++) {
                if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("blocks", _root(), this.blocks.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("blocks", this, this.blocks.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Block extends KaitaiStruct.ReadWrite {
            public static Block fromFile(String fileName) throws IOException {
                return new Block(new ByteBufferKaitaiStream(fileName));
            }
            public Block() {
                this(null, null, null);
            }

            public Block(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Block(KaitaiStream _io, Vdi.Disk _parent) {
                this(_io, _parent, null);
            }

            public Block(KaitaiStream _io, Vdi.Disk _parent, Vdi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.metadata = this._io.readBytes(_root().header().headerMain().blockMetadataSize());
                this._raw_data = new ArrayList<byte[]>();
                this.data = new ArrayList<Sector>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this._raw_data.add(this._io.readBytes(_root().header().headerMain().blockDataSize()));
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data.get(this._raw_data.size() - 1));
                        Sector _t_data = new Sector(_io__raw_data, this, _root);
                        try {
                            _t_data._read();
                        } finally {
                            this.data.add(_t_data);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.data.size(); i++) {
                    this.data.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.metadata);
                this._raw_data = new ArrayList<byte[]>();
                for (int i = 0; i < this.data.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
                    final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_root().header().headerMain().blockDataSize());
                    this._io.addChildStream(_io__raw_data);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (_root().header().headerMain().blockDataSize()));
                        final Block _this = this;
                        final int _i = i;
                        _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                            @Override
                            protected void write(KaitaiStream parent) {
                                _this._raw_data.add(_io__raw_data.toByteArray());
                                if (_this._raw_data.get(((Number) (_i)).intValue()).length != _root().header().headerMain().blockDataSize())
                                    throw new ConsistencyError("raw(data)", _root().header().headerMain().blockDataSize(), _this._raw_data.get(((Number) (_i)).intValue()).length);
                                parent.writeBytes(_this._raw_data.get(((Number) (_i)).intValue()));
                            }
                        });
                    }
                    this.data.get(((Number) (i)).intValue())._write_Seq(_io__raw_data);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                if (this.metadata.length != _root().header().headerMain().blockMetadataSize())
                    throw new ConsistencyError("metadata", _root().header().headerMain().blockMetadataSize(), this.metadata.length);
                for (int i = 0; i < this.data.size(); i++) {
                    if (!Objects.equals(this.data.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("data", _root(), this.data.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.data.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("data", this, this.data.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class Sector extends KaitaiStruct.ReadWrite {
                public static Sector fromFile(String fileName) throws IOException {
                    return new Sector(new ByteBufferKaitaiStream(fileName));
                }
                public Sector() {
                    this(null, null, null);
                }

                public Sector(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Sector(KaitaiStream _io, Vdi.Disk.Block _parent) {
                    this(_io, _parent, null);
                }

                public Sector(KaitaiStream _io, Vdi.Disk.Block _parent, Vdi _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.data = this._io.readBytes(_root().header().headerMain().geometry().sectorSize());
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.data);
                }

                public void _check() {
                    if (this.data.length != _root().header().headerMain().geometry().sectorSize())
                        throw new ConsistencyError("data", _root().header().headerMain().geometry().sectorSize(), this.data.length);
                    _dirty = false;
                }
                private byte[] data;
                private Vdi _root;
                private Vdi.Disk.Block _parent;
                public byte[] data() { return data; }
                public void setData(byte[] _v) { _dirty = true; data = _v; }
                public Vdi _root() { return _root; }
                public void set_root(Vdi _v) { _dirty = true; _root = _v; }
                public Vdi.Disk.Block _parent() { return _parent; }
                public void set_parent(Vdi.Disk.Block _v) { _dirty = true; _parent = _v; }
            }
            private byte[] metadata;
            private List<Sector> data;
            private Vdi _root;
            private Vdi.Disk _parent;
            private List<byte[]> _raw_data;
            public byte[] metadata() { return metadata; }
            public void setMetadata(byte[] _v) { _dirty = true; metadata = _v; }
            public List<Sector> data() { return data; }
            public void setData(List<Sector> _v) { _dirty = true; data = _v; }
            public Vdi _root() { return _root; }
            public void set_root(Vdi _v) { _dirty = true; _root = _v; }
            public Vdi.Disk _parent() { return _parent; }
            public void set_parent(Vdi.Disk _v) { _dirty = true; _parent = _v; }
            public List<byte[]> _raw_data() { return _raw_data; }
            public void set_raw_Data(List<byte[]> _v) { _dirty = true; _raw_data = _v; }
        }
        private List<Block> blocks;
        private Vdi _root;
        private Vdi _parent;
        public List<Block> blocks() { return blocks; }
        public void setBlocks(List<Block> _v) { _dirty = true; blocks = _v; }
        public Vdi _root() { return _root; }
        public void set_root(Vdi _v) { _dirty = true; _root = _v; }
        public Vdi _parent() { return _parent; }
        public void set_parent(Vdi _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Vdi _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Vdi _parent, Vdi _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.text = new String(this._io.readBytes(64), StandardCharsets.UTF_8);
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(this.signature, new byte[] { 127, 16, -38, -66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 127, 16, -38, -66 }, this.signature, this._io, "/types/header/seq/1");
            }
            this.version = new Version(this._io, this, _root);
            this.version._read();
            if (subheaderSizeIsDynamic()) {
                this.headerSizeOptional = this._io.readU4le();
            }
            this._raw_headerMain = this._io.readBytes(headerSize());
            KaitaiStream _io__raw_headerMain = new ByteBufferKaitaiStream(this._raw_headerMain);
            this.headerMain = new HeaderMain(_io__raw_headerMain, this, _root);
            this.headerMain._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            if (subheaderSizeIsDynamic()) {
            }
            this.headerMain._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.text).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes(this.signature);
            this.version._write_Seq(this._io);
            if (subheaderSizeIsDynamic()) {
                this._io.writeU4le(this.headerSizeOptional);
            }
            final KaitaiStream _io__raw_headerMain = new ByteBufferKaitaiStream(headerSize());
            this._io.addChildStream(_io__raw_headerMain);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (headerSize()));
                final Header _this = this;
                _io__raw_headerMain.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_headerMain = _io__raw_headerMain.toByteArray();
                        if (_this._raw_headerMain.length != headerSize())
                            throw new ConsistencyError("raw(header_main)", headerSize(), _this._raw_headerMain.length);
                        parent.writeBytes(_this._raw_headerMain);
                    }
                });
            }
            this.headerMain._write_Seq(_io__raw_headerMain);
        }

        public void _check() {
            if ((this.text).getBytes(Charset.forName("UTF-8")).length != 64)
                throw new ConsistencyError("text", 64, (this.text).getBytes(Charset.forName("UTF-8")).length);
            if (this.signature.length != 4)
                throw new ConsistencyError("signature", 4, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { 127, 16, -38, -66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 127, 16, -38, -66 }, this.signature, null, "/types/header/seq/1");
            }
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if (subheaderSizeIsDynamic()) {
            }
            if (!Objects.equals(this.headerMain._root(), _root()))
                throw new ConsistencyError("header_main", _root(), this.headerMain._root());
            if (!Objects.equals(this.headerMain._parent(), this))
                throw new ConsistencyError("header_main", this, this.headerMain._parent());
            _dirty = false;
        }
        public static class HeaderMain extends KaitaiStruct.ReadWrite {
            public static HeaderMain fromFile(String fileName) throws IOException {
                return new HeaderMain(new ByteBufferKaitaiStream(fileName));
            }
            public HeaderMain() {
                this(null, null, null);
            }

            public HeaderMain(KaitaiStream _io) {
                this(_io, null, null);
            }

            public HeaderMain(KaitaiStream _io, Vdi.Header _parent) {
                this(_io, _parent, null);
            }

            public HeaderMain(KaitaiStream _io, Vdi.Header _parent, Vdi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.imageType = Vdi.ImageType.byId(this._io.readU4le());
                this.imageFlags = new Flags(this._io, this, _root);
                this.imageFlags._read();
                this.description = new String(this._io.readBytes(256), StandardCharsets.UTF_8);
                if (_parent().version().major() >= 1) {
                    this.blocksMapOffset = this._io.readU4le();
                }
                if (_parent().version().major() >= 1) {
                    this.offsetData = this._io.readU4le();
                }
                this.geometry = new Geometry(this._io, this, _root);
                this.geometry._read();
                if (_parent().version().major() >= 1) {
                    this.reserved1 = this._io.readU4le();
                }
                this.diskSize = this._io.readU8le();
                this.blockDataSize = this._io.readU4le();
                if (_parent().version().major() >= 1) {
                    this.blockMetadataSize = this._io.readU4le();
                }
                this.blocksInImage = this._io.readU4le();
                this.blocksAllocated = this._io.readU4le();
                this.uuidImage = new Uuid(this._io, this, _root);
                this.uuidImage._read();
                this.uuidLastSnap = new Uuid(this._io, this, _root);
                this.uuidLastSnap._read();
                this.uuidLink = new Uuid(this._io, this, _root);
                this.uuidLink._read();
                if (_parent().version().major() >= 1) {
                    this.uuidParent = new Uuid(this._io, this, _root);
                    this.uuidParent._read();
                }
                if ( ((_parent().version().major() >= 1) && (_io().pos() + 16 <= _io().size())) ) {
                    this.lchcGeometry = new Geometry(this._io, this, _root);
                    this.lchcGeometry._read();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.imageFlags._fetchInstances();
                if (_parent().version().major() >= 1) {
                }
                if (_parent().version().major() >= 1) {
                }
                this.geometry._fetchInstances();
                if (_parent().version().major() >= 1) {
                }
                if (_parent().version().major() >= 1) {
                }
                this.uuidImage._fetchInstances();
                this.uuidLastSnap._fetchInstances();
                this.uuidLink._fetchInstances();
                if (_parent().version().major() >= 1) {
                    this.uuidParent._fetchInstances();
                }
                if ( ((_parent().version().major() >= 1) && (_io().pos() + 16 <= _io().size())) ) {
                    this.lchcGeometry._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(((Number) (this.imageType.id())).longValue());
                this.imageFlags._write_Seq(this._io);
                this._io.writeBytes((this.description).getBytes(Charset.forName("UTF-8")));
                if (_parent().version().major() >= 1) {
                    this._io.writeU4le(this.blocksMapOffset);
                }
                if (_parent().version().major() >= 1) {
                    this._io.writeU4le(this.offsetData);
                }
                this.geometry._write_Seq(this._io);
                if (_parent().version().major() >= 1) {
                    this._io.writeU4le(this.reserved1);
                }
                this._io.writeU8le(this.diskSize);
                this._io.writeU4le(this.blockDataSize);
                if (_parent().version().major() >= 1) {
                    this._io.writeU4le(this.blockMetadataSize);
                }
                this._io.writeU4le(this.blocksInImage);
                this._io.writeU4le(this.blocksAllocated);
                this.uuidImage._write_Seq(this._io);
                this.uuidLastSnap._write_Seq(this._io);
                this.uuidLink._write_Seq(this._io);
                if (_parent().version().major() >= 1) {
                    this.uuidParent._write_Seq(this._io);
                }
                if ( ((_parent().version().major() >= 1) && (_io().pos() + 16 <= _io().size())) ) {
                    if (!Objects.equals(this.lchcGeometry._root(), _root()))
                        throw new ConsistencyError("lchc_geometry", _root(), this.lchcGeometry._root());
                    if (!Objects.equals(this.lchcGeometry._parent(), this))
                        throw new ConsistencyError("lchc_geometry", this, this.lchcGeometry._parent());
                    this.lchcGeometry._write_Seq(this._io);
                }
            }

            public void _check() {
                if (!Objects.equals(this.imageFlags._root(), _root()))
                    throw new ConsistencyError("image_flags", _root(), this.imageFlags._root());
                if (!Objects.equals(this.imageFlags._parent(), this))
                    throw new ConsistencyError("image_flags", this, this.imageFlags._parent());
                if ((this.description).getBytes(Charset.forName("UTF-8")).length != 256)
                    throw new ConsistencyError("description", 256, (this.description).getBytes(Charset.forName("UTF-8")).length);
                if (_parent().version().major() >= 1) {
                }
                if (_parent().version().major() >= 1) {
                }
                if (!Objects.equals(this.geometry._root(), _root()))
                    throw new ConsistencyError("geometry", _root(), this.geometry._root());
                if (!Objects.equals(this.geometry._parent(), this))
                    throw new ConsistencyError("geometry", this, this.geometry._parent());
                if (_parent().version().major() >= 1) {
                }
                if (_parent().version().major() >= 1) {
                }
                if (!Objects.equals(this.uuidImage._root(), _root()))
                    throw new ConsistencyError("uuid_image", _root(), this.uuidImage._root());
                if (!Objects.equals(this.uuidImage._parent(), this))
                    throw new ConsistencyError("uuid_image", this, this.uuidImage._parent());
                if (!Objects.equals(this.uuidLastSnap._root(), _root()))
                    throw new ConsistencyError("uuid_last_snap", _root(), this.uuidLastSnap._root());
                if (!Objects.equals(this.uuidLastSnap._parent(), this))
                    throw new ConsistencyError("uuid_last_snap", this, this.uuidLastSnap._parent());
                if (!Objects.equals(this.uuidLink._root(), _root()))
                    throw new ConsistencyError("uuid_link", _root(), this.uuidLink._root());
                if (!Objects.equals(this.uuidLink._parent(), this))
                    throw new ConsistencyError("uuid_link", this, this.uuidLink._parent());
                if (_parent().version().major() >= 1) {
                    if (!Objects.equals(this.uuidParent._root(), _root()))
                        throw new ConsistencyError("uuid_parent", _root(), this.uuidParent._root());
                    if (!Objects.equals(this.uuidParent._parent(), this))
                        throw new ConsistencyError("uuid_parent", this, this.uuidParent._parent());
                }
                _dirty = false;
            }
            public static class Flags extends KaitaiStruct.ReadWrite {
                public static Flags fromFile(String fileName) throws IOException {
                    return new Flags(new ByteBufferKaitaiStream(fileName));
                }
                public Flags() {
                    this(null, null, null);
                }

                public Flags(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Flags(KaitaiStream _io, Vdi.Header.HeaderMain _parent) {
                    this(_io, _parent, null);
                }

                public Flags(KaitaiStream _io, Vdi.Header.HeaderMain _parent, Vdi _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved0 = this._io.readBitsIntBe(15);
                    this.zeroExpand = this._io.readBitsIntBe(1) != 0;
                    this.reserved1 = this._io.readBitsIntBe(6);
                    this.diff = this._io.readBitsIntBe(1) != 0;
                    this.fixed = this._io.readBitsIntBe(1) != 0;
                    this.reserved2 = this._io.readBitsIntBe(8);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBitsIntBe(15, this.reserved0);
                    this._io.writeBitsIntBe(1, (this.zeroExpand ? 1 : 0));
                    this._io.writeBitsIntBe(6, this.reserved1);
                    this._io.writeBitsIntBe(1, (this.diff ? 1 : 0));
                    this._io.writeBitsIntBe(1, (this.fixed ? 1 : 0));
                    this._io.writeBitsIntBe(8, this.reserved2);
                }

                public void _check() {
                    _dirty = false;
                }
                private long reserved0;
                private boolean zeroExpand;
                private long reserved1;
                private boolean diff;
                private boolean fixed;
                private long reserved2;
                private Vdi _root;
                private Vdi.Header.HeaderMain _parent;
                public long reserved0() { return reserved0; }
                public void setReserved0(long _v) { _dirty = true; reserved0 = _v; }
                public boolean zeroExpand() { return zeroExpand; }
                public void setZeroExpand(boolean _v) { _dirty = true; zeroExpand = _v; }
                public long reserved1() { return reserved1; }
                public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
                public boolean diff() { return diff; }
                public void setDiff(boolean _v) { _dirty = true; diff = _v; }
                public boolean fixed() { return fixed; }
                public void setFixed(boolean _v) { _dirty = true; fixed = _v; }
                public long reserved2() { return reserved2; }
                public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
                public Vdi _root() { return _root; }
                public void set_root(Vdi _v) { _dirty = true; _root = _v; }
                public Vdi.Header.HeaderMain _parent() { return _parent; }
                public void set_parent(Vdi.Header.HeaderMain _v) { _dirty = true; _parent = _v; }
            }
            public static class Geometry extends KaitaiStruct.ReadWrite {
                public static Geometry fromFile(String fileName) throws IOException {
                    return new Geometry(new ByteBufferKaitaiStream(fileName));
                }
                public Geometry() {
                    this(null, null, null);
                }

                public Geometry(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Geometry(KaitaiStream _io, Vdi.Header.HeaderMain _parent) {
                    this(_io, _parent, null);
                }

                public Geometry(KaitaiStream _io, Vdi.Header.HeaderMain _parent, Vdi _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.cylinders = this._io.readU4le();
                    this.heads = this._io.readU4le();
                    this.sectors = this._io.readU4le();
                    this.sectorSize = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.cylinders);
                    this._io.writeU4le(this.heads);
                    this._io.writeU4le(this.sectors);
                    this._io.writeU4le(this.sectorSize);
                }

                public void _check() {
                    _dirty = false;
                }
                private long cylinders;
                private long heads;
                private long sectors;
                private long sectorSize;
                private Vdi _root;
                private Vdi.Header.HeaderMain _parent;
                public long cylinders() { return cylinders; }
                public void setCylinders(long _v) { _dirty = true; cylinders = _v; }
                public long heads() { return heads; }
                public void setHeads(long _v) { _dirty = true; heads = _v; }
                public long sectors() { return sectors; }
                public void setSectors(long _v) { _dirty = true; sectors = _v; }
                public long sectorSize() { return sectorSize; }
                public void setSectorSize(long _v) { _dirty = true; sectorSize = _v; }
                public Vdi _root() { return _root; }
                public void set_root(Vdi _v) { _dirty = true; _root = _v; }
                public Vdi.Header.HeaderMain _parent() { return _parent; }
                public void set_parent(Vdi.Header.HeaderMain _v) { _dirty = true; _parent = _v; }
            }
            private ImageType imageType;
            private Flags imageFlags;
            private String description;
            private Long blocksMapOffset;
            private Long offsetData;
            private Geometry geometry;
            private Long reserved1;
            private long diskSize;
            private long blockDataSize;
            private Long blockMetadataSize;
            private long blocksInImage;
            private long blocksAllocated;
            private Uuid uuidImage;
            private Uuid uuidLastSnap;
            private Uuid uuidLink;
            private Uuid uuidParent;
            private Geometry lchcGeometry;
            private Vdi _root;
            private Vdi.Header _parent;
            public ImageType imageType() { return imageType; }
            public void setImageType(ImageType _v) { _dirty = true; imageType = _v; }
            public Flags imageFlags() { return imageFlags; }
            public void setImageFlags(Flags _v) { _dirty = true; imageFlags = _v; }
            public String description() { return description; }
            public void setDescription(String _v) { _dirty = true; description = _v; }
            public Long blocksMapOffset() { return blocksMapOffset; }
            public void setBlocksMapOffset(Long _v) { _dirty = true; blocksMapOffset = _v; }
            public Long offsetData() { return offsetData; }
            public void setOffsetData(Long _v) { _dirty = true; offsetData = _v; }
            public Geometry geometry() { return geometry; }
            public void setGeometry(Geometry _v) { _dirty = true; geometry = _v; }
            public Long reserved1() { return reserved1; }
            public void setReserved1(Long _v) { _dirty = true; reserved1 = _v; }
            public long diskSize() { return diskSize; }
            public void setDiskSize(long _v) { _dirty = true; diskSize = _v; }

            /**
             * Size of block (bytes).
             */
            public long blockDataSize() { return blockDataSize; }
            public void setBlockDataSize(long _v) { _dirty = true; blockDataSize = _v; }
            public Long blockMetadataSize() { return blockMetadataSize; }
            public void setBlockMetadataSize(Long _v) { _dirty = true; blockMetadataSize = _v; }
            public long blocksInImage() { return blocksInImage; }
            public void setBlocksInImage(long _v) { _dirty = true; blocksInImage = _v; }
            public long blocksAllocated() { return blocksAllocated; }
            public void setBlocksAllocated(long _v) { _dirty = true; blocksAllocated = _v; }
            public Uuid uuidImage() { return uuidImage; }
            public void setUuidImage(Uuid _v) { _dirty = true; uuidImage = _v; }
            public Uuid uuidLastSnap() { return uuidLastSnap; }
            public void setUuidLastSnap(Uuid _v) { _dirty = true; uuidLastSnap = _v; }
            public Uuid uuidLink() { return uuidLink; }
            public void setUuidLink(Uuid _v) { _dirty = true; uuidLink = _v; }
            public Uuid uuidParent() { return uuidParent; }
            public void setUuidParent(Uuid _v) { _dirty = true; uuidParent = _v; }
            public Geometry lchcGeometry() { return lchcGeometry; }
            public void setLchcGeometry(Geometry _v) { _dirty = true; lchcGeometry = _v; }
            public Vdi _root() { return _root; }
            public void set_root(Vdi _v) { _dirty = true; _root = _v; }
            public Vdi.Header _parent() { return _parent; }
            public void set_parent(Vdi.Header _v) { _dirty = true; _parent = _v; }
        }
        public static class Uuid extends KaitaiStruct.ReadWrite {
            public static Uuid fromFile(String fileName) throws IOException {
                return new Uuid(new ByteBufferKaitaiStream(fileName));
            }
            public Uuid() {
                this(null, null, null);
            }

            public Uuid(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Uuid(KaitaiStream _io, Vdi.Header.HeaderMain _parent) {
                this(_io, _parent, null);
            }

            public Uuid(KaitaiStream _io, Vdi.Header.HeaderMain _parent, Vdi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.uuid = this._io.readBytes(16);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.uuid);
            }

            public void _check() {
                if (this.uuid.length != 16)
                    throw new ConsistencyError("uuid", 16, this.uuid.length);
                _dirty = false;
            }
            private byte[] uuid;
            private Vdi _root;
            private Vdi.Header.HeaderMain _parent;
            public byte[] uuid() { return uuid; }
            public void setUuid(byte[] _v) { _dirty = true; uuid = _v; }
            public Vdi _root() { return _root; }
            public void set_root(Vdi _v) { _dirty = true; _root = _v; }
            public Vdi.Header.HeaderMain _parent() { return _parent; }
            public void set_parent(Vdi.Header.HeaderMain _v) { _dirty = true; _parent = _v; }
        }
        public static class Version extends KaitaiStruct.ReadWrite {
            public static Version fromFile(String fileName) throws IOException {
                return new Version(new ByteBufferKaitaiStream(fileName));
            }
            public Version() {
                this(null, null, null);
            }

            public Version(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Version(KaitaiStream _io, Vdi.Header _parent) {
                this(_io, _parent, null);
            }

            public Version(KaitaiStream _io, Vdi.Header _parent, Vdi _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.major = this._io.readU2le();
                this.minor = this._io.readU2le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.major);
                this._io.writeU2le(this.minor);
            }

            public void _check() {
                _dirty = false;
            }
            private int major;
            private int minor;
            private Vdi _root;
            private Vdi.Header _parent;
            public int major() { return major; }
            public void setMajor(int _v) { _dirty = true; major = _v; }
            public int minor() { return minor; }
            public void setMinor(int _v) { _dirty = true; minor = _v; }
            public Vdi _root() { return _root; }
            public void set_root(Vdi _v) { _dirty = true; _root = _v; }
            public Vdi.Header _parent() { return _parent; }
            public void set_parent(Vdi.Header _v) { _dirty = true; _parent = _v; }
        }
        private Integer blockSize;
        public Integer blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            this.blockSize = ((Number) (headerMain().blockMetadataSize() + headerMain().blockDataSize())).intValue();
            return this.blockSize;
        }
        public void _invalidateBlockSize() { this.blockSize = null; }
        private Long blocksMapOffset;
        public Long blocksMapOffset() {
            if (this.blocksMapOffset != null)
                return this.blocksMapOffset;
            this.blocksMapOffset = ((Number) (headerMain().blocksMapOffset())).longValue();
            return this.blocksMapOffset;
        }
        public void _invalidateBlocksMapOffset() { this.blocksMapOffset = null; }
        private Integer blocksMapSize;
        public Integer blocksMapSize() {
            if (this.blocksMapSize != null)
                return this.blocksMapSize;
            this.blocksMapSize = ((Number) ((((headerMain().blocksInImage() * 4 + headerMain().geometry().sectorSize()) - 1) / headerMain().geometry().sectorSize()) * headerMain().geometry().sectorSize())).intValue();
            return this.blocksMapSize;
        }
        public void _invalidateBlocksMapSize() { this.blocksMapSize = null; }
        private Long blocksOffset;
        public Long blocksOffset() {
            if (this.blocksOffset != null)
                return this.blocksOffset;
            this.blocksOffset = ((Number) (headerMain().offsetData())).longValue();
            return this.blocksOffset;
        }
        public void _invalidateBlocksOffset() { this.blocksOffset = null; }
        private Integer headerSize;
        public Integer headerSize() {
            if (this.headerSize != null)
                return this.headerSize;
            this.headerSize = ((Number) ((subheaderSizeIsDynamic() ? headerSizeOptional() : 336))).intValue();
            return this.headerSize;
        }
        public void _invalidateHeaderSize() { this.headerSize = null; }
        private Boolean subheaderSizeIsDynamic;
        public Boolean subheaderSizeIsDynamic() {
            if (this.subheaderSizeIsDynamic != null)
                return this.subheaderSizeIsDynamic;
            this.subheaderSizeIsDynamic = version().major() >= 1;
            return this.subheaderSizeIsDynamic;
        }
        public void _invalidateSubheaderSizeIsDynamic() { this.subheaderSizeIsDynamic = null; }
        private String text;
        private byte[] signature;
        private Version version;
        private Long headerSizeOptional;
        private HeaderMain headerMain;
        private Vdi _root;
        private Vdi _parent;
        private byte[] _raw_headerMain;
        public String text() { return text; }
        public void setText(String _v) { _dirty = true; text = _v; }
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public Version version() { return version; }
        public void setVersion(Version _v) { _dirty = true; version = _v; }
        public Long headerSizeOptional() { return headerSizeOptional; }
        public void setHeaderSizeOptional(Long _v) { _dirty = true; headerSizeOptional = _v; }
        public HeaderMain headerMain() { return headerMain; }
        public void setHeaderMain(HeaderMain _v) { _dirty = true; headerMain = _v; }
        public Vdi _root() { return _root; }
        public void set_root(Vdi _v) { _dirty = true; _root = _v; }
        public Vdi _parent() { return _parent; }
        public void set_parent(Vdi _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_headerMain() { return _raw_headerMain; }
        public void set_raw_HeaderMain(byte[] _v) { _dirty = true; _raw_headerMain = _v; }
    }
    private Integer blockDiscarded;
    public Integer blockDiscarded() {
        if (this.blockDiscarded != null)
            return this.blockDiscarded;
        this.blockDiscarded = ((int) 4294967294L);
        return this.blockDiscarded;
    }
    public void _invalidateBlockDiscarded() { this.blockDiscarded = null; }
    private Integer blockUnallocated;
    public Integer blockUnallocated() {
        if (this.blockUnallocated != null)
            return this.blockUnallocated;
        this.blockUnallocated = ((int) 4294967295L);
        return this.blockUnallocated;
    }
    public void _invalidateBlockUnallocated() { this.blockUnallocated = null; }
    private BlocksMap blocksMap;
    private boolean _shouldWriteBlocksMap = false;
    private boolean _enabledBlocksMap = true;

    /**
     * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
     * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
     */
    public BlocksMap blocksMap() {
        if (_shouldWriteBlocksMap)
            _writeBlocksMap();
        if (this.blocksMap != null)
            return this.blocksMap;
        if (!_enabledBlocksMap)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().blocksMapOffset());
        this._raw_blocksMap = this._io.readBytes(header().blocksMapSize());
        KaitaiStream _io__raw_blocksMap = new ByteBufferKaitaiStream(this._raw_blocksMap);
        this.blocksMap = new BlocksMap(_io__raw_blocksMap, this, _root);
        this.blocksMap._read();
        this._io.seek(_pos);
        return this.blocksMap;
    }
    public void setBlocksMap(BlocksMap _v) { _dirty = true; blocksMap = _v; }
    public void setBlocksMap_Enabled(boolean _v) { _dirty = true; _enabledBlocksMap = _v; }

    private void _writeBlocksMap() {
        _shouldWriteBlocksMap = false;
        long _pos = this._io.pos();
        this._io.seek(header().blocksMapOffset());
        final KaitaiStream _io__raw_blocksMap = new ByteBufferKaitaiStream(header().blocksMapSize());
        this._io.addChildStream(_io__raw_blocksMap);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (header().blocksMapSize()));
            final Vdi _this = this;
            _io__raw_blocksMap.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_blocksMap = _io__raw_blocksMap.toByteArray();
                    if (_this._raw_blocksMap.length != header().blocksMapSize())
                        throw new ConsistencyError("raw(blocks_map)", header().blocksMapSize(), _this._raw_blocksMap.length);
                    parent.writeBytes(_this._raw_blocksMap);
                }
            });
        }
        this.blocksMap._write_Seq(_io__raw_blocksMap);
        this._io.seek(_pos);
    }
    private Disk disk;
    private boolean _shouldWriteDisk = false;
    private boolean _enabledDisk = true;
    public Disk disk() {
        if (_shouldWriteDisk)
            _writeDisk();
        if (this.disk != null)
            return this.disk;
        if (!_enabledDisk)
            return null;
        long _pos = this._io.pos();
        this._io.seek(header().blocksOffset());
        this.disk = new Disk(this._io, this, _root);
        this.disk._read();
        this._io.seek(_pos);
        return this.disk;
    }
    public void setDisk(Disk _v) { _dirty = true; disk = _v; }
    public void setDisk_Enabled(boolean _v) { _dirty = true; _enabledDisk = _v; }

    private void _writeDisk() {
        _shouldWriteDisk = false;
        long _pos = this._io.pos();
        this._io.seek(header().blocksOffset());
        this.disk._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Header header;
    private Vdi _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_blocksMap;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public Vdi _root() { return _root; }
    public void set_root(Vdi _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_blocksMap() { return _raw_blocksMap; }
    public void set_raw_BlocksMap(byte[] _v) { _dirty = true; _raw_blocksMap = _v; }
}
