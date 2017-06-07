// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class Pcx extends KaitaiStruct {
    public static Pcx fromFile(String fileName) throws IOException {
        return new Pcx(new KaitaiStream(fileName));
    }

    public Pcx(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Pcx(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Pcx(KaitaiStream _io, KaitaiStruct _parent, Pcx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this._raw_hdr = this._io.readBytes(128);
        KaitaiStream _io__raw_hdr = new KaitaiStream(_raw_hdr);
        this.hdr = new Header(_io__raw_hdr, this, _root);
    }

    /**
     * @see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "ZSoft .PCX FILE HEADER FORMAT"</a>
     */
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new KaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header(KaitaiStream _io, Pcx _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header(KaitaiStream _io, Pcx _parent, Pcx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.manufacturer = this._io.readU1();
            this.version = this._io.readU1();
            this.encoding = this._io.readU1();
            this.bitsPerPixel = this._io.readU1();
            this.imgXMin = this._io.readU2le();
            this.imgYMin = this._io.readU2le();
            this.imgXMax = this._io.readU2le();
            this.imgYMax = this._io.readU2le();
            this.hdpi = this._io.readU2le();
            this.vdpi = this._io.readU2le();
            this.colormap = this._io.readBytes(48);
            this.reserved = this._io.readBytes(1);
            this.numPlanes = this._io.readU1();
            this.bytesPerLine = this._io.readU2le();
            this.paletteInfo = this._io.readU2le();
            this.hScreenSize = this._io.readU2le();
            this.vScreenSize = this._io.readU2le();
        }
        private int manufacturer;
        private int version;
        private int encoding;
        private int bitsPerPixel;
        private int imgXMin;
        private int imgYMin;
        private int imgXMax;
        private int imgYMax;
        private int hdpi;
        private int vdpi;
        private byte[] colormap;
        private byte[] reserved;
        private int numPlanes;
        private int bytesPerLine;
        private int paletteInfo;
        private int hScreenSize;
        private int vScreenSize;
        private Pcx _root;
        private Pcx _parent;
        public int manufacturer() { return manufacturer; }
        public int version() { return version; }
        public int encoding() { return encoding; }
        public int bitsPerPixel() { return bitsPerPixel; }
        public int imgXMin() { return imgXMin; }
        public int imgYMin() { return imgYMin; }
        public int imgXMax() { return imgXMax; }
        public int imgYMax() { return imgYMax; }
        public int hdpi() { return hdpi; }
        public int vdpi() { return vdpi; }
        public byte[] colormap() { return colormap; }
        public byte[] reserved() { return reserved; }
        public int numPlanes() { return numPlanes; }
        public int bytesPerLine() { return bytesPerLine; }
        public int paletteInfo() { return paletteInfo; }
        public int hScreenSize() { return hScreenSize; }
        public int vScreenSize() { return vScreenSize; }
        public Pcx _root() { return _root; }
        public Pcx _parent() { return _parent; }
    }
    private Header hdr;
    private Pcx _root;
    private KaitaiStruct _parent;
    private byte[] _raw_hdr;
    public Header hdr() { return hdr; }
    public Pcx _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_hdr() { return _raw_hdr; }
}
