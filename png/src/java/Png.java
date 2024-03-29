// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */
public class Png extends KaitaiStruct {
    public static Png fromFile(String fileName) throws IOException {
        return new Png(new ByteBufferKaitaiStream(fileName));
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

    public Png(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Png(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Png(KaitaiStream _io, KaitaiStruct _parent, Png _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(magic(), new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }, magic(), _io(), "/seq/0");
        }
        this.ihdrLen = this._io.readU4be();
        if (!(ihdrLen() == 13)) {
            throw new KaitaiStream.ValidationNotEqualError(13, ihdrLen(), _io(), "/seq/1");
        }
        this.ihdrType = this._io.readBytes(4);
        if (!(Arrays.equals(ihdrType(), new byte[] { 73, 72, 68, 82 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 72, 68, 82 }, ihdrType(), _io(), "/seq/2");
        }
        this.ihdr = new IhdrChunk(this._io, this, _root);
        this.ihdrCrc = this._io.readBytes(4);
        this.chunks = new ArrayList<Chunk>();
        {
            Chunk _it;
            int i = 0;
            do {
                _it = new Chunk(this._io, this, _root);
                this.chunks.add(_it);
                i++;
            } while (!( ((_it.type().equals("IEND")) || (_io().isEof())) ));
        }
    }
    public static class Rgb extends KaitaiStruct {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
        }
        private int r;
        private int g;
        private int b;
        private Png _root;
        private Png.PlteChunk _parent;
        public int r() { return r; }
        public int g() { return g; }
        public int b() { return b; }
        public Png _root() { return _root; }
        public Png.PlteChunk _parent() { return _parent; }
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.len = this._io.readU4be();
            this.type = new String(this._io.readBytes(4), Charset.forName("UTF-8"));
            switch (type()) {
            case "iTXt": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new InternationalTextChunk(_io__raw_body, this, _root);
                break;
            }
            case "gAMA": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new GamaChunk(_io__raw_body, this, _root);
                break;
            }
            case "tIME": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new TimeChunk(_io__raw_body, this, _root);
                break;
            }
            case "PLTE": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new PlteChunk(_io__raw_body, this, _root);
                break;
            }
            case "bKGD": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new BkgdChunk(_io__raw_body, this, _root);
                break;
            }
            case "pHYs": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new PhysChunk(_io__raw_body, this, _root);
                break;
            }
            case "fdAT": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new FrameDataChunk(_io__raw_body, this, _root);
                break;
            }
            case "tEXt": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new TextChunk(_io__raw_body, this, _root);
                break;
            }
            case "cHRM": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new ChrmChunk(_io__raw_body, this, _root);
                break;
            }
            case "acTL": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new AnimationControlChunk(_io__raw_body, this, _root);
                break;
            }
            case "sRGB": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new SrgbChunk(_io__raw_body, this, _root);
                break;
            }
            case "zTXt": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new CompressedTextChunk(_io__raw_body, this, _root);
                break;
            }
            case "fcTL": {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new FrameControlChunk(_io__raw_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(len());
                break;
            }
            }
            this.crc = this._io.readBytes(4);
        }
        private long len;
        private String type;
        private Object body;
        private byte[] crc;
        private Png _root;
        private Png _parent;
        private byte[] _raw_body;
        public long len() { return len; }
        public String type() { return type; }
        public Object body() { return body; }
        public byte[] crc() { return crc; }
        public Png _root() { return _root; }
        public Png _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * Background chunk for images with indexed palette.
     */
    public static class BkgdIndexed extends KaitaiStruct {
        public static BkgdIndexed fromFile(String fileName) throws IOException {
            return new BkgdIndexed(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.paletteIndex = this._io.readU1();
        }
        private int paletteIndex;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int paletteIndex() { return paletteIndex; }
        public Png _root() { return _root; }
        public Png.BkgdChunk _parent() { return _parent; }
    }
    public static class Point extends KaitaiStruct {
        public static Point fromFile(String fileName) throws IOException {
            return new Point(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.xInt = this._io.readU4be();
            this.yInt = this._io.readU4be();
        }
        private Double x;
        public Double x() {
            if (this.x != null)
                return this.x;
            double _tmp = (double) ((xInt() / 100000.0));
            this.x = _tmp;
            return this.x;
        }
        private Double y;
        public Double y() {
            if (this.y != null)
                return this.y;
            double _tmp = (double) ((yInt() / 100000.0));
            this.y = _tmp;
            return this.y;
        }
        private long xInt;
        private long yInt;
        private Png _root;
        private Png.ChrmChunk _parent;
        public long xInt() { return xInt; }
        public long yInt() { return yInt; }
        public Png _root() { return _root; }
        public Png.ChrmChunk _parent() { return _parent; }
    }

    /**
     * Background chunk for greyscale images.
     */
    public static class BkgdGreyscale extends KaitaiStruct {
        public static BkgdGreyscale fromFile(String fileName) throws IOException {
            return new BkgdGreyscale(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.value = this._io.readU2be();
        }
        private int value;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int value() { return value; }
        public Png _root() { return _root; }
        public Png.BkgdChunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11cHRM">Source</a>
     */
    public static class ChrmChunk extends KaitaiStruct {
        public static ChrmChunk fromFile(String fileName) throws IOException {
            return new ChrmChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.whitePoint = new Point(this._io, this, _root);
            this.red = new Point(this._io, this, _root);
            this.green = new Point(this._io, this, _root);
            this.blue = new Point(this._io, this, _root);
        }
        private Point whitePoint;
        private Point red;
        private Point green;
        private Point blue;
        private Png _root;
        private Png.Chunk _parent;
        public Point whitePoint() { return whitePoint; }
        public Point red() { return red; }
        public Point green() { return green; }
        public Point blue() { return blue; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11IHDR">Source</a>
     */
    public static class IhdrChunk extends KaitaiStruct {
        public static IhdrChunk fromFile(String fileName) throws IOException {
            return new IhdrChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.width = this._io.readU4be();
            this.height = this._io.readU4be();
            this.bitDepth = this._io.readU1();
            this.colorType = Png.ColorType.byId(this._io.readU1());
            this.compressionMethod = this._io.readU1();
            this.filterMethod = this._io.readU1();
            this.interlaceMethod = this._io.readU1();
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
        public long height() { return height; }
        public int bitDepth() { return bitDepth; }
        public ColorType colorType() { return colorType; }
        public int compressionMethod() { return compressionMethod; }
        public int filterMethod() { return filterMethod; }
        public int interlaceMethod() { return interlaceMethod; }
        public Png _root() { return _root; }
        public Png _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11PLTE">Source</a>
     */
    public static class PlteChunk extends KaitaiStruct {
        public static PlteChunk fromFile(String fileName) throws IOException {
            return new PlteChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Rgb>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Rgb(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Rgb> entries;
        private Png _root;
        private Png.Chunk _parent;
        public ArrayList<Rgb> entries() { return entries; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11sRGB">Source</a>
     */
    public static class SrgbChunk extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.renderIntent = Intent.byId(this._io.readU1());
        }
        private Intent renderIntent;
        private Png _root;
        private Png.Chunk _parent;
        public Intent renderIntent() { return renderIntent; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Compressed text chunk effectively allows to store key-value
     * string pairs in PNG container, compressing "value" part (which
     * can be quite lengthy) with zlib compression.
     * @see <a href="https://www.w3.org/TR/png/#11zTXt">Source</a>
     */
    public static class CompressedTextChunk extends KaitaiStruct {
        public static CompressedTextChunk fromFile(String fileName) throws IOException {
            return new CompressedTextChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            this._raw_textDatastream = this._io.readBytesFull();
            this.textDatastream = KaitaiStream.processZlib(_raw_textDatastream);
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
        public CompressionMethods compressionMethod() { return compressionMethod; }
        public byte[] textDatastream() { return textDatastream; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
        public byte[] _raw_textDatastream() { return _raw_textDatastream; }
    }

    /**
     * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk">Source</a>
     */
    public static class FrameDataChunk extends KaitaiStruct {
        public static FrameDataChunk fromFile(String fileName) throws IOException {
            return new FrameDataChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.sequenceNumber = this._io.readU4be();
            this.frameData = this._io.readBytesFull();
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

        /**
         * Frame data for the frame. At least one fdAT chunk is required for
         * each frame. The compressed datastream is the concatenation of the
         * contents of the data fields of all the fdAT chunks within a frame.
         */
        public byte[] frameData() { return frameData; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Background chunk for truecolor images.
     */
    public static class BkgdTruecolor extends KaitaiStruct {
        public static BkgdTruecolor fromFile(String fileName) throws IOException {
            return new BkgdTruecolor(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.red = this._io.readU2be();
            this.green = this._io.readU2be();
            this.blue = this._io.readU2be();
        }
        private int red;
        private int green;
        private int blue;
        private Png _root;
        private Png.BkgdChunk _parent;
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }
        public Png _root() { return _root; }
        public Png.BkgdChunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/TR/png/#11gAMA">Source</a>
     */
    public static class GamaChunk extends KaitaiStruct {
        public static GamaChunk fromFile(String fileName) throws IOException {
            return new GamaChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.gammaInt = this._io.readU4be();
        }
        private Double gammaRatio;
        public Double gammaRatio() {
            if (this.gammaRatio != null)
                return this.gammaRatio;
            double _tmp = (double) ((100000.0 / gammaInt()));
            this.gammaRatio = _tmp;
            return this.gammaRatio;
        }
        private long gammaInt;
        private Png _root;
        private Png.Chunk _parent;
        public long gammaInt() { return gammaInt; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Background chunk stores default background color to display this
     * image against. Contents depend on `color_type` of the image.
     * @see <a href="https://www.w3.org/TR/png/#11bKGD">Source</a>
     */
    public static class BkgdChunk extends KaitaiStruct {
        public static BkgdChunk fromFile(String fileName) throws IOException {
            return new BkgdChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            {
                ColorType on = _root().ihdr().colorType();
                if (on != null) {
                    switch (_root().ihdr().colorType()) {
                    case INDEXED: {
                        this.bkgd = new BkgdIndexed(this._io, this, _root);
                        break;
                    }
                    case TRUECOLOR_ALPHA: {
                        this.bkgd = new BkgdTruecolor(this._io, this, _root);
                        break;
                    }
                    case GREYSCALE_ALPHA: {
                        this.bkgd = new BkgdGreyscale(this._io, this, _root);
                        break;
                    }
                    case TRUECOLOR: {
                        this.bkgd = new BkgdTruecolor(this._io, this, _root);
                        break;
                    }
                    case GREYSCALE: {
                        this.bkgd = new BkgdGreyscale(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
        }
        private KaitaiStruct bkgd;
        private Png _root;
        private Png.Chunk _parent;
        public KaitaiStruct bkgd() { return bkgd; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * "Physical size" chunk stores data that allows to translate
     * logical pixels into physical units (meters, etc) and vice-versa.
     * @see <a href="https://www.w3.org/TR/png/#11pHYs">Source</a>
     */
    public static class PhysChunk extends KaitaiStruct {
        public static PhysChunk fromFile(String fileName) throws IOException {
            return new PhysChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.pixelsPerUnitX = this._io.readU4be();
            this.pixelsPerUnitY = this._io.readU4be();
            this.unit = Png.PhysUnit.byId(this._io.readU1());
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

        /**
         * Number of pixels per physical unit (typically, 1 meter) by Y
         * axis.
         */
        public long pixelsPerUnitY() { return pixelsPerUnitY; }
        public PhysUnit unit() { return unit; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk">Source</a>
     */
    public static class FrameControlChunk extends KaitaiStruct {
        public static FrameControlChunk fromFile(String fileName) throws IOException {
            return new FrameControlChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.sequenceNumber = this._io.readU4be();
            this.width = this._io.readU4be();
            if (!(width() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, width(), _io(), "/types/frame_control_chunk/seq/1");
            }
            if (!(width() <= _root().ihdr().width())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().width(), width(), _io(), "/types/frame_control_chunk/seq/1");
            }
            this.height = this._io.readU4be();
            if (!(height() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, height(), _io(), "/types/frame_control_chunk/seq/2");
            }
            if (!(height() <= _root().ihdr().height())) {
                throw new KaitaiStream.ValidationGreaterThanError(_root().ihdr().height(), height(), _io(), "/types/frame_control_chunk/seq/2");
            }
            this.xOffset = this._io.readU4be();
            if (!(xOffset() <= (_root().ihdr().width() - width()))) {
                throw new KaitaiStream.ValidationGreaterThanError((_root().ihdr().width() - width()), xOffset(), _io(), "/types/frame_control_chunk/seq/3");
            }
            this.yOffset = this._io.readU4be();
            if (!(yOffset() <= (_root().ihdr().height() - height()))) {
                throw new KaitaiStream.ValidationGreaterThanError((_root().ihdr().height() - height()), yOffset(), _io(), "/types/frame_control_chunk/seq/4");
            }
            this.delayNum = this._io.readU2be();
            this.delayDen = this._io.readU2be();
            this.disposeOp = Png.DisposeOpValues.byId(this._io.readU1());
            this.blendOp = Png.BlendOpValues.byId(this._io.readU1());
        }
        private Double delay;

        /**
         * Time to display this frame, in seconds
         */
        public Double delay() {
            if (this.delay != null)
                return this.delay;
            double _tmp = (double) ((delayNum() / (delayDen() == 0 ? 100.0 : delayDen())));
            this.delay = _tmp;
            return this.delay;
        }
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

        /**
         * Width of the following frame
         */
        public long width() { return width; }

        /**
         * Height of the following frame
         */
        public long height() { return height; }

        /**
         * X position at which to render the following frame
         */
        public long xOffset() { return xOffset; }

        /**
         * Y position at which to render the following frame
         */
        public long yOffset() { return yOffset; }

        /**
         * Frame delay fraction numerator
         */
        public int delayNum() { return delayNum; }

        /**
         * Frame delay fraction denominator
         */
        public int delayDen() { return delayDen; }

        /**
         * Type of frame area disposal to be done after rendering this frame
         */
        public DisposeOpValues disposeOp() { return disposeOp; }

        /**
         * Type of frame area rendering for this frame
         */
        public BlendOpValues blendOp() { return blendOp; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * International text chunk effectively allows to store key-value string pairs in
     * PNG container. Both "key" (keyword) and "value" (text) parts are
     * given in pre-defined subset of iso8859-1 without control
     * characters.
     * @see <a href="https://www.w3.org/TR/png/#11iTXt">Source</a>
     */
    public static class InternationalTextChunk extends KaitaiStruct {
        public static InternationalTextChunk fromFile(String fileName) throws IOException {
            return new InternationalTextChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
            this.compressionFlag = this._io.readU1();
            this.compressionMethod = Png.CompressionMethods.byId(this._io.readU1());
            this.languageTag = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
            this.translatedKeyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
            this.text = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
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

        /**
         * 0 = text is uncompressed, 1 = text is compressed with a
         * method specified in `compression_method`.
         */
        public int compressionFlag() { return compressionFlag; }
        public CompressionMethods compressionMethod() { return compressionMethod; }

        /**
         * Human language used in `translated_keyword` and `text`
         * attributes - should be a language code conforming to ISO
         * 646.IRV:1991.
         */
        public String languageTag() { return languageTag; }

        /**
         * Keyword translated into language specified in
         * `language_tag`. Line breaks are not allowed.
         */
        public String translatedKeyword() { return translatedKeyword; }

        /**
         * Text contents ("value" of this key-value pair), written in
         * language specified in `language_tag`. Line breaks are
         * allowed.
         */
        public String text() { return text; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Text chunk effectively allows to store key-value string pairs in
     * PNG container. Both "key" (keyword) and "value" (text) parts are
     * given in pre-defined subset of iso8859-1 without control
     * characters.
     * @see <a href="https://www.w3.org/TR/png/#11tEXt">Source</a>
     */
    public static class TextChunk extends KaitaiStruct {
        public static TextChunk fromFile(String fileName) throws IOException {
            return new TextChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.keyword = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("iso8859-1"));
            this.text = new String(this._io.readBytesFull(), Charset.forName("iso8859-1"));
        }
        private String keyword;
        private String text;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Indicates purpose of the following text data.
         */
        public String keyword() { return keyword; }
        public String text() { return text; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * @see <a href="https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk">Source</a>
     */
    public static class AnimationControlChunk extends KaitaiStruct {
        public static AnimationControlChunk fromFile(String fileName) throws IOException {
            return new AnimationControlChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numFrames = this._io.readU4be();
            this.numPlays = this._io.readU4be();
        }
        private long numFrames;
        private long numPlays;
        private Png _root;
        private Png.Chunk _parent;

        /**
         * Number of frames, must be equal to the number of `frame_control_chunk`s
         */
        public long numFrames() { return numFrames; }

        /**
         * Number of times to loop, 0 indicates infinite looping.
         */
        public long numPlays() { return numPlays; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }

    /**
     * Time chunk stores time stamp of last modification of this image,
     * up to 1 second precision in UTC timezone.
     * @see <a href="https://www.w3.org/TR/png/#11tIME">Source</a>
     */
    public static class TimeChunk extends KaitaiStruct {
        public static TimeChunk fromFile(String fileName) throws IOException {
            return new TimeChunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.year = this._io.readU2be();
            this.month = this._io.readU1();
            this.day = this._io.readU1();
            this.hour = this._io.readU1();
            this.minute = this._io.readU1();
            this.second = this._io.readU1();
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
        public int month() { return month; }
        public int day() { return day; }
        public int hour() { return hour; }
        public int minute() { return minute; }
        public int second() { return second; }
        public Png _root() { return _root; }
        public Png.Chunk _parent() { return _parent; }
    }
    private byte[] magic;
    private long ihdrLen;
    private byte[] ihdrType;
    private IhdrChunk ihdr;
    private byte[] ihdrCrc;
    private ArrayList<Chunk> chunks;
    private Png _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long ihdrLen() { return ihdrLen; }
    public byte[] ihdrType() { return ihdrType; }
    public IhdrChunk ihdr() { return ihdr; }
    public byte[] ihdrCrc() { return ihdrCrc; }
    public ArrayList<Chunk> chunks() { return chunks; }
    public Png _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
