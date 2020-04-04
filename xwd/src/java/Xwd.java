// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


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
public class Xwd extends KaitaiStruct {
    public static Xwd fromFile(String fileName) throws IOException {
        return new Xwd(new ByteBufferKaitaiStream(fileName));
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

    public Xwd(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Xwd(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Xwd(KaitaiStream _io, KaitaiStruct _parent, Xwd _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.lenHeader = this._io.readU4be();
        this._raw_hdr = this._io.readBytes((lenHeader() - 4));
        KaitaiStream _io__raw_hdr = new ByteBufferKaitaiStream(_raw_hdr);
        this.hdr = new Header(_io__raw_hdr, this, _root);
        this._raw_colorMap = new ArrayList<byte[]>((int) (hdr().colorMapEntries()));
        colorMap = new ArrayList<ColorMapEntry>((int) (hdr().colorMapEntries()));
        for (int i = 0; i < hdr().colorMapEntries(); i++) {
            this._raw_colorMap.add(this._io.readBytes(12));
            KaitaiStream _io__raw_colorMap = new ByteBufferKaitaiStream(_raw_colorMap.get(_raw_colorMap.size() - 1));
            this.colorMap.add(new ColorMapEntry(_io__raw_colorMap, this, _root));
        }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
            this.creator = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
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

        /**
         * Format of the image data
         */
        public PixmapFormat pixmapFormat() { return pixmapFormat; }

        /**
         * Pixmap depth in pixels - in practice, bits per pixel
         */
        public long pixmapDepth() { return pixmapDepth; }

        /**
         * Pixmap width in pixels
         */
        public long pixmapWidth() { return pixmapWidth; }

        /**
         * Pixmap height in pixels
         */
        public long pixmapHeight() { return pixmapHeight; }

        /**
         * Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
         */
        public long xOffset() { return xOffset; }

        /**
         * Byte order of image data
         */
        public ByteOrder byteOrder() { return byteOrder; }

        /**
         * Bitmap base data size
         */
        public long bitmapUnit() { return bitmapUnit; }

        /**
         * Bit-order of image data
         */
        public long bitmapBitOrder() { return bitmapBitOrder; }

        /**
         * Bitmap scan-line pad
         */
        public long bitmapPad() { return bitmapPad; }

        /**
         * Bits per pixel
         */
        public long bitsPerPixel() { return bitsPerPixel; }

        /**
         * Bytes per scan-line
         */
        public long bytesPerLine() { return bytesPerLine; }

        /**
         * Class of the image
         */
        public VisualClass visualClass() { return visualClass; }

        /**
         * Red mask
         */
        public long redMask() { return redMask; }

        /**
         * Green mask
         */
        public long greenMask() { return greenMask; }

        /**
         * Blue mask
         */
        public long blueMask() { return blueMask; }

        /**
         * Size of each color mask in bits
         */
        public long bitsPerRgb() { return bitsPerRgb; }

        /**
         * Number of colors in image
         */
        public long numberOfColors() { return numberOfColors; }

        /**
         * Number of entries in color map
         */
        public long colorMapEntries() { return colorMapEntries; }

        /**
         * Window width
         */
        public long windowWidth() { return windowWidth; }

        /**
         * Window height
         */
        public long windowHeight() { return windowHeight; }

        /**
         * Window upper left X coordinate
         */
        public int windowX() { return windowX; }

        /**
         * Window upper left Y coordinate
         */
        public int windowY() { return windowY; }

        /**
         * Window border width
         */
        public long windowBorderWidth() { return windowBorderWidth; }

        /**
         * Program that created this xwd file
         */
        public String creator() { return creator; }
        public Xwd _root() { return _root; }
        public Xwd _parent() { return _parent; }
    }
    public static class ColorMapEntry extends KaitaiStruct {
        public static ColorMapEntry fromFile(String fileName) throws IOException {
            return new ColorMapEntry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entryNumber = this._io.readU4be();
            this.red = this._io.readU2be();
            this.green = this._io.readU2be();
            this.blue = this._io.readU2be();
            this.flags = this._io.readU1();
            this.padding = this._io.readU1();
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
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }
        public int flags() { return flags; }
        public int padding() { return padding; }
        public Xwd _root() { return _root; }
        public Xwd _parent() { return _parent; }
    }
    private long lenHeader;
    private Header hdr;
    private ArrayList<ColorMapEntry> colorMap;
    private Xwd _root;
    private KaitaiStruct _parent;
    private byte[] _raw_hdr;
    private ArrayList<byte[]> _raw_colorMap;

    /**
     * Size of the header in bytes
     */
    public long lenHeader() { return lenHeader; }
    public Header hdr() { return hdr; }
    public ArrayList<ColorMapEntry> colorMap() { return colorMap; }
    public Xwd _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_hdr() { return _raw_hdr; }
    public ArrayList<byte[]> _raw_colorMap() { return _raw_colorMap; }
}
