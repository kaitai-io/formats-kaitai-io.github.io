// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
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
public class AllegroDat extends KaitaiStruct {
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

    public AllegroDat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AllegroDat(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AllegroDat(KaitaiStream _io, KaitaiStruct _parent, AllegroDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.packMagic = PackEnum.byId(this._io.readU4be());
        this.datMagic = this._io.ensureFixedContents(new byte[] { 65, 76, 76, 46 });
        this.numObjects = this._io.readU4be();
        objects = new ArrayList<DatObject>((int) (numObjects()));
        for (int i = 0; i < numObjects(); i++) {
            this.objects.add(new DatObject(this._io, this, _root));
        }
    }

    /**
     * Simple monochrome monospaced font, 95 characters, 8x16 px
     * characters.
     */
    public static class DatFont16 extends KaitaiStruct {
        public static DatFont16 fromFile(String fileName) throws IOException {
            return new DatFont16(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            chars = new ArrayList<byte[]>((int) (95));
            for (int i = 0; i < 95; i++) {
                this.chars.add(this._io.readBytes(16));
            }
        }
        private ArrayList<byte[]> chars;
        private AllegroDat _root;
        private AllegroDat.DatFont _parent;
        public ArrayList<byte[]> chars() { return chars; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatFont _parent() { return _parent; }
    }
    public static class DatBitmap extends KaitaiStruct {
        public static DatBitmap fromFile(String fileName) throws IOException {
            return new DatBitmap(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.bitsPerPixel = this._io.readS2be();
            this.width = this._io.readU2be();
            this.height = this._io.readU2be();
            this.image = this._io.readBytesFull();
        }
        private short bitsPerPixel;
        private int width;
        private int height;
        private byte[] image;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public short bitsPerPixel() { return bitsPerPixel; }
        public int width() { return width; }
        public int height() { return height; }
        public byte[] image() { return image; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatObject _parent() { return _parent; }
    }
    public static class DatFont extends KaitaiStruct {
        public static DatFont fromFile(String fileName) throws IOException {
            return new DatFont(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.fontSize = this._io.readS2be();
            switch (fontSize()) {
            case 8: {
                this.body = new DatFont8(this._io, this, _root);
                break;
            }
            case 16: {
                this.body = new DatFont16(this._io, this, _root);
                break;
            }
            case 0: {
                this.body = new DatFont39(this._io, this, _root);
                break;
            }
            }
        }
        private short fontSize;
        private KaitaiStruct body;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public short fontSize() { return fontSize; }
        public KaitaiStruct body() { return body; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatObject _parent() { return _parent; }
    }

    /**
     * Simple monochrome monospaced font, 95 characters, 8x8 px
     * characters.
     */
    public static class DatFont8 extends KaitaiStruct {
        public static DatFont8 fromFile(String fileName) throws IOException {
            return new DatFont8(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            chars = new ArrayList<byte[]>((int) (95));
            for (int i = 0; i < 95; i++) {
                this.chars.add(this._io.readBytes(8));
            }
        }
        private ArrayList<byte[]> chars;
        private AllegroDat _root;
        private AllegroDat.DatFont _parent;
        public ArrayList<byte[]> chars() { return chars; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatFont _parent() { return _parent; }
    }
    public static class DatObject extends KaitaiStruct {
        public static DatObject fromFile(String fileName) throws IOException {
            return new DatObject(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.properties = new ArrayList<Property>();
            {
                Property _it;
                int i = 0;
                do {
                    _it = new Property(this._io, this, _root);
                    this.properties.add(_it);
                    i++;
                } while (!(!(_it.isValid())));
            }
            this.lenCompressed = this._io.readS4be();
            this.lenUncompressed = this._io.readS4be();
            switch (type()) {
            case "BMP ": {
                this._raw_body = this._io.readBytes(lenCompressed());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new DatBitmap(_io__raw_body, this, _root);
                break;
            }
            case "RLE ": {
                this._raw_body = this._io.readBytes(lenCompressed());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new DatRleSprite(_io__raw_body, this, _root);
                break;
            }
            case "FONT": {
                this._raw_body = this._io.readBytes(lenCompressed());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new DatFont(_io__raw_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(lenCompressed());
                break;
            }
            }
        }
        private String type;
        public String type() {
            if (this.type != null)
                return this.type;
            this.type = properties().get(properties().size() - 1).magic();
            return this.type;
        }
        private ArrayList<Property> properties;
        private int lenCompressed;
        private int lenUncompressed;
        private Object body;
        private AllegroDat _root;
        private AllegroDat _parent;
        private byte[] _raw_body;
        public ArrayList<Property> properties() { return properties; }
        public int lenCompressed() { return lenCompressed; }
        public int lenUncompressed() { return lenUncompressed; }
        public Object body() { return body; }
        public AllegroDat _root() { return _root; }
        public AllegroDat _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * New bitmap font format introduced since Allegro 3.9: allows
     * flexible designation of character ranges, 8-bit colored
     * characters, etc.
     */
    public static class DatFont39 extends KaitaiStruct {
        public static DatFont39 fromFile(String fileName) throws IOException {
            return new DatFont39(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.numRanges = this._io.readS2be();
            ranges = new ArrayList<Range>((int) (numRanges()));
            for (int i = 0; i < numRanges(); i++) {
                this.ranges.add(new Range(this._io, this, _root));
            }
        }
        public static class Range extends KaitaiStruct {
            public static Range fromFile(String fileName) throws IOException {
                return new Range(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.mono = this._io.readU1();
                this.startChar = this._io.readU4be();
                this.endChar = this._io.readU4be();
                chars = new ArrayList<FontChar>((int) (((endChar() - startChar()) + 1)));
                for (int i = 0; i < ((endChar() - startChar()) + 1); i++) {
                    this.chars.add(new FontChar(this._io, this, _root));
                }
            }
            private int mono;
            private long startChar;
            private long endChar;
            private ArrayList<FontChar> chars;
            private AllegroDat _root;
            private AllegroDat.DatFont39 _parent;
            public int mono() { return mono; }

            /**
             * First character in range
             */
            public long startChar() { return startChar; }

            /**
             * Last character in range (inclusive)
             */
            public long endChar() { return endChar; }
            public ArrayList<FontChar> chars() { return chars; }
            public AllegroDat _root() { return _root; }
            public AllegroDat.DatFont39 _parent() { return _parent; }
        }
        public static class FontChar extends KaitaiStruct {
            public static FontChar fromFile(String fileName) throws IOException {
                return new FontChar(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.width = this._io.readU2be();
                this.height = this._io.readU2be();
                this.body = this._io.readBytes((width() * height()));
            }
            private int width;
            private int height;
            private byte[] body;
            private AllegroDat _root;
            private AllegroDat.DatFont39.Range _parent;
            public int width() { return width; }
            public int height() { return height; }
            public byte[] body() { return body; }
            public AllegroDat _root() { return _root; }
            public AllegroDat.DatFont39.Range _parent() { return _parent; }
        }
        private short numRanges;
        private ArrayList<Range> ranges;
        private AllegroDat _root;
        private AllegroDat.DatFont _parent;
        public short numRanges() { return numRanges; }
        public ArrayList<Range> ranges() { return ranges; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatFont _parent() { return _parent; }
    }
    public static class Property extends KaitaiStruct {
        public static Property fromFile(String fileName) throws IOException {
            return new Property(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = new String(this._io.readBytes(4), Charset.forName("UTF-8"));
            if (isValid()) {
                this.type = new String(this._io.readBytes(4), Charset.forName("UTF-8"));
            }
            if (isValid()) {
                this.lenBody = this._io.readU4be();
            }
            if (isValid()) {
                this.body = new String(this._io.readBytes(lenBody()), Charset.forName("UTF-8"));
            }
        }
        private Boolean isValid;
        public Boolean isValid() {
            if (this.isValid != null)
                return this.isValid;
            boolean _tmp = (boolean) (magic().equals("prop"));
            this.isValid = _tmp;
            return this.isValid;
        }
        private String magic;
        private String type;
        private Long lenBody;
        private String body;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public String magic() { return magic; }
        public String type() { return type; }
        public Long lenBody() { return lenBody; }
        public String body() { return body; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatObject _parent() { return _parent; }
    }
    public static class DatRleSprite extends KaitaiStruct {
        public static DatRleSprite fromFile(String fileName) throws IOException {
            return new DatRleSprite(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.bitsPerPixel = this._io.readS2be();
            this.width = this._io.readU2be();
            this.height = this._io.readU2be();
            this.lenImage = this._io.readU4be();
            this.image = this._io.readBytesFull();
        }
        private short bitsPerPixel;
        private int width;
        private int height;
        private long lenImage;
        private byte[] image;
        private AllegroDat _root;
        private AllegroDat.DatObject _parent;
        public short bitsPerPixel() { return bitsPerPixel; }
        public int width() { return width; }
        public int height() { return height; }
        public long lenImage() { return lenImage; }
        public byte[] image() { return image; }
        public AllegroDat _root() { return _root; }
        public AllegroDat.DatObject _parent() { return _parent; }
    }
    private PackEnum packMagic;
    private byte[] datMagic;
    private long numObjects;
    private ArrayList<DatObject> objects;
    private AllegroDat _root;
    private KaitaiStruct _parent;
    public PackEnum packMagic() { return packMagic; }
    public byte[] datMagic() { return datMagic; }
    public long numObjects() { return numObjects; }
    public ArrayList<DatObject> objects() { return objects; }
    public AllegroDat _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
