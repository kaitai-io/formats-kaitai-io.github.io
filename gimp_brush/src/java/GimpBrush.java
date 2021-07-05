// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
 * It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
 * for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
 * the tool. The Spacing parameter sets the distance between the brush marks as a percentage
 * of brush width. Its default value can be set in the brush file.
 * 
 * You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
 * into GIMP for use in the paint tools by copying them into one of the Brush Folders -
 * select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
 * and choose **Brushes** to see the recognized Brush Folders or to add new ones.
 * @see <a href="https://gitlab.gnome.org/GNOME/gimp/-/raw/4416313/devel-docs/gbr.txt">Source</a>
 */
public class GimpBrush extends KaitaiStruct {
    public static GimpBrush fromFile(String fileName) throws IOException {
        return new GimpBrush(new ByteBufferKaitaiStream(fileName));
    }

    public enum ColorDepth {
        GRAYSCALE(1),
        RGBA(4);

        private final long id;
        ColorDepth(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ColorDepth> byId = new HashMap<Long, ColorDepth>(2);
        static {
            for (ColorDepth e : ColorDepth.values())
                byId.put(e.id(), e);
        }
        public static ColorDepth byId(long id) { return byId.get(id); }
    }

    public GimpBrush(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GimpBrush(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GimpBrush(KaitaiStream _io, KaitaiStruct _parent, GimpBrush _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.lenHeader = this._io.readU4be();
        this._raw_header = this._io.readBytes((lenHeader() - 4));
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
        this.header = new Header(_io__raw_header, this, _root);
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, GimpBrush _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, GimpBrush _parent, GimpBrush _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU4be();
            if (!(version() == 2)) {
                throw new KaitaiStream.ValidationNotEqualError(2, version(), _io(), "/types/header/seq/0");
            }
            this.width = this._io.readU4be();
            if (!(width() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, width(), _io(), "/types/header/seq/1");
            }
            if (!(width() <= 10000)) {
                throw new KaitaiStream.ValidationGreaterThanError(10000, width(), _io(), "/types/header/seq/1");
            }
            this.height = this._io.readU4be();
            if (!(height() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, height(), _io(), "/types/header/seq/2");
            }
            if (!(height() <= 10000)) {
                throw new KaitaiStream.ValidationGreaterThanError(10000, height(), _io(), "/types/header/seq/2");
            }
            this.bytesPerPixel = GimpBrush.ColorDepth.byId(this._io.readU4be());
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 71, 73, 77, 80 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 73, 77, 80 }, magic(), _io(), "/types/header/seq/4");
            }
            this.spacing = this._io.readU4be();
            this.brushName = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), Charset.forName("UTF-8"));
        }
        private long version;
        private long width;
        private long height;
        private ColorDepth bytesPerPixel;
        private byte[] magic;
        private long spacing;
        private String brushName;
        private GimpBrush _root;
        private GimpBrush _parent;
        public long version() { return version; }

        /**
         * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L170">Source</a>
         * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24">Source</a>
         */
        public long width() { return width; }

        /**
         * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-load.c#L177">Source</a>
         * @see <a href="https://github.com/GNOME/gimp/blob/9b6d59f/app/core/gimpbrush-header.h#L24">Source</a>
         */
        public long height() { return height; }
        public ColorDepth bytesPerPixel() { return bytesPerPixel; }
        public byte[] magic() { return magic; }

        /**
         * Default spacing to be used for brush. Percentage of brush width.
         */
        public long spacing() { return spacing; }
        public String brushName() { return brushName; }
        public GimpBrush _root() { return _root; }
        public GimpBrush _parent() { return _parent; }
    }
    public static class Bitmap extends KaitaiStruct {
        public static Bitmap fromFile(String fileName) throws IOException {
            return new Bitmap(new ByteBufferKaitaiStream(fileName));
        }

        public Bitmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bitmap(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Bitmap(KaitaiStream _io, KaitaiStruct _parent, GimpBrush _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            rows = new ArrayList<Row>(((Number) (_root.header().height())).intValue());
            for (int i = 0; i < _root.header().height(); i++) {
                this.rows.add(new Row(this._io, this, _root));
            }
        }
        private ArrayList<Row> rows;
        private GimpBrush _root;
        private KaitaiStruct _parent;
        public ArrayList<Row> rows() { return rows; }
        public GimpBrush _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Row extends KaitaiStruct {
        public static Row fromFile(String fileName) throws IOException {
            return new Row(new ByteBufferKaitaiStream(fileName));
        }

        public Row(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Row(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Row(KaitaiStream _io, KaitaiStruct _parent, GimpBrush _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            pixels = new ArrayList<KaitaiStruct>(((Number) (_root.header().width())).intValue());
            for (int i = 0; i < _root.header().width(); i++) {
                {
                    ColorDepth on = _root.header().bytesPerPixel();
                    if (on != null) {
                        switch (_root.header().bytesPerPixel()) {
                        case GRAYSCALE: {
                            this.pixels.add(new PixelGray(this._io, this, _root));
                            break;
                        }
                        case RGBA: {
                            this.pixels.add(new PixelRgba(this._io, this, _root));
                            break;
                        }
                        }
                    }
                }
            }
        }
        public static class PixelGray extends KaitaiStruct {
            public static PixelGray fromFile(String fileName) throws IOException {
                return new PixelGray(new ByteBufferKaitaiStream(fileName));
            }

            public PixelGray(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PixelGray(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public PixelGray(KaitaiStream _io, KaitaiStruct _parent, GimpBrush _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.gray = this._io.readU1();
            }
            private Byte red;
            public Byte red() {
                if (this.red != null)
                    return this.red;
                byte _tmp = (byte) (0);
                this.red = _tmp;
                return this.red;
            }
            private Byte green;
            public Byte green() {
                if (this.green != null)
                    return this.green;
                byte _tmp = (byte) (0);
                this.green = _tmp;
                return this.green;
            }
            private Byte blue;
            public Byte blue() {
                if (this.blue != null)
                    return this.blue;
                byte _tmp = (byte) (0);
                this.blue = _tmp;
                return this.blue;
            }
            private Integer alpha;
            public Integer alpha() {
                if (this.alpha != null)
                    return this.alpha;
                int _tmp = (int) (gray());
                this.alpha = _tmp;
                return this.alpha;
            }
            private int gray;
            private GimpBrush _root;
            private KaitaiStruct _parent;
            public int gray() { return gray; }
            public GimpBrush _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        public static class PixelRgba extends KaitaiStruct {
            public static PixelRgba fromFile(String fileName) throws IOException {
                return new PixelRgba(new ByteBufferKaitaiStream(fileName));
            }

            public PixelRgba(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PixelRgba(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public PixelRgba(KaitaiStream _io, KaitaiStruct _parent, GimpBrush _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.red = this._io.readU1();
                this.green = this._io.readU1();
                this.blue = this._io.readU1();
                this.alpha = this._io.readU1();
            }
            private int red;
            private int green;
            private int blue;
            private int alpha;
            private GimpBrush _root;
            private KaitaiStruct _parent;
            public int red() { return red; }
            public int green() { return green; }
            public int blue() { return blue; }
            public int alpha() { return alpha; }
            public GimpBrush _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        private ArrayList<KaitaiStruct> pixels;
        private GimpBrush _root;
        private KaitaiStruct _parent;
        public ArrayList<KaitaiStruct> pixels() { return pixels; }
        public GimpBrush _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Integer lenBody;
    public Integer lenBody() {
        if (this.lenBody != null)
            return this.lenBody;
        int _tmp = (int) (((header().width() * header().height()) * header().bytesPerPixel().id()));
        this.lenBody = _tmp;
        return this.lenBody;
    }
    private byte[] body;
    public byte[] body() {
        if (this.body != null)
            return this.body;
        long _pos = this._io.pos();
        this._io.seek(lenHeader());
        this.body = this._io.readBytes(lenBody());
        this._io.seek(_pos);
        return this.body;
    }
    private long lenHeader;
    private Header header;
    private GimpBrush _root;
    private KaitaiStruct _parent;
    private byte[] _raw_header;
    public long lenHeader() { return lenHeader; }
    public Header header() { return header; }
    public GimpBrush _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_header() { return _raw_header; }
}
