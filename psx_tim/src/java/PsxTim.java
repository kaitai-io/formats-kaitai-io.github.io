// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;


/**
 * @see <a href="http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics)">Source</a>
 * @see <a href="http://mrclick.zophar.net/TilEd/download/timgfx.txt">Source</a>
 * @see <a href="https://www.romhacking.net/documents/31/">Source</a>
 */
public class PsxTim extends KaitaiStruct {
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

    public PsxTim(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PsxTim(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PsxTim(KaitaiStream _io, KaitaiStruct _parent, PsxTim _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { 16, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 16, 0, 0, 0 }, magic(), _io(), "/seq/0");
        }
        this.flags = this._io.readU4le();
        if (hasClut()) {
            this.clut = new Bitmap(this._io, this, _root);
        }
        this.img = new Bitmap(this._io, this, _root);
    }
    public static class Bitmap extends KaitaiStruct {
        public static Bitmap fromFile(String fileName) throws IOException {
            return new Bitmap(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.len = this._io.readU4le();
            this.originX = this._io.readU2le();
            this.originY = this._io.readU2le();
            this.width = this._io.readU2le();
            this.height = this._io.readU2le();
            this.body = this._io.readBytes((len() - 12));
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
        public int originX() { return originX; }
        public int originY() { return originY; }
        public int width() { return width; }
        public int height() { return height; }
        public byte[] body() { return body; }
        public PsxTim _root() { return _root; }
        public PsxTim _parent() { return _parent; }
    }
    private Boolean hasClut;
    public Boolean hasClut() {
        if (this.hasClut != null)
            return this.hasClut;
        boolean _tmp = (boolean) ((flags() & 8) != 0);
        this.hasClut = _tmp;
        return this.hasClut;
    }
    private Integer bpp;
    public Integer bpp() {
        if (this.bpp != null)
            return this.bpp;
        int _tmp = (int) ((flags() & 3));
        this.bpp = _tmp;
        return this.bpp;
    }
    private byte[] magic;
    private long flags;
    private Bitmap clut;
    private Bitmap img;
    private PsxTim _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * Encodes bits-per-pixel and whether CLUT is present in a file or not
     */
    public long flags() { return flags; }

    /**
     * CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
     */
    public Bitmap clut() { return clut; }
    public Bitmap img() { return img; }
    public PsxTim _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
