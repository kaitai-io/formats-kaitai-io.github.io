// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * @see <a href="http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics)">Source</a>
 * @see <a href="https://mrclick.zophar.net/TilEd/download/timgfx.txt">Source</a>
 * @see <a href="https://www.romhacking.net/documents/31/">Source</a>
 */
public class PsxTim extends KaitaiStruct.ReadWrite {
    public static PsxTim fromFile(String fileName) throws IOException {
        return new PsxTim(new ByteBufferKaitaiStream(fileName));
    }

    public enum BppType {
        BPP_4(0),
        BPP_8(1),
        BPP_16(2),
        BPP_24(3);

        private final long id;
        BppType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BppType> byId = new HashMap<Long, BppType>(4);
        static {
            for (BppType e : BppType.values())
                byId.put(e.id(), e);
        }
        public static BppType byId(long id) { return byId.get(id); }
    }
    public PsxTim() {
        this(null, null, null);
    }

    public PsxTim(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PsxTim(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PsxTim(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PsxTim _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 16, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 16, 0, 0, 0 }, this.magic, this._io, "/seq/0");
        }
        this.flags = this._io.readU4le();
        if (hasClut()) {
            this.clut = new Bitmap(this._io, this, _root);
            this.clut._read();
        }
        this.img = new Bitmap(this._io, this, _root);
        this.img._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        if (hasClut()) {
            this.clut._fetchInstances();
        }
        this.img._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.flags);
        if (hasClut()) {
            this.clut._write_Seq(this._io);
        }
        this.img._write_Seq(this._io);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 16, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 16, 0, 0, 0 }, this.magic, null, "/seq/0");
        }
        if (hasClut()) {
            if (!Objects.equals(this.clut._root(), _root()))
                throw new ConsistencyError("clut", _root(), this.clut._root());
            if (!Objects.equals(this.clut._parent(), this))
                throw new ConsistencyError("clut", this, this.clut._parent());
        }
        if (!Objects.equals(this.img._root(), _root()))
            throw new ConsistencyError("img", _root(), this.img._root());
        if (!Objects.equals(this.img._parent(), this))
            throw new ConsistencyError("img", this, this.img._parent());
        _dirty = false;
    }
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

        public Bitmap(KaitaiStream _io, PsxTim _parent) {
            this(_io, _parent, null);
        }

        public Bitmap(KaitaiStream _io, PsxTim _parent, PsxTim _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4le();
            this.originX = this._io.readU2le();
            this.originY = this._io.readU2le();
            this.width = this._io.readU2le();
            this.height = this._io.readU2le();
            this.body = this._io.readBytes(len() - 12);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.len);
            this._io.writeU2le(this.originX);
            this._io.writeU2le(this.originY);
            this._io.writeU2le(this.width);
            this._io.writeU2le(this.height);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != len() - 12)
                throw new ConsistencyError("body", len() - 12, this.body.length);
            _dirty = false;
        }
        private long len;
        private int originX;
        private int originY;
        private int width;
        private int height;
        private byte[] body;
        private PsxTim _root;
        private PsxTim _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public int originX() { return originX; }
        public void setOriginX(int _v) { _dirty = true; originX = _v; }
        public int originY() { return originY; }
        public void setOriginY(int _v) { _dirty = true; originY = _v; }
        public int width() { return width; }
        public void setWidth(int _v) { _dirty = true; width = _v; }
        public int height() { return height; }
        public void setHeight(int _v) { _dirty = true; height = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public PsxTim _root() { return _root; }
        public void set_root(PsxTim _v) { _dirty = true; _root = _v; }
        public PsxTim _parent() { return _parent; }
        public void set_parent(PsxTim _v) { _dirty = true; _parent = _v; }
    }
    private Integer bpp;
    public Integer bpp() {
        if (this.bpp != null)
            return this.bpp;
        this.bpp = ((Number) (flags() & 3)).intValue();
        return this.bpp;
    }
    public void _invalidateBpp() { this.bpp = null; }
    private Boolean hasClut;
    public Boolean hasClut() {
        if (this.hasClut != null)
            return this.hasClut;
        this.hasClut = (flags() & 8) != 0;
        return this.hasClut;
    }
    public void _invalidateHasClut() { this.hasClut = null; }
    private byte[] magic;
    private long flags;
    private Bitmap clut;
    private Bitmap img;
    private PsxTim _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * Encodes bits-per-pixel and whether CLUT is present in a file or not
     */
    public long flags() { return flags; }
    public void setFlags(long _v) { _dirty = true; flags = _v; }

    /**
     * CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
     */
    public Bitmap clut() { return clut; }
    public void setClut(Bitmap _v) { _dirty = true; clut = _v; }
    public Bitmap img() { return img; }
    public void setImg(Bitmap _v) { _dirty = true; img = _v; }
    public PsxTim _root() { return _root; }
    public void set_root(PsxTim _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
