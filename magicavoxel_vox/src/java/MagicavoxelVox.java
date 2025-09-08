// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://ephtracy.github.io/">MagicaVoxel Homepage</a>
 * @see <a href="https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt">Format Description</a>
 */
public class MagicavoxelVox extends KaitaiStruct {
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

    public MagicavoxelVox(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MagicavoxelVox(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MagicavoxelVox(KaitaiStream _io, KaitaiStruct _parent, MagicavoxelVox _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 86, 79, 88, 32 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 79, 88, 32 }, this.magic, this._io, "/seq/0");
        }
        this.version = this._io.readU4le();
        this.main = new Chunk(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.main._fetchInstances();
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, KaitaiStruct _parent, MagicavoxelVox _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.chunkId = MagicavoxelVox.ChunkType.byId(this._io.readU4be());
            this.numBytesOfChunkContent = this._io.readU4le();
            this.numBytesOfChildrenChunks = this._io.readU4le();
            if (numBytesOfChunkContent() != 0) {
                {
                    ChunkType on = chunkId();
                    if (on != null) {
                        switch (chunkId()) {
                        case MATT: {
                            KaitaiStream _io_chunkContent = this._io.substream(numBytesOfChunkContent());
                            this.chunkContent = new Matt(_io_chunkContent, this, _root);
                            break;
                        }
                        case PACK: {
                            KaitaiStream _io_chunkContent = this._io.substream(numBytesOfChunkContent());
                            this.chunkContent = new Pack(_io_chunkContent, this, _root);
                            break;
                        }
                        case RGBA: {
                            KaitaiStream _io_chunkContent = this._io.substream(numBytesOfChunkContent());
                            this.chunkContent = new Rgba(_io_chunkContent, this, _root);
                            break;
                        }
                        case SIZE: {
                            KaitaiStream _io_chunkContent = this._io.substream(numBytesOfChunkContent());
                            this.chunkContent = new Size(_io_chunkContent, this, _root);
                            break;
                        }
                        case XYZI: {
                            KaitaiStream _io_chunkContent = this._io.substream(numBytesOfChunkContent());
                            this.chunkContent = new Xyzi(_io_chunkContent, this, _root);
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
                        this.childrenChunks.add(new Chunk(this._io, this, _root));
                        i++;
                    }
                }
            }
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
        private ChunkType chunkId;
        private long numBytesOfChunkContent;
        private long numBytesOfChildrenChunks;
        private Object chunkContent;
        private List<Chunk> childrenChunks;
        private MagicavoxelVox _root;
        private KaitaiStruct _parent;
        public ChunkType chunkId() { return chunkId; }
        public long numBytesOfChunkContent() { return numBytesOfChunkContent; }
        public long numBytesOfChildrenChunks() { return numBytesOfChildrenChunks; }
        public Object chunkContent() { return chunkContent; }
        public List<Chunk> childrenChunks() { return childrenChunks; }
        public MagicavoxelVox _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Color extends KaitaiStruct {
        public static Color fromFile(String fileName) throws IOException {
            return new Color(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            this.a = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int r;
        private int g;
        private int b;
        private int a;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Rgba _parent;
        public int r() { return r; }
        public int g() { return g; }
        public int b() { return b; }
        public int a() { return a; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Rgba _parent() { return _parent; }
    }
    public static class Matt extends KaitaiStruct {
        public static Matt fromFile(String fileName) throws IOException {
            return new Matt(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        private Boolean hasAttenuation;
        public Boolean hasAttenuation() {
            if (this.hasAttenuation != null)
                return this.hasAttenuation;
            this.hasAttenuation = (propertyBits() & 16) != 0;
            return this.hasAttenuation;
        }
        private Boolean hasGlow;
        public Boolean hasGlow() {
            if (this.hasGlow != null)
                return this.hasGlow;
            this.hasGlow = (propertyBits() & 64) != 0;
            return this.hasGlow;
        }
        private Boolean hasIor;
        public Boolean hasIor() {
            if (this.hasIor != null)
                return this.hasIor;
            this.hasIor = (propertyBits() & 8) != 0;
            return this.hasIor;
        }
        private Boolean hasIsTotalPower;
        public Boolean hasIsTotalPower() {
            if (this.hasIsTotalPower != null)
                return this.hasIsTotalPower;
            this.hasIsTotalPower = (propertyBits() & 128) != 0;
            return this.hasIsTotalPower;
        }
        private Boolean hasPlastic;
        public Boolean hasPlastic() {
            if (this.hasPlastic != null)
                return this.hasPlastic;
            this.hasPlastic = (propertyBits() & 1) != 0;
            return this.hasPlastic;
        }
        private Boolean hasPower;
        public Boolean hasPower() {
            if (this.hasPower != null)
                return this.hasPower;
            this.hasPower = (propertyBits() & 32) != 0;
            return this.hasPower;
        }
        private Boolean hasRoughness;
        public Boolean hasRoughness() {
            if (this.hasRoughness != null)
                return this.hasRoughness;
            this.hasRoughness = (propertyBits() & 2) != 0;
            return this.hasRoughness;
        }
        private Boolean hasSpecular;
        public Boolean hasSpecular() {
            if (this.hasSpecular != null)
                return this.hasSpecular;
            this.hasSpecular = (propertyBits() & 4) != 0;
            return this.hasSpecular;
        }
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
        public MaterialType materialType() { return materialType; }
        public float materialWeight() { return materialWeight; }
        public long propertyBits() { return propertyBits; }
        public Float plastic() { return plastic; }
        public Float roughness() { return roughness; }
        public Float specular() { return specular; }
        public Float ior() { return ior; }
        public Float attenuation() { return attenuation; }
        public Float power() { return power; }
        public Float glow() { return glow; }
        public Float isTotalPower() { return isTotalPower; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
    }
    public static class Pack extends KaitaiStruct {
        public static Pack fromFile(String fileName) throws IOException {
            return new Pack(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numModels = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private long numModels;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long numModels() { return numModels; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
    }
    public static class Rgba extends KaitaiStruct {
        public static Rgba fromFile(String fileName) throws IOException {
            return new Rgba(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colors = new ArrayList<Color>();
            for (int i = 0; i < 256; i++) {
                this.colors.add(new Color(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<Color> colors;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public List<Color> colors() { return colors; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
    }
    public static class Size extends KaitaiStruct {
        public static Size fromFile(String fileName) throws IOException {
            return new Size(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.sizeX = this._io.readU4le();
            this.sizeY = this._io.readU4le();
            this.sizeZ = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private long sizeX;
        private long sizeY;
        private long sizeZ;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long sizeX() { return sizeX; }
        public long sizeY() { return sizeY; }
        public long sizeZ() { return sizeZ; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
    }
    public static class Voxel extends KaitaiStruct {
        public static Voxel fromFile(String fileName) throws IOException {
            return new Voxel(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.x = this._io.readU1();
            this.y = this._io.readU1();
            this.z = this._io.readU1();
            this.colorIndex = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int x;
        private int y;
        private int z;
        private int colorIndex;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Xyzi _parent;
        public int x() { return x; }
        public int y() { return y; }
        public int z() { return z; }
        public int colorIndex() { return colorIndex; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Xyzi _parent() { return _parent; }
    }
    public static class Xyzi extends KaitaiStruct {
        public static Xyzi fromFile(String fileName) throws IOException {
            return new Xyzi(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numVoxels = this._io.readU4le();
            this.voxels = new ArrayList<Voxel>();
            for (int i = 0; i < numVoxels(); i++) {
                this.voxels.add(new Voxel(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.voxels.size(); i++) {
                this.voxels.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private long numVoxels;
        private List<Voxel> voxels;
        private MagicavoxelVox _root;
        private MagicavoxelVox.Chunk _parent;
        public long numVoxels() { return numVoxels; }
        public List<Voxel> voxels() { return voxels; }
        public MagicavoxelVox _root() { return _root; }
        public MagicavoxelVox.Chunk _parent() { return _parent; }
    }
    private byte[] magic;
    private long version;
    private Chunk main;
    private MagicavoxelVox _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * 150 expected
     */
    public long version() { return version; }
    public Chunk main() { return main; }
    public MagicavoxelVox _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
