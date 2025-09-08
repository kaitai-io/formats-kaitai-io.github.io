// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Allegro library for C (mostly used for game and multimedia apps
 * programming) used its own container file format.
 * 
 * In general, it allows storage of arbitrary binary data blocks
 * bundled together with some simple key-value style metadata
 * ("properties") for every block. Allegro also pre-defines some simple
 * formats for bitmaps, fonts, MIDI music, sound samples and
 * palettes. Allegro library v4.0+ also support LZSS compression.
 * 
 * This spec applies to Allegro data files for library versions 2.2 up
 * to 4.4.
 * @see <a href="https://liballeg.org/stabledocs/en/datafile.html">Source</a>
 */
public class AllegroDat extends KaitaiStruct.ReadWrite {
    public static AllegroDat fromFile(String fileName) throws IOException {
        return new AllegroDat(new ByteBufferKaitaiStream(fileName));
    }

    public enum PackEnum {
        UNPACKED(1936484398);

        private final long id;
        PackEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PackEnum> byId = new HashMap<Long, PackEnum>(1);
        static {
            for (PackEnum e : PackEnum.values())
                byId.put(e.id(), e);
        }
        public static PackEnum byId(long id) { return byId.get(id); }
    }
    public AllegroDat() {
        this(null, null, null);
    }

    public AllegroDat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AllegroDat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AllegroDat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AllegroDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.packMagic = PackEnum.byId(this._io.readU4be());
        this.datMagic = this._io.readBytes(4);
        if (!(Arrays.equals(this.datMagic, new byte[] { 65, 76, 76, 46 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 76, 76, 46 }, this.datMagic, this._io, "/seq/1");
        }
        this.numObjects = this._io.readU4be();
        this.objects = new ArrayList<DatObject>();
        for (int i = 0; i < numObjects(); i++) {
            DatObject _t_objects = new DatObject(this._io, this, _root);
            try {
                _t_objects._read();
            } finally {
                this.objects.add(_t_objects);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.objects.size(); i++) {
            this.objects.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4be(((Number) (this.packMagic.id())).longValue());
        this._io.writeBytes(this.datMagic);
        this._io.writeU4be(this.numObjects);
        for (int i = 0; i < this.objects.size(); i++) {
            this.objects.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.datMagic.length != 4)
            throw new ConsistencyError("dat_magic", 4, this.datMagic.length);
        if (!(Arrays.equals(this.datMagic, new byte[] { 65, 76, 76, 46 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 65, 76, 76, 46 }, this.datMagic, null, "/seq/1");
        }
        if (this.objects.size() != numObjects())
            throw new ConsistencyError("objects", numObjects(), this.objects.size());
        for (int i = 0; i < this.objects.size(); i++) {
            if (!Objects.equals(this.objects.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("objects", _root(), this.objects.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.objects.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("objects", this, this.objects.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class DatBitmap extends KaitaiStruct.ReadWrite {
        public static DatBitmap fromFile(String fileName) throws IOException {
            return new DatBitmap(new ByteBufferKaitaiStream(fileName));
        }
        public DatBitmap() {
            this(null, null, null);
        }

        public DatBitmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatBitmap(KaitaiStream _io, AllegroDat.DatObject _parent) {
            this(_io, _parent, null);
        }

        public DatBitmap(KaitaiStream _io, AllegroDat.DatObject _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.bitsPerPixel = this._io.readS2be();
            this.width = this._io.readU2be();
            this.height = this._io.readU2be();
            this.image = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2be(this.bitsPerPixel);
            this._io.writeU2be(this.width);
            this._io.writeU2be(this.height);
            this._io.writeBytes(this.image);
            if (!(this._io.isEof()))
                throw new ConsistencyError("image", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private short bitsPerPixel;
        private int width;
        private int height;
        private byte[] image;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public short bitsPerPixel() { return bitsPerPixel; }
        public void setBitsPerPixel(short _v) { _dirty = true; bitsPerPixel = _v; }
        public int width() { return width; }
        public void setWidth(int _v) { _dirty = true; width = _v; }
        public int height() { return height; }
        public void setHeight(int _v) { _dirty = true; height = _v; }
        public byte[] image() { return image; }
        public void setImage(byte[] _v) { _dirty = true; image = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatObject _parent() { return _parent; }
        public void set_parent(AllegroDat.DatObject _v) { _dirty = true; _parent = _v; }
    }
    public static class DatFont extends KaitaiStruct.ReadWrite {
        public static DatFont fromFile(String fileName) throws IOException {
            return new DatFont(new ByteBufferKaitaiStream(fileName));
        }
        public DatFont() {
            this(null, null, null);
        }

        public DatFont(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatFont(KaitaiStream _io, AllegroDat.DatObject _parent) {
            this(_io, _parent, null);
        }

        public DatFont(KaitaiStream _io, AllegroDat.DatObject _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.fontSize = this._io.readS2be();
            switch (fontSize()) {
            case 0: {
                this.body = new DatFont39(this._io, this, _root);
                ((DatFont39) (this.body))._read();
                break;
            }
            case 16: {
                this.body = new DatFont16(this._io, this, _root);
                ((DatFont16) (this.body))._read();
                break;
            }
            case 8: {
                this.body = new DatFont8(this._io, this, _root);
                ((DatFont8) (this.body))._read();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (fontSize()) {
            case 0: {
                ((DatFont39) (this.body))._fetchInstances();
                break;
            }
            case 16: {
                ((DatFont16) (this.body))._fetchInstances();
                break;
            }
            case 8: {
                ((DatFont8) (this.body))._fetchInstances();
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2be(this.fontSize);
            switch (fontSize()) {
            case 0: {
                ((DatFont39) (this.body))._write_Seq(this._io);
                break;
            }
            case 16: {
                ((DatFont16) (this.body))._write_Seq(this._io);
                break;
            }
            case 8: {
                ((DatFont8) (this.body))._write_Seq(this._io);
                break;
            }
            }
        }

        public void _check() {
            switch (fontSize()) {
            case 0: {
                if (!Objects.equals(((AllegroDat.DatFont39) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((AllegroDat.DatFont39) (this.body))._root());
                if (!Objects.equals(((AllegroDat.DatFont39) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((AllegroDat.DatFont39) (this.body))._parent());
                break;
            }
            case 16: {
                if (!Objects.equals(((AllegroDat.DatFont16) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((AllegroDat.DatFont16) (this.body))._root());
                if (!Objects.equals(((AllegroDat.DatFont16) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((AllegroDat.DatFont16) (this.body))._parent());
                break;
            }
            case 8: {
                if (!Objects.equals(((AllegroDat.DatFont8) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((AllegroDat.DatFont8) (this.body))._root());
                if (!Objects.equals(((AllegroDat.DatFont8) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((AllegroDat.DatFont8) (this.body))._parent());
                break;
            }
            }
            _dirty = false;
        }
        private short fontSize;
        private KaitaiStruct.ReadWrite body;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public short fontSize() { return fontSize; }
        public void setFontSize(short _v) { _dirty = true; fontSize = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatObject _parent() { return _parent; }
        public void set_parent(AllegroDat.DatObject _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Simple monochrome monospaced font, 95 characters, 8x16 px
     * characters.
     */
    public static class DatFont16 extends KaitaiStruct.ReadWrite {
        public static DatFont16 fromFile(String fileName) throws IOException {
            return new DatFont16(new ByteBufferKaitaiStream(fileName));
        }
        public DatFont16() {
            this(null, null, null);
        }

        public DatFont16(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatFont16(KaitaiStream _io, AllegroDat.DatFont _parent) {
            this(_io, _parent, null);
        }

        public DatFont16(KaitaiStream _io, AllegroDat.DatFont _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chars = new ArrayList<byte[]>();
            for (int i = 0; i < 95; i++) {
                this.chars.add(this._io.readBytes(16));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.chars.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.chars.size(); i++) {
                this._io.writeBytes(this.chars.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.chars.size() != 95)
                throw new ConsistencyError("chars", 95, this.chars.size());
            for (int i = 0; i < this.chars.size(); i++) {
                if (this.chars.get(((Number) (i)).intValue()).length != 16)
                    throw new ConsistencyError("chars", 16, this.chars.get(((Number) (i)).intValue()).length);
            }
            _dirty = false;
        }
        private List<byte[]> chars;
        private AllegroDat _root;
        private AllegroDat.DatFont _parent;
        public List<byte[]> chars() { return chars; }
        public void setChars(List<byte[]> _v) { _dirty = true; chars = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatFont _parent() { return _parent; }
        public void set_parent(AllegroDat.DatFont _v) { _dirty = true; _parent = _v; }
    }

    /**
     * New bitmap font format introduced since Allegro 3.9: allows
     * flexible designation of character ranges, 8-bit colored
     * characters, etc.
     */
    public static class DatFont39 extends KaitaiStruct.ReadWrite {
        public static DatFont39 fromFile(String fileName) throws IOException {
            return new DatFont39(new ByteBufferKaitaiStream(fileName));
        }
        public DatFont39() {
            this(null, null, null);
        }

        public DatFont39(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatFont39(KaitaiStream _io, AllegroDat.DatFont _parent) {
            this(_io, _parent, null);
        }

        public DatFont39(KaitaiStream _io, AllegroDat.DatFont _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numRanges = this._io.readS2be();
            this.ranges = new ArrayList<Range>();
            for (int i = 0; i < numRanges(); i++) {
                Range _t_ranges = new Range(this._io, this, _root);
                try {
                    _t_ranges._read();
                } finally {
                    this.ranges.add(_t_ranges);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.ranges.size(); i++) {
                this.ranges.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2be(this.numRanges);
            for (int i = 0; i < this.ranges.size(); i++) {
                this.ranges.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.ranges.size() != numRanges())
                throw new ConsistencyError("ranges", numRanges(), this.ranges.size());
            for (int i = 0; i < this.ranges.size(); i++) {
                if (!Objects.equals(this.ranges.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("ranges", _root(), this.ranges.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.ranges.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("ranges", this, this.ranges.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class FontChar extends KaitaiStruct.ReadWrite {
            public static FontChar fromFile(String fileName) throws IOException {
                return new FontChar(new ByteBufferKaitaiStream(fileName));
            }
            public FontChar() {
                this(null, null, null);
            }

            public FontChar(KaitaiStream _io) {
                this(_io, null, null);
            }

            public FontChar(KaitaiStream _io, AllegroDat.DatFont39.Range _parent) {
                this(_io, _parent, null);
            }

            public FontChar(KaitaiStream _io, AllegroDat.DatFont39.Range _parent, AllegroDat _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.width = this._io.readU2be();
                this.height = this._io.readU2be();
                this.body = this._io.readBytes(width() * height());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.width);
                this._io.writeU2be(this.height);
                this._io.writeBytes(this.body);
            }

            public void _check() {
                if (this.body.length != width() * height())
                    throw new ConsistencyError("body", width() * height(), this.body.length);
                _dirty = false;
            }
            private int width;
            private int height;
            private byte[] body;
            private AllegroDat _root;
            private AllegroDat.DatFont39.Range _parent;
            public int width() { return width; }
            public void setWidth(int _v) { _dirty = true; width = _v; }
            public int height() { return height; }
            public void setHeight(int _v) { _dirty = true; height = _v; }
            public byte[] body() { return body; }
            public void setBody(byte[] _v) { _dirty = true; body = _v; }
            public AllegroDat _root() { return _root; }
            public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
            public AllegroDat.DatFont39.Range _parent() { return _parent; }
            public void set_parent(AllegroDat.DatFont39.Range _v) { _dirty = true; _parent = _v; }
        }
        public static class Range extends KaitaiStruct.ReadWrite {
            public static Range fromFile(String fileName) throws IOException {
                return new Range(new ByteBufferKaitaiStream(fileName));
            }
            public Range() {
                this(null, null, null);
            }

            public Range(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Range(KaitaiStream _io, AllegroDat.DatFont39 _parent) {
                this(_io, _parent, null);
            }

            public Range(KaitaiStream _io, AllegroDat.DatFont39 _parent, AllegroDat _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.mono = this._io.readU1();
                this.startChar = this._io.readU4be();
                this.endChar = this._io.readU4be();
                this.chars = new ArrayList<FontChar>();
                for (int i = 0; i < (endChar() - startChar()) + 1; i++) {
                    FontChar _t_chars = new FontChar(this._io, this, _root);
                    try {
                        _t_chars._read();
                    } finally {
                        this.chars.add(_t_chars);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.chars.size(); i++) {
                    this.chars.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.mono);
                this._io.writeU4be(this.startChar);
                this._io.writeU4be(this.endChar);
                for (int i = 0; i < this.chars.size(); i++) {
                    this.chars.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.chars.size() != (endChar() - startChar()) + 1)
                    throw new ConsistencyError("chars", (endChar() - startChar()) + 1, this.chars.size());
                for (int i = 0; i < this.chars.size(); i++) {
                    if (!Objects.equals(this.chars.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("chars", _root(), this.chars.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.chars.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("chars", this, this.chars.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private int mono;
            private long startChar;
            private long endChar;
            private List<FontChar> chars;
            private AllegroDat _root;
            private AllegroDat.DatFont39 _parent;
            public int mono() { return mono; }
            public void setMono(int _v) { _dirty = true; mono = _v; }

            /**
             * First character in range
             */
            public long startChar() { return startChar; }
            public void setStartChar(long _v) { _dirty = true; startChar = _v; }

            /**
             * Last character in range (inclusive)
             */
            public long endChar() { return endChar; }
            public void setEndChar(long _v) { _dirty = true; endChar = _v; }
            public List<FontChar> chars() { return chars; }
            public void setChars(List<FontChar> _v) { _dirty = true; chars = _v; }
            public AllegroDat _root() { return _root; }
            public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
            public AllegroDat.DatFont39 _parent() { return _parent; }
            public void set_parent(AllegroDat.DatFont39 _v) { _dirty = true; _parent = _v; }
        }
        private short numRanges;
        private List<Range> ranges;
        private AllegroDat _root;
        private AllegroDat.DatFont _parent;
        public short numRanges() { return numRanges; }
        public void setNumRanges(short _v) { _dirty = true; numRanges = _v; }
        public List<Range> ranges() { return ranges; }
        public void setRanges(List<Range> _v) { _dirty = true; ranges = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatFont _parent() { return _parent; }
        public void set_parent(AllegroDat.DatFont _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Simple monochrome monospaced font, 95 characters, 8x8 px
     * characters.
     */
    public static class DatFont8 extends KaitaiStruct.ReadWrite {
        public static DatFont8 fromFile(String fileName) throws IOException {
            return new DatFont8(new ByteBufferKaitaiStream(fileName));
        }
        public DatFont8() {
            this(null, null, null);
        }

        public DatFont8(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatFont8(KaitaiStream _io, AllegroDat.DatFont _parent) {
            this(_io, _parent, null);
        }

        public DatFont8(KaitaiStream _io, AllegroDat.DatFont _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chars = new ArrayList<byte[]>();
            for (int i = 0; i < 95; i++) {
                this.chars.add(this._io.readBytes(8));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.chars.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.chars.size(); i++) {
                this._io.writeBytes(this.chars.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.chars.size() != 95)
                throw new ConsistencyError("chars", 95, this.chars.size());
            for (int i = 0; i < this.chars.size(); i++) {
                if (this.chars.get(((Number) (i)).intValue()).length != 8)
                    throw new ConsistencyError("chars", 8, this.chars.get(((Number) (i)).intValue()).length);
            }
            _dirty = false;
        }
        private List<byte[]> chars;
        private AllegroDat _root;
        private AllegroDat.DatFont _parent;
        public List<byte[]> chars() { return chars; }
        public void setChars(List<byte[]> _v) { _dirty = true; chars = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatFont _parent() { return _parent; }
        public void set_parent(AllegroDat.DatFont _v) { _dirty = true; _parent = _v; }
    }
    public static class DatObject extends KaitaiStruct.ReadWrite {
        public static DatObject fromFile(String fileName) throws IOException {
            return new DatObject(new ByteBufferKaitaiStream(fileName));
        }
        public DatObject() {
            this(null, null, null);
        }

        public DatObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatObject(KaitaiStream _io, AllegroDat _parent) {
            this(_io, _parent, null);
        }

        public DatObject(KaitaiStream _io, AllegroDat _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.properties = new ArrayList<Property>();
            {
                Property _it;
                int i = 0;
                do {
                    Property _t_properties = new Property(this._io, this, _root);
                    try {
                        _t_properties._read();
                    } finally {
                        _it = _t_properties;
                        this.properties.add(_it);
                    }
                    i++;
                } while (!(!(_it.isValid())));
            }
            this.lenCompressed = this._io.readS4be();
            this.lenUncompressed = this._io.readS4be();
            switch (type()) {
            case "BMP ": {
                this._raw_body = this._io.readBytes(lenCompressed());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new DatBitmap(_io__raw_body, this, _root);
                ((DatBitmap) (this.body))._read();
                break;
            }
            case "FONT": {
                this._raw_body = this._io.readBytes(lenCompressed());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new DatFont(_io__raw_body, this, _root);
                ((DatFont) (this.body))._read();
                break;
            }
            case "RLE ": {
                this._raw_body = this._io.readBytes(lenCompressed());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new DatRleSprite(_io__raw_body, this, _root);
                ((DatRleSprite) (this.body))._read();
                break;
            }
            default: {
                this.body = this._io.readBytes(lenCompressed());
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.properties.size(); i++) {
                this.properties.get(((Number) (i)).intValue())._fetchInstances();
            }
            switch (type()) {
            case "BMP ": {
                ((DatBitmap) (this.body))._fetchInstances();
                break;
            }
            case "FONT": {
                ((DatFont) (this.body))._fetchInstances();
                break;
            }
            case "RLE ": {
                ((DatRleSprite) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.properties.size(); i++) {
                this.properties.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeS4be(this.lenCompressed);
            this._io.writeS4be(this.lenUncompressed);
            switch (type()) {
            case "BMP ": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenCompressed());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenCompressed()));
                    final DatObject _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != lenCompressed())
                                throw new ConsistencyError("raw(body)", lenCompressed(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((DatBitmap) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "FONT": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenCompressed());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenCompressed()));
                    final DatObject _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != lenCompressed())
                                throw new ConsistencyError("raw(body)", lenCompressed(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((DatFont) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case "RLE ": {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenCompressed());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenCompressed()));
                    final DatObject _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != lenCompressed())
                                throw new ConsistencyError("raw(body)", lenCompressed(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((DatRleSprite) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                break;
            }
            }
        }

        public void _check() {
            if (this.properties.size() == 0)
                throw new ConsistencyError("properties", 0, this.properties.size());
            for (int i = 0; i < this.properties.size(); i++) {
                if (!Objects.equals(this.properties.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("properties", _root(), this.properties.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.properties.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("properties", this, this.properties.get(((Number) (i)).intValue())._parent());
                {
                    Property _it = this.properties.get(((Number) (i)).intValue());
                    if (!(_it.isValid()) != (i == this.properties.size() - 1))
                        throw new ConsistencyError("properties", i == this.properties.size() - 1, !(_it.isValid()));
                }
            }
            switch (type()) {
            case "BMP ": {
                if (!Objects.equals(((AllegroDat.DatBitmap) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((AllegroDat.DatBitmap) (this.body))._root());
                if (!Objects.equals(((AllegroDat.DatBitmap) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((AllegroDat.DatBitmap) (this.body))._parent());
                break;
            }
            case "FONT": {
                if (!Objects.equals(((AllegroDat.DatFont) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((AllegroDat.DatFont) (this.body))._root());
                if (!Objects.equals(((AllegroDat.DatFont) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((AllegroDat.DatFont) (this.body))._parent());
                break;
            }
            case "RLE ": {
                if (!Objects.equals(((AllegroDat.DatRleSprite) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((AllegroDat.DatRleSprite) (this.body))._root());
                if (!Objects.equals(((AllegroDat.DatRleSprite) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((AllegroDat.DatRleSprite) (this.body))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.body)).length != lenCompressed())
                    throw new ConsistencyError("body", lenCompressed(), ((byte[]) (this.body)).length);
                break;
            }
            }
            _dirty = false;
        }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = properties().get(properties().size() - 1).magic();
            return this.type;
        }
        public void _invalidateType() { this.type = null; }
        private List<Property> properties;
        private int lenCompressed;
        private int lenUncompressed;
        private Object body;
        private AllegroDat _root;
        private AllegroDat _parent;
        private byte[] _raw_body;
        public List<Property> properties() { return properties; }
        public void setProperties(List<Property> _v) { _dirty = true; properties = _v; }
        public int lenCompressed() { return lenCompressed; }
        public void setLenCompressed(int _v) { _dirty = true; lenCompressed = _v; }
        public int lenUncompressed() { return lenUncompressed; }
        public void setLenUncompressed(int _v) { _dirty = true; lenUncompressed = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat _parent() { return _parent; }
        public void set_parent(AllegroDat _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class DatRleSprite extends KaitaiStruct.ReadWrite {
        public static DatRleSprite fromFile(String fileName) throws IOException {
            return new DatRleSprite(new ByteBufferKaitaiStream(fileName));
        }
        public DatRleSprite() {
            this(null, null, null);
        }

        public DatRleSprite(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DatRleSprite(KaitaiStream _io, AllegroDat.DatObject _parent) {
            this(_io, _parent, null);
        }

        public DatRleSprite(KaitaiStream _io, AllegroDat.DatObject _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.bitsPerPixel = this._io.readS2be();
            this.width = this._io.readU2be();
            this.height = this._io.readU2be();
            this.lenImage = this._io.readU4be();
            this.image = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS2be(this.bitsPerPixel);
            this._io.writeU2be(this.width);
            this._io.writeU2be(this.height);
            this._io.writeU4be(this.lenImage);
            this._io.writeBytes(this.image);
            if (!(this._io.isEof()))
                throw new ConsistencyError("image", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private short bitsPerPixel;
        private int width;
        private int height;
        private long lenImage;
        private byte[] image;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public short bitsPerPixel() { return bitsPerPixel; }
        public void setBitsPerPixel(short _v) { _dirty = true; bitsPerPixel = _v; }
        public int width() { return width; }
        public void setWidth(int _v) { _dirty = true; width = _v; }
        public int height() { return height; }
        public void setHeight(int _v) { _dirty = true; height = _v; }
        public long lenImage() { return lenImage; }
        public void setLenImage(long _v) { _dirty = true; lenImage = _v; }
        public byte[] image() { return image; }
        public void setImage(byte[] _v) { _dirty = true; image = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatObject _parent() { return _parent; }
        public void set_parent(AllegroDat.DatObject _v) { _dirty = true; _parent = _v; }
    }
    public static class Property extends KaitaiStruct.ReadWrite {
        public static Property fromFile(String fileName) throws IOException {
            return new Property(new ByteBufferKaitaiStream(fileName));
        }
        public Property() {
            this(null, null, null);
        }

        public Property(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Property(KaitaiStream _io, AllegroDat.DatObject _parent) {
            this(_io, _parent, null);
        }

        public Property(KaitaiStream _io, AllegroDat.DatObject _parent, AllegroDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            if (isValid()) {
                this.type = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            }
            if (isValid()) {
                this.lenBody = this._io.readU4be();
            }
            if (isValid()) {
                this.body = new String(this._io.readBytes(lenBody()), StandardCharsets.UTF_8);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (isValid()) {
            }
            if (isValid()) {
            }
            if (isValid()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.magic).getBytes(Charset.forName("UTF-8")));
            if (isValid()) {
                this._io.writeBytes((this.type).getBytes(Charset.forName("UTF-8")));
            }
            if (isValid()) {
                this._io.writeU4be(this.lenBody);
            }
            if (isValid()) {
                this._io.writeBytes((this.body).getBytes(Charset.forName("UTF-8")));
            }
        }

        public void _check() {
            if ((this.magic).getBytes(Charset.forName("UTF-8")).length != 4)
                throw new ConsistencyError("magic", 4, (this.magic).getBytes(Charset.forName("UTF-8")).length);
            if (isValid()) {
                if ((this.type).getBytes(Charset.forName("UTF-8")).length != 4)
                    throw new ConsistencyError("type", 4, (this.type).getBytes(Charset.forName("UTF-8")).length);
            }
            if (isValid()) {
            }
            if (isValid()) {
                if ((this.body).getBytes(Charset.forName("UTF-8")).length != lenBody())
                    throw new ConsistencyError("body", lenBody(), (this.body).getBytes(Charset.forName("UTF-8")).length);
            }
            _dirty = false;
        }
        private Boolean isValid;
        public Boolean isValid() {
            if (this.isValid != null)
                return this.isValid;
            this.isValid = magic().equals("prop");
            return this.isValid;
        }
        public void _invalidateIsValid() { this.isValid = null; }
        private String magic;
        private String type;
        private Long lenBody;
        private String body;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public String magic() { return magic; }
        public void setMagic(String _v) { _dirty = true; magic = _v; }
        public String type() { return type; }
        public void setType(String _v) { _dirty = true; type = _v; }
        public Long lenBody() { return lenBody; }
        public void setLenBody(Long _v) { _dirty = true; lenBody = _v; }
        public String body() { return body; }
        public void setBody(String _v) { _dirty = true; body = _v; }
        public AllegroDat _root() { return _root; }
        public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
        public AllegroDat.DatObject _parent() { return _parent; }
        public void set_parent(AllegroDat.DatObject _v) { _dirty = true; _parent = _v; }
    }
    private PackEnum packMagic;
    private byte[] datMagic;
    private long numObjects;
    private List<DatObject> objects;
    private AllegroDat _root;
    private KaitaiStruct.ReadWrite _parent;
    public PackEnum packMagic() { return packMagic; }
    public void setPackMagic(PackEnum _v) { _dirty = true; packMagic = _v; }
    public byte[] datMagic() { return datMagic; }
    public void setDatMagic(byte[] _v) { _dirty = true; datMagic = _v; }
    public long numObjects() { return numObjects; }
    public void setNumObjects(long _v) { _dirty = true; numObjects = _v; }
    public List<DatObject> objects() { return objects; }
    public void setObjects(List<DatObject> _v) { _dirty = true; objects = _v; }
    public AllegroDat _root() { return _root; }
    public void set_root(AllegroDat _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
