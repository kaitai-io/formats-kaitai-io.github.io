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
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * @see <a href="https://developers.google.com/speed/webp/docs/riff_container">Source</a>
 */
public class Webp extends KaitaiStruct.ReadWrite {
    public static Webp fromFile(String fileName) throws IOException {
        return new Webp(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChunkNames {
        XMP_VAR(5262680),
        VP8(540561494),
        XMP(542133592),
        EXIF(1179211845),
        ANMF(1179471425),
        ALPH(1213221953),
        VP8L(1278758998),
        FRGM(1296519750),
        ANIM(1296649793),
        ICCP(1346585417),
        VP8X(1480085590);

        private final long id;
        ChunkNames(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChunkNames> byId = new HashMap<Long, ChunkNames>(11);
        static {
            for (ChunkNames e : ChunkNames.values())
                byId.put(e.id(), e);
        }
        public static ChunkNames byId(long id) { return byId.get(id); }
    }

    public enum CompressionMethod {
        NONE(0),
        WEBP_LOSSLESS(1);

        private final long id;
        CompressionMethod(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionMethod> byId = new HashMap<Long, CompressionMethod>(2);
        static {
            for (CompressionMethod e : CompressionMethod.values())
                byId.put(e.id(), e);
        }
        public static CompressionMethod byId(long id) { return byId.get(id); }
    }

    public enum FilteringMethod {
        NONE(0),
        HORIZONTAL(1),
        VERTICAL(2),
        GRADIENT(3);

        private final long id;
        FilteringMethod(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, FilteringMethod> byId = new HashMap<Long, FilteringMethod>(4);
        static {
            for (FilteringMethod e : FilteringMethod.values())
                byId.put(e.id(), e);
        }
        public static FilteringMethod byId(long id) { return byId.get(id); }
    }

    public enum Preprocessing {
        NONE(0),
        LEVEL_REDUCTION(1);

        private final long id;
        Preprocessing(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Preprocessing> byId = new HashMap<Long, Preprocessing>(2);
        static {
            for (Preprocessing e : Preprocessing.values())
                byId.put(e.id(), e);
        }
        public static Preprocessing byId(long id) { return byId.get(id); }
    }
    public Webp() {
        this(null, null, null);
    }

    public Webp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Webp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Webp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Webp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 82, 73, 70, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, this.magic, this._io, "/seq/0");
        }
        this.lenData = this._io.readU4le();
        this.webp = this._io.readBytes(4);
        if (!(Arrays.equals(this.webp, new byte[] { 87, 69, 66, 80 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 69, 66, 80 }, this.webp, this._io, "/seq/2");
        }
        this._raw_payload = this._io.readBytes(lenData() - 4);
        KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
        this.payload = new Chunks(_io__raw_payload, this, _root);
        this.payload._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.payload._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.lenData);
        this._io.writeBytes(this.webp);
        final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(lenData() - 4);
        this._io.addChildStream(_io__raw_payload);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenData() - 4));
            final Webp _this = this;
            _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_payload = _io__raw_payload.toByteArray();
                    if (_this._raw_payload.length != lenData() - 4)
                        throw new ConsistencyError("raw(payload)", lenData() - 4, _this._raw_payload.length);
                    parent.writeBytes(_this._raw_payload);
                }
            });
        }
        this.payload._write_Seq(_io__raw_payload);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 82, 73, 70, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, this.magic, null, "/seq/0");
        }
        if (this.webp.length != 4)
            throw new ConsistencyError("webp", 4, this.webp.length);
        if (!(Arrays.equals(this.webp, new byte[] { 87, 69, 66, 80 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 69, 66, 80 }, this.webp, null, "/seq/2");
        }
        if (!Objects.equals(this.payload._root(), _root()))
            throw new ConsistencyError("payload", _root(), this.payload._root());
        if (!Objects.equals(this.payload._parent(), this))
            throw new ConsistencyError("payload", this, this.payload._parent());
        _dirty = false;
    }
    public static class Alph extends KaitaiStruct.ReadWrite {
        public static Alph fromFile(String fileName) throws IOException {
            return new Alph(new ByteBufferKaitaiStream(fileName));
        }
        public Alph() {
            this(null, null, null);
        }

        public Alph(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alph(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Alph(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved = this._io.readBitsIntBe(2);
            if (!(this.reserved == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, this._io, "/types/alph/seq/0");
            }
            this.preprocessing = Webp.Preprocessing.byId(this._io.readBitsIntBe(2));
            if (this.preprocessing == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.preprocessing, this._io, "/types/alph/seq/1");
            }
            this.filtering = Webp.FilteringMethod.byId(this._io.readBitsIntBe(2));
            this.compression = Webp.CompressionMethod.byId(this._io.readBitsIntBe(2));
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, this._io, "/types/alph/seq/3");
            }
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(2, this.reserved);
            this._io.writeBitsIntBe(2, ((Number) (this.preprocessing.id())).longValue());
            this._io.writeBitsIntBe(2, ((Number) (this.filtering.id())).longValue());
            this._io.writeBitsIntBe(2, ((Number) (this.compression.id())).longValue());
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!(this.reserved == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, null, "/types/alph/seq/0");
            }
            if (this.preprocessing == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.preprocessing, null, "/types/alph/seq/1");
            }
            if (this.compression == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.compression, null, "/types/alph/seq/3");
            }
            _dirty = false;
        }
        private long reserved;
        private Preprocessing preprocessing;
        private FilteringMethod filtering;
        private CompressionMethod compression;
        private byte[] data;
        private Webp _root;
        private Webp.Chunk _parent;
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public Preprocessing preprocessing() { return preprocessing; }
        public void setPreprocessing(Preprocessing _v) { _dirty = true; preprocessing = _v; }
        public FilteringMethod filtering() { return filtering; }
        public void setFiltering(FilteringMethod _v) { _dirty = true; filtering = _v; }
        public CompressionMethod compression() { return compression; }
        public void setCompression(CompressionMethod _v) { _dirty = true; compression = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://developers.google.com/speed/webp/docs/riff_container#animation">Source</a>
     */
    public static class Anim extends KaitaiStruct.ReadWrite {
        public static Anim fromFile(String fileName) throws IOException {
            return new Anim(new ByteBufferKaitaiStream(fileName));
        }
        public Anim() {
            this(null, null, null);
        }

        public Anim(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Anim(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Anim(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.backgroundColor = new BgColor(this._io, this, _root);
            this.backgroundColor._read();
            this.loopCount = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.backgroundColor._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.backgroundColor._write_Seq(this._io);
            this._io.writeU2le(this.loopCount);
        }

        public void _check() {
            if (!Objects.equals(this.backgroundColor._root(), _root()))
                throw new ConsistencyError("background_color", _root(), this.backgroundColor._root());
            if (!Objects.equals(this.backgroundColor._parent(), this))
                throw new ConsistencyError("background_color", this, this.backgroundColor._parent());
            _dirty = false;
        }
        public static class BgColor extends KaitaiStruct.ReadWrite {
            public static BgColor fromFile(String fileName) throws IOException {
                return new BgColor(new ByteBufferKaitaiStream(fileName));
            }
            public BgColor() {
                this(null, null, null);
            }

            public BgColor(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BgColor(KaitaiStream _io, Webp.Anim _parent) {
                this(_io, _parent, null);
            }

            public BgColor(KaitaiStream _io, Webp.Anim _parent, Webp _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.blue = this._io.readU1();
                this.green = this._io.readU1();
                this.red = this._io.readU1();
                this.alpha = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.blue);
                this._io.writeU1(this.green);
                this._io.writeU1(this.red);
                this._io.writeU1(this.alpha);
            }

            public void _check() {
                _dirty = false;
            }
            private int blue;
            private int green;
            private int red;
            private int alpha;
            private Webp _root;
            private Webp.Anim _parent;
            public int blue() { return blue; }
            public void setBlue(int _v) { _dirty = true; blue = _v; }
            public int green() { return green; }
            public void setGreen(int _v) { _dirty = true; green = _v; }
            public int red() { return red; }
            public void setRed(int _v) { _dirty = true; red = _v; }
            public int alpha() { return alpha; }
            public void setAlpha(int _v) { _dirty = true; alpha = _v; }
            public Webp _root() { return _root; }
            public void set_root(Webp _v) { _dirty = true; _root = _v; }
            public Webp.Anim _parent() { return _parent; }
            public void set_parent(Webp.Anim _v) { _dirty = true; _parent = _v; }
        }
        private BgColor backgroundColor;
        private int loopCount;
        private Webp _root;
        private Webp.Chunk _parent;
        public BgColor backgroundColor() { return backgroundColor; }
        public void setBackgroundColor(BgColor _v) { _dirty = true; backgroundColor = _v; }
        public int loopCount() { return loopCount; }
        public void setLoopCount(int _v) { _dirty = true; loopCount = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Anmf extends KaitaiStruct.ReadWrite {
        public static Anmf fromFile(String fileName) throws IOException {
            return new Anmf(new ByteBufferKaitaiStream(fileName));
        }
        public Anmf() {
            this(null, null, null);
        }

        public Anmf(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Anmf(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Anmf(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.frameXDiv2 = this._io.readBitsIntLe(24);
            this.frameYDiv2 = this._io.readBitsIntLe(24);
            this.frameWidthMinus1 = this._io.readBitsIntLe(24);
            this.frameHeightMinus1 = this._io.readBitsIntLe(24);
            this.duration = this._io.readBitsIntLe(24);
            this.reserved = this._io.readBitsIntBe(6);
            if (!(this.reserved == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, this._io, "/types/anmf/seq/5");
            }
            this.blendingMethod = this._io.readBitsIntBe(1) != 0;
            this.disposalMethod = this._io.readBitsIntBe(1) != 0;
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntLe(24, this.frameXDiv2);
            this._io.writeBitsIntLe(24, this.frameYDiv2);
            this._io.writeBitsIntLe(24, this.frameWidthMinus1);
            this._io.writeBitsIntLe(24, this.frameHeightMinus1);
            this._io.writeBitsIntLe(24, this.duration);
            this._io.writeBitsIntBe(6, this.reserved);
            this._io.writeBitsIntBe(1, (this.blendingMethod ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.disposalMethod ? 1 : 0));
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!(this.reserved == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved, null, "/types/anmf/seq/5");
            }
            _dirty = false;
        }
        private Integer frameHeight;
        public Integer frameHeight() {
            if (this.frameHeight != null)
                return this.frameHeight;
            this.frameHeight = ((Number) (frameHeightMinus1() + 1)).intValue();
            return this.frameHeight;
        }
        public void _invalidateFrameHeight() { this.frameHeight = null; }
        private Integer frameWidth;
        public Integer frameWidth() {
            if (this.frameWidth != null)
                return this.frameWidth;
            this.frameWidth = ((Number) (frameWidthMinus1() + 1)).intValue();
            return this.frameWidth;
        }
        public void _invalidateFrameWidth() { this.frameWidth = null; }
        private Integer frameX;
        public Integer frameX() {
            if (this.frameX != null)
                return this.frameX;
            this.frameX = ((Number) (frameXDiv2() * 2)).intValue();
            return this.frameX;
        }
        public void _invalidateFrameX() { this.frameX = null; }
        private Integer frameY;
        public Integer frameY() {
            if (this.frameY != null)
                return this.frameY;
            this.frameY = ((Number) (frameYDiv2() * 2)).intValue();
            return this.frameY;
        }
        public void _invalidateFrameY() { this.frameY = null; }
        private long frameXDiv2;
        private long frameYDiv2;
        private long frameWidthMinus1;
        private long frameHeightMinus1;
        private long duration;
        private long reserved;
        private boolean blendingMethod;
        private boolean disposalMethod;
        private byte[] data;
        private Webp _root;
        private Webp.Chunk _parent;
        public long frameXDiv2() { return frameXDiv2; }
        public void setFrameXDiv2(long _v) { _dirty = true; frameXDiv2 = _v; }
        public long frameYDiv2() { return frameYDiv2; }
        public void setFrameYDiv2(long _v) { _dirty = true; frameYDiv2 = _v; }
        public long frameWidthMinus1() { return frameWidthMinus1; }
        public void setFrameWidthMinus1(long _v) { _dirty = true; frameWidthMinus1 = _v; }
        public long frameHeightMinus1() { return frameHeightMinus1; }
        public void setFrameHeightMinus1(long _v) { _dirty = true; frameHeightMinus1 = _v; }
        public long duration() { return duration; }
        public void setDuration(long _v) { _dirty = true; duration = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public boolean blendingMethod() { return blendingMethod; }
        public void setBlendingMethod(boolean _v) { _dirty = true; blendingMethod = _v; }
        public boolean disposalMethod() { return disposalMethod; }
        public void setDisposalMethod(boolean _v) { _dirty = true; disposalMethod = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
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

        public Chunk(KaitaiStream _io, Webp.Chunks _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Webp.Chunks _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = Webp.ChunkNames.byId(this._io.readU4le());
            if (this.name == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.name, this._io, "/types/chunk/seq/0");
            }
            this.lenData = this._io.readU4le();
            {
                ChunkNames on = name();
                if (on != null) {
                    switch (name()) {
                    case ALPH: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Alph(_io__raw_data, this, _root);
                        ((Alph) (this.data))._read();
                        break;
                    }
                    case ANIM: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Anim(_io__raw_data, this, _root);
                        ((Anim) (this.data))._read();
                        break;
                    }
                    case ANMF: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Anmf(_io__raw_data, this, _root);
                        ((Anmf) (this.data))._read();
                        break;
                    }
                    case VP8: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Vp8(_io__raw_data, this, _root);
                        ((Vp8) (this.data))._read();
                        break;
                    }
                    case VP8L: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Vp8l(_io__raw_data, this, _root);
                        ((Vp8l) (this.data))._read();
                        break;
                    }
                    case VP8X: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Vp8x(_io__raw_data, this, _root);
                        ((Vp8x) (this.data))._read();
                        break;
                    }
                    case XMP: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Xmp(_io__raw_data, this, _root);
                        ((Xmp) (this.data))._read();
                        break;
                    }
                    case XMP_VAR: {
                        this._raw_data = this._io.readBytes(lenData());
                        KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                        this.data = new Xmp(_io__raw_data, this, _root);
                        ((Xmp) (this.data))._read();
                        break;
                    }
                    default: {
                        this.data = this._io.readBytes(lenData());
                        break;
                    }
                    }
                } else {
                    this.data = this._io.readBytes(lenData());
                }
            }
            if (KaitaiStream.mod(lenData(), 2) != 0) {
                this.padding = this._io.readBytes(1);
                if (!(Arrays.equals(this.padding, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding, this._io, "/types/chunk/seq/3");
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ChunkNames on = name();
                if (on != null) {
                    switch (name()) {
                    case ALPH: {
                        ((Alph) (this.data))._fetchInstances();
                        break;
                    }
                    case ANIM: {
                        ((Anim) (this.data))._fetchInstances();
                        break;
                    }
                    case ANMF: {
                        ((Anmf) (this.data))._fetchInstances();
                        break;
                    }
                    case VP8: {
                        ((Vp8) (this.data))._fetchInstances();
                        break;
                    }
                    case VP8L: {
                        ((Vp8l) (this.data))._fetchInstances();
                        break;
                    }
                    case VP8X: {
                        ((Vp8x) (this.data))._fetchInstances();
                        break;
                    }
                    case XMP: {
                        ((Xmp) (this.data))._fetchInstances();
                        break;
                    }
                    case XMP_VAR: {
                        ((Xmp) (this.data))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
            if (KaitaiStream.mod(lenData(), 2) != 0) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(((Number) (this.name.id())).longValue());
            this._io.writeU4le(this.lenData);
            {
                ChunkNames on = name();
                if (on != null) {
                    switch (name()) {
                    case ALPH: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Alph) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case ANIM: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Anim) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case ANMF: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Anmf) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case VP8: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Vp8) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case VP8L: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Vp8l) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case VP8X: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Vp8x) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case XMP: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Xmp) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    case XMP_VAR: {
                        final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData());
                        this._io.addChildStream(_io__raw_data);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenData()));
                            final Chunk _this = this;
                            _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_data = _io__raw_data.toByteArray();
                                    if (((byte[]) (_this._raw_data)).length != lenData())
                                        throw new ConsistencyError("raw(data)", lenData(), ((byte[]) (_this._raw_data)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                }
                            });
                        }
                        ((Xmp) (this.data))._write_Seq(_io__raw_data);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                }
            }
            if (KaitaiStream.mod(lenData(), 2) != 0) {
                this._io.writeBytes(this.padding);
            }
        }

        public void _check() {
            if (this.name == null) {
                throw new KaitaiStream.ValidationNotInEnumError(this.name, null, "/types/chunk/seq/0");
            }
            {
                ChunkNames on = name();
                if (on != null) {
                    switch (name()) {
                    case ALPH: {
                        if (!Objects.equals(((Webp.Alph) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Alph) (this.data))._root());
                        if (!Objects.equals(((Webp.Alph) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Alph) (this.data))._parent());
                        break;
                    }
                    case ANIM: {
                        if (!Objects.equals(((Webp.Anim) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Anim) (this.data))._root());
                        if (!Objects.equals(((Webp.Anim) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Anim) (this.data))._parent());
                        break;
                    }
                    case ANMF: {
                        if (!Objects.equals(((Webp.Anmf) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Anmf) (this.data))._root());
                        if (!Objects.equals(((Webp.Anmf) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Anmf) (this.data))._parent());
                        break;
                    }
                    case VP8: {
                        if (!Objects.equals(((Webp.Vp8) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Vp8) (this.data))._root());
                        if (!Objects.equals(((Webp.Vp8) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Vp8) (this.data))._parent());
                        break;
                    }
                    case VP8L: {
                        if (!Objects.equals(((Webp.Vp8l) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Vp8l) (this.data))._root());
                        if (!Objects.equals(((Webp.Vp8l) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Vp8l) (this.data))._parent());
                        break;
                    }
                    case VP8X: {
                        if (!Objects.equals(((Webp.Vp8x) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Vp8x) (this.data))._root());
                        if (!Objects.equals(((Webp.Vp8x) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Vp8x) (this.data))._parent());
                        break;
                    }
                    case XMP: {
                        if (!Objects.equals(((Webp.Xmp) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Xmp) (this.data))._root());
                        if (!Objects.equals(((Webp.Xmp) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Xmp) (this.data))._parent());
                        break;
                    }
                    case XMP_VAR: {
                        if (!Objects.equals(((Webp.Xmp) (this.data))._root(), _root()))
                            throw new ConsistencyError("data", _root(), ((Webp.Xmp) (this.data))._root());
                        if (!Objects.equals(((Webp.Xmp) (this.data))._parent(), this))
                            throw new ConsistencyError("data", this, ((Webp.Xmp) (this.data))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.data)).length != lenData())
                            throw new ConsistencyError("data", lenData(), ((byte[]) (this.data)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.data)).length != lenData())
                        throw new ConsistencyError("data", lenData(), ((byte[]) (this.data)).length);
                }
            }
            if (KaitaiStream.mod(lenData(), 2) != 0) {
                if (this.padding.length != 1)
                    throw new ConsistencyError("padding", 1, this.padding.length);
                if (!(Arrays.equals(this.padding, new byte[] { 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding, null, "/types/chunk/seq/3");
                }
            }
            _dirty = false;
        }
        private ChunkNames name;
        private long lenData;
        private Object data;
        private byte[] padding;
        private Webp _root;
        private Webp.Chunks _parent;
        private byte[] _raw_data;
        public ChunkNames name() { return name; }
        public void setName(ChunkNames _v) { _dirty = true; name = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public Object data() { return data; }
        public void setData(Object _v) { _dirty = true; data = _v; }
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunks _parent() { return _parent; }
        public void set_parent(Webp.Chunks _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class Chunks extends KaitaiStruct.ReadWrite {
        public static Chunks fromFile(String fileName) throws IOException {
            return new Chunks(new ByteBufferKaitaiStream(fileName));
        }
        public Chunks() {
            this(null, null, null);
        }

        public Chunks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunks(KaitaiStream _io, Webp _parent) {
            this(_io, _parent, null);
        }

        public Chunks(KaitaiStream _io, Webp _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chunks = new ArrayList<Chunk>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Chunk _t_chunks = new Chunk(this._io, this, _root);
                    try {
                        _t_chunks._read();
                    } finally {
                        this.chunks.add(_t_chunks);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.chunks.size(); i++) {
                this.chunks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.chunks.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("chunks", 0, this._io.size() - this._io.pos());
                this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("chunks", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.chunks.size(); i++) {
                if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Chunk> chunks;
        private Webp _root;
        private Webp _parent;
        public List<Chunk> chunks() { return chunks; }
        public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp _parent() { return _parent; }
        public void set_parent(Webp _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.rfc-editor.org/rfc/rfc6386#section-9.1">Source</a>
     */
    public static class Vp8 extends KaitaiStruct.ReadWrite {
        public static Vp8 fromFile(String fileName) throws IOException {
            return new Vp8(new ByteBufferKaitaiStream(fileName));
        }
        public Vp8() {
            this(null, null, null);
        }

        public Vp8(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vp8(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Vp8(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.frameType = this._io.readBitsIntLe(1) != 0;
            if (!(this.frameType == false)) {
                throw new KaitaiStream.ValidationNotEqualError(false, this.frameType, this._io, "/types/vp8/seq/0");
            }
            this.version = this._io.readBitsIntLe(3);
            if (!(this.version <= 3)) {
                throw new KaitaiStream.ValidationGreaterThanError(3, this.version, this._io, "/types/vp8/seq/1");
            }
            this.showFrame = this._io.readBitsIntLe(1) != 0;
            this.lenFirstPartition = this._io.readBitsIntLe(19);
            this.startCode = this._io.readBytes(3);
            if (!(Arrays.equals(this.startCode, new byte[] { -99, 1, 42 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -99, 1, 42 }, this.startCode, this._io, "/types/vp8/seq/4");
            }
            this.width = this._io.readBitsIntLe(14);
            this.horizontalScale = this._io.readBitsIntLe(2);
            this.height = this._io.readBitsIntLe(14);
            this.verticalScale = this._io.readBitsIntLe(2);
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntLe(1, (this.frameType ? 1 : 0));
            this._io.writeBitsIntLe(3, this.version);
            this._io.writeBitsIntLe(1, (this.showFrame ? 1 : 0));
            this._io.writeBitsIntLe(19, this.lenFirstPartition);
            this._io.writeBytes(this.startCode);
            this._io.writeBitsIntLe(14, this.width);
            this._io.writeBitsIntLe(2, this.horizontalScale);
            this._io.writeBitsIntLe(14, this.height);
            this._io.writeBitsIntLe(2, this.verticalScale);
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!(this.frameType == false)) {
                throw new KaitaiStream.ValidationNotEqualError(false, this.frameType, null, "/types/vp8/seq/0");
            }
            if (!(this.version <= 3)) {
                throw new KaitaiStream.ValidationGreaterThanError(3, this.version, null, "/types/vp8/seq/1");
            }
            if (this.startCode.length != 3)
                throw new ConsistencyError("start_code", 3, this.startCode.length);
            if (!(Arrays.equals(this.startCode, new byte[] { -99, 1, 42 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -99, 1, 42 }, this.startCode, null, "/types/vp8/seq/4");
            }
            _dirty = false;
        }
        private boolean frameType;
        private long version;
        private boolean showFrame;
        private long lenFirstPartition;
        private byte[] startCode;
        private long width;
        private long horizontalScale;
        private long height;
        private long verticalScale;
        private byte[] data;
        private Webp _root;
        private Webp.Chunk _parent;
        public boolean frameType() { return frameType; }
        public void setFrameType(boolean _v) { _dirty = true; frameType = _v; }
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public boolean showFrame() { return showFrame; }
        public void setShowFrame(boolean _v) { _dirty = true; showFrame = _v; }
        public long lenFirstPartition() { return lenFirstPartition; }
        public void setLenFirstPartition(long _v) { _dirty = true; lenFirstPartition = _v; }
        public byte[] startCode() { return startCode; }
        public void setStartCode(byte[] _v) { _dirty = true; startCode = _v; }
        public long width() { return width; }
        public void setWidth(long _v) { _dirty = true; width = _v; }
        public long horizontalScale() { return horizontalScale; }
        public void setHorizontalScale(long _v) { _dirty = true; horizontalScale = _v; }
        public long height() { return height; }
        public void setHeight(long _v) { _dirty = true; height = _v; }
        public long verticalScale() { return verticalScale; }
        public void setVerticalScale(long _v) { _dirty = true; verticalScale = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification">Source</a>
     */
    public static class Vp8l extends KaitaiStruct.ReadWrite {
        public static Vp8l fromFile(String fileName) throws IOException {
            return new Vp8l(new ByteBufferKaitaiStream(fileName));
        }
        public Vp8l() {
            this(null, null, null);
        }

        public Vp8l(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vp8l(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Vp8l(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signature = this._io.readU1();
            if (!(this.signature == 47)) {
                throw new KaitaiStream.ValidationNotEqualError(47, this.signature, this._io, "/types/vp8l/seq/0");
            }
            this.imageWidthMinus1 = this._io.readBitsIntLe(14);
            this.imageHeightMinus1 = this._io.readBitsIntLe(14);
            this.alphaIsUsed = this._io.readBitsIntLe(1) != 0;
            this.versionNumber = this._io.readBitsIntLe(3);
            if (!(this.versionNumber == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.versionNumber, this._io, "/types/vp8l/seq/4");
            }
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.signature);
            this._io.writeBitsIntLe(14, this.imageWidthMinus1);
            this._io.writeBitsIntLe(14, this.imageHeightMinus1);
            this._io.writeBitsIntLe(1, (this.alphaIsUsed ? 1 : 0));
            this._io.writeBitsIntLe(3, this.versionNumber);
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!(this.signature == 47)) {
                throw new KaitaiStream.ValidationNotEqualError(47, this.signature, null, "/types/vp8l/seq/0");
            }
            if (!(this.versionNumber == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.versionNumber, null, "/types/vp8l/seq/4");
            }
            _dirty = false;
        }
        private Integer imageHeight;
        public Integer imageHeight() {
            if (this.imageHeight != null)
                return this.imageHeight;
            this.imageHeight = ((Number) (imageHeightMinus1() + 1)).intValue();
            return this.imageHeight;
        }
        public void _invalidateImageHeight() { this.imageHeight = null; }
        private Integer imageWidth;
        public Integer imageWidth() {
            if (this.imageWidth != null)
                return this.imageWidth;
            this.imageWidth = ((Number) (imageWidthMinus1() + 1)).intValue();
            return this.imageWidth;
        }
        public void _invalidateImageWidth() { this.imageWidth = null; }
        private int signature;
        private long imageWidthMinus1;
        private long imageHeightMinus1;
        private boolean alphaIsUsed;
        private long versionNumber;
        private byte[] data;
        private Webp _root;
        private Webp.Chunk _parent;
        public int signature() { return signature; }
        public void setSignature(int _v) { _dirty = true; signature = _v; }
        public long imageWidthMinus1() { return imageWidthMinus1; }
        public void setImageWidthMinus1(long _v) { _dirty = true; imageWidthMinus1 = _v; }
        public long imageHeightMinus1() { return imageHeightMinus1; }
        public void setImageHeightMinus1(long _v) { _dirty = true; imageHeightMinus1 = _v; }

        /**
         * A hint only - it should not impact decoding. It should be `false` when
         * all alpha values are 255 in the picture, and `true` otherwise.
         */
        public boolean alphaIsUsed() { return alphaIsUsed; }
        public void setAlphaIsUsed(boolean _v) { _dirty = true; alphaIsUsed = _v; }
        public long versionNumber() { return versionNumber; }
        public void setVersionNumber(long _v) { _dirty = true; versionNumber = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Vp8x extends KaitaiStruct.ReadWrite {
        public static Vp8x fromFile(String fileName) throws IOException {
            return new Vp8x(new ByteBufferKaitaiStream(fileName));
        }
        public Vp8x() {
            this(null, null, null);
        }

        public Vp8x(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Vp8x(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Vp8x(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved1 = this._io.readBitsIntBe(2);
            if (!(this.reserved1 == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved1, this._io, "/types/vp8x/seq/0");
            }
            this.iccProfile = this._io.readBitsIntBe(1) != 0;
            this.alpha = this._io.readBitsIntBe(1) != 0;
            this.exif = this._io.readBitsIntBe(1) != 0;
            this.xmp = this._io.readBitsIntBe(1) != 0;
            this.animation = this._io.readBitsIntBe(1) != 0;
            this.reserved2 = this._io.readBitsIntBe(1) != 0;
            if (!(this.reserved2 == false)) {
                throw new KaitaiStream.ValidationNotEqualError(false, this.reserved2, this._io, "/types/vp8x/seq/6");
            }
            this.reserved3 = this._io.readBitsIntBe(24);
            if (!(this.reserved3 == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved3, this._io, "/types/vp8x/seq/7");
            }
            this.canvasWidthMinus1 = this._io.readBitsIntLe(24);
            this.canvasHeightMinus1 = this._io.readBitsIntLe(24);
            if (!(this.canvasHeightMinus1 <= 4294967295L / canvasWidth() - 1)) {
                throw new KaitaiStream.ValidationGreaterThanError(4294967295L / canvasWidth() - 1, this.canvasHeightMinus1, this._io, "/types/vp8x/seq/9");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(2, this.reserved1);
            this._io.writeBitsIntBe(1, (this.iccProfile ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.alpha ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.exif ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.xmp ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.animation ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.reserved2 ? 1 : 0));
            this._io.writeBitsIntBe(24, this.reserved3);
            this._io.writeBitsIntLe(24, this.canvasWidthMinus1);
            this._io.writeBitsIntLe(24, this.canvasHeightMinus1);
        }

        public void _check() {
            if (!(this.reserved1 == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved1, null, "/types/vp8x/seq/0");
            }
            if (!(this.reserved2 == false)) {
                throw new KaitaiStream.ValidationNotEqualError(false, this.reserved2, null, "/types/vp8x/seq/6");
            }
            if (!(this.reserved3 == 0)) {
                throw new KaitaiStream.ValidationNotEqualError(0, this.reserved3, null, "/types/vp8x/seq/7");
            }
            if (!(this.canvasHeightMinus1 <= 4294967295L / canvasWidth() - 1)) {
                throw new KaitaiStream.ValidationGreaterThanError(4294967295L / canvasWidth() - 1, this.canvasHeightMinus1, null, "/types/vp8x/seq/9");
            }
            _dirty = false;
        }
        private Integer canvasHeight;
        public Integer canvasHeight() {
            if (this.canvasHeight != null)
                return this.canvasHeight;
            this.canvasHeight = ((Number) (canvasHeightMinus1() + 1)).intValue();
            return this.canvasHeight;
        }
        public void _invalidateCanvasHeight() { this.canvasHeight = null; }
        private Integer canvasWidth;
        public Integer canvasWidth() {
            if (this.canvasWidth != null)
                return this.canvasWidth;
            this.canvasWidth = ((Number) (canvasWidthMinus1() + 1)).intValue();
            return this.canvasWidth;
        }
        public void _invalidateCanvasWidth() { this.canvasWidth = null; }
        private long reserved1;
        private boolean iccProfile;
        private boolean alpha;
        private boolean exif;
        private boolean xmp;
        private boolean animation;
        private boolean reserved2;
        private long reserved3;
        private long canvasWidthMinus1;
        private long canvasHeightMinus1;
        private Webp _root;
        private Webp.Chunk _parent;
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
        public boolean iccProfile() { return iccProfile; }
        public void setIccProfile(boolean _v) { _dirty = true; iccProfile = _v; }
        public boolean alpha() { return alpha; }
        public void setAlpha(boolean _v) { _dirty = true; alpha = _v; }
        public boolean exif() { return exif; }
        public void setExif(boolean _v) { _dirty = true; exif = _v; }
        public boolean xmp() { return xmp; }
        public void setXmp(boolean _v) { _dirty = true; xmp = _v; }
        public boolean animation() { return animation; }
        public void setAnimation(boolean _v) { _dirty = true; animation = _v; }
        public boolean reserved2() { return reserved2; }
        public void setReserved2(boolean _v) { _dirty = true; reserved2 = _v; }
        public long reserved3() { return reserved3; }
        public void setReserved3(long _v) { _dirty = true; reserved3 = _v; }
        public long canvasWidthMinus1() { return canvasWidthMinus1; }
        public void setCanvasWidthMinus1(long _v) { _dirty = true; canvasWidthMinus1 = _v; }
        public long canvasHeightMinus1() { return canvasHeightMinus1; }
        public void setCanvasHeightMinus1(long _v) { _dirty = true; canvasHeightMinus1 = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
    }
    public static class Xmp extends KaitaiStruct.ReadWrite {
        public static Xmp fromFile(String fileName) throws IOException {
            return new Xmp(new ByteBufferKaitaiStream(fileName));
        }
        public Xmp() {
            this(null, null, null);
        }

        public Xmp(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Xmp(KaitaiStream _io, Webp.Chunk _parent) {
            this(_io, _parent, null);
        }

        public Xmp(KaitaiStream _io, Webp.Chunk _parent, Webp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.data = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.data).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String data;
        private Webp _root;
        private Webp.Chunk _parent;
        public String data() { return data; }
        public void setData(String _v) { _dirty = true; data = _v; }
        public Webp _root() { return _root; }
        public void set_root(Webp _v) { _dirty = true; _root = _v; }
        public Webp.Chunk _parent() { return _parent; }
        public void set_parent(Webp.Chunk _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private long lenData;
    private byte[] webp;
    private Chunks payload;
    private Webp _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_payload;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long lenData() { return lenData; }
    public void setLenData(long _v) { _dirty = true; lenData = _v; }
    public byte[] webp() { return webp; }
    public void setWebp(byte[] _v) { _dirty = true; webp = _v; }
    public Chunks payload() { return payload; }
    public void setPayload(Chunks _v) { _dirty = true; payload = _v; }
    public Webp _root() { return _root; }
    public void set_root(Webp _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_payload() { return _raw_payload; }
    public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
}
