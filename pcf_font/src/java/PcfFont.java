// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


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
        if (!(Arrays.equals(magic(), new byte[] { 1, 102, 99, 112 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 102, 99, 112 }, magic(), _io(), "/seq/0");
        }
        this.numTables = this._io.readU4le();
        tables = new ArrayList<Table>(((Number) (numTables())).intValue());
        for (int i = 0; i < numTables(); i++) {
            this.tables.add(new Table(this._io, this, _root));
        }
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
                swidths = new ArrayList<Long>(((Number) (numGlyphs())).intValue());
                for (int i = 0; i < numGlyphs(); i++) {
                    this.swidths.add(this._io.readU4le());
                }
            }
            private Format format;
            private long numGlyphs;
            private ArrayList<Long> swidths;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public long numGlyphs() { return numGlyphs; }

            /**
             * The scalable width of a character is the width of the corresponding
             * PostScript character in em-units (1/1000ths of an em).
             */
            public ArrayList<Long> swidths() { return swidths; }
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
                props = new ArrayList<Prop>(((Number) (numProps())).intValue());
                for (int i = 0; i < numProps(); i++) {
                    this.props.add(new Prop(this._io, this, _root));
                }
                this.padding = this._io.readBytes(((numProps() & 3) == 0 ? 0 : (4 - (numProps() & 3))));
                this.lenStrings = this._io.readU4le();
                this._raw_strings = this._io.readBytes(lenStrings());
                KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(_raw_strings);
                this.strings = new BytesWithIo(_io__raw_strings);
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
                    this.name = new String(io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
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
                        this.strValue = new String(io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
                        io.seek(_pos);
                    }
                    return this.strValue;
                }
                private Long intValue;

                /**
                 * Value of the property, if this is an integer value.
                 */
                public Long intValue() {
                    if (this.intValue != null)
                        return this.intValue;
                    if (isString() == 0) {
                        long _tmp = (long) (valueOrOfsValue());
                        this.intValue = _tmp;
                    }
                    return this.intValue;
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
            private ArrayList<Prop> props;
            private byte[] padding;
            private long lenStrings;
            private BytesWithIo strings;
            private PcfFont _root;
            private PcfFont.Table _parent;
            private byte[] _raw_strings;
            public Format format() { return format; }
            public long numProps() { return numProps; }
            public ArrayList<Prop> props() { return props; }
            public byte[] padding() { return padding; }
            public long lenStrings() { return lenStrings; }

            /**
             * Strings buffer. Never used directly, but instead is
             * addressed by offsets from the properties.
             */
            public BytesWithIo strings() { return strings; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
            public byte[] _raw_strings() { return _raw_strings; }
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
                glyphIndexes = new ArrayList<Integer>(((Number) ((((maxCharOrByte2() - minCharOrByte2()) + 1) * ((maxByte1() - minByte1()) + 1)))).intValue());
                for (int i = 0; i < (((maxCharOrByte2() - minCharOrByte2()) + 1) * ((maxByte1() - minByte1()) + 1)); i++) {
                    this.glyphIndexes.add(this._io.readU2le());
                }
            }
            private Format format;
            private int minCharOrByte2;
            private int maxCharOrByte2;
            private int minByte1;
            private int maxByte1;
            private int defaultChar;
            private ArrayList<Integer> glyphIndexes;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public int minCharOrByte2() { return minCharOrByte2; }
            public int maxCharOrByte2() { return maxCharOrByte2; }
            public int minByte1() { return minByte1; }
            public int maxByte1() { return maxByte1; }
            public int defaultChar() { return defaultChar; }
            public ArrayList<Integer> glyphIndexes() { return glyphIndexes; }
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
                names = new ArrayList<StringRef>(((Number) (numGlyphs())).intValue());
                for (int i = 0; i < numGlyphs(); i++) {
                    this.names.add(new StringRef(this._io, this, _root));
                }
                this.lenStrings = this._io.readU4le();
                this._raw_strings = this._io.readBytes(lenStrings());
                KaitaiStream _io__raw_strings = new ByteBufferKaitaiStream(_raw_strings);
                this.strings = new BytesWithIo(_io__raw_strings);
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
                private String value;
                public String value() {
                    if (this.value != null)
                        return this.value;
                    KaitaiStream io = _parent().strings()._io();
                    long _pos = io.pos();
                    io.seek(ofsString());
                    this.value = new String(io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
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
            private ArrayList<StringRef> names;
            private long lenStrings;
            private BytesWithIo strings;
            private PcfFont _root;
            private PcfFont.Table _parent;
            private byte[] _raw_strings;
            public Format format() { return format; }
            public long numGlyphs() { return numGlyphs; }

            /**
             * Glyph names are represented as string references in strings buffer.
             */
            public ArrayList<StringRef> names() { return names; }
            public long lenStrings() { return lenStrings; }

            /**
             * Strings buffer which contains all glyph names.
             */
            public BytesWithIo strings() { return strings; }
            public PcfFont _root() { return _root; }
            public PcfFont.Table _parent() { return _parent; }
            public byte[] _raw_strings() { return _raw_strings; }
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
                offsets = new ArrayList<Long>(((Number) (numGlyphs())).intValue());
                for (int i = 0; i < numGlyphs(); i++) {
                    this.offsets.add(this._io.readU4le());
                }
                bitmapSizes = new ArrayList<Long>(((Number) (4)).intValue());
                for (int i = 0; i < 4; i++) {
                    this.bitmapSizes.add(this._io.readU4le());
                }
            }
            private Format format;
            private long numGlyphs;
            private ArrayList<Long> offsets;
            private ArrayList<Long> bitmapSizes;
            private PcfFont _root;
            private PcfFont.Table _parent;
            public Format format() { return format; }
            public long numGlyphs() { return numGlyphs; }
            public ArrayList<Long> offsets() { return offsets; }
            public ArrayList<Long> bitmapSizes() { return bitmapSizes; }
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
                    case PROPERTIES: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new Properties(_io__raw_body, this, _root);
                        break;
                    }
                    case BDF_ENCODINGS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new BdfEncodings(_io__raw_body, this, _root);
                        break;
                    }
                    case SWIDTHS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new Swidths(_io__raw_body, this, _root);
                        break;
                    }
                    case GLYPH_NAMES: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new GlyphNames(_io__raw_body, this, _root);
                        break;
                    }
                    case BITMAPS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new Bitmaps(_io__raw_body, this, _root);
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
        private byte[] _raw_body;
        public Types type() { return type; }
        public Format format() { return format; }
        public long lenBody() { return lenBody; }
        public long ofsBody() { return ofsBody; }
        public PcfFont _root() { return _root; }
        public PcfFont _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
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
            this._io.alignToByte();
            this.format = this._io.readU1();
            this.padding = this._io.readU2le();
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
    private byte[] magic;
    private long numTables;
    private ArrayList<Table> tables;
    private PcfFont _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long numTables() { return numTables; }
    public ArrayList<Table> tables() { return tables; }
    public PcfFont _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
