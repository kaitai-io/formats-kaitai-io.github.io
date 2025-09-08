// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


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
 * @see <a href="https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt">Source</a>
 */
public class GimpBrush extends KaitaiStruct.ReadWrite {
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
    public GimpBrush() {
        this(null, null, null);
    }

    public GimpBrush(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GimpBrush(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GimpBrush(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GimpBrush _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.lenHeader = this._io.readU4be();
        this._raw_header = this._io.readBytes(lenHeader() - 4);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        this.header._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        body();
        if (this.body != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteBody = _enabledBody;
        this._io.writeU4be(this.lenHeader);
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(lenHeader() - 4);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenHeader() - 4));
            final GimpBrush _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != lenHeader() - 4)
                        throw new ConsistencyError("raw(header)", lenHeader() - 4, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (_enabledBody) {
            if (this.body.length != lenBody())
                throw new ConsistencyError("body", lenBody(), this.body.length);
        }
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

        public Bitmap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Bitmap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GimpBrush _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.rows = new ArrayList<Row>();
            for (int i = 0; i < _root().header().height(); i++) {
                Row _t_rows = new Row(this._io, this, _root);
                try {
                    _t_rows._read();
                } finally {
                    this.rows.add(_t_rows);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.rows.size(); i++) {
                this.rows.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.rows.size(); i++) {
                this.rows.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.rows.size() != _root().header().height())
                throw new ConsistencyError("rows", _root().header().height(), this.rows.size());
            for (int i = 0; i < this.rows.size(); i++) {
                if (!Objects.equals(this.rows.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("rows", _root(), this.rows.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.rows.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("rows", this, this.rows.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Row> rows;
        private GimpBrush _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<Row> rows() { return rows; }
        public void setRows(List<Row> _v) { _dirty = true; rows = _v; }
        public GimpBrush _root() { return _root; }
        public void set_root(GimpBrush _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
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

        public Header(KaitaiStream _io, GimpBrush _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, GimpBrush _parent, GimpBrush _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU4be();
            if (!(this.version == 2)) {
                throw new KaitaiStream.ValidationNotEqualError(2, this.version, this._io, "/types/header/seq/0");
            }
            this.width = this._io.readU4be();
            if (!(this.width >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.width, this._io, "/types/header/seq/1");
            }
            if (!(this.width <= 10000)) {
                throw new KaitaiStream.ValidationGreaterThanError(10000, this.width, this._io, "/types/header/seq/1");
            }
            this.height = this._io.readU4be();
            if (!(this.height >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.height, this._io, "/types/header/seq/2");
            }
            if (!(this.height <= 10000)) {
                throw new KaitaiStream.ValidationGreaterThanError(10000, this.height, this._io, "/types/header/seq/2");
            }
            this.bytesPerPixel = GimpBrush.ColorDepth.byId(this._io.readU4be());
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 71, 73, 77, 80 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 73, 77, 80 }, this.magic, this._io, "/types/header/seq/4");
            }
            this.spacing = this._io.readU4be();
            this.brushName = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.version);
            this._io.writeU4be(this.width);
            this._io.writeU4be(this.height);
            this._io.writeU4be(((Number) (this.bytesPerPixel.id())).longValue());
            this._io.writeBytes(this.magic);
            this._io.writeU4be(this.spacing);
            this._io.writeBytesLimit((this.brushName).getBytes(Charset.forName("UTF-8")), this._io.size() - this._io.pos(), (byte) 0, (byte) 0);
            if (!(this._io.isEof()))
                throw new ConsistencyError("brush_name", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!(this.version == 2)) {
                throw new KaitaiStream.ValidationNotEqualError(2, this.version, null, "/types/header/seq/0");
            }
            if (!(this.width >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.width, null, "/types/header/seq/1");
            }
            if (!(this.width <= 10000)) {
                throw new KaitaiStream.ValidationGreaterThanError(10000, this.width, null, "/types/header/seq/1");
            }
            if (!(this.height >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.height, null, "/types/header/seq/2");
            }
            if (!(this.height <= 10000)) {
                throw new KaitaiStream.ValidationGreaterThanError(10000, this.height, null, "/types/header/seq/2");
            }
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 71, 73, 77, 80 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 73, 77, 80 }, this.magic, null, "/types/header/seq/4");
            }
            _dirty = false;
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
        public void setVersion(long _v) { _dirty = true; version = _v; }

        /**
         * @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L170">Source</a>
         * @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24">Source</a>
         */
        public long width() { return width; }
        public void setWidth(long _v) { _dirty = true; width = _v; }

        /**
         * @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L177">Source</a>
         * @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24">Source</a>
         */
        public long height() { return height; }
        public void setHeight(long _v) { _dirty = true; height = _v; }
        public ColorDepth bytesPerPixel() { return bytesPerPixel; }
        public void setBytesPerPixel(ColorDepth _v) { _dirty = true; bytesPerPixel = _v; }
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Default spacing to be used for brush. Percentage of brush width.
         */
        public long spacing() { return spacing; }
        public void setSpacing(long _v) { _dirty = true; spacing = _v; }
        public String brushName() { return brushName; }
        public void setBrushName(String _v) { _dirty = true; brushName = _v; }
        public GimpBrush _root() { return _root; }
        public void set_root(GimpBrush _v) { _dirty = true; _root = _v; }
        public GimpBrush _parent() { return _parent; }
        public void set_parent(GimpBrush _v) { _dirty = true; _parent = _v; }
    }
    public static class Row extends KaitaiStruct.ReadWrite {
        public static Row fromFile(String fileName) throws IOException {
            return new Row(new ByteBufferKaitaiStream(fileName));
        }
        public Row() {
            this(null, null, null);
        }

        public Row(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Row(KaitaiStream _io, GimpBrush.Bitmap _parent) {
            this(_io, _parent, null);
        }

        public Row(KaitaiStream _io, GimpBrush.Bitmap _parent, GimpBrush _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.pixels = new ArrayList<KaitaiStruct.ReadWrite>();
            for (int i = 0; i < _root().header().width(); i++) {
                {
                    ColorDepth on = _root().header().bytesPerPixel();
                    if (on != null) {
                        switch (_root().header().bytesPerPixel()) {
                        case GRAYSCALE: {
                            PixelGray _t_pixels = new PixelGray(this._io, this, _root);
                            try {
                                ((PixelGray) (_t_pixels))._read();
                            } finally {
                                this.pixels.add(_t_pixels);
                            }
                            break;
                        }
                        case RGBA: {
                            PixelRgba _t_pixels = new PixelRgba(this._io, this, _root);
                            try {
                                ((PixelRgba) (_t_pixels))._read();
                            } finally {
                                this.pixels.add(_t_pixels);
                            }
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.pixels.size(); i++) {
                {
                    ColorDepth on = _root().header().bytesPerPixel();
                    if (on != null) {
                        switch (_root().header().bytesPerPixel()) {
                        case GRAYSCALE: {
                            ((PixelGray) (this.pixels.get(((Number) (i)).intValue())))._fetchInstances();
                            break;
                        }
                        case RGBA: {
                            ((PixelRgba) (this.pixels.get(((Number) (i)).intValue())))._fetchInstances();
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.pixels.size(); i++) {
                {
                    ColorDepth on = _root().header().bytesPerPixel();
                    if (on != null) {
                        switch (_root().header().bytesPerPixel()) {
                        case GRAYSCALE: {
                            ((PixelGray) (this.pixels.get(((Number) (i)).intValue())))._write_Seq(this._io);
                            break;
                        }
                        case RGBA: {
                            ((PixelRgba) (this.pixels.get(((Number) (i)).intValue())))._write_Seq(this._io);
                            break;
                        }
                        }
                    }
                }
            }
        }

        public void _check() {
            if (this.pixels.size() != _root().header().width())
                throw new ConsistencyError("pixels", _root().header().width(), this.pixels.size());
            for (int i = 0; i < this.pixels.size(); i++) {
                {
                    ColorDepth on = _root().header().bytesPerPixel();
                    if (on != null) {
                        switch (_root().header().bytesPerPixel()) {
                        case GRAYSCALE: {
                            if (!Objects.equals(((GimpBrush.Row.PixelGray) (this.pixels.get(((Number) (i)).intValue())))._root(), _root()))
                                throw new ConsistencyError("pixels", _root(), ((GimpBrush.Row.PixelGray) (this.pixels.get(((Number) (i)).intValue())))._root());
                            if (!Objects.equals(((GimpBrush.Row.PixelGray) (this.pixels.get(((Number) (i)).intValue())))._parent(), this))
                                throw new ConsistencyError("pixels", this, ((GimpBrush.Row.PixelGray) (this.pixels.get(((Number) (i)).intValue())))._parent());
                            break;
                        }
                        case RGBA: {
                            if (!Objects.equals(((GimpBrush.Row.PixelRgba) (this.pixels.get(((Number) (i)).intValue())))._root(), _root()))
                                throw new ConsistencyError("pixels", _root(), ((GimpBrush.Row.PixelRgba) (this.pixels.get(((Number) (i)).intValue())))._root());
                            if (!Objects.equals(((GimpBrush.Row.PixelRgba) (this.pixels.get(((Number) (i)).intValue())))._parent(), this))
                                throw new ConsistencyError("pixels", this, ((GimpBrush.Row.PixelRgba) (this.pixels.get(((Number) (i)).intValue())))._parent());
                            break;
                        }
                        }
                    }
                }
            }
            _dirty = false;
        }
        public static class PixelGray extends KaitaiStruct.ReadWrite {
            public static PixelGray fromFile(String fileName) throws IOException {
                return new PixelGray(new ByteBufferKaitaiStream(fileName));
            }
            public PixelGray() {
                this(null, null, null);
            }

            public PixelGray(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PixelGray(KaitaiStream _io, GimpBrush.Row _parent) {
                this(_io, _parent, null);
            }

            public PixelGray(KaitaiStream _io, GimpBrush.Row _parent, GimpBrush _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.gray = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.gray);
            }

            public void _check() {
                _dirty = false;
            }
            private Integer alpha;
            public Integer alpha() {
                if (this.alpha != null)
                    return this.alpha;
                this.alpha = ((Number) (gray())).intValue();
                return this.alpha;
            }
            public void _invalidateAlpha() { this.alpha = null; }
            private Byte blue;
            public Byte blue() {
                if (this.blue != null)
                    return this.blue;
                this.blue = ((byte) 0);
                return this.blue;
            }
            public void _invalidateBlue() { this.blue = null; }
            private Byte green;
            public Byte green() {
                if (this.green != null)
                    return this.green;
                this.green = ((byte) 0);
                return this.green;
            }
            public void _invalidateGreen() { this.green = null; }
            private Byte red;
            public Byte red() {
                if (this.red != null)
                    return this.red;
                this.red = ((byte) 0);
                return this.red;
            }
            public void _invalidateRed() { this.red = null; }
            private int gray;
            private GimpBrush _root;
            private GimpBrush.Row _parent;
            public int gray() { return gray; }
            public void setGray(int _v) { _dirty = true; gray = _v; }
            public GimpBrush _root() { return _root; }
            public void set_root(GimpBrush _v) { _dirty = true; _root = _v; }
            public GimpBrush.Row _parent() { return _parent; }
            public void set_parent(GimpBrush.Row _v) { _dirty = true; _parent = _v; }
        }
        public static class PixelRgba extends KaitaiStruct.ReadWrite {
            public static PixelRgba fromFile(String fileName) throws IOException {
                return new PixelRgba(new ByteBufferKaitaiStream(fileName));
            }
            public PixelRgba() {
                this(null, null, null);
            }

            public PixelRgba(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PixelRgba(KaitaiStream _io, GimpBrush.Row _parent) {
                this(_io, _parent, null);
            }

            public PixelRgba(KaitaiStream _io, GimpBrush.Row _parent, GimpBrush _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.red = this._io.readU1();
                this.green = this._io.readU1();
                this.blue = this._io.readU1();
                this.alpha = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.red);
                this._io.writeU1(this.green);
                this._io.writeU1(this.blue);
                this._io.writeU1(this.alpha);
            }

            public void _check() {
                _dirty = false;
            }
            private int red;
            private int green;
            private int blue;
            private int alpha;
            private GimpBrush _root;
            private GimpBrush.Row _parent;
            public int red() { return red; }
            public void setRed(int _v) { _dirty = true; red = _v; }
            public int green() { return green; }
            public void setGreen(int _v) { _dirty = true; green = _v; }
            public int blue() { return blue; }
            public void setBlue(int _v) { _dirty = true; blue = _v; }
            public int alpha() { return alpha; }
            public void setAlpha(int _v) { _dirty = true; alpha = _v; }
            public GimpBrush _root() { return _root; }
            public void set_root(GimpBrush _v) { _dirty = true; _root = _v; }
            public GimpBrush.Row _parent() { return _parent; }
            public void set_parent(GimpBrush.Row _v) { _dirty = true; _parent = _v; }
        }
        private List<KaitaiStruct.ReadWrite> pixels;
        private GimpBrush _root;
        private GimpBrush.Bitmap _parent;
        public List<KaitaiStruct.ReadWrite> pixels() { return pixels; }
        public void setPixels(List<KaitaiStruct.ReadWrite> _v) { _dirty = true; pixels = _v; }
        public GimpBrush _root() { return _root; }
        public void set_root(GimpBrush _v) { _dirty = true; _root = _v; }
        public GimpBrush.Bitmap _parent() { return _parent; }
        public void set_parent(GimpBrush.Bitmap _v) { _dirty = true; _parent = _v; }
    }
    private byte[] body;
    private boolean _shouldWriteBody = false;
    private boolean _enabledBody = true;
    public byte[] body() {
        if (_shouldWriteBody)
            _writeBody();
        if (this.body != null)
            return this.body;
        if (!_enabledBody)
            return null;
        long _pos = this._io.pos();
        this._io.seek(lenHeader());
        this.body = this._io.readBytes(lenBody());
        this._io.seek(_pos);
        return this.body;
    }
    public void setBody(byte[] _v) { _dirty = true; body = _v; }
    public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

    private void _writeBody() {
        _shouldWriteBody = false;
        long _pos = this._io.pos();
        this._io.seek(lenHeader());
        this._io.writeBytes(this.body);
        this._io.seek(_pos);
    }
    private Integer lenBody;
    public Integer lenBody() {
        if (this.lenBody != null)
            return this.lenBody;
        this.lenBody = ((Number) ((header().width() * header().height()) * header().bytesPerPixel().id())).intValue();
        return this.lenBody;
    }
    public void _invalidateLenBody() { this.lenBody = null; }
    private long lenHeader;
    private Header header;
    private GimpBrush _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    public long lenHeader() { return lenHeader; }
    public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public GimpBrush _root() { return _root; }
    public void set_root(GimpBrush _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}
