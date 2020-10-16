// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;

public class Pcx extends KaitaiStruct {
    public static Pcx fromFile(String fileName) throws IOException {
        return new Pcx(new ByteBufferKaitaiStream(fileName));
    }

    public enum Versions {
        V2_5(0),
        V2_8_WITH_PALETTE(2),
        V2_8_WITHOUT_PALETTE(3),
        PAINTBRUSH_FOR_WINDOWS(4),
        V3_0(5);

        private final long id;
        Versions(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Versions> byId = new HashMap<Long, Versions>(5);
        static {
            for (Versions e : Versions.values())
                byId.put(e.id(), e);
        }
        public static Versions byId(long id) { return byId.get(id); }
    }

    public enum Encodings {
        RLE(1);

        private final long id;
        Encodings(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Encodings> byId = new HashMap<Long, Encodings>(1);
        static {
            for (Encodings e : Encodings.values())
                byId.put(e.id(), e);
        }
        public static Encodings byId(long id) { return byId.get(id); }
    }

    public Pcx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Pcx(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Pcx(KaitaiStream _io, KaitaiStruct _parent, Pcx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_hdr = this._io.readBytes(128);
        KaitaiStream _io__raw_hdr = new ByteBufferKaitaiStream(_raw_hdr);
        this.hdr = new Header(_io__raw_hdr, this, _root);
    }

    /**
     * @see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "ZSoft .PCX FILE HEADER FORMAT"</a>
     */
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Pcx _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Pcx _parent, Pcx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(1);
            if (!(Arrays.equals(magic(), new byte[] { 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 10 }, magic(), _io(), "/types/header/seq/0");
            }
            this.version = Pcx.Versions.byId(this._io.readU1());
            this.encoding = Pcx.Encodings.byId(this._io.readU1());
            this.bitsPerPixel = this._io.readU1();
            this.imgXMin = this._io.readU2le();
            this.imgYMin = this._io.readU2le();
            this.imgXMax = this._io.readU2le();
            this.imgYMax = this._io.readU2le();
            this.hdpi = this._io.readU2le();
            this.vdpi = this._io.readU2le();
            this.palette16 = this._io.readBytes(48);
            this.reserved = this._io.readBytes(1);
            if (!(Arrays.equals(reserved(), new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, reserved(), _io(), "/types/header/seq/11");
            }
            this.numPlanes = this._io.readU1();
            this.bytesPerLine = this._io.readU2le();
            this.paletteInfo = this._io.readU2le();
            this.hScreenSize = this._io.readU2le();
            this.vScreenSize = this._io.readU2le();
        }
        private byte[] magic;
        private Versions version;
        private Encodings encoding;
        private int bitsPerPixel;
        private int imgXMin;
        private int imgYMin;
        private int imgXMax;
        private int imgYMax;
        private int hdpi;
        private int vdpi;
        private byte[] palette16;
        private byte[] reserved;
        private int numPlanes;
        private int bytesPerLine;
        private int paletteInfo;
        private int hScreenSize;
        private int vScreenSize;
        private Pcx _root;
        private Pcx _parent;

        /**
         * Technically, this field was supposed to be "manufacturer"
         * mark to distinguish between various software vendors, and
         * 0x0a was supposed to mean "ZSoft", but everyone else ended
         * up writing a 0x0a into this field, so that's what majority
         * of modern software expects to have in this attribute.
         */
        public byte[] magic() { return magic; }
        public Versions version() { return version; }
        public Encodings encoding() { return encoding; }
        public int bitsPerPixel() { return bitsPerPixel; }
        public int imgXMin() { return imgXMin; }
        public int imgYMin() { return imgYMin; }
        public int imgXMax() { return imgXMax; }
        public int imgYMax() { return imgYMax; }
        public int hdpi() { return hdpi; }
        public int vdpi() { return vdpi; }
        public byte[] palette16() { return palette16; }
        public byte[] reserved() { return reserved; }
        public int numPlanes() { return numPlanes; }
        public int bytesPerLine() { return bytesPerLine; }
        public int paletteInfo() { return paletteInfo; }
        public int hScreenSize() { return hScreenSize; }
        public int vScreenSize() { return vScreenSize; }
        public Pcx _root() { return _root; }
        public Pcx _parent() { return _parent; }
    }
    public static class TPalette256 extends KaitaiStruct {
        public static TPalette256 fromFile(String fileName) throws IOException {
            return new TPalette256(new ByteBufferKaitaiStream(fileName));
        }

        public TPalette256(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TPalette256(KaitaiStream _io, Pcx _parent) {
            this(_io, _parent, null);
        }

        public TPalette256(KaitaiStream _io, Pcx _parent, Pcx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(1);
            if (!(Arrays.equals(magic(), new byte[] { 12 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 12 }, magic(), _io(), "/types/t_palette_256/seq/0");
            }
            colors = new ArrayList<Rgb>(((Number) (256)).intValue());
            for (int i = 0; i < 256; i++) {
                this.colors.add(new Rgb(this._io, this, _root));
            }
        }
        private byte[] magic;
        private ArrayList<Rgb> colors;
        private Pcx _root;
        private Pcx _parent;
        public byte[] magic() { return magic; }
        public ArrayList<Rgb> colors() { return colors; }
        public Pcx _root() { return _root; }
        public Pcx _parent() { return _parent; }
    }
    public static class Rgb extends KaitaiStruct {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
        }

        public Rgb(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rgb(KaitaiStream _io, Pcx.TPalette256 _parent) {
            this(_io, _parent, null);
        }

        public Rgb(KaitaiStream _io, Pcx.TPalette256 _parent, Pcx _root) {
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
        private Pcx _root;
        private Pcx.TPalette256 _parent;
        public int r() { return r; }
        public int g() { return g; }
        public int b() { return b; }
        public Pcx _root() { return _root; }
        public Pcx.TPalette256 _parent() { return _parent; }
    }
    private TPalette256 palette256;

    /**
     * @see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "VGA 256 Color Palette Information"</a>
     */
    public TPalette256 palette256() {
        if (this.palette256 != null)
            return this.palette256;
        if ( ((hdr().version() == Versions.V3_0) && (hdr().bitsPerPixel() == 8) && (hdr().numPlanes() == 1)) ) {
            long _pos = this._io.pos();
            this._io.seek((_io().size() - 769));
            this.palette256 = new TPalette256(this._io, this, _root);
            this._io.seek(_pos);
        }
        return this.palette256;
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
