// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;

public class Bmp extends KaitaiStruct {
    public static Bmp fromFile(String fileName) throws IOException {
        return new Bmp(new ByteBufferKaitaiStream(fileName));
    }

    public enum Compressions {
        RGB(0),
        RLE8(1),
        RLE4(2),
        BITFIELDS(3),
        JPEG(4),
        PNG(5),
        CMYK(11),
        CMYK_RLE8(12),
        CMYK_RLE4(13);

        private final long id;
        Compressions(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compressions> byId = new HashMap<Long, Compressions>(9);
        static {
            for (Compressions e : Compressions.values())
                byId.put(e.id(), e);
        }
        public static Compressions byId(long id) { return byId.get(id); }
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
        this.lenDibHeader = this._io.readS4le();
        switch (lenDibHeader()) {
        case 104: {
            this._raw_dibHeader = this._io.readBytes((lenDibHeader() - 4));
            KaitaiStream _io__raw_dibHeader = new ByteBufferKaitaiStream(_raw_dibHeader);
            this.dibHeader = new BitmapCoreHeader(_io__raw_dibHeader, this, _root);
            break;
        }
        case 12: {
            this._raw_dibHeader = this._io.readBytes((lenDibHeader() - 4));
            KaitaiStream _io__raw_dibHeader = new ByteBufferKaitaiStream(_raw_dibHeader);
            this.dibHeader = new BitmapCoreHeader(_io__raw_dibHeader, this, _root);
            break;
        }
        case 40: {
            this._raw_dibHeader = this._io.readBytes((lenDibHeader() - 4));
            KaitaiStream _io__raw_dibHeader = new ByteBufferKaitaiStream(_raw_dibHeader);
            this.dibHeader = new BitmapInfoHeader(_io__raw_dibHeader, this, _root);
            break;
        }
        case 124: {
            this._raw_dibHeader = this._io.readBytes((lenDibHeader() - 4));
            KaitaiStream _io__raw_dibHeader = new ByteBufferKaitaiStream(_raw_dibHeader);
            this.dibHeader = new BitmapCoreHeader(_io__raw_dibHeader, this, _root);
            break;
        }
        default: {
            this.dibHeader = this._io.readBytes((lenDibHeader() - 4));
            break;
        }
        }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/dd183374.aspx">Source</a>
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
            this.magic = this._io.ensureFixedContents(new byte[] { 66, 77 });
            this.lenFile = this._io.readU4le();
            this.reserved1 = this._io.readU2le();
            this.reserved2 = this._io.readU2le();
            this.ofsBitmap = this._io.readS4le();
        }
        private byte[] magic;
        private long lenFile;
        private int reserved1;
        private int reserved2;
        private int ofsBitmap;
        private Bmp _root;
        private Bmp _parent;
        public byte[] magic() { return magic; }
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
     * @see <a href="https://msdn.microsoft.com/en-us/library/dd183372.aspx">Source</a>
     */
    public static class BitmapCoreHeader extends KaitaiStruct {
        public static BitmapCoreHeader fromFile(String fileName) throws IOException {
            return new BitmapCoreHeader(new ByteBufferKaitaiStream(fileName));
        }

        public BitmapCoreHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapCoreHeader(KaitaiStream _io, Bmp _parent) {
            this(_io, _parent, null);
        }

        public BitmapCoreHeader(KaitaiStream _io, Bmp _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.imageWidth = this._io.readU2le();
            this.imageHeight = this._io.readU2le();
            this.numPlanes = this._io.readU2le();
            this.bitsPerPixel = this._io.readU2le();
        }
        private int imageWidth;
        private int imageHeight;
        private int numPlanes;
        private int bitsPerPixel;
        private Bmp _root;
        private Bmp _parent;

        /**
         * Image width, px
         */
        public int imageWidth() { return imageWidth; }

        /**
         * Image height, px
         */
        public int imageHeight() { return imageHeight; }

        /**
         * Number of planes for target device, must be 1
         */
        public int numPlanes() { return numPlanes; }

        /**
         * Number of bits per pixel that image buffer uses (1, 4, 8, or 24)
         */
        public int bitsPerPixel() { return bitsPerPixel; }
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
    }

    /**
     * @see <a href="https://msdn.microsoft.com/en-us/library/dd183376.aspx">Source</a>
     */
    public static class BitmapInfoHeader extends KaitaiStruct {
        public static BitmapInfoHeader fromFile(String fileName) throws IOException {
            return new BitmapInfoHeader(new ByteBufferKaitaiStream(fileName));
        }

        public BitmapInfoHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapInfoHeader(KaitaiStream _io, Bmp _parent) {
            this(_io, _parent, null);
        }

        public BitmapInfoHeader(KaitaiStream _io, Bmp _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.imageWidth = this._io.readU4le();
            this.imageHeight = this._io.readU4le();
            this.numPlanes = this._io.readU2le();
            this.bitsPerPixel = this._io.readU2le();
            this.compression = Bmp.Compressions.byId(this._io.readU4le());
            this.lenImage = this._io.readU4le();
            this.xPxPerM = this._io.readU4le();
            this.yPxPerM = this._io.readU4le();
            this.numColorsUsed = this._io.readU4le();
            this.numColorsImportant = this._io.readU4le();
        }
        private long imageWidth;
        private long imageHeight;
        private int numPlanes;
        private int bitsPerPixel;
        private Compressions compression;
        private long lenImage;
        private long xPxPerM;
        private long yPxPerM;
        private long numColorsUsed;
        private long numColorsImportant;
        private Bmp _root;
        private Bmp _parent;
        public long imageWidth() { return imageWidth; }
        public long imageHeight() { return imageHeight; }
        public int numPlanes() { return numPlanes; }
        public int bitsPerPixel() { return bitsPerPixel; }
        public Compressions compression() { return compression; }
        public long lenImage() { return lenImage; }
        public long xPxPerM() { return xPxPerM; }
        public long yPxPerM() { return yPxPerM; }
        public long numColorsUsed() { return numColorsUsed; }
        public long numColorsImportant() { return numColorsImportant; }
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
    }
    private byte[] image;
    public byte[] image() {
        if (this.image != null)
            return this.image;
        long _pos = this._io.pos();
        this._io.seek(fileHdr().ofsBitmap());
        this.image = this._io.readBytesFull();
        this._io.seek(_pos);
        return this.image;
    }
    private FileHeader fileHdr;
    private int lenDibHeader;
    private Object dibHeader;
    private Bmp _root;
    private KaitaiStruct _parent;
    private byte[] _raw_dibHeader;
    public FileHeader fileHdr() { return fileHdr; }
    public int lenDibHeader() { return lenDibHeader; }
    public Object dibHeader() { return dibHeader; }
    public Bmp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_dibHeader() { return _raw_dibHeader; }
}
