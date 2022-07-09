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
 * SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
 * Flash) to encode rich interactive multimedia content and are,
 * essentially, a container for special bytecode instructions to play
 * back that content. In early 2000s, it was dominant rich multimedia
 * web format (.swf files were integrated into web pages and played
 * back with a browser plugin), but its usage largely declined in
 * 2010s, as HTML5 and performant browser-native solutions
 * (i.e. JavaScript engines and graphical approaches, such as WebGL)
 * emerged.
 * 
 * There are a lot of versions of SWF (~36), format is somewhat
 * documented by Adobe.
 * @see <a href="https://www.adobe.com/content/dam/acom/en/devnet/pdf/swf-file-format-spec.pdf">Source</a>
 */
public class Swf extends KaitaiStruct {
    public static Swf fromFile(String fileName) throws IOException {
        return new Swf(new ByteBufferKaitaiStream(fileName));
    }

    public enum Compressions {
        ZLIB(67),
        NONE(70),
        LZMA(90);

        private final long id;
        Compressions(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compressions> byId = new HashMap<Long, Compressions>(3);
        static {
            for (Compressions e : Compressions.values())
                byId.put(e.id(), e);
        }
        public static Compressions byId(long id) { return byId.get(id); }
    }

    public enum TagType {
        END_OF_FILE(0),
        PLACE_OBJECT(4),
        REMOVE_OBJECT(5),
        SET_BACKGROUND_COLOR(9),
        DEFINE_SOUND(14),
        PLACE_OBJECT2(26),
        REMOVE_OBJECT2(28),
        FRAME_LABEL(43),
        EXPORT_ASSETS(56),
        SCRIPT_LIMITS(65),
        FILE_ATTRIBUTES(69),
        PLACE_OBJECT3(70),
        SYMBOL_CLASS(76),
        METADATA(77),
        DEFINE_SCALING_GRID(78),
        DO_ABC(82),
        DEFINE_SCENE_AND_FRAME_LABEL_DATA(86);

        private final long id;
        TagType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TagType> byId = new HashMap<Long, TagType>(17);
        static {
            for (TagType e : TagType.values())
                byId.put(e.id(), e);
        }
        public static TagType byId(long id) { return byId.get(id); }
    }

    public Swf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Swf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Swf(KaitaiStream _io, KaitaiStruct _parent, Swf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.compression = Compressions.byId(this._io.readU1());
        this.signature = this._io.readBytes(2);
        if (!(Arrays.equals(signature(), new byte[] { 87, 83 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 83 }, signature(), _io(), "/seq/1");
        }
        this.version = this._io.readU1();
        this.lenFile = this._io.readU4le();
        if (compression() == Compressions.NONE) {
            this._raw_plainBody = this._io.readBytesFull();
            KaitaiStream _io__raw_plainBody = new ByteBufferKaitaiStream(_raw_plainBody);
            this.plainBody = new SwfBody(_io__raw_plainBody, this, _root);
        }
        if (compression() == Compressions.ZLIB) {
            this._raw__raw_zlibBody = this._io.readBytesFull();
            this._raw_zlibBody = KaitaiStream.processZlib(_raw__raw_zlibBody);
            KaitaiStream _io__raw_zlibBody = new ByteBufferKaitaiStream(_raw_zlibBody);
            this.zlibBody = new SwfBody(_io__raw_zlibBody, this, _root);
        }
    }
    public static class Rgb extends KaitaiStruct {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
        }

        public Rgb(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rgb(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public Rgb(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
        }
        private int r;
        private int g;
        private int b;
        private Swf _root;
        private Swf.Tag _parent;
        public int r() { return r; }
        public int g() { return g; }
        public int b() { return b; }
        public Swf _root() { return _root; }
        public Swf.Tag _parent() { return _parent; }
    }
    public static class DoAbcBody extends KaitaiStruct {
        public static DoAbcBody fromFile(String fileName) throws IOException {
            return new DoAbcBody(new ByteBufferKaitaiStream(fileName));
        }

        public DoAbcBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DoAbcBody(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public DoAbcBody(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.flags = this._io.readU4le();
            this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
            this.abcdata = this._io.readBytesFull();
        }
        private long flags;
        private String name;
        private byte[] abcdata;
        private Swf _root;
        private Swf.Tag _parent;
        public long flags() { return flags; }
        public String name() { return name; }
        public byte[] abcdata() { return abcdata; }
        public Swf _root() { return _root; }
        public Swf.Tag _parent() { return _parent; }
    }
    public static class SwfBody extends KaitaiStruct {
        public static SwfBody fromFile(String fileName) throws IOException {
            return new SwfBody(new ByteBufferKaitaiStream(fileName));
        }

        public SwfBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SwfBody(KaitaiStream _io, Swf _parent) {
            this(_io, _parent, null);
        }

        public SwfBody(KaitaiStream _io, Swf _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.rect = new Rect(this._io, this, _root);
            this.frameRate = this._io.readU2le();
            this.frameCount = this._io.readU2le();
            if (_root().version() >= 8) {
                this.fileAttributesTag = new Tag(this._io, this, _root);
            }
            this.tags = new ArrayList<Tag>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.tags.add(new Tag(this._io, this, _root));
                    i++;
                }
            }
        }
        private Rect rect;
        private int frameRate;
        private int frameCount;
        private Tag fileAttributesTag;
        private ArrayList<Tag> tags;
        private Swf _root;
        private Swf _parent;
        public Rect rect() { return rect; }
        public int frameRate() { return frameRate; }
        public int frameCount() { return frameCount; }
        public Tag fileAttributesTag() { return fileAttributesTag; }
        public ArrayList<Tag> tags() { return tags; }
        public Swf _root() { return _root; }
        public Swf _parent() { return _parent; }
    }
    public static class Rect extends KaitaiStruct {
        public static Rect fromFile(String fileName) throws IOException {
            return new Rect(new ByteBufferKaitaiStream(fileName));
        }

        public Rect(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Rect(KaitaiStream _io, Swf.SwfBody _parent) {
            this(_io, _parent, null);
        }

        public Rect(KaitaiStream _io, Swf.SwfBody _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.b1 = this._io.readU1();
            this.skip = this._io.readBytes(numBytes());
        }
        private Integer numBits;
        public Integer numBits() {
            if (this.numBits != null)
                return this.numBits;
            int _tmp = (int) ((b1() >> 3));
            this.numBits = _tmp;
            return this.numBits;
        }
        private Integer numBytes;
        public Integer numBytes() {
            if (this.numBytes != null)
                return this.numBytes;
            int _tmp = (int) (((((numBits() * 4) - 3) + 7) / 8));
            this.numBytes = _tmp;
            return this.numBytes;
        }
        private int b1;
        private byte[] skip;
        private Swf _root;
        private Swf.SwfBody _parent;
        public int b1() { return b1; }
        public byte[] skip() { return skip; }
        public Swf _root() { return _root; }
        public Swf.SwfBody _parent() { return _parent; }
    }
    public static class Tag extends KaitaiStruct {
        public static Tag fromFile(String fileName) throws IOException {
            return new Tag(new ByteBufferKaitaiStream(fileName));
        }

        public Tag(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Tag(KaitaiStream _io, Swf.SwfBody _parent) {
            this(_io, _parent, null);
        }

        public Tag(KaitaiStream _io, Swf.SwfBody _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.recordHeader = new RecordHeader(this._io, this, _root);
            {
                TagType on = recordHeader().tagType();
                if (on != null) {
                    switch (recordHeader().tagType()) {
                    case DEFINE_SOUND: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                        this.tagBody = new DefineSoundBody(_io__raw_tagBody, this, _root);
                        break;
                    }
                    case SET_BACKGROUND_COLOR: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                        this.tagBody = new Rgb(_io__raw_tagBody, this, _root);
                        break;
                    }
                    case SCRIPT_LIMITS: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                        this.tagBody = new ScriptLimitsBody(_io__raw_tagBody, this, _root);
                        break;
                    }
                    case DO_ABC: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                        this.tagBody = new DoAbcBody(_io__raw_tagBody, this, _root);
                        break;
                    }
                    case EXPORT_ASSETS: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                        this.tagBody = new SymbolClassBody(_io__raw_tagBody, this, _root);
                        break;
                    }
                    case SYMBOL_CLASS: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                        this.tagBody = new SymbolClassBody(_io__raw_tagBody, this, _root);
                        break;
                    }
                    default: {
                        this.tagBody = this._io.readBytes(recordHeader().len());
                        break;
                    }
                    }
                } else {
                    this.tagBody = this._io.readBytes(recordHeader().len());
                }
            }
        }
        private RecordHeader recordHeader;
        private Object tagBody;
        private Swf _root;
        private Swf.SwfBody _parent;
        private byte[] _raw_tagBody;
        public RecordHeader recordHeader() { return recordHeader; }
        public Object tagBody() { return tagBody; }
        public Swf _root() { return _root; }
        public Swf.SwfBody _parent() { return _parent; }
        public byte[] _raw_tagBody() { return _raw_tagBody; }
    }
    public static class SymbolClassBody extends KaitaiStruct {
        public static SymbolClassBody fromFile(String fileName) throws IOException {
            return new SymbolClassBody(new ByteBufferKaitaiStream(fileName));
        }

        public SymbolClassBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SymbolClassBody(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public SymbolClassBody(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numSymbols = this._io.readU2le();
            this.symbols = new ArrayList<Symbol>();
            for (int i = 0; i < numSymbols(); i++) {
                this.symbols.add(new Symbol(this._io, this, _root));
            }
        }
        public static class Symbol extends KaitaiStruct {
            public static Symbol fromFile(String fileName) throws IOException {
                return new Symbol(new ByteBufferKaitaiStream(fileName));
            }

            public Symbol(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Symbol(KaitaiStream _io, Swf.SymbolClassBody _parent) {
                this(_io, _parent, null);
            }

            public Symbol(KaitaiStream _io, Swf.SymbolClassBody _parent, Swf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.tag = this._io.readU2le();
                this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("ASCII"));
            }
            private int tag;
            private String name;
            private Swf _root;
            private Swf.SymbolClassBody _parent;
            public int tag() { return tag; }
            public String name() { return name; }
            public Swf _root() { return _root; }
            public Swf.SymbolClassBody _parent() { return _parent; }
        }
        private int numSymbols;
        private ArrayList<Symbol> symbols;
        private Swf _root;
        private Swf.Tag _parent;
        public int numSymbols() { return numSymbols; }
        public ArrayList<Symbol> symbols() { return symbols; }
        public Swf _root() { return _root; }
        public Swf.Tag _parent() { return _parent; }
    }
    public static class DefineSoundBody extends KaitaiStruct {
        public static DefineSoundBody fromFile(String fileName) throws IOException {
            return new DefineSoundBody(new ByteBufferKaitaiStream(fileName));
        }

        public enum SamplingRates {
            RATE_5_5_KHZ(0),
            RATE_11_KHZ(1),
            RATE_22_KHZ(2),
            RATE_44_KHZ(3);

            private final long id;
            SamplingRates(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, SamplingRates> byId = new HashMap<Long, SamplingRates>(4);
            static {
                for (SamplingRates e : SamplingRates.values())
                    byId.put(e.id(), e);
            }
            public static SamplingRates byId(long id) { return byId.get(id); }
        }

        public enum Bps {
            SOUND_8_BIT(0),
            SOUND_16_BIT(1);

            private final long id;
            Bps(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Bps> byId = new HashMap<Long, Bps>(2);
            static {
                for (Bps e : Bps.values())
                    byId.put(e.id(), e);
            }
            public static Bps byId(long id) { return byId.get(id); }
        }

        public enum Channels {
            MONO(0),
            STEREO(1);

            private final long id;
            Channels(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Channels> byId = new HashMap<Long, Channels>(2);
            static {
                for (Channels e : Channels.values())
                    byId.put(e.id(), e);
            }
            public static Channels byId(long id) { return byId.get(id); }
        }

        public DefineSoundBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DefineSoundBody(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public DefineSoundBody(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.id = this._io.readU2le();
            this.format = this._io.readBitsIntBe(4);
            this.samplingRate = SamplingRates.byId(this._io.readBitsIntBe(2));
            this.bitsPerSample = Bps.byId(this._io.readBitsIntBe(1));
            this.numChannels = Channels.byId(this._io.readBitsIntBe(1));
            this._io.alignToByte();
            this.numSamples = this._io.readU4le();
        }
        private int id;
        private long format;
        private SamplingRates samplingRate;
        private Bps bitsPerSample;
        private Channels numChannels;
        private long numSamples;
        private Swf _root;
        private Swf.Tag _parent;
        public int id() { return id; }
        public long format() { return format; }

        /**
         * Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
         */
        public SamplingRates samplingRate() { return samplingRate; }
        public Bps bitsPerSample() { return bitsPerSample; }
        public Channels numChannels() { return numChannels; }
        public long numSamples() { return numSamples; }
        public Swf _root() { return _root; }
        public Swf.Tag _parent() { return _parent; }
    }
    public static class RecordHeader extends KaitaiStruct {
        public static RecordHeader fromFile(String fileName) throws IOException {
            return new RecordHeader(new ByteBufferKaitaiStream(fileName));
        }

        public RecordHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RecordHeader(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public RecordHeader(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tagCodeAndLength = this._io.readU2le();
            if (smallLen() == 63) {
                this.bigLen = this._io.readS4le();
            }
        }
        private TagType tagType;
        public TagType tagType() {
            if (this.tagType != null)
                return this.tagType;
            this.tagType = Swf.TagType.byId((tagCodeAndLength() >> 6));
            return this.tagType;
        }
        private Integer smallLen;
        public Integer smallLen() {
            if (this.smallLen != null)
                return this.smallLen;
            int _tmp = (int) ((tagCodeAndLength() & 63));
            this.smallLen = _tmp;
            return this.smallLen;
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            int _tmp = (int) ((smallLen() == 63 ? bigLen() : smallLen()));
            this.len = _tmp;
            return this.len;
        }
        private int tagCodeAndLength;
        private Integer bigLen;
        private Swf _root;
        private Swf.Tag _parent;
        public int tagCodeAndLength() { return tagCodeAndLength; }
        public Integer bigLen() { return bigLen; }
        public Swf _root() { return _root; }
        public Swf.Tag _parent() { return _parent; }
    }
    public static class ScriptLimitsBody extends KaitaiStruct {
        public static ScriptLimitsBody fromFile(String fileName) throws IOException {
            return new ScriptLimitsBody(new ByteBufferKaitaiStream(fileName));
        }

        public ScriptLimitsBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ScriptLimitsBody(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public ScriptLimitsBody(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.maxRecursionDepth = this._io.readU2le();
            this.scriptTimeoutSeconds = this._io.readU2le();
        }
        private int maxRecursionDepth;
        private int scriptTimeoutSeconds;
        private Swf _root;
        private Swf.Tag _parent;
        public int maxRecursionDepth() { return maxRecursionDepth; }
        public int scriptTimeoutSeconds() { return scriptTimeoutSeconds; }
        public Swf _root() { return _root; }
        public Swf.Tag _parent() { return _parent; }
    }
    private Compressions compression;
    private byte[] signature;
    private int version;
    private long lenFile;
    private SwfBody plainBody;
    private SwfBody zlibBody;
    private Swf _root;
    private KaitaiStruct _parent;
    private byte[] _raw_plainBody;
    private byte[] _raw_zlibBody;
    private byte[] _raw__raw_zlibBody;
    public Compressions compression() { return compression; }
    public byte[] signature() { return signature; }
    public int version() { return version; }
    public long lenFile() { return lenFile; }
    public SwfBody plainBody() { return plainBody; }
    public SwfBody zlibBody() { return zlibBody; }
    public Swf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_plainBody() { return _raw_plainBody; }
    public byte[] _raw_zlibBody() { return _raw_zlibBody; }
    public byte[] _raw__raw_zlibBody() { return _raw__raw_zlibBody; }
}
