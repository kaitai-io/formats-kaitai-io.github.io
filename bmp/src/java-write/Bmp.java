// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
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
 *      https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
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
public class Bmp extends KaitaiStruct.ReadWrite {
    public static Bmp fromFile(String fileName) throws IOException {
        return new Bmp(new ByteBufferKaitaiStream(fileName));
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
    public Bmp() {
        this(null, null, null);
    }

    public Bmp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Bmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Bmp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Bmp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.fileHdr = new FileHeader(this._io, this, _root);
        this.fileHdr._read();
        this._raw_dibInfo = this._io.readBytes(fileHdr().ofsBitmap() - 14);
        KaitaiStream _io__raw_dibInfo = new ByteBufferKaitaiStream(this._raw_dibInfo);
        this.dibInfo = new BitmapInfo(_io__raw_dibInfo, this, _root);
        this.dibInfo._read();
        this._raw_bitmap = this._io.readBytesFull();
        KaitaiStream _io__raw_bitmap = new ByteBufferKaitaiStream(this._raw_bitmap);
        this.bitmap = new Bitmap(_io__raw_bitmap, this, _root);
        this.bitmap._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.fileHdr._fetchInstances();
        this.dibInfo._fetchInstances();
        this.bitmap._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.fileHdr._write_Seq(this._io);
        final KaitaiStream _io__raw_dibInfo = new ByteBufferKaitaiStream(fileHdr().ofsBitmap() - 14);
        this._io.addChildStream(_io__raw_dibInfo);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (fileHdr().ofsBitmap() - 14));
            final Bmp _this = this;
            _io__raw_dibInfo.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_dibInfo = _io__raw_dibInfo.toByteArray();
                    if (_this._raw_dibInfo.length != fileHdr().ofsBitmap() - 14)
                        throw new ConsistencyError("raw(dib_info)", fileHdr().ofsBitmap() - 14, _this._raw_dibInfo.length);
                    parent.writeBytes(_this._raw_dibInfo);
                }
            });
        }
        this.dibInfo._write_Seq(_io__raw_dibInfo);
        final KaitaiStream _io__raw_bitmap = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
        this._io.addChildStream(_io__raw_bitmap);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
            final Bmp _this = this;
            _io__raw_bitmap.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_bitmap = _io__raw_bitmap.toByteArray();
                    parent.writeBytes(_this._raw_bitmap);
                    if (!(parent.isEof()))
                        throw new ConsistencyError("raw(bitmap)", 0, parent.size() - parent.pos());
                }
            });
        }
        this.bitmap._write_Seq(_io__raw_bitmap);
    }

    public void _check() {
        if (!Objects.equals(this.fileHdr._root(), _root()))
            throw new ConsistencyError("file_hdr", _root(), this.fileHdr._root());
        if (!Objects.equals(this.fileHdr._parent(), this))
            throw new ConsistencyError("file_hdr", this, this.fileHdr._parent());
        if (!Objects.equals(this.dibInfo._root(), _root()))
            throw new ConsistencyError("dib_info", _root(), this.dibInfo._root());
        if (!Objects.equals(this.dibInfo._parent(), this))
            throw new ConsistencyError("dib_info", this, this.dibInfo._parent());
        if (!Objects.equals(this.bitmap._root(), _root()))
            throw new ConsistencyError("bitmap", _root(), this.bitmap._root());
        if (!Objects.equals(this.bitmap._parent(), this))
            throw new ConsistencyError("bitmap", this, this.bitmap._parent());
        _dirty = false;
    }

    /**
     * Replace with an opaque type if you care about the pixels. You can look at
     * an example of a JavaScript implementation:
     * <https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js>
     * 
     * There is a proposal for adding bitmap data type to Kaitai Struct:
     * <https://github.com/kaitai-io/kaitai_struct/issues/188>
     */
    public static class Bitmap extends KaitaiStruct.ReadWrite {
        public static Bitmap fromFile(String fileName) throws IOException {
            return new Bitmap(new ByteBufferKaitaiStream(fileName));
        }
        public Bitmap() {
            this(null, null, null);
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
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
        }

        public void _check() {
            _dirty = false;
        }
        private Bmp _root;
        private Bmp _parent;
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp _parent() { return _parent; }
        public void set_parent(Bmp _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader">Source</a>
     * @see <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1">Source</a>
     */
    public static class BitmapHeader extends KaitaiStruct.ReadWrite {
        public BitmapHeader(long lenHeader) {
            this(null, null, null, lenHeader);
        }

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
        }
        public void _read() {
            {
                boolean on = isCoreHeader();
                if (on == false) {
                    this.imageWidth = this._io.readU4le();
                }
                else if (on == true) {
                    this.imageWidth = ((Number) (this._io.readU2le())).longValue();
                }
            }
            {
                boolean on = isCoreHeader();
                if (on == false) {
                    this.imageHeightRaw = this._io.readS4le();
                }
                else if (on == true) {
                    this.imageHeightRaw = ((Number) (this._io.readS2le())).intValue();
                }
            }
            this.numPlanes = this._io.readU2le();
            this.bitsPerPixel = this._io.readU2le();
            if (extendsBitmapInfo()) {
                this.bitmapInfoExt = new BitmapInfoExtension(this._io, this, _root);
                this.bitmapInfoExt._read();
            }
            if (isColorMaskHere()) {
                this.colorMask = new ColorMask(this._io, this, _root, lenHeader() != Bmp.HeaderType.BITMAP_V2_INFO_HEADER.id());
                this.colorMask._read();
            }
            if (extendsOs22xBitmap()) {
                this.os22xBitmapExt = new Os22xBitmapExtension(this._io, this, _root);
                this.os22xBitmapExt._read();
            }
            if (extendsBitmapV4()) {
                this.bitmapV4Ext = new BitmapV4Extension(this._io, this, _root);
                this.bitmapV4Ext._read();
            }
            if (extendsBitmapV5()) {
                this.bitmapV5Ext = new BitmapV5Extension(this._io, this, _root);
                this.bitmapV5Ext._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                boolean on = isCoreHeader();
                if (on == false) {
                }
                else if (on == true) {
                }
            }
            {
                boolean on = isCoreHeader();
                if (on == false) {
                }
                else if (on == true) {
                }
            }
            if (extendsBitmapInfo()) {
                this.bitmapInfoExt._fetchInstances();
            }
            if (isColorMaskHere()) {
                this.colorMask._fetchInstances();
            }
            if (extendsOs22xBitmap()) {
                this.os22xBitmapExt._fetchInstances();
            }
            if (extendsBitmapV4()) {
                this.bitmapV4Ext._fetchInstances();
            }
            if (extendsBitmapV5()) {
                this.bitmapV5Ext._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            {
                boolean on = isCoreHeader();
                if (on == false) {
                    this._io.writeU4le(this.imageWidth);
                }
                else if (on == true) {
                    this._io.writeU2le(((Number) (this.imageWidth)).intValue());
                }
            }
            {
                boolean on = isCoreHeader();
                if (on == false) {
                    this._io.writeS4le(this.imageHeightRaw);
                }
                else if (on == true) {
                    this._io.writeS2le(((Number) (this.imageHeightRaw)).shortValue());
                }
            }
            this._io.writeU2le(this.numPlanes);
            this._io.writeU2le(this.bitsPerPixel);
            if (extendsBitmapInfo()) {
                this.bitmapInfoExt._write_Seq(this._io);
            }
            if (isColorMaskHere()) {
                this.colorMask._write_Seq(this._io);
            }
            if (extendsOs22xBitmap()) {
                this.os22xBitmapExt._write_Seq(this._io);
            }
            if (extendsBitmapV4()) {
                this.bitmapV4Ext._write_Seq(this._io);
            }
            if (extendsBitmapV5()) {
                this.bitmapV5Ext._write_Seq(this._io);
            }
        }

        public void _check() {
            {
                boolean on = isCoreHeader();
                if (on == false) {
                }
                else if (on == true) {
                }
            }
            {
                boolean on = isCoreHeader();
                if (on == false) {
                }
                else if (on == true) {
                }
            }
            if (extendsBitmapInfo()) {
                if (!Objects.equals(this.bitmapInfoExt._root(), _root()))
                    throw new ConsistencyError("bitmap_info_ext", _root(), this.bitmapInfoExt._root());
                if (!Objects.equals(this.bitmapInfoExt._parent(), this))
                    throw new ConsistencyError("bitmap_info_ext", this, this.bitmapInfoExt._parent());
            }
            if (isColorMaskHere()) {
                if (!Objects.equals(this.colorMask._root(), _root()))
                    throw new ConsistencyError("color_mask", _root(), this.colorMask._root());
                if (!Objects.equals(this.colorMask._parent(), this))
                    throw new ConsistencyError("color_mask", this, this.colorMask._parent());
                if (this.colorMask.hasAlphaMask() != (lenHeader() != Bmp.HeaderType.BITMAP_V2_INFO_HEADER.id()))
                    throw new ConsistencyError("color_mask", lenHeader() != Bmp.HeaderType.BITMAP_V2_INFO_HEADER.id(), this.colorMask.hasAlphaMask());
            }
            if (extendsOs22xBitmap()) {
                if (!Objects.equals(this.os22xBitmapExt._root(), _root()))
                    throw new ConsistencyError("os2_2x_bitmap_ext", _root(), this.os22xBitmapExt._root());
                if (!Objects.equals(this.os22xBitmapExt._parent(), this))
                    throw new ConsistencyError("os2_2x_bitmap_ext", this, this.os22xBitmapExt._parent());
            }
            if (extendsBitmapV4()) {
                if (!Objects.equals(this.bitmapV4Ext._root(), _root()))
                    throw new ConsistencyError("bitmap_v4_ext", _root(), this.bitmapV4Ext._root());
                if (!Objects.equals(this.bitmapV4Ext._parent(), this))
                    throw new ConsistencyError("bitmap_v4_ext", this, this.bitmapV4Ext._parent());
            }
            if (extendsBitmapV5()) {
                if (!Objects.equals(this.bitmapV5Ext._root(), _root()))
                    throw new ConsistencyError("bitmap_v5_ext", _root(), this.bitmapV5Ext._root());
                if (!Objects.equals(this.bitmapV5Ext._parent(), this))
                    throw new ConsistencyError("bitmap_v5_ext", this, this.bitmapV5Ext._parent());
            }
            _dirty = false;
        }
        private Boolean bottomUp;
        public Boolean bottomUp() {
            if (this.bottomUp != null)
                return this.bottomUp;
            this.bottomUp = imageHeightRaw() > 0;
            return this.bottomUp;
        }
        public void _invalidateBottomUp() { this.bottomUp = null; }
        private Boolean extendsBitmapInfo;
        public Boolean extendsBitmapInfo() {
            if (this.extendsBitmapInfo != null)
                return this.extendsBitmapInfo;
            this.extendsBitmapInfo = lenHeader() >= Bmp.HeaderType.BITMAP_INFO_HEADER.id();
            return this.extendsBitmapInfo;
        }
        public void _invalidateExtendsBitmapInfo() { this.extendsBitmapInfo = null; }
        private Boolean extendsBitmapV4;
        public Boolean extendsBitmapV4() {
            if (this.extendsBitmapV4 != null)
                return this.extendsBitmapV4;
            this.extendsBitmapV4 = lenHeader() >= Bmp.HeaderType.BITMAP_V4_HEADER.id();
            return this.extendsBitmapV4;
        }
        public void _invalidateExtendsBitmapV4() { this.extendsBitmapV4 = null; }
        private Boolean extendsBitmapV5;
        public Boolean extendsBitmapV5() {
            if (this.extendsBitmapV5 != null)
                return this.extendsBitmapV5;
            this.extendsBitmapV5 = lenHeader() >= Bmp.HeaderType.BITMAP_V5_HEADER.id();
            return this.extendsBitmapV5;
        }
        public void _invalidateExtendsBitmapV5() { this.extendsBitmapV5 = null; }
        private Boolean extendsOs22xBitmap;
        public Boolean extendsOs22xBitmap() {
            if (this.extendsOs22xBitmap != null)
                return this.extendsOs22xBitmap;
            this.extendsOs22xBitmap = lenHeader() == Bmp.HeaderType.OS2_2X_BITMAP_HEADER.id();
            return this.extendsOs22xBitmap;
        }
        public void _invalidateExtendsOs22xBitmap() { this.extendsOs22xBitmap = null; }
        private Integer imageHeight;
        public Integer imageHeight() {
            if (this.imageHeight != null)
                return this.imageHeight;
            this.imageHeight = ((Number) ((imageHeightRaw() < 0 ? -(imageHeightRaw()) : imageHeightRaw()))).intValue();
            return this.imageHeight;
        }
        public void _invalidateImageHeight() { this.imageHeight = null; }
        private Boolean isColorMaskHere;
        public Boolean isColorMaskHere() {
            if (this.isColorMaskHere != null)
                return this.isColorMaskHere;
            this.isColorMaskHere =  ((lenHeader() == Bmp.HeaderType.BITMAP_V2_INFO_HEADER.id()) || (lenHeader() == Bmp.HeaderType.BITMAP_V3_INFO_HEADER.id()) || (extendsBitmapV4())) ;
            return this.isColorMaskHere;
        }
        public void _invalidateIsColorMaskHere() { this.isColorMaskHere = null; }
        private Boolean isCoreHeader;
        public Boolean isCoreHeader() {
            if (this.isCoreHeader != null)
                return this.isCoreHeader;
            this.isCoreHeader = lenHeader() == Bmp.HeaderType.BITMAP_CORE_HEADER.id();
            return this.isCoreHeader;
        }
        public void _invalidateIsCoreHeader() { this.isCoreHeader = null; }
        private Boolean usesFixedPalette;
        public Boolean usesFixedPalette() {
            if (this.usesFixedPalette != null)
                return this.usesFixedPalette;
            this.usesFixedPalette =  ((!( ((bitsPerPixel() == 16) || (bitsPerPixel() == 24) || (bitsPerPixel() == 32)) )) && (!( ((extendsBitmapInfo()) && (!(extendsOs22xBitmap())) && ( ((bitmapInfoExt().compression() == Bmp.Compressions.JPEG) || (bitmapInfoExt().compression() == Bmp.Compressions.PNG)) )) ))) ;
            return this.usesFixedPalette;
        }
        public void _invalidateUsesFixedPalette() { this.usesFixedPalette = null; }
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
        public void setImageWidth(Long _v) { _dirty = true; imageWidth = _v; }

        /**
         * Image height, px (positive => bottom-up image, negative => top-down image)
         */
        public Integer imageHeightRaw() { return imageHeightRaw; }
        public void setImageHeightRaw(Integer _v) { _dirty = true; imageHeightRaw = _v; }

        /**
         * Number of planes for target device, must be 1
         */
        public int numPlanes() { return numPlanes; }
        public void setNumPlanes(int _v) { _dirty = true; numPlanes = _v; }

        /**
         * Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
         */
        public int bitsPerPixel() { return bitsPerPixel; }
        public void setBitsPerPixel(int _v) { _dirty = true; bitsPerPixel = _v; }
        public BitmapInfoExtension bitmapInfoExt() { return bitmapInfoExt; }
        public void setBitmapInfoExt(BitmapInfoExtension _v) { _dirty = true; bitmapInfoExt = _v; }
        public ColorMask colorMask() { return colorMask; }
        public void setColorMask(ColorMask _v) { _dirty = true; colorMask = _v; }
        public Os22xBitmapExtension os22xBitmapExt() { return os22xBitmapExt; }
        public void setOs22xBitmapExt(Os22xBitmapExtension _v) { _dirty = true; os22xBitmapExt = _v; }
        public BitmapV4Extension bitmapV4Ext() { return bitmapV4Ext; }
        public void setBitmapV4Ext(BitmapV4Extension _v) { _dirty = true; bitmapV4Ext = _v; }
        public BitmapV5Extension bitmapV5Ext() { return bitmapV5Ext; }
        public void setBitmapV5Ext(BitmapV5Extension _v) { _dirty = true; bitmapV5Ext = _v; }
        public long lenHeader() { return lenHeader; }
        public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapInfo _parent() { return _parent; }
        public void set_parent(Bmp.BitmapInfo _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo">Source</a>
     */
    public static class BitmapInfo extends KaitaiStruct.ReadWrite {
        public static BitmapInfo fromFile(String fileName) throws IOException {
            return new BitmapInfo(new ByteBufferKaitaiStream(fileName));
        }
        public BitmapInfo() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenHeader = this._io.readU4le();
            this._raw_header = this._io.readBytes(lenHeader() - 4);
            KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
            this.header = new BitmapHeader(_io__raw_header, this, _root, lenHeader());
            this.header._read();
            if (isColorMaskHere()) {
                this.colorMask = new ColorMask(this._io, this, _root, header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS);
                this.colorMask._read();
            }
            if (!(_io().isEof())) {
                this._raw_colorTable = this._io.readBytesFull();
                KaitaiStream _io__raw_colorTable = new ByteBufferKaitaiStream(this._raw_colorTable);
                this.colorTable = new ColorTable(_io__raw_colorTable, this, _root, !(header().isCoreHeader()), (header().extendsBitmapInfo() ? header().bitmapInfoExt().numColorsUsed() : 0));
                this.colorTable._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            if (isColorMaskHere()) {
                this.colorMask._fetchInstances();
            }
            if (!(_io().isEof())) {
                this.colorTable._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenHeader);
            final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(lenHeader() - 4);
            this._io.addChildStream(_io__raw_header);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenHeader() - 4));
                final BitmapInfo _this = this;
                _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_header = _io__raw_header.toByteArray();
                        if (_this._raw_header.length != lenHeader() - 4)
                            throw new ConsistencyError("raw(header)", lenHeader() - 4, _this._raw_header.length);
                        parent.writeBytes(_this._raw_header);
                    }
                });
            }
            this.header._write_Seq(_io__raw_header);
            if (isColorMaskHere()) {
                if (!Objects.equals(this.colorMask._root(), _root()))
                    throw new ConsistencyError("color_mask", _root(), this.colorMask._root());
                if (!Objects.equals(this.colorMask._parent(), this))
                    throw new ConsistencyError("color_mask", this, this.colorMask._parent());
                if (this.colorMask.hasAlphaMask() != (header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS))
                    throw new ConsistencyError("color_mask", header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS, this.colorMask.hasAlphaMask());
                this.colorMask._write_Seq(this._io);
            }
            if (!(_io().isEof())) {
                if (!Objects.equals(this.colorTable._root(), _root()))
                    throw new ConsistencyError("color_table", _root(), this.colorTable._root());
                if (!Objects.equals(this.colorTable._parent(), this))
                    throw new ConsistencyError("color_table", this, this.colorTable._parent());
                if (this.colorTable.hasReservedField() != !(header().isCoreHeader()))
                    throw new ConsistencyError("color_table", !(header().isCoreHeader()), this.colorTable.hasReservedField());
                if (this.colorTable.numColors() != (header().extendsBitmapInfo() ? header().bitmapInfoExt().numColorsUsed() : 0))
                    throw new ConsistencyError("color_table", (header().extendsBitmapInfo() ? header().bitmapInfoExt().numColorsUsed() : 0), this.colorTable.numColors());
                final KaitaiStream _io__raw_colorTable = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                this._io.addChildStream(_io__raw_colorTable);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                    final BitmapInfo _this = this;
                    _io__raw_colorTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_colorTable = _io__raw_colorTable.toByteArray();
                            parent.writeBytes(_this._raw_colorTable);
                            if (!(parent.isEof()))
                                throw new ConsistencyError("raw(color_table)", 0, parent.size() - parent.pos());
                        }
                    });
                }
                this.colorTable._write_Seq(_io__raw_colorTable);
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            if (this.header.lenHeader() != lenHeader())
                throw new ConsistencyError("header", lenHeader(), this.header.lenHeader());
            _dirty = false;
        }
        private Long colorMaskAlpha;
        public Long colorMaskAlpha() {
            if (this.colorMaskAlpha != null)
                return this.colorMaskAlpha;
            this.colorMaskAlpha = ((Number) (( ((isColorMaskGiven()) && (colorMaskGiven().hasAlphaMask()))  ? colorMaskGiven().alphaMask() : 0))).longValue();
            return this.colorMaskAlpha;
        }
        public void _invalidateColorMaskAlpha() { this.colorMaskAlpha = null; }
        private Long colorMaskBlue;
        public Long colorMaskBlue() {
            if (this.colorMaskBlue != null)
                return this.colorMaskBlue;
            this.colorMaskBlue = ((Number) ((isColorMaskGiven() ? colorMaskGiven().blueMask() : (header().bitsPerPixel() == 16 ? 31 : ( ((header().bitsPerPixel() == 24) || (header().bitsPerPixel() == 32))  ? 255 : 0))))).longValue();
            return this.colorMaskBlue;
        }
        public void _invalidateColorMaskBlue() { this.colorMaskBlue = null; }
        private ColorMask colorMaskGiven;
        public ColorMask colorMaskGiven() {
            if (this.colorMaskGiven != null)
                return this.colorMaskGiven;
            if (isColorMaskGiven()) {
                this.colorMaskGiven = (isColorMaskHere() ? colorMask() : header().colorMask());
            }
            return this.colorMaskGiven;
        }
        public void _invalidateColorMaskGiven() { this.colorMaskGiven = null; }
        private Integer colorMaskGreen;
        public Integer colorMaskGreen() {
            if (this.colorMaskGreen != null)
                return this.colorMaskGreen;
            this.colorMaskGreen = ((Number) ((isColorMaskGiven() ? colorMaskGiven().greenMask() : (header().bitsPerPixel() == 16 ? 992 : ( ((header().bitsPerPixel() == 24) || (header().bitsPerPixel() == 32))  ? 65280 : 0))))).intValue();
            return this.colorMaskGreen;
        }
        public void _invalidateColorMaskGreen() { this.colorMaskGreen = null; }
        private Integer colorMaskRed;
        public Integer colorMaskRed() {
            if (this.colorMaskRed != null)
                return this.colorMaskRed;
            this.colorMaskRed = ((Number) ((isColorMaskGiven() ? colorMaskGiven().redMask() : (header().bitsPerPixel() == 16 ? 31744 : ( ((header().bitsPerPixel() == 24) || (header().bitsPerPixel() == 32))  ? 16711680 : 0))))).intValue();
            return this.colorMaskRed;
        }
        public void _invalidateColorMaskRed() { this.colorMaskRed = null; }
        private Boolean isColorMaskGiven;
        public Boolean isColorMaskGiven() {
            if (this.isColorMaskGiven != null)
                return this.isColorMaskGiven;
            this.isColorMaskGiven =  ((header().extendsBitmapInfo()) && ( ((header().bitmapInfoExt().compression() == Bmp.Compressions.BITFIELDS) || (header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS)) ) && ( ((isColorMaskHere()) || (header().isColorMaskHere())) )) ;
            return this.isColorMaskGiven;
        }
        public void _invalidateIsColorMaskGiven() { this.isColorMaskGiven = null; }
        private Boolean isColorMaskHere;
        public Boolean isColorMaskHere() {
            if (this.isColorMaskHere != null)
                return this.isColorMaskHere;
            this.isColorMaskHere =  ((!(_io().isEof())) && (header().lenHeader() == Bmp.HeaderType.BITMAP_INFO_HEADER.id()) && ( ((header().bitmapInfoExt().compression() == Bmp.Compressions.BITFIELDS) || (header().bitmapInfoExt().compression() == Bmp.Compressions.ALPHA_BITFIELDS)) )) ;
            return this.isColorMaskHere;
        }
        public void _invalidateIsColorMaskHere() { this.isColorMaskHere = null; }
        private long lenHeader;
        private BitmapHeader header;
        private ColorMask colorMask;
        private ColorTable colorTable;
        private Bmp _root;
        private Bmp _parent;
        private byte[] _raw_header;
        private byte[] _raw_colorTable;
        public long lenHeader() { return lenHeader; }
        public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
        public BitmapHeader header() { return header; }
        public void setHeader(BitmapHeader _v) { _dirty = true; header = _v; }

        /**
         * Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
         */
        public ColorMask colorMask() { return colorMask; }
        public void setColorMask(ColorMask _v) { _dirty = true; colorMask = _v; }
        public ColorTable colorTable() { return colorTable; }
        public void setColorTable(ColorTable _v) { _dirty = true; colorTable = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp _parent() { return _parent; }
        public void set_parent(Bmp _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_header() { return _raw_header; }
        public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
        public byte[] _raw_colorTable() { return _raw_colorTable; }
        public void set_raw_ColorTable(byte[] _v) { _dirty = true; _raw_colorTable = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/previous-versions/dd183376(v=vs.85)">Source</a>
     */
    public static class BitmapInfoExtension extends KaitaiStruct.ReadWrite {
        public static BitmapInfoExtension fromFile(String fileName) throws IOException {
            return new BitmapInfoExtension(new ByteBufferKaitaiStream(fileName));
        }
        public BitmapInfoExtension() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
            if (!(_parent().extendsOs22xBitmap())) {
            }
            if (_parent().extendsOs22xBitmap()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (!(_parent().extendsOs22xBitmap())) {
                this._io.writeU4le(((Number) (this.compression.id())).longValue());
            }
            if (_parent().extendsOs22xBitmap()) {
                this._io.writeU4le(((Number) (this.os2Compression.id())).longValue());
            }
            this._io.writeU4le(this.lenImage);
            this._io.writeU4le(this.xResolution);
            this._io.writeU4le(this.yResolution);
            this._io.writeU4le(this.numColorsUsed);
            this._io.writeU4le(this.numColorsImportant);
        }

        public void _check() {
            if (!(_parent().extendsOs22xBitmap())) {
            }
            if (_parent().extendsOs22xBitmap()) {
            }
            _dirty = false;
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
        public void setCompression(Compressions _v) { _dirty = true; compression = _v; }
        public Os2Compressions os2Compression() { return os2Compression; }
        public void setOs2Compression(Os2Compressions _v) { _dirty = true; os2Compression = _v; }

        /**
         * If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
         * This may be set to zero for BI_RGB bitmaps.
         */
        public long lenImage() { return lenImage; }
        public void setLenImage(long _v) { _dirty = true; lenImage = _v; }
        public long xResolution() { return xResolution; }
        public void setXResolution(long _v) { _dirty = true; xResolution = _v; }
        public long yResolution() { return yResolution; }
        public void setYResolution(long _v) { _dirty = true; yResolution = _v; }
        public long numColorsUsed() { return numColorsUsed; }
        public void setNumColorsUsed(long _v) { _dirty = true; numColorsUsed = _v; }
        public long numColorsImportant() { return numColorsImportant; }
        public void setNumColorsImportant(long _v) { _dirty = true; numColorsImportant = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapHeader _parent() { return _parent; }
        public void set_parent(Bmp.BitmapHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header">Source</a>
     */
    public static class BitmapV4Extension extends KaitaiStruct.ReadWrite {
        public static BitmapV4Extension fromFile(String fileName) throws IOException {
            return new BitmapV4Extension(new ByteBufferKaitaiStream(fileName));
        }
        public BitmapV4Extension() {
            this(null, null, null);
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
        }
        public void _read() {
            this.colorSpaceType = Bmp.ColorSpace.byId(this._io.readU4le());
            this.endpointRed = new CieXyz(this._io, this, _root);
            this.endpointRed._read();
            this.endpointGreen = new CieXyz(this._io, this, _root);
            this.endpointGreen._read();
            this.endpointBlue = new CieXyz(this._io, this, _root);
            this.endpointBlue._read();
            this.gammaRed = new FixedPoint16Dot16(this._io, this, _root);
            this.gammaRed._read();
            this.gammaBlue = new FixedPoint16Dot16(this._io, this, _root);
            this.gammaBlue._read();
            this.gammaGreen = new FixedPoint16Dot16(this._io, this, _root);
            this.gammaGreen._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.endpointRed._fetchInstances();
            this.endpointGreen._fetchInstances();
            this.endpointBlue._fetchInstances();
            this.gammaRed._fetchInstances();
            this.gammaBlue._fetchInstances();
            this.gammaGreen._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(((Number) (this.colorSpaceType.id())).longValue());
            this.endpointRed._write_Seq(this._io);
            this.endpointGreen._write_Seq(this._io);
            this.endpointBlue._write_Seq(this._io);
            this.gammaRed._write_Seq(this._io);
            this.gammaBlue._write_Seq(this._io);
            this.gammaGreen._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.endpointRed._root(), _root()))
                throw new ConsistencyError("endpoint_red", _root(), this.endpointRed._root());
            if (!Objects.equals(this.endpointRed._parent(), this))
                throw new ConsistencyError("endpoint_red", this, this.endpointRed._parent());
            if (!Objects.equals(this.endpointGreen._root(), _root()))
                throw new ConsistencyError("endpoint_green", _root(), this.endpointGreen._root());
            if (!Objects.equals(this.endpointGreen._parent(), this))
                throw new ConsistencyError("endpoint_green", this, this.endpointGreen._parent());
            if (!Objects.equals(this.endpointBlue._root(), _root()))
                throw new ConsistencyError("endpoint_blue", _root(), this.endpointBlue._root());
            if (!Objects.equals(this.endpointBlue._parent(), this))
                throw new ConsistencyError("endpoint_blue", this, this.endpointBlue._parent());
            if (!Objects.equals(this.gammaRed._root(), _root()))
                throw new ConsistencyError("gamma_red", _root(), this.gammaRed._root());
            if (!Objects.equals(this.gammaRed._parent(), this))
                throw new ConsistencyError("gamma_red", this, this.gammaRed._parent());
            if (!Objects.equals(this.gammaBlue._root(), _root()))
                throw new ConsistencyError("gamma_blue", _root(), this.gammaBlue._root());
            if (!Objects.equals(this.gammaBlue._parent(), this))
                throw new ConsistencyError("gamma_blue", this, this.gammaBlue._parent());
            if (!Objects.equals(this.gammaGreen._root(), _root()))
                throw new ConsistencyError("gamma_green", _root(), this.gammaGreen._root());
            if (!Objects.equals(this.gammaGreen._parent(), this))
                throw new ConsistencyError("gamma_green", this, this.gammaGreen._parent());
            _dirty = false;
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
        public void setColorSpaceType(ColorSpace _v) { _dirty = true; colorSpaceType = _v; }
        public CieXyz endpointRed() { return endpointRed; }
        public void setEndpointRed(CieXyz _v) { _dirty = true; endpointRed = _v; }
        public CieXyz endpointGreen() { return endpointGreen; }
        public void setEndpointGreen(CieXyz _v) { _dirty = true; endpointGreen = _v; }
        public CieXyz endpointBlue() { return endpointBlue; }
        public void setEndpointBlue(CieXyz _v) { _dirty = true; endpointBlue = _v; }
        public FixedPoint16Dot16 gammaRed() { return gammaRed; }
        public void setGammaRed(FixedPoint16Dot16 _v) { _dirty = true; gammaRed = _v; }
        public FixedPoint16Dot16 gammaBlue() { return gammaBlue; }
        public void setGammaBlue(FixedPoint16Dot16 _v) { _dirty = true; gammaBlue = _v; }
        public FixedPoint16Dot16 gammaGreen() { return gammaGreen; }
        public void setGammaGreen(FixedPoint16Dot16 _v) { _dirty = true; gammaGreen = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapHeader _parent() { return _parent; }
        public void set_parent(Bmp.BitmapHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header">Source</a>
     */
    public static class BitmapV5Extension extends KaitaiStruct.ReadWrite {
        public static BitmapV5Extension fromFile(String fileName) throws IOException {
            return new BitmapV5Extension(new ByteBufferKaitaiStream(fileName));
        }
        public BitmapV5Extension() {
            this(null, null, null);
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
        }
        public void _read() {
            this.intent = Bmp.Intent.byId(this._io.readU4le());
            this.ofsProfile = this._io.readU4le();
            this.lenProfile = this._io.readU4le();
            this.reserved = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            profileData();
            if (this.profileData != null) {
                {
                    boolean on = _parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_LINKED;
                    if (on == true) {
                    }
                    else {
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteProfileData = _enabledProfileData;
            this._io.writeU4le(((Number) (this.intent.id())).longValue());
            this._io.writeU4le(this.ofsProfile);
            this._io.writeU4le(this.lenProfile);
            this._io.writeU4le(this.reserved);
        }

        public void _check() {
            if (_enabledProfileData) {
                if (hasProfile()) {
                    {
                        boolean on = _parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_LINKED;
                        if (on == true) {
                            if ((((String) (this.profileData))).getBytes(Charset.forName("windows-1252")).length > lenProfile())
                                throw new ConsistencyError("profile_data", lenProfile(), (((String) (this.profileData))).getBytes(Charset.forName("windows-1252")).length);
                            if (KaitaiStream.byteArrayIndexOf((((String) (this.profileData))).getBytes(Charset.forName("windows-1252")), ((byte) 0)) != -1)
                                throw new ConsistencyError("profile_data", -1, KaitaiStream.byteArrayIndexOf((((String) (this.profileData))).getBytes(Charset.forName("windows-1252")), ((byte) 0)));
                        }
                        else {
                            if (((byte[]) (this.profileData)).length != lenProfile())
                                throw new ConsistencyError("profile_data", lenProfile(), ((byte[]) (this.profileData)).length);
                        }
                    }
                }
            }
            _dirty = false;
        }
        private Boolean hasProfile;
        public Boolean hasProfile() {
            if (this.hasProfile != null)
                return this.hasProfile;
            this.hasProfile =  ((_parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_LINKED) || (_parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_EMBEDDED)) ;
            return this.hasProfile;
        }
        public void _invalidateHasProfile() { this.hasProfile = null; }
        private Object profileData;
        private boolean _shouldWriteProfileData = false;
        private boolean _enabledProfileData = true;

        /**
         * @see <a href="https://learn.microsoft.com/en-us/windows/win32/wcs/using-structures-in-wcs-1-0">"If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."</a>
         */
        public Object profileData() {
            if (_shouldWriteProfileData)
                _writeProfileData();
            if (this.profileData != null)
                return this.profileData;
            if (!_enabledProfileData)
                return null;
            if (hasProfile()) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(14 + ofsProfile());
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
        public void setProfileData(Object _v) { _dirty = true; profileData = _v; }
        public void setProfileData_Enabled(boolean _v) { _dirty = true; _enabledProfileData = _v; }

        private void _writeProfileData() {
            _shouldWriteProfileData = false;
            if (hasProfile()) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(14 + ofsProfile());
                {
                    boolean on = _parent().bitmapV4Ext().colorSpaceType() == Bmp.ColorSpace.PROFILE_LINKED;
                    if (on == true) {
                        io.writeBytesLimit((((String) (this.profileData))).getBytes(Charset.forName("windows-1252")), lenProfile(), (byte) 0, (byte) 0);
                    }
                    else {
                        io.writeBytes(((byte[]) (((byte[]) (this.profileData)))));
                    }
                }
                io.seek(_pos);
            }
        }
        private Intent intent;
        private long ofsProfile;
        private long lenProfile;
        private long reserved;
        private Bmp _root;
        private Bmp.BitmapHeader _parent;
        public Intent intent() { return intent; }
        public void setIntent(Intent _v) { _dirty = true; intent = _v; }

        /**
         * The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
         */
        public long ofsProfile() { return ofsProfile; }
        public void setOfsProfile(long _v) { _dirty = true; ofsProfile = _v; }
        public long lenProfile() { return lenProfile; }
        public void setLenProfile(long _v) { _dirty = true; lenProfile = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapHeader _parent() { return _parent; }
        public void set_parent(Bmp.BitmapHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz">Source</a>
     */
    public static class CieXyz extends KaitaiStruct.ReadWrite {
        public static CieXyz fromFile(String fileName) throws IOException {
            return new CieXyz(new ByteBufferKaitaiStream(fileName));
        }
        public CieXyz() {
            this(null, null, null);
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
        }
        public void _read() {
            this.x = new FixedPoint2Dot30(this._io, this, _root);
            this.x._read();
            this.y = new FixedPoint2Dot30(this._io, this, _root);
            this.y._read();
            this.z = new FixedPoint2Dot30(this._io, this, _root);
            this.z._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.x._fetchInstances();
            this.y._fetchInstances();
            this.z._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.x._write_Seq(this._io);
            this.y._write_Seq(this._io);
            this.z._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.x._root(), _root()))
                throw new ConsistencyError("x", _root(), this.x._root());
            if (!Objects.equals(this.x._parent(), this))
                throw new ConsistencyError("x", this, this.x._parent());
            if (!Objects.equals(this.y._root(), _root()))
                throw new ConsistencyError("y", _root(), this.y._root());
            if (!Objects.equals(this.y._parent(), this))
                throw new ConsistencyError("y", this, this.y._parent());
            if (!Objects.equals(this.z._root(), _root()))
                throw new ConsistencyError("z", _root(), this.z._root());
            if (!Objects.equals(this.z._parent(), this))
                throw new ConsistencyError("z", this, this.z._parent());
            _dirty = false;
        }
        private FixedPoint2Dot30 x;
        private FixedPoint2Dot30 y;
        private FixedPoint2Dot30 z;
        private Bmp _root;
        private Bmp.BitmapV4Extension _parent;
        public FixedPoint2Dot30 x() { return x; }
        public void setX(FixedPoint2Dot30 _v) { _dirty = true; x = _v; }
        public FixedPoint2Dot30 y() { return y; }
        public void setY(FixedPoint2Dot30 _v) { _dirty = true; y = _v; }
        public FixedPoint2Dot30 z() { return z; }
        public void setZ(FixedPoint2Dot30 _v) { _dirty = true; z = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapV4Extension _parent() { return _parent; }
        public void set_parent(Bmp.BitmapV4Extension _v) { _dirty = true; _parent = _v; }
    }
    public static class ColorMask extends KaitaiStruct.ReadWrite {
        public ColorMask(boolean hasAlphaMask) {
            this(null, null, null, hasAlphaMask);
        }

        public ColorMask(KaitaiStream _io, boolean hasAlphaMask) {
            this(_io, null, null, hasAlphaMask);
        }

        public ColorMask(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, boolean hasAlphaMask) {
            this(_io, _parent, null, hasAlphaMask);
        }

        public ColorMask(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Bmp _root, boolean hasAlphaMask) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasAlphaMask = hasAlphaMask;
        }
        public void _read() {
            this.redMask = this._io.readU4le();
            this.greenMask = this._io.readU4le();
            this.blueMask = this._io.readU4le();
            if (hasAlphaMask()) {
                this.alphaMask = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasAlphaMask()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.redMask);
            this._io.writeU4le(this.greenMask);
            this._io.writeU4le(this.blueMask);
            if (hasAlphaMask()) {
                this._io.writeU4le(this.alphaMask);
            }
        }

        public void _check() {
            if (hasAlphaMask()) {
            }
            _dirty = false;
        }
        private long redMask;
        private long greenMask;
        private long blueMask;
        private Long alphaMask;
        private boolean hasAlphaMask;
        private Bmp _root;
        private KaitaiStruct.ReadWrite _parent;
        public long redMask() { return redMask; }
        public void setRedMask(long _v) { _dirty = true; redMask = _v; }
        public long greenMask() { return greenMask; }
        public void setGreenMask(long _v) { _dirty = true; greenMask = _v; }
        public long blueMask() { return blueMask; }
        public void setBlueMask(long _v) { _dirty = true; blueMask = _v; }
        public Long alphaMask() { return alphaMask; }
        public void setAlphaMask(Long _v) { _dirty = true; alphaMask = _v; }
        public boolean hasAlphaMask() { return hasAlphaMask; }
        public void setHasAlphaMask(boolean _v) { _dirty = true; hasAlphaMask = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class ColorTable extends KaitaiStruct.ReadWrite {
        public ColorTable(boolean hasReservedField, long numColors) {
            this(null, null, null, hasReservedField, numColors);
        }

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
        }
        public void _read() {
            this.colors = new ArrayList<RgbRecord>();
            for (int i = 0; i < ( ((numColors() > 0) && (numColors() < numColorsPresent()))  ? numColors() : numColorsPresent()); i++) {
                RgbRecord _t_colors = new RgbRecord(this._io, this, _root, hasReservedField());
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
            if (this.colors.size() != ( ((numColors() > 0) && (numColors() < numColorsPresent()))  ? numColors() : numColorsPresent()))
                throw new ConsistencyError("colors", ( ((numColors() > 0) && (numColors() < numColorsPresent()))  ? numColors() : numColorsPresent()), this.colors.size());
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            for (int i = 0; i < this.colors.size(); i++) {
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("colors", _root(), this.colors.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("colors", this, this.colors.get(((Number) (i)).intValue())._parent());
                if (this.colors.get(((Number) (i)).intValue()).hasReservedField() != hasReservedField())
                    throw new ConsistencyError("colors", hasReservedField(), this.colors.get(((Number) (i)).intValue()).hasReservedField());
            }
            _dirty = false;
        }
        private Integer numColorsPresent;
        public Integer numColorsPresent() {
            if (this.numColorsPresent != null)
                return this.numColorsPresent;
            this.numColorsPresent = ((Number) (_io().size() / (hasReservedField() ? 4 : 3))).intValue();
            return this.numColorsPresent;
        }
        public void _invalidateNumColorsPresent() { this.numColorsPresent = null; }
        private List<RgbRecord> colors;
        private boolean hasReservedField;
        private long numColors;
        private Bmp _root;
        private Bmp.BitmapInfo _parent;
        public List<RgbRecord> colors() { return colors; }
        public void setColors(List<RgbRecord> _v) { _dirty = true; colors = _v; }
        public boolean hasReservedField() { return hasReservedField; }
        public void setHasReservedField(boolean _v) { _dirty = true; hasReservedField = _v; }

        /**
         * If equal to 0, the pallete should contain as many colors as can fit into the pixel value
         * according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
         * represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
         * it reads as many colors as it can until EOS is reached (and the image data begin).
         */
        public long numColors() { return numColors; }
        public void setNumColors(long _v) { _dirty = true; numColors = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapInfo _parent() { return _parent; }
        public void set_parent(Bmp.BitmapInfo _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader">Source</a>
     */
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fileType = this._io.readBytes(2);
            if (!(Arrays.equals(this.fileType, new byte[] { 66, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 77 }, this.fileType, this._io, "/types/file_header/seq/0");
            }
            this.lenFile = this._io.readU4le();
            this.reserved1 = this._io.readU2le();
            this.reserved2 = this._io.readU2le();
            this.ofsBitmap = this._io.readS4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.fileType);
            this._io.writeU4le(this.lenFile);
            this._io.writeU2le(this.reserved1);
            this._io.writeU2le(this.reserved2);
            this._io.writeS4le(this.ofsBitmap);
        }

        public void _check() {
            if (this.fileType.length != 2)
                throw new ConsistencyError("file_type", 2, this.fileType.length);
            if (!(Arrays.equals(this.fileType, new byte[] { 66, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 77 }, this.fileType, null, "/types/file_header/seq/0");
            }
            _dirty = false;
        }
        private byte[] fileType;
        private long lenFile;
        private int reserved1;
        private int reserved2;
        private int ofsBitmap;
        private Bmp _root;
        private Bmp _parent;
        public byte[] fileType() { return fileType; }
        public void setFileType(byte[] _v) { _dirty = true; fileType = _v; }

        /**
         * not reliable, mostly ignored by BMP decoders
         */
        public long lenFile() { return lenFile; }
        public void setLenFile(long _v) { _dirty = true; lenFile = _v; }
        public int reserved1() { return reserved1; }
        public void setReserved1(int _v) { _dirty = true; reserved1 = _v; }
        public int reserved2() { return reserved2; }
        public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }

        /**
         * Offset to actual raw pixel data of the image
         */
        public int ofsBitmap() { return ofsBitmap; }
        public void setOfsBitmap(int _v) { _dirty = true; ofsBitmap = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp _parent() { return _parent; }
        public void set_parent(Bmp _v) { _dirty = true; _parent = _v; }
    }
    public static class FixedPoint16Dot16 extends KaitaiStruct.ReadWrite {
        public static FixedPoint16Dot16 fromFile(String fileName) throws IOException {
            return new FixedPoint16Dot16(new ByteBufferKaitaiStream(fileName));
        }
        public FixedPoint16Dot16() {
            this(null, null, null);
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
        }
        public void _read() {
            this.raw = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.raw);
        }

        public void _check() {
            _dirty = false;
        }
        private Double value;
        public Double value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) ((raw() + 0.0) / (1 << 16))).doubleValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private long raw;
        private Bmp _root;
        private Bmp.BitmapV4Extension _parent;
        public long raw() { return raw; }
        public void setRaw(long _v) { _dirty = true; raw = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapV4Extension _parent() { return _parent; }
        public void set_parent(Bmp.BitmapV4Extension _v) { _dirty = true; _parent = _v; }
    }
    public static class FixedPoint2Dot30 extends KaitaiStruct.ReadWrite {
        public static FixedPoint2Dot30 fromFile(String fileName) throws IOException {
            return new FixedPoint2Dot30(new ByteBufferKaitaiStream(fileName));
        }
        public FixedPoint2Dot30() {
            this(null, null, null);
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
        }
        public void _read() {
            this.raw = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.raw);
        }

        public void _check() {
            _dirty = false;
        }
        private Double value;
        public Double value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) ((raw() + 0.0) / (1 << 30))).doubleValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private long raw;
        private Bmp _root;
        private Bmp.CieXyz _parent;
        public long raw() { return raw; }
        public void setRaw(long _v) { _dirty = true; raw = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.CieXyz _parent() { return _parent; }
        public void set_parent(Bmp.CieXyz _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2">Source</a>
     */
    public static class Os22xBitmapExtension extends KaitaiStruct.ReadWrite {
        public static Os22xBitmapExtension fromFile(String fileName) throws IOException {
            return new Os22xBitmapExtension(new ByteBufferKaitaiStream(fileName));
        }
        public Os22xBitmapExtension() {
            this(null, null, null);
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
        }
        public void _read() {
            this.units = this._io.readU2le();
            this.reserved = this._io.readU2le();
            this.recording = this._io.readU2le();
            this.rendering = Bmp.Os2Rendering.byId(this._io.readU2le());
            this.size1 = this._io.readU4le();
            this.size2 = this._io.readU4le();
            this.colorEncoding = this._io.readU4le();
            this.identifier = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.units);
            this._io.writeU2le(this.reserved);
            this._io.writeU2le(this.recording);
            this._io.writeU2le(((Number) (this.rendering.id())).intValue());
            this._io.writeU4le(this.size1);
            this._io.writeU4le(this.size2);
            this._io.writeU4le(this.colorEncoding);
            this._io.writeU4le(this.identifier);
        }

        public void _check() {
            _dirty = false;
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
        public void setUnits(int _v) { _dirty = true; units = _v; }
        public int reserved() { return reserved; }
        public void setReserved(int _v) { _dirty = true; reserved = _v; }

        /**
         * Specifies how the bitmap scan lines are stored.
         * The only valid value for this field is 0, indicating that the bitmap is
         * stored from left to right and from the bottom up.
         */
        public int recording() { return recording; }
        public void setRecording(int _v) { _dirty = true; recording = _v; }

        /**
         * Specifies the halftoning algorithm used on the bitmap data.
         */
        public Os2Rendering rendering() { return rendering; }
        public void setRendering(Os2Rendering _v) { _dirty = true; rendering = _v; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => error damping as a percentage in the range 0 through 100
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => X dimension of the pattern used in pixels
         */
        public long size1() { return size1; }
        public void setSize1(long _v) { _dirty = true; size1 = _v; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => not used
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => Y dimension of the pattern used in pixels
         */
        public long size2() { return size2; }
        public void setSize2(long _v) { _dirty = true; size2 = _v; }

        /**
         * Specifies the color model used to describe the bitmap data.
         * The only valid value is 0, indicating the RGB encoding scheme.
         */
        public long colorEncoding() { return colorEncoding; }
        public void setColorEncoding(long _v) { _dirty = true; colorEncoding = _v; }

        /**
         * Application-specific value
         */
        public long identifier() { return identifier; }
        public void setIdentifier(long _v) { _dirty = true; identifier = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.BitmapHeader _parent() { return _parent; }
        public void set_parent(Bmp.BitmapHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class RgbRecord extends KaitaiStruct.ReadWrite {
        public RgbRecord(boolean hasReservedField) {
            this(null, null, null, hasReservedField);
        }

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
        }
        public void _read() {
            this.blue = this._io.readU1();
            this.green = this._io.readU1();
            this.red = this._io.readU1();
            if (hasReservedField()) {
                this.reserved = this._io.readU1();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasReservedField()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.blue);
            this._io.writeU1(this.green);
            this._io.writeU1(this.red);
            if (hasReservedField()) {
                this._io.writeU1(this.reserved);
            }
        }

        public void _check() {
            if (hasReservedField()) {
            }
            _dirty = false;
        }
        private int blue;
        private int green;
        private int red;
        private Integer reserved;
        private boolean hasReservedField;
        private Bmp _root;
        private Bmp.ColorTable _parent;
        public int blue() { return blue; }
        public void setBlue(int _v) { _dirty = true; blue = _v; }
        public int green() { return green; }
        public void setGreen(int _v) { _dirty = true; green = _v; }
        public int red() { return red; }
        public void setRed(int _v) { _dirty = true; red = _v; }
        public Integer reserved() { return reserved; }
        public void setReserved(Integer _v) { _dirty = true; reserved = _v; }
        public boolean hasReservedField() { return hasReservedField; }
        public void setHasReservedField(boolean _v) { _dirty = true; hasReservedField = _v; }
        public Bmp _root() { return _root; }
        public void set_root(Bmp _v) { _dirty = true; _root = _v; }
        public Bmp.ColorTable _parent() { return _parent; }
        public void set_parent(Bmp.ColorTable _v) { _dirty = true; _parent = _v; }
    }
    private FileHeader fileHdr;
    private BitmapInfo dibInfo;
    private Bitmap bitmap;
    private Bmp _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_dibInfo;
    private byte[] _raw_bitmap;
    public FileHeader fileHdr() { return fileHdr; }
    public void setFileHdr(FileHeader _v) { _dirty = true; fileHdr = _v; }
    public BitmapInfo dibInfo() { return dibInfo; }
    public void setDibInfo(BitmapInfo _v) { _dirty = true; dibInfo = _v; }
    public Bitmap bitmap() { return bitmap; }
    public void setBitmap(Bitmap _v) { _dirty = true; bitmap = _v; }
    public Bmp _root() { return _root; }
    public void set_root(Bmp _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_dibInfo() { return _raw_dibInfo; }
    public void set_raw_DibInfo(byte[] _v) { _dirty = true; _raw_dibInfo = _v; }
    public byte[] _raw_bitmap() { return _raw_bitmap; }
    public void set_raw_Bitmap(byte[] _v) { _dirty = true; _raw_bitmap = _v; }
}
