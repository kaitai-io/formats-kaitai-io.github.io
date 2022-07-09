// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * JPEG File Interchange Format, or JFIF, or, more colloquially known
 * as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
 * offering lossy compression which works reasonably well with
 * photographic images.
 * 
 * Format is organized as a container format, serving multiple
 * "segments", each starting with a magic and a marker. JFIF standard
 * dictates order and mandatory apperance of segments:
 * 
 * * SOI
 * * APP0 (with JFIF magic)
 * * APP0 (with JFXX magic, optional)
 * * everything else
 * * SOS
 * * JPEG-compressed stream
 * * EOI
 */
public class Jpeg extends KaitaiStruct {
    public static Jpeg fromFile(String fileName) throws IOException {
        return new Jpeg(new ByteBufferKaitaiStream(fileName));
    }

    public enum ComponentId {
        Y(1),
        CB(2),
        CR(3),
        I(4),
        Q(5);

        private final long id;
        ComponentId(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ComponentId> byId = new HashMap<Long, ComponentId>(5);
        static {
            for (ComponentId e : ComponentId.values())
                byId.put(e.id(), e);
        }
        public static ComponentId byId(long id) { return byId.get(id); }
    }

    public Jpeg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Jpeg(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Jpeg(KaitaiStream _io, KaitaiStruct _parent, Jpeg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.segments = new ArrayList<Segment>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.segments.add(new Segment(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Segment extends KaitaiStruct {
        public static Segment fromFile(String fileName) throws IOException {
            return new Segment(new ByteBufferKaitaiStream(fileName));
        }

        public enum MarkerEnum {
            TEM(1),
            SOF0(192),
            SOF1(193),
            SOF2(194),
            SOF3(195),
            DHT(196),
            SOF5(197),
            SOF6(198),
            SOF7(199),
            SOI(216),
            EOI(217),
            SOS(218),
            DQT(219),
            DNL(220),
            DRI(221),
            DHP(222),
            APP0(224),
            APP1(225),
            APP2(226),
            APP3(227),
            APP4(228),
            APP5(229),
            APP6(230),
            APP7(231),
            APP8(232),
            APP9(233),
            APP10(234),
            APP11(235),
            APP12(236),
            APP13(237),
            APP14(238),
            APP15(239),
            COM(254);

            private final long id;
            MarkerEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MarkerEnum> byId = new HashMap<Long, MarkerEnum>(33);
            static {
                for (MarkerEnum e : MarkerEnum.values())
                    byId.put(e.id(), e);
            }
            public static MarkerEnum byId(long id) { return byId.get(id); }
        }

        public Segment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Segment(KaitaiStream _io, Jpeg _parent) {
            this(_io, _parent, null);
        }

        public Segment(KaitaiStream _io, Jpeg _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(1);
            if (!(Arrays.equals(magic(), new byte[] { -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -1 }, magic(), _io(), "/types/segment/seq/0");
            }
            this.marker = MarkerEnum.byId(this._io.readU1());
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                this.length = this._io.readU2be();
            }
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                {
                    MarkerEnum on = marker();
                    if (on != null) {
                        switch (marker()) {
                        case APP1: {
                            this._raw_data = this._io.readBytes((length() - 2));
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                            this.data = new SegmentApp1(_io__raw_data, this, _root);
                            break;
                        }
                        case APP0: {
                            this._raw_data = this._io.readBytes((length() - 2));
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                            this.data = new SegmentApp0(_io__raw_data, this, _root);
                            break;
                        }
                        case SOF0: {
                            this._raw_data = this._io.readBytes((length() - 2));
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                            this.data = new SegmentSof0(_io__raw_data, this, _root);
                            break;
                        }
                        case SOS: {
                            this._raw_data = this._io.readBytes((length() - 2));
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                            this.data = new SegmentSos(_io__raw_data, this, _root);
                            break;
                        }
                        default: {
                            this.data = this._io.readBytes((length() - 2));
                            break;
                        }
                        }
                    } else {
                        this.data = this._io.readBytes((length() - 2));
                    }
                }
            }
            if (marker() == MarkerEnum.SOS) {
                this.imageData = this._io.readBytesFull();
            }
        }
        private byte[] magic;
        private MarkerEnum marker;
        private Integer length;
        private Object data;
        private byte[] imageData;
        private Jpeg _root;
        private Jpeg _parent;
        private byte[] _raw_data;
        public byte[] magic() { return magic; }
        public MarkerEnum marker() { return marker; }
        public Integer length() { return length; }
        public Object data() { return data; }
        public byte[] imageData() { return imageData; }
        public Jpeg _root() { return _root; }
        public Jpeg _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }
    public static class SegmentSos extends KaitaiStruct {
        public static SegmentSos fromFile(String fileName) throws IOException {
            return new SegmentSos(new ByteBufferKaitaiStream(fileName));
        }

        public SegmentSos(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentSos(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentSos(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numComponents = this._io.readU1();
            this.components = new ArrayList<Component>();
            for (int i = 0; i < numComponents(); i++) {
                this.components.add(new Component(this._io, this, _root));
            }
            this.startSpectralSelection = this._io.readU1();
            this.endSpectral = this._io.readU1();
            this.apprBitPos = this._io.readU1();
        }
        public static class Component extends KaitaiStruct {
            public static Component fromFile(String fileName) throws IOException {
                return new Component(new ByteBufferKaitaiStream(fileName));
            }

            public Component(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSos _parent) {
                this(_io, _parent, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSos _parent, Jpeg _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.id = Jpeg.ComponentId.byId(this._io.readU1());
                this.huffmanTable = this._io.readU1();
            }
            private ComponentId id;
            private int huffmanTable;
            private Jpeg _root;
            private Jpeg.SegmentSos _parent;

            /**
             * Scan component selector
             */
            public ComponentId id() { return id; }
            public int huffmanTable() { return huffmanTable; }
            public Jpeg _root() { return _root; }
            public Jpeg.SegmentSos _parent() { return _parent; }
        }
        private int numComponents;
        private ArrayList<Component> components;
        private int startSpectralSelection;
        private int endSpectral;
        private int apprBitPos;
        private Jpeg _root;
        private Jpeg.Segment _parent;

        /**
         * Number of components in scan
         */
        public int numComponents() { return numComponents; }

        /**
         * Scan components specification
         */
        public ArrayList<Component> components() { return components; }

        /**
         * Start of spectral selection or predictor selection
         */
        public int startSpectralSelection() { return startSpectralSelection; }

        /**
         * End of spectral selection
         */
        public int endSpectral() { return endSpectral; }

        /**
         * Successive approximation bit position high + Successive approximation bit position low or point transform
         */
        public int apprBitPos() { return apprBitPos; }
        public Jpeg _root() { return _root; }
        public Jpeg.Segment _parent() { return _parent; }
    }
    public static class SegmentApp1 extends KaitaiStruct {
        public static SegmentApp1 fromFile(String fileName) throws IOException {
            return new SegmentApp1(new ByteBufferKaitaiStream(fileName));
        }

        public SegmentApp1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentApp1(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentApp1(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
            switch (magic()) {
            case "Exif": {
                this.body = new ExifInJpeg(this._io, this, _root);
                break;
            }
            }
        }
        private String magic;
        private ExifInJpeg body;
        private Jpeg _root;
        private Jpeg.Segment _parent;
        public String magic() { return magic; }
        public ExifInJpeg body() { return body; }
        public Jpeg _root() { return _root; }
        public Jpeg.Segment _parent() { return _parent; }
    }
    public static class SegmentSof0 extends KaitaiStruct {
        public static SegmentSof0 fromFile(String fileName) throws IOException {
            return new SegmentSof0(new ByteBufferKaitaiStream(fileName));
        }

        public SegmentSof0(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentSof0(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentSof0(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.bitsPerSample = this._io.readU1();
            this.imageHeight = this._io.readU2be();
            this.imageWidth = this._io.readU2be();
            this.numComponents = this._io.readU1();
            this.components = new ArrayList<Component>();
            for (int i = 0; i < numComponents(); i++) {
                this.components.add(new Component(this._io, this, _root));
            }
        }
        public static class Component extends KaitaiStruct {
            public static Component fromFile(String fileName) throws IOException {
                return new Component(new ByteBufferKaitaiStream(fileName));
            }

            public Component(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSof0 _parent) {
                this(_io, _parent, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSof0 _parent, Jpeg _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.id = Jpeg.ComponentId.byId(this._io.readU1());
                this.samplingFactors = this._io.readU1();
                this.quantizationTableId = this._io.readU1();
            }
            private Integer samplingX;
            public Integer samplingX() {
                if (this.samplingX != null)
                    return this.samplingX;
                int _tmp = (int) (((samplingFactors() & 240) >> 4));
                this.samplingX = _tmp;
                return this.samplingX;
            }
            private Integer samplingY;
            public Integer samplingY() {
                if (this.samplingY != null)
                    return this.samplingY;
                int _tmp = (int) ((samplingFactors() & 15));
                this.samplingY = _tmp;
                return this.samplingY;
            }
            private ComponentId id;
            private int samplingFactors;
            private int quantizationTableId;
            private Jpeg _root;
            private Jpeg.SegmentSof0 _parent;

            /**
             * Component selector
             */
            public ComponentId id() { return id; }
            public int samplingFactors() { return samplingFactors; }
            public int quantizationTableId() { return quantizationTableId; }
            public Jpeg _root() { return _root; }
            public Jpeg.SegmentSof0 _parent() { return _parent; }
        }
        private int bitsPerSample;
        private int imageHeight;
        private int imageWidth;
        private int numComponents;
        private ArrayList<Component> components;
        private Jpeg _root;
        private Jpeg.Segment _parent;
        public int bitsPerSample() { return bitsPerSample; }
        public int imageHeight() { return imageHeight; }
        public int imageWidth() { return imageWidth; }
        public int numComponents() { return numComponents; }
        public ArrayList<Component> components() { return components; }
        public Jpeg _root() { return _root; }
        public Jpeg.Segment _parent() { return _parent; }
    }
    public static class ExifInJpeg extends KaitaiStruct {
        public static ExifInJpeg fromFile(String fileName) throws IOException {
            return new ExifInJpeg(new ByteBufferKaitaiStream(fileName));
        }

        public ExifInJpeg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExifInJpeg(KaitaiStream _io, Jpeg.SegmentApp1 _parent) {
            this(_io, _parent, null);
        }

        public ExifInJpeg(KaitaiStream _io, Jpeg.SegmentApp1 _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.extraZero = this._io.readBytes(1);
            if (!(Arrays.equals(extraZero(), new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, extraZero(), _io(), "/types/exif_in_jpeg/seq/0");
            }
            this._raw_data = this._io.readBytesFull();
            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
            this.data = new Exif(_io__raw_data);
        }
        private byte[] extraZero;
        private Exif data;
        private Jpeg _root;
        private Jpeg.SegmentApp1 _parent;
        private byte[] _raw_data;
        public byte[] extraZero() { return extraZero; }
        public Exif data() { return data; }
        public Jpeg _root() { return _root; }
        public Jpeg.SegmentApp1 _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }
    public static class SegmentApp0 extends KaitaiStruct {
        public static SegmentApp0 fromFile(String fileName) throws IOException {
            return new SegmentApp0(new ByteBufferKaitaiStream(fileName));
        }

        public enum DensityUnit {
            NO_UNITS(0),
            PIXELS_PER_INCH(1),
            PIXELS_PER_CM(2);

            private final long id;
            DensityUnit(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DensityUnit> byId = new HashMap<Long, DensityUnit>(3);
            static {
                for (DensityUnit e : DensityUnit.values())
                    byId.put(e.id(), e);
            }
            public static DensityUnit byId(long id) { return byId.get(id); }
        }

        public SegmentApp0(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentApp0(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentApp0(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = new String(this._io.readBytes(5), Charset.forName("ASCII"));
            this.versionMajor = this._io.readU1();
            this.versionMinor = this._io.readU1();
            this.densityUnits = DensityUnit.byId(this._io.readU1());
            this.densityX = this._io.readU2be();
            this.densityY = this._io.readU2be();
            this.thumbnailX = this._io.readU1();
            this.thumbnailY = this._io.readU1();
            this.thumbnail = this._io.readBytes(((thumbnailX() * thumbnailY()) * 3));
        }
        private String magic;
        private int versionMajor;
        private int versionMinor;
        private DensityUnit densityUnits;
        private int densityX;
        private int densityY;
        private int thumbnailX;
        private int thumbnailY;
        private byte[] thumbnail;
        private Jpeg _root;
        private Jpeg.Segment _parent;
        public String magic() { return magic; }
        public int versionMajor() { return versionMajor; }
        public int versionMinor() { return versionMinor; }
        public DensityUnit densityUnits() { return densityUnits; }

        /**
         * Horizontal pixel density. Must not be zero.
         */
        public int densityX() { return densityX; }

        /**
         * Vertical pixel density. Must not be zero.
         */
        public int densityY() { return densityY; }

        /**
         * Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
         */
        public int thumbnailX() { return thumbnailX; }

        /**
         * Vertical pixel count of the following embedded RGB thumbnail. May be zero.
         */
        public int thumbnailY() { return thumbnailY; }

        /**
         * Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
         */
        public byte[] thumbnail() { return thumbnail; }
        public Jpeg _root() { return _root; }
        public Jpeg.Segment _parent() { return _parent; }
    }
    private ArrayList<Segment> segments;
    private Jpeg _root;
    private KaitaiStruct _parent;
    public ArrayList<Segment> segments() { return segments; }
    public Jpeg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
