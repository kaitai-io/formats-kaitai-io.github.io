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
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Bitmap font format for the GRUB 2 bootloader.
 * @see <a href="https://grub.gibibit.com/New_font_format">Source</a>
 */
public class Grub2Font extends KaitaiStruct.ReadWrite {
    public static Grub2Font fromFile(String fileName) throws IOException {
        return new Grub2Font(new ByteBufferKaitaiStream(fileName));
    }
    public Grub2Font() {
        this(null, null, null);
    }

    public Grub2Font(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Grub2Font(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Grub2Font(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Grub2Font _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(12);
        if (!(Arrays.equals(this.magic, new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }, this.magic, this._io, "/seq/0");
        }
        this.sections = new ArrayList<Section>();
        {
            Section _it;
            int i = 0;
            do {
                Section _t_sections = new Section(this._io, this, _root);
                try {
                    _t_sections._read();
                } finally {
                    _it = _t_sections;
                    this.sections.add(_it);
                }
                i++;
            } while (!(_it.sectionType().equals("DATA")));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.sections.size(); i++) {
            this.sections.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        for (int i = 0; i < this.sections.size(); i++) {
            this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 12)
            throw new ConsistencyError("magic", 12, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50 }, this.magic, null, "/seq/0");
        }
        if (this.sections.size() == 0)
            throw new ConsistencyError("sections", 0, this.sections.size());
        for (int i = 0; i < this.sections.size(); i++) {
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
            {
                Section _it = this.sections.get(((Number) (i)).intValue());
                if (_it.sectionType().equals("DATA") != (i == this.sections.size() - 1))
                    throw new ConsistencyError("sections", i == this.sections.size() - 1, _it.sectionType().equals("DATA"));
            }
        }
        _dirty = false;
    }
    public static class AsceSection extends KaitaiStruct.ReadWrite {
        public static AsceSection fromFile(String fileName) throws IOException {
            return new AsceSection(new ByteBufferKaitaiStream(fileName));
        }
        public AsceSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ascentInPixels = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.ascentInPixels);
        }

        public void _check() {
            _dirty = false;
        }
        private int ascentInPixels;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int ascentInPixels() { return ascentInPixels; }
        public void setAscentInPixels(int _v) { _dirty = true; ascentInPixels = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class ChixSection extends KaitaiStruct.ReadWrite {
        public static ChixSection fromFile(String fileName) throws IOException {
            return new ChixSection(new ByteBufferKaitaiStream(fileName));
        }
        public ChixSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.characters = new ArrayList<Character>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Character _t_characters = new Character(this._io, this, _root);
                    try {
                        _t_characters._read();
                    } finally {
                        this.characters.add(_t_characters);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.characters.size(); i++) {
                this.characters.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.characters.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("characters", 0, this._io.size() - this._io.pos());
                this.characters.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("characters", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.characters.size(); i++) {
                if (!Objects.equals(this.characters.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("characters", _root(), this.characters.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.characters.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("characters", this, this.characters.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Character extends KaitaiStruct.ReadWrite {
            public static Character fromFile(String fileName) throws IOException {
                return new Character(new ByteBufferKaitaiStream(fileName));
            }
            public Character() {
                this(null, null, null);
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
            }
            public void _read() {
                this.codePoint = this._io.readU4be();
                this.flags = this._io.readU1();
                this.ofsDefinition = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                definition();
                if (this.definition != null) {
                    this.definition._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteDefinition = _enabledDefinition;
                this._io.writeU4be(this.codePoint);
                this._io.writeU1(this.flags);
                this._io.writeU4be(this.ofsDefinition);
            }

            public void _check() {
                if (_enabledDefinition) {
                    if (!Objects.equals(this.definition._root(), _root()))
                        throw new ConsistencyError("definition", _root(), this.definition._root());
                    if (!Objects.equals(this.definition._parent(), this))
                        throw new ConsistencyError("definition", this, this.definition._parent());
                }
                _dirty = false;
            }
            private CharacterDefinition definition;
            private boolean _shouldWriteDefinition = false;
            private boolean _enabledDefinition = true;
            public CharacterDefinition definition() {
                if (_shouldWriteDefinition)
                    _writeDefinition();
                if (this.definition != null)
                    return this.definition;
                if (!_enabledDefinition)
                    return null;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsDefinition());
                this.definition = new CharacterDefinition(io, this, _root);
                this.definition._read();
                io.seek(_pos);
                return this.definition;
            }
            public void setDefinition(CharacterDefinition _v) { _dirty = true; definition = _v; }
            public void setDefinition_Enabled(boolean _v) { _dirty = true; _enabledDefinition = _v; }

            private void _writeDefinition() {
                _shouldWriteDefinition = false;
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsDefinition());
                this.definition._write_Seq(io);
                io.seek(_pos);
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
            public void setCodePoint(long _v) { _dirty = true; codePoint = _v; }
            public int flags() { return flags; }
            public void setFlags(int _v) { _dirty = true; flags = _v; }
            public long ofsDefinition() { return ofsDefinition; }
            public void setOfsDefinition(long _v) { _dirty = true; ofsDefinition = _v; }
            public Grub2Font _root() { return _root; }
            public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
            public Grub2Font.ChixSection _parent() { return _parent; }
            public void set_parent(Grub2Font.ChixSection _v) { _dirty = true; _parent = _v; }
        }
        public static class CharacterDefinition extends KaitaiStruct.ReadWrite {
            public static CharacterDefinition fromFile(String fileName) throws IOException {
                return new CharacterDefinition(new ByteBufferKaitaiStream(fileName));
            }
            public CharacterDefinition() {
                this(null, null, null);
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
            }
            public void _read() {
                this.width = this._io.readU2be();
                this.height = this._io.readU2be();
                this.xOffset = this._io.readS2be();
                this.yOffset = this._io.readS2be();
                this.deviceWidth = this._io.readS2be();
                this.bitmapData = this._io.readBytes((width() * height() + 7) / 8);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2be(this.width);
                this._io.writeU2be(this.height);
                this._io.writeS2be(this.xOffset);
                this._io.writeS2be(this.yOffset);
                this._io.writeS2be(this.deviceWidth);
                this._io.writeBytes(this.bitmapData);
            }

            public void _check() {
                if (this.bitmapData.length != (width() * height() + 7) / 8)
                    throw new ConsistencyError("bitmap_data", (width() * height() + 7) / 8, this.bitmapData.length);
                _dirty = false;
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
            public void setWidth(int _v) { _dirty = true; width = _v; }
            public int height() { return height; }
            public void setHeight(int _v) { _dirty = true; height = _v; }
            public short xOffset() { return xOffset; }
            public void setXOffset(short _v) { _dirty = true; xOffset = _v; }
            public short yOffset() { return yOffset; }
            public void setYOffset(short _v) { _dirty = true; yOffset = _v; }
            public short deviceWidth() { return deviceWidth; }
            public void setDeviceWidth(short _v) { _dirty = true; deviceWidth = _v; }

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
            public void setBitmapData(byte[] _v) { _dirty = true; bitmapData = _v; }
            public Grub2Font _root() { return _root; }
            public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
            public Grub2Font.ChixSection.Character _parent() { return _parent; }
            public void set_parent(Grub2Font.ChixSection.Character _v) { _dirty = true; _parent = _v; }
        }
        private List<Character> characters;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public List<Character> characters() { return characters; }
        public void setCharacters(List<Character> _v) { _dirty = true; characters = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class DescSection extends KaitaiStruct.ReadWrite {
        public static DescSection fromFile(String fileName) throws IOException {
            return new DescSection(new ByteBufferKaitaiStream(fileName));
        }
        public DescSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.descentInPixels = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.descentInPixels);
        }

        public void _check() {
            _dirty = false;
        }
        private int descentInPixels;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int descentInPixels() { return descentInPixels; }
        public void setDescentInPixels(int _v) { _dirty = true; descentInPixels = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class FamiSection extends KaitaiStruct.ReadWrite {
        public static FamiSection fromFile(String fileName) throws IOException {
            return new FamiSection(new ByteBufferKaitaiStream(fileName));
        }
        public FamiSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fontFamilyName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.fontFamilyName).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.fontFamilyName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("font_family_name", -1, KaitaiStream.byteArrayIndexOf((this.fontFamilyName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String fontFamilyName;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontFamilyName() { return fontFamilyName; }
        public void setFontFamilyName(String _v) { _dirty = true; fontFamilyName = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class MaxhSection extends KaitaiStruct.ReadWrite {
        public static MaxhSection fromFile(String fileName) throws IOException {
            return new MaxhSection(new ByteBufferKaitaiStream(fileName));
        }
        public MaxhSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.maximumCharacterHeight = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.maximumCharacterHeight);
        }

        public void _check() {
            _dirty = false;
        }
        private int maximumCharacterHeight;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int maximumCharacterHeight() { return maximumCharacterHeight; }
        public void setMaximumCharacterHeight(int _v) { _dirty = true; maximumCharacterHeight = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class MaxwSection extends KaitaiStruct.ReadWrite {
        public static MaxwSection fromFile(String fileName) throws IOException {
            return new MaxwSection(new ByteBufferKaitaiStream(fileName));
        }
        public MaxwSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.maximumCharacterWidth = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.maximumCharacterWidth);
        }

        public void _check() {
            _dirty = false;
        }
        private int maximumCharacterWidth;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int maximumCharacterWidth() { return maximumCharacterWidth; }
        public void setMaximumCharacterWidth(int _v) { _dirty = true; maximumCharacterWidth = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class NameSection extends KaitaiStruct.ReadWrite {
        public static NameSection fromFile(String fileName) throws IOException {
            return new NameSection(new ByteBufferKaitaiStream(fileName));
        }
        public NameSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fontName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.fontName).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.fontName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("font_name", -1, KaitaiStream.byteArrayIndexOf((this.fontName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String fontName;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontName() { return fontName; }
        public void setFontName(String _v) { _dirty = true; fontName = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class PtszSection extends KaitaiStruct.ReadWrite {
        public static PtszSection fromFile(String fileName) throws IOException {
            return new PtszSection(new ByteBufferKaitaiStream(fileName));
        }
        public PtszSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fontPointSize = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.fontPointSize);
        }

        public void _check() {
            _dirty = false;
        }
        private int fontPointSize;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public int fontPointSize() { return fontPointSize; }
        public void setFontPointSize(int _v) { _dirty = true; fontPointSize = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class Section extends KaitaiStruct.ReadWrite {
        public static Section fromFile(String fileName) throws IOException {
            return new Section(new ByteBufferKaitaiStream(fileName));
        }
        public Section() {
            this(null, null, null);
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
        }
        public void _read() {
            this.sectionType = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.lenBody = this._io.readU4be();
            if (!sectionType().equals("DATA")) {
                switch (sectionType()) {
                case "ASCE": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new AsceSection(_io__raw_body, this, _root);
                    ((AsceSection) (this.body))._read();
                    break;
                }
                case "CHIX": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new ChixSection(_io__raw_body, this, _root);
                    ((ChixSection) (this.body))._read();
                    break;
                }
                case "DESC": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new DescSection(_io__raw_body, this, _root);
                    ((DescSection) (this.body))._read();
                    break;
                }
                case "FAMI": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new FamiSection(_io__raw_body, this, _root);
                    ((FamiSection) (this.body))._read();
                    break;
                }
                case "MAXH": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new MaxhSection(_io__raw_body, this, _root);
                    ((MaxhSection) (this.body))._read();
                    break;
                }
                case "MAXW": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new MaxwSection(_io__raw_body, this, _root);
                    ((MaxwSection) (this.body))._read();
                    break;
                }
                case "NAME": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new NameSection(_io__raw_body, this, _root);
                    ((NameSection) (this.body))._read();
                    break;
                }
                case "PTSZ": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new PtszSection(_io__raw_body, this, _root);
                    ((PtszSection) (this.body))._read();
                    break;
                }
                case "SLAN": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new SlanSection(_io__raw_body, this, _root);
                    ((SlanSection) (this.body))._read();
                    break;
                }
                case "WEIG": {
                    this._raw_body = this._io.readBytes(lenBody());
                    KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                    this.body = new WeigSection(_io__raw_body, this, _root);
                    ((WeigSection) (this.body))._read();
                    break;
                }
                default: {
                    this.body = this._io.readBytes(lenBody());
                    break;
                }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (!sectionType().equals("DATA")) {
                switch (sectionType()) {
                case "ASCE": {
                    ((AsceSection) (this.body))._fetchInstances();
                    break;
                }
                case "CHIX": {
                    ((ChixSection) (this.body))._fetchInstances();
                    break;
                }
                case "DESC": {
                    ((DescSection) (this.body))._fetchInstances();
                    break;
                }
                case "FAMI": {
                    ((FamiSection) (this.body))._fetchInstances();
                    break;
                }
                case "MAXH": {
                    ((MaxhSection) (this.body))._fetchInstances();
                    break;
                }
                case "MAXW": {
                    ((MaxwSection) (this.body))._fetchInstances();
                    break;
                }
                case "NAME": {
                    ((NameSection) (this.body))._fetchInstances();
                    break;
                }
                case "PTSZ": {
                    ((PtszSection) (this.body))._fetchInstances();
                    break;
                }
                case "SLAN": {
                    ((SlanSection) (this.body))._fetchInstances();
                    break;
                }
                case "WEIG": {
                    ((WeigSection) (this.body))._fetchInstances();
                    break;
                }
                default: {
                    break;
                }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.sectionType).getBytes(Charset.forName("ASCII")));
            this._io.writeU4be(this.lenBody);
            if (!sectionType().equals("DATA")) {
                switch (sectionType()) {
                case "ASCE": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((AsceSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "CHIX": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((ChixSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "DESC": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((DescSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "FAMI": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((FamiSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "MAXH": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((MaxhSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "MAXW": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((MaxwSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "NAME": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((NameSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "PTSZ": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((PtszSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "SLAN": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((SlanSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                case "WEIG": {
                    final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                    this._io.addChildStream(_io__raw_body);
                    {
                        long _pos2 = this._io.pos();
                        this._io.seek(this._io.pos() + (lenBody()));
                        final Section _this = this;
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
                    ((WeigSection) (this.body))._write_Seq(_io__raw_body);
                    break;
                }
                default: {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                    break;
                }
                }
            }
        }

        public void _check() {
            if ((this.sectionType).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("section_type", 4, (this.sectionType).getBytes(Charset.forName("ASCII")).length);
            if (!sectionType().equals("DATA")) {
                switch (sectionType()) {
                case "ASCE": {
                    if (!Objects.equals(((Grub2Font.AsceSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.AsceSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.AsceSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.AsceSection) (this.body))._parent());
                    break;
                }
                case "CHIX": {
                    if (!Objects.equals(((Grub2Font.ChixSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.ChixSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.ChixSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.ChixSection) (this.body))._parent());
                    break;
                }
                case "DESC": {
                    if (!Objects.equals(((Grub2Font.DescSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.DescSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.DescSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.DescSection) (this.body))._parent());
                    break;
                }
                case "FAMI": {
                    if (!Objects.equals(((Grub2Font.FamiSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.FamiSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.FamiSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.FamiSection) (this.body))._parent());
                    break;
                }
                case "MAXH": {
                    if (!Objects.equals(((Grub2Font.MaxhSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.MaxhSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.MaxhSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.MaxhSection) (this.body))._parent());
                    break;
                }
                case "MAXW": {
                    if (!Objects.equals(((Grub2Font.MaxwSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.MaxwSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.MaxwSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.MaxwSection) (this.body))._parent());
                    break;
                }
                case "NAME": {
                    if (!Objects.equals(((Grub2Font.NameSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.NameSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.NameSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.NameSection) (this.body))._parent());
                    break;
                }
                case "PTSZ": {
                    if (!Objects.equals(((Grub2Font.PtszSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.PtszSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.PtszSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.PtszSection) (this.body))._parent());
                    break;
                }
                case "SLAN": {
                    if (!Objects.equals(((Grub2Font.SlanSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.SlanSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.SlanSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.SlanSection) (this.body))._parent());
                    break;
                }
                case "WEIG": {
                    if (!Objects.equals(((Grub2Font.WeigSection) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Grub2Font.WeigSection) (this.body))._root());
                    if (!Objects.equals(((Grub2Font.WeigSection) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Grub2Font.WeigSection) (this.body))._parent());
                    break;
                }
                default: {
                    if (((byte[]) (this.body)).length != lenBody())
                        throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                    break;
                }
                }
            }
            _dirty = false;
        }
        private String sectionType;
        private long lenBody;
        private Object body;
        private Grub2Font _root;
        private Grub2Font _parent;
        private byte[] _raw_body;
        public String sectionType() { return sectionType; }
        public void setSectionType(String _v) { _dirty = true; sectionType = _v; }

        /**
         * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
         */
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font _parent() { return _parent; }
        public void set_parent(Grub2Font _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class SlanSection extends KaitaiStruct.ReadWrite {
        public static SlanSection fromFile(String fileName) throws IOException {
            return new SlanSection(new ByteBufferKaitaiStream(fileName));
        }
        public SlanSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fontSlant = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.fontSlant).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.fontSlant).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("font_slant", -1, KaitaiStream.byteArrayIndexOf((this.fontSlant).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String fontSlant;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontSlant() { return fontSlant; }
        public void setFontSlant(String _v) { _dirty = true; fontSlant = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    public static class WeigSection extends KaitaiStruct.ReadWrite {
        public static WeigSection fromFile(String fileName) throws IOException {
            return new WeigSection(new ByteBufferKaitaiStream(fileName));
        }
        public WeigSection() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fontWeight = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.fontWeight).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.fontWeight).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("font_weight", -1, KaitaiStream.byteArrayIndexOf((this.fontWeight).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String fontWeight;
        private Grub2Font _root;
        private Grub2Font.Section _parent;
        public String fontWeight() { return fontWeight; }
        public void setFontWeight(String _v) { _dirty = true; fontWeight = _v; }
        public Grub2Font _root() { return _root; }
        public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
        public Grub2Font.Section _parent() { return _parent; }
        public void set_parent(Grub2Font.Section _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private List<Section> sections;
    private Grub2Font _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * The "DATA" section acts as a terminator. The documentation says:
     * "A marker that indicates the remainder of the file is data accessed
     * via the character index (CHIX) section. When reading this font file,
     * the rest of the file can be ignored when scanning the sections."
     */
    public List<Section> sections() { return sections; }
    public void setSections(List<Section> _v) { _dirty = true; sections = _v; }
    public Grub2Font _root() { return _root; }
    public void set_root(Grub2Font _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
