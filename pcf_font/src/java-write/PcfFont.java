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
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


/**
 * Portable Compiled Format (PCF) font is a bitmap font format
 * originating from X11 Window System. It matches BDF format (which is
 * text-based) closely, but instead being binary and
 * platform-independent (as opposed to previously used SNF binary
 * format) due to introduced features to handle different endianness
 * and bit order.
 * 
 * The overall composition of the format is straightforward: it's more
 * or less classic directory of type-offset-size pointers, pointing to
 * what PCF format calls "tables". Each table carries a certain
 * piece of information related to the font (metadata properties,
 * metrics, bitmaps, mapping of glyphs to characters, etc).
 * @see <a href="https://fontforge.org/docs/techref/pcf-format.html">Source</a>
 */
public class PcfFont extends KaitaiStruct.ReadWrite {
    public static PcfFont fromFile(String fileName) throws IOException {
        return new PcfFont(new ByteBufferKaitaiStream(fileName));
    }

    public enum Types {
        PROPERTIES(1),
        ACCELERATORS(2),
        METRICS(4),
        BITMAPS(8),
        INK_METRICS(16),
        BDF_ENCODINGS(32),
        SWIDTHS(64),
        GLYPH_NAMES(128),
        BDF_ACCELERATORS(256);

        private final long id;
        Types(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Types> byId = new HashMap<Long, Types>(9);
        static {
            for (Types e : Types.values())
                byId.put(e.id(), e);
        }
        public static Types byId(long id) { return byId.get(id); }
    }
    public PcfFont() {
        this(null, null, null);
    }

    public PcfFont(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PcfFont(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PcfFont(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PcfFont _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 1, 102, 99, 112 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 102, 99, 112 }, this.magic, this._io, "/seq/0");
        }
        this.numTables = this._io.readU4le();
        this.tables = new ArrayList<Table>();
        for (int i = 0; i < numTables(); i++) {
            Table _t_tables = new Table(this._io, this, _root);
            try {
                _t_tables._read();
            } finally {
                this.tables.add(_t_tables);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.tables.size(); i++) {
            this.tables.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.numTables);
        for (int i = 0; i < this.tables.size(); i++) {
            this.tables.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 1, 102, 99, 112 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 102, 99, 112 }, this.magic, null, "/seq/0");
        }
        if (this.tables.size() != numTables())
            throw new ConsistencyError("tables", numTables(), this.tables.size());
        for (int i = 0; i < this.tables.size(); i++) {
            if (!Objects.equals(this.tables.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("tables", _root(), this.tables.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.tables.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("tables", this, this.tables.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * Table format specifier, always 4 bytes. Original implementation treats
     * it as always little-endian and makes liberal use of bitmasking to parse
     * various parts of it.
     * 
     * TODO: this format specification recognizes endianness and bit
     * order format bits, but it does not really takes any parsing
     * decisions based on them.
     * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#file-header">Source</a>
     */
    public static class Format extends KaitaiStruct.ReadWrite {
        public static Format fromFile(String fileName) throws IOException {
            return new Format(new ByteBufferKaitaiStream(fileName));
        }
        public Format() {
            this(null, null, null);
        }

        public Format(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Format(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Format(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PcfFont _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.padding1 = this._io.readBitsIntBe(2);
            this.scanUnitMask = this._io.readBitsIntBe(2);
            this.isMostSignificantBitFirst = this._io.readBitsIntBe(1) != 0;
            this.isBigEndian = this._io.readBitsIntBe(1) != 0;
            this.glyphPadMask = this._io.readBitsIntBe(2);
            this.format = this._io.readU1();
            this.padding = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(2, this.padding1);
            this._io.writeBitsIntBe(2, this.scanUnitMask);
            this._io.writeBitsIntBe(1, (this.isMostSignificantBitFirst ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isBigEndian ? 1 : 0));
            this._io.writeBitsIntBe(2, this.glyphPadMask);
            this._io.writeU1(this.format);
            this._io.writeU2le(this.padding);
        }

        public void _check() {
            _dirty = false;
        }
        private long padding1;
        private long scanUnitMask;
        private boolean isMostSignificantBitFirst;
        private boolean isBigEndian;
        private long glyphPadMask;
        private int format;
        private int padding;
        private PcfFont _root;
        private KaitaiStruct.ReadWrite _parent;
        public long padding1() { return padding1; }
        public void setPadding1(long _v) { _dirty = true; padding1 = _v; }
        public long scanUnitMask() { return scanUnitMask; }
        public void setScanUnitMask(long _v) { _dirty = true; scanUnitMask = _v; }
        public boolean isMostSignificantBitFirst() { return isMostSignificantBitFirst; }
        public void setIsMostSignificantBitFirst(boolean _v) { _dirty = true; isMostSignificantBitFirst = _v; }

        /**
         * If set, then all integers in the table are treated as big-endian
         */
        public boolean isBigEndian() { return isBigEndian; }
        public void setIsBigEndian(boolean _v) { _dirty = true; isBigEndian = _v; }
        public long glyphPadMask() { return glyphPadMask; }
        public void setGlyphPadMask(long _v) { _dirty = true; glyphPadMask = _v; }
        public int format() { return format; }
        public void setFormat(int _v) { _dirty = true; format = _v; }
        public int padding() { return padding; }
        public void setPadding(int _v) { _dirty = true; padding = _v; }
        public PcfFont _root() { return _root; }
        public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Table offers a offset + length pointer to a particular
     * table. "Type" of table references certain enum. Applications can
     * ignore enum values which they don't support.
     */
    public static class Table extends KaitaiStruct.ReadWrite {
        public static Table fromFile(String fileName) throws IOException {
            return new Table(new ByteBufferKaitaiStream(fileName));
        }
        public Table() {
            this(null, null, null);
        }

        public Table(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Table(KaitaiStream _io, PcfFont _parent) {
            this(_io, _parent, null);
        }

        public Table(KaitaiStream _io, PcfFont _parent, PcfFont _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.type = PcfFont.Types.byId(this._io.readU4le());
            this.format = new Format(this._io, this, _root);
            this.format._read();
            this.lenBody = this._io.readU4le();
            this.ofsBody = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.format._fetchInstances();
            body();
            if (this.body != null) {
                {
                    Types on = type();
                    if (on != null) {
                        switch (type()) {
                        case BDF_ENCODINGS: {
                            ((BdfEncodings) (this.body))._fetchInstances();
                            break;
                        }
                        case BITMAPS: {
                            ((Bitmaps) (this.body))._fetchInstances();
                            break;
                        }
                        case GLYPH_NAMES: {
                            ((GlyphNames) (this.body))._fetchInstances();
                            break;
                        }
                        case PROPERTIES: {
                            ((Properties) (this.body))._fetchInstances();
                            break;
                        }
                        case SWIDTHS: {
                            ((Swidths) (this.body))._fetchInstances();
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    } else {
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4le(((Number) (this.type.id())).longValue());
            this.format._write_Seq(this._io);
            this._io.writeU4le(this.lenBody);
            this._io.writeU4le(this.ofsBody);
        }

        public void _check() {
            if (!Objects.equals(this.format._root(), _root()))
                throw new ConsistencyError("format", _root(), this.format._root());
            if (!Objects.equals(this.format._parent(), this))
                throw new ConsistencyError("format", this, this.format._parent());
            if (_enabledBody) {
                {
                    Types on = type();
                    if (on != null) {
                        switch (type()) {
                        case BDF_ENCODINGS: {
                            if (!Objects.equals(((PcfFont.Table.BdfEncodings) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((PcfFont.Table.BdfEncodings) (this.body))._root());
                            if (!Objects.equals(((PcfFont.Table.BdfEncodings) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((PcfFont.Table.BdfEncodings) (this.body))._parent());
                            break;
                        }
                        case BITMAPS: {
                            if (!Objects.equals(((PcfFont.Table.Bitmaps) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((PcfFont.Table.Bitmaps) (this.body))._root());
                            if (!Objects.equals(((PcfFont.Table.Bitmaps) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((PcfFont.Table.Bitmaps) (this.body))._parent());
                            break;
                        }
                        case GLYPH_NAMES: {
                            if (!Objects.equals(((PcfFont.Table.GlyphNames) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((PcfFont.Table.GlyphNames) (this.body))._root());
                            if (!Objects.equals(((PcfFont.Table.GlyphNames) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((PcfFont.Table.GlyphNames) (this.body))._parent());
                            break;
                        }
                        case PROPERTIES: {
                            if (!Objects.equals(((PcfFont.Table.Properties) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((PcfFont.Table.Properties) (this.body))._root());
                            if (!Objects.equals(((PcfFont.Table.Properties) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((PcfFont.Table.Properties) (this.body))._parent());
                            break;
                        }
                        case SWIDTHS: {
                            if (!Objects.equals(((PcfFont.Table.Swidths) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((PcfFont.Table.Swidths) (this.body))._root());
                            if (!Objects.equals(((PcfFont.Table.Swidths) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((PcfFont.Table.Swidths) (this.body))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.body)).length != lenBody())
                                throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.body)).length != lenBody())
                            throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                    }
                }
            }
            _dirty = false;
        }

        /**
         * Table that allows mapping of character codes to glyphs present in the
         * font. Supports 1-byte and 2-byte character codes.
         * 
         * Note that this mapping is agnostic to character encoding itself - it
         * can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
         * national encodings, etc. If application cares about it, normally
         * encoding will be specified in `properties` table, in the properties named
         * `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table">Source</a>
         */
        public static class BdfEncodings extends KaitaiStruct.ReadWrite {
            public static BdfEncodings fromFile(String fileName) throws IOException {
                return new BdfEncodings(new ByteBufferKaitaiStream(fileName));
            }
            public BdfEncodings() {
                this(null, null, null);
            }

            public BdfEncodings(KaitaiStream _io) {
                this(_io, null, null);
            }

            public BdfEncodings(KaitaiStream _io, PcfFont.Table _parent) {
                this(_io, _parent, null);
            }

            public BdfEncodings(KaitaiStream _io, PcfFont.Table _parent, PcfFont _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.format = new Format(this._io, this, _root);
                this.format._read();
                this.minCharOrByte2 = this._io.readU2le();
                this.maxCharOrByte2 = this._io.readU2le();
                this.minByte1 = this._io.readU2le();
                this.maxByte1 = this._io.readU2le();
                this.defaultChar = this._io.readU2le();
                this.glyphIndexes = new ArrayList<Integer>();
                for (int i = 0; i < ((maxCharOrByte2() - minCharOrByte2()) + 1) * ((maxByte1() - minByte1()) + 1); i++) {
                    this.glyphIndexes.add(this._io.readU2le());
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.glyphIndexes.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.format._write_Seq(this._io);
                this._io.writeU2le(this.minCharOrByte2);
                this._io.writeU2le(this.maxCharOrByte2);
                this._io.writeU2le(this.minByte1);
                this._io.writeU2le(this.maxByte1);
                this._io.writeU2le(this.defaultChar);
                for (int i = 0; i < this.glyphIndexes.size(); i++) {
                    this._io.writeU2le(this.glyphIndexes.get(((Number) (i)).intValue()));
                }
            }

            public void _check() {
                if (!Objects.equals(this.format._root(), _root()))
                    throw new ConsistencyError("format", _root(), this.format._root());
                if (!Objects.equals(this.format._parent(), this))
                    throw new ConsistencyError("format", this, this.format._parent());
                if (this.glyphIndexes.size() != ((maxCharOrByte2() - minCharOrByte2()) + 1) * ((maxByte1() - minByte1()) + 1))
                    throw new ConsistencyError("glyph_indexes", ((maxCharOrByte2() - minCharOrByte2()) + 1) * ((maxByte1() - minByte1()) + 1), this.glyphIndexes.size());
                for (int i = 0; i < this.glyphIndexes.size(); i++) {
                }
                _dirty = false;
            }
            private Format format;
            private int minCharOrByte2;
            private int maxCharOrByte2;
            private int minByte1;
            private int maxByte1;
            private int defaultChar;
            private List<Integer> glyphIndexes;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public void setFormat(Format _v) { _dirty = true; format = _v; }
            public int minCharOrByte2() { return minCharOrByte2; }
            public void setMinCharOrByte2(int _v) { _dirty = true; minCharOrByte2 = _v; }
            public int maxCharOrByte2() { return maxCharOrByte2; }
            public void setMaxCharOrByte2(int _v) { _dirty = true; maxCharOrByte2 = _v; }
            public int minByte1() { return minByte1; }
            public void setMinByte1(int _v) { _dirty = true; minByte1 = _v; }
            public int maxByte1() { return maxByte1; }
            public void setMaxByte1(int _v) { _dirty = true; maxByte1 = _v; }
            public int defaultChar() { return defaultChar; }
            public void setDefaultChar(int _v) { _dirty = true; defaultChar = _v; }
            public List<Integer> glyphIndexes() { return glyphIndexes; }
            public void setGlyphIndexes(List<Integer> _v) { _dirty = true; glyphIndexes = _v; }
            public PcfFont _root() { return _root; }
            public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
            public PcfFont.Table _parent() { return _parent; }
            public void set_parent(PcfFont.Table _v) { _dirty = true; _parent = _v; }
        }

        /**
         * Table containing uncompressed glyph bitmaps.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table">Source</a>
         */
        public static class Bitmaps extends KaitaiStruct.ReadWrite {
            public static Bitmaps fromFile(String fileName) throws IOException {
                return new Bitmaps(new ByteBufferKaitaiStream(fileName));
            }
            public Bitmaps() {
                this(null, null, null);
            }

            public Bitmaps(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Bitmaps(KaitaiStream _io, PcfFont.Table _parent) {
                this(_io, _parent, null);
            }

            public Bitmaps(KaitaiStream _io, PcfFont.Table _parent, PcfFont _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.format = new Format(this._io, this, _root);
                this.format._read();
                this.numGlyphs = this._io.readU4le();
                this.offsets = new ArrayList<Long>();
                for (int i = 0; i < numGlyphs(); i++) {
                    this.offsets.add(this._io.readU4le());
                }
                this.bitmapSizes = new ArrayList<Long>();
                for (int i = 0; i < 4; i++) {
                    this.bitmapSizes.add(this._io.readU4le());
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.offsets.size(); i++) {
                }
                for (int i = 0; i < this.bitmapSizes.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.format._write_Seq(this._io);
                this._io.writeU4le(this.numGlyphs);
                for (int i = 0; i < this.offsets.size(); i++) {
                    this._io.writeU4le(this.offsets.get(((Number) (i)).intValue()));
                }
                for (int i = 0; i < this.bitmapSizes.size(); i++) {
                    this._io.writeU4le(this.bitmapSizes.get(((Number) (i)).intValue()));
                }
            }

            public void _check() {
                if (!Objects.equals(this.format._root(), _root()))
                    throw new ConsistencyError("format", _root(), this.format._root());
                if (!Objects.equals(this.format._parent(), this))
                    throw new ConsistencyError("format", this, this.format._parent());
                if (this.offsets.size() != numGlyphs())
                    throw new ConsistencyError("offsets", numGlyphs(), this.offsets.size());
                for (int i = 0; i < this.offsets.size(); i++) {
                }
                if (this.bitmapSizes.size() != 4)
                    throw new ConsistencyError("bitmap_sizes", 4, this.bitmapSizes.size());
                for (int i = 0; i < this.bitmapSizes.size(); i++) {
                }
                _dirty = false;
            }
            private Format format;
            private long numGlyphs;
            private List<Long> offsets;
            private List<Long> bitmapSizes;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public void setFormat(Format _v) { _dirty = true; format = _v; }
            public long numGlyphs() { return numGlyphs; }
            public void setNumGlyphs(long _v) { _dirty = true; numGlyphs = _v; }
            public List<Long> offsets() { return offsets; }
            public void setOffsets(List<Long> _v) { _dirty = true; offsets = _v; }
            public List<Long> bitmapSizes() { return bitmapSizes; }
            public void setBitmapSizes(List<Long> _v) { _dirty = true; bitmapSizes = _v; }
            public PcfFont _root() { return _root; }
            public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
            public PcfFont.Table _parent() { return _parent; }
            public void set_parent(PcfFont.Table _v) { _dirty = true; _parent = _v; }
        }

        /**
         * Table containing character names for every glyph.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table">Source</a>
         */
        public static class GlyphNames extends KaitaiStruct.ReadWrite {
            public static GlyphNames fromFile(String fileName) throws IOException {
                return new GlyphNames(new ByteBufferKaitaiStream(fileName));
            }
            public GlyphNames() {
                this(null, null, null);
            }

            public GlyphNames(KaitaiStream _io) {
                this(_io, null, null);
            }

            public GlyphNames(KaitaiStream _io, PcfFont.Table _parent) {
                this(_io, _parent, null);
            }

            public GlyphNames(KaitaiStream _io, PcfFont.Table _parent, PcfFont _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.format = new Format(this._io, this, _root);
                this.format._read();
                this.numGlyphs = this._io.readU4le();
                this.names = new ArrayList<StringRef>();
                for (int i = 0; i < numGlyphs(); i++) {
                    StringRef _t_names = new StringRef(this._io, this, _root);
                    try {
                        _t_names._read();
                    } finally {
                        this.names.add(_t_names);
                    }
                }
                this.lenStrings = this._io.readU4le();
                this._raw_strings = this._io.readBytes(lenStrings());
                KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(this._raw_strings);
                this.strings = new BytesWithIo(_io__raw_strings);
                this.strings._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.names.size(); i++) {
                    this.names.get(((Number) (i)).intValue())._fetchInstances();
                }
                this.strings._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.format._write_Seq(this._io);
                this._io.writeU4le(this.numGlyphs);
                for (int i = 0; i < this.names.size(); i++) {
                    this.names.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.writeU4le(this.lenStrings);
                final KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(lenStrings());
                this._io.addChildStream(_io__raw_strings);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenStrings()));
                    final GlyphNames _this = this;
                    _io__raw_strings.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_strings = _io__raw_strings.toByteArray();
                            if (_this._raw_strings.length != lenStrings())
                                throw new ConsistencyError("raw(strings)", lenStrings(), _this._raw_strings.length);
                            parent.writeBytes(_this._raw_strings);
                        }
                    });
                }
                this.strings._write_Seq(_io__raw_strings);
            }

            public void _check() {
                if (!Objects.equals(this.format._root(), _root()))
                    throw new ConsistencyError("format", _root(), this.format._root());
                if (!Objects.equals(this.format._parent(), this))
                    throw new ConsistencyError("format", this, this.format._parent());
                if (this.names.size() != numGlyphs())
                    throw new ConsistencyError("names", numGlyphs(), this.names.size());
                for (int i = 0; i < this.names.size(); i++) {
                    if (!Objects.equals(this.names.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("names", _root(), this.names.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.names.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("names", this, this.names.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class StringRef extends KaitaiStruct.ReadWrite {
                public static StringRef fromFile(String fileName) throws IOException {
                    return new StringRef(new ByteBufferKaitaiStream(fileName));
                }
                public StringRef() {
                    this(null, null, null);
                }

                public StringRef(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public StringRef(KaitaiStream _io, PcfFont.Table.GlyphNames _parent) {
                    this(_io, _parent, null);
                }

                public StringRef(KaitaiStream _io, PcfFont.Table.GlyphNames _parent, PcfFont _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.ofsString = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    value();
                    if (this.value != null) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    _shouldWriteValue = _enabledValue;
                    this._io.writeU4le(this.ofsString);
                }

                public void _check() {
                    if (_enabledValue) {
                        if (KaitaiStream.byteArrayIndexOf((this.value).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("value", -1, KaitaiStream.byteArrayIndexOf((this.value).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    }
                    _dirty = false;
                }
                private String value;
                private boolean _shouldWriteValue = false;
                private boolean _enabledValue = true;
                public String value() {
                    if (_shouldWriteValue)
                        _writeValue();
                    if (this.value != null)
                        return this.value;
                    if (!_enabledValue)
                        return null;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsString());
                    this.value = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    io.seek(_pos);
                    return this.value;
                }
                public void setValue(String _v) { _dirty = true; value = _v; }
                public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

                private void _writeValue() {
                    _shouldWriteValue = false;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsString());
                    io.writeBytes((this.value).getBytes(Charset.forName("UTF-8")));
                    io.writeU1(0);
                    io.seek(_pos);
                }
                private long ofsString;
                private PcfFont _root;
                private PcfFont.Table.GlyphNames _parent;
                public long ofsString() { return ofsString; }
                public void setOfsString(long _v) { _dirty = true; ofsString = _v; }
                public PcfFont _root() { return _root; }
                public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
                public PcfFont.Table.GlyphNames _parent() { return _parent; }
                public void set_parent(PcfFont.Table.GlyphNames _v) { _dirty = true; _parent = _v; }
            }
            private Format format;
            private long numGlyphs;
            private List<StringRef> names;
            private long lenStrings;
            private BytesWithIo strings;
            private PcfFont _root;
            private PcfFont.Table _parent;
            private byte[] _raw_strings;
            public Format format() { return format; }
            public void setFormat(Format _v) { _dirty = true; format = _v; }
            public long numGlyphs() { return numGlyphs; }
            public void setNumGlyphs(long _v) { _dirty = true; numGlyphs = _v; }

            /**
             * Glyph names are represented as string references in strings buffer.
             */
            public List<StringRef> names() { return names; }
            public void setNames(List<StringRef> _v) { _dirty = true; names = _v; }
            public long lenStrings() { return lenStrings; }
            public void setLenStrings(long _v) { _dirty = true; lenStrings = _v; }

            /**
             * Strings buffer which contains all glyph names.
             */
            public BytesWithIo strings() { return strings; }
            public void setStrings(BytesWithIo _v) { _dirty = true; strings = _v; }
            public PcfFont _root() { return _root; }
            public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
            public PcfFont.Table _parent() { return _parent; }
            public void set_parent(PcfFont.Table _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_strings() { return _raw_strings; }
            public void set_raw_Strings(byte[] _v) { _dirty = true; _raw_strings = _v; }
        }

        /**
         * Array of properties (key-value pairs), used to convey different X11
         * settings of a font. Key is always an X font atom.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#properties-table">Source</a>
         */
        public static class Properties extends KaitaiStruct.ReadWrite {
            public static Properties fromFile(String fileName) throws IOException {
                return new Properties(new ByteBufferKaitaiStream(fileName));
            }
            public Properties() {
                this(null, null, null);
            }

            public Properties(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Properties(KaitaiStream _io, PcfFont.Table _parent) {
                this(_io, _parent, null);
            }

            public Properties(KaitaiStream _io, PcfFont.Table _parent, PcfFont _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.format = new Format(this._io, this, _root);
                this.format._read();
                this.numProps = this._io.readU4le();
                this.props = new ArrayList<Prop>();
                for (int i = 0; i < numProps(); i++) {
                    Prop _t_props = new Prop(this._io, this, _root);
                    try {
                        _t_props._read();
                    } finally {
                        this.props.add(_t_props);
                    }
                }
                this.padding = this._io.readBytes(((numProps() & 3) == 0 ? 0 : 4 - (numProps() & 3)));
                this.lenStrings = this._io.readU4le();
                this._raw_strings = this._io.readBytes(lenStrings());
                KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(this._raw_strings);
                this.strings = new BytesWithIo(_io__raw_strings);
                this.strings._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.props.size(); i++) {
                    this.props.get(((Number) (i)).intValue())._fetchInstances();
                }
                this.strings._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.format._write_Seq(this._io);
                this._io.writeU4le(this.numProps);
                for (int i = 0; i < this.props.size(); i++) {
                    this.props.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.writeBytes(this.padding);
                this._io.writeU4le(this.lenStrings);
                final KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(lenStrings());
                this._io.addChildStream(_io__raw_strings);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenStrings()));
                    final Properties _this = this;
                    _io__raw_strings.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_strings = _io__raw_strings.toByteArray();
                            if (_this._raw_strings.length != lenStrings())
                                throw new ConsistencyError("raw(strings)", lenStrings(), _this._raw_strings.length);
                            parent.writeBytes(_this._raw_strings);
                        }
                    });
                }
                this.strings._write_Seq(_io__raw_strings);
            }

            public void _check() {
                if (!Objects.equals(this.format._root(), _root()))
                    throw new ConsistencyError("format", _root(), this.format._root());
                if (!Objects.equals(this.format._parent(), this))
                    throw new ConsistencyError("format", this, this.format._parent());
                if (this.props.size() != numProps())
                    throw new ConsistencyError("props", numProps(), this.props.size());
                for (int i = 0; i < this.props.size(); i++) {
                    if (!Objects.equals(this.props.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("props", _root(), this.props.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.props.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("props", this, this.props.get(((Number) (i)).intValue())._parent());
                }
                if (this.padding.length != ((numProps() & 3) == 0 ? 0 : 4 - (numProps() & 3)))
                    throw new ConsistencyError("padding", ((numProps() & 3) == 0 ? 0 : 4 - (numProps() & 3)), this.padding.length);
                _dirty = false;
            }

            /**
             * Property is a key-value pair, "key" being always a
             * string and "value" being either a string or a 32-bit
             * integer based on an additinal flag (`is_string`).
             * 
             * Simple offset-based mechanism is employed to keep this
             * type's sequence fixed-sized and thus have simple access
             * to property key/value by index.
             */
            public static class Prop extends KaitaiStruct.ReadWrite {
                public static Prop fromFile(String fileName) throws IOException {
                    return new Prop(new ByteBufferKaitaiStream(fileName));
                }
                public Prop() {
                    this(null, null, null);
                }

                public Prop(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Prop(KaitaiStream _io, PcfFont.Table.Properties _parent) {
                    this(_io, _parent, null);
                }

                public Prop(KaitaiStream _io, PcfFont.Table.Properties _parent, PcfFont _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.ofsName = this._io.readU4le();
                    this.isString = this._io.readU1();
                    this.valueOrOfsValue = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    name();
                    if (this.name != null) {
                    }
                    strValue();
                    if (this.strValue != null) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    _shouldWriteName = _enabledName;
                    _shouldWriteStrValue = _enabledStrValue;
                    this._io.writeU4le(this.ofsName);
                    this._io.writeU1(this.isString);
                    this._io.writeU4le(this.valueOrOfsValue);
                }

                public void _check() {
                    if (_enabledName) {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                    }
                    if (_enabledStrValue) {
                        if (isString() != 0) {
                            if (KaitaiStream.byteArrayIndexOf((this.strValue).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                                throw new ConsistencyError("str_value", -1, KaitaiStream.byteArrayIndexOf((this.strValue).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
                        }
                    }
                    _dirty = false;
                }
                private Long intValue;

                /**
                 * Value of the property, if this is an integer value.
                 */
                public Long intValue() {
                    if (this.intValue != null)
                        return this.intValue;
                    if (isString() == 0) {
                        this.intValue = ((Number) (valueOrOfsValue())).longValue();
                    }
                    return this.intValue;
                }
                public void _invalidateIntValue() { this.intValue = null; }
                private String name;
                private boolean _shouldWriteName = false;
                private boolean _enabledName = true;

                /**
                 * Name of the property addressed in the strings buffer.
                 */
                public String name() {
                    if (_shouldWriteName)
                        _writeName();
                    if (this.name != null)
                        return this.name;
                    if (!_enabledName)
                        return null;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    io.seek(_pos);
                    return this.name;
                }
                public void setName(String _v) { _dirty = true; name = _v; }
                public void setName_Enabled(boolean _v) { _dirty = true; _enabledName = _v; }

                private void _writeName() {
                    _shouldWriteName = false;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
                    io.writeU1(0);
                    io.seek(_pos);
                }
                private String strValue;
                private boolean _shouldWriteStrValue = false;
                private boolean _enabledStrValue = true;

                /**
                 * Value of the property addressed in the strings
                 * buffer, if this is a string value.
                 */
                public String strValue() {
                    if (_shouldWriteStrValue)
                        _writeStrValue();
                    if (this.strValue != null)
                        return this.strValue;
                    if (!_enabledStrValue)
                        return null;
                    if (isString() != 0) {
                        KaitaiStream io = _parent().strings()._io();
                        long _pos = io.pos();
                        io.seek(valueOrOfsValue());
                        this.strValue = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                        io.seek(_pos);
                    }
                    return this.strValue;
                }
                public void setStrValue(String _v) { _dirty = true; strValue = _v; }
                public void setStrValue_Enabled(boolean _v) { _dirty = true; _enabledStrValue = _v; }

                private void _writeStrValue() {
                    _shouldWriteStrValue = false;
                    if (isString() != 0) {
                        KaitaiStream io = _parent().strings()._io();
                        long _pos = io.pos();
                        io.seek(valueOrOfsValue());
                        io.writeBytes((this.strValue).getBytes(Charset.forName("UTF-8")));
                        io.writeU1(0);
                        io.seek(_pos);
                    }
                }
                private long ofsName;
                private int isString;
                private long valueOrOfsValue;
                private PcfFont _root;
                private PcfFont.Table.Properties _parent;

                /**
                 * Offset to name in the strings buffer.
                 */
                public long ofsName() { return ofsName; }
                public void setOfsName(long _v) { _dirty = true; ofsName = _v; }

                /**
                 * Designates if value is an integer (zero) or a string (non-zero).
                 */
                public int isString() { return isString; }
                public void setIsString(int _v) { _dirty = true; isString = _v; }

                /**
                 * If the value is an integer (`is_string` is false),
                 * then it's stored here. If the value is a string
                 * (`is_string` is true), then it stores offset to the
                 * value in the strings buffer.
                 */
                public long valueOrOfsValue() { return valueOrOfsValue; }
                public void setValueOrOfsValue(long _v) { _dirty = true; valueOrOfsValue = _v; }
                public PcfFont _root() { return _root; }
                public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
                public PcfFont.Table.Properties _parent() { return _parent; }
                public void set_parent(PcfFont.Table.Properties _v) { _dirty = true; _parent = _v; }
            }
            private Format format;
            private long numProps;
            private List<Prop> props;
            private byte[] padding;
            private long lenStrings;
            private BytesWithIo strings;
            private PcfFont _root;
            private PcfFont.Table _parent;
            private byte[] _raw_strings;
            public Format format() { return format; }
            public void setFormat(Format _v) { _dirty = true; format = _v; }
            public long numProps() { return numProps; }
            public void setNumProps(long _v) { _dirty = true; numProps = _v; }
            public List<Prop> props() { return props; }
            public void setProps(List<Prop> _v) { _dirty = true; props = _v; }
            public byte[] padding() { return padding; }
            public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
            public long lenStrings() { return lenStrings; }
            public void setLenStrings(long _v) { _dirty = true; lenStrings = _v; }

            /**
             * Strings buffer. Never used directly, but instead is
             * addressed by offsets from the properties.
             */
            public BytesWithIo strings() { return strings; }
            public void setStrings(BytesWithIo _v) { _dirty = true; strings = _v; }
            public PcfFont _root() { return _root; }
            public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
            public PcfFont.Table _parent() { return _parent; }
            public void set_parent(PcfFont.Table _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_strings() { return _raw_strings; }
            public void set_raw_Strings(byte[] _v) { _dirty = true; _raw_strings = _v; }
        }

        /**
         * Table containing scalable widths of characters.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table">Source</a>
         */
        public static class Swidths extends KaitaiStruct.ReadWrite {
            public static Swidths fromFile(String fileName) throws IOException {
                return new Swidths(new ByteBufferKaitaiStream(fileName));
            }
            public Swidths() {
                this(null, null, null);
            }

            public Swidths(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Swidths(KaitaiStream _io, PcfFont.Table _parent) {
                this(_io, _parent, null);
            }

            public Swidths(KaitaiStream _io, PcfFont.Table _parent, PcfFont _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.format = new Format(this._io, this, _root);
                this.format._read();
                this.numGlyphs = this._io.readU4le();
                this.swidths = new ArrayList<Long>();
                for (int i = 0; i < numGlyphs(); i++) {
                    this.swidths.add(this._io.readU4le());
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.swidths.size(); i++) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.format._write_Seq(this._io);
                this._io.writeU4le(this.numGlyphs);
                for (int i = 0; i < this.swidths.size(); i++) {
                    this._io.writeU4le(this.swidths.get(((Number) (i)).intValue()));
                }
            }

            public void _check() {
                if (!Objects.equals(this.format._root(), _root()))
                    throw new ConsistencyError("format", _root(), this.format._root());
                if (!Objects.equals(this.format._parent(), this))
                    throw new ConsistencyError("format", this, this.format._parent());
                if (this.swidths.size() != numGlyphs())
                    throw new ConsistencyError("swidths", numGlyphs(), this.swidths.size());
                for (int i = 0; i < this.swidths.size(); i++) {
                }
                _dirty = false;
            }
            private Format format;
            private long numGlyphs;
            private List<Long> swidths;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public void setFormat(Format _v) { _dirty = true; format = _v; }
            public long numGlyphs() { return numGlyphs; }
            public void setNumGlyphs(long _v) { _dirty = true; numGlyphs = _v; }

            /**
             * The scalable width of a character is the width of the corresponding
             * PostScript character in em-units (1/1000ths of an em).
             */
            public List<Long> swidths() { return swidths; }
            public void setSwidths(List<Long> _v) { _dirty = true; swidths = _v; }
            public PcfFont _root() { return _root; }
            public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
            public PcfFont.Table _parent() { return _parent; }
            public void set_parent(PcfFont.Table _v) { _dirty = true; _parent = _v; }
        }
        private Object body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public Object body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            {
                Types on = type();
                if (on != null) {
                    switch (type()) {
                    case BDF_ENCODINGS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new BdfEncodings(_io__raw_body, this, _root);
                        ((BdfEncodings) (this.body))._read();
                        break;
                    }
                    case BITMAPS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Bitmaps(_io__raw_body, this, _root);
                        ((Bitmaps) (this.body))._read();
                        break;
                    }
                    case GLYPH_NAMES: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new GlyphNames(_io__raw_body, this, _root);
                        ((GlyphNames) (this.body))._read();
                        break;
                    }
                    case PROPERTIES: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Properties(_io__raw_body, this, _root);
                        ((Properties) (this.body))._read();
                        break;
                    }
                    case SWIDTHS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Swidths(_io__raw_body, this, _root);
                        ((Swidths) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(lenBody());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(lenBody());
                }
            }
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            {
                Types on = type();
                if (on != null) {
                    switch (type()) {
                    case BDF_ENCODINGS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Table _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((BdfEncodings) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case BITMAPS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Table _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Bitmaps) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case GLYPH_NAMES: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Table _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((GlyphNames) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case PROPERTIES: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Table _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Properties) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SWIDTHS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Table _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Swidths) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
            this._io.seek(_pos);
        }
        private Types type;
        private Format format;
        private long lenBody;
        private long ofsBody;
        private PcfFont _root;
        private PcfFont _parent;
        private byte[] _raw_body;
        public Types type() { return type; }
        public void setType(Types _v) { _dirty = true; type = _v; }
        public Format format() { return format; }
        public void setFormat(Format _v) { _dirty = true; format = _v; }
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public long ofsBody() { return ofsBody; }
        public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }
        public PcfFont _root() { return _root; }
        public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
        public PcfFont _parent() { return _parent; }
        public void set_parent(PcfFont _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    private byte[] magic;
    private long numTables;
    private List<Table> tables;
    private PcfFont _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long numTables() { return numTables; }
    public void setNumTables(long _v) { _dirty = true; numTables = _v; }
    public List<Table> tables() { return tables; }
    public void setTables(List<Table> _v) { _dirty = true; tables = _v; }
    public PcfFont _root() { return _root; }
    public void set_root(PcfFont _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
