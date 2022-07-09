// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Bitmap font format for the GRUB 2 bootloader.
 * @see <a href="https://grub.gibibit.com/New_font_format">Source</a>
 */
public class Grub2Font extends KaitaiStruct {
    public static Grub2Font fromFile(String fileName) throws IOException {
        return new Grub2Font(new ByteBufferKaitaiStream(fileName));
    }

    public Grub2Font(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Grub2Font(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Grub2Font(KaitaiStream _io, KaitaiStruct _parent, Grub2Font _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(12);
        if (!(Arrays.equals(magic(), new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }, magic(), _io(), "/seq/0");
        }
        this.sections = new ArrayList<Section>();
        {
            Section _it;
            int i = 0;
            do {
                _it = new Section(this._io, this, _root);
                this.sections.add(_it);
                i++;
            } while (!(_it.sectionType().equals("DATA")));
        }
    }
    public static class PtszSection extends KaitaiStruct {
        public static PtszSection fromFile(String fileName) throws IOException {
            return new PtszSection(new ByteBufferKaitaiStream(fileName));
        }

        public PtszSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PtszSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public PtszSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fontPointSize = this._io.readU2be();
        }
        private int fontPointSize;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int fontPointSize() { return fontPointSize; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class FamiSection extends KaitaiStruct {
        public static FamiSection fromFile(String fileName) throws IOException {
            return new FamiSection(new ByteBufferKaitaiStream(fileName));
        }

        public FamiSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FamiSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public FamiSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fontFamilyName = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
        }
        private String fontFamilyName;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontFamilyName() { return fontFamilyName; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class WeigSection extends KaitaiStruct {
        public static WeigSection fromFile(String fileName) throws IOException {
            return new WeigSection(new ByteBufferKaitaiStream(fileName));
        }

        public WeigSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public WeigSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public WeigSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fontWeight = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
        }
        private String fontWeight;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontWeight() { return fontWeight; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class MaxwSection extends KaitaiStruct {
        public static MaxwSection fromFile(String fileName) throws IOException {
            return new MaxwSection(new ByteBufferKaitaiStream(fileName));
        }

        public MaxwSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MaxwSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public MaxwSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.maximumCharacterWidth = this._io.readU2be();
        }
        private int maximumCharacterWidth;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int maximumCharacterWidth() { return maximumCharacterWidth; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class DescSection extends KaitaiStruct {
        public static DescSection fromFile(String fileName) throws IOException {
            return new DescSection(new ByteBufferKaitaiStream(fileName));
        }

        public DescSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DescSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public DescSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.descentInPixels = this._io.readU2be();
        }
        private int descentInPixels;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int descentInPixels() { return descentInPixels; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class Section extends KaitaiStruct {
        public static Section fromFile(String fileName) throws IOException {
            return new Section(new ByteBufferKaitaiStream(fileName));
        }

        public Section(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Section(KaitaiStream _io, Grub2Font _parent) {
            this(_io, _parent, null);
        }

        public Section(KaitaiStream _io, Grub2Font _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sectionType = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.lenBody = this._io.readU4be();
            if (!(sectionType()).equals("DATA")) {
                switch (sectionType()) {
                case "MAXH": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new MaxhSection(_io__raw_body, this, _root);
                    break;
                }
                case "FAMI": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new FamiSection(_io__raw_body, this, _root);
                    break;
                }
                case "PTSZ": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new PtszSection(_io__raw_body, this, _root);
                    break;
                }
                case "MAXW": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new MaxwSection(_io__raw_body, this, _root);
                    break;
                }
                case "SLAN": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new SlanSection(_io__raw_body, this, _root);
                    break;
                }
                case "WEIG": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new WeigSection(_io__raw_body, this, _root);
                    break;
                }
                case "CHIX": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new ChixSection(_io__raw_body, this, _root);
                    break;
                }
                case "DESC": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new DescSection(_io__raw_body, this, _root);
                    break;
                }
                case "NAME": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new NameSection(_io__raw_body, this, _root);
                    break;
                }
                case "ASCE": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                    this.body = new AsceSection(_io__raw_body, this, _root);
                    break;
                }
                default: {
                    this.body = this._io.readBytes(lenBody());
                    break;
                }
                }
            }
        }
        private String sectionType;
        private long lenBody;
        private Object body;
        private Grub2Font _root;
        private Grub2Font _parent;
        private byte[] _raw_body;
        public String sectionType() { return sectionType; }

        /**
         * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
         */
        public long lenBody() { return lenBody; }
        public Object body() { return body; }
        public Grub2Font _root() { return _root; }
        public Grub2Font _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    public static class AsceSection extends KaitaiStruct {
        public static AsceSection fromFile(String fileName) throws IOException {
            return new AsceSection(new ByteBufferKaitaiStream(fileName));
        }

        public AsceSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AsceSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public AsceSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ascentInPixels = this._io.readU2be();
        }
        private int ascentInPixels;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int ascentInPixels() { return ascentInPixels; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class ChixSection extends KaitaiStruct {
        public static ChixSection fromFile(String fileName) throws IOException {
            return new ChixSection(new ByteBufferKaitaiStream(fileName));
        }

        public ChixSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChixSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public ChixSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.characters = new ArrayList<Character>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.characters.add(new Character(this._io, this, _root));
                    i++;
                }
            }
        }
        public static class Character extends KaitaiStruct {
            public static Character fromFile(String fileName) throws IOException {
                return new Character(new ByteBufferKaitaiStream(fileName));
            }

            public Character(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Character(KaitaiStream _io, Grub2Font.ChixSection _parent) {
                this(_io, _parent, null);
            }

            public Character(KaitaiStream _io, Grub2Font.ChixSection _parent, Grub2Font _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.codePoint = this._io.readU4be();
                this.flags = this._io.readU1();
                this.ofsDefinition = this._io.readU4be();
            }
            private CharacterDefinition definition;
            public CharacterDefinition definition() {
                if (this.definition != null)
                    return this.definition;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsDefinition());
                this.definition = new CharacterDefinition(io, this, _root);
                io.seek(_pos);
                return this.definition;
            }
            private long codePoint;
            private int flags;
            private long ofsDefinition;
            private Grub2Font _root;
            private Grub2Font.ChixSection _parent;

            /**
             * Unicode code point
             */
            public long codePoint() { return codePoint; }
            public int flags() { return flags; }
            public long ofsDefinition() { return ofsDefinition; }
            public Grub2Font _root() { return _root; }
            public Grub2Font.ChixSection _parent() { return _parent; }
        }
        public static class CharacterDefinition extends KaitaiStruct {
            public static CharacterDefinition fromFile(String fileName) throws IOException {
                return new CharacterDefinition(new ByteBufferKaitaiStream(fileName));
            }

            public CharacterDefinition(KaitaiStream _io) {
                this(_io, null, null);
            }

            public CharacterDefinition(KaitaiStream _io, Grub2Font.ChixSection.Character _parent) {
                this(_io, _parent, null);
            }

            public CharacterDefinition(KaitaiStream _io, Grub2Font.ChixSection.Character _parent, Grub2Font _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.width = this._io.readU2be();
                this.height = this._io.readU2be();
                this.xOffset = this._io.readS2be();
                this.yOffset = this._io.readS2be();
                this.deviceWidth = this._io.readS2be();
                this.bitmapData = this._io.readBytes((((width() * height()) + 7) / 8));
            }
            private int width;
            private int height;
            private short xOffset;
            private short yOffset;
            private short deviceWidth;
            private byte[] bitmapData;
            private Grub2Font _root;
            private Grub2Font.ChixSection.Character _parent;
            public int width() { return width; }
            public int height() { return height; }
            public short xOffset() { return xOffset; }
            public short yOffset() { return yOffset; }
            public short deviceWidth() { return deviceWidth; }

            /**
             * A two-dimensional bitmap, one bit per pixel. It is organized as
             * row-major, top-down, left-to-right. The most significant bit of
             * each byte corresponds to the leftmost or uppermost pixel from all
             * bits of the byte. If a bit is set (1, `true`), the pixel is set to
             * the font color, if a bit is clear (0, `false`), the pixel is
             * transparent.
             * 
             * Rows are **not** padded to byte boundaries (i.e., a
             * single byte may contain bits belonging to multiple rows). The last
             * byte of the bitmap _is_ padded with zero bits at all unused least
             * significant bit positions so that the bitmap ends on a byte
             * boundary.
             */
            public byte[] bitmapData() { return bitmapData; }
            public Grub2Font _root() { return _root; }
            public Grub2Font.ChixSection.Character _parent() { return _parent; }
        }
        private ArrayList<Character> characters;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public ArrayList<Character> characters() { return characters; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class MaxhSection extends KaitaiStruct {
        public static MaxhSection fromFile(String fileName) throws IOException {
            return new MaxhSection(new ByteBufferKaitaiStream(fileName));
        }

        public MaxhSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MaxhSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public MaxhSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.maximumCharacterHeight = this._io.readU2be();
        }
        private int maximumCharacterHeight;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int maximumCharacterHeight() { return maximumCharacterHeight; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class NameSection extends KaitaiStruct {
        public static NameSection fromFile(String fileName) throws IOException {
            return new NameSection(new ByteBufferKaitaiStream(fileName));
        }

        public NameSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NameSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public NameSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fontName = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
        }
        private String fontName;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontName() { return fontName; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    public static class SlanSection extends KaitaiStruct {
        public static SlanSection fromFile(String fileName) throws IOException {
            return new SlanSection(new ByteBufferKaitaiStream(fileName));
        }

        public SlanSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SlanSection(KaitaiStream _io, Grub2Font.Section _parent) {
            this(_io, _parent, null);
        }

        public SlanSection(KaitaiStream _io, Grub2Font.Section _parent, Grub2Font _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fontSlant = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
        }
        private String fontSlant;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontSlant() { return fontSlant; }
        public Grub2Font _root() { return _root; }
        public Grub2Font.Section _parent() { return _parent; }
    }
    private byte[] magic;
    private ArrayList<Section> sections;
    private Grub2Font _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * The "DATA" section acts as a terminator. The documentation says:
     * "A marker that indicates the remainder of the file is data accessed
     * via the character index (CHIX) section. When reading this font file,
     * the rest of the file can be ignored when scanning the sections."
     */
    public ArrayList<Section> sections() { return sections; }
    public Grub2Font _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
