// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;


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
public class Vdi extends KaitaiStruct {
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

    public Vdi(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vdi(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Vdi(KaitaiStream _io, KaitaiStruct _parent, Vdi _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
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
    public static class BlocksMap extends KaitaiStruct {
        public static BlocksMap fromFile(String fileName) throws IOException {
            return new BlocksMap(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.index = new ArrayList<BlockIndex>();
            for (int i = 0; i < _root().header().headerMain().blocksInImage(); i++) {
                this.index.add(new BlockIndex(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.index.size(); i++) {
                this.index.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        public static class BlockIndex extends KaitaiStruct {
            public static BlockIndex fromFile(String fileName) throws IOException {
                return new BlockIndex(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.index = this._io.readU4le();
            }

            public void _fetchInstances() {
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
            private Boolean isAllocated;
            public Boolean isAllocated() {
                if (this.isAllocated != null)
                    return this.isAllocated;
                this.isAllocated = index() < _root().blockDiscarded();
                return this.isAllocated;
            }
            private long index;
            private Vdi _root;
            private Vdi.BlocksMap _parent;
            public long index() { return index; }
            public Vdi _root() { return _root; }
            public Vdi.BlocksMap _parent() { return _parent; }
        }
        private List<BlockIndex> index;
        private Vdi _root;
        private Vdi _parent;
        public List<BlockIndex> index() { return index; }
        public Vdi _root() { return _root; }
        public Vdi _parent() { return _parent; }
    }
    public static class Disk extends KaitaiStruct {
        public static Disk fromFile(String fileName) throws IOException {
            return new Disk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.blocks = new ArrayList<Block>();
            for (int i = 0; i < _root().header().headerMain().blocksInImage(); i++) {
                this.blocks.add(new Block(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.blocks.size(); i++) {
                this.blocks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        public static class Block extends KaitaiStruct {
            public static Block fromFile(String fileName) throws IOException {
                return new Block(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.metadata = this._io.readBytes(_root().header().headerMain().blockMetadataSize());
                this.data = new ArrayList<Sector>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        KaitaiStream _io_data = this._io.substream(_root().header().headerMain().blockDataSize());
                        this.data.add(new Sector(_io_data, this, _root));
                        i++;
                    }
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.data.size(); i++) {
                    this.data.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            public static class Sector extends KaitaiStruct {
                public static Sector fromFile(String fileName) throws IOException {
                    return new Sector(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.data = this._io.readBytes(_root().header().headerMain().geometry().sectorSize());
                }

                public void _fetchInstances() {
                }
                private byte[] data;
                private Vdi _root;
                private Vdi.Disk.Block _parent;
                public byte[] data() { return data; }
                public Vdi _root() { return _root; }
                public Vdi.Disk.Block _parent() { return _parent; }
            }
            private byte[] metadata;
            private List<Sector> data;
            private Vdi _root;
            private Vdi.Disk _parent;
            public byte[] metadata() { return metadata; }
            public List<Sector> data() { return data; }
            public Vdi _root() { return _root; }
            public Vdi.Disk _parent() { return _parent; }
        }
        private List<Block> blocks;
        private Vdi _root;
        private Vdi _parent;
        public List<Block> blocks() { return blocks; }
        public Vdi _root() { return _root; }
        public Vdi _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.text = new String(this._io.readBytes(64), StandardCharsets.UTF_8);
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(this.signature, new byte[] { 127, 16, -38, -66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 127, 16, -38, -66 }, this.signature, this._io, "/types/header/seq/1");
            }
            this.version = new Version(this._io, this, _root);
            if (subheaderSizeIsDynamic()) {
                this.headerSizeOptional = this._io.readU4le();
            }
            KaitaiStream _io_headerMain = this._io.substream(headerSize());
            this.headerMain = new HeaderMain(_io_headerMain, this, _root);
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            if (subheaderSizeIsDynamic()) {
            }
            this.headerMain._fetchInstances();
        }
        public static class HeaderMain extends KaitaiStruct {
            public static HeaderMain fromFile(String fileName) throws IOException {
                return new HeaderMain(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.imageType = Vdi.ImageType.byId(this._io.readU4le());
                this.imageFlags = new Flags(this._io, this, _root);
                this.description = new String(this._io.readBytes(256), StandardCharsets.UTF_8);
                if (_parent().version().major() >= 1) {
                    this.blocksMapOffset = this._io.readU4le();
                }
                if (_parent().version().major() >= 1) {
                    this.offsetData = this._io.readU4le();
                }
                this.geometry = new Geometry(this._io, this, _root);
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
                this.uuidLastSnap = new Uuid(this._io, this, _root);
                this.uuidLink = new Uuid(this._io, this, _root);
                if (_parent().version().major() >= 1) {
                    this.uuidParent = new Uuid(this._io, this, _root);
                }
                if ( ((_parent().version().major() >= 1) && (_io().pos() + 16 <= _io().size())) ) {
                    this.lchcGeometry = new Geometry(this._io, this, _root);
                }
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
            public static class Flags extends KaitaiStruct {
                public static Flags fromFile(String fileName) throws IOException {
                    return new Flags(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.reserved0 = this._io.readBitsIntBe(15);
                    this.zeroExpand = this._io.readBitsIntBe(1) != 0;
                    this.reserved1 = this._io.readBitsIntBe(6);
                    this.diff = this._io.readBitsIntBe(1) != 0;
                    this.fixed = this._io.readBitsIntBe(1) != 0;
                    this.reserved2 = this._io.readBitsIntBe(8);
                }

                public void _fetchInstances() {
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
                public boolean zeroExpand() { return zeroExpand; }
                public long reserved1() { return reserved1; }
                public boolean diff() { return diff; }
                public boolean fixed() { return fixed; }
                public long reserved2() { return reserved2; }
                public Vdi _root() { return _root; }
                public Vdi.Header.HeaderMain _parent() { return _parent; }
            }
            public static class Geometry extends KaitaiStruct {
                public static Geometry fromFile(String fileName) throws IOException {
                    return new Geometry(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.cylinders = this._io.readU4le();
                    this.heads = this._io.readU4le();
                    this.sectors = this._io.readU4le();
                    this.sectorSize = this._io.readU4le();
                }

                public void _fetchInstances() {
                }
                private long cylinders;
                private long heads;
                private long sectors;
                private long sectorSize;
                private Vdi _root;
                private Vdi.Header.HeaderMain _parent;
                public long cylinders() { return cylinders; }
                public long heads() { return heads; }
                public long sectors() { return sectors; }
                public long sectorSize() { return sectorSize; }
                public Vdi _root() { return _root; }
                public Vdi.Header.HeaderMain _parent() { return _parent; }
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
            public Flags imageFlags() { return imageFlags; }
            public String description() { return description; }
            public Long blocksMapOffset() { return blocksMapOffset; }
            public Long offsetData() { return offsetData; }
            public Geometry geometry() { return geometry; }
            public Long reserved1() { return reserved1; }
            public long diskSize() { return diskSize; }

            /**
             * Size of block (bytes).
             */
            public long blockDataSize() { return blockDataSize; }
            public Long blockMetadataSize() { return blockMetadataSize; }
            public long blocksInImage() { return blocksInImage; }
            public long blocksAllocated() { return blocksAllocated; }
            public Uuid uuidImage() { return uuidImage; }
            public Uuid uuidLastSnap() { return uuidLastSnap; }
            public Uuid uuidLink() { return uuidLink; }
            public Uuid uuidParent() { return uuidParent; }
            public Geometry lchcGeometry() { return lchcGeometry; }
            public Vdi _root() { return _root; }
            public Vdi.Header _parent() { return _parent; }
        }
        public static class Uuid extends KaitaiStruct {
            public static Uuid fromFile(String fileName) throws IOException {
                return new Uuid(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.uuid = this._io.readBytes(16);
            }

            public void _fetchInstances() {
            }
            private byte[] uuid;
            private Vdi _root;
            private Vdi.Header.HeaderMain _parent;
            public byte[] uuid() { return uuid; }
            public Vdi _root() { return _root; }
            public Vdi.Header.HeaderMain _parent() { return _parent; }
        }
        public static class Version extends KaitaiStruct {
            public static Version fromFile(String fileName) throws IOException {
                return new Version(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.major = this._io.readU2le();
                this.minor = this._io.readU2le();
            }

            public void _fetchInstances() {
            }
            private int major;
            private int minor;
            private Vdi _root;
            private Vdi.Header _parent;
            public int major() { return major; }
            public int minor() { return minor; }
            public Vdi _root() { return _root; }
            public Vdi.Header _parent() { return _parent; }
        }
        private Integer blockSize;
        public Integer blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            this.blockSize = ((Number) (headerMain().blockMetadataSize() + headerMain().blockDataSize())).intValue();
            return this.blockSize;
        }
        private Long blocksMapOffset;
        public Long blocksMapOffset() {
            if (this.blocksMapOffset != null)
                return this.blocksMapOffset;
            this.blocksMapOffset = ((Number) (headerMain().blocksMapOffset())).longValue();
            return this.blocksMapOffset;
        }
        private Integer blocksMapSize;
        public Integer blocksMapSize() {
            if (this.blocksMapSize != null)
                return this.blocksMapSize;
            this.blocksMapSize = ((Number) ((((headerMain().blocksInImage() * 4 + headerMain().geometry().sectorSize()) - 1) / headerMain().geometry().sectorSize()) * headerMain().geometry().sectorSize())).intValue();
            return this.blocksMapSize;
        }
        private Long blocksOffset;
        public Long blocksOffset() {
            if (this.blocksOffset != null)
                return this.blocksOffset;
            this.blocksOffset = ((Number) (headerMain().offsetData())).longValue();
            return this.blocksOffset;
        }
        private Integer headerSize;
        public Integer headerSize() {
            if (this.headerSize != null)
                return this.headerSize;
            this.headerSize = ((Number) ((subheaderSizeIsDynamic() ? headerSizeOptional() : 336))).intValue();
            return this.headerSize;
        }
        private Boolean subheaderSizeIsDynamic;
        public Boolean subheaderSizeIsDynamic() {
            if (this.subheaderSizeIsDynamic != null)
                return this.subheaderSizeIsDynamic;
            this.subheaderSizeIsDynamic = version().major() >= 1;
            return this.subheaderSizeIsDynamic;
        }
        private String text;
        private byte[] signature;
        private Version version;
        private Long headerSizeOptional;
        private HeaderMain headerMain;
        private Vdi _root;
        private Vdi _parent;
        public String text() { return text; }
        public byte[] signature() { return signature; }
        public Version version() { return version; }
        public Long headerSizeOptional() { return headerSizeOptional; }
        public HeaderMain headerMain() { return headerMain; }
        public Vdi _root() { return _root; }
        public Vdi _parent() { return _parent; }
    }
    private Integer blockDiscarded;
    public Integer blockDiscarded() {
        if (this.blockDiscarded != null)
            return this.blockDiscarded;
        this.blockDiscarded = ((int) 4294967294L);
        return this.blockDiscarded;
    }
    private Integer blockUnallocated;
    public Integer blockUnallocated() {
        if (this.blockUnallocated != null)
            return this.blockUnallocated;
        this.blockUnallocated = ((int) 4294967295L);
        return this.blockUnallocated;
    }
    private BlocksMap blocksMap;

    /**
     * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
     * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
     */
    public BlocksMap blocksMap() {
        if (this.blocksMap != null)
            return this.blocksMap;
        long _pos = this._io.pos();
        this._io.seek(header().blocksMapOffset());
        KaitaiStream _io_blocksMap = this._io.substream(header().blocksMapSize());
        this.blocksMap = new BlocksMap(_io_blocksMap, this, _root);
        this._io.seek(_pos);
        return this.blocksMap;
    }
    private Disk disk;
    public Disk disk() {
        if (this.disk != null)
            return this.disk;
        long _pos = this._io.pos();
        this._io.seek(header().blocksOffset());
        this.disk = new Disk(this._io, this, _root);
        this._io.seek(_pos);
        return this.disk;
    }
    private Header header;
    private Vdi _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public Vdi _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
