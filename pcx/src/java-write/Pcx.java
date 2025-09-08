// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;


/**
 * PCX is a bitmap image format originally used by PC Paintbrush from
 * ZSoft Corporation. Originally, it was a relatively simple 128-byte
 * header + uncompressed bitmap format, but latest versions introduced
 * more complicated palette support and RLE compression.
 * 
 * There's an option to encode 32-bit or 16-bit RGBA pixels, and thus
 * it can potentially include transparency. Theoretically, it's
 * possible to encode resolution or pixel density in the some of the
 * header fields too, but in reality there's no uniform standard for
 * these, so different implementations treat these differently.
 * 
 * PCX format was never made a formal standard. "ZSoft Corporation
 * Technical Reference Manual" for "Image File (.PCX) Format", last
 * updated in 1991, is likely the closest authoritative source.
 * @see <a href="https://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">Source</a>
 */
public class Pcx extends KaitaiStruct.ReadWrite {
    public static Pcx fromFile(String fileName) throws IOException {
        return new Pcx(new ByteBufferKaitaiStream(fileName));
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
    public Pcx() {
        this(null, null, null);
    }

    public Pcx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Pcx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Pcx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Pcx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_hdr = this._io.readBytes(128);
        KaitaiStream _io__raw_hdr = new ByteBufferKaitaiStream(this._raw_hdr);
        this.hdr = new Header(_io__raw_hdr, this, _root);
        this.hdr._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.hdr._fetchInstances();
        palette256();
        if (this.palette256 != null) {
            this.palette256._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWritePalette256 = _enabledPalette256;
        final KaitaiStream _io__raw_hdr = new ByteBufferKaitaiStream(128);
        this._io.addChildStream(_io__raw_hdr);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (128));
            final Pcx _this = this;
            _io__raw_hdr.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_hdr = _io__raw_hdr.toByteArray();
                    if (_this._raw_hdr.length != 128)
                        throw new ConsistencyError("raw(hdr)", 128, _this._raw_hdr.length);
                    parent.writeBytes(_this._raw_hdr);
                }
            });
        }
        this.hdr._write_Seq(_io__raw_hdr);
    }

    public void _check() {
        if (!Objects.equals(this.hdr._root(), _root()))
            throw new ConsistencyError("hdr", _root(), this.hdr._root());
        if (!Objects.equals(this.hdr._parent(), this))
            throw new ConsistencyError("hdr", this, this.hdr._parent());
        if (_enabledPalette256) {
            if ( ((hdr().version() == Versions.V3_0) && (hdr().bitsPerPixel() == 8) && (hdr().numPlanes() == 1)) ) {
                if (!Objects.equals(this.palette256._root(), _root()))
                    throw new ConsistencyError("palette_256", _root(), this.palette256._root());
                if (!Objects.equals(this.palette256._parent(), this))
                    throw new ConsistencyError("palette_256", this, this.palette256._parent());
            }
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "ZSoft .PCX FILE HEADER FORMAT"</a>
     */
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

        public Header(KaitaiStream _io, Pcx _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Pcx _parent, Pcx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(1);
            if (!(Arrays.equals(this.magic, new byte[] { 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 10 }, this.magic, this._io, "/types/header/seq/0");
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
            if (!(Arrays.equals(this.reserved, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.reserved, this._io, "/types/header/seq/11");
            }
            this.numPlanes = this._io.readU1();
            this.bytesPerLine = this._io.readU2le();
            this.paletteInfo = this._io.readU2le();
            this.hScreenSize = this._io.readU2le();
            this.vScreenSize = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(((Number) (this.version.id())).intValue());
            this._io.writeU1(((Number) (this.encoding.id())).intValue());
            this._io.writeU1(this.bitsPerPixel);
            this._io.writeU2le(this.imgXMin);
            this._io.writeU2le(this.imgYMin);
            this._io.writeU2le(this.imgXMax);
            this._io.writeU2le(this.imgYMax);
            this._io.writeU2le(this.hdpi);
            this._io.writeU2le(this.vdpi);
            this._io.writeBytes(this.palette16);
            this._io.writeBytes(this.reserved);
            this._io.writeU1(this.numPlanes);
            this._io.writeU2le(this.bytesPerLine);
            this._io.writeU2le(this.paletteInfo);
            this._io.writeU2le(this.hScreenSize);
            this._io.writeU2le(this.vScreenSize);
        }

        public void _check() {
            if (this.magic.length != 1)
                throw new ConsistencyError("magic", 1, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 10 }, this.magic, null, "/types/header/seq/0");
            }
            if (this.palette16.length != 48)
                throw new ConsistencyError("palette_16", 48, this.palette16.length);
            if (this.reserved.length != 1)
                throw new ConsistencyError("reserved", 1, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.reserved, null, "/types/header/seq/11");
            }
            _dirty = false;
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public Versions version() { return version; }
        public void setVersion(Versions _v) { _dirty = true; version = _v; }
        public Encodings encoding() { return encoding; }
        public void setEncoding(Encodings _v) { _dirty = true; encoding = _v; }
        public int bitsPerPixel() { return bitsPerPixel; }
        public void setBitsPerPixel(int _v) { _dirty = true; bitsPerPixel = _v; }
        public int imgXMin() { return imgXMin; }
        public void setImgXMin(int _v) { _dirty = true; imgXMin = _v; }
        public int imgYMin() { return imgYMin; }
        public void setImgYMin(int _v) { _dirty = true; imgYMin = _v; }
        public int imgXMax() { return imgXMax; }
        public void setImgXMax(int _v) { _dirty = true; imgXMax = _v; }
        public int imgYMax() { return imgYMax; }
        public void setImgYMax(int _v) { _dirty = true; imgYMax = _v; }
        public int hdpi() { return hdpi; }
        public void setHdpi(int _v) { _dirty = true; hdpi = _v; }
        public int vdpi() { return vdpi; }
        public void setVdpi(int _v) { _dirty = true; vdpi = _v; }
        public byte[] palette16() { return palette16; }
        public void setPalette16(byte[] _v) { _dirty = true; palette16 = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public int numPlanes() { return numPlanes; }
        public void setNumPlanes(int _v) { _dirty = true; numPlanes = _v; }
        public int bytesPerLine() { return bytesPerLine; }
        public void setBytesPerLine(int _v) { _dirty = true; bytesPerLine = _v; }
        public int paletteInfo() { return paletteInfo; }
        public void setPaletteInfo(int _v) { _dirty = true; paletteInfo = _v; }
        public int hScreenSize() { return hScreenSize; }
        public void setHScreenSize(int _v) { _dirty = true; hScreenSize = _v; }
        public int vScreenSize() { return vScreenSize; }
        public void setVScreenSize(int _v) { _dirty = true; vScreenSize = _v; }
        public Pcx _root() { return _root; }
        public void set_root(Pcx _v) { _dirty = true; _root = _v; }
        public Pcx _parent() { return _parent; }
        public void set_parent(Pcx _v) { _dirty = true; _parent = _v; }
    }
    public static class Rgb extends KaitaiStruct.ReadWrite {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
        }
        public Rgb() {
            this(null, null, null);
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
        }
        public void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.r);
            this._io.writeU1(this.g);
            this._io.writeU1(this.b);
        }

        public void _check() {
            _dirty = false;
        }
        private int r;
        private int g;
        private int b;
        private Pcx _root;
        private Pcx.TPalette256 _parent;
        public int r() { return r; }
        public void setR(int _v) { _dirty = true; r = _v; }
        public int g() { return g; }
        public void setG(int _v) { _dirty = true; g = _v; }
        public int b() { return b; }
        public void setB(int _v) { _dirty = true; b = _v; }
        public Pcx _root() { return _root; }
        public void set_root(Pcx _v) { _dirty = true; _root = _v; }
        public Pcx.TPalette256 _parent() { return _parent; }
        public void set_parent(Pcx.TPalette256 _v) { _dirty = true; _parent = _v; }
    }
    public static class TPalette256 extends KaitaiStruct.ReadWrite {
        public static TPalette256 fromFile(String fileName) throws IOException {
            return new TPalette256(new ByteBufferKaitaiStream(fileName));
        }
        public TPalette256() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(1);
            if (!(Arrays.equals(this.magic, new byte[] { 12 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 12 }, this.magic, this._io, "/types/t_palette_256/seq/0");
            }
            this.colors = new ArrayList<Rgb>();
            for (int i = 0; i < 256; i++) {
                Rgb _t_colors = new Rgb(this._io, this, _root);
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
            this._io.writeBytes(this.magic);
            for (int i = 0; i < this.colors.size(); i++) {
                this.colors.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.magic.length != 1)
                throw new ConsistencyError("magic", 1, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 12 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 12 }, this.magic, null, "/types/t_palette_256/seq/0");
            }
            if (this.colors.size() != 256)
                throw new ConsistencyError("colors", 256, this.colors.size());
            for (int i = 0; i < this.colors.size(); i++) {
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("colors", _root(), this.colors.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.colors.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("colors", this, this.colors.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private byte[] magic;
        private List<Rgb> colors;
        private Pcx _root;
        private Pcx _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public List<Rgb> colors() { return colors; }
        public void setColors(List<Rgb> _v) { _dirty = true; colors = _v; }
        public Pcx _root() { return _root; }
        public void set_root(Pcx _v) { _dirty = true; _root = _v; }
        public Pcx _parent() { return _parent; }
        public void set_parent(Pcx _v) { _dirty = true; _parent = _v; }
    }
    private TPalette256 palette256;
    private boolean _shouldWritePalette256 = false;
    private boolean _enabledPalette256 = true;

    /**
     * @see <a href="https://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "VGA 256 Color Palette Information"</a>
     */
    public TPalette256 palette256() {
        if (_shouldWritePalette256)
            _writePalette256();
        if (this.palette256 != null)
            return this.palette256;
        if (!_enabledPalette256)
            return null;
        if ( ((hdr().version() == Versions.V3_0) && (hdr().bitsPerPixel() == 8) && (hdr().numPlanes() == 1)) ) {
            long _pos = this._io.pos();
            this._io.seek(_io().size() - 769);
            this.palette256 = new TPalette256(this._io, this, _root);
            this.palette256._read();
            this._io.seek(_pos);
        }
        return this.palette256;
    }
    public void setPalette256(TPalette256 _v) { _dirty = true; palette256 = _v; }
    public void setPalette256_Enabled(boolean _v) { _dirty = true; _enabledPalette256 = _v; }

    private void _writePalette256() {
        _shouldWritePalette256 = false;
        if ( ((hdr().version() == Versions.V3_0) && (hdr().bitsPerPixel() == 8) && (hdr().numPlanes() == 1)) ) {
            long _pos = this._io.pos();
            this._io.seek(_io().size() - 769);
            this.palette256._write_Seq(this._io);
            this._io.seek(_pos);
        }
    }
    private Header hdr;
    private Pcx _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_hdr;
    public Header hdr() { return hdr; }
    public void setHdr(Header _v) { _dirty = true; hdr = _v; }
    public Pcx _root() { return _root; }
    public void set_root(Pcx _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_hdr() { return _raw_hdr; }
    public void set_raw_Hdr(byte[] _v) { _dirty = true; _raw_hdr = _v; }
}
