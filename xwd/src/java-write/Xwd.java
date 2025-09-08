// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * xwd is a file format written by eponymous X11 screen capture
 * application (xwd stands for "X Window Dump"). Typically, an average
 * user transforms xwd format into something more widespread by any of
 * `xwdtopnm` and `pnmto...` utilities right away.
 * 
 * xwd format itself provides a raw uncompressed bitmap with some
 * metainformation, like pixel format, width, height, bit depth,
 * etc. Note that technically format includes machine-dependent fields
 * and thus is probably a poor choice for true cross-platform usage.
 */
public class Xwd extends KaitaiStruct.ReadWrite {
    public static Xwd fromFile(String fileName) throws IOException {
        return new Xwd(new ByteBufferKaitaiStream(fileName));
    }

    public enum ByteOrder {
        LE(0),
        BE(1);

        private final long id;
        ByteOrder(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ByteOrder> byId = new HashMap<Long, ByteOrder>(2);
        static {
            for (ByteOrder e : ByteOrder.values())
                byId.put(e.id(), e);
        }
        public static ByteOrder byId(long id) { return byId.get(id); }
    }

    public enum PixmapFormat {
        X_Y_BITMAP(0),
        X_Y_PIXMAP(1),
        Z_PIXMAP(2);

        private final long id;
        PixmapFormat(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PixmapFormat> byId = new HashMap<Long, PixmapFormat>(3);
        static {
            for (PixmapFormat e : PixmapFormat.values())
                byId.put(e.id(), e);
        }
        public static PixmapFormat byId(long id) { return byId.get(id); }
    }

    public enum VisualClass {
        STATIC_GRAY(0),
        GRAY_SCALE(1),
        STATIC_COLOR(2),
        PSEUDO_COLOR(3),
        TRUE_COLOR(4),
        DIRECT_COLOR(5);

        private final long id;
        VisualClass(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, VisualClass> byId = new HashMap<Long, VisualClass>(6);
        static {
            for (VisualClass e : VisualClass.values())
                byId.put(e.id(), e);
        }
        public static VisualClass byId(long id) { return byId.get(id); }
    }
    public Xwd() {
        this(null, null, null);
    }

    public Xwd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Xwd(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Xwd(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Xwd _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.lenHeader = this._io.readU4be();
        this._raw_hdr = this._io.readBytes(lenHeader() - 4);
        KaitaiStream _io__raw_hdr = new ByteBufferKaitaiStream(this._raw_hdr);
        this.hdr = new Header(_io__raw_hdr, this, _root);
        this.hdr._read();
        this._raw_colorMap = new ArrayList<byte[]>();
        this.colorMap = new ArrayList<ColorMapEntry>();
        for (int i = 0; i < hdr().colorMapEntries(); i++) {
            this._raw_colorMap.add(this._io.readBytes(12));
            KaitaiStream _io__raw_colorMap = new ByteBufferKaitaiStream(this._raw_colorMap.get(i));
            ColorMapEntry _t_colorMap = new ColorMapEntry(_io__raw_colorMap, this, _root);
            try {
                _t_colorMap._read();
            } finally {
                this.colorMap.add(_t_colorMap);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.hdr._fetchInstances();
        for (int i = 0; i < this.colorMap.size(); i++) {
            this.colorMap.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4be(this.lenHeader);
        final KaitaiStream _io__raw_hdr = new ByteBufferKaitaiStream(lenHeader() - 4);
        this._io.addChildStream(_io__raw_hdr);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenHeader() - 4));
            final Xwd _this = this;
            _io__raw_hdr.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_hdr = _io__raw_hdr.toByteArray();
                    if (_this._raw_hdr.length != lenHeader() - 4)
                        throw new ConsistencyError("raw(hdr)", lenHeader() - 4, _this._raw_hdr.length);
                    parent.writeBytes(_this._raw_hdr);
                }
            });
        }
        this.hdr._write_Seq(_io__raw_hdr);
        this._raw_colorMap = new ArrayList<byte[]>();
        for (int i = 0; i < this.colorMap.size(); i++) {
            final KaitaiStream _io__raw_colorMap = new ByteBufferKaitaiStream(12);
            this._io.addChildStream(_io__raw_colorMap);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (12));
                final Xwd _this = this;
                final int _i = i;
                _io__raw_colorMap.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_colorMap.add(_io__raw_colorMap.toByteArray());
                        if (_this._raw_colorMap.get(((Number) (_i)).intValue()).length != 12)
                            throw new ConsistencyError("raw(color_map)", 12, _this._raw_colorMap.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_colorMap.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.colorMap.get(((Number) (i)).intValue())._write_Seq(_io__raw_colorMap);
        }
    }

    public void _check() {
        if (!Objects.equals(this.hdr._root(), _root()))
            throw new ConsistencyError("hdr", _root(), this.hdr._root());
        if (!Objects.equals(this.hdr._parent(), this))
            throw new ConsistencyError("hdr", this, this.hdr._parent());
        if (this.colorMap.size() != hdr().colorMapEntries())
            throw new ConsistencyError("color_map", hdr().colorMapEntries(), this.colorMap.size());
        for (int i = 0; i < this.colorMap.size(); i++) {
            if (!Objects.equals(this.colorMap.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("color_map", _root(), this.colorMap.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.colorMap.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("color_map", this, this.colorMap.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class ColorMapEntry extends KaitaiStruct.ReadWrite {
        public static ColorMapEntry fromFile(String fileName) throws IOException {
            return new ColorMapEntry(new ByteBufferKaitaiStream(fileName));
        }
        public ColorMapEntry() {
            this(null, null, null);
        }

        public ColorMapEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ColorMapEntry(KaitaiStream _io, Xwd _parent) {
            this(_io, _parent, null);
        }

        public ColorMapEntry(KaitaiStream _io, Xwd _parent, Xwd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entryNumber = this._io.readU4be();
            this.red = this._io.readU2be();
            this.green = this._io.readU2be();
            this.blue = this._io.readU2be();
            this.flags = this._io.readU1();
            this.padding = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.entryNumber);
            this._io.writeU2be(this.red);
            this._io.writeU2be(this.green);
            this._io.writeU2be(this.blue);
            this._io.writeU1(this.flags);
            this._io.writeU1(this.padding);
        }

        public void _check() {
            _dirty = false;
        }
        private long entryNumber;
        private int red;
        private int green;
        private int blue;
        private int flags;
        private int padding;
        private Xwd _root;
        private Xwd _parent;

        /**
         * Number of the color map entry
         */
        public long entryNumber() { return entryNumber; }
        public void setEntryNumber(long _v) { _dirty = true; entryNumber = _v; }
        public int red() { return red; }
        public void setRed(int _v) { _dirty = true; red = _v; }
        public int green() { return green; }
        public void setGreen(int _v) { _dirty = true; green = _v; }
        public int blue() { return blue; }
        public void setBlue(int _v) { _dirty = true; blue = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int padding() { return padding; }
        public void setPadding(int _v) { _dirty = true; padding = _v; }
        public Xwd _root() { return _root; }
        public void set_root(Xwd _v) { _dirty = true; _root = _v; }
        public Xwd _parent() { return _parent; }
        public void set_parent(Xwd _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Xwd _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Xwd _parent, Xwd _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.fileVersion = this._io.readU4be();
            this.pixmapFormat = Xwd.PixmapFormat.byId(this._io.readU4be());
            this.pixmapDepth = this._io.readU4be();
            this.pixmapWidth = this._io.readU4be();
            this.pixmapHeight = this._io.readU4be();
            this.xOffset = this._io.readU4be();
            this.byteOrder = Xwd.ByteOrder.byId(this._io.readU4be());
            this.bitmapUnit = this._io.readU4be();
            this.bitmapBitOrder = this._io.readU4be();
            this.bitmapPad = this._io.readU4be();
            this.bitsPerPixel = this._io.readU4be();
            this.bytesPerLine = this._io.readU4be();
            this.visualClass = Xwd.VisualClass.byId(this._io.readU4be());
            this.redMask = this._io.readU4be();
            this.greenMask = this._io.readU4be();
            this.blueMask = this._io.readU4be();
            this.bitsPerRgb = this._io.readU4be();
            this.numberOfColors = this._io.readU4be();
            this.colorMapEntries = this._io.readU4be();
            this.windowWidth = this._io.readU4be();
            this.windowHeight = this._io.readU4be();
            this.windowX = this._io.readS4be();
            this.windowY = this._io.readS4be();
            this.windowBorderWidth = this._io.readU4be();
            this.creator = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.fileVersion);
            this._io.writeU4be(((Number) (this.pixmapFormat.id())).longValue());
            this._io.writeU4be(this.pixmapDepth);
            this._io.writeU4be(this.pixmapWidth);
            this._io.writeU4be(this.pixmapHeight);
            this._io.writeU4be(this.xOffset);
            this._io.writeU4be(((Number) (this.byteOrder.id())).longValue());
            this._io.writeU4be(this.bitmapUnit);
            this._io.writeU4be(this.bitmapBitOrder);
            this._io.writeU4be(this.bitmapPad);
            this._io.writeU4be(this.bitsPerPixel);
            this._io.writeU4be(this.bytesPerLine);
            this._io.writeU4be(((Number) (this.visualClass.id())).longValue());
            this._io.writeU4be(this.redMask);
            this._io.writeU4be(this.greenMask);
            this._io.writeU4be(this.blueMask);
            this._io.writeU4be(this.bitsPerRgb);
            this._io.writeU4be(this.numberOfColors);
            this._io.writeU4be(this.colorMapEntries);
            this._io.writeU4be(this.windowWidth);
            this._io.writeU4be(this.windowHeight);
            this._io.writeS4be(this.windowX);
            this._io.writeS4be(this.windowY);
            this._io.writeU4be(this.windowBorderWidth);
            this._io.writeBytes((this.creator).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.creator).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("creator", -1, KaitaiStream.byteArrayIndexOf((this.creator).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private long fileVersion;
        private PixmapFormat pixmapFormat;
        private long pixmapDepth;
        private long pixmapWidth;
        private long pixmapHeight;
        private long xOffset;
        private ByteOrder byteOrder;
        private long bitmapUnit;
        private long bitmapBitOrder;
        private long bitmapPad;
        private long bitsPerPixel;
        private long bytesPerLine;
        private VisualClass visualClass;
        private long redMask;
        private long greenMask;
        private long blueMask;
        private long bitsPerRgb;
        private long numberOfColors;
        private long colorMapEntries;
        private long windowWidth;
        private long windowHeight;
        private int windowX;
        private int windowY;
        private long windowBorderWidth;
        private String creator;
        private Xwd _root;
        private Xwd _parent;

        /**
         * X11WD file version (always 07h)
         */
        public long fileVersion() { return fileVersion; }
        public void setFileVersion(long _v) { _dirty = true; fileVersion = _v; }

        /**
         * Format of the image data
         */
        public PixmapFormat pixmapFormat() { return pixmapFormat; }
        public void setPixmapFormat(PixmapFormat _v) { _dirty = true; pixmapFormat = _v; }

        /**
         * Pixmap depth in pixels - in practice, bits per pixel
         */
        public long pixmapDepth() { return pixmapDepth; }
        public void setPixmapDepth(long _v) { _dirty = true; pixmapDepth = _v; }

        /**
         * Pixmap width in pixels
         */
        public long pixmapWidth() { return pixmapWidth; }
        public void setPixmapWidth(long _v) { _dirty = true; pixmapWidth = _v; }

        /**
         * Pixmap height in pixels
         */
        public long pixmapHeight() { return pixmapHeight; }
        public void setPixmapHeight(long _v) { _dirty = true; pixmapHeight = _v; }

        /**
         * Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
         */
        public long xOffset() { return xOffset; }
        public void setXOffset(long _v) { _dirty = true; xOffset = _v; }

        /**
         * Byte order of image data
         */
        public ByteOrder byteOrder() { return byteOrder; }
        public void setByteOrder(ByteOrder _v) { _dirty = true; byteOrder = _v; }

        /**
         * Bitmap base data size
         */
        public long bitmapUnit() { return bitmapUnit; }
        public void setBitmapUnit(long _v) { _dirty = true; bitmapUnit = _v; }

        /**
         * Bit-order of image data
         */
        public long bitmapBitOrder() { return bitmapBitOrder; }
        public void setBitmapBitOrder(long _v) { _dirty = true; bitmapBitOrder = _v; }

        /**
         * Bitmap scan-line pad
         */
        public long bitmapPad() { return bitmapPad; }
        public void setBitmapPad(long _v) { _dirty = true; bitmapPad = _v; }

        /**
         * Bits per pixel
         */
        public long bitsPerPixel() { return bitsPerPixel; }
        public void setBitsPerPixel(long _v) { _dirty = true; bitsPerPixel = _v; }

        /**
         * Bytes per scan-line
         */
        public long bytesPerLine() { return bytesPerLine; }
        public void setBytesPerLine(long _v) { _dirty = true; bytesPerLine = _v; }

        /**
         * Class of the image
         */
        public VisualClass visualClass() { return visualClass; }
        public void setVisualClass(VisualClass _v) { _dirty = true; visualClass = _v; }

        /**
         * Red mask
         */
        public long redMask() { return redMask; }
        public void setRedMask(long _v) { _dirty = true; redMask = _v; }

        /**
         * Green mask
         */
        public long greenMask() { return greenMask; }
        public void setGreenMask(long _v) { _dirty = true; greenMask = _v; }

        /**
         * Blue mask
         */
        public long blueMask() { return blueMask; }
        public void setBlueMask(long _v) { _dirty = true; blueMask = _v; }

        /**
         * Size of each color mask in bits
         */
        public long bitsPerRgb() { return bitsPerRgb; }
        public void setBitsPerRgb(long _v) { _dirty = true; bitsPerRgb = _v; }

        /**
         * Number of colors in image
         */
        public long numberOfColors() { return numberOfColors; }
        public void setNumberOfColors(long _v) { _dirty = true; numberOfColors = _v; }

        /**
         * Number of entries in color map
         */
        public long colorMapEntries() { return colorMapEntries; }
        public void setColorMapEntries(long _v) { _dirty = true; colorMapEntries = _v; }

        /**
         * Window width
         */
        public long windowWidth() { return windowWidth; }
        public void setWindowWidth(long _v) { _dirty = true; windowWidth = _v; }

        /**
         * Window height
         */
        public long windowHeight() { return windowHeight; }
        public void setWindowHeight(long _v) { _dirty = true; windowHeight = _v; }

        /**
         * Window upper left X coordinate
         */
        public int windowX() { return windowX; }
        public void setWindowX(int _v) { _dirty = true; windowX = _v; }

        /**
         * Window upper left Y coordinate
         */
        public int windowY() { return windowY; }
        public void setWindowY(int _v) { _dirty = true; windowY = _v; }

        /**
         * Window border width
         */
        public long windowBorderWidth() { return windowBorderWidth; }
        public void setWindowBorderWidth(long _v) { _dirty = true; windowBorderWidth = _v; }

        /**
         * Program that created this xwd file
         */
        public String creator() { return creator; }
        public void setCreator(String _v) { _dirty = true; creator = _v; }
        public Xwd _root() { return _root; }
        public void set_root(Xwd _v) { _dirty = true; _root = _v; }
        public Xwd _parent() { return _parent; }
        public void set_parent(Xwd _v) { _dirty = true; _parent = _v; }
    }
    private long lenHeader;
    private Header hdr;
    private List<ColorMapEntry> colorMap;
    private Xwd _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_hdr;
    private List<byte[]> _raw_colorMap;

    /**
     * Size of the header in bytes
     */
    public long lenHeader() { return lenHeader; }
    public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
    public Header hdr() { return hdr; }
    public void setHdr(Header _v) { _dirty = true; hdr = _v; }
    public List<ColorMapEntry> colorMap() { return colorMap; }
    public void setColorMap(List<ColorMapEntry> _v) { _dirty = true; colorMap = _v; }
    public Xwd _root() { return _root; }
    public void set_root(Xwd _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_hdr() { return _raw_hdr; }
    public void set_raw_Hdr(byte[] _v) { _dirty = true; _raw_hdr = _v; }
    public List<byte[]> _raw_colorMap() { return _raw_colorMap; }
    public void set_raw_ColorMap(List<byte[]> _v) { _dirty = true; _raw_colorMap = _v; }
}
