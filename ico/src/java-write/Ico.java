// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * Microsoft Windows uses specific file format to store applications
 * icons - ICO. This is a container that contains one or more image
 * files (effectively, DIB parts of BMP files or full PNG files are
 * contained inside).
 * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10)">Source</a>
 */
public class Ico extends KaitaiStruct.ReadWrite {
    public static Ico fromFile(String fileName) throws IOException {
        return new Ico(new ByteBufferKaitaiStream(fileName));
    }
    public Ico() {
        this(null, null, null);
    }

    public Ico(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ico(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ico(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ico _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 0, 0, 1, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 1, 0 }, this.magic, this._io, "/seq/0");
        }
        this.numImages = this._io.readU2le();
        this.images = new ArrayList<IconDirEntry>();
        for (int i = 0; i < numImages(); i++) {
            IconDirEntry _t_images = new IconDirEntry(this._io, this, _root);
            try {
                _t_images._read();
            } finally {
                this.images.add(_t_images);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.images.size(); i++) {
            this.images.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU2le(this.numImages);
        for (int i = 0; i < this.images.size(); i++) {
            this.images.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 0, 0, 1, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 1, 0 }, this.magic, null, "/seq/0");
        }
        if (this.images.size() != numImages())
            throw new ConsistencyError("images", numImages(), this.images.size());
        for (int i = 0; i < this.images.size(); i++) {
            if (!Objects.equals(this.images.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("images", _root(), this.images.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.images.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("images", this, this.images.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class IconDirEntry extends KaitaiStruct.ReadWrite {
        public static IconDirEntry fromFile(String fileName) throws IOException {
            return new IconDirEntry(new ByteBufferKaitaiStream(fileName));
        }
        public IconDirEntry() {
            this(null, null, null);
        }

        public IconDirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IconDirEntry(KaitaiStream _io, Ico _parent) {
            this(_io, _parent, null);
        }

        public IconDirEntry(KaitaiStream _io, Ico _parent, Ico _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.width = this._io.readU1();
            this.height = this._io.readU1();
            this.numColors = this._io.readU1();
            this.reserved = this._io.readBytes(1);
            if (!(Arrays.equals(this.reserved, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.reserved, this._io, "/types/icon_dir_entry/seq/3");
            }
            this.numPlanes = this._io.readU2le();
            this.bpp = this._io.readU2le();
            this.lenImg = this._io.readU4le();
            this.ofsImg = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            img();
            if (this.img != null) {
            }
            pngHeader();
            if (this.pngHeader != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteImg = _enabledImg;
            _shouldWritePngHeader = _enabledPngHeader;
            this._io.writeU1(this.width);
            this._io.writeU1(this.height);
            this._io.writeU1(this.numColors);
            this._io.writeBytes(this.reserved);
            this._io.writeU2le(this.numPlanes);
            this._io.writeU2le(this.bpp);
            this._io.writeU4le(this.lenImg);
            this._io.writeU4le(this.ofsImg);
        }

        public void _check() {
            if (this.reserved.length != 1)
                throw new ConsistencyError("reserved", 1, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.reserved, null, "/types/icon_dir_entry/seq/3");
            }
            if (_enabledImg) {
                if (this.img.length != lenImg())
                    throw new ConsistencyError("img", lenImg(), this.img.length);
            }
            if (_enabledPngHeader) {
                if (this.pngHeader.length != 8)
                    throw new ConsistencyError("png_header", 8, this.pngHeader.length);
            }
            _dirty = false;
        }
        private byte[] img;
        private boolean _shouldWriteImg = false;
        private boolean _enabledImg = true;

        /**
         * Raw image data. Use `is_png` to determine whether this is an
         * embedded PNG file (true) or a DIB bitmap (false) and call a
         * relevant parser, if needed to parse image data further.
         */
        public byte[] img() {
            if (_shouldWriteImg)
                _writeImg();
            if (this.img != null)
                return this.img;
            if (!_enabledImg)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsImg());
            this.img = this._io.readBytes(lenImg());
            this._io.seek(_pos);
            return this.img;
        }
        public void setImg(byte[] _v) { _dirty = true; img = _v; }
        public void setImg_Enabled(boolean _v) { _dirty = true; _enabledImg = _v; }

        private void _writeImg() {
            _shouldWriteImg = false;
            long _pos = this._io.pos();
            this._io.seek(ofsImg());
            this._io.writeBytes(this.img);
            this._io.seek(_pos);
        }
        private Boolean isPng;

        /**
         * True if this image is in PNG format.
         */
        public Boolean isPng() {
            if (this.isPng != null)
                return this.isPng;
            this.isPng = Arrays.equals(pngHeader(), new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 });
            return this.isPng;
        }
        public void _invalidateIsPng() { this.isPng = null; }
        private byte[] pngHeader;
        private boolean _shouldWritePngHeader = false;
        private boolean _enabledPngHeader = true;

        /**
         * Pre-reads first 8 bytes of the image to determine if it's an
         * embedded PNG file.
         */
        public byte[] pngHeader() {
            if (_shouldWritePngHeader)
                _writePngHeader();
            if (this.pngHeader != null)
                return this.pngHeader;
            if (!_enabledPngHeader)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsImg());
            this.pngHeader = this._io.readBytes(8);
            this._io.seek(_pos);
            return this.pngHeader;
        }
        public void setPngHeader(byte[] _v) { _dirty = true; pngHeader = _v; }
        public void setPngHeader_Enabled(boolean _v) { _dirty = true; _enabledPngHeader = _v; }

        private void _writePngHeader() {
            _shouldWritePngHeader = false;
            long _pos = this._io.pos();
            this._io.seek(ofsImg());
            this._io.writeBytes(this.pngHeader);
            this._io.seek(_pos);
        }
        private int width;
        private int height;
        private int numColors;
        private byte[] reserved;
        private int numPlanes;
        private int bpp;
        private long lenImg;
        private long ofsImg;
        private Ico _root;
        private Ico _parent;

        /**
         * Width of image, px
         */
        public int width() { return width; }
        public void setWidth(int _v) { _dirty = true; width = _v; }

        /**
         * Height of image, px
         */
        public int height() { return height; }
        public void setHeight(int _v) { _dirty = true; height = _v; }

        /**
         * Number of colors in palette of the image or 0 if image has
         * no palette (i.e. RGB, RGBA, etc)
         */
        public int numColors() { return numColors; }
        public void setNumColors(int _v) { _dirty = true; numColors = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }

        /**
         * Number of color planes
         */
        public int numPlanes() { return numPlanes; }
        public void setNumPlanes(int _v) { _dirty = true; numPlanes = _v; }

        /**
         * Bits per pixel in the image
         */
        public int bpp() { return bpp; }
        public void setBpp(int _v) { _dirty = true; bpp = _v; }

        /**
         * Size of the image data
         */
        public long lenImg() { return lenImg; }
        public void setLenImg(long _v) { _dirty = true; lenImg = _v; }

        /**
         * Absolute offset of the image data start in the file
         */
        public long ofsImg() { return ofsImg; }
        public void setOfsImg(long _v) { _dirty = true; ofsImg = _v; }
        public Ico _root() { return _root; }
        public void set_root(Ico _v) { _dirty = true; _root = _v; }
        public Ico _parent() { return _parent; }
        public void set_parent(Ico _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private int numImages;
    private List<IconDirEntry> images;
    private Ico _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * Number of images contained in this file
     */
    public int numImages() { return numImages; }
    public void setNumImages(int _v) { _dirty = true; numImages = _v; }
    public List<IconDirEntry> images() { return images; }
    public void setImages(List<IconDirEntry> _v) { _dirty = true; images = _v; }
    public Ico _root() { return _root; }
    public void set_root(Ico _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
