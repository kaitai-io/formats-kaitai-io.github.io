// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.Collections;


/**
 * A TrueType font file contains data, in table format, that comprises
 * an outline font.
 * @see <a href="https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc">Source</a>
 */
public class Ttf extends KaitaiStruct {
    public static Ttf fromFile(String fileName) throws IOException {
        return new Ttf(new ByteBufferKaitaiStream(fileName));
    }

    public Ttf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ttf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ttf(KaitaiStream _io, KaitaiStruct _parent, Ttf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.offsetTable = new OffsetTable(this._io, this, _root);
        this.directoryTable = new ArrayList<DirTableEntry>();
        for (int i = 0; i < offsetTable().numTables(); i++) {
            this.directoryTable.add(new DirTableEntry(this._io, this, _root));
        }
    }
    public static class Post extends KaitaiStruct {
        public static Post fromFile(String fileName) throws IOException {
            return new Post(new ByteBufferKaitaiStream(fileName));
        }

        public Post(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Post(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Post(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.format = new Fixed(this._io, this, _root);
            this.italicAngle = new Fixed(this._io, this, _root);
            this.underlinePosition = this._io.readS2be();
            this.underlineThichness = this._io.readS2be();
            this.isFixedPitch = this._io.readU4be();
            this.minMemType42 = this._io.readU4be();
            this.maxMemType42 = this._io.readU4be();
            this.minMemType1 = this._io.readU4be();
            this.maxMemType1 = this._io.readU4be();
            if ( ((format().major() == 2) && (format().minor() == 0)) ) {
                this.format20 = new Format20(this._io, this, _root);
            }
        }
        public static class Format20 extends KaitaiStruct {
            public static Format20 fromFile(String fileName) throws IOException {
                return new Format20(new ByteBufferKaitaiStream(fileName));
            }

            public Format20(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Format20(KaitaiStream _io, Ttf.Post _parent) {
                this(_io, _parent, null);
            }

            public Format20(KaitaiStream _io, Ttf.Post _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.numberOfGlyphs = this._io.readU2be();
                this.glyphNameIndex = new ArrayList<Integer>();
                for (int i = 0; i < numberOfGlyphs(); i++) {
                    this.glyphNameIndex.add(this._io.readU2be());
                }
                this.glyphNames = new ArrayList<PascalString>();
                {
                    PascalString _it;
                    int i = 0;
                    do {
                        _it = new PascalString(this._io, this, _root);
                        this.glyphNames.add(_it);
                        i++;
                    } while (!( ((_it.length() == 0) || (_io().isEof())) ));
                }
            }
            public static class PascalString extends KaitaiStruct {
                public static PascalString fromFile(String fileName) throws IOException {
                    return new PascalString(new ByteBufferKaitaiStream(fileName));
                }

                public PascalString(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public PascalString(KaitaiStream _io, Ttf.Post.Format20 _parent) {
                    this(_io, _parent, null);
                }

                public PascalString(KaitaiStream _io, Ttf.Post.Format20 _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.length = this._io.readU1();
                    if (length() != 0) {
                        this.value = new String(this._io.readBytes(length()), Charset.forName("ascii"));
                    }
                }
                private int length;
                private String value;
                private Ttf _root;
                private Ttf.Post.Format20 _parent;
                public int length() { return length; }
                public String value() { return value; }
                public Ttf _root() { return _root; }
                public Ttf.Post.Format20 _parent() { return _parent; }
            }
            private int numberOfGlyphs;
            private ArrayList<Integer> glyphNameIndex;
            private ArrayList<PascalString> glyphNames;
            private Ttf _root;
            private Ttf.Post _parent;
            public int numberOfGlyphs() { return numberOfGlyphs; }
            public ArrayList<Integer> glyphNameIndex() { return glyphNameIndex; }
            public ArrayList<PascalString> glyphNames() { return glyphNames; }
            public Ttf _root() { return _root; }
            public Ttf.Post _parent() { return _parent; }
        }
        private Fixed format;
        private Fixed italicAngle;
        private short underlinePosition;
        private short underlineThichness;
        private long isFixedPitch;
        private long minMemType42;
        private long maxMemType42;
        private long minMemType1;
        private long maxMemType1;
        private Format20 format20;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public Fixed format() { return format; }
        public Fixed italicAngle() { return italicAngle; }
        public short underlinePosition() { return underlinePosition; }
        public short underlineThichness() { return underlineThichness; }
        public long isFixedPitch() { return isFixedPitch; }
        public long minMemType42() { return minMemType42; }
        public long maxMemType42() { return maxMemType42; }
        public long minMemType1() { return minMemType1; }
        public long maxMemType1() { return maxMemType1; }
        public Format20 format20() { return format20; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }

    /**
     * Name table is meant to include human-readable string metadata
     * that describes font: name of the font, its styles, copyright &
     * trademark notices, vendor and designer info, etc.
     * 
     * The table includes a list of "name records", each of which
     * corresponds to a single metadata entry.
     * @see <a href="https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html">Source</a>
     */
    public static class Name extends KaitaiStruct {
        public static Name fromFile(String fileName) throws IOException {
            return new Name(new ByteBufferKaitaiStream(fileName));
        }

        public enum Platforms {
            UNICODE(0),
            MACINTOSH(1),
            RESERVED_2(2),
            MICROSOFT(3);

            private final long id;
            Platforms(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Platforms> byId = new HashMap<Long, Platforms>(4);
            static {
                for (Platforms e : Platforms.values())
                    byId.put(e.id(), e);
            }
            public static Platforms byId(long id) { return byId.get(id); }
        }

        public enum Names {
            COPYRIGHT(0),
            FONT_FAMILY(1),
            FONT_SUBFAMILY(2),
            UNIQUE_SUBFAMILY_ID(3),
            FULL_FONT_NAME(4),
            NAME_TABLE_VERSION(5),
            POSTSCRIPT_FONT_NAME(6),
            TRADEMARK(7),
            MANUFACTURER(8),
            DESIGNER(9),
            DESCRIPTION(10),
            URL_VENDOR(11),
            URL_DESIGNER(12),
            LICENSE(13),
            URL_LICENSE(14),
            RESERVED_15(15),
            PREFERRED_FAMILY(16),
            PREFERRED_SUBFAMILY(17),
            COMPATIBLE_FULL_NAME(18),
            SAMPLE_TEXT(19);

            private final long id;
            Names(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Names> byId = new HashMap<Long, Names>(20);
            static {
                for (Names e : Names.values())
                    byId.put(e.id(), e);
            }
            public static Names byId(long id) { return byId.get(id); }
        }

        public Name(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Name(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Name(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.formatSelector = this._io.readU2be();
            this.numNameRecords = this._io.readU2be();
            this.ofsStrings = this._io.readU2be();
            this.nameRecords = new ArrayList<NameRecord>();
            for (int i = 0; i < numNameRecords(); i++) {
                this.nameRecords.add(new NameRecord(this._io, this, _root));
            }
        }
        public static class NameRecord extends KaitaiStruct {
            public static NameRecord fromFile(String fileName) throws IOException {
                return new NameRecord(new ByteBufferKaitaiStream(fileName));
            }

            public NameRecord(KaitaiStream _io) {
                this(_io, null, null);
            }

            public NameRecord(KaitaiStream _io, Ttf.Name _parent) {
                this(_io, _parent, null);
            }

            public NameRecord(KaitaiStream _io, Ttf.Name _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.platformId = Ttf.Name.Platforms.byId(this._io.readU2be());
                this.encodingId = this._io.readU2be();
                this.languageId = this._io.readU2be();
                this.nameId = Ttf.Name.Names.byId(this._io.readU2be());
                this.lenStr = this._io.readU2be();
                this.ofsStr = this._io.readU2be();
            }
            private String asciiValue;
            public String asciiValue() {
                if (this.asciiValue != null)
                    return this.asciiValue;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek((_parent().ofsStrings() + ofsStr()));
                this.asciiValue = new String(io.readBytes(lenStr()), Charset.forName("ascii"));
                io.seek(_pos);
                return this.asciiValue;
            }
            private String unicodeValue;
            public String unicodeValue() {
                if (this.unicodeValue != null)
                    return this.unicodeValue;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek((_parent().ofsStrings() + ofsStr()));
                this.unicodeValue = new String(io.readBytes(lenStr()), Charset.forName("utf-16be"));
                io.seek(_pos);
                return this.unicodeValue;
            }
            private Platforms platformId;
            private int encodingId;
            private int languageId;
            private Names nameId;
            private int lenStr;
            private int ofsStr;
            private Ttf _root;
            private Ttf.Name _parent;
            public Platforms platformId() { return platformId; }
            public int encodingId() { return encodingId; }
            public int languageId() { return languageId; }
            public Names nameId() { return nameId; }
            public int lenStr() { return lenStr; }
            public int ofsStr() { return ofsStr; }
            public Ttf _root() { return _root; }
            public Ttf.Name _parent() { return _parent; }
        }
        private int formatSelector;
        private int numNameRecords;
        private int ofsStrings;
        private ArrayList<NameRecord> nameRecords;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public int formatSelector() { return formatSelector; }
        public int numNameRecords() { return numNameRecords; }
        public int ofsStrings() { return ofsStrings; }
        public ArrayList<NameRecord> nameRecords() { return nameRecords; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Head extends KaitaiStruct {
        public static Head fromFile(String fileName) throws IOException {
            return new Head(new ByteBufferKaitaiStream(fileName));
        }

        public enum Flags {
            BASELINE_AT_Y0(1),
            LEFT_SIDEBEARING_AT_X0(2),
            FLAG_DEPEND_ON_POINT_SIZE(4),
            FLAG_FORCE_PPEM(8),
            FLAG_MAY_ADVANCE_WIDTH(16);

            private final long id;
            Flags(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Flags> byId = new HashMap<Long, Flags>(5);
            static {
                for (Flags e : Flags.values())
                    byId.put(e.id(), e);
            }
            public static Flags byId(long id) { return byId.get(id); }
        }

        public enum FontDirectionHint {
            FULLY_MIXED_DIRECTIONAL_GLYPHS(0),
            ONLY_STRONGLY_LEFT_TO_RIGHT(1),
            STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS(2);

            private final long id;
            FontDirectionHint(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FontDirectionHint> byId = new HashMap<Long, FontDirectionHint>(3);
            static {
                for (FontDirectionHint e : FontDirectionHint.values())
                    byId.put(e.id(), e);
            }
            public static FontDirectionHint byId(long id) { return byId.get(id); }
        }

        public Head(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Head(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Head(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = new Fixed(this._io, this, _root);
            this.fontRevision = new Fixed(this._io, this, _root);
            this.checksumAdjustment = this._io.readU4be();
            this.magicNumber = this._io.readBytes(4);
            if (!(Arrays.equals(magicNumber(), new byte[] { 95, 15, 60, -11 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 95, 15, 60, -11 }, magicNumber(), _io(), "/types/head/seq/3");
            }
            this.flags = Flags.byId(this._io.readU2be());
            this.unitsPerEm = this._io.readU2be();
            this.created = this._io.readU8be();
            this.modified = this._io.readU8be();
            this.xMin = this._io.readS2be();
            this.yMin = this._io.readS2be();
            this.xMax = this._io.readS2be();
            this.yMax = this._io.readS2be();
            this.macStyle = this._io.readU2be();
            this.lowestRecPpem = this._io.readU2be();
            this.fontDirectionHint = FontDirectionHint.byId(this._io.readS2be());
            this.indexToLocFormat = this._io.readS2be();
            this.glyphDataFormat = this._io.readS2be();
        }
        private Fixed version;
        private Fixed fontRevision;
        private long checksumAdjustment;
        private byte[] magicNumber;
        private Flags flags;
        private int unitsPerEm;
        private long created;
        private long modified;
        private short xMin;
        private short yMin;
        private short xMax;
        private short yMax;
        private int macStyle;
        private int lowestRecPpem;
        private FontDirectionHint fontDirectionHint;
        private short indexToLocFormat;
        private short glyphDataFormat;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public Fixed version() { return version; }
        public Fixed fontRevision() { return fontRevision; }
        public long checksumAdjustment() { return checksumAdjustment; }
        public byte[] magicNumber() { return magicNumber; }
        public Flags flags() { return flags; }
        public int unitsPerEm() { return unitsPerEm; }
        public long created() { return created; }
        public long modified() { return modified; }
        public short xMin() { return xMin; }
        public short yMin() { return yMin; }
        public short xMax() { return xMax; }
        public short yMax() { return yMax; }
        public int macStyle() { return macStyle; }
        public int lowestRecPpem() { return lowestRecPpem; }
        public FontDirectionHint fontDirectionHint() { return fontDirectionHint; }
        public short indexToLocFormat() { return indexToLocFormat; }
        public short glyphDataFormat() { return glyphDataFormat; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Prep extends KaitaiStruct {
        public static Prep fromFile(String fileName) throws IOException {
            return new Prep(new ByteBufferKaitaiStream(fileName));
        }

        public Prep(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Prep(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Prep(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.instructions = this._io.readBytesFull();
        }
        private byte[] instructions;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public byte[] instructions() { return instructions; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Hhea extends KaitaiStruct {
        public static Hhea fromFile(String fileName) throws IOException {
            return new Hhea(new ByteBufferKaitaiStream(fileName));
        }

        public Hhea(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Hhea(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Hhea(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = new Fixed(this._io, this, _root);
            this.ascender = this._io.readS2be();
            this.descender = this._io.readS2be();
            this.lineGap = this._io.readS2be();
            this.advanceWidthMax = this._io.readU2be();
            this.minLeftSideBearing = this._io.readS2be();
            this.minRightSideBearing = this._io.readS2be();
            this.xMaxExtend = this._io.readS2be();
            this.caretSlopeRise = this._io.readS2be();
            this.caretSlopeRun = this._io.readS2be();
            this.reserved = this._io.readBytes(10);
            if (!(Arrays.equals(reserved(), new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, reserved(), _io(), "/types/hhea/seq/10");
            }
            this.metricDataFormat = this._io.readS2be();
            this.numberOfHmetrics = this._io.readU2be();
        }
        private Fixed version;
        private short ascender;
        private short descender;
        private short lineGap;
        private int advanceWidthMax;
        private short minLeftSideBearing;
        private short minRightSideBearing;
        private short xMaxExtend;
        private short caretSlopeRise;
        private short caretSlopeRun;
        private byte[] reserved;
        private short metricDataFormat;
        private int numberOfHmetrics;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public Fixed version() { return version; }

        /**
         * Typographic ascent
         */
        public short ascender() { return ascender; }

        /**
         * Typographic descent
         */
        public short descender() { return descender; }

        /**
         * Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
         */
        public short lineGap() { return lineGap; }

        /**
         * Maximum advance width value in `hmtx` table.
         */
        public int advanceWidthMax() { return advanceWidthMax; }

        /**
         * Minimum left sidebearing value in `hmtx` table.
         */
        public short minLeftSideBearing() { return minLeftSideBearing; }

        /**
         * Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
         */
        public short minRightSideBearing() { return minRightSideBearing; }

        /**
         * Max(lsb + (xMax - xMin)).
         */
        public short xMaxExtend() { return xMaxExtend; }
        public short caretSlopeRise() { return caretSlopeRise; }
        public short caretSlopeRun() { return caretSlopeRun; }
        public byte[] reserved() { return reserved; }
        public short metricDataFormat() { return metricDataFormat; }
        public int numberOfHmetrics() { return numberOfHmetrics; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Fpgm extends KaitaiStruct {
        public static Fpgm fromFile(String fileName) throws IOException {
            return new Fpgm(new ByteBufferKaitaiStream(fileName));
        }

        public Fpgm(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Fpgm(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Fpgm(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.instructions = this._io.readBytesFull();
        }
        private byte[] instructions;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public byte[] instructions() { return instructions; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Kern extends KaitaiStruct {
        public static Kern fromFile(String fileName) throws IOException {
            return new Kern(new ByteBufferKaitaiStream(fileName));
        }

        public Kern(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Kern(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Kern(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU2be();
            this.subtableCount = this._io.readU2be();
            this.subtables = new ArrayList<Subtable>();
            for (int i = 0; i < subtableCount(); i++) {
                this.subtables.add(new Subtable(this._io, this, _root));
            }
        }
        public static class Subtable extends KaitaiStruct {
            public static Subtable fromFile(String fileName) throws IOException {
                return new Subtable(new ByteBufferKaitaiStream(fileName));
            }

            public Subtable(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Kern _parent) {
                this(_io, _parent, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Kern _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.version = this._io.readU2be();
                this.length = this._io.readU2be();
                this.format = this._io.readU1();
                this.reserved = this._io.readBitsIntBe(4);
                this.isOverride = this._io.readBitsIntBe(1) != 0;
                this.isCrossStream = this._io.readBitsIntBe(1) != 0;
                this.isMinimum = this._io.readBitsIntBe(1) != 0;
                this.isHorizontal = this._io.readBitsIntBe(1) != 0;
                this._io.alignToByte();
                if (format() == 0) {
                    this.format0 = new Format0(this._io, this, _root);
                }
            }
            public static class Format0 extends KaitaiStruct {
                public static Format0 fromFile(String fileName) throws IOException {
                    return new Format0(new ByteBufferKaitaiStream(fileName));
                }

                public Format0(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Format0(KaitaiStream _io, Ttf.Kern.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public Format0(KaitaiStream _io, Ttf.Kern.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.pairCount = this._io.readU2be();
                    this.searchRange = this._io.readU2be();
                    this.entrySelector = this._io.readU2be();
                    this.rangeShift = this._io.readU2be();
                    this.kerningPairs = new ArrayList<KerningPair>();
                    for (int i = 0; i < pairCount(); i++) {
                        this.kerningPairs.add(new KerningPair(this._io, this, _root));
                    }
                }
                public static class KerningPair extends KaitaiStruct {
                    public static KerningPair fromFile(String fileName) throws IOException {
                        return new KerningPair(new ByteBufferKaitaiStream(fileName));
                    }

                    public KerningPair(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public KerningPair(KaitaiStream _io, Ttf.Kern.Subtable.Format0 _parent) {
                        this(_io, _parent, null);
                    }

                    public KerningPair(KaitaiStream _io, Ttf.Kern.Subtable.Format0 _parent, Ttf _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        _read();
                    }
                    private void _read() {
                        this.left = this._io.readU2be();
                        this.right = this._io.readU2be();
                        this.value = this._io.readS2be();
                    }
                    private int left;
                    private int right;
                    private short value;
                    private Ttf _root;
                    private Ttf.Kern.Subtable.Format0 _parent;
                    public int left() { return left; }
                    public int right() { return right; }
                    public short value() { return value; }
                    public Ttf _root() { return _root; }
                    public Ttf.Kern.Subtable.Format0 _parent() { return _parent; }
                }
                private int pairCount;
                private int searchRange;
                private int entrySelector;
                private int rangeShift;
                private ArrayList<KerningPair> kerningPairs;
                private Ttf _root;
                private Ttf.Kern.Subtable _parent;
                public int pairCount() { return pairCount; }
                public int searchRange() { return searchRange; }
                public int entrySelector() { return entrySelector; }
                public int rangeShift() { return rangeShift; }
                public ArrayList<KerningPair> kerningPairs() { return kerningPairs; }
                public Ttf _root() { return _root; }
                public Ttf.Kern.Subtable _parent() { return _parent; }
            }
            private int version;
            private int length;
            private int format;
            private long reserved;
            private boolean isOverride;
            private boolean isCrossStream;
            private boolean isMinimum;
            private boolean isHorizontal;
            private Format0 format0;
            private Ttf _root;
            private Ttf.Kern _parent;
            public int version() { return version; }
            public int length() { return length; }
            public int format() { return format; }
            public long reserved() { return reserved; }
            public boolean isOverride() { return isOverride; }
            public boolean isCrossStream() { return isCrossStream; }
            public boolean isMinimum() { return isMinimum; }
            public boolean isHorizontal() { return isHorizontal; }
            public Format0 format0() { return format0; }
            public Ttf _root() { return _root; }
            public Ttf.Kern _parent() { return _parent; }
        }
        private int version;
        private int subtableCount;
        private ArrayList<Subtable> subtables;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public int version() { return version; }
        public int subtableCount() { return subtableCount; }
        public ArrayList<Subtable> subtables() { return subtables; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class DirTableEntry extends KaitaiStruct {
        public static DirTableEntry fromFile(String fileName) throws IOException {
            return new DirTableEntry(new ByteBufferKaitaiStream(fileName));
        }

        public DirTableEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DirTableEntry(KaitaiStream _io, Ttf _parent) {
            this(_io, _parent, null);
        }

        public DirTableEntry(KaitaiStream _io, Ttf _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tag = new String(this._io.readBytes(4), Charset.forName("ascii"));
            this.checksum = this._io.readU4be();
            this.offset = this._io.readU4be();
            this.length = this._io.readU4be();
        }
        private Object value;
        public Object value() {
            if (this.value != null)
                return this.value;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            switch (tag()) {
            case "head": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Head(_io__raw_value, this, _root);
                break;
            }
            case "cvt ": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Cvt(_io__raw_value, this, _root);
                break;
            }
            case "prep": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Prep(_io__raw_value, this, _root);
                break;
            }
            case "kern": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Kern(_io__raw_value, this, _root);
                break;
            }
            case "hhea": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Hhea(_io__raw_value, this, _root);
                break;
            }
            case "post": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Post(_io__raw_value, this, _root);
                break;
            }
            case "OS/2": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Os2(_io__raw_value, this, _root);
                break;
            }
            case "name": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Name(_io__raw_value, this, _root);
                break;
            }
            case "maxp": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Maxp(_io__raw_value, this, _root);
                break;
            }
            case "glyf": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Glyf(_io__raw_value, this, _root);
                break;
            }
            case "fpgm": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Fpgm(_io__raw_value, this, _root);
                break;
            }
            case "cmap": {
                this._raw_value = io.readBytes(length());
                KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                this.value = new Cmap(_io__raw_value, this, _root);
                break;
            }
            default: {
                this.value = io.readBytes(length());
                break;
            }
            }
            io.seek(_pos);
            return this.value;
        }
        private String tag;
        private long checksum;
        private long offset;
        private long length;
        private Ttf _root;
        private Ttf _parent;
        private byte[] _raw_value;
        public String tag() { return tag; }
        public long checksum() { return checksum; }
        public long offset() { return offset; }
        public long length() { return length; }
        public Ttf _root() { return _root; }
        public Ttf _parent() { return _parent; }
        public byte[] _raw_value() { return _raw_value; }
    }

    /**
     * The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
     */
    public static class Os2 extends KaitaiStruct {
        public static Os2 fromFile(String fileName) throws IOException {
            return new Os2(new ByteBufferKaitaiStream(fileName));
        }

        public enum WeightClass {
            THIN(100),
            EXTRA_LIGHT(200),
            LIGHT(300),
            NORMAL(400),
            MEDIUM(500),
            SEMI_BOLD(600),
            BOLD(700),
            EXTRA_BOLD(800),
            BLACK(900);

            private final long id;
            WeightClass(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, WeightClass> byId = new HashMap<Long, WeightClass>(9);
            static {
                for (WeightClass e : WeightClass.values())
                    byId.put(e.id(), e);
            }
            public static WeightClass byId(long id) { return byId.get(id); }
        }

        public enum WidthClass {
            ULTRA_CONDENSED(1),
            EXTRA_CONDENSED(2),
            CONDENSED(3),
            SEMI_CONDENSED(4),
            NORMAL(5),
            SEMI_EXPANDED(6),
            EXPANDED(7),
            EXTRA_EXPANDED(8),
            ULTRA_EXPANDED(9);

            private final long id;
            WidthClass(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, WidthClass> byId = new HashMap<Long, WidthClass>(9);
            static {
                for (WidthClass e : WidthClass.values())
                    byId.put(e.id(), e);
            }
            public static WidthClass byId(long id) { return byId.get(id); }
        }

        public enum FsType {
            RESTRICTED_LICENSE_EMBEDDING(2),
            PREVIEW_AND_PRINT_EMBEDDING(4),
            EDITABLE_EMBEDDING(8);

            private final long id;
            FsType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FsType> byId = new HashMap<Long, FsType>(3);
            static {
                for (FsType e : FsType.values())
                    byId.put(e.id(), e);
            }
            public static FsType byId(long id) { return byId.get(id); }
        }

        public enum FsSelection {
            ITALIC(1),
            UNDERSCORE(2),
            NEGATIVE(4),
            OUTLINED(8),
            STRIKEOUT(16),
            BOLD(32),
            REGULAR(64);

            private final long id;
            FsSelection(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FsSelection> byId = new HashMap<Long, FsSelection>(7);
            static {
                for (FsSelection e : FsSelection.values())
                    byId.put(e.id(), e);
            }
            public static FsSelection byId(long id) { return byId.get(id); }
        }

        public Os2(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Os2(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Os2(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU2be();
            this.xAvgCharWidth = this._io.readS2be();
            this.weightClass = WeightClass.byId(this._io.readU2be());
            this.widthClass = WidthClass.byId(this._io.readU2be());
            this.fsType = FsType.byId(this._io.readS2be());
            this.ySubscriptXSize = this._io.readS2be();
            this.ySubscriptYSize = this._io.readS2be();
            this.ySubscriptXOffset = this._io.readS2be();
            this.ySubscriptYOffset = this._io.readS2be();
            this.ySuperscriptXSize = this._io.readS2be();
            this.ySuperscriptYSize = this._io.readS2be();
            this.ySuperscriptXOffset = this._io.readS2be();
            this.ySuperscriptYOffset = this._io.readS2be();
            this.yStrikeoutSize = this._io.readS2be();
            this.yStrikeoutPosition = this._io.readS2be();
            this.sFamilyClass = this._io.readS2be();
            this.panose = new Panose(this._io, this, _root);
            this.unicodeRange = new UnicodeRange(this._io, this, _root);
            this.achVendId = new String(this._io.readBytes(4), Charset.forName("ascii"));
            this.selection = FsSelection.byId(this._io.readU2be());
            this.firstCharIndex = this._io.readU2be();
            this.lastCharIndex = this._io.readU2be();
            this.typoAscender = this._io.readS2be();
            this.typoDescender = this._io.readS2be();
            this.typoLineGap = this._io.readS2be();
            this.winAscent = this._io.readU2be();
            this.winDescent = this._io.readU2be();
            this.codePageRange = new CodePageRange(this._io, this, _root);
        }
        public static class Panose extends KaitaiStruct {
            public static Panose fromFile(String fileName) throws IOException {
                return new Panose(new ByteBufferKaitaiStream(fileName));
            }

            public enum Weight {
                ANY(0),
                NO_FIT(1),
                VERY_LIGHT(2),
                LIGHT(3),
                THIN(4),
                BOOK(5),
                MEDIUM(6),
                DEMI(7),
                BOLD(8),
                HEAVY(9),
                BLACK(10),
                NORD(11);

                private final long id;
                Weight(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Weight> byId = new HashMap<Long, Weight>(12);
                static {
                    for (Weight e : Weight.values())
                        byId.put(e.id(), e);
                }
                public static Weight byId(long id) { return byId.get(id); }
            }

            public enum Proportion {
                ANY(0),
                NO_FIT(1),
                OLD_STYLE(2),
                MODERN(3),
                EVEN_WIDTH(4),
                EXPANDED(5),
                CONDENSED(6),
                VERY_EXPANDED(7),
                VERY_CONDENSED(8),
                MONOSPACED(9);

                private final long id;
                Proportion(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Proportion> byId = new HashMap<Long, Proportion>(10);
                static {
                    for (Proportion e : Proportion.values())
                        byId.put(e.id(), e);
                }
                public static Proportion byId(long id) { return byId.get(id); }
            }

            public enum FamilyKind {
                ANY(0),
                NO_FIT(1),
                TEXT_AND_DISPLAY(2),
                SCRIPT(3),
                DECORATIVE(4),
                PICTORIAL(5);

                private final long id;
                FamilyKind(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, FamilyKind> byId = new HashMap<Long, FamilyKind>(6);
                static {
                    for (FamilyKind e : FamilyKind.values())
                        byId.put(e.id(), e);
                }
                public static FamilyKind byId(long id) { return byId.get(id); }
            }

            public enum LetterForm {
                ANY(0),
                NO_FIT(1),
                NORMAL_CONTACT(2),
                NORMAL_WEIGHTED(3),
                NORMAL_BOXED(4),
                NORMAL_FLATTENED(5),
                NORMAL_ROUNDED(6),
                NORMAL_OFF_CENTER(7),
                NORMAL_SQUARE(8),
                OBLIQUE_CONTACT(9),
                OBLIQUE_WEIGHTED(10),
                OBLIQUE_BOXED(11),
                OBLIQUE_FLATTENED(12),
                OBLIQUE_ROUNDED(13),
                OBLIQUE_OFF_CENTER(14),
                OBLIQUE_SQUARE(15);

                private final long id;
                LetterForm(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, LetterForm> byId = new HashMap<Long, LetterForm>(16);
                static {
                    for (LetterForm e : LetterForm.values())
                        byId.put(e.id(), e);
                }
                public static LetterForm byId(long id) { return byId.get(id); }
            }

            public enum SerifStyle {
                ANY(0),
                NO_FIT(1),
                COVE(2),
                OBTUSE_COVE(3),
                SQUARE_COVE(4),
                OBTUSE_SQUARE_COVE(5),
                SQUARE(6),
                THIN(7),
                BONE(8),
                EXAGGERATED(9),
                TRIANGLE(10),
                NORMAL_SANS(11),
                OBTUSE_SANS(12),
                PERP_SANS(13),
                FLARED(14),
                ROUNDED(15);

                private final long id;
                SerifStyle(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, SerifStyle> byId = new HashMap<Long, SerifStyle>(16);
                static {
                    for (SerifStyle e : SerifStyle.values())
                        byId.put(e.id(), e);
                }
                public static SerifStyle byId(long id) { return byId.get(id); }
            }

            public enum XHeight {
                ANY(0),
                NO_FIT(1),
                CONSTANT_SMALL(2),
                CONSTANT_STANDARD(3),
                CONSTANT_LARGE(4),
                DUCKING_SMALL(5),
                DUCKING_STANDARD(6),
                DUCKING_LARGE(7);

                private final long id;
                XHeight(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, XHeight> byId = new HashMap<Long, XHeight>(8);
                static {
                    for (XHeight e : XHeight.values())
                        byId.put(e.id(), e);
                }
                public static XHeight byId(long id) { return byId.get(id); }
            }

            public enum ArmStyle {
                ANY(0),
                NO_FIT(1),
                STRAIGHT_ARMS_HORIZONTAL(2),
                STRAIGHT_ARMS_WEDGE(3),
                STRAIGHT_ARMS_VERTICAL(4),
                STRAIGHT_ARMS_SINGLE_SERIF(5),
                STRAIGHT_ARMS_DOUBLE_SERIF(6),
                NON_STRAIGHT_ARMS_HORIZONTAL(7),
                NON_STRAIGHT_ARMS_WEDGE(8),
                NON_STRAIGHT_ARMS_VERTICAL(9),
                NON_STRAIGHT_ARMS_SINGLE_SERIF(10),
                NON_STRAIGHT_ARMS_DOUBLE_SERIF(11);

                private final long id;
                ArmStyle(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, ArmStyle> byId = new HashMap<Long, ArmStyle>(12);
                static {
                    for (ArmStyle e : ArmStyle.values())
                        byId.put(e.id(), e);
                }
                public static ArmStyle byId(long id) { return byId.get(id); }
            }

            public enum StrokeVariation {
                ANY(0),
                NO_FIT(1),
                GRADUAL_DIAGONAL(2),
                GRADUAL_TRANSITIONAL(3),
                GRADUAL_VERTICAL(4),
                GRADUAL_HORIZONTAL(5),
                RAPID_VERTICAL(6),
                RAPID_HORIZONTAL(7),
                INSTANT_VERTICAL(8);

                private final long id;
                StrokeVariation(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, StrokeVariation> byId = new HashMap<Long, StrokeVariation>(9);
                static {
                    for (StrokeVariation e : StrokeVariation.values())
                        byId.put(e.id(), e);
                }
                public static StrokeVariation byId(long id) { return byId.get(id); }
            }

            public enum Contrast {
                ANY(0),
                NO_FIT(1),
                NONE(2),
                VERY_LOW(3),
                LOW(4),
                MEDIUM_LOW(5),
                MEDIUM(6),
                MEDIUM_HIGH(7),
                HIGH(8),
                VERY_HIGH(9);

                private final long id;
                Contrast(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Contrast> byId = new HashMap<Long, Contrast>(10);
                static {
                    for (Contrast e : Contrast.values())
                        byId.put(e.id(), e);
                }
                public static Contrast byId(long id) { return byId.get(id); }
            }

            public enum Midline {
                ANY(0),
                NO_FIT(1),
                STANDARD_TRIMMED(2),
                STANDARD_POINTED(3),
                STANDARD_SERIFED(4),
                HIGH_TRIMMED(5),
                HIGH_POINTED(6),
                HIGH_SERIFED(7),
                CONSTANT_TRIMMED(8),
                CONSTANT_POINTED(9),
                CONSTANT_SERIFED(10),
                LOW_TRIMMED(11),
                LOW_POINTED(12),
                LOW_SERIFED(13);

                private final long id;
                Midline(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Midline> byId = new HashMap<Long, Midline>(14);
                static {
                    for (Midline e : Midline.values())
                        byId.put(e.id(), e);
                }
                public static Midline byId(long id) { return byId.get(id); }
            }

            public Panose(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Panose(KaitaiStream _io, Ttf.Os2 _parent) {
                this(_io, _parent, null);
            }

            public Panose(KaitaiStream _io, Ttf.Os2 _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.familyType = FamilyKind.byId(this._io.readU1());
                this.serifStyle = SerifStyle.byId(this._io.readU1());
                this.weight = Weight.byId(this._io.readU1());
                this.proportion = Proportion.byId(this._io.readU1());
                this.contrast = Contrast.byId(this._io.readU1());
                this.strokeVariation = StrokeVariation.byId(this._io.readU1());
                this.armStyle = ArmStyle.byId(this._io.readU1());
                this.letterForm = LetterForm.byId(this._io.readU1());
                this.midline = Midline.byId(this._io.readU1());
                this.xHeight = XHeight.byId(this._io.readU1());
            }
            private FamilyKind familyType;
            private SerifStyle serifStyle;
            private Weight weight;
            private Proportion proportion;
            private Contrast contrast;
            private StrokeVariation strokeVariation;
            private ArmStyle armStyle;
            private LetterForm letterForm;
            private Midline midline;
            private XHeight xHeight;
            private Ttf _root;
            private Ttf.Os2 _parent;
            public FamilyKind familyType() { return familyType; }
            public SerifStyle serifStyle() { return serifStyle; }
            public Weight weight() { return weight; }
            public Proportion proportion() { return proportion; }
            public Contrast contrast() { return contrast; }
            public StrokeVariation strokeVariation() { return strokeVariation; }
            public ArmStyle armStyle() { return armStyle; }
            public LetterForm letterForm() { return letterForm; }
            public Midline midline() { return midline; }
            public XHeight xHeight() { return xHeight; }
            public Ttf _root() { return _root; }
            public Ttf.Os2 _parent() { return _parent; }
        }
        public static class UnicodeRange extends KaitaiStruct {
            public static UnicodeRange fromFile(String fileName) throws IOException {
                return new UnicodeRange(new ByteBufferKaitaiStream(fileName));
            }

            public UnicodeRange(KaitaiStream _io) {
                this(_io, null, null);
            }

            public UnicodeRange(KaitaiStream _io, Ttf.Os2 _parent) {
                this(_io, _parent, null);
            }

            public UnicodeRange(KaitaiStream _io, Ttf.Os2 _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.basicLatin = this._io.readBitsIntBe(1) != 0;
                this.latin1Supplement = this._io.readBitsIntBe(1) != 0;
                this.latinExtendedA = this._io.readBitsIntBe(1) != 0;
                this.latinExtendedB = this._io.readBitsIntBe(1) != 0;
                this.ipaExtensions = this._io.readBitsIntBe(1) != 0;
                this.spacingModifierLetters = this._io.readBitsIntBe(1) != 0;
                this.combiningDiacriticalMarks = this._io.readBitsIntBe(1) != 0;
                this.basicGreek = this._io.readBitsIntBe(1) != 0;
                this.greekSymbolsAndCoptic = this._io.readBitsIntBe(1) != 0;
                this.cyrillic = this._io.readBitsIntBe(1) != 0;
                this.armenian = this._io.readBitsIntBe(1) != 0;
                this.basicHebrew = this._io.readBitsIntBe(1) != 0;
                this.hebrewExtended = this._io.readBitsIntBe(1) != 0;
                this.basicArabic = this._io.readBitsIntBe(1) != 0;
                this.arabicExtended = this._io.readBitsIntBe(1) != 0;
                this.devanagari = this._io.readBitsIntBe(1) != 0;
                this.bengali = this._io.readBitsIntBe(1) != 0;
                this.gurmukhi = this._io.readBitsIntBe(1) != 0;
                this.gujarati = this._io.readBitsIntBe(1) != 0;
                this.oriya = this._io.readBitsIntBe(1) != 0;
                this.tamil = this._io.readBitsIntBe(1) != 0;
                this.telugu = this._io.readBitsIntBe(1) != 0;
                this.kannada = this._io.readBitsIntBe(1) != 0;
                this.malayalam = this._io.readBitsIntBe(1) != 0;
                this.thai = this._io.readBitsIntBe(1) != 0;
                this.lao = this._io.readBitsIntBe(1) != 0;
                this.basicGeorgian = this._io.readBitsIntBe(1) != 0;
                this.georgianExtended = this._io.readBitsIntBe(1) != 0;
                this.hangulJamo = this._io.readBitsIntBe(1) != 0;
                this.latinExtendedAdditional = this._io.readBitsIntBe(1) != 0;
                this.greekExtended = this._io.readBitsIntBe(1) != 0;
                this.generalPunctuation = this._io.readBitsIntBe(1) != 0;
                this.superscriptsAndSubscripts = this._io.readBitsIntBe(1) != 0;
                this.currencySymbols = this._io.readBitsIntBe(1) != 0;
                this.combiningDiacriticalMarksForSymbols = this._io.readBitsIntBe(1) != 0;
                this.letterlikeSymbols = this._io.readBitsIntBe(1) != 0;
                this.numberForms = this._io.readBitsIntBe(1) != 0;
                this.arrows = this._io.readBitsIntBe(1) != 0;
                this.mathematicalOperators = this._io.readBitsIntBe(1) != 0;
                this.miscellaneousTechnical = this._io.readBitsIntBe(1) != 0;
                this.controlPictures = this._io.readBitsIntBe(1) != 0;
                this.opticalCharacterRecognition = this._io.readBitsIntBe(1) != 0;
                this.enclosedAlphanumerics = this._io.readBitsIntBe(1) != 0;
                this.boxDrawing = this._io.readBitsIntBe(1) != 0;
                this.blockElements = this._io.readBitsIntBe(1) != 0;
                this.geometricShapes = this._io.readBitsIntBe(1) != 0;
                this.miscellaneousSymbols = this._io.readBitsIntBe(1) != 0;
                this.dingbats = this._io.readBitsIntBe(1) != 0;
                this.cjkSymbolsAndPunctuation = this._io.readBitsIntBe(1) != 0;
                this.hiragana = this._io.readBitsIntBe(1) != 0;
                this.katakana = this._io.readBitsIntBe(1) != 0;
                this.bopomofo = this._io.readBitsIntBe(1) != 0;
                this.hangulCompatibilityJamo = this._io.readBitsIntBe(1) != 0;
                this.cjkMiscellaneous = this._io.readBitsIntBe(1) != 0;
                this.enclosedCjkLettersAndMonths = this._io.readBitsIntBe(1) != 0;
                this.cjkCompatibility = this._io.readBitsIntBe(1) != 0;
                this.hangul = this._io.readBitsIntBe(1) != 0;
                this.reservedForUnicodeSubranges1 = this._io.readBitsIntBe(1) != 0;
                this.reservedForUnicodeSubranges2 = this._io.readBitsIntBe(1) != 0;
                this.cjkUnifiedIdeographs = this._io.readBitsIntBe(1) != 0;
                this.privateUseArea = this._io.readBitsIntBe(1) != 0;
                this.cjkCompatibilityIdeographs = this._io.readBitsIntBe(1) != 0;
                this.alphabeticPresentationForms = this._io.readBitsIntBe(1) != 0;
                this.arabicPresentationFormsA = this._io.readBitsIntBe(1) != 0;
                this.combiningHalfMarks = this._io.readBitsIntBe(1) != 0;
                this.cjkCompatibilityForms = this._io.readBitsIntBe(1) != 0;
                this.smallFormVariants = this._io.readBitsIntBe(1) != 0;
                this.arabicPresentationFormsB = this._io.readBitsIntBe(1) != 0;
                this.halfwidthAndFullwidthForms = this._io.readBitsIntBe(1) != 0;
                this.specials = this._io.readBitsIntBe(1) != 0;
                this._io.alignToByte();
                this.reserved = this._io.readBytes(7);
            }
            private boolean basicLatin;
            private boolean latin1Supplement;
            private boolean latinExtendedA;
            private boolean latinExtendedB;
            private boolean ipaExtensions;
            private boolean spacingModifierLetters;
            private boolean combiningDiacriticalMarks;
            private boolean basicGreek;
            private boolean greekSymbolsAndCoptic;
            private boolean cyrillic;
            private boolean armenian;
            private boolean basicHebrew;
            private boolean hebrewExtended;
            private boolean basicArabic;
            private boolean arabicExtended;
            private boolean devanagari;
            private boolean bengali;
            private boolean gurmukhi;
            private boolean gujarati;
            private boolean oriya;
            private boolean tamil;
            private boolean telugu;
            private boolean kannada;
            private boolean malayalam;
            private boolean thai;
            private boolean lao;
            private boolean basicGeorgian;
            private boolean georgianExtended;
            private boolean hangulJamo;
            private boolean latinExtendedAdditional;
            private boolean greekExtended;
            private boolean generalPunctuation;
            private boolean superscriptsAndSubscripts;
            private boolean currencySymbols;
            private boolean combiningDiacriticalMarksForSymbols;
            private boolean letterlikeSymbols;
            private boolean numberForms;
            private boolean arrows;
            private boolean mathematicalOperators;
            private boolean miscellaneousTechnical;
            private boolean controlPictures;
            private boolean opticalCharacterRecognition;
            private boolean enclosedAlphanumerics;
            private boolean boxDrawing;
            private boolean blockElements;
            private boolean geometricShapes;
            private boolean miscellaneousSymbols;
            private boolean dingbats;
            private boolean cjkSymbolsAndPunctuation;
            private boolean hiragana;
            private boolean katakana;
            private boolean bopomofo;
            private boolean hangulCompatibilityJamo;
            private boolean cjkMiscellaneous;
            private boolean enclosedCjkLettersAndMonths;
            private boolean cjkCompatibility;
            private boolean hangul;
            private boolean reservedForUnicodeSubranges1;
            private boolean reservedForUnicodeSubranges2;
            private boolean cjkUnifiedIdeographs;
            private boolean privateUseArea;
            private boolean cjkCompatibilityIdeographs;
            private boolean alphabeticPresentationForms;
            private boolean arabicPresentationFormsA;
            private boolean combiningHalfMarks;
            private boolean cjkCompatibilityForms;
            private boolean smallFormVariants;
            private boolean arabicPresentationFormsB;
            private boolean halfwidthAndFullwidthForms;
            private boolean specials;
            private byte[] reserved;
            private Ttf _root;
            private Ttf.Os2 _parent;
            public boolean basicLatin() { return basicLatin; }
            public boolean latin1Supplement() { return latin1Supplement; }
            public boolean latinExtendedA() { return latinExtendedA; }
            public boolean latinExtendedB() { return latinExtendedB; }
            public boolean ipaExtensions() { return ipaExtensions; }
            public boolean spacingModifierLetters() { return spacingModifierLetters; }
            public boolean combiningDiacriticalMarks() { return combiningDiacriticalMarks; }
            public boolean basicGreek() { return basicGreek; }
            public boolean greekSymbolsAndCoptic() { return greekSymbolsAndCoptic; }
            public boolean cyrillic() { return cyrillic; }
            public boolean armenian() { return armenian; }
            public boolean basicHebrew() { return basicHebrew; }
            public boolean hebrewExtended() { return hebrewExtended; }
            public boolean basicArabic() { return basicArabic; }
            public boolean arabicExtended() { return arabicExtended; }
            public boolean devanagari() { return devanagari; }
            public boolean bengali() { return bengali; }
            public boolean gurmukhi() { return gurmukhi; }
            public boolean gujarati() { return gujarati; }
            public boolean oriya() { return oriya; }
            public boolean tamil() { return tamil; }
            public boolean telugu() { return telugu; }
            public boolean kannada() { return kannada; }
            public boolean malayalam() { return malayalam; }
            public boolean thai() { return thai; }
            public boolean lao() { return lao; }
            public boolean basicGeorgian() { return basicGeorgian; }
            public boolean georgianExtended() { return georgianExtended; }
            public boolean hangulJamo() { return hangulJamo; }
            public boolean latinExtendedAdditional() { return latinExtendedAdditional; }
            public boolean greekExtended() { return greekExtended; }
            public boolean generalPunctuation() { return generalPunctuation; }
            public boolean superscriptsAndSubscripts() { return superscriptsAndSubscripts; }
            public boolean currencySymbols() { return currencySymbols; }
            public boolean combiningDiacriticalMarksForSymbols() { return combiningDiacriticalMarksForSymbols; }
            public boolean letterlikeSymbols() { return letterlikeSymbols; }
            public boolean numberForms() { return numberForms; }
            public boolean arrows() { return arrows; }
            public boolean mathematicalOperators() { return mathematicalOperators; }
            public boolean miscellaneousTechnical() { return miscellaneousTechnical; }
            public boolean controlPictures() { return controlPictures; }
            public boolean opticalCharacterRecognition() { return opticalCharacterRecognition; }
            public boolean enclosedAlphanumerics() { return enclosedAlphanumerics; }
            public boolean boxDrawing() { return boxDrawing; }
            public boolean blockElements() { return blockElements; }
            public boolean geometricShapes() { return geometricShapes; }
            public boolean miscellaneousSymbols() { return miscellaneousSymbols; }
            public boolean dingbats() { return dingbats; }
            public boolean cjkSymbolsAndPunctuation() { return cjkSymbolsAndPunctuation; }
            public boolean hiragana() { return hiragana; }
            public boolean katakana() { return katakana; }
            public boolean bopomofo() { return bopomofo; }
            public boolean hangulCompatibilityJamo() { return hangulCompatibilityJamo; }
            public boolean cjkMiscellaneous() { return cjkMiscellaneous; }
            public boolean enclosedCjkLettersAndMonths() { return enclosedCjkLettersAndMonths; }
            public boolean cjkCompatibility() { return cjkCompatibility; }
            public boolean hangul() { return hangul; }
            public boolean reservedForUnicodeSubranges1() { return reservedForUnicodeSubranges1; }
            public boolean reservedForUnicodeSubranges2() { return reservedForUnicodeSubranges2; }
            public boolean cjkUnifiedIdeographs() { return cjkUnifiedIdeographs; }
            public boolean privateUseArea() { return privateUseArea; }
            public boolean cjkCompatibilityIdeographs() { return cjkCompatibilityIdeographs; }
            public boolean alphabeticPresentationForms() { return alphabeticPresentationForms; }
            public boolean arabicPresentationFormsA() { return arabicPresentationFormsA; }
            public boolean combiningHalfMarks() { return combiningHalfMarks; }
            public boolean cjkCompatibilityForms() { return cjkCompatibilityForms; }
            public boolean smallFormVariants() { return smallFormVariants; }
            public boolean arabicPresentationFormsB() { return arabicPresentationFormsB; }
            public boolean halfwidthAndFullwidthForms() { return halfwidthAndFullwidthForms; }
            public boolean specials() { return specials; }
            public byte[] reserved() { return reserved; }
            public Ttf _root() { return _root; }
            public Ttf.Os2 _parent() { return _parent; }
        }
        public static class CodePageRange extends KaitaiStruct {
            public static CodePageRange fromFile(String fileName) throws IOException {
                return new CodePageRange(new ByteBufferKaitaiStream(fileName));
            }

            public CodePageRange(KaitaiStream _io) {
                this(_io, null, null);
            }

            public CodePageRange(KaitaiStream _io, Ttf.Os2 _parent) {
                this(_io, _parent, null);
            }

            public CodePageRange(KaitaiStream _io, Ttf.Os2 _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.symbolCharacterSet = this._io.readBitsIntBe(1) != 0;
                this.oemCharacterSet = this._io.readBitsIntBe(1) != 0;
                this.macintoshCharacterSet = this._io.readBitsIntBe(1) != 0;
                this.reservedForAlternateAnsiOem = this._io.readBitsIntBe(7);
                this.cp1361KoreanJohab = this._io.readBitsIntBe(1) != 0;
                this.cp950ChineseTraditionalCharsTaiwanAndHongKong = this._io.readBitsIntBe(1) != 0;
                this.cp949KoreanWansung = this._io.readBitsIntBe(1) != 0;
                this.cp936ChineseSimplifiedCharsPrcAndSingapore = this._io.readBitsIntBe(1) != 0;
                this.cp932JisJapan = this._io.readBitsIntBe(1) != 0;
                this.cp874Thai = this._io.readBitsIntBe(1) != 0;
                this.reservedForAlternateAnsi = this._io.readBitsIntBe(8);
                this.cp1257WindowsBaltic = this._io.readBitsIntBe(1) != 0;
                this.cp1256Arabic = this._io.readBitsIntBe(1) != 0;
                this.cp1255Hebrew = this._io.readBitsIntBe(1) != 0;
                this.cp1254Turkish = this._io.readBitsIntBe(1) != 0;
                this.cp1253Greek = this._io.readBitsIntBe(1) != 0;
                this.cp1251Cyrillic = this._io.readBitsIntBe(1) != 0;
                this.cp1250Latin2EasternEurope = this._io.readBitsIntBe(1) != 0;
                this.cp1252Latin1 = this._io.readBitsIntBe(1) != 0;
                this.cp437Us = this._io.readBitsIntBe(1) != 0;
                this.cp850WeLatin1 = this._io.readBitsIntBe(1) != 0;
                this.cp708ArabicAsmo708 = this._io.readBitsIntBe(1) != 0;
                this.cp737GreekFormer437G = this._io.readBitsIntBe(1) != 0;
                this.cp775MsDosBaltic = this._io.readBitsIntBe(1) != 0;
                this.cp852Latin2 = this._io.readBitsIntBe(1) != 0;
                this.cp855IbmCyrillicPrimarilyRussian = this._io.readBitsIntBe(1) != 0;
                this.cp857IbmTurkish = this._io.readBitsIntBe(1) != 0;
                this.cp860MsDosPortuguese = this._io.readBitsIntBe(1) != 0;
                this.cp861MsDosIcelandic = this._io.readBitsIntBe(1) != 0;
                this.cp862Hebrew = this._io.readBitsIntBe(1) != 0;
                this.cp863MsDosCanadianFrench = this._io.readBitsIntBe(1) != 0;
                this.cp864Arabic = this._io.readBitsIntBe(1) != 0;
                this.cp865MsDosNordic = this._io.readBitsIntBe(1) != 0;
                this.cp866MsDosRussian = this._io.readBitsIntBe(1) != 0;
                this.cp869IbmGreek = this._io.readBitsIntBe(1) != 0;
                this.reservedForOem = this._io.readBitsIntBe(16);
            }
            private boolean symbolCharacterSet;
            private boolean oemCharacterSet;
            private boolean macintoshCharacterSet;
            private long reservedForAlternateAnsiOem;
            private boolean cp1361KoreanJohab;
            private boolean cp950ChineseTraditionalCharsTaiwanAndHongKong;
            private boolean cp949KoreanWansung;
            private boolean cp936ChineseSimplifiedCharsPrcAndSingapore;
            private boolean cp932JisJapan;
            private boolean cp874Thai;
            private long reservedForAlternateAnsi;
            private boolean cp1257WindowsBaltic;
            private boolean cp1256Arabic;
            private boolean cp1255Hebrew;
            private boolean cp1254Turkish;
            private boolean cp1253Greek;
            private boolean cp1251Cyrillic;
            private boolean cp1250Latin2EasternEurope;
            private boolean cp1252Latin1;
            private boolean cp437Us;
            private boolean cp850WeLatin1;
            private boolean cp708ArabicAsmo708;
            private boolean cp737GreekFormer437G;
            private boolean cp775MsDosBaltic;
            private boolean cp852Latin2;
            private boolean cp855IbmCyrillicPrimarilyRussian;
            private boolean cp857IbmTurkish;
            private boolean cp860MsDosPortuguese;
            private boolean cp861MsDosIcelandic;
            private boolean cp862Hebrew;
            private boolean cp863MsDosCanadianFrench;
            private boolean cp864Arabic;
            private boolean cp865MsDosNordic;
            private boolean cp866MsDosRussian;
            private boolean cp869IbmGreek;
            private long reservedForOem;
            private Ttf _root;
            private Ttf.Os2 _parent;
            public boolean symbolCharacterSet() { return symbolCharacterSet; }
            public boolean oemCharacterSet() { return oemCharacterSet; }
            public boolean macintoshCharacterSet() { return macintoshCharacterSet; }
            public long reservedForAlternateAnsiOem() { return reservedForAlternateAnsiOem; }
            public boolean cp1361KoreanJohab() { return cp1361KoreanJohab; }
            public boolean cp950ChineseTraditionalCharsTaiwanAndHongKong() { return cp950ChineseTraditionalCharsTaiwanAndHongKong; }
            public boolean cp949KoreanWansung() { return cp949KoreanWansung; }
            public boolean cp936ChineseSimplifiedCharsPrcAndSingapore() { return cp936ChineseSimplifiedCharsPrcAndSingapore; }
            public boolean cp932JisJapan() { return cp932JisJapan; }
            public boolean cp874Thai() { return cp874Thai; }
            public long reservedForAlternateAnsi() { return reservedForAlternateAnsi; }
            public boolean cp1257WindowsBaltic() { return cp1257WindowsBaltic; }
            public boolean cp1256Arabic() { return cp1256Arabic; }
            public boolean cp1255Hebrew() { return cp1255Hebrew; }
            public boolean cp1254Turkish() { return cp1254Turkish; }
            public boolean cp1253Greek() { return cp1253Greek; }
            public boolean cp1251Cyrillic() { return cp1251Cyrillic; }
            public boolean cp1250Latin2EasternEurope() { return cp1250Latin2EasternEurope; }
            public boolean cp1252Latin1() { return cp1252Latin1; }
            public boolean cp437Us() { return cp437Us; }
            public boolean cp850WeLatin1() { return cp850WeLatin1; }
            public boolean cp708ArabicAsmo708() { return cp708ArabicAsmo708; }
            public boolean cp737GreekFormer437G() { return cp737GreekFormer437G; }
            public boolean cp775MsDosBaltic() { return cp775MsDosBaltic; }
            public boolean cp852Latin2() { return cp852Latin2; }
            public boolean cp855IbmCyrillicPrimarilyRussian() { return cp855IbmCyrillicPrimarilyRussian; }
            public boolean cp857IbmTurkish() { return cp857IbmTurkish; }
            public boolean cp860MsDosPortuguese() { return cp860MsDosPortuguese; }
            public boolean cp861MsDosIcelandic() { return cp861MsDosIcelandic; }
            public boolean cp862Hebrew() { return cp862Hebrew; }
            public boolean cp863MsDosCanadianFrench() { return cp863MsDosCanadianFrench; }
            public boolean cp864Arabic() { return cp864Arabic; }
            public boolean cp865MsDosNordic() { return cp865MsDosNordic; }
            public boolean cp866MsDosRussian() { return cp866MsDosRussian; }
            public boolean cp869IbmGreek() { return cp869IbmGreek; }
            public long reservedForOem() { return reservedForOem; }
            public Ttf _root() { return _root; }
            public Ttf.Os2 _parent() { return _parent; }
        }
        private int version;
        private short xAvgCharWidth;
        private WeightClass weightClass;
        private WidthClass widthClass;
        private FsType fsType;
        private short ySubscriptXSize;
        private short ySubscriptYSize;
        private short ySubscriptXOffset;
        private short ySubscriptYOffset;
        private short ySuperscriptXSize;
        private short ySuperscriptYSize;
        private short ySuperscriptXOffset;
        private short ySuperscriptYOffset;
        private short yStrikeoutSize;
        private short yStrikeoutPosition;
        private short sFamilyClass;
        private Panose panose;
        private UnicodeRange unicodeRange;
        private String achVendId;
        private FsSelection selection;
        private int firstCharIndex;
        private int lastCharIndex;
        private short typoAscender;
        private short typoDescender;
        private short typoLineGap;
        private int winAscent;
        private int winDescent;
        private CodePageRange codePageRange;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;

        /**
         * The version number for this OS/2 table.
         */
        public int version() { return version; }

        /**
         * The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
         */
        public short xAvgCharWidth() { return xAvgCharWidth; }

        /**
         * Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
         */
        public WeightClass weightClass() { return weightClass; }

        /**
         * Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
         */
        public WidthClass widthClass() { return widthClass; }

        /**
         * Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
         */
        public FsType fsType() { return fsType; }

        /**
         * The recommended horizontal size in font design units for subscripts for this font.
         */
        public short ySubscriptXSize() { return ySubscriptXSize; }

        /**
         * The recommended vertical size in font design units for subscripts for this font.
         */
        public short ySubscriptYSize() { return ySubscriptYSize; }

        /**
         * The recommended horizontal offset in font design untis for subscripts for this font.
         */
        public short ySubscriptXOffset() { return ySubscriptXOffset; }

        /**
         * The recommended vertical offset in font design units from the baseline for subscripts for this font.
         */
        public short ySubscriptYOffset() { return ySubscriptYOffset; }

        /**
         * The recommended horizontal size in font design units for superscripts for this font.
         */
        public short ySuperscriptXSize() { return ySuperscriptXSize; }

        /**
         * The recommended vertical size in font design units for superscripts for this font.
         */
        public short ySuperscriptYSize() { return ySuperscriptYSize; }

        /**
         * The recommended horizontal offset in font design units for superscripts for this font.
         */
        public short ySuperscriptXOffset() { return ySuperscriptXOffset; }

        /**
         * The recommended vertical offset in font design units from the baseline for superscripts for this font.
         */
        public short ySuperscriptYOffset() { return ySuperscriptYOffset; }

        /**
         * Width of the strikeout stroke in font design units.
         */
        public short yStrikeoutSize() { return yStrikeoutSize; }

        /**
         * The position of the strikeout stroke relative to the baseline in font design units.
         */
        public short yStrikeoutPosition() { return yStrikeoutPosition; }

        /**
         * This parameter is a classification of font-family design.
         */
        public short sFamilyClass() { return sFamilyClass; }
        public Panose panose() { return panose; }
        public UnicodeRange unicodeRange() { return unicodeRange; }

        /**
         * The four character identifier for the vendor of the given type face.
         */
        public String achVendId() { return achVendId; }

        /**
         * Contains information concerning the nature of the font patterns
         */
        public FsSelection selection() { return selection; }

        /**
         * The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
         */
        public int firstCharIndex() { return firstCharIndex; }

        /**
         * The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
         */
        public int lastCharIndex() { return lastCharIndex; }

        /**
         * The typographic ascender for this font.
         */
        public short typoAscender() { return typoAscender; }

        /**
         * The typographic descender for this font.
         */
        public short typoDescender() { return typoDescender; }

        /**
         * The typographic line gap for this font.
         */
        public short typoLineGap() { return typoLineGap; }

        /**
         * The ascender metric for Windows.
         */
        public int winAscent() { return winAscent; }

        /**
         * The descender metric for Windows.
         */
        public int winDescent() { return winDescent; }

        /**
         * This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
         */
        public CodePageRange codePageRange() { return codePageRange; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Fixed extends KaitaiStruct {
        public static Fixed fromFile(String fileName) throws IOException {
            return new Fixed(new ByteBufferKaitaiStream(fileName));
        }

        public Fixed(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Fixed(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Fixed(KaitaiStream _io, KaitaiStruct _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.major = this._io.readU2be();
            this.minor = this._io.readU2be();
        }
        private int major;
        private int minor;
        private Ttf _root;
        private KaitaiStruct _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public Ttf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Glyf extends KaitaiStruct {
        public static Glyf fromFile(String fileName) throws IOException {
            return new Glyf(new ByteBufferKaitaiStream(fileName));
        }

        public Glyf(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Glyf(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Glyf(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numberOfContours = this._io.readS2be();
            this.xMin = this._io.readS2be();
            this.yMin = this._io.readS2be();
            this.xMax = this._io.readS2be();
            this.yMax = this._io.readS2be();
            if (numberOfContours() > 0) {
                this.value = new SimpleGlyph(this._io, this, _root);
            }
        }
        public static class SimpleGlyph extends KaitaiStruct {
            public static SimpleGlyph fromFile(String fileName) throws IOException {
                return new SimpleGlyph(new ByteBufferKaitaiStream(fileName));
            }

            public SimpleGlyph(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SimpleGlyph(KaitaiStream _io, Ttf.Glyf _parent) {
                this(_io, _parent, null);
            }

            public SimpleGlyph(KaitaiStream _io, Ttf.Glyf _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.endPtsOfContours = new ArrayList<Integer>();
                for (int i = 0; i < _parent().numberOfContours(); i++) {
                    this.endPtsOfContours.add(this._io.readU2be());
                }
                this.instructionLength = this._io.readU2be();
                this.instructions = this._io.readBytes(instructionLength());
                this.flags = new ArrayList<Flag>();
                for (int i = 0; i < pointCount(); i++) {
                    this.flags.add(new Flag(this._io, this, _root));
                }
            }
            public static class Flag extends KaitaiStruct {
                public static Flag fromFile(String fileName) throws IOException {
                    return new Flag(new ByteBufferKaitaiStream(fileName));
                }

                public Flag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Flag(KaitaiStream _io, Ttf.Glyf.SimpleGlyph _parent) {
                    this(_io, _parent, null);
                }

                public Flag(KaitaiStream _io, Ttf.Glyf.SimpleGlyph _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.reserved = this._io.readBitsIntBe(2);
                    this.yIsSame = this._io.readBitsIntBe(1) != 0;
                    this.xIsSame = this._io.readBitsIntBe(1) != 0;
                    this.repeat = this._io.readBitsIntBe(1) != 0;
                    this.yShortVector = this._io.readBitsIntBe(1) != 0;
                    this.xShortVector = this._io.readBitsIntBe(1) != 0;
                    this.onCurve = this._io.readBitsIntBe(1) != 0;
                    this._io.alignToByte();
                    if (repeat()) {
                        this.repeatValue = this._io.readU1();
                    }
                }
                private long reserved;
                private boolean yIsSame;
                private boolean xIsSame;
                private boolean repeat;
                private boolean yShortVector;
                private boolean xShortVector;
                private boolean onCurve;
                private Integer repeatValue;
                private Ttf _root;
                private Ttf.Glyf.SimpleGlyph _parent;
                public long reserved() { return reserved; }
                public boolean yIsSame() { return yIsSame; }
                public boolean xIsSame() { return xIsSame; }
                public boolean repeat() { return repeat; }
                public boolean yShortVector() { return yShortVector; }
                public boolean xShortVector() { return xShortVector; }
                public boolean onCurve() { return onCurve; }
                public Integer repeatValue() { return repeatValue; }
                public Ttf _root() { return _root; }
                public Ttf.Glyf.SimpleGlyph _parent() { return _parent; }
            }
            private Integer pointCount;
            public Integer pointCount() {
                if (this.pointCount != null)
                    return this.pointCount;
                int _tmp = (int) ((Collections.max(endPtsOfContours()) + 1));
                this.pointCount = _tmp;
                return this.pointCount;
            }
            private ArrayList<Integer> endPtsOfContours;
            private int instructionLength;
            private byte[] instructions;
            private ArrayList<Flag> flags;
            private Ttf _root;
            private Ttf.Glyf _parent;
            public ArrayList<Integer> endPtsOfContours() { return endPtsOfContours; }
            public int instructionLength() { return instructionLength; }
            public byte[] instructions() { return instructions; }
            public ArrayList<Flag> flags() { return flags; }
            public Ttf _root() { return _root; }
            public Ttf.Glyf _parent() { return _parent; }
        }
        private short numberOfContours;
        private short xMin;
        private short yMin;
        private short xMax;
        private short yMax;
        private SimpleGlyph value;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public short numberOfContours() { return numberOfContours; }
        public short xMin() { return xMin; }
        public short yMin() { return yMin; }
        public short xMax() { return xMax; }
        public short yMax() { return yMax; }
        public SimpleGlyph value() { return value; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }

    /**
     * cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
     */
    public static class Cvt extends KaitaiStruct {
        public static Cvt fromFile(String fileName) throws IOException {
            return new Cvt(new ByteBufferKaitaiStream(fileName));
        }

        public Cvt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cvt(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Cvt(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fwords = new ArrayList<Short>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.fwords.add(this._io.readS2be());
                    i++;
                }
            }
        }
        private ArrayList<Short> fwords;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public ArrayList<Short> fwords() { return fwords; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class Maxp extends KaitaiStruct {
        public static Maxp fromFile(String fileName) throws IOException {
            return new Maxp(new ByteBufferKaitaiStream(fileName));
        }

        public Maxp(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Maxp(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Maxp(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tableVersionNumber = new Fixed(this._io, this, _root);
            this.numGlyphs = this._io.readU2be();
            if (isVersion10()) {
                this.version10Body = new MaxpVersion10Body(this._io, this, _root);
            }
        }
        private Boolean isVersion10;
        public Boolean isVersion10() {
            if (this.isVersion10 != null)
                return this.isVersion10;
            boolean _tmp = (boolean) ( ((tableVersionNumber().major() == 1) && (tableVersionNumber().minor() == 0)) );
            this.isVersion10 = _tmp;
            return this.isVersion10;
        }
        private Fixed tableVersionNumber;
        private int numGlyphs;
        private MaxpVersion10Body version10Body;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;

        /**
         * 0x00010000 for version 1.0.
         */
        public Fixed tableVersionNumber() { return tableVersionNumber; }

        /**
         * The number of glyphs in the font.
         */
        public int numGlyphs() { return numGlyphs; }
        public MaxpVersion10Body version10Body() { return version10Body; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    public static class MaxpVersion10Body extends KaitaiStruct {
        public static MaxpVersion10Body fromFile(String fileName) throws IOException {
            return new MaxpVersion10Body(new ByteBufferKaitaiStream(fileName));
        }

        public MaxpVersion10Body(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MaxpVersion10Body(KaitaiStream _io, Ttf.Maxp _parent) {
            this(_io, _parent, null);
        }

        public MaxpVersion10Body(KaitaiStream _io, Ttf.Maxp _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.maxPoints = this._io.readU2be();
            this.maxContours = this._io.readU2be();
            this.maxCompositePoints = this._io.readU2be();
            this.maxCompositeContours = this._io.readU2be();
            this.maxZones = this._io.readU2be();
            this.maxTwilightPoints = this._io.readU2be();
            this.maxStorage = this._io.readU2be();
            this.maxFunctionDefs = this._io.readU2be();
            this.maxInstructionDefs = this._io.readU2be();
            this.maxStackElements = this._io.readU2be();
            this.maxSizeOfInstructions = this._io.readU2be();
            this.maxComponentElements = this._io.readU2be();
            this.maxComponentDepth = this._io.readU2be();
        }
        private int maxPoints;
        private int maxContours;
        private int maxCompositePoints;
        private int maxCompositeContours;
        private int maxZones;
        private int maxTwilightPoints;
        private int maxStorage;
        private int maxFunctionDefs;
        private int maxInstructionDefs;
        private int maxStackElements;
        private int maxSizeOfInstructions;
        private int maxComponentElements;
        private int maxComponentDepth;
        private Ttf _root;
        private Ttf.Maxp _parent;

        /**
         * Maximum points in a non-composite glyph.
         */
        public int maxPoints() { return maxPoints; }

        /**
         * Maximum contours in a non-composite glyph.
         */
        public int maxContours() { return maxContours; }

        /**
         * Maximum points in a composite glyph.
         */
        public int maxCompositePoints() { return maxCompositePoints; }

        /**
         * Maximum contours in a composite glyph.
         */
        public int maxCompositeContours() { return maxCompositeContours; }

        /**
         * 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
         */
        public int maxZones() { return maxZones; }

        /**
         * Maximum points used in Z0.
         */
        public int maxTwilightPoints() { return maxTwilightPoints; }

        /**
         * Number of Storage Area locations.
         */
        public int maxStorage() { return maxStorage; }

        /**
         * Number of FDEFs.
         */
        public int maxFunctionDefs() { return maxFunctionDefs; }

        /**
         * Number of IDEFs.
         */
        public int maxInstructionDefs() { return maxInstructionDefs; }

        /**
         * Maximum stack depth.
         */
        public int maxStackElements() { return maxStackElements; }

        /**
         * Maximum byte count for glyph instructions.
         */
        public int maxSizeOfInstructions() { return maxSizeOfInstructions; }

        /**
         * Maximum number of components referenced at "top level" for any composite glyph.
         */
        public int maxComponentElements() { return maxComponentElements; }

        /**
         * Maximum levels of recursion; 1 for simple components.
         */
        public int maxComponentDepth() { return maxComponentDepth; }
        public Ttf _root() { return _root; }
        public Ttf.Maxp _parent() { return _parent; }
    }
    public static class OffsetTable extends KaitaiStruct {
        public static OffsetTable fromFile(String fileName) throws IOException {
            return new OffsetTable(new ByteBufferKaitaiStream(fileName));
        }

        public OffsetTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OffsetTable(KaitaiStream _io, Ttf _parent) {
            this(_io, _parent, null);
        }

        public OffsetTable(KaitaiStream _io, Ttf _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sfntVersion = new Fixed(this._io, this, _root);
            this.numTables = this._io.readU2be();
            this.searchRange = this._io.readU2be();
            this.entrySelector = this._io.readU2be();
            this.rangeShift = this._io.readU2be();
        }
        private Fixed sfntVersion;
        private int numTables;
        private int searchRange;
        private int entrySelector;
        private int rangeShift;
        private Ttf _root;
        private Ttf _parent;
        public Fixed sfntVersion() { return sfntVersion; }
        public int numTables() { return numTables; }
        public int searchRange() { return searchRange; }
        public int entrySelector() { return entrySelector; }
        public int rangeShift() { return rangeShift; }
        public Ttf _root() { return _root; }
        public Ttf _parent() { return _parent; }
    }

    /**
     * cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
     */
    public static class Cmap extends KaitaiStruct {
        public static Cmap fromFile(String fileName) throws IOException {
            return new Cmap(new ByteBufferKaitaiStream(fileName));
        }

        public Cmap(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cmap(KaitaiStream _io, Ttf.DirTableEntry _parent) {
            this(_io, _parent, null);
        }

        public Cmap(KaitaiStream _io, Ttf.DirTableEntry _parent, Ttf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.versionNumber = this._io.readU2be();
            this.numberOfEncodingTables = this._io.readU2be();
            this.tables = new ArrayList<SubtableHeader>();
            for (int i = 0; i < numberOfEncodingTables(); i++) {
                this.tables.add(new SubtableHeader(this._io, this, _root));
            }
        }
        public static class SubtableHeader extends KaitaiStruct {
            public static SubtableHeader fromFile(String fileName) throws IOException {
                return new SubtableHeader(new ByteBufferKaitaiStream(fileName));
            }

            public SubtableHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubtableHeader(KaitaiStream _io, Ttf.Cmap _parent) {
                this(_io, _parent, null);
            }

            public SubtableHeader(KaitaiStream _io, Ttf.Cmap _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.platformId = this._io.readU2be();
                this.encodingId = this._io.readU2be();
                this.subtableOffset = this._io.readU4be();
            }
            private Subtable table;
            public Subtable table() {
                if (this.table != null)
                    return this.table;
                KaitaiStream io = _parent()._io();
                long _pos = io.pos();
                io.seek(subtableOffset());
                this.table = new Subtable(io, this, _root);
                io.seek(_pos);
                return this.table;
            }
            private int platformId;
            private int encodingId;
            private long subtableOffset;
            private Ttf _root;
            private Ttf.Cmap _parent;
            public int platformId() { return platformId; }
            public int encodingId() { return encodingId; }
            public long subtableOffset() { return subtableOffset; }
            public Ttf _root() { return _root; }
            public Ttf.Cmap _parent() { return _parent; }
        }
        public static class Subtable extends KaitaiStruct {
            public static Subtable fromFile(String fileName) throws IOException {
                return new Subtable(new ByteBufferKaitaiStream(fileName));
            }

            public enum SubtableFormat {
                BYTE_ENCODING_TABLE(0),
                HIGH_BYTE_MAPPING_THROUGH_TABLE(2),
                SEGMENT_MAPPING_TO_DELTA_VALUES(4),
                TRIMMED_TABLE_MAPPING(6);

                private final long id;
                SubtableFormat(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, SubtableFormat> byId = new HashMap<Long, SubtableFormat>(4);
                static {
                    for (SubtableFormat e : SubtableFormat.values())
                        byId.put(e.id(), e);
                }
                public static SubtableFormat byId(long id) { return byId.get(id); }
            }

            public Subtable(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Cmap.SubtableHeader _parent) {
                this(_io, _parent, null);
            }

            public Subtable(KaitaiStream _io, Ttf.Cmap.SubtableHeader _parent, Ttf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.format = SubtableFormat.byId(this._io.readU2be());
                this.length = this._io.readU2be();
                this.version = this._io.readU2be();
                {
                    SubtableFormat on = format();
                    if (on != null) {
                        switch (format()) {
                        case BYTE_ENCODING_TABLE: {
                            this._raw_value = this._io.readBytes((length() - 6));
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new ByteEncodingTable(_io__raw_value, this, _root);
                            break;
                        }
                        case SEGMENT_MAPPING_TO_DELTA_VALUES: {
                            this._raw_value = this._io.readBytes((length() - 6));
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new SegmentMappingToDeltaValues(_io__raw_value, this, _root);
                            break;
                        }
                        case HIGH_BYTE_MAPPING_THROUGH_TABLE: {
                            this._raw_value = this._io.readBytes((length() - 6));
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new HighByteMappingThroughTable(_io__raw_value, this, _root);
                            break;
                        }
                        case TRIMMED_TABLE_MAPPING: {
                            this._raw_value = this._io.readBytes((length() - 6));
                            KaitaiStream _io__raw_value = new ByteBufferKaitaiStream(_raw_value);
                            this.value = new TrimmedTableMapping(_io__raw_value, this, _root);
                            break;
                        }
                        default: {
                            this.value = this._io.readBytes((length() - 6));
                            break;
                        }
                        }
                    } else {
                        this.value = this._io.readBytes((length() - 6));
                    }
                }
            }
            public static class ByteEncodingTable extends KaitaiStruct {
                public static ByteEncodingTable fromFile(String fileName) throws IOException {
                    return new ByteEncodingTable(new ByteBufferKaitaiStream(fileName));
                }

                public ByteEncodingTable(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ByteEncodingTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public ByteEncodingTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.glyphIdArray = this._io.readBytes(256);
                }
                private byte[] glyphIdArray;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public byte[] glyphIdArray() { return glyphIdArray; }
                public Ttf _root() { return _root; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
            }
            public static class HighByteMappingThroughTable extends KaitaiStruct {
                public static HighByteMappingThroughTable fromFile(String fileName) throws IOException {
                    return new HighByteMappingThroughTable(new ByteBufferKaitaiStream(fileName));
                }

                public HighByteMappingThroughTable(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public HighByteMappingThroughTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public HighByteMappingThroughTable(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.subHeaderKeys = new ArrayList<Integer>();
                    for (int i = 0; i < 256; i++) {
                        this.subHeaderKeys.add(this._io.readU2be());
                    }
                }
                private ArrayList<Integer> subHeaderKeys;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public ArrayList<Integer> subHeaderKeys() { return subHeaderKeys; }
                public Ttf _root() { return _root; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
            }
            public static class SegmentMappingToDeltaValues extends KaitaiStruct {
                public static SegmentMappingToDeltaValues fromFile(String fileName) throws IOException {
                    return new SegmentMappingToDeltaValues(new ByteBufferKaitaiStream(fileName));
                }

                public SegmentMappingToDeltaValues(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public SegmentMappingToDeltaValues(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public SegmentMappingToDeltaValues(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.segCountX2 = this._io.readU2be();
                    this.searchRange = this._io.readU2be();
                    this.entrySelector = this._io.readU2be();
                    this.rangeShift = this._io.readU2be();
                    this.endCount = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.endCount.add(this._io.readU2be());
                    }
                    this.reservedPad = this._io.readU2be();
                    this.startCount = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.startCount.add(this._io.readU2be());
                    }
                    this.idDelta = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.idDelta.add(this._io.readU2be());
                    }
                    this.idRangeOffset = new ArrayList<Integer>();
                    for (int i = 0; i < segCount(); i++) {
                        this.idRangeOffset.add(this._io.readU2be());
                    }
                    this.glyphIdArray = new ArrayList<Integer>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.glyphIdArray.add(this._io.readU2be());
                            i++;
                        }
                    }
                }
                private Integer segCount;
                public Integer segCount() {
                    if (this.segCount != null)
                        return this.segCount;
                    int _tmp = (int) ((segCountX2() / 2));
                    this.segCount = _tmp;
                    return this.segCount;
                }
                private int segCountX2;
                private int searchRange;
                private int entrySelector;
                private int rangeShift;
                private ArrayList<Integer> endCount;
                private int reservedPad;
                private ArrayList<Integer> startCount;
                private ArrayList<Integer> idDelta;
                private ArrayList<Integer> idRangeOffset;
                private ArrayList<Integer> glyphIdArray;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public int segCountX2() { return segCountX2; }
                public int searchRange() { return searchRange; }
                public int entrySelector() { return entrySelector; }
                public int rangeShift() { return rangeShift; }
                public ArrayList<Integer> endCount() { return endCount; }
                public int reservedPad() { return reservedPad; }
                public ArrayList<Integer> startCount() { return startCount; }
                public ArrayList<Integer> idDelta() { return idDelta; }
                public ArrayList<Integer> idRangeOffset() { return idRangeOffset; }
                public ArrayList<Integer> glyphIdArray() { return glyphIdArray; }
                public Ttf _root() { return _root; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
            }
            public static class TrimmedTableMapping extends KaitaiStruct {
                public static TrimmedTableMapping fromFile(String fileName) throws IOException {
                    return new TrimmedTableMapping(new ByteBufferKaitaiStream(fileName));
                }

                public TrimmedTableMapping(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public TrimmedTableMapping(KaitaiStream _io, Ttf.Cmap.Subtable _parent) {
                    this(_io, _parent, null);
                }

                public TrimmedTableMapping(KaitaiStream _io, Ttf.Cmap.Subtable _parent, Ttf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.firstCode = this._io.readU2be();
                    this.entryCount = this._io.readU2be();
                    this.glyphIdArray = new ArrayList<Integer>();
                    for (int i = 0; i < entryCount(); i++) {
                        this.glyphIdArray.add(this._io.readU2be());
                    }
                }
                private int firstCode;
                private int entryCount;
                private ArrayList<Integer> glyphIdArray;
                private Ttf _root;
                private Ttf.Cmap.Subtable _parent;
                public int firstCode() { return firstCode; }
                public int entryCount() { return entryCount; }
                public ArrayList<Integer> glyphIdArray() { return glyphIdArray; }
                public Ttf _root() { return _root; }
                public Ttf.Cmap.Subtable _parent() { return _parent; }
            }
            private SubtableFormat format;
            private int length;
            private int version;
            private Object value;
            private Ttf _root;
            private Ttf.Cmap.SubtableHeader _parent;
            private byte[] _raw_value;
            public SubtableFormat format() { return format; }
            public int length() { return length; }
            public int version() { return version; }
            public Object value() { return value; }
            public Ttf _root() { return _root; }
            public Ttf.Cmap.SubtableHeader _parent() { return _parent; }
            public byte[] _raw_value() { return _raw_value; }
        }
        private int versionNumber;
        private int numberOfEncodingTables;
        private ArrayList<SubtableHeader> tables;
        private Ttf _root;
        private Ttf.DirTableEntry _parent;
        public int versionNumber() { return versionNumber; }
        public int numberOfEncodingTables() { return numberOfEncodingTables; }
        public ArrayList<SubtableHeader> tables() { return tables; }
        public Ttf _root() { return _root; }
        public Ttf.DirTableEntry _parent() { return _parent; }
    }
    private OffsetTable offsetTable;
    private ArrayList<DirTableEntry> directoryTable;
    private Ttf _root;
    private KaitaiStruct _parent;
    public OffsetTable offsetTable() { return offsetTable; }
    public ArrayList<DirTableEntry> directoryTable() { return directoryTable; }
    public Ttf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
