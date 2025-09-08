// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */
public class Png extends KaitaiStruct.ReadWrite {
    public static Png fromFile(String fileName) throws IOException {
        return new Png(new ByteBufferKaitaiStream(fileName));
    }

    public enum BlendOpValues {
        SOURCE(0),
        OVER(1);

        private final long id;
        BlendOpValues(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlendOpValues> byId = new HashMap<Long, BlendOpValues>(2);
        static {
            for (BlendOpValues e : BlendOpValues.values())
                byId.put(e.id(), e);
        }
        public static BlendOpValues byId(long id) { return byId.get(id); }
    }

    public enum ColorType {
        GREYSCALE(0),
        TRUECOLOR(2),
        INDEXED(3),
        GREYSCALE_ALPHA(4),
        TRUECOLOR_ALPHA(6);

        private final long id;
        ColorType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ColorType> byId = new HashMap<Long, ColorType>(5);
        static {
            for (ColorType e : ColorType.values())
                byId.put(e.id(), e);
        }
        public static ColorType byId(long id) { return byId.get(id); }
    }

    public enum CompressionMethods {
        ZLIB(0);

        private final long id;
        CompressionMethods(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionMethods> byId = new HashMap<Long, CompressionMethods>(1);
        static {
            for (CompressionMethods e : CompressionMethods.values())
                byId.put(e.id(), e);
        }
        public static CompressionMethods byId(long id) { return byId.get(id); }
    }

    public enum DisposeOpValues {
        NONE(0),
        BACKGROUND(1),
        PREVIOUS(2);

        private final long id;
        DisposeOpValues(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DisposeOpValues> byId = new HashMap<Long, DisposeOpValues>(3);
        static {
            for (DisposeOpValues e : DisposeOpValues.values())
                byId.put(e.id(), e);
        }
        public static DisposeOpValues byId(long id) { return byId.get(id); }
    }

    public enum PhysUnit {
        UNKNOWN(0),
        METER(1);

        private final long id;
        PhysUnit(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PhysUnit> byId = new HashMap<Long, PhysUnit>(2);
        static {
            for (PhysUnit e : PhysUnit.values())
                byId.put(e.id(), e);
        }
        public static PhysUnit byId(long id) { return byId.get(id); }
    }
    public Png() {
        this(null, null, null);
    }

    public Png(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Png(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Png(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Png _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }, this.magic, this._io, "/seq/0");
        }
        this.ihdrLen = this._io.readU4be();
        if (!(this.ihdrLen == 13)) {
            throw new KaitaiStream.ValidationNotEqualError(13, this.ihdrLen, this._io, "/seq/1");
        }
        this.ihdrType = this._io.readBytes(4);
        if (!(Arrays.equals(this.ihdrType, new byte[] { 73, 72, 68, 82 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 72, 68, 82 }, this.ihdrType, this._io, "/seq/2");
        }
        this.ihdr = new IhdrChunk(this._io, this, _root);
        this.ihdr._read();
        this.ihdrCrc = this._io.readBytes(4);
        this.chunks = new ArrayList<Chunk>();
        {
            Chunk _it;
            int i = 0;
            do {
                Chunk _t_chunks = new Chunk(this._io, this, _root);
                try {
                    _t_chunks._read();
                } finally {
                    _it = _t_chunks;
                    this.chunks.add(_it);
                }
                i++;
            } while (!( ((_it.type().equals("IEND")) || (_io().isEof())) ));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.ihdr._fetchInstances();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4be(this.ihdrLen);
        this._io.writeBytes(this.ihdrType);
        this.ihdr._write_Seq(this._io);
        this._io.writeBytes(this.ihdrCrc);
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
            {
                Chunk _it = this.chunks.get(((Number) (i)).intValue());
                if ( ((_it.type().equals("IEND")) || (_io().isEof()))  != (i == this.chunks.size() - 1))
                    throw new ConsistencyError("chunks", i == this.chunks.size() - 1,  ((_it.type().equals("IEND")) || (_io().isEof())) );
            }
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }, this.magic, null, "/seq/0");
        }
        if (!(this.ihdrLen == 13)) {
            throw new KaitaiStream.ValidationNotEqualError(13, this.ihdrLen, null, "/seq/1");
        }
        if (this.ihdrType.length != 4)
            throw new ConsistencyError("ihdr_type", 4, this.ihdrType.length);
        if (!(Arrays.equals(this.ihdrType, new byte[] { 73, 72, 68, 82 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 72, 68, 82 }, this.ihdrType, null, "/seq/2");
        }
        if (!Objects.equals(this.ihdr._root(), _root()))
            throw new ConsistencyError("ihdr", _root(), this.ihdr._root());
        if (!Objects.equals(this.ihdr._parent(), this))
            throw new ConsistencyError("ihdr", this, this.ihdr._parent());
        if (this.ihdrCrc.length != 4)
            throw new ConsistencyError("ihdr_crc", 4, this.ihdrCrc.length);
        if (this.chunks.size() == 0)
            throw new ConsistencyError("chunks", 0, this.chunks.size());
        for (int i = 0; i < this.chunks.size(); i++) {
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk">Source</a>
     */
    public static class AnimationControlChunk extends KaitaiStruct.ReadWrite {
        public static AnimationControlChunk fromFile(String fileName) throws IOException {
            return new AnimationControlChunk(new ByteBufferKaitaiStream(fileName));
        }
        public AnimationControlChunk() {
            this(null, null, null);
        }

        public AnimationControlChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AnimationControlChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public AnimationControlChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numFrames = this._io.readU4be();
            this.numPlays = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.numFrames);
            this._io.writeU4be(this.numPlays);
        }

        public void _check() {
            _dirty = false;
        }
        private long numFrames;
        private long numPlays;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Number of frames, must be equal to the number of `frame_control_chunk`s
         */
        public long numFrames() { return numFrames; }
        public void setNumFrames(long _v) { _dirty = true; numFrames = _v; }

        /**
         * Number of times to loop, 0 indicates infinite looping.
         */
        public long numPlays() { return numPlays; }
        public void setNumPlays(long _v) { _dirty = true; numPlays = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Background chunk stores default background color to display this
     * image against. Contents depend on `color_type` of the image.
     * @see <a href="https://www.w3.org/TR/png/#11bKGD">Source</a>
     */
    public static class BkgdChunk extends KaitaiStruct.ReadWrite {
        public static BkgdChunk fromFile(String fileName) throws IOException {
            return new BkgdChunk(new ByteBufferKaitaiStream(fileName));
        }
        public BkgdChunk() {
            this(null, null, null);
        }

        public BkgdChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        this.bkgd = new BkgdGreyscale(this._io, this, _root);
                        ((BkgdGreyscale) (this.bkgd))._read();
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        this.bkgd = new BkgdGreyscale(this._io, this, _root);
                        ((BkgdGreyscale) (this.bkgd))._read();
                        break;
                    }
                    case INDEXED: {
                        this.bkgd = new BkgdIndexed(this._io, this, _root);
                        ((BkgdIndexed) (this.bkgd))._read();
                        break;
                    }
                    case TRUECOLOR: {
                        this.bkgd = new BkgdTruecolor(this._io, this, _root);
                        ((BkgdTruecolor) (this.bkgd))._read();
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        this.bkgd = new BkgdTruecolor(this._io, this, _root);
                        ((BkgdTruecolor) (this.bkgd))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        ((BkgdGreyscale) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        ((BkgdGreyscale) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case INDEXED: {
                        ((BkgdIndexed) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR: {
                        ((BkgdTruecolor) (this.bkgd))._fetchInstances();
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        ((BkgdTruecolor) (this.bkgd))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        ((BkgdGreyscale) (this.bkgd))._write_Seq(this._io);
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        ((BkgdGreyscale) (this.bkgd))._write_Seq(this._io);
                        break;
                    }
                    case INDEXED: {
                        ((BkgdIndexed) (this.bkgd))._write_Seq(this._io);
                        break;
                    }
                    case TRUECOLOR: {
                        ((BkgdTruecolor) (this.bkgd))._write_Seq(this._io);
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        ((BkgdTruecolor) (this.bkgd))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case GREYSCALE: {
                        if (!Objects.equals(((Png.BkgdGreyscale) (this.bkgd))._root(), _root()))
                            throw new ConsistencyError("bkgd", _root(), ((Png.BkgdGreyscale) (this.bkgd))._root());
                        if (!Objects.equals(((Png.BkgdGreyscale) (this.bkgd))._parent(), this))
                            throw new ConsistencyError("bkgd", this, ((Png.BkgdGreyscale) (this.bkgd))._parent());
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        if (!Objects.equals(((Png.BkgdGreyscale) (this.bkgd))._root(), _root()))
                            throw new ConsistencyError("bkgd", _root(), ((Png.BkgdGreyscale) (this.bkgd))._root());
                        if (!Objects.equals(((Png.BkgdGreyscale) (this.bkgd))._parent(), this))
                            throw new ConsistencyError("bkgd", this, ((Png.BkgdGreyscale) (this.bkgd))._parent());
                        break;
                    }
                    case INDEXED: {
                        if (!Objects.equals(((Png.BkgdIndexed) (this.bkgd))._root(), _root()))
                            throw new ConsistencyError("bkgd", _root(), ((Png.BkgdIndexed) (this.bkgd))._root());
                        if (!Objects.equals(((Png.BkgdIndexed) (this.bkgd))._parent(), this))
                            throw new ConsistencyError("bkgd", this, ((Png.BkgdIndexed) (this.bkgd))._parent());
                        break;
                    }
                    case TRUECOLOR: {
                        if (!Objects.equals(((Png.BkgdTruecolor) (this.bkgd))._root(), _root()))
                            throw new ConsistencyError("bkgd", _root(), ((Png.BkgdTruecolor) (this.bkgd))._root());
                        if (!Objects.equals(((Png.BkgdTruecolor) (this.bkgd))._parent(), this))
                            throw new ConsistencyError("bkgd", this, ((Png.BkgdTruecolor) (this.bkgd))._parent());
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        if (!Objects.equals(((Png.BkgdTruecolor) (this.bkgd))._root(), _root()))
                            throw new ConsistencyError("bkgd", _root(), ((Png.BkgdTruecolor) (this.bkgd))._root());
                        if (!Objects.equals(((Png.BkgdTruecolor) (this.bkgd))._parent(), this))
                            throw new ConsistencyError("bkgd", this, ((Png.BkgdTruecolor) (this.bkgd))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private KaitaiStruct.ReadWrite bkgd;
        private Png _root;
        private Png.Chunk _parent;
        public KaitaiStruct.ReadWrite bkgd() { return bkgd; }
        public void setBkgd(KaitaiStruct.ReadWrite _v) { _dirty = true; bkgd = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Background chunk for greyscale images.
     */
    public static class BkgdGreyscale extends KaitaiStruct.ReadWrite {
        public static BkgdGreyscale fromFile(String fileName) throws IOException {
            return new BkgdGreyscale(new ByteBufferKaitaiStream(fileName));
        }
        public BkgdGreyscale() {
            this(null, null, null);
        }

        public BkgdGreyscale(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdGreyscale(KaitaiStream _io, Png.BkgdChunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdGreyscale(KaitaiStream _io, Png.BkgdChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.value = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private int value;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int value() { return value; }
        public void setValue(int _v) { _dirty = true; value = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.BkgdChunk _parent() { return _parent; }
        public void set_parent(Png.BkgdChunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Background chunk for images with indexed palette.
     */
    public static class BkgdIndexed extends KaitaiStruct.ReadWrite {
        public static BkgdIndexed fromFile(String fileName) throws IOException {
            return new BkgdIndexed(new ByteBufferKaitaiStream(fileName));
        }
        public BkgdIndexed() {
            this(null, null, null);
        }

        public BkgdIndexed(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdIndexed(KaitaiStream _io, Png.BkgdChunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdIndexed(KaitaiStream _io, Png.BkgdChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.paletteIndex = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.paletteIndex);
        }

        public void _check() {
            _dirty = false;
        }
        private int paletteIndex;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int paletteIndex() { return paletteIndex; }
        public void setPaletteIndex(int _v) { _dirty = true; paletteIndex = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.BkgdChunk _parent() { return _parent; }
        public void set_parent(Png.BkgdChunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Background chunk for truecolor images.
     */
    public static class BkgdTruecolor extends KaitaiStruct.ReadWrite {
        public static BkgdTruecolor fromFile(String fileName) throws IOException {
            return new BkgdTruecolor(new ByteBufferKaitaiStream(fileName));
        }
        public BkgdTruecolor() {
            this(null, null, null);
        }

        public BkgdTruecolor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BkgdTruecolor(KaitaiStream _io, Png.BkgdChunk _parent) {
            this(_io, _parent, null);
        }

        public BkgdTruecolor(KaitaiStream _io, Png.BkgdChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.red = this._io.readU2be();
            this.green = this._io.readU2be();
            this.blue = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.red);
            this._io.writeU2be(this.green);
            this._io.writeU2be(this.blue);
        }

        public void _check() {
            _dirty = false;
        }
        private int red;
        private int green;
        private int blue;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int red() { return red; }
        public void setRed(int _v) { _dirty = true; red = _v; }
        public int green() { return green; }
        public void setGreen(int _v) { _dirty = true; green = _v; }
        public int blue() { return blue; }
        public void setBlue(int _v) { _dirty = true; blue = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.BkgdChunk _parent() { return _parent; }
        public void set_parent(Png.BkgdChunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11cHRM">Source</a>
     */
    public static class ChrmChunk extends KaitaiStruct.ReadWrite {
        public static ChrmChunk fromFile(String fileName) throws IOException {
            return new ChrmChunk(new ByteBufferKaitaiStream(fileName));
        }
        public ChrmChunk() {
            this(null, null, null);
        }

        public ChrmChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChrmChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public ChrmChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.whitePoint = new Point(this._io, this, _root);
            this.whitePoint._read();
            this.red = new Point(this._io, this, _root);
            this.red._read();
            this.green = new Point(this._io, this, _root);
            this.green._read();
            this.blue = new Point(this._io, this, _root);
            this.blue._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.whitePoint._fetchInstances();
            this.red._fetchInstances();
            this.green._fetchInstances();
            this.blue._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.whitePoint._write_Seq(this._io);
            this.red._write_Seq(this._io);
            this.green._write_Seq(this._io);
            this.blue._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.whitePoint._root(), _root()))
                throw new ConsistencyError("white_point", _root(), this.whitePoint._root());
            if (!Objects.equals(this.whitePoint._parent(), this))
                throw new ConsistencyError("white_point", this, this.whitePoint._parent());
            if (!Objects.equals(this.red._root(), _root()))
                throw new ConsistencyError("red", _root(), this.red._root());
            if (!Objects.equals(this.red._parent(), this))
                throw new ConsistencyError("red", this, this.red._parent());
            if (!Objects.equals(this.green._root(), _root()))
                throw new ConsistencyError("green", _root(), this.green._root());
            if (!Objects.equals(this.green._parent(), this))
                throw new ConsistencyError("green", this, this.green._parent());
            if (!Objects.equals(this.blue._root(), _root()))
                throw new ConsistencyError("blue", _root(), this.blue._root());
            if (!Objects.equals(this.blue._parent(), this))
                throw new ConsistencyError("blue", this, this.blue._parent());
            _dirty = false;
        }
        private Point whitePoint;
        private Point red;
        private Point green;
        private Point blue;
        private Png _root;
        private Png.Chunk _parent;
        public Point whitePoint() { return whitePoint; }
        public void setWhitePoint(Point _v) { _dirty = true; whitePoint = _v; }
        public Point red() { return red; }
        public void setRed(Point _v) { _dirty = true; red = _v; }
        public Point green() { return green; }
        public void setGreen(Point _v) { _dirty = true; green = _v; }
        public Point blue() { return blue; }
        public void setBlue(Point _v) { _dirty = true; blue = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
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

        public Chunk(KaitaiStream _io, Png _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Png _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4be();
            this.type = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            switch (type()) {
            case "PLTE": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new PlteChunk(_io__raw_body, this, _root);
                ((PlteChunk) (this.body))._read();
                break;
            }
            case "acTL": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new AnimationControlChunk(_io__raw_body, this, _root);
                ((AnimationControlChunk) (this.body))._read();
                break;
            }
            case "bKGD": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new BkgdChunk(_io__raw_body, this, _root);
                ((BkgdChunk) (this.body))._read();
                break;
            }
            case "cHRM": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new ChrmChunk(_io__raw_body, this, _root);
                ((ChrmChunk) (this.body))._read();
                break;
            }
            case "fcTL": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new FrameControlChunk(_io__raw_body, this, _root);
                ((FrameControlChunk) (this.body))._read();
                break;
            }
            case "fdAT": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new FrameDataChunk(_io__raw_body, this, _root);
                ((FrameDataChunk) (this.body))._read();
                break;
            }
            case "gAMA": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new GamaChunk(_io__raw_body, this, _root);
                ((GamaChunk) (this.body))._read();
                break;
            }
            case "iTXt": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new InternationalTextChunk(_io__raw_body, this, _root);
                ((InternationalTextChunk) (this.body))._read();
                break;
            }
            case "pHYs": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new PhysChunk(_io__raw_body, this, _root);
                ((PhysChunk) (this.body))._read();
                break;
            }
            case "sRGB": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new SrgbChunk(_io__raw_body, this, _root);
                ((SrgbChunk) (this.body))._read();
                break;
            }
            case "tEXt": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new TextChunk(_io__raw_body, this, _root);
                ((TextChunk) (this.body))._read();
                break;
            }
            case "tIME": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new TimeChunk(_io__raw_body, this, _root);
                ((TimeChunk) (this.body))._read();
                break;
            }
            case "zTXt": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new CompressedTextChunk(_io__raw_body, this, _root);
                ((CompressedTextChunk) (this.body))._read();
                break;
            }
            default: {
                this.body = this._io.readBytes(len());
                break;
            }
            }
            this.crc = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (type()) {
            case "PLTE": {
                ((PlteChunk) (this.body))._fetchInstances();
                break;
            }
            case "acTL": {
                ((AnimationControlChunk) (this.body))._fetchInstances();
                break;
            }
            case "bKGD": {
                ((BkgdChunk) (this.body))._fetchInstances();
                break;
            }
            case "cHRM": {
                ((ChrmChunk) (this.body))._fetchInstances();
                break;
            }
            case "fcTL": {
                ((FrameControlChunk) (this.body))._fetchInstances();
                break;
            }
            case "fdAT": {
                ((FrameDataChunk) (this.body))._fetchInstances();
                break;
            }
            case "gAMA": {
                ((GamaChunk) (this.body))._fetchInstances();
                break;
            }
            case "iTXt": {
                ((InternationalTextChunk) (this.body))._fetchInstances();
                break;
            }
            case "pHYs": {
                ((PhysChunk) (this.body))._fetchInstances();
                break;
            }
            case "sRGB": {
                ((SrgbChunk) (this.body))._fetchInstances();
                break;
            }
            case "tEXt": {
                ((TextChunk) (this.body))._fetchInstances();
                break;
            }
            case "tIME": {
                ((TimeChunk) (this.body))._fetchInstances();
                break;
            }
            case "zTXt": {
                ((CompressedTextChunk) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.len);
            this._io.writeBytes((this.type).getBytes(Charset.forName("UTF-8")));
            switch (type()) {
            case "PLTE": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((PlteChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "acTL": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((AnimationControlChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "bKGD": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((BkgdChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "cHRM": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((ChrmChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "fcTL": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((FrameControlChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "fdAT": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((FrameDataChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "gAMA": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((GamaChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "iTXt": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((InternationalTextChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "pHYs": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((PhysChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "sRGB": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((SrgbChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "tEXt": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((TextChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "tIME": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((TimeChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "zTXt": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Chunk _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((CompressedTextChunk) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                break;
            }
            }
            this._io.writeBytes(this.crc);
        }

        public void _check() {
            if ((this.type).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("type", 4, (this.type).getBytes(Charset.forName("UTF-8")).length);
            switch (type()) {
            case "PLTE": {
                if (!Objects.equals(((Png.PlteChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.PlteChunk) (this.body))._root());
                if (!Objects.equals(((Png.PlteChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.PlteChunk) (this.body))._parent());
                break;
            }
            case "acTL": {
                if (!Objects.equals(((Png.AnimationControlChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.AnimationControlChunk) (this.body))._root());
                if (!Objects.equals(((Png.AnimationControlChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.AnimationControlChunk) (this.body))._parent());
                break;
            }
            case "bKGD": {
                if (!Objects.equals(((Png.BkgdChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.BkgdChunk) (this.body))._root());
                if (!Objects.equals(((Png.BkgdChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.BkgdChunk) (this.body))._parent());
                break;
            }
            case "cHRM": {
                if (!Objects.equals(((Png.ChrmChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.ChrmChunk) (this.body))._root());
                if (!Objects.equals(((Png.ChrmChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.ChrmChunk) (this.body))._parent());
                break;
            }
            case "fcTL": {
                if (!Objects.equals(((Png.FrameControlChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.FrameControlChunk) (this.body))._root());
                if (!Objects.equals(((Png.FrameControlChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.FrameControlChunk) (this.body))._parent());
                break;
            }
            case "fdAT": {
                if (!Objects.equals(((Png.FrameDataChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.FrameDataChunk) (this.body))._root());
                if (!Objects.equals(((Png.FrameDataChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.FrameDataChunk) (this.body))._parent());
                break;
            }
            case "gAMA": {
                if (!Objects.equals(((Png.GamaChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.GamaChunk) (this.body))._root());
                if (!Objects.equals(((Png.GamaChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.GamaChunk) (this.body))._parent());
                break;
            }
            case "iTXt": {
                if (!Objects.equals(((Png.InternationalTextChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.InternationalTextChunk) (this.body))._root());
                if (!Objects.equals(((Png.InternationalTextChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.InternationalTextChunk) (this.body))._parent());
                break;
            }
            case "pHYs": {
                if (!Objects.equals(((Png.PhysChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.PhysChunk) (this.body))._root());
                if (!Objects.equals(((Png.PhysChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.PhysChunk) (this.body))._parent());
                break;
            }
            case "sRGB": {
                if (!Objects.equals(((Png.SrgbChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.SrgbChunk) (this.body))._root());
                if (!Objects.equals(((Png.SrgbChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.SrgbChunk) (this.body))._parent());
                break;
            }
            case "tEXt": {
                if (!Objects.equals(((Png.TextChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.TextChunk) (this.body))._root());
                if (!Objects.equals(((Png.TextChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.TextChunk) (this.body))._parent());
                break;
            }
            case "tIME": {
                if (!Objects.equals(((Png.TimeChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.TimeChunk) (this.body))._root());
                if (!Objects.equals(((Png.TimeChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.TimeChunk) (this.body))._parent());
                break;
            }
            case "zTXt": {
                if (!Objects.equals(((Png.CompressedTextChunk) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((Png.CompressedTextChunk) (this.body))._root());
                if (!Objects.equals(((Png.CompressedTextChunk) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((Png.CompressedTextChunk) (this.body))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.body)).length != len())
                    throw new ConsistencyError("body", len(), ((byte[]) (this.body)).length);
                break;
            }
            }
            if (this.crc.length != 4)
                throw new ConsistencyError("crc", 4, this.crc.length);
            _dirty = false;
        }
        private long len;
        private String type;
        private Object body;
        private byte[] crc;
        private Png _root;
        private Png _parent;
        private byte[] _raw_body;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public String type() { return type; }
        public void setType(String _v) { _dirty = true; type = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public byte[] crc() { return crc; }
        public void setCrc(byte[] _v) { _dirty = true; crc = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png _parent() { return _parent; }
        public void set_parent(Png _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }

    /**
     * Compressed text chunk effectively allows to store key-value
     * string pairs in PNG container, compressing "value" part (which
     * can be quite lengthy) with zlib compression.
     * @see <a href="https://www.w3.org/TR/png/#11zTXt">Source</a>
     */
    public static class CompressedTextChunk extends KaitaiStruct.ReadWrite {
        public static CompressedTextChunk fromFile(String fileName) throws IOException {
            return new CompressedTextChunk(new ByteBufferKaitaiStream(fileName));
        }
        public CompressedTextChunk() {
            this(null, null, null);
        }

        public CompressedTextChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressedTextChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public CompressedTextChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            this._raw_textDatastream = this._io.readBytesFull();
            this.textDatastream = KaitaiStream.processZlib(this._raw_textDatastream);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.keyword).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
            this._io.writeU1(((Number) (this.compressionMethod.id())).intValue());
            this._raw_textDatastream = KaitaiStream.unprocessZlib(this.textDatastream);
            this._io.writeBytes(this._raw_textDatastream);
            if (!(this._io.isEof()))
                throw new ConsistencyError("text_datastream", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.keyword).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("keyword", -1, KaitaiStream.byteArrayIndexOf((this.keyword).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private String keyword;
        private CompressionMethods compressionMethod;
        private byte[] textDatastream;
        private Png _root;
        private Png.Chunk _parent;
        private byte[] _raw_textDatastream;

        /**
         * Indicates purpose of the following text data.
         */
        public String keyword() { return keyword; }
        public void setKeyword(String _v) { _dirty = true; keyword = _v; }
        public CompressionMethods compressionMethod() { return compressionMethod; }
        public void setCompressionMethod(CompressionMethods _v) { _dirty = true; compressionMethod = _v; }
        public byte[] textDatastream() { return textDatastream; }
        public void setTextDatastream(byte[] _v) { _dirty = true; textDatastream = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_textDatastream() { return _raw_textDatastream; }
        public void set_raw_TextDatastream(byte[] _v) { _dirty = true; _raw_textDatastream = _v; }
    }

    /**
     * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk">Source</a>
     */
    public static class FrameControlChunk extends KaitaiStruct.ReadWrite {
        public static FrameControlChunk fromFile(String fileName) throws IOException {
            return new FrameControlChunk(new ByteBufferKaitaiStream(fileName));
        }
        public FrameControlChunk() {
            this(null, null, null);
        }

        public FrameControlChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameControlChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public FrameControlChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sequenceNumber = this._io.readU4be();
            this.width = this._io.readU4be();
            if (!(this.width >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/frame_control_chunk/seq/1");
            }
            if (!(this.width <= _root().ihdr().width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width(), this.width, this._io, "/types/frame_control_chunk/seq/1");
            }
            this.height = this._io.readU4be();
            if (!(this.height >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/frame_control_chunk/seq/2");
            }
            if (!(this.height <= _root().ihdr().height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height(), this.height, this._io, "/types/frame_control_chunk/seq/2");
            }
            this.xOffset = this._io.readU4be();
            if (!(this.xOffset <= _root().ihdr().width() - width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width() - width(), this.xOffset, this._io, "/types/frame_control_chunk/seq/3");
            }
            this.yOffset = this._io.readU4be();
            if (!(this.yOffset <= _root().ihdr().height() - height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height() - height(), this.yOffset, this._io, "/types/frame_control_chunk/seq/4");
            }
            this.delayNum = this._io.readU2be();
            this.delayDen = this._io.readU2be();
            this.disposeOp = Png.DisposeOpValues.byId(this._io.readU1());
            this.blendOp = Png.BlendOpValues.byId(this._io.readU1());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.sequenceNumber);
            this._io.writeU4be(this.width);
            this._io.writeU4be(this.height);
            this._io.writeU4be(this.xOffset);
            this._io.writeU4be(this.yOffset);
            this._io.writeU2be(this.delayNum);
            this._io.writeU2be(this.delayDen);
            this._io.writeU1(((Number) (this.disposeOp.id())).intValue());
            this._io.writeU1(((Number) (this.blendOp.id())).intValue());
        }

        public void _check() {
            if (!(this.width >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.width, null, "/types/frame_control_chunk/seq/1");
            }
            if (!(this.width <= _root().ihdr().width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width(), this.width, null, "/types/frame_control_chunk/seq/1");
            }
            if (!(this.height >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.height, null, "/types/frame_control_chunk/seq/2");
            }
            if (!(this.height <= _root().ihdr().height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height(), this.height, null, "/types/frame_control_chunk/seq/2");
            }
            if (!(this.xOffset <= _root().ihdr().width() - width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width() - width(), this.xOffset, null, "/types/frame_control_chunk/seq/3");
            }
            if (!(this.yOffset <= _root().ihdr().height() - height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height() - height(), this.yOffset, null, "/types/frame_control_chunk/seq/4");
            }
            _dirty = false;
        }
        private Double delay;

        /**
         * Time to display this frame, in seconds
         */
        public Double delay() {
            if (this.delay != null)
                return this.delay;
            this.delay = ((Number) (delayNum() / (delayDen() == 0 ? 100.0 : delayDen()))).doubleValue();
            return this.delay;
        }
        public void _invalidateDelay() { this.delay = null; }
        private long sequenceNumber;
        private long width;
        private long height;
        private long xOffset;
        private long yOffset;
        private int delayNum;
        private int delayDen;
        private DisposeOpValues disposeOp;
        private BlendOpValues blendOp;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Sequence number of the animation chunk
         */
        public long sequenceNumber() { return sequenceNumber; }
        public void setSequenceNumber(long _v) { _dirty = true; sequenceNumber = _v; }

        /**
         * Width of the following frame
         */
        public long width() { return width; }
        public void setWidth(long _v) { _dirty = true; width = _v; }

        /**
         * Height of the following frame
         */
        public long height() { return height; }
        public void setHeight(long _v) { _dirty = true; height = _v; }

        /**
         * X position at which to render the following frame
         */
        public long xOffset() { return xOffset; }
        public void setXOffset(long _v) { _dirty = true; xOffset = _v; }

        /**
         * Y position at which to render the following frame
         */
        public long yOffset() { return yOffset; }
        public void setYOffset(long _v) { _dirty = true; yOffset = _v; }

        /**
         * Frame delay fraction numerator
         */
        public int delayNum() { return delayNum; }
        public void setDelayNum(int _v) { _dirty = true; delayNum = _v; }

        /**
         * Frame delay fraction denominator
         */
        public int delayDen() { return delayDen; }
        public void setDelayDen(int _v) { _dirty = true; delayDen = _v; }

        /**
         * Type of frame area disposal to be done after rendering this frame
         */
        public DisposeOpValues disposeOp() { return disposeOp; }
        public void setDisposeOp(DisposeOpValues _v) { _dirty = true; disposeOp = _v; }

        /**
         * Type of frame area rendering for this frame
         */
        public BlendOpValues blendOp() { return blendOp; }
        public void setBlendOp(BlendOpValues _v) { _dirty = true; blendOp = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk">Source</a>
     */
    public static class FrameDataChunk extends KaitaiStruct.ReadWrite {
        public static FrameDataChunk fromFile(String fileName) throws IOException {
            return new FrameDataChunk(new ByteBufferKaitaiStream(fileName));
        }
        public FrameDataChunk() {
            this(null, null, null);
        }

        public FrameDataChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FrameDataChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public FrameDataChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sequenceNumber = this._io.readU4be();
            this.frameData = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.sequenceNumber);
            this._io.writeBytes(this.frameData);
            if (!(this._io.isEof()))
                throw new ConsistencyError("frame_data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private long sequenceNumber;
        private byte[] frameData;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Sequence number of the animation chunk. The fcTL and fdAT chunks
         * have a 4 byte sequence number. Both chunk types share the sequence.
         * The first fcTL chunk must contain sequence number 0, and the sequence
         * numbers in the remaining fcTL and fdAT chunks must be in order, with
         * no gaps or duplicates.
         */
        public long sequenceNumber() { return sequenceNumber; }
        public void setSequenceNumber(long _v) { _dirty = true; sequenceNumber = _v; }

        /**
         * Frame data for the frame. At least one fdAT chunk is required for
         * each frame. The compressed datastream is the concatenation of the
         * contents of the data fields of all the fdAT chunks within a frame.
         */
        public byte[] frameData() { return frameData; }
        public void setFrameData(byte[] _v) { _dirty = true; frameData = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11gAMA">Source</a>
     */
    public static class GamaChunk extends KaitaiStruct.ReadWrite {
        public static GamaChunk fromFile(String fileName) throws IOException {
            return new GamaChunk(new ByteBufferKaitaiStream(fileName));
        }
        public GamaChunk() {
            this(null, null, null);
        }

        public GamaChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GamaChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public GamaChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.gammaInt = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.gammaInt);
        }

        public void _check() {
            _dirty = false;
        }
        private Double gammaRatio;
        public Double gammaRatio() {
            if (this.gammaRatio != null)
                return this.gammaRatio;
            this.gammaRatio = ((Number) (100000.0 / gammaInt())).doubleValue();
            return this.gammaRatio;
        }
        public void _invalidateGammaRatio() { this.gammaRatio = null; }
        private long gammaInt;
        private Png _root;
        private Png.Chunk _parent;
        public long gammaInt() { return gammaInt; }
        public void setGammaInt(long _v) { _dirty = true; gammaInt = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11IHDR">Source</a>
     */
    public static class IhdrChunk extends KaitaiStruct.ReadWrite {
        public static IhdrChunk fromFile(String fileName) throws IOException {
            return new IhdrChunk(new ByteBufferKaitaiStream(fileName));
        }
        public IhdrChunk() {
            this(null, null, null);
        }

        public IhdrChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IhdrChunk(KaitaiStream _io, Png _parent) {
            this(_io, _parent, null);
        }

        public IhdrChunk(KaitaiStream _io, Png _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.width = this._io.readU4be();
            this.height = this._io.readU4be();
            this.bitDepth = this._io.readU1();
            this.colorType = Png.ColorType.byId(this._io.readU1());
            this.compressionMethod = this._io.readU1();
            this.filterMethod = this._io.readU1();
            this.interlaceMethod = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.width);
            this._io.writeU4be(this.height);
            this._io.writeU1(this.bitDepth);
            this._io.writeU1(((Number) (this.colorType.id())).intValue());
            this._io.writeU1(this.compressionMethod);
            this._io.writeU1(this.filterMethod);
            this._io.writeU1(this.interlaceMethod);
        }

        public void _check() {
            _dirty = false;
        }
        private long width;
        private long height;
        private int bitDepth;
        private ColorType colorType;
        private int compressionMethod;
        private int filterMethod;
        private int interlaceMethod;
        private Png _root;
        private Png _parent;
        public long width() { return width; }
        public void setWidth(long _v) { _dirty = true; width = _v; }
        public long height() { return height; }
        public void setHeight(long _v) { _dirty = true; height = _v; }
        public int bitDepth() { return bitDepth; }
        public void setBitDepth(int _v) { _dirty = true; bitDepth = _v; }
        public ColorType colorType() { return colorType; }
        public void setColorType(ColorType _v) { _dirty = true; colorType = _v; }
        public int compressionMethod() { return compressionMethod; }
        public void setCompressionMethod(int _v) { _dirty = true; compressionMethod = _v; }
        public int filterMethod() { return filterMethod; }
        public void setFilterMethod(int _v) { _dirty = true; filterMethod = _v; }
        public int interlaceMethod() { return interlaceMethod; }
        public void setInterlaceMethod(int _v) { _dirty = true; interlaceMethod = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png _parent() { return _parent; }
        public void set_parent(Png _v) { _dirty = true; _parent = _v; }
    }

    /**
     * International text chunk effectively allows to store key-value string pairs in
     * PNG container. Both "key" (keyword) and "value" (text) parts are
     * given in pre-defined subset of iso8859-1 without control
     * characters.
     * @see <a href="https://www.w3.org/TR/png/#11iTXt">Source</a>
     */
    public static class InternationalTextChunk extends KaitaiStruct.ReadWrite {
        public static InternationalTextChunk fromFile(String fileName) throws IOException {
            return new InternationalTextChunk(new ByteBufferKaitaiStream(fileName));
        }
        public InternationalTextChunk() {
            this(null, null, null);
        }

        public InternationalTextChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InternationalTextChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public InternationalTextChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            this.compressionFlag = this._io.readU1();
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            this.languageTag = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            this.translatedKeyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            this.text = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.keyword).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
            this._io.writeU1(this.compressionFlag);
            this._io.writeU1(((Number) (this.compressionMethod.id())).intValue());
            this._io.writeBytes((this.languageTag).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
            this._io.writeBytes((this.translatedKeyword).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
            this._io.writeBytes((this.text).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("text", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.keyword).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("keyword", -1, KaitaiStream.byteArrayIndexOf((this.keyword).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (KaitaiStream.byteArrayIndexOf((this.languageTag).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("language_tag", -1, KaitaiStream.byteArrayIndexOf((this.languageTag).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (KaitaiStream.byteArrayIndexOf((this.translatedKeyword).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("translated_keyword", -1, KaitaiStream.byteArrayIndexOf((this.translatedKeyword).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private String keyword;
        private int compressionFlag;
        private CompressionMethods compressionMethod;
        private String languageTag;
        private String translatedKeyword;
        private String text;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Indicates purpose of the following text data.
         */
        public String keyword() { return keyword; }
        public void setKeyword(String _v) { _dirty = true; keyword = _v; }

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        public int compressionFlag() { return compressionFlag; }
        public void setCompressionFlag(int _v) { _dirty = true; compressionFlag = _v; }
        public CompressionMethods compressionMethod() { return compressionMethod; }
        public void setCompressionMethod(CompressionMethods _v) { _dirty = true; compressionMethod = _v; }

        /**
         * Human language used in `translated_keyword` and `text`
         * attributes - should be a language code conforming to ISO
         * 646.IRV:1991.
         */
        public String languageTag() { return languageTag; }
        public void setLanguageTag(String _v) { _dirty = true; languageTag = _v; }

        /**
         * Keyword translated into language specified in
         * `language_tag`. Line breaks are not allowed.
         */
        public String translatedKeyword() { return translatedKeyword; }
        public void setTranslatedKeyword(String _v) { _dirty = true; translatedKeyword = _v; }

        /**
         * Text contents ("value" of this key-value pair), written in
         * language specified in `language_tag`. Line breaks are
         * allowed.
         */
        public String text() { return text; }
        public void setText(String _v) { _dirty = true; text = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * "Physical size" chunk stores data that allows to translate
     * logical pixels into physical units (meters, etc) and vice-versa.
     * @see <a href="https://www.w3.org/TR/png/#11pHYs">Source</a>
     */
    public static class PhysChunk extends KaitaiStruct.ReadWrite {
        public static PhysChunk fromFile(String fileName) throws IOException {
            return new PhysChunk(new ByteBufferKaitaiStream(fileName));
        }
        public PhysChunk() {
            this(null, null, null);
        }

        public PhysChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PhysChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public PhysChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.pixelsPerUnitX = this._io.readU4be();
            this.pixelsPerUnitY = this._io.readU4be();
            this.unit = Png.PhysUnit.byId(this._io.readU1());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.pixelsPerUnitX);
            this._io.writeU4be(this.pixelsPerUnitY);
            this._io.writeU1(((Number) (this.unit.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private long pixelsPerUnitX;
        private long pixelsPerUnitY;
        private PhysUnit unit;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Number of pixels per physical unit (typically, 1 meter) by X
         * axis.
         */
        public long pixelsPerUnitX() { return pixelsPerUnitX; }
        public void setPixelsPerUnitX(long _v) { _dirty = true; pixelsPerUnitX = _v; }

        /**
         * Number of pixels per physical unit (typically, 1 meter) by Y
         * axis.
         */
        public long pixelsPerUnitY() { return pixelsPerUnitY; }
        public void setPixelsPerUnitY(long _v) { _dirty = true; pixelsPerUnitY = _v; }
        public PhysUnit unit() { return unit; }
        public void setUnit(PhysUnit _v) { _dirty = true; unit = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11PLTE">Source</a>
     */
    public static class PlteChunk extends KaitaiStruct.ReadWrite {
        public static PlteChunk fromFile(String fileName) throws IOException {
            return new PlteChunk(new ByteBufferKaitaiStream(fileName));
        }
        public PlteChunk() {
            this(null, null, null);
        }

        public PlteChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PlteChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public PlteChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Rgb>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Rgb _t_entries = new Rgb(this._io, this, _root);
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
        private List<Rgb> entries;
        private Png _root;
        private Png.Chunk _parent;
        public List<Rgb> entries() { return entries; }
        public void setEntries(List<Rgb> _v) { _dirty = true; entries = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Point extends KaitaiStruct.ReadWrite {
        public static Point fromFile(String fileName) throws IOException {
            return new Point(new ByteBufferKaitaiStream(fileName));
        }
        public Point() {
            this(null, null, null);
        }

        public Point(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Point(KaitaiStream _io, Png.ChrmChunk _parent) {
            this(_io, _parent, null);
        }

        public Point(KaitaiStream _io, Png.ChrmChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.xInt = this._io.readU4be();
            this.yInt = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.xInt);
            this._io.writeU4be(this.yInt);
        }

        public void _check() {
            _dirty = false;
        }
        private Double x;
        public Double x() {
            if (this.x != null)
                return this.x;
            this.x = ((Number) (xInt() / 100000.0)).doubleValue();
            return this.x;
        }
        public void _invalidateX() { this.x = null; }
        private Double y;
        public Double y() {
            if (this.y != null)
                return this.y;
            this.y = ((Number) (yInt() / 100000.0)).doubleValue();
            return this.y;
        }
        public void _invalidateY() { this.y = null; }
        private long xInt;
        private long yInt;
        private Png _root;
        private Png.ChrmChunk _parent;
        public long xInt() { return xInt; }
        public void setXInt(long _v) { _dirty = true; xInt = _v; }
        public long yInt() { return yInt; }
        public void setYInt(long _v) { _dirty = true; yInt = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.ChrmChunk _parent() { return _parent; }
        public void set_parent(Png.ChrmChunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Rgb extends KaitaiStruct.ReadWrite {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
        }
        public Rgb() {
            this(null, null, null);
        }

        public Rgb(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rgb(KaitaiStream _io, Png.PlteChunk _parent) {
            this(_io, _parent, null);
        }

        public Rgb(KaitaiStream _io, Png.PlteChunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.r);
            this._io.writeU1(this.g);
            this._io.writeU1(this.b);
        }

        public void _check() {
            _dirty = false;
        }
        private int r;
        private int g;
        private int b;
        private Png _root;
        private Png.PlteChunk _parent;
        public int r() { return r; }
        public void setR(int _v) { _dirty = true; r = _v; }
        public int g() { return g; }
        public void setG(int _v) { _dirty = true; g = _v; }
        public int b() { return b; }
        public void setB(int _v) { _dirty = true; b = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.PlteChunk _parent() { return _parent; }
        public void set_parent(Png.PlteChunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11sRGB">Source</a>
     */
    public static class SrgbChunk extends KaitaiStruct.ReadWrite {
        public static SrgbChunk fromFile(String fileName) throws IOException {
            return new SrgbChunk(new ByteBufferKaitaiStream(fileName));
        }

        public enum Intent {
            PERCEPTUAL(0),
            RELATIVE_COLORIMETRIC(1),
            SATURATION(2),
            ABSOLUTE_COLORIMETRIC(3);

            private final long id;
            Intent(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Intent> byId = new HashMap<Long, Intent>(4);
            static {
                for (Intent e : Intent.values())
                    byId.put(e.id(), e);
            }
            public static Intent byId(long id) { return byId.get(id); }
        }
        public SrgbChunk() {
            this(null, null, null);
        }

        public SrgbChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SrgbChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public SrgbChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.renderIntent = Intent.byId(this._io.readU1());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.renderIntent.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private Intent renderIntent;
        private Png _root;
        private Png.Chunk _parent;
        public Intent renderIntent() { return renderIntent; }
        public void setRenderIntent(Intent _v) { _dirty = true; renderIntent = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Text chunk effectively allows to store key-value string pairs in
     * PNG container. Both "key" (keyword) and "value" (text) parts are
     * given in pre-defined subset of iso8859-1 without control
     * characters.
     * @see <a href="https://www.w3.org/TR/png/#11tEXt">Source</a>
     */
    public static class TextChunk extends KaitaiStruct.ReadWrite {
        public static TextChunk fromFile(String fileName) throws IOException {
            return new TextChunk(new ByteBufferKaitaiStream(fileName));
        }
        public TextChunk() {
            this(null, null, null);
        }

        public TextChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TextChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public TextChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.ISO_8859_1);
            this.text = new String(this._io.readBytesFull(), StandardCharsets.ISO_8859_1);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.keyword).getBytes(Charset.forName("ISO-8859-1")));
            this._io.writeU1(0);
            this._io.writeBytes((this.text).getBytes(Charset.forName("ISO-8859-1")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("text", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.keyword).getBytes(Charset.forName("ISO-8859-1")), ((byte) 0)) != -1)
                throw new ConsistencyError("keyword", -1, KaitaiStream.byteArrayIndexOf((this.keyword).getBytes(Charset.forName("ISO-8859-1")), ((byte) 0)));
            _dirty = false;
        }
        private String keyword;
        private String text;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Indicates purpose of the following text data.
         */
        public String keyword() { return keyword; }
        public void setKeyword(String _v) { _dirty = true; keyword = _v; }
        public String text() { return text; }
        public void setText(String _v) { _dirty = true; text = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Time chunk stores time stamp of last modification of this image,
     * up to 1 second precision in UTC timezone.
     * @see <a href="https://www.w3.org/TR/png/#11tIME">Source</a>
     */
    public static class TimeChunk extends KaitaiStruct.ReadWrite {
        public static TimeChunk fromFile(String fileName) throws IOException {
            return new TimeChunk(new ByteBufferKaitaiStream(fileName));
        }
        public TimeChunk() {
            this(null, null, null);
        }

        public TimeChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TimeChunk(KaitaiStream _io, Png.Chunk _parent) {
            this(_io, _parent, null);
        }

        public TimeChunk(KaitaiStream _io, Png.Chunk _parent, Png _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.year = this._io.readU2be();
            this.month = this._io.readU1();
            this.day = this._io.readU1();
            this.hour = this._io.readU1();
            this.minute = this._io.readU1();
            this.second = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.year);
            this._io.writeU1(this.month);
            this._io.writeU1(this.day);
            this._io.writeU1(this.hour);
            this._io.writeU1(this.minute);
            this._io.writeU1(this.second);
        }

        public void _check() {
            _dirty = false;
        }
        private int year;
        private int month;
        private int day;
        private int hour;
        private int minute;
        private int second;
        private Png _root;
        private Png.Chunk _parent;
        public int year() { return year; }
        public void setYear(int _v) { _dirty = true; year = _v; }
        public int month() { return month; }
        public void setMonth(int _v) { _dirty = true; month = _v; }
        public int day() { return day; }
        public void setDay(int _v) { _dirty = true; day = _v; }
        public int hour() { return hour; }
        public void setHour(int _v) { _dirty = true; hour = _v; }
        public int minute() { return minute; }
        public void setMinute(int _v) { _dirty = true; minute = _v; }
        public int second() { return second; }
        public void setSecond(int _v) { _dirty = true; second = _v; }
        public Png _root() { return _root; }
        public void set_root(Png _v) { _dirty = true; _root = _v; }
        public Png.Chunk _parent() { return _parent; }
        public void set_parent(Png.Chunk _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private long ihdrLen;
    private byte[] ihdrType;
    private IhdrChunk ihdr;
    private byte[] ihdrCrc;
    private List<Chunk> chunks;
    private Png _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long ihdrLen() { return ihdrLen; }
    public void setIhdrLen(long _v) { _dirty = true; ihdrLen = _v; }
    public byte[] ihdrType() { return ihdrType; }
    public void setIhdrType(byte[] _v) { _dirty = true; ihdrType = _v; }
    public IhdrChunk ihdr() { return ihdr; }
    public void setIhdr(IhdrChunk _v) { _dirty = true; ihdr = _v; }
    public byte[] ihdrCrc() { return ihdrCrc; }
    public void setIhdrCrc(byte[] _v) { _dirty = true; ihdrCrc = _v; }
    public List<Chunk> chunks() { return chunks; }
    public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
    public Png _root() { return _root; }
    public void set_root(Png _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
