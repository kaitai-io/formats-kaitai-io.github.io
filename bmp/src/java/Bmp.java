// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class Bmp extends KaitaiStruct {
    public static Bmp fromFile(String fileName) throws IOException {
        return new Bmp(new KaitaiStream(fileName));
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
        this.dibHdr = new DibHeader(this._io, this, _root);
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new KaitaiStream(fileName));
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
            this.fileSize = this._io.readU4le();
            this.reserved1 = this._io.readU2le();
            this.reserved2 = this._io.readU2le();
            this.bitmapOfs = this._io.readS4le();
        }
        private byte[] fileType;
        private long fileSize;
        private int reserved1;
        private int reserved2;
        private int bitmapOfs;
        private Bmp _root;
        private Bmp _parent;
        public byte[] fileType() { return fileType; }
        public long fileSize() { return fileSize; }
        public int reserved1() { return reserved1; }
        public int reserved2() { return reserved2; }
        public int bitmapOfs() { return bitmapOfs; }
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
    }
    public static class DibHeader extends KaitaiStruct {
        public static DibHeader fromFile(String fileName) throws IOException {
            return new DibHeader(new KaitaiStream(fileName));
        }

        public DibHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DibHeader(KaitaiStream _io, Bmp _parent) {
            this(_io, _parent, null);
        }

        public DibHeader(KaitaiStream _io, Bmp _parent, Bmp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dibHeaderSize = this._io.readS4le();
            if (dibHeaderSize() == 12) {
                this._raw_bitmapCoreHeader = this._io.readBytes((dibHeaderSize() - 4));
                KaitaiStream _io__raw_bitmapCoreHeader = new KaitaiStream(_raw_bitmapCoreHeader);
                this.bitmapCoreHeader = new BitmapCoreHeader(_io__raw_bitmapCoreHeader, this, _root);
            }
            if (dibHeaderSize() == 40) {
                this._raw_bitmapInfoHeader = this._io.readBytes((dibHeaderSize() - 4));
                KaitaiStream _io__raw_bitmapInfoHeader = new KaitaiStream(_raw_bitmapInfoHeader);
                this.bitmapInfoHeader = new BitmapInfoHeader(_io__raw_bitmapInfoHeader, this, _root);
            }
            if (dibHeaderSize() == 124) {
                this._raw_bitmapV5Header = this._io.readBytes((dibHeaderSize() - 4));
                KaitaiStream _io__raw_bitmapV5Header = new KaitaiStream(_raw_bitmapV5Header);
                this.bitmapV5Header = new BitmapCoreHeader(_io__raw_bitmapV5Header, this, _root);
            }
            if ( ((dibHeaderSize() != 12) && (dibHeaderSize() != 40) && (dibHeaderSize() != 124)) ) {
                this.dibHeaderBody = this._io.readBytes((dibHeaderSize() - 4));
            }
        }
        private int dibHeaderSize;
        private BitmapCoreHeader bitmapCoreHeader;
        private BitmapInfoHeader bitmapInfoHeader;
        private BitmapCoreHeader bitmapV5Header;
        private byte[] dibHeaderBody;
        private Bmp _root;
        private Bmp _parent;
        private byte[] _raw_bitmapCoreHeader;
        private byte[] _raw_bitmapInfoHeader;
        private byte[] _raw_bitmapV5Header;
        public int dibHeaderSize() { return dibHeaderSize; }
        public BitmapCoreHeader bitmapCoreHeader() { return bitmapCoreHeader; }
        public BitmapInfoHeader bitmapInfoHeader() { return bitmapInfoHeader; }
        public BitmapCoreHeader bitmapV5Header() { return bitmapV5Header; }
        public byte[] dibHeaderBody() { return dibHeaderBody; }
        public Bmp _root() { return _root; }
        public Bmp _parent() { return _parent; }
        public byte[] _raw_bitmapCoreHeader() { return _raw_bitmapCoreHeader; }
        public byte[] _raw_bitmapInfoHeader() { return _raw_bitmapInfoHeader; }
        public byte[] _raw_bitmapV5Header() { return _raw_bitmapV5Header; }
    }
    public static class BitmapCoreHeader extends KaitaiStruct {
        public static BitmapCoreHeader fromFile(String fileName) throws IOException {
            return new BitmapCoreHeader(new KaitaiStream(fileName));
        }

        public BitmapCoreHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapCoreHeader(KaitaiStream _io, Bmp.DibHeader _parent) {
            this(_io, _parent, null);
        }

        public BitmapCoreHeader(KaitaiStream _io, Bmp.DibHeader _parent, Bmp _root) {
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
        private Bmp.DibHeader _parent;
        public int imageWidth() { return imageWidth; }
        public int imageHeight() { return imageHeight; }
        public int numPlanes() { return numPlanes; }
        public int bitsPerPixel() { return bitsPerPixel; }
        public Bmp _root() { return _root; }
        public Bmp.DibHeader _parent() { return _parent; }
    }
    public static class BitmapInfoHeader extends KaitaiStruct {
        public static BitmapInfoHeader fromFile(String fileName) throws IOException {
            return new BitmapInfoHeader(new KaitaiStream(fileName));
        }

        public BitmapInfoHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BitmapInfoHeader(KaitaiStream _io, Bmp.DibHeader _parent) {
            this(_io, _parent, null);
        }

        public BitmapInfoHeader(KaitaiStream _io, Bmp.DibHeader _parent, Bmp _root) {
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
            this.compression = this._io.readU4le();
            this.sizeImage = this._io.readU4le();
            this.xPxPerM = this._io.readU4le();
            this.yPxPerM = this._io.readU4le();
            this.numColorsUsed = this._io.readU4le();
            this.numColorsImportant = this._io.readU4le();
        }
        private long imageWidth;
        private long imageHeight;
        private int numPlanes;
        private int bitsPerPixel;
        private long compression;
        private long sizeImage;
        private long xPxPerM;
        private long yPxPerM;
        private long numColorsUsed;
        private long numColorsImportant;
        private Bmp _root;
        private Bmp.DibHeader _parent;
        public long imageWidth() { return imageWidth; }
        public long imageHeight() { return imageHeight; }
        public int numPlanes() { return numPlanes; }
        public int bitsPerPixel() { return bitsPerPixel; }
        public long compression() { return compression; }
        public long sizeImage() { return sizeImage; }
        public long xPxPerM() { return xPxPerM; }
        public long yPxPerM() { return yPxPerM; }
        public long numColorsUsed() { return numColorsUsed; }
        public long numColorsImportant() { return numColorsImportant; }
        public Bmp _root() { return _root; }
        public Bmp.DibHeader _parent() { return _parent; }
    }
    private byte[] image;
    public byte[] image() {
        if (this.image != null)
            return this.image;
        long _pos = this._io.pos();
        this._io.seek(fileHdr().bitmapOfs());
        this.image = this._io.readBytesFull();
        this._io.seek(_pos);
        return this.image;
    }
    private FileHeader fileHdr;
    private DibHeader dibHdr;
    private Bmp _root;
    private KaitaiStruct _parent;
    public FileHeader fileHdr() { return fileHdr; }
    public DibHeader dibHdr() { return dibHdr; }
    public Bmp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
