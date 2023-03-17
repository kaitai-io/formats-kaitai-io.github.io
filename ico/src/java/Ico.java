// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;


/**
 * Microsoft Windows uses specific file format to store applications
 * icons - ICO. This is a container that contains one or more image
 * files (effectively, DIB parts of BMP files or full PNG files are
 * contained inside).
 * @see <a href="https://learn.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10)">Source</a>
 */
public class Ico extends KaitaiStruct {
    public static Ico fromFile(String fileName) throws IOException {
        return new Ico(new ByteBufferKaitaiStream(fileName));
    }

    public Ico(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ico(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ico(KaitaiStream _io, KaitaiStruct _parent, Ico _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { 0, 0, 1, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 1, 0 }, magic(), _io(), "/seq/0");
        }
        this.numImages = this._io.readU2le();
        this.images = new ArrayList<IconDirEntry>();
        for (int i = 0; i < numImages(); i++) {
            this.images.add(new IconDirEntry(this._io, this, _root));
        }
    }
    public static class IconDirEntry extends KaitaiStruct {
        public static IconDirEntry fromFile(String fileName) throws IOException {
            return new IconDirEntry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.width = this._io.readU1();
            this.height = this._io.readU1();
            this.numColors = this._io.readU1();
            this.reserved = this._io.readBytes(1);
            if (!(Arrays.equals(reserved(), new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, reserved(), _io(), "/types/icon_dir_entry/seq/3");
            }
            this.numPlanes = this._io.readU2le();
            this.bpp = this._io.readU2le();
            this.lenImg = this._io.readU4le();
            this.ofsImg = this._io.readU4le();
        }
        private byte[] img;

        /**
         * Raw image data. Use `is_png` to determine whether this is an
         * embedded PNG file (true) or a DIB bitmap (false) and call a
         * relevant parser, if needed to parse image data further.
         */
        public byte[] img() {
            if (this.img != null)
                return this.img;
            long _pos = this._io.pos();
            this._io.seek(ofsImg());
            this.img = this._io.readBytes(lenImg());
            this._io.seek(_pos);
            return this.img;
        }
        private byte[] pngHeader;

        /**
         * Pre-reads first 8 bytes of the image to determine if it's an
         * embedded PNG file.
         */
        public byte[] pngHeader() {
            if (this.pngHeader != null)
                return this.pngHeader;
            long _pos = this._io.pos();
            this._io.seek(ofsImg());
            this.pngHeader = this._io.readBytes(8);
            this._io.seek(_pos);
            return this.pngHeader;
        }
        private Boolean isPng;

        /**
         * True if this image is in PNG format.
         */
        public Boolean isPng() {
            if (this.isPng != null)
                return this.isPng;
            boolean _tmp = (boolean) (Arrays.equals(pngHeader(), new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 }));
            this.isPng = _tmp;
            return this.isPng;
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

        /**
         * Height of image, px
         */
        public int height() { return height; }

        /**
         * Number of colors in palette of the image or 0 if image has
         * no palette (i.e. RGB, RGBA, etc)
         */
        public int numColors() { return numColors; }
        public byte[] reserved() { return reserved; }

        /**
         * Number of color planes
         */
        public int numPlanes() { return numPlanes; }

        /**
         * Bits per pixel in the image
         */
        public int bpp() { return bpp; }

        /**
         * Size of the image data
         */
        public long lenImg() { return lenImg; }

        /**
         * Absolute offset of the image data start in the file
         */
        public long ofsImg() { return ofsImg; }
        public Ico _root() { return _root; }
        public Ico _parent() { return _parent; }
    }
    private byte[] magic;
    private int numImages;
    private ArrayList<IconDirEntry> images;
    private Ico _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * Number of images contained in this file
     */
    public int numImages() { return numImages; }
    public ArrayList<IconDirEntry> images() { return images; }
    public Ico _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
