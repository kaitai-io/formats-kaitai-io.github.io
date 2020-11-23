// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;


/**
 * The **BMP file format**, also known as **bitmap image file** or **device independent
 * bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
 * format used to store bitmap digital images, independently of the display
 * device (such as a graphics adapter), especially on Microsoft Windows
 * and OS/2 operating systems.
 * 
 * ## Samples
 * 
 * Great collection of various BMP sample files:
 * [**BMP Suite Image List**](
 *   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
 * ) (by Jason Summers)
 * 
 * If only there was such a comprehensive sample suite for every file format! It's like
 * a dream for every developer of any binary file format parser. It contains a lot of
 * different types and variations of BMP files, even the tricky ones, where it's not clear
 * from the specification how to deal with them (marked there as "**q**uestionable").
 * 
 * If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
 * BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
 * extensive support of BMP files in the universe!
 * 
 * ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
 * 
 * A beneficial discussion on Adobe forum (archived):
 * [**Invalid BMP Format with Alpha channel**](
 *   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
 * )
 * 
 * In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
 * any documentation available for this header at the time (and still isn't).
 * However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
 * of proprietary header and everything they were writing was taken directly
 * from the Microsoft documentation.
 * 
 * It showed up that the unknown header was called BITMAPV3INFOHEADER.
 * Although Microsoft has apparently requested and verified the use of the header,
 * the documentation on MSDN has probably got lost and they have probably
 * forgotten about this type of header.
 * 
 * This is the only source I could find about these structures, so we could't rely
 * on it so much, but I think supporting them as a read-only format won't harm anything.
 * Due to the fact that it isn't documented anywhere else, most applications don't support it.
 * 
 * All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
 * 
 * ![Bitmap headers overview](
 *   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
 * )
 * 
 * ## Specs
 *  * [Bitmap Storage (Windows Dev Center)](
 *      https://docs.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
 *    )
 *     * BITMAPFILEHEADER
 *     * BITMAPINFOHEADER
 *     * BITMAPV4HEADER
 *     * BITMAPV5HEADER
 *  * [OS/2 Bitmap File Format](
 *       https://www.fileformat.info/format/os2bmp/egff.htm
 *    )
 *     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
 *     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
 *     * OS22XBITMAPHEADER
 *  * [Microsoft Windows Bitmap](
 *       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
 *    )
 *     * BITMAPFILEHEADER (WINBMPFILEHEADER)
 *     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
 *     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
 *     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
 */
public class Bmp extends KaitaiStruct {
    public static Bmp fromFile(String fileName) throws IOException {
        return new Bmp(new ByteBufferKaitaiStream(fileName));
    }

    public enum Intent {
        BUSINESS(1),
        GRAPHICS(2),
        IMAGES(4),
        ABS_COLORIMETRIC(8);

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

    public enum ColorSpace {
        CALIBRATED_RGB(0),
        PROFILE_LINKED(1279872587),
        PROFILE_EMBEDDED(1296188740),
        WINDOWS(1466527264),
        S_RGB(1934772034);

        private final long id;
        ColorSpace(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ColorSpace> byId = new HashMap<Long, ColorSpace>(5);
        static {
            for (ColorSpace e : ColorSpace.values())
                byId.put(e.id(), e);
        }
        public static ColorSpace byId(long id) { return byId.get(id); }
    }

    public enum Os2Rendering {
        NO_HALFTONING(0),
        ERROR_DIFFUSION(1),
        PANDA(2),
        SUPER_CIRCLE(3);

        private final long id;
        Os2Rendering(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Os2Rendering> byId = new HashMap<Long, Os2Rendering>(4);
        static {
            for (Os2Rendering e : Os2Rendering.values())
                byId.put(e.id(), e);
        }
        public static Os2Rendering byId(long id) { return byId.get(id); }
    }

    public enum HeaderType {
        BITMAP_CORE_HEADER(12),
        BITMAP_INFO_HEADER(40),
        BITMAP_V2_INFO_HEADER(52),
        BITMAP_V3_INFO_HEADER(56),
        OS2_2X_BITMAP_HEADER(64),
        BITMAP_V4_HEADER(108),
        BITMAP_V5_HEADER(124);

        private final long id;
        HeaderType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HeaderType> byId = new HashMap<Long, HeaderType>(7);
        static {
            for (HeaderType e : HeaderType.values())
                byId.put(e.id(), e);
        }
        public static HeaderType byId(long id) { return byId.get(id); }
    }

    public enum Compressions {
        RGB(0),
        RLE8(1),
        RLE4(2),
        BITFIELDS(3),
        JPEG(4),
        PNG(5),
        ALPHA_BITFIELDS(6);

        private final long id;
        Compressions(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compressions> byId = new HashMap<Long, Compressions>(7);
        static {
            for (Compressions e : Compressions.values())
                byId.put(e.id(), e);
        }
        public static Compressions byId(long id) { return byId.get(id); }
    }

    public enum Os2Compressions {
        RGB(0),
        RLE8(1),
        RLE4(2),
        HUFFMAN_1D(3),
        RLE24(4);

        private final long id;
        Os2Compressions(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Os2Compressions> byId = new HashMap<Long, Os2Compressions>(5);
        static {
            for (Os2Compressions e : Os2Compressions.values())
                byId.put(e.id(), e);
        }
        public static Os2Compressions byId(long id) { return byId.get(id); }
    }

    public Bmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Bmp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Bmp(KaitaiStream _io, KaitaiStruct _parent, Bmp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileHdr = new FileHeader(this._io, this, _root);
        this._raw_dibInfo = this._io.readBytes((fileHdr().ofsBitmap() - 14));
        KaitaiStream _io__raw_dibInfo = new ByteBufferKaitaiStream(_raw_dibInfo);
        this.dibInfo = new BitmapInfo(_io__raw_dibInfo, this, _root);
        this._raw_bitmap = this._io.readBytesFull();
        KaitaiStream _io__raw_bitmap = new ByteBufferKaitaiStream(_raw_bitmap);
        this.bitmap = new Bitmap(_io__raw_bitmap, this, _root);
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz">Source</a>
     */
    public static class CieXyz extends KaitaiStruct {
        public static CieXyz fromFile(String fileName) throws IOException {
            return new CieXyz(new ByteBufferKaitaiStream(fileName));
        }

        public CieXyz(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CieXyz(KaitaiStream _io, Bmp.BitmapV4Extension _parent) {
            this(_io, _parent, null);
        }

        public CieXyz(KaitaiStream _io, Bmp.BitmapV4Extension _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.x = new FixedPoint2Dot30(this._io, this, _root);
            this.y = new FixedPoint2Dot30(this._io, this, _root);
            this.z = new FixedPoint2Dot30(this._io, this, _root);
        }
        private FixedPoint2Dot30 x;
        private FixedPoint2Dot30 y;
        private FixedPoint2Dot30 z;
        private Bmp _root;
        private Bmp.BitmapV4Extension _parent;
        public FixedPoint2Dot30 x() { return x; }
        public FixedPoint2Dot30 y() { return y; }
        public FixedPoint2Dot30 z() { return z; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapV4Extension _parent() { return _parent; }
    }
    public static class RgbRecord extends KaitaiStruct {

        public RgbRecord(KaitaiStream _io, boolean hasReservedField) {
            this(_io, null, null, hasReservedField);
        }

        public RgbRecord(KaitaiStream _io, Bmp.ColorTable _parent, boolean hasReservedField) {
            this(_io, _parent, null, hasReservedField);
        }

        public RgbRecord(KaitaiStream _io, Bmp.ColorTable _parent, Bmp _root, boolean hasReservedField) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasReservedField = hasReservedField;
            _read();
        }
        private void _read() {
            this.blue = this._io.readU1();
            this.green = this._io.readU1();
            this.red = this._io.readU1();
            if (hasReservedField()) {
                this.reserved = this._io.readU1();
            }
        }
        private int blue;
        private int green;
        private int red;
        private Integer reserved;
        private boolean hasReservedField;
        private Bmp _root;
        private Bmp.ColorTable _parent;
        public int blue() { return blue; }
        public int green() { return green; }
        public int red() { return red; }
        public Integer reserved() { return reserved; }
        public boolean hasReservedField() { return hasReservedField; }
        public Bmp _root() { return _root; }
        public Bmp.ColorTable _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header">Source</a>
     */
    public static class BitmapV5Extension extends KaitaiStruct {
        public static BitmapV5Extension fromFile(String fileName) throws IOException {
            return new BitmapV5Extension(new ByteBufferKaitaiStream(fileName));
        }

        public BitmapV5Extension(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapV5Extension(KaitaiStream _io, Bmp.BitmapHeader _parent) {
            this(_io, _parent, null);
        }

        public BitmapV5Extension(KaitaiStream _io, Bmp.BitmapHeader _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.intent = Bmp.Intent.byId(this._io.readU4le());
            this.ofsProfile = this._io.readU4le();
            this.lenProfile = this._io.readU4le();
            this.reserved = this._io.readU4le();
        }
        private Boolean hasProfile;
        public Boolean hasProfile() {
            if (this.hasProfile != null)
                return this.hasProfile;
            boolean _tmp = (boolean) ( ((_parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_LINKED) || (_parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_EMBEDDED)) );
            this.hasProfile = _tmp;
            return this.hasProfile;
        }
        private Object profileData;

        /**
         * @see <a href="https://docs.microsoft.com/en-us/previous-versions/windows/desktop/wcs/using-structures-in-wcs-1-0">"If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."</a>
         */
        public Object profileData() {
            if (this.profileData != null)
                return this.profileData;
            if (hasProfile()) {
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek((14 + ofsProfile()));
                {
                    boolean on = _parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_LINKED;
                    if (on == true) {
                        this.profileData = new String(KaitaiStream.bytesTerminate(io.readBytes(lenProfile()), (byte) 0, false), Charset.forName("windows-1252"));
                    }
                    else {
                        this.profileData = io.readBytes(lenProfile());
                    }
                }
                io.seek(_pos);
            }
            return this.profileData;
        }
        private Intent intent;
        private long ofsProfile;
        private long lenProfile;
        private long reserved;
        private Bmp _root;
        private Bmp.BitmapHeader _parent;
        public Intent intent() { return intent; }

        /**
         * The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
         */
        public long ofsProfile() { return ofsProfile; }
        public long lenProfile() { return lenProfile; }
        public long reserved() { return reserved; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapHeader _parent() { return _parent; }
    }
    public static class ColorMask extends KaitaiStruct {

        public ColorMask(KaitaiStream _io, boolean hasAlphaMask) {
            this(_io, null, null, hasAlphaMask);
        }

        public ColorMask(KaitaiStream _io, KaitaiStruct _parent, boolean hasAlphaMask) {
            this(_io, _parent, null, hasAlphaMask);
        }

        public ColorMask(KaitaiStream _io, KaitaiStruct _parent, Bmp _root, boolean hasAlphaMask) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasAlphaMask = hasAlphaMask;
            _read();
        }
        private void _read() {
            this.redMask = this._io.readU4le();
            this.greenMask = this._io.readU4le();
            this.blueMask = this._io.readU4le();
            if (hasAlphaMask()) {
                this.alphaMask = this._io.readU4le();
            }
        }
        private long redMask;
        private long greenMask;
        private long blueMask;
        private Long alphaMask;
        private boolean hasAlphaMask;
        private Bmp _root;
        private KaitaiStruct _parent;
        public long redMask() { return redMask; }
        public long greenMask() { return greenMask; }
        public long blueMask() { return blueMask; }
        public Long alphaMask() { return alphaMask; }
        public boolean hasAlphaMask() { return hasAlphaMask; }
        public Bmp _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header">Source</a>
     */
    public static class BitmapV4Extension extends KaitaiStruct {
        public static BitmapV4Extension fromFile(String fileName) throws IOException {
            return new BitmapV4Extension(new ByteBufferKaitaiStream(fileName));
        }

        public BitmapV4Extension(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapV4Extension(KaitaiStream _io, Bmp.BitmapHeader _parent) {
            this(_io, _parent, null);
        }

        public BitmapV4Extension(KaitaiStream _io, Bmp.BitmapHeader _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.colorSpaceType = Bmp.ColorSpace.byId(this._io.readU4le());
            this.endpointRed = new CieXyz(this._io, this, _root);
            this.endpointGreen = new CieXyz(this._io, this, _root);
            this.endpointBlue = new CieXyz(this._io, this, _root);
            this.gammaRed = new FixedPoint16Dot16(this._io, this, _root);
            this.gammaBlue = new FixedPoint16Dot16(this._io, this, _root);
            this.gammaGreen = new FixedPoint16Dot16(this._io, this, _root);
        }
        private ColorSpace colorSpaceType;
        private CieXyz endpointRed;
        private CieXyz endpointGreen;
        private CieXyz endpointBlue;
        private FixedPoint16Dot16 gammaRed;
        private FixedPoint16Dot16 gammaBlue;
        private FixedPoint16Dot16 gammaGreen;
        private Bmp _root;
        private Bmp.BitmapHeader _parent;
        public ColorSpace colorSpaceType() { return colorSpaceType; }
        public CieXyz endpointRed() { return endpointRed; }
        public CieXyz endpointGreen() { return endpointGreen; }
        public CieXyz endpointBlue() { return endpointBlue; }
        public FixedPoint16Dot16 gammaRed() { return gammaRed; }
        public FixedPoint16Dot16 gammaBlue() { return gammaBlue; }
        public FixedPoint16Dot16 gammaGreen() { return gammaGreen; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapHeader _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/previous-versions/dd183376(v=vs.85)">Source</a>
     */
    public static class BitmapInfoExtension extends KaitaiStruct {
        public static BitmapInfoExtension fromFile(String fileName) throws IOException {
            return new BitmapInfoExtension(new ByteBufferKaitaiStream(fileName));
        }

        public BitmapInfoExtension(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapInfoExtension(KaitaiStream _io, Bmp.BitmapHeader _parent) {
            this(_io, _parent, null);
        }

        public BitmapInfoExtension(KaitaiStream _io, Bmp.BitmapHeader _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            if (!(_parent().extendsOs22xBitmap())) {
                this.compression = Bmp.Compressions.byId(this._io.readU4le());
            }
            if (_parent().extendsOs22xBitmap()) {
                this.os2Compression = Bmp.Os2Compressions.byId(this._io.readU4le());
            }
            this.lenImage = this._io.readU4le();
            this.xResolution = this._io.readU4le();
            this.yResolution = this._io.readU4le();
            this.numColorsUsed = this._io.readU4le();
            this.numColorsImportant = this._io.readU4le();
        }
        private Compressions compression;
        private Os2Compressions os2Compression;
        private long lenImage;
        private long xResolution;
        private long yResolution;
        private long numColorsUsed;
        private long numColorsImportant;
        private Bmp _root;
        private Bmp.BitmapHeader _parent;
        public Compressions compression() { return compression; }
        public Os2Compressions os2Compression() { return os2Compression; }

        /**
         * If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
         * This may be set to zero for BI_RGB bitmaps.
         */
        public long lenImage() { return lenImage; }
        public long xResolution() { return xResolution; }
        public long yResolution() { return yResolution; }
        public long numColorsUsed() { return numColorsUsed; }
        public long numColorsImportant() { return numColorsImportant; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapHeader _parent() { return _parent; }
    }
    public static class FixedPoint2Dot30 extends KaitaiStruct {
        public static FixedPoint2Dot30 fromFile(String fileName) throws IOException {
            return new FixedPoint2Dot30(new ByteBufferKaitaiStream(fileName));
        }

        public FixedPoint2Dot30(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FixedPoint2Dot30(KaitaiStream _io, Bmp.CieXyz _parent) {
            this(_io, _parent, null);
        }

        public FixedPoint2Dot30(KaitaiStream _io, Bmp.CieXyz _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.raw = this._io.readU4le();
        }
        private Double value;
        public Double value() {
            if (this.value != null)
                return this.value;
            double _tmp = (double) (((raw() + 0.0) / (1 << 30)));
            this.value = _tmp;
            return this.value;
        }
        private long raw;
        private Bmp _root;
        private Bmp.CieXyz _parent;
        public long raw() { return raw; }
        public Bmp _root() { return _root; }
        public Bmp.CieXyz _parent() { return _parent; }
    }

    /**
     * Replace with an opaque type if you care about the pixels.
     * You can look at an example of a JavaScript implementation: https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js
     * 
     * There is a proposal for adding bitmap data type to Kaitai Struct: https://github.com/kaitai-io/kaitai_struct/issues/188
     */
    public static class Bitmap extends KaitaiStruct {
        public static Bitmap fromFile(String fileName) throws IOException {
            return new Bitmap(new ByteBufferKaitaiStream(fileName));
        }

        public Bitmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bitmap(KaitaiStream _io, Bmp _parent) {
            this(_io, _parent, null);
        }

        public Bitmap(KaitaiStream _io, Bmp _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
        }
        private Bmp _root;
        private Bmp _parent;
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader">Source</a>
     * @see <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1">Source</a>
     */
    public static class BitmapHeader extends KaitaiStruct {

        public BitmapHeader(KaitaiStream _io, long lenHeader) {
            this(_io, null, null, lenHeader);
        }

        public BitmapHeader(KaitaiStream _io, Bmp.BitmapInfo _parent, long lenHeader) {
            this(_io, _parent, null, lenHeader);
        }

        public BitmapHeader(KaitaiStream _io, Bmp.BitmapInfo _parent, Bmp _root, long lenHeader) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.lenHeader = lenHeader;
            _read();
        }
        private void _read() {
            {
                boolean on = isCoreHeader();
                if (on == true) {
                    this.imageWidth = (long) (this._io.readU2le());
                }
                else if (on == false) {
                    this.imageWidth = this._io.readU4le();
                }
            }
            {
                boolean on = isCoreHeader();
                if (on == true) {
                    this.imageHeightRaw = (int) (this._io.readS2le());
                }
                else if (on == false) {
                    this.imageHeightRaw = this._io.readS4le();
                }
            }
            this.numPlanes = this._io.readU2le();
            this.bitsPerPixel = this._io.readU2le();
            if (extendsBitmapInfo()) {
                this.bitmapInfoExt = new BitmapInfoExtension(this._io, this, _root);
            }
            if (isColorMaskHere()) {
                this.colorMask = new ColorMask(this._io, this, _root, lenHeader() != Bmp.HeaderType.BITMAP_V2_INFO_HEADER.id());
            }
            if (extendsOs22xBitmap()) {
                this.os22xBitmapExt = new Os22xBitmapExtension(this._io, this, _root);
            }
            if (extendsBitmapV4()) {
                this.bitmapV4Ext = new BitmapV4Extension(this._io, this, _root);
            }
            if (extendsBitmapV5()) {
                this.bitmapV5Ext = new BitmapV5Extension(this._io, this, _root);
            }
        }
        private Boolean extendsBitmapV4;
        public Boolean extendsBitmapV4() {
            if (this.extendsBitmapV4 != null)
                return this.extendsBitmapV4;
            boolean _tmp = (boolean) (lenHeader() >= Bmp.HeaderType.BITMAP_V4_HEADER.id());
            this.extendsBitmapV4 = _tmp;
            return this.extendsBitmapV4;
        }
        private Boolean extendsOs22xBitmap;
        public Boolean extendsOs22xBitmap() {
            if (this.extendsOs22xBitmap != null)
                return this.extendsOs22xBitmap;
            boolean _tmp = (boolean) (lenHeader() == Bmp.HeaderType.OS2_2X_BITMAP_HEADER.id());
            this.extendsOs22xBitmap = _tmp;
            return this.extendsOs22xBitmap;
        }
        private Boolean usesFixedPalette;
        public Boolean usesFixedPalette() {
            if (this.usesFixedPalette != null)
                return this.usesFixedPalette;
            boolean _tmp = (boolean) ( ((!( ((bitsPerPixel() == 16) || (bitsPerPixel() == 24) || (bitsPerPixel() == 32)) )) && (!( ((extendsBitmapInfo()) && (!(extendsOs22xBitmap())) && ( ((bitmapInfoExt().compression() == Bmp.Compressions.JPEG) || (bitmapInfoExt().compression() == Bmp.Compressions.PNG)) )) ))) );
            this.usesFixedPalette = _tmp;
            return this.usesFixedPalette;
        }
        private Boolean extendsBitmapInfo;
        public Boolean extendsBitmapInfo() {
            if (this.extendsBitmapInfo != null)
                return this.extendsBitmapInfo;
            boolean _tmp = (boolean) (lenHeader() >= Bmp.HeaderType.BITMAP_INFO_HEADER.id());
            this.extendsBitmapInfo = _tmp;
            return this.extendsBitmapInfo;
        }
        private Integer imageHeight;
        public Integer imageHeight() {
            if (this.imageHeight != null)
                return this.imageHeight;
            int _tmp = (int) ((imageHeightRaw() < 0 ? -(imageHeightRaw()) : imageHeightRaw()));
            this.imageHeight = _tmp;
            return this.imageHeight;
        }
        private Boolean isCoreHeader;
        public Boolean isCoreHeader() {
            if (this.isCoreHeader != null)
                return this.isCoreHeader;
            boolean _tmp = (boolean) (lenHeader() == Bmp.HeaderType.BITMAP_CORE_HEADER.id());
            this.isCoreHeader = _tmp;
            return this.isCoreHeader;
        }
        private Boolean extendsBitmapV5;
        public Boolean extendsBitmapV5() {
            if (this.extendsBitmapV5 != null)
                return this.extendsBitmapV5;
            boolean _tmp = (boolean) (lenHeader() >= Bmp.HeaderType.BITMAP_V5_HEADER.id());
            this.extendsBitmapV5 = _tmp;
            return this.extendsBitmapV5;
        }
        private Boolean isColorMaskHere;
        public Boolean isColorMaskHere() {
            if (this.isColorMaskHere != null)
                return this.isColorMaskHere;
            boolean _tmp = (boolean) ( ((lenHeader() == Bmp.HeaderType.BITMAP_V2_INFO_HEADER.id()) || (lenHeader() == Bmp.HeaderType.BITMAP_V3_INFO_HEADER.id()) || (extendsBitmapV4())) );
            this.isColorMaskHere = _tmp;
            return this.isColorMaskHere;
        }
        private Boolean bottomUp;
        public Boolean bottomUp() {
            if (this.bottomUp != null)
                return this.bottomUp;
            boolean _tmp = (boolean) (imageHeightRaw() > 0);
            this.bottomUp = _tmp;
            return this.bottomUp;
        }
        private Long imageWidth;
        private Integer imageHeightRaw;
        private int numPlanes;
        private int bitsPerPixel;
        private BitmapInfoExtension bitmapInfoExt;
        private ColorMask colorMask;
        private Os22xBitmapExtension os22xBitmapExt;
        private BitmapV4Extension bitmapV4Ext;
        private BitmapV5Extension bitmapV5Ext;
        private long lenHeader;
        private Bmp _root;
        private Bmp.BitmapInfo _parent;

        /**
         * Image width, px
         */
        public Long imageWidth() { return imageWidth; }

        /**
         * Image height, px (positive => bottom-up image, negative => top-down image)
         */
        public Integer imageHeightRaw() { return imageHeightRaw; }

        /**
         * Number of planes for target device, must be 1
         */
        public int numPlanes() { return numPlanes; }

        /**
         * Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
         */
        public int bitsPerPixel() { return bitsPerPixel; }
        public BitmapInfoExtension bitmapInfoExt() { return bitmapInfoExt; }
        public ColorMask colorMask() { return colorMask; }
        public Os22xBitmapExtension os22xBitmapExt() { return os22xBitmapExt; }
        public BitmapV4Extension bitmapV4Ext() { return bitmapV4Ext; }
        public BitmapV5Extension bitmapV5Ext() { return bitmapV5Ext; }
        public long lenHeader() { return lenHeader; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapInfo _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2">Source</a>
     */
    public static class Os22xBitmapExtension extends KaitaiStruct {
        public static Os22xBitmapExtension fromFile(String fileName) throws IOException {
            return new Os22xBitmapExtension(new ByteBufferKaitaiStream(fileName));
        }

        public Os22xBitmapExtension(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Os22xBitmapExtension(KaitaiStream _io, Bmp.BitmapHeader _parent) {
            this(_io, _parent, null);
        }

        public Os22xBitmapExtension(KaitaiStream _io, Bmp.BitmapHeader _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.units = this._io.readU2le();
            this.reserved = this._io.readU2le();
            this.recording = this._io.readU2le();
            this.rendering = Bmp.Os2Rendering.byId(this._io.readU2le());
            this.size1 = this._io.readU4le();
            this.size2 = this._io.readU4le();
            this.colorEncoding = this._io.readU4le();
            this.identifier = this._io.readU4le();
        }
        private int units;
        private int reserved;
        private int recording;
        private Os2Rendering rendering;
        private long size1;
        private long size2;
        private long colorEncoding;
        private long identifier;
        private Bmp _root;
        private Bmp.BitmapHeader _parent;
        public int units() { return units; }
        public int reserved() { return reserved; }

        /**
         * Specifies how the bitmap scan lines are stored.
         * The only valid value for this field is 0, indicating that the bitmap is
         * stored from left to right and from the bottom up.
         */
        public int recording() { return recording; }

        /**
         * Specifies the halftoning algorithm used on the bitmap data.
         */
        public Os2Rendering rendering() { return rendering; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => error damping as a percentage in the range 0 through 100
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => X dimension of the pattern used in pixels
         */
        public long size1() { return size1; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => not used
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => Y dimension of the pattern used in pixels
         */
        public long size2() { return size2; }

        /**
         * Specifies the color model used to describe the bitmap data.
         * The only valid value is 0, indicating the RGB encoding scheme.
         */
        public long colorEncoding() { return colorEncoding; }

        /**
         * Application-specific value
         */
        public long identifier() { return identifier; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapHeader _parent() { return _parent; }
    }
    public static class FixedPoint16Dot16 extends KaitaiStruct {
        public static FixedPoint16Dot16 fromFile(String fileName) throws IOException {
            return new FixedPoint16Dot16(new ByteBufferKaitaiStream(fileName));
        }

        public FixedPoint16Dot16(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FixedPoint16Dot16(KaitaiStream _io, Bmp.BitmapV4Extension _parent) {
            this(_io, _parent, null);
        }

        public FixedPoint16Dot16(KaitaiStream _io, Bmp.BitmapV4Extension _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.raw = this._io.readU4le();
        }
        private Double value;
        public Double value() {
            if (this.value != null)
                return this.value;
            double _tmp = (double) (((raw() + 0.0) / (1 << 16)));
            this.value = _tmp;
            return this.value;
        }
        private long raw;
        private Bmp _root;
        private Bmp.BitmapV4Extension _parent;
        public long raw() { return raw; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapV4Extension _parent() { return _parent; }
    }
    public static class ColorTable extends KaitaiStruct {

        public ColorTable(KaitaiStream _io, boolean hasReservedField, long numColors) {
            this(_io, null, null, hasReservedField, numColors);
        }

        public ColorTable(KaitaiStream _io, Bmp.BitmapInfo _parent, boolean hasReservedField, long numColors) {
            this(_io, _parent, null, hasReservedField, numColors);
        }

        public ColorTable(KaitaiStream _io, Bmp.BitmapInfo _parent, Bmp _root, boolean hasReservedField, long numColors) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasReservedField = hasReservedField;
            this.numColors = numColors;
            _read();
        }
        private void _read() {
            colors = new ArrayList<RgbRecord>(((Number) (( ((numColors() > 0) && (numColors() < numColorsPresent()))  ? numColors() : numColorsPresent()))).intValue());
            for (int i = 0; i < ( ((numColors() > 0) && (numColors() < numColorsPresent()))  ? numColors() : numColorsPresent()); i++) {
                this.colors.add(new RgbRecord(this._io, this, _root, hasReservedField()));
            }
        }
        private Integer numColorsPresent;
        public Integer numColorsPresent() {
            if (this.numColorsPresent != null)
                return this.numColorsPresent;
            int _tmp = (int) ((_io().size() / (hasReservedField() ? 4 : 3)));
            this.numColorsPresent = _tmp;
            return this.numColorsPresent;
        }
        private ArrayList<RgbRecord> colors;
        private boolean hasReservedField;
        private long numColors;
        private Bmp _root;
        private Bmp.BitmapInfo _parent;
        public ArrayList<RgbRecord> colors() { return colors; }
        public boolean hasReservedField() { return hasReservedField; }

        /**
         * If equal to 0, the pallete should contain as many colors as can fit into the pixel value
         * according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
         * represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
         * it reads as many colors as it can until EOS is reached (and the image data begin).
         */
        public long numColors() { return numColors; }
        public Bmp _root() { return _root; }
        public Bmp.BitmapInfo _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader">Source</a>
     */
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, Bmp _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, Bmp _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileType = this._io.readBytes(2);
            if (!(Arrays.equals(fileType(), new byte[] { 66, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 77 }, fileType(), _io(), "/types/file_header/seq/0");
            }
            this.lenFile = this._io.readU4le();
            this.reserved1 = this._io.readU2le();
            this.reserved2 = this._io.readU2le();
            this.ofsBitmap = this._io.readS4le();
        }
        private byte[] fileType;
        private long lenFile;
        private int reserved1;
        private int reserved2;
        private int ofsBitmap;
        private Bmp _root;
        private Bmp _parent;
        public byte[] fileType() { return fileType; }

        /**
         * not reliable, mostly ignored by BMP decoders
         */
        public long lenFile() { return lenFile; }
        public int reserved1() { return reserved1; }
        public int reserved2() { return reserved2; }

        /**
         * Offset to actual raw pixel data of the image
         */
        public int ofsBitmap() { return ofsBitmap; }
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo">Source</a>
     */
    public static class BitmapInfo extends KaitaiStruct {
        public static BitmapInfo fromFile(String fileName) throws IOException {
            return new BitmapInfo(new ByteBufferKaitaiStream(fileName));
        }

        public BitmapInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapInfo(KaitaiStream _io, Bmp _parent) {
            this(_io, _parent, null);
        }

        public BitmapInfo(KaitaiStream _io, Bmp _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenHeader = this._io.readU4le();
            this._raw_header = this._io.readBytes((lenHeader() - 4));
            KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
            this.header = new BitmapHeader(_io__raw_header, this, _root, lenHeader());
            if (isColorMaskHere()) {
                this.colorMask = new ColorMask(this._io, this, _root, header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS);
            }
            if (!(_io().isEof())) {
                this._raw_colorTable = this._io.readBytesFull();
                KaitaiStream _io__raw_colorTable = new ByteBufferKaitaiStream(_raw_colorTable);
                this.colorTable = new ColorTable(_io__raw_colorTable, this, _root, !(header().isCoreHeader()), (header().extendsBitmapInfo() ? header().bitmapInfoExt().numColorsUsed() : 0));
            }
        }
        private Boolean isColorMaskGiven;
        public Boolean isColorMaskGiven() {
            if (this.isColorMaskGiven != null)
                return this.isColorMaskGiven;
            boolean _tmp = (boolean) ( ((header().extendsBitmapInfo()) && ( ((header().bitmapInfoExt().compression() == Bmp.Compressions.BITFIELDS) || (header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS)) ) && ( ((isColorMaskHere()) || (header().isColorMaskHere())) )) );
            this.isColorMaskGiven = _tmp;
            return this.isColorMaskGiven;
        }
        private ColorMask colorMaskGiven;
        public ColorMask colorMaskGiven() {
            if (this.colorMaskGiven != null)
                return this.colorMaskGiven;
            if (isColorMaskGiven()) {
                this.colorMaskGiven = (isColorMaskHere() ? colorMask() : header().colorMask());
            }
            return this.colorMaskGiven;
        }
        private Long colorMaskBlue;
        public Long colorMaskBlue() {
            if (this.colorMaskBlue != null)
                return this.colorMaskBlue;
            long _tmp = (long) ((isColorMaskGiven() ? colorMaskGiven().blueMask() : (header().bitsPerPixel() == 16 ? 31 : ( ((header().bitsPerPixel() == 24) || (header().bitsPerPixel() == 32))  ? 255 : 0))));
            this.colorMaskBlue = _tmp;
            return this.colorMaskBlue;
        }
        private Long colorMaskAlpha;
        public Long colorMaskAlpha() {
            if (this.colorMaskAlpha != null)
                return this.colorMaskAlpha;
            long _tmp = (long) (( ((isColorMaskGiven()) && (colorMaskGiven().hasAlphaMask()))  ? colorMaskGiven().alphaMask() : 0));
            this.colorMaskAlpha = _tmp;
            return this.colorMaskAlpha;
        }
        private Integer colorMaskGreen;
        public Integer colorMaskGreen() {
            if (this.colorMaskGreen != null)
                return this.colorMaskGreen;
            int _tmp = (int) ((isColorMaskGiven() ? colorMaskGiven().greenMask() : (header().bitsPerPixel() == 16 ? 992 : ( ((header().bitsPerPixel() == 24) || (header().bitsPerPixel() == 32))  ? 65280 : 0))));
            this.colorMaskGreen = _tmp;
            return this.colorMaskGreen;
        }
        private Boolean isColorMaskHere;
        public Boolean isColorMaskHere() {
            if (this.isColorMaskHere != null)
                return this.isColorMaskHere;
            boolean _tmp = (boolean) ( ((!(_io().isEof())) && (header().lenHeader() == Bmp.HeaderType.BITMAP_INFO_HEADER.id()) && ( ((header().bitmapInfoExt().compression() == Bmp.Compressions.BITFIELDS) || (header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS)) )) );
            this.isColorMaskHere = _tmp;
            return this.isColorMaskHere;
        }
        private Integer colorMaskRed;
        public Integer colorMaskRed() {
            if (this.colorMaskRed != null)
                return this.colorMaskRed;
            int _tmp = (int) ((isColorMaskGiven() ? colorMaskGiven().redMask() : (header().bitsPerPixel() == 16 ? 31744 : ( ((header().bitsPerPixel() == 24) || (header().bitsPerPixel() == 32))  ? 16711680 : 0))));
            this.colorMaskRed = _tmp;
            return this.colorMaskRed;
        }
        private long lenHeader;
        private BitmapHeader header;
        private ColorMask colorMask;
        private ColorTable colorTable;
        private Bmp _root;
        private Bmp _parent;
        private byte[] _raw_header;
        private byte[] _raw_colorTable;
        public long lenHeader() { return lenHeader; }
        public BitmapHeader header() { return header; }

        /**
         * Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
         */
        public ColorMask colorMask() { return colorMask; }
        public ColorTable colorTable() { return colorTable; }
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
        public byte[] _raw_header() { return _raw_header; }
        public byte[] _raw_colorTable() { return _raw_colorTable; }
    }
    private FileHeader fileHdr;
    private BitmapInfo dibInfo;
    private Bitmap bitmap;
    private Bmp _root;
    private KaitaiStruct _parent;
    private byte[] _raw_dibInfo;
    private byte[] _raw_bitmap;
    public FileHeader fileHdr() { return fileHdr; }
    public BitmapInfo dibInfo() { return dibInfo; }
    public Bitmap bitmap() { return bitmap; }
    public Bmp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_dibInfo() { return _raw_dibInfo; }
    public byte[] _raw_bitmap() { return _raw_bitmap; }
}
