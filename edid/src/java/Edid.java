// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;

public class Edid extends KaitaiStruct {
    public static Edid fromFile(String fileName) throws IOException {
        return new Edid(new ByteBufferKaitaiStream(fileName));
    }

    public Edid(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Edid(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Edid(KaitaiStream _io, KaitaiStruct _parent, Edid _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(magic(), new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 }, magic(), _io(), "/seq/0");
        }
        this.mfgBytes = this._io.readU2be();
        this.productCode = this._io.readU2le();
        this.serial = this._io.readU4le();
        this.mfgWeek = this._io.readU1();
        this.mfgYearMod = this._io.readU1();
        this.edidVersionMajor = this._io.readU1();
        this.edidVersionMinor = this._io.readU1();
        this.inputFlags = this._io.readU1();
        this.screenSizeH = this._io.readU1();
        this.screenSizeV = this._io.readU1();
        this.gammaMod = this._io.readU1();
        this.featuresFlags = this._io.readU1();
        this.chromacity = new ChromacityInfo(this._io, this, _root);
        this.estTimings = new EstTimingsInfo(this._io, this, _root);
        this._raw_stdTimings = new ArrayList<byte[]>(((Number) (8)).intValue());
        stdTimings = new ArrayList<StdTiming>(((Number) (8)).intValue());
        for (int i = 0; i < 8; i++) {
            this._raw_stdTimings.add(this._io.readBytes(2));
            KaitaiStream _io__raw_stdTimings = new ByteBufferKaitaiStream(_raw_stdTimings.get(_raw_stdTimings.size() - 1));
            this.stdTimings.add(new StdTiming(_io__raw_stdTimings, this, _root));
        }
    }

    /**
     * Chromaticity information: colorimetry and white point
     * coordinates. All coordinates are stored as fixed precision
     * 10-bit numbers, bits are shuffled for compactness.
     */
    public static class ChromacityInfo extends KaitaiStruct {
        public static ChromacityInfo fromFile(String fileName) throws IOException {
            return new ChromacityInfo(new ByteBufferKaitaiStream(fileName));
        }

        public ChromacityInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChromacityInfo(KaitaiStream _io, Edid _parent) {
            this(_io, _parent, null);
        }

        public ChromacityInfo(KaitaiStream _io, Edid _parent, Edid _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.redX10 = this._io.readBitsIntBe(2);
            this.redY10 = this._io.readBitsIntBe(2);
            this.greenX10 = this._io.readBitsIntBe(2);
            this.greenY10 = this._io.readBitsIntBe(2);
            this.blueX10 = this._io.readBitsIntBe(2);
            this.blueY10 = this._io.readBitsIntBe(2);
            this.whiteX10 = this._io.readBitsIntBe(2);
            this.whiteY10 = this._io.readBitsIntBe(2);
            this._io.alignToByte();
            this.redX92 = this._io.readU1();
            this.redY92 = this._io.readU1();
            this.greenX92 = this._io.readU1();
            this.greenY92 = this._io.readU1();
            this.blueX92 = this._io.readU1();
            this.blueY92 = this._io.readU1();
            this.whiteX92 = this._io.readU1();
            this.whiteY92 = this._io.readU1();
        }
        private Integer greenXInt;
        public Integer greenXInt() {
            if (this.greenXInt != null)
                return this.greenXInt;
            int _tmp = (int) (((greenX92() << 2) | greenX10()));
            this.greenXInt = _tmp;
            return this.greenXInt;
        }
        private Double redY;

        /**
         * Red Y coordinate
         */
        public Double redY() {
            if (this.redY != null)
                return this.redY;
            double _tmp = (double) ((redYInt() / 1024.0));
            this.redY = _tmp;
            return this.redY;
        }
        private Integer greenYInt;
        public Integer greenYInt() {
            if (this.greenYInt != null)
                return this.greenYInt;
            int _tmp = (int) (((greenY92() << 2) | greenY10()));
            this.greenYInt = _tmp;
            return this.greenYInt;
        }
        private Double whiteY;

        /**
         * White Y coordinate
         */
        public Double whiteY() {
            if (this.whiteY != null)
                return this.whiteY;
            double _tmp = (double) ((whiteYInt() / 1024.0));
            this.whiteY = _tmp;
            return this.whiteY;
        }
        private Double redX;

        /**
         * Red X coordinate
         */
        public Double redX() {
            if (this.redX != null)
                return this.redX;
            double _tmp = (double) ((redXInt() / 1024.0));
            this.redX = _tmp;
            return this.redX;
        }
        private Double whiteX;

        /**
         * White X coordinate
         */
        public Double whiteX() {
            if (this.whiteX != null)
                return this.whiteX;
            double _tmp = (double) ((whiteXInt() / 1024.0));
            this.whiteX = _tmp;
            return this.whiteX;
        }
        private Double blueX;

        /**
         * Blue X coordinate
         */
        public Double blueX() {
            if (this.blueX != null)
                return this.blueX;
            double _tmp = (double) ((blueXInt() / 1024.0));
            this.blueX = _tmp;
            return this.blueX;
        }
        private Integer whiteXInt;
        public Integer whiteXInt() {
            if (this.whiteXInt != null)
                return this.whiteXInt;
            int _tmp = (int) (((whiteX92() << 2) | whiteX10()));
            this.whiteXInt = _tmp;
            return this.whiteXInt;
        }
        private Integer whiteYInt;
        public Integer whiteYInt() {
            if (this.whiteYInt != null)
                return this.whiteYInt;
            int _tmp = (int) (((whiteY92() << 2) | whiteY10()));
            this.whiteYInt = _tmp;
            return this.whiteYInt;
        }
        private Double greenX;

        /**
         * Green X coordinate
         */
        public Double greenX() {
            if (this.greenX != null)
                return this.greenX;
            double _tmp = (double) ((greenXInt() / 1024.0));
            this.greenX = _tmp;
            return this.greenX;
        }
        private Integer redXInt;
        public Integer redXInt() {
            if (this.redXInt != null)
                return this.redXInt;
            int _tmp = (int) (((redX92() << 2) | redX10()));
            this.redXInt = _tmp;
            return this.redXInt;
        }
        private Integer redYInt;
        public Integer redYInt() {
            if (this.redYInt != null)
                return this.redYInt;
            int _tmp = (int) (((redY92() << 2) | redY10()));
            this.redYInt = _tmp;
            return this.redYInt;
        }
        private Integer blueXInt;
        public Integer blueXInt() {
            if (this.blueXInt != null)
                return this.blueXInt;
            int _tmp = (int) (((blueX92() << 2) | blueX10()));
            this.blueXInt = _tmp;
            return this.blueXInt;
        }
        private Double blueY;

        /**
         * Blue Y coordinate
         */
        public Double blueY() {
            if (this.blueY != null)
                return this.blueY;
            double _tmp = (double) ((blueYInt() / 1024.0));
            this.blueY = _tmp;
            return this.blueY;
        }
        private Double greenY;

        /**
         * Green Y coordinate
         */
        public Double greenY() {
            if (this.greenY != null)
                return this.greenY;
            double _tmp = (double) ((greenYInt() / 1024.0));
            this.greenY = _tmp;
            return this.greenY;
        }
        private Integer blueYInt;
        public Integer blueYInt() {
            if (this.blueYInt != null)
                return this.blueYInt;
            int _tmp = (int) (((blueY92() << 2) | blueY10()));
            this.blueYInt = _tmp;
            return this.blueYInt;
        }
        private long redX10;
        private long redY10;
        private long greenX10;
        private long greenY10;
        private long blueX10;
        private long blueY10;
        private long whiteX10;
        private long whiteY10;
        private int redX92;
        private int redY92;
        private int greenX92;
        private int greenY92;
        private int blueX92;
        private int blueY92;
        private int whiteX92;
        private int whiteY92;
        private Edid _root;
        private Edid _parent;

        /**
         * Red X, bits 1..0
         */
        public long redX10() { return redX10; }

        /**
         * Red Y, bits 1..0
         */
        public long redY10() { return redY10; }

        /**
         * Green X, bits 1..0
         */
        public long greenX10() { return greenX10; }

        /**
         * Green Y, bits 1..0
         */
        public long greenY10() { return greenY10; }

        /**
         * Blue X, bits 1..0
         */
        public long blueX10() { return blueX10; }

        /**
         * Blue Y, bits 1..0
         */
        public long blueY10() { return blueY10; }

        /**
         * White X, bits 1..0
         */
        public long whiteX10() { return whiteX10; }

        /**
         * White Y, bits 1..0
         */
        public long whiteY10() { return whiteY10; }

        /**
         * Red X, bits 9..2
         */
        public int redX92() { return redX92; }

        /**
         * Red Y, bits 9..2
         */
        public int redY92() { return redY92; }

        /**
         * Green X, bits 9..2
         */
        public int greenX92() { return greenX92; }

        /**
         * Green Y, bits 9..2
         */
        public int greenY92() { return greenY92; }

        /**
         * Blue X, bits 9..2
         */
        public int blueX92() { return blueX92; }

        /**
         * Blue Y, bits 9..2
         */
        public int blueY92() { return blueY92; }

        /**
         * White X, bits 9..2
         */
        public int whiteX92() { return whiteX92; }

        /**
         * White Y, bits 9..2
         */
        public int whiteY92() { return whiteY92; }
        public Edid _root() { return _root; }
        public Edid _parent() { return _parent; }
    }
    public static class EstTimingsInfo extends KaitaiStruct {
        public static EstTimingsInfo fromFile(String fileName) throws IOException {
            return new EstTimingsInfo(new ByteBufferKaitaiStream(fileName));
        }

        public EstTimingsInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EstTimingsInfo(KaitaiStream _io, Edid _parent) {
            this(_io, _parent, null);
        }

        public EstTimingsInfo(KaitaiStream _io, Edid _parent, Edid _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.can720x400px70hz = this._io.readBitsIntBe(1) != 0;
            this.can720x400px88hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px60hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px67hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px72hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px75hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px56hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px60hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px72hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px75hz = this._io.readBitsIntBe(1) != 0;
            this.can832x624px75hz = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px87hzI = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px60hz = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px70hz = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px75hz = this._io.readBitsIntBe(1) != 0;
            this.can1280x1024px75hz = this._io.readBitsIntBe(1) != 0;
            this.can1152x870px75hz = this._io.readBitsIntBe(1) != 0;
            this.reserved = this._io.readBitsIntBe(7);
        }
        private boolean can720x400px70hz;
        private boolean can720x400px88hz;
        private boolean can640x480px60hz;
        private boolean can640x480px67hz;
        private boolean can640x480px72hz;
        private boolean can640x480px75hz;
        private boolean can800x600px56hz;
        private boolean can800x600px60hz;
        private boolean can800x600px72hz;
        private boolean can800x600px75hz;
        private boolean can832x624px75hz;
        private boolean can1024x768px87hzI;
        private boolean can1024x768px60hz;
        private boolean can1024x768px70hz;
        private boolean can1024x768px75hz;
        private boolean can1280x1024px75hz;
        private boolean can1152x870px75hz;
        private long reserved;
        private Edid _root;
        private Edid _parent;

        /**
         * Supports 720 x 400 @ 70Hz
         */
        public boolean can720x400px70hz() { return can720x400px70hz; }

        /**
         * Supports 720 x 400 @ 88Hz
         */
        public boolean can720x400px88hz() { return can720x400px88hz; }

        /**
         * Supports 640 x 480 @ 60Hz
         */
        public boolean can640x480px60hz() { return can640x480px60hz; }

        /**
         * Supports 640 x 480 @ 67Hz
         */
        public boolean can640x480px67hz() { return can640x480px67hz; }

        /**
         * Supports 640 x 480 @ 72Hz
         */
        public boolean can640x480px72hz() { return can640x480px72hz; }

        /**
         * Supports 640 x 480 @ 75Hz
         */
        public boolean can640x480px75hz() { return can640x480px75hz; }

        /**
         * Supports 800 x 600 @ 56Hz
         */
        public boolean can800x600px56hz() { return can800x600px56hz; }

        /**
         * Supports 800 x 600 @ 60Hz
         */
        public boolean can800x600px60hz() { return can800x600px60hz; }

        /**
         * Supports 800 x 600 @ 72Hz
         */
        public boolean can800x600px72hz() { return can800x600px72hz; }

        /**
         * Supports 800 x 600 @ 75Hz
         */
        public boolean can800x600px75hz() { return can800x600px75hz; }

        /**
         * Supports 832 x 624 @ 75Hz
         */
        public boolean can832x624px75hz() { return can832x624px75hz; }

        /**
         * Supports 1024 x 768 @ 87Hz(I)
         */
        public boolean can1024x768px87hzI() { return can1024x768px87hzI; }

        /**
         * Supports 1024 x 768 @ 60Hz
         */
        public boolean can1024x768px60hz() { return can1024x768px60hz; }

        /**
         * Supports 1024 x 768 @ 70Hz
         */
        public boolean can1024x768px70hz() { return can1024x768px70hz; }

        /**
         * Supports 1024 x 768 @ 75Hz
         */
        public boolean can1024x768px75hz() { return can1024x768px75hz; }

        /**
         * Supports 1280 x 1024 @ 75Hz
         */
        public boolean can1280x1024px75hz() { return can1280x1024px75hz; }

        /**
         * Supports 1152 x 870 @ 75Hz
         */
        public boolean can1152x870px75hz() { return can1152x870px75hz; }
        public long reserved() { return reserved; }
        public Edid _root() { return _root; }
        public Edid _parent() { return _parent; }
    }
    public static class StdTiming extends KaitaiStruct {
        public static StdTiming fromFile(String fileName) throws IOException {
            return new StdTiming(new ByteBufferKaitaiStream(fileName));
        }

        public enum AspectRatios {
            RATIO_16_10(0),
            RATIO_4_3(1),
            RATIO_5_4(2),
            RATIO_16_9(3);

            private final long id;
            AspectRatios(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, AspectRatios> byId = new HashMap<Long, AspectRatios>(4);
            static {
                for (AspectRatios e : AspectRatios.values())
                    byId.put(e.id(), e);
            }
            public static AspectRatios byId(long id) { return byId.get(id); }
        }

        public StdTiming(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StdTiming(KaitaiStream _io, Edid _parent) {
            this(_io, _parent, null);
        }

        public StdTiming(KaitaiStream _io, Edid _parent, Edid _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.horizActivePixelsMod = this._io.readU1();
            this.aspectRatio = AspectRatios.byId(this._io.readBitsIntBe(2));
            this.refreshRateMod = this._io.readBitsIntBe(6);
        }
        private byte[] bytesLookahead;
        public byte[] bytesLookahead() {
            if (this.bytesLookahead != null)
                return this.bytesLookahead;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.bytesLookahead = this._io.readBytes(2);
            this._io.seek(_pos);
            return this.bytesLookahead;
        }
        private Boolean isUsed;
        public Boolean isUsed() {
            if (this.isUsed != null)
                return this.isUsed;
            boolean _tmp = (boolean) (!Arrays.equals(bytesLookahead(), new byte[] { 1, 1 }));
            this.isUsed = _tmp;
            return this.isUsed;
        }
        private Integer horizActivePixels;

        /**
         * Range of horizontal active pixels.
         */
        public Integer horizActivePixels() {
            if (this.horizActivePixels != null)
                return this.horizActivePixels;
            if (isUsed()) {
                int _tmp = (int) (((horizActivePixelsMod() + 31) * 8));
                this.horizActivePixels = _tmp;
            }
            return this.horizActivePixels;
        }
        private Integer refreshRate;

        /**
         * Vertical refresh rate, Hz.
         */
        public Integer refreshRate() {
            if (this.refreshRate != null)
                return this.refreshRate;
            if (isUsed()) {
                int _tmp = (int) ((refreshRateMod() + 60));
                this.refreshRate = _tmp;
            }
            return this.refreshRate;
        }
        private int horizActivePixelsMod;
        private AspectRatios aspectRatio;
        private long refreshRateMod;
        private Edid _root;
        private Edid _parent;

        /**
         * Range of horizontal active pixels, written in modified form:
         * `(horiz_active_pixels / 8) - 31`. This yields an effective
         * range of 256..2288, with steps of 8 pixels.
         */
        public int horizActivePixelsMod() { return horizActivePixelsMod; }

        /**
         * Aspect ratio of the image. Can be used to calculate number
         * of vertical pixels.
         */
        public AspectRatios aspectRatio() { return aspectRatio; }

        /**
         * Refresh rate in Hz, written in modified form: `refresh_rate
         * - 60`. This yields an effective range of 60..123 Hz.
         */
        public long refreshRateMod() { return refreshRateMod; }
        public Edid _root() { return _root; }
        public Edid _parent() { return _parent; }
    }
    private Integer mfgYear;
    public Integer mfgYear() {
        if (this.mfgYear != null)
            return this.mfgYear;
        int _tmp = (int) ((mfgYearMod() + 1990));
        this.mfgYear = _tmp;
        return this.mfgYear;
    }
    private Integer mfgIdCh1;
    public Integer mfgIdCh1() {
        if (this.mfgIdCh1 != null)
            return this.mfgIdCh1;
        int _tmp = (int) (((mfgBytes() & 31744) >> 10));
        this.mfgIdCh1 = _tmp;
        return this.mfgIdCh1;
    }
    private Integer mfgIdCh3;
    public Integer mfgIdCh3() {
        if (this.mfgIdCh3 != null)
            return this.mfgIdCh3;
        int _tmp = (int) ((mfgBytes() & 31));
        this.mfgIdCh3 = _tmp;
        return this.mfgIdCh3;
    }
    private Double gamma;
    public Double gamma() {
        if (this.gamma != null)
            return this.gamma;
        if (gammaMod() != 255) {
            double _tmp = (double) (((gammaMod() + 100) / 100.0));
            this.gamma = _tmp;
        }
        return this.gamma;
    }
    private String mfgStr;
    public String mfgStr() {
        if (this.mfgStr != null)
            return this.mfgStr;
        this.mfgStr = new String(new byte[] { (mfgIdCh1() + 64), (mfgIdCh2() + 64), (mfgIdCh3() + 64) }, Charset.forName("ASCII"));
        return this.mfgStr;
    }
    private Integer mfgIdCh2;
    public Integer mfgIdCh2() {
        if (this.mfgIdCh2 != null)
            return this.mfgIdCh2;
        int _tmp = (int) (((mfgBytes() & 992) >> 5));
        this.mfgIdCh2 = _tmp;
        return this.mfgIdCh2;
    }
    private byte[] magic;
    private int mfgBytes;
    private int productCode;
    private long serial;
    private int mfgWeek;
    private int mfgYearMod;
    private int edidVersionMajor;
    private int edidVersionMinor;
    private int inputFlags;
    private int screenSizeH;
    private int screenSizeV;
    private int gammaMod;
    private int featuresFlags;
    private ChromacityInfo chromacity;
    private EstTimingsInfo estTimings;
    private ArrayList<StdTiming> stdTimings;
    private Edid _root;
    private KaitaiStruct _parent;
    private ArrayList<byte[]> _raw_stdTimings;
    public byte[] magic() { return magic; }
    public int mfgBytes() { return mfgBytes; }

    /**
     * Manufacturer product code
     */
    public int productCode() { return productCode; }

    /**
     * Serial number
     */
    public long serial() { return serial; }

    /**
     * Week of manufacture. Week numbering is not consistent between manufacturers.
     */
    public int mfgWeek() { return mfgWeek; }

    /**
     * Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
     */
    public int mfgYearMod() { return mfgYearMod; }

    /**
     * EDID version, usually 1 (for 1.3)
     */
    public int edidVersionMajor() { return edidVersionMajor; }

    /**
     * EDID revision, usually 3 (for 1.3)
     */
    public int edidVersionMinor() { return edidVersionMinor; }
    public int inputFlags() { return inputFlags; }

    /**
     * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
     */
    public int screenSizeH() { return screenSizeH; }

    /**
     * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
     */
    public int screenSizeV() { return screenSizeV; }

    /**
     * Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54)
     */
    public int gammaMod() { return gammaMod; }
    public int featuresFlags() { return featuresFlags; }

    /**
     * Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
     * @see "Standard, section 3.7"
     */
    public ChromacityInfo chromacity() { return chromacity; }

    /**
     * Block of bit flags that indicates support of so called
     * "established timings", which is a commonly used subset of VESA
     * DMT (Discrete Monitor Timings) modes.
     * @see "Standard, section 3.8"
     */
    public EstTimingsInfo estTimings() { return estTimings; }

    /**
     * Array of descriptions of so called "standard timings", which are
     * used to specify up to 8 additional timings not included in
     * "established timings".
     */
    public ArrayList<StdTiming> stdTimings() { return stdTimings; }
    public Edid _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public ArrayList<byte[]> _raw_stdTimings() { return _raw_stdTimings; }
}
