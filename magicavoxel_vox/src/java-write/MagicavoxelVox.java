// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://ephtracy.github.io/">MagicaVoxel Homepage</a>
 * @see <a href="https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt">Format Description</a>
 */
public class MagicavoxelVox extends KaitaiStruct.ReadWrite {
    public static MagicavoxelVox fromFile(String fileName) throws IOException {
        return new MagicavoxelVox(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChunkType {
        MAIN(1296124238),
        MATT(1296127060),
        PACK(1346454347),
        RGBA(1380401729),
        SIZE(1397316165),
        XYZI(1482250825);

        private final long id;
        ChunkType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChunkType> byId = new HashMap<Long, ChunkType>(6);
        static {
            for (ChunkType e : ChunkType.values())
                byId.put(e.id(), e);
        }
        public static ChunkType byId(long id) { return byId.get(id); }
    }

    public enum MaterialType {
        DIFFUSE(0),
        METAL(1),
        GLASS(2),
        EMISSIVE(3);

        private final long id;
        MaterialType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, MaterialType> byId = new HashMap<Long, MaterialType>(4);
        static {
            for (MaterialType e : MaterialType.values())
                byId.put(e.id(), e);
        }
        public static MaterialType byId(long id) { return byId.get(id); }
    }

    public enum PropertyBitsType {
        PLASTIC(1),
        ROUGHNESS(2),
        SPECULAR(4),
        IOR(8),
        ATTENUATION(16),
        POWER(32),
        GLOW(64),
        IS_TOTAL_POWER(128);

        private final long id;
        PropertyBitsType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PropertyBitsType> byId = new HashMap<Long, PropertyBitsType>(8);
        static {
            for (PropertyBitsType e : PropertyBitsType.values())
                byId.put(e.id(), e);
        }
        public static PropertyBitsType byId(long id) { return byId.get(id); }
    }
    public MagicavoxelVox() {
        this(null, null, null);
    }

    public MagicavoxelVox(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MagicavoxelVox(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MagicavoxelVox(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MagicavoxelVox _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 86, 79, 88, 32 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 79, 88, 32 }, this.magic, this._io, "/seq/0");
        }
        this.version = this._io.readU4le();
        this.main = new Chunk(this._io, this, _root);
        this.main._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.main._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.version);
        this.main._write_Seq(this._io);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 86, 79, 88, 32 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 79, 88, 32 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.main._root(), _root()))
            throw new ConsistencyError("main", _root(), this.main._root());
        if (!Objects.equals(this.main._parent(), this))
            throw new ConsistencyError("main", this, this.main._parent());
        _dirty = false;
    }
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }
        public Chunk() {
            this(null, null, null);
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chunkId = MagicavoxelVox.ChunkType.byId(this._io.readU4be());
            this.numBytesOfChunkContent = this._io.readU4le();
            this.numBytesOfChildrenChunks = this._io.readU4le();
            if (numBytesOfChunkContent() != 0) {
                {
                    ChunkType on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case MATT: {
                            this._raw_chunkContent = this._io.readBytes(numBytesOfChunkContent());
                            KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(this._raw_chunkContent);
                            this.chunkContent = new Matt(_io__raw_chunkContent, this, _root);
                            ((Matt) (this.chunkContent))._read();
                            break;
                        }
                        case PACK: {
                            this._raw_chunkContent = this._io.readBytes(numBytesOfChunkContent());
                            KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(this._raw_chunkContent);
                            this.chunkContent = new Pack(_io__raw_chunkContent, this, _root);
                            ((Pack) (this.chunkContent))._read();
                            break;
                        }
                        case RGBA: {
                            this._raw_chunkContent = this._io.readBytes(numBytesOfChunkContent());
                            KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(this._raw_chunkContent);
                            this.chunkContent = new Rgba(_io__raw_chunkContent, this, _root);
                            ((Rgba) (this.chunkContent))._read();
                            break;
                        }
                        case SIZE: {
                            this._raw_chunkContent = this._io.readBytes(numBytesOfChunkContent());
                            KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(this._raw_chunkContent);
                            this.chunkContent = new Size(_io__raw_chunkContent, this, _root);
                            ((Size) (this.chunkContent))._read();
                            break;
                        }
                        case XYZI: {
                            this._raw_chunkContent = this._io.readBytes(numBytesOfChunkContent());
                            KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(this._raw_chunkContent);
                            this.chunkContent = new Xyzi(_io__raw_chunkContent, this, _root);
                            ((Xyzi) (this.chunkContent))._read();
                            break;
                        }
                        default: {
                            this.chunkContent = this._io.readBytes(numBytesOfChunkContent());
                            break;
                        }
                        }
                    } else {
                        this.chunkContent = this._io.readBytes(numBytesOfChunkContent());
                    }
                }
            }
            if (numBytesOfChildrenChunks() != 0) {
                this.childrenChunks = new ArrayList<Chunk>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        Chunk _t_childrenChunks = new Chunk(this._io, this, _root);
                        try {
                            _t_childrenChunks._read();
                        } finally {
                            this.childrenChunks.add(_t_childrenChunks);
                        }
                        i++;
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (numBytesOfChunkContent() != 0) {
                {
                    ChunkType on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case MATT: {
                            ((Matt) (this.chunkContent))._fetchInstances();
                            break;
                        }
                        case PACK: {
                            ((Pack) (this.chunkContent))._fetchInstances();
                            break;
                        }
                        case RGBA: {
                            ((Rgba) (this.chunkContent))._fetchInstances();
                            break;
                        }
                        case SIZE: {
                            ((Size) (this.chunkContent))._fetchInstances();
                            break;
                        }
                        case XYZI: {
                            ((Xyzi) (this.chunkContent))._fetchInstances();
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
            if (numBytesOfChildrenChunks() != 0) {
                for (int i = 0; i < this.childrenChunks.size(); i++) {
                    this.childrenChunks.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(((Number) (this.chunkId.id())).longValue());
            this._io.writeU4le(this.numBytesOfChunkContent);
            this._io.writeU4le(this.numBytesOfChildrenChunks);
            if (numBytesOfChunkContent() != 0) {
                {
                    ChunkType on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case MATT: {
                            final KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(numBytesOfChunkContent());
                            this._io.addChildStream(_io__raw_chunkContent);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (numBytesOfChunkContent()));
                                final Chunk _this = this;
                                _io__raw_chunkContent.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_chunkContent = _io__raw_chunkContent.toByteArray();
                                        if (((byte[]) (_this._raw_chunkContent)).length != numBytesOfChunkContent())
                                            throw new ConsistencyError("raw(chunk_content)", numBytesOfChunkContent(), ((byte[]) (_this._raw_chunkContent)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_chunkContent)))));
                                    }
                                });
                            }
                            ((Matt) (this.chunkContent))._write_Seq(_io__raw_chunkContent);
                            break;
                        }
                        case PACK: {
                            final KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(numBytesOfChunkContent());
                            this._io.addChildStream(_io__raw_chunkContent);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (numBytesOfChunkContent()));
                                final Chunk _this = this;
                                _io__raw_chunkContent.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_chunkContent = _io__raw_chunkContent.toByteArray();
                                        if (((byte[]) (_this._raw_chunkContent)).length != numBytesOfChunkContent())
                                            throw new ConsistencyError("raw(chunk_content)", numBytesOfChunkContent(), ((byte[]) (_this._raw_chunkContent)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_chunkContent)))));
                                    }
                                });
                            }
                            ((Pack) (this.chunkContent))._write_Seq(_io__raw_chunkContent);
                            break;
                        }
                        case RGBA: {
                            final KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(numBytesOfChunkContent());
                            this._io.addChildStream(_io__raw_chunkContent);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (numBytesOfChunkContent()));
                                final Chunk _this = this;
                                _io__raw_chunkContent.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_chunkContent = _io__raw_chunkContent.toByteArray();
                                        if (((byte[]) (_this._raw_chunkContent)).length != numBytesOfChunkContent())
                                            throw new ConsistencyError("raw(chunk_content)", numBytesOfChunkContent(), ((byte[]) (_this._raw_chunkContent)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_chunkContent)))));
                                    }
                                });
                            }
                            ((Rgba) (this.chunkContent))._write_Seq(_io__raw_chunkContent);
                            break;
                        }
                        case SIZE: {
                            final KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(numBytesOfChunkContent());
                            this._io.addChildStream(_io__raw_chunkContent);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (numBytesOfChunkContent()));
                                final Chunk _this = this;
                                _io__raw_chunkContent.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_chunkContent = _io__raw_chunkContent.toByteArray();
                                        if (((byte[]) (_this._raw_chunkContent)).length != numBytesOfChunkContent())
                                            throw new ConsistencyError("raw(chunk_content)", numBytesOfChunkContent(), ((byte[]) (_this._raw_chunkContent)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_chunkContent)))));
                                    }
                                });
                            }
                            ((Size) (this.chunkContent))._write_Seq(_io__raw_chunkContent);
                            break;
                        }
                        case XYZI: {
                            final KaitaiStream _io__raw_chunkContent = new ByteBufferKaitaiStream(numBytesOfChunkContent());
                            this._io.addChildStream(_io__raw_chunkContent);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (numBytesOfChunkContent()));
                                final Chunk _this = this;
                                _io__raw_chunkContent.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_chunkContent = _io__raw_chunkContent.toByteArray();
                                        if (((byte[]) (_this._raw_chunkContent)).length != numBytesOfChunkContent())
                                            throw new ConsistencyError("raw(chunk_content)", numBytesOfChunkContent(), ((byte[]) (_this._raw_chunkContent)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_chunkContent)))));
                                    }
                                });
                            }
                            ((Xyzi) (this.chunkContent))._write_Seq(_io__raw_chunkContent);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.chunkContent)))));
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.chunkContent)))));
                    }
                }
            }
            if (numBytesOfChildrenChunks() != 0) {
                for (int i = 0; i < this.childrenChunks.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("children_chunks", 0, this._io.size() - this._io.pos());
                    this.childrenChunks.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("children_chunks", 0, this._io.size() - this._io.pos());
            }
        }

        public void _check() {
            if (numBytesOfChunkContent() != 0) {
                {
                    ChunkType on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case MATT: {
                            if (!Objects.equals(((MagicavoxelVox.Matt) (this.chunkContent))._root(), _root()))
                                throw new ConsistencyError("chunk_content", _root(), ((MagicavoxelVox.Matt) (this.chunkContent))._root());
                            if (!Objects.equals(((MagicavoxelVox.Matt) (this.chunkContent))._parent(), this))
                                throw new ConsistencyError("chunk_content", this, ((MagicavoxelVox.Matt) (this.chunkContent))._parent());
                            break;
                        }
                        case PACK: {
                            if (!Objects.equals(((MagicavoxelVox.Pack) (this.chunkContent))._root(), _root()))
                                throw new ConsistencyError("chunk_content", _root(), ((MagicavoxelVox.Pack) (this.chunkContent))._root());
                            if (!Objects.equals(((MagicavoxelVox.Pack) (this.chunkContent))._parent(), this))
                                throw new ConsistencyError("chunk_content", this, ((MagicavoxelVox.Pack) (this.chunkContent))._parent());
                            break;
                        }
                        case RGBA: {
                            if (!Objects.equals(((MagicavoxelVox.Rgba) (this.chunkContent))._root(), _root()))
                                throw new ConsistencyError("chunk_content", _root(), ((MagicavoxelVox.Rgba) (this.chunkContent))._root());
                            if (!Objects.equals(((MagicavoxelVox.Rgba) (this.chunkContent))._parent(), this))
                                throw new ConsistencyError("chunk_content", this, ((MagicavoxelVox.Rgba) (this.chunkContent))._parent());
                            break;
                        }
                        case SIZE: {
                            if (!Objects.equals(((MagicavoxelVox.Size) (this.chunkContent))._root(), _root()))
                                throw new ConsistencyError("chunk_content", _root(), ((MagicavoxelVox.Size) (this.chunkContent))._root());
                            if (!Objects.equals(((MagicavoxelVox.Size) (this.chunkContent))._parent(), this))
                                throw new ConsistencyError("chunk_content", this, ((MagicavoxelVox.Size) (this.chunkContent))._parent());
                            break;
                        }
                        case XYZI: {
                            if (!Objects.equals(((MagicavoxelVox.Xyzi) (this.chunkContent))._root(), _root()))
                                throw new ConsistencyError("chunk_content", _root(), ((MagicavoxelVox.Xyzi) (this.chunkContent))._root());
                            if (!Objects.equals(((MagicavoxelVox.Xyzi) (this.chunkContent))._parent(), this))
                                throw new ConsistencyError("chunk_content", this, ((MagicavoxelVox.Xyzi) (this.chunkContent))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.chunkContent)).length != numBytesOfChunkContent())
                                throw new ConsistencyError("chunk_content", numBytesOfChunkContent(), ((byte[]) (this.chunkContent)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.chunkContent)).length != numBytesOfChunkContent())
                            throw new ConsistencyError("chunk_content", numBytesOfChunkContent(), ((byte[]) (this.chunkContent)).length);
                    }
                }
            }
            if (numBytesOfChildrenChunks() != 0) {
                for (int i = 0; i < this.childrenChunks.size(); i++) {
                    if (!Objects.equals(this.childrenChunks.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("children_chunks", _root(), this.childrenChunks.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.childrenChunks.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("children_chunks", this, this.childrenChunks.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        private ChunkType chunkId;
        private long numBytesOfChunkContent;
        private long numBytesOfChildrenChunks;
        private Object chunkContent;
        private List<Chunk> childrenChunks;
        private MagicavoxelVox _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_chunkContent;
        public ChunkType chunkId() { return chunkId; }
        public void setChunkId(ChunkType _v) { _dirty = true; chunkId = _v; }
        public long numBytesOfChunkContent() { return numBytesOfChunkContent; }
        public void setNumBytesOfChunkContent(long _v) { _dirty = true; numBytesOfChunkContent = _v; }
        public long numBytesOfChildrenChunks() { return numBytesOfChildrenChunks; }
        public void setNumBytesOfChildrenChunks(long _v) { _dirty = true; numBytesOfChildrenChunks = _v; }
        public Object chunkContent() { return chunkContent; }
        public void setChunkContent(Object _v) { _dirty = true; chunkContent = _v; }
        public List<Chunk> childrenChunks() { return childrenChunks; }
        public void setChildrenChunks(List<Chunk> _v) { _dirty = true; childrenChunks = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_chunkContent() { return _raw_chunkContent; }
        public void set_raw_ChunkContent(byte[] _v) { _dirty = true; _raw_chunkContent = _v; }
    }
    public static class Color extends KaitaiStruct.ReadWrite {
        public static Color fromFile(String fileName) throws IOException {
            return new Color(new ByteBufferKaitaiStream(fileName));
        }
        public Color() {
            this(null, null, null);
        }

        public Color(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Color(KaitaiStream _io, MagicavoxelVox.Rgba _parent) {
            this(_io, _parent, null);
        }

        public Color(KaitaiStream _io, MagicavoxelVox.Rgba _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            this.a = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.r);
            this._io.writeU1(this.g);
            this._io.writeU1(this.b);
            this._io.writeU1(this.a);
        }

        public void _check() {
            _dirty = false;
        }
        private int r;
        private int g;
        private int b;
        private int a;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Rgba _parent;
        public int r() { return r; }
        public void setR(int _v) { _dirty = true; r = _v; }
        public int g() { return g; }
        public void setG(int _v) { _dirty = true; g = _v; }
        public int b() { return b; }
        public void setB(int _v) { _dirty = true; b = _v; }
        public int a() { return a; }
        public void setA(int _v) { _dirty = true; a = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Rgba _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Rgba _v) { _dirty = true; _parent = _v; }
    }
    public static class Matt extends KaitaiStruct.ReadWrite {
        public static Matt fromFile(String fileName) throws IOException {
            return new Matt(new ByteBufferKaitaiStream(fileName));
        }
        public Matt() {
            this(null, null, null);
        }

        public Matt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Matt(KaitaiStream _io, MagicavoxelVox.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Matt(KaitaiStream _io, MagicavoxelVox.Chunk _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU4le();
            this.materialType = MagicavoxelVox.MaterialType.byId(this._io.readU4le());
            this.materialWeight = this._io.readF4le();
            this.propertyBits = this._io.readU4le();
            if (hasPlastic()) {
                this.plastic = this._io.readF4le();
            }
            if (hasRoughness()) {
                this.roughness = this._io.readF4le();
            }
            if (hasSpecular()) {
                this.specular = this._io.readF4le();
            }
            if (hasIor()) {
                this.ior = this._io.readF4le();
            }
            if (hasAttenuation()) {
                this.attenuation = this._io.readF4le();
            }
            if (hasPower()) {
                this.power = this._io.readF4le();
            }
            if (hasGlow()) {
                this.glow = this._io.readF4le();
            }
            if (hasIsTotalPower()) {
                this.isTotalPower = this._io.readF4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasPlastic()) {
            }
            if (hasRoughness()) {
            }
            if (hasSpecular()) {
            }
            if (hasIor()) {
            }
            if (hasAttenuation()) {
            }
            if (hasPower()) {
            }
            if (hasGlow()) {
            }
            if (hasIsTotalPower()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.id);
            this._io.writeU4le(((Number) (this.materialType.id())).longValue());
            this._io.writeF4le(this.materialWeight);
            this._io.writeU4le(this.propertyBits);
            if (hasPlastic()) {
                this._io.writeF4le(this.plastic);
            }
            if (hasRoughness()) {
                this._io.writeF4le(this.roughness);
            }
            if (hasSpecular()) {
                this._io.writeF4le(this.specular);
            }
            if (hasIor()) {
                this._io.writeF4le(this.ior);
            }
            if (hasAttenuation()) {
                this._io.writeF4le(this.attenuation);
            }
            if (hasPower()) {
                this._io.writeF4le(this.power);
            }
            if (hasGlow()) {
                this._io.writeF4le(this.glow);
            }
            if (hasIsTotalPower()) {
                this._io.writeF4le(this.isTotalPower);
            }
        }

        public void _check() {
            if (hasPlastic()) {
            }
            if (hasRoughness()) {
            }
            if (hasSpecular()) {
            }
            if (hasIor()) {
            }
            if (hasAttenuation()) {
            }
            if (hasPower()) {
            }
            if (hasGlow()) {
            }
            if (hasIsTotalPower()) {
            }
            _dirty = false;
        }
        private Boolean hasAttenuation;
        public Boolean hasAttenuation() {
            if (this.hasAttenuation != null)
                return this.hasAttenuation;
            this.hasAttenuation = (propertyBits() & 16) != 0;
            return this.hasAttenuation;
        }
        public void _invalidateHasAttenuation() { this.hasAttenuation = null; }
        private Boolean hasGlow;
        public Boolean hasGlow() {
            if (this.hasGlow != null)
                return this.hasGlow;
            this.hasGlow = (propertyBits() & 64) != 0;
            return this.hasGlow;
        }
        public void _invalidateHasGlow() { this.hasGlow = null; }
        private Boolean hasIor;
        public Boolean hasIor() {
            if (this.hasIor != null)
                return this.hasIor;
            this.hasIor = (propertyBits() & 8) != 0;
            return this.hasIor;
        }
        public void _invalidateHasIor() { this.hasIor = null; }
        private Boolean hasIsTotalPower;
        public Boolean hasIsTotalPower() {
            if (this.hasIsTotalPower != null)
                return this.hasIsTotalPower;
            this.hasIsTotalPower = (propertyBits() & 128) != 0;
            return this.hasIsTotalPower;
        }
        public void _invalidateHasIsTotalPower() { this.hasIsTotalPower = null; }
        private Boolean hasPlastic;
        public Boolean hasPlastic() {
            if (this.hasPlastic != null)
                return this.hasPlastic;
            this.hasPlastic = (propertyBits() & 1) != 0;
            return this.hasPlastic;
        }
        public void _invalidateHasPlastic() { this.hasPlastic = null; }
        private Boolean hasPower;
        public Boolean hasPower() {
            if (this.hasPower != null)
                return this.hasPower;
            this.hasPower = (propertyBits() & 32) != 0;
            return this.hasPower;
        }
        public void _invalidateHasPower() { this.hasPower = null; }
        private Boolean hasRoughness;
        public Boolean hasRoughness() {
            if (this.hasRoughness != null)
                return this.hasRoughness;
            this.hasRoughness = (propertyBits() & 2) != 0;
            return this.hasRoughness;
        }
        public void _invalidateHasRoughness() { this.hasRoughness = null; }
        private Boolean hasSpecular;
        public Boolean hasSpecular() {
            if (this.hasSpecular != null)
                return this.hasSpecular;
            this.hasSpecular = (propertyBits() & 4) != 0;
            return this.hasSpecular;
        }
        public void _invalidateHasSpecular() { this.hasSpecular = null; }
        private long id;
        private MaterialType materialType;
        private float materialWeight;
        private long propertyBits;
        private Float plastic;
        private Float roughness;
        private Float specular;
        private Float ior;
        private Float attenuation;
        private Float power;
        private Float glow;
        private Float isTotalPower;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long id() { return id; }
        public void setId(long _v) { _dirty = true; id = _v; }
        public MaterialType materialType() { return materialType; }
        public void setMaterialType(MaterialType _v) { _dirty = true; materialType = _v; }
        public float materialWeight() { return materialWeight; }
        public void setMaterialWeight(float _v) { _dirty = true; materialWeight = _v; }
        public long propertyBits() { return propertyBits; }
        public void setPropertyBits(long _v) { _dirty = true; propertyBits = _v; }
        public Float plastic() { return plastic; }
        public void setPlastic(Float _v) { _dirty = true; plastic = _v; }
        public Float roughness() { return roughness; }
        public void setRoughness(Float _v) { _dirty = true; roughness = _v; }
        public Float specular() { return specular; }
        public void setSpecular(Float _v) { _dirty = true; specular = _v; }
        public Float ior() { return ior; }
        public void setIor(Float _v) { _dirty = true; ior = _v; }
        public Float attenuation() { return attenuation; }
        public void setAttenuation(Float _v) { _dirty = true; attenuation = _v; }
        public Float power() { return power; }
        public void setPower(Float _v) { _dirty = true; power = _v; }
        public Float glow() { return glow; }
        public void setGlow(Float _v) { _dirty = true; glow = _v; }
        public Float isTotalPower() { return isTotalPower; }
        public void setIsTotalPower(Float _v) { _dirty = true; isTotalPower = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Pack extends KaitaiStruct.ReadWrite {
        public static Pack fromFile(String fileName) throws IOException {
            return new Pack(new ByteBufferKaitaiStream(fileName));
        }
        public Pack() {
            this(null, null, null);
        }

        public Pack(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pack(KaitaiStream _io, MagicavoxelVox.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Pack(KaitaiStream _io, MagicavoxelVox.Chunk _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numModels = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numModels);
        }

        public void _check() {
            _dirty = false;
        }
        private long numModels;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long numModels() { return numModels; }
        public void setNumModels(long _v) { _dirty = true; numModels = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Rgba extends KaitaiStruct.ReadWrite {
        public static Rgba fromFile(String fileName) throws IOException {
            return new Rgba(new ByteBufferKaitaiStream(fileName));
        }
        public Rgba() {
            this(null, null, null);
        }

        public Rgba(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rgba(KaitaiStream _io, MagicavoxelVox.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Rgba(KaitaiStream _io, MagicavoxelVox.Chunk _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colors = new ArrayList<Color>();
            for (int i = 0; i < 256; i++) {
                Color _t_colors = new Color(this._io, this, _root);
                try {
                    _t_colors._read();
                } finally {
                    this.colors.add(_t_colors);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.colors.size() != 256)
                throw new ConsistencyError("colors", 256, this.colors.size());
            for (int i = 0; i < this.colors.size(); i++) {
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("colors", _root(), this.colors.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("colors", this, this.colors.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Color> colors;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public List<Color> colors() { return colors; }
        public void setColors(List<Color> _v) { _dirty = true; colors = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Size extends KaitaiStruct.ReadWrite {
        public static Size fromFile(String fileName) throws IOException {
            return new Size(new ByteBufferKaitaiStream(fileName));
        }
        public Size() {
            this(null, null, null);
        }

        public Size(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Size(KaitaiStream _io, MagicavoxelVox.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Size(KaitaiStream _io, MagicavoxelVox.Chunk _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sizeX = this._io.readU4le();
            this.sizeY = this._io.readU4le();
            this.sizeZ = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.sizeX);
            this._io.writeU4le(this.sizeY);
            this._io.writeU4le(this.sizeZ);
        }

        public void _check() {
            _dirty = false;
        }
        private long sizeX;
        private long sizeY;
        private long sizeZ;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long sizeX() { return sizeX; }
        public void setSizeX(long _v) { _dirty = true; sizeX = _v; }
        public long sizeY() { return sizeY; }
        public void setSizeY(long _v) { _dirty = true; sizeY = _v; }
        public long sizeZ() { return sizeZ; }
        public void setSizeZ(long _v) { _dirty = true; sizeZ = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Voxel extends KaitaiStruct.ReadWrite {
        public static Voxel fromFile(String fileName) throws IOException {
            return new Voxel(new ByteBufferKaitaiStream(fileName));
        }
        public Voxel() {
            this(null, null, null);
        }

        public Voxel(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Voxel(KaitaiStream _io, MagicavoxelVox.Xyzi _parent) {
            this(_io, _parent, null);
        }

        public Voxel(KaitaiStream _io, MagicavoxelVox.Xyzi _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readU1();
            this.y = this._io.readU1();
            this.z = this._io.readU1();
            this.colorIndex = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.x);
            this._io.writeU1(this.y);
            this._io.writeU1(this.z);
            this._io.writeU1(this.colorIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private int x;
        private int y;
        private int z;
        private int colorIndex;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Xyzi _parent;
        public int x() { return x; }
        public void setX(int _v) { _dirty = true; x = _v; }
        public int y() { return y; }
        public void setY(int _v) { _dirty = true; y = _v; }
        public int z() { return z; }
        public void setZ(int _v) { _dirty = true; z = _v; }
        public int colorIndex() { return colorIndex; }
        public void setColorIndex(int _v) { _dirty = true; colorIndex = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Xyzi _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Xyzi _v) { _dirty = true; _parent = _v; }
    }
    public static class Xyzi extends KaitaiStruct.ReadWrite {
        public static Xyzi fromFile(String fileName) throws IOException {
            return new Xyzi(new ByteBufferKaitaiStream(fileName));
        }
        public Xyzi() {
            this(null, null, null);
        }

        public Xyzi(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Xyzi(KaitaiStream _io, MagicavoxelVox.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Xyzi(KaitaiStream _io, MagicavoxelVox.Chunk _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numVoxels = this._io.readU4le();
            this.voxels = new ArrayList<Voxel>();
            for (int i = 0; i < numVoxels(); i++) {
                Voxel _t_voxels = new Voxel(this._io, this, _root);
                try {
                    _t_voxels._read();
                } finally {
                    this.voxels.add(_t_voxels);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.voxels.size(); i++) {
                this.voxels.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.numVoxels);
            for (int i = 0; i < this.voxels.size(); i++) {
                this.voxels.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.voxels.size() != numVoxels())
                throw new ConsistencyError("voxels", numVoxels(), this.voxels.size());
            for (int i = 0; i < this.voxels.size(); i++) {
                if (!Objects.equals(this.voxels.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("voxels", _root(), this.voxels.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.voxels.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("voxels", this, this.voxels.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long numVoxels;
        private List<Voxel> voxels;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long numVoxels() { return numVoxels; }
        public void setNumVoxels(long _v) { _dirty = true; numVoxels = _v; }
        public List<Voxel> voxels() { return voxels; }
        public void setVoxels(List<Voxel> _v) { _dirty = true; voxels = _v; }
        public MagicavoxelVox _root() { return _root; }
        public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
        public void set_parent(MagicavoxelVox.Chunk _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private long version;
    private Chunk main;
    private MagicavoxelVox _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * 150 expected
     */
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public Chunk main() { return main; }
    public void setMain(Chunk _v) { _dirty = true; main = _v; }
    public MagicavoxelVox _root() { return _root; }
    public void set_root(MagicavoxelVox _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
