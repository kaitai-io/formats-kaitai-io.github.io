// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
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
public class PcfFont extends KaitaiStruct {
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

    public PcfFont(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PcfFont(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PcfFont(KaitaiStream _io, KaitaiStruct _parent, PcfFont _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 1, 102, 99, 112 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 102, 99, 112 }, this.magic, this._io, "/seq/0");
        }
        this.numTables = this._io.readU4le();
        this.tables = new ArrayList<Table>();
        for (int i = 0; i < numTables(); i++) {
            this.tables.add(new Table(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.tables.size(); i++) {
            this.tables.get(((Number) (i)).intValue())._fetchInstances();
        }
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
    public static class Format extends KaitaiStruct {
        public static Format fromFile(String fileName) throws IOException {
            return new Format(new ByteBufferKaitaiStream(fileName));
        }

        public Format(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Format(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Format(KaitaiStream _io, KaitaiStruct _parent, PcfFont _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.padding1 = this._io.readBitsIntBe(2);
            this.scanUnitMask = this._io.readBitsIntBe(2);
            this.isMostSignificantBitFirst = this._io.readBitsIntBe(1) != 0;
            this.isBigEndian = this._io.readBitsIntBe(1) != 0;
            this.glyphPadMask = this._io.readBitsIntBe(2);
            this.format = this._io.readU1();
            this.padding = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private long padding1;
        private long scanUnitMask;
        private boolean isMostSignificantBitFirst;
        private boolean isBigEndian;
        private long glyphPadMask;
        private int format;
        private int padding;
        private PcfFont _root;
        private KaitaiStruct _parent;
        public long padding1() { return padding1; }
        public long scanUnitMask() { return scanUnitMask; }
        public boolean isMostSignificantBitFirst() { return isMostSignificantBitFirst; }

        /**
         * If set, then all integers in the table are treated as big-endian
         */
        public boolean isBigEndian() { return isBigEndian; }
        public long glyphPadMask() { return glyphPadMask; }
        public int format() { return format; }
        public int padding() { return padding; }
        public PcfFont _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Table offers a offset + length pointer to a particular
     * table. "Type" of table references certain enum. Applications can
     * ignore enum values which they don't support.
     */
    public static class Table extends KaitaiStruct {
        public static Table fromFile(String fileName) throws IOException {
            return new Table(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.type = PcfFont.Types.byId(this._io.readU4le());
            this.format = new Format(this._io, this, _root);
            this.lenBody = this._io.readU4le();
            this.ofsBody = this._io.readU4le();
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
        public static class BdfEncodings extends KaitaiStruct {
            public static BdfEncodings fromFile(String fileName) throws IOException {
                return new BdfEncodings(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.format = new Format(this._io, this, _root);
                this.minCharOrByte2 = this._io.readU2le();
                this.maxCharOrByte2 = this._io.readU2le();
                this.minByte1 = this._io.readU2le();
                this.maxByte1 = this._io.readU2le();
                this.defaultChar = this._io.readU2le();
                this.glyphIndexes = new ArrayList<Integer>();
                for (int i = 0; i < ((maxCharOrByte2() - minCharOrByte2()) + 1) * ((maxByte1() - minByte1()) + 1); i++) {
                    this.glyphIndexes.add(this._io.readU2le());
                }
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.glyphIndexes.size(); i++) {
                }
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
            public int minCharOrByte2() { return minCharOrByte2; }
            public int maxCharOrByte2() { return maxCharOrByte2; }
            public int minByte1() { return minByte1; }
            public int maxByte1() { return maxByte1; }
            public int defaultChar() { return defaultChar; }
            public List<Integer> glyphIndexes() { return glyphIndexes; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
        }

        /**
         * Table containing uncompressed glyph bitmaps.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table">Source</a>
         */
        public static class Bitmaps extends KaitaiStruct {
            public static Bitmaps fromFile(String fileName) throws IOException {
                return new Bitmaps(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.format = new Format(this._io, this, _root);
                this.numGlyphs = this._io.readU4le();
                this.offsets = new ArrayList<Long>();
                for (int i = 0; i < numGlyphs(); i++) {
                    this.offsets.add(this._io.readU4le());
                }
                this.bitmapSizes = new ArrayList<Long>();
                for (int i = 0; i < 4; i++) {
                    this.bitmapSizes.add(this._io.readU4le());
                }
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.offsets.size(); i++) {
                }
                for (int i = 0; i < this.bitmapSizes.size(); i++) {
                }
            }
            private Format format;
            private long numGlyphs;
            private List<Long> offsets;
            private List<Long> bitmapSizes;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public long numGlyphs() { return numGlyphs; }
            public List<Long> offsets() { return offsets; }
            public List<Long> bitmapSizes() { return bitmapSizes; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
        }

        /**
         * Table containing character names for every glyph.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table">Source</a>
         */
        public static class GlyphNames extends KaitaiStruct {
            public static GlyphNames fromFile(String fileName) throws IOException {
                return new GlyphNames(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.format = new Format(this._io, this, _root);
                this.numGlyphs = this._io.readU4le();
                this.names = new ArrayList<StringRef>();
                for (int i = 0; i < numGlyphs(); i++) {
                    this.names.add(new StringRef(this._io, this, _root));
                }
                this.lenStrings = this._io.readU4le();
                KaitaiStream _io_strings = this._io.substream(lenStrings());
                this.strings = new BytesWithIo(_io_strings);
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.names.size(); i++) {
                    this.names.get(((Number) (i)).intValue())._fetchInstances();
                }
                this.strings._fetchInstances();
            }
            public static class StringRef extends KaitaiStruct {
                public static StringRef fromFile(String fileName) throws IOException {
                    return new StringRef(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.ofsString = this._io.readU4le();
                }

                public void _fetchInstances() {
                    value();
                    if (this.value != null) {
                    }
                }
                private String value;
                public String value() {
                    if (this.value != null)
                        return this.value;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsString());
                    this.value = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    io.seek(_pos);
                    return this.value;
                }
                private long ofsString;
                private PcfFont _root;
                private PcfFont.Table.GlyphNames _parent;
                public long ofsString() { return ofsString; }
                public PcfFont _root() { return _root; }
                public PcfFont.Table.GlyphNames _parent() { return _parent; }
            }
            private Format format;
            private long numGlyphs;
            private List<StringRef> names;
            private long lenStrings;
            private BytesWithIo strings;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public long numGlyphs() { return numGlyphs; }

            /**
             * Glyph names are represented as string references in strings buffer.
             */
            public List<StringRef> names() { return names; }
            public long lenStrings() { return lenStrings; }

            /**
             * Strings buffer which contains all glyph names.
             */
            public BytesWithIo strings() { return strings; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
        }

        /**
         * Array of properties (key-value pairs), used to convey different X11
         * settings of a font. Key is always an X font atom.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#properties-table">Source</a>
         */
        public static class Properties extends KaitaiStruct {
            public static Properties fromFile(String fileName) throws IOException {
                return new Properties(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.format = new Format(this._io, this, _root);
                this.numProps = this._io.readU4le();
                this.props = new ArrayList<Prop>();
                for (int i = 0; i < numProps(); i++) {
                    this.props.add(new Prop(this._io, this, _root));
                }
                this.padding = this._io.readBytes(((numProps() & 3) == 0 ? 0 : 4 - (numProps() & 3)));
                this.lenStrings = this._io.readU4le();
                KaitaiStream _io_strings = this._io.substream(lenStrings());
                this.strings = new BytesWithIo(_io_strings);
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.props.size(); i++) {
                    this.props.get(((Number) (i)).intValue())._fetchInstances();
                }
                this.strings._fetchInstances();
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
            public static class Prop extends KaitaiStruct {
                public static Prop fromFile(String fileName) throws IOException {
                    return new Prop(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.ofsName = this._io.readU4le();
                    this.isString = this._io.readU1();
                    this.valueOrOfsValue = this._io.readU4le();
                }

                public void _fetchInstances() {
                    name();
                    if (this.name != null) {
                    }
                    strValue();
                    if (this.strValue != null) {
                    }
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
                private String name;

                /**
                 * Name of the property addressed in the strings buffer.
                 */
                public String name() {
                    if (this.name != null)
                        return this.name;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsName());
                    this.name = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                    io.seek(_pos);
                    return this.name;
                }
                private String strValue;

                /**
                 * Value of the property addressed in the strings
                 * buffer, if this is a string value.
                 */
                public String strValue() {
                    if (this.strValue != null)
                        return this.strValue;
                    if (isString() != 0) {
                        KaitaiStream io = _parent().strings()._io();
                        long _pos = io.pos();
                        io.seek(valueOrOfsValue());
                        this.strValue = new String(io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
                        io.seek(_pos);
                    }
                    return this.strValue;
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

                /**
                 * Designates if value is an integer (zero) or a string (non-zero).
                 */
                public int isString() { return isString; }

                /**
                 * If the value is an integer (`is_string` is false),
                 * then it's stored here. If the value is a string
                 * (`is_string` is true), then it stores offset to the
                 * value in the strings buffer.
                 */
                public long valueOrOfsValue() { return valueOrOfsValue; }
                public PcfFont _root() { return _root; }
                public PcfFont.Table.Properties _parent() { return _parent; }
            }
            private Format format;
            private long numProps;
            private List<Prop> props;
            private byte[] padding;
            private long lenStrings;
            private BytesWithIo strings;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public long numProps() { return numProps; }
            public List<Prop> props() { return props; }
            public byte[] padding() { return padding; }
            public long lenStrings() { return lenStrings; }

            /**
             * Strings buffer. Never used directly, but instead is
             * addressed by offsets from the properties.
             */
            public BytesWithIo strings() { return strings; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
        }

        /**
         * Table containing scalable widths of characters.
         * @see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table">Source</a>
         */
        public static class Swidths extends KaitaiStruct {
            public static Swidths fromFile(String fileName) throws IOException {
                return new Swidths(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.format = new Format(this._io, this, _root);
                this.numGlyphs = this._io.readU4le();
                this.swidths = new ArrayList<Long>();
                for (int i = 0; i < numGlyphs(); i++) {
                    this.swidths.add(this._io.readU4le());
                }
            }

            public void _fetchInstances() {
                this.format._fetchInstances();
                for (int i = 0; i < this.swidths.size(); i++) {
                }
            }
            private Format format;
            private long numGlyphs;
            private List<Long> swidths;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public long numGlyphs() { return numGlyphs; }

            /**
             * The scalable width of a character is the width of the corresponding
             * PostScript character in em-units (1/1000ths of an em).
             */
            public List<Long> swidths() { return swidths; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
        }
        private Object body;
        public Object body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek(ofsBody());
            {
                Types on = type();
                if (on != null) {
                    switch (type()) {
                    case BDF_ENCODINGS: {
                        KaitaiStream _io_body = this._io.substream(lenBody());
                        this.body = new BdfEncodings(_io_body, this, _root);
                        break;
                    }
                    case BITMAPS: {
                        KaitaiStream _io_body = this._io.substream(lenBody());
                        this.body = new Bitmaps(_io_body, this, _root);
                        break;
                    }
                    case GLYPH_NAMES: {
                        KaitaiStream _io_body = this._io.substream(lenBody());
                        this.body = new GlyphNames(_io_body, this, _root);
                        break;
                    }
                    case PROPERTIES: {
                        KaitaiStream _io_body = this._io.substream(lenBody());
                        this.body = new Properties(_io_body, this, _root);
                        break;
                    }
                    case SWIDTHS: {
                        KaitaiStream _io_body = this._io.substream(lenBody());
                        this.body = new Swidths(_io_body, this, _root);
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
        private Types type;
        private Format format;
        private long lenBody;
        private long ofsBody;
        private PcfFont _root;
        private PcfFont _parent;
        public Types type() { return type; }
        public Format format() { return format; }
        public long lenBody() { return lenBody; }
        public long ofsBody() { return ofsBody; }
        public PcfFont _root() { return _root; }
        public PcfFont _parent() { return _parent; }
    }
    private byte[] magic;
    private long numTables;
    private List<Table> tables;
    private PcfFont _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long numTables() { return numTables; }
    public List<Table> tables() { return tables; }
    public PcfFont _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
