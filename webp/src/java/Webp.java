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
import java.nio.charset.StandardCharsets;


/**
 * @see <a href="https://developers.google.com/speed/webp/docs/riff_container">Source</a>
 */
public class Webp extends KaitaiStruct {
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

    public Webp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Webp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Webp(KaitaiStream _io, KaitaiStruct _parent, Webp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 82, 73, 70, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 73, 70, 70 }, this.magic, this._io, "/seq/0");
        }
        this.lenData = this._io.readU4le();
        this.webp = this._io.readBytes(4);
        if (!(Arrays.equals(this.webp, new byte[] { 87, 69, 66, 80 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 69, 66, 80 }, this.webp, this._io, "/seq/2");
        }
        KaitaiStream _io_payload = this._io.substream(lenData() - 4);
        this.payload = new Chunks(_io_payload, this, _root);
    }

    public void _fetchInstances() {
        this.payload._fetchInstances();
    }
    public static class Alph extends KaitaiStruct {
        public static Alph fromFile(String fileName) throws IOException {
            return new Alph(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
        }
        private long reserved;
        private Preprocessing preprocessing;
        private FilteringMethod filtering;
        private CompressionMethod compression;
        private byte[] data;
        private Webp _root;
        private Webp.Chunk _parent;
        public long reserved() { return reserved; }
        public Preprocessing preprocessing() { return preprocessing; }
        public FilteringMethod filtering() { return filtering; }
        public CompressionMethod compression() { return compression; }
        public byte[] data() { return data; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://developers.google.com/speed/webp/docs/riff_container#animation">Source</a>
     */
    public static class Anim extends KaitaiStruct {
        public static Anim fromFile(String fileName) throws IOException {
            return new Anim(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.backgroundColor = new BgColor(this._io, this, _root);
            this.loopCount = this._io.readU2le();
        }

        public void _fetchInstances() {
            this.backgroundColor._fetchInstances();
        }
        public static class BgColor extends KaitaiStruct {
            public static BgColor fromFile(String fileName) throws IOException {
                return new BgColor(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.blue = this._io.readU1();
                this.green = this._io.readU1();
                this.red = this._io.readU1();
                this.alpha = this._io.readU1();
            }

            public void _fetchInstances() {
            }
            private int blue;
            private int green;
            private int red;
            private int alpha;
            private Webp _root;
            private Webp.Anim _parent;
            public int blue() { return blue; }
            public int green() { return green; }
            public int red() { return red; }
            public int alpha() { return alpha; }
            public Webp _root() { return _root; }
            public Webp.Anim _parent() { return _parent; }
        }
        private BgColor backgroundColor;
        private int loopCount;
        private Webp _root;
        private Webp.Chunk _parent;
        public BgColor backgroundColor() { return backgroundColor; }
        public int loopCount() { return loopCount; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }
    public static class Anmf extends KaitaiStruct {
        public static Anmf fromFile(String fileName) throws IOException {
            return new Anmf(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
        }
        private Integer frameHeight;
        public Integer frameHeight() {
            if (this.frameHeight != null)
                return this.frameHeight;
            this.frameHeight = ((Number) (frameHeightMinus1() + 1)).intValue();
            return this.frameHeight;
        }
        private Integer frameWidth;
        public Integer frameWidth() {
            if (this.frameWidth != null)
                return this.frameWidth;
            this.frameWidth = ((Number) (frameWidthMinus1() + 1)).intValue();
            return this.frameWidth;
        }
        private Integer frameX;
        public Integer frameX() {
            if (this.frameX != null)
                return this.frameX;
            this.frameX = ((Number) (frameXDiv2() * 2)).intValue();
            return this.frameX;
        }
        private Integer frameY;
        public Integer frameY() {
            if (this.frameY != null)
                return this.frameY;
            this.frameY = ((Number) (frameYDiv2() * 2)).intValue();
            return this.frameY;
        }
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
        public long frameYDiv2() { return frameYDiv2; }
        public long frameWidthMinus1() { return frameWidthMinus1; }
        public long frameHeightMinus1() { return frameHeightMinus1; }
        public long duration() { return duration; }
        public long reserved() { return reserved; }
        public boolean blendingMethod() { return blendingMethod; }
        public boolean disposalMethod() { return disposalMethod; }
        public byte[] data() { return data; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Alph(_io_data, this, _root);
                        break;
                    }
                    case ANIM: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Anim(_io_data, this, _root);
                        break;
                    }
                    case ANMF: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Anmf(_io_data, this, _root);
                        break;
                    }
                    case VP8: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Vp8(_io_data, this, _root);
                        break;
                    }
                    case VP8L: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Vp8l(_io_data, this, _root);
                        break;
                    }
                    case VP8X: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Vp8x(_io_data, this, _root);
                        break;
                    }
                    case XMP: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Xmp(_io_data, this, _root);
                        break;
                    }
                    case XMP_VAR: {
                        KaitaiStream _io_data = this._io.substream(lenData());
                        this.data = new Xmp(_io_data, this, _root);
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
        private ChunkNames name;
        private long lenData;
        private Object data;
        private byte[] padding;
        private Webp _root;
        private Webp.Chunks _parent;
        public ChunkNames name() { return name; }
        public long lenData() { return lenData; }
        public Object data() { return data; }
        public byte[] padding() { return padding; }
        public Webp _root() { return _root; }
        public Webp.Chunks _parent() { return _parent; }
    }
    public static class Chunks extends KaitaiStruct {
        public static Chunks fromFile(String fileName) throws IOException {
            return new Chunks(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.chunks = new ArrayList<Chunk>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.chunks.add(new Chunk(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.chunks.size(); i++) {
                this.chunks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<Chunk> chunks;
        private Webp _root;
        private Webp _parent;
        public List<Chunk> chunks() { return chunks; }
        public Webp _root() { return _root; }
        public Webp _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.rfc-editor.org/rfc/rfc6386#section-9.1">Source</a>
     */
    public static class Vp8 extends KaitaiStruct {
        public static Vp8 fromFile(String fileName) throws IOException {
            return new Vp8(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
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
        public long version() { return version; }
        public boolean showFrame() { return showFrame; }
        public long lenFirstPartition() { return lenFirstPartition; }
        public byte[] startCode() { return startCode; }
        public long width() { return width; }
        public long horizontalScale() { return horizontalScale; }
        public long height() { return height; }
        public long verticalScale() { return verticalScale; }
        public byte[] data() { return data; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification">Source</a>
     */
    public static class Vp8l extends KaitaiStruct {
        public static Vp8l fromFile(String fileName) throws IOException {
            return new Vp8l(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
        }
        private Integer imageHeight;
        public Integer imageHeight() {
            if (this.imageHeight != null)
                return this.imageHeight;
            this.imageHeight = ((Number) (imageHeightMinus1() + 1)).intValue();
            return this.imageHeight;
        }
        private Integer imageWidth;
        public Integer imageWidth() {
            if (this.imageWidth != null)
                return this.imageWidth;
            this.imageWidth = ((Number) (imageWidthMinus1() + 1)).intValue();
            return this.imageWidth;
        }
        private int signature;
        private long imageWidthMinus1;
        private long imageHeightMinus1;
        private boolean alphaIsUsed;
        private long versionNumber;
        private byte[] data;
        private Webp _root;
        private Webp.Chunk _parent;
        public int signature() { return signature; }
        public long imageWidthMinus1() { return imageWidthMinus1; }
        public long imageHeightMinus1() { return imageHeightMinus1; }

        /**
         * A hint only - it should not impact decoding. It should be `false` when
         * all alpha values are 255 in the picture, and `true` otherwise.
         */
        public boolean alphaIsUsed() { return alphaIsUsed; }
        public long versionNumber() { return versionNumber; }
        public byte[] data() { return data; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }
    public static class Vp8x extends KaitaiStruct {
        public static Vp8x fromFile(String fileName) throws IOException {
            return new Vp8x(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
        }
        private Integer canvasHeight;
        public Integer canvasHeight() {
            if (this.canvasHeight != null)
                return this.canvasHeight;
            this.canvasHeight = ((Number) (canvasHeightMinus1() + 1)).intValue();
            return this.canvasHeight;
        }
        private Integer canvasWidth;
        public Integer canvasWidth() {
            if (this.canvasWidth != null)
                return this.canvasWidth;
            this.canvasWidth = ((Number) (canvasWidthMinus1() + 1)).intValue();
            return this.canvasWidth;
        }
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
        public boolean iccProfile() { return iccProfile; }
        public boolean alpha() { return alpha; }
        public boolean exif() { return exif; }
        public boolean xmp() { return xmp; }
        public boolean animation() { return animation; }
        public boolean reserved2() { return reserved2; }
        public long reserved3() { return reserved3; }
        public long canvasWidthMinus1() { return canvasWidthMinus1; }
        public long canvasHeightMinus1() { return canvasHeightMinus1; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }
    public static class Xmp extends KaitaiStruct {
        public static Xmp fromFile(String fileName) throws IOException {
            return new Xmp(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.data = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String data;
        private Webp _root;
        private Webp.Chunk _parent;
        public String data() { return data; }
        public Webp _root() { return _root; }
        public Webp.Chunk _parent() { return _parent; }
    }
    private byte[] magic;
    private long lenData;
    private byte[] webp;
    private Chunks payload;
    private Webp _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long lenData() { return lenData; }
    public byte[] webp() { return webp; }
    public Chunks payload() { return payload; }
    public Webp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
