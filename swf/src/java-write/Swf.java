// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


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
 * @see <a href="https://open-flash.github.io/mirrors/swf-spec-19.pdf">Source</a>
 */
public class Swf extends KaitaiStruct.ReadWrite {
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
    public Swf() {
        this(null, null, null);
    }

    public Swf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Swf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Swf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Swf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.compression = Compressions.byId(this._io.readU1());
        this.signature = this._io.readBytes(2);
        if (!(Arrays.equals(this.signature, new byte[] { 87, 83 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 83 }, this.signature, this._io, "/seq/1");
        }
        this.version = this._io.readU1();
        this.lenFile = this._io.readU4le();
        if (compression() == Compressions.NONE) {
            this._raw_plainBody = this._io.readBytesFull();
            KaitaiStream _io__raw_plainBody = new ByteBufferKaitaiStream(this._raw_plainBody);
            this.plainBody = new SwfBody(_io__raw_plainBody, this, _root);
            this.plainBody._read();
        }
        if (compression() == Compressions.ZLIB) {
            this._raw__raw_zlibBody = this._io.readBytesFull();
            this._raw_zlibBody = KaitaiStream.processZlib(this._raw__raw_zlibBody);
            this.zlibBody_InnerSize = this._raw_zlibBody.length;
            KaitaiStream _io__raw_zlibBody = new ByteBufferKaitaiStream(this._raw_zlibBody);
            this.zlibBody = new SwfBody(_io__raw_zlibBody, this, _root);
            this.zlibBody._read();
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (compression() == Compressions.NONE) {
            this.plainBody._fetchInstances();
        }
        if (compression() == Compressions.ZLIB) {
            this.zlibBody._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU1(((Number) (this.compression.id())).intValue());
        this._io.writeBytes(this.signature);
        this._io.writeU1(this.version);
        this._io.writeU4le(this.lenFile);
        if (compression() == Compressions.NONE) {
            final KaitaiStream _io__raw_plainBody = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
            this._io.addChildStream(_io__raw_plainBody);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                final Swf _this = this;
                _io__raw_plainBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_plainBody = _io__raw_plainBody.toByteArray();
                        parent.writeBytes(_this._raw_plainBody);
                        if (!(parent.isEof()))
                            throw new ConsistencyError("raw(plain_body)", 0, parent.size() - parent.pos());
                    }
                });
            }
            this.plainBody._write_Seq(_io__raw_plainBody);
        }
        if (compression() == Compressions.ZLIB) {
            final KaitaiStream _io__raw_zlibBody = new ByteBufferKaitaiStream(this.zlibBody_InnerSize);
            this._io.addChildStream(_io__raw_zlibBody);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                final Swf _this = this;
                _io__raw_zlibBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_zlibBody = _io__raw_zlibBody.toByteArray();
                        _this._raw__raw_zlibBody = KaitaiStream.unprocessZlib(_this._raw_zlibBody);
                        parent.writeBytes(_this._raw__raw_zlibBody);
                        if (!(parent.isEof()))
                            throw new ConsistencyError("raw(zlib_body)", 0, parent.size() - parent.pos());
                    }
                });
            }
            this.zlibBody._write_Seq(_io__raw_zlibBody);
        }
    }

    public void _check() {
        if (this.signature.length != 2)
            throw new ConsistencyError("signature", 2, this.signature.length);
        if (!(Arrays.equals(this.signature, new byte[] { 87, 83 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 87, 83 }, this.signature, null, "/seq/1");
        }
        if (compression() == Compressions.NONE) {
            if (!Objects.equals(this.plainBody._root(), _root()))
                throw new ConsistencyError("plain_body", _root(), this.plainBody._root());
            if (!Objects.equals(this.plainBody._parent(), this))
                throw new ConsistencyError("plain_body", this, this.plainBody._parent());
        }
        if (compression() == Compressions.ZLIB) {
            if (!Objects.equals(this.zlibBody._root(), _root()))
                throw new ConsistencyError("zlib_body", _root(), this.zlibBody._root());
            if (!Objects.equals(this.zlibBody._parent(), this))
                throw new ConsistencyError("zlib_body", this, this.zlibBody._parent());
        }
        _dirty = false;
    }
    public static class DefineSoundBody extends KaitaiStruct.ReadWrite {
        public static DefineSoundBody fromFile(String fileName) throws IOException {
            return new DefineSoundBody(new ByteBufferKaitaiStream(fileName));
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
        public DefineSoundBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.id = this._io.readU2le();
            this.format = this._io.readBitsIntBe(4);
            this.samplingRate = SamplingRates.byId(this._io.readBitsIntBe(2));
            this.bitsPerSample = Bps.byId(this._io.readBitsIntBe(1));
            this.numChannels = Channels.byId(this._io.readBitsIntBe(1));
            this.numSamples = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.id);
            this._io.writeBitsIntBe(4, this.format);
            this._io.writeBitsIntBe(2, ((Number) (this.samplingRate.id())).longValue());
            this._io.writeBitsIntBe(1, ((Number) (this.bitsPerSample.id())).longValue());
            this._io.writeBitsIntBe(1, ((Number) (this.numChannels.id())).longValue());
            this._io.writeU4le(this.numSamples);
        }

        public void _check() {
            _dirty = false;
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
        public void setId(int _v) { _dirty = true; id = _v; }
        public long format() { return format; }
        public void setFormat(long _v) { _dirty = true; format = _v; }

        /**
         * Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
         */
        public SamplingRates samplingRate() { return samplingRate; }
        public void setSamplingRate(SamplingRates _v) { _dirty = true; samplingRate = _v; }
        public Bps bitsPerSample() { return bitsPerSample; }
        public void setBitsPerSample(Bps _v) { _dirty = true; bitsPerSample = _v; }
        public Channels numChannels() { return numChannels; }
        public void setNumChannels(Channels _v) { _dirty = true; numChannels = _v; }
        public long numSamples() { return numSamples; }
        public void setNumSamples(long _v) { _dirty = true; numSamples = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.Tag _parent() { return _parent; }
        public void set_parent(Swf.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class DoAbcBody extends KaitaiStruct.ReadWrite {
        public static DoAbcBody fromFile(String fileName) throws IOException {
            return new DoAbcBody(new ByteBufferKaitaiStream(fileName));
        }
        public DoAbcBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.flags = this._io.readU4le();
            this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            this.abcdata = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.flags);
            this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
            this._io.writeBytes(this.abcdata);
            if (!(this._io.isEof()))
                throw new ConsistencyError("abcdata", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private long flags;
        private String name;
        private byte[] abcdata;
        private Swf _root;
        private Swf.Tag _parent;
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public byte[] abcdata() { return abcdata; }
        public void setAbcdata(byte[] _v) { _dirty = true; abcdata = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.Tag _parent() { return _parent; }
        public void set_parent(Swf.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class RecordHeader extends KaitaiStruct.ReadWrite {
        public static RecordHeader fromFile(String fileName) throws IOException {
            return new RecordHeader(new ByteBufferKaitaiStream(fileName));
        }
        public RecordHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.tagCodeAndLength = this._io.readU2le();
            if (smallLen() == 63) {
                this.bigLen = this._io.readS4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (smallLen() == 63) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.tagCodeAndLength);
            if (smallLen() == 63) {
                this._io.writeS4le(this.bigLen);
            }
        }

        public void _check() {
            if (smallLen() == 63) {
            }
            _dirty = false;
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            this.len = ((Number) ((smallLen() == 63 ? bigLen() : smallLen()))).intValue();
            return this.len;
        }
        public void _invalidateLen() { this.len = null; }
        private Integer smallLen;
        public Integer smallLen() {
            if (this.smallLen != null)
                return this.smallLen;
            this.smallLen = ((Number) (tagCodeAndLength() & 63)).intValue();
            return this.smallLen;
        }
        public void _invalidateSmallLen() { this.smallLen = null; }
        private TagType tagType;
        public TagType tagType() {
            if (this.tagType != null)
                return this.tagType;
            this.tagType = Swf.TagType.byId(tagCodeAndLength() >> 6);
            return this.tagType;
        }
        public void _invalidateTagType() { this.tagType = null; }
        private int tagCodeAndLength;
        private Integer bigLen;
        private Swf _root;
        private Swf.Tag _parent;
        public int tagCodeAndLength() { return tagCodeAndLength; }
        public void setTagCodeAndLength(int _v) { _dirty = true; tagCodeAndLength = _v; }
        public Integer bigLen() { return bigLen; }
        public void setBigLen(Integer _v) { _dirty = true; bigLen = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.Tag _parent() { return _parent; }
        public void set_parent(Swf.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class Rect extends KaitaiStruct.ReadWrite {
        public static Rect fromFile(String fileName) throws IOException {
            return new Rect(new ByteBufferKaitaiStream(fileName));
        }
        public Rect() {
            this(null, null, null);
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
        }
        public void _read() {
            this.b1 = this._io.readU1();
            this.skip = this._io.readBytes(numBytes());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.b1);
            this._io.writeBytes(this.skip);
        }

        public void _check() {
            if (this.skip.length != numBytes())
                throw new ConsistencyError("skip", numBytes(), this.skip.length);
            _dirty = false;
        }
        private Integer numBits;
        public Integer numBits() {
            if (this.numBits != null)
                return this.numBits;
            this.numBits = ((Number) (b1() >> 3)).intValue();
            return this.numBits;
        }
        public void _invalidateNumBits() { this.numBits = null; }
        private Integer numBytes;
        public Integer numBytes() {
            if (this.numBytes != null)
                return this.numBytes;
            this.numBytes = ((Number) (((numBits() * 4 - 3) + 7) / 8)).intValue();
            return this.numBytes;
        }
        public void _invalidateNumBytes() { this.numBytes = null; }
        private int b1;
        private byte[] skip;
        private Swf _root;
        private Swf.SwfBody _parent;
        public int b1() { return b1; }
        public void setB1(int _v) { _dirty = true; b1 = _v; }
        public byte[] skip() { return skip; }
        public void setSkip(byte[] _v) { _dirty = true; skip = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.SwfBody _parent() { return _parent; }
        public void set_parent(Swf.SwfBody _v) { _dirty = true; _parent = _v; }
    }
    public static class Rgb extends KaitaiStruct.ReadWrite {
        public static Rgb fromFile(String fileName) throws IOException {
            return new Rgb(new ByteBufferKaitaiStream(fileName));
        }
        public Rgb() {
            this(null, null, null);
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
        }
        public void _read() {
            this.r = this._io.readU1();
            this.g = this._io.readU1();
            this.b = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.r);
            this._io.writeU1(this.g);
            this._io.writeU1(this.b);
        }

        public void _check() {
            _dirty = false;
        }
        private int r;
        private int g;
        private int b;
        private Swf _root;
        private Swf.Tag _parent;
        public int r() { return r; }
        public void setR(int _v) { _dirty = true; r = _v; }
        public int g() { return g; }
        public void setG(int _v) { _dirty = true; g = _v; }
        public int b() { return b; }
        public void setB(int _v) { _dirty = true; b = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.Tag _parent() { return _parent; }
        public void set_parent(Swf.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class ScriptLimitsBody extends KaitaiStruct.ReadWrite {
        public static ScriptLimitsBody fromFile(String fileName) throws IOException {
            return new ScriptLimitsBody(new ByteBufferKaitaiStream(fileName));
        }
        public ScriptLimitsBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.maxRecursionDepth = this._io.readU2le();
            this.scriptTimeoutSeconds = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.maxRecursionDepth);
            this._io.writeU2le(this.scriptTimeoutSeconds);
        }

        public void _check() {
            _dirty = false;
        }
        private int maxRecursionDepth;
        private int scriptTimeoutSeconds;
        private Swf _root;
        private Swf.Tag _parent;
        public int maxRecursionDepth() { return maxRecursionDepth; }
        public void setMaxRecursionDepth(int _v) { _dirty = true; maxRecursionDepth = _v; }
        public int scriptTimeoutSeconds() { return scriptTimeoutSeconds; }
        public void setScriptTimeoutSeconds(int _v) { _dirty = true; scriptTimeoutSeconds = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.Tag _parent() { return _parent; }
        public void set_parent(Swf.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class SwfBody extends KaitaiStruct.ReadWrite {
        public static SwfBody fromFile(String fileName) throws IOException {
            return new SwfBody(new ByteBufferKaitaiStream(fileName));
        }
        public SwfBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.rect = new Rect(this._io, this, _root);
            this.rect._read();
            this.frameRate = this._io.readU2le();
            this.frameCount = this._io.readU2le();
            if (_root().version() >= 8) {
                this.fileAttributesTag = new Tag(this._io, this, _root);
                this.fileAttributesTag._read();
            }
            this.tags = new ArrayList<Tag>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Tag _t_tags = new Tag(this._io, this, _root);
                    try {
                        _t_tags._read();
                    } finally {
                        this.tags.add(_t_tags);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.rect._fetchInstances();
            if (_root().version() >= 8) {
                this.fileAttributesTag._fetchInstances();
            }
            for (int i = 0; i < this.tags.size(); i++) {
                this.tags.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.rect._write_Seq(this._io);
            this._io.writeU2le(this.frameRate);
            this._io.writeU2le(this.frameCount);
            if (_root().version() >= 8) {
                this.fileAttributesTag._write_Seq(this._io);
            }
            for (int i = 0; i < this.tags.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("tags", 0, this._io.size() - this._io.pos());
                this.tags.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("tags", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.rect._root(), _root()))
                throw new ConsistencyError("rect", _root(), this.rect._root());
            if (!Objects.equals(this.rect._parent(), this))
                throw new ConsistencyError("rect", this, this.rect._parent());
            if (_root().version() >= 8) {
                if (!Objects.equals(this.fileAttributesTag._root(), _root()))
                    throw new ConsistencyError("file_attributes_tag", _root(), this.fileAttributesTag._root());
                if (!Objects.equals(this.fileAttributesTag._parent(), this))
                    throw new ConsistencyError("file_attributes_tag", this, this.fileAttributesTag._parent());
            }
            for (int i = 0; i < this.tags.size(); i++) {
                if (!Objects.equals(this.tags.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tags", _root(), this.tags.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.tags.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tags", this, this.tags.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Rect rect;
        private int frameRate;
        private int frameCount;
        private Tag fileAttributesTag;
        private List<Tag> tags;
        private Swf _root;
        private Swf _parent;
        public Rect rect() { return rect; }
        public void setRect(Rect _v) { _dirty = true; rect = _v; }
        public int frameRate() { return frameRate; }
        public void setFrameRate(int _v) { _dirty = true; frameRate = _v; }
        public int frameCount() { return frameCount; }
        public void setFrameCount(int _v) { _dirty = true; frameCount = _v; }
        public Tag fileAttributesTag() { return fileAttributesTag; }
        public void setFileAttributesTag(Tag _v) { _dirty = true; fileAttributesTag = _v; }
        public List<Tag> tags() { return tags; }
        public void setTags(List<Tag> _v) { _dirty = true; tags = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf _parent() { return _parent; }
        public void set_parent(Swf _v) { _dirty = true; _parent = _v; }
    }
    public static class SymbolClassBody extends KaitaiStruct.ReadWrite {
        public static SymbolClassBody fromFile(String fileName) throws IOException {
            return new SymbolClassBody(new ByteBufferKaitaiStream(fileName));
        }
        public SymbolClassBody() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numSymbols = this._io.readU2le();
            this.symbols = new ArrayList<Symbol>();
            for (int i = 0; i < numSymbols(); i++) {
                Symbol _t_symbols = new Symbol(this._io, this, _root);
                try {
                    _t_symbols._read();
                } finally {
                    this.symbols.add(_t_symbols);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.symbols.size(); i++) {
                this.symbols.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.numSymbols);
            for (int i = 0; i < this.symbols.size(); i++) {
                this.symbols.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.symbols.size() != numSymbols())
                throw new ConsistencyError("symbols", numSymbols(), this.symbols.size());
            for (int i = 0; i < this.symbols.size(); i++) {
                if (!Objects.equals(this.symbols.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("symbols", _root(), this.symbols.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.symbols.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("symbols", this, this.symbols.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Symbol extends KaitaiStruct.ReadWrite {
            public static Symbol fromFile(String fileName) throws IOException {
                return new Symbol(new ByteBufferKaitaiStream(fileName));
            }
            public Symbol() {
                this(null, null, null);
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
            }
            public void _read() {
                this.tag = this._io.readU2le();
                this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.tag);
                this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
                this._io.writeU1(0);
            }

            public void _check() {
                if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                _dirty = false;
            }
            private int tag;
            private String name;
            private Swf _root;
            private Swf.SymbolClassBody _parent;
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }
            public String name() { return name; }
            public void setName(String _v) { _dirty = true; name = _v; }
            public Swf _root() { return _root; }
            public void set_root(Swf _v) { _dirty = true; _root = _v; }
            public Swf.SymbolClassBody _parent() { return _parent; }
            public void set_parent(Swf.SymbolClassBody _v) { _dirty = true; _parent = _v; }
        }
        private int numSymbols;
        private List<Symbol> symbols;
        private Swf _root;
        private Swf.Tag _parent;
        public int numSymbols() { return numSymbols; }
        public void setNumSymbols(int _v) { _dirty = true; numSymbols = _v; }
        public List<Symbol> symbols() { return symbols; }
        public void setSymbols(List<Symbol> _v) { _dirty = true; symbols = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.Tag _parent() { return _parent; }
        public void set_parent(Swf.Tag _v) { _dirty = true; _parent = _v; }
    }
    public static class Tag extends KaitaiStruct.ReadWrite {
        public static Tag fromFile(String fileName) throws IOException {
            return new Tag(new ByteBufferKaitaiStream(fileName));
        }
        public Tag() {
            this(null, null, null);
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
        }
        public void _read() {
            this.recordHeader = new RecordHeader(this._io, this, _root);
            this.recordHeader._read();
            {
                TagType on = recordHeader().tagType();
                if (on != null) {
                    switch (recordHeader().tagType()) {
                    case DEFINE_SOUND: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(this._raw_tagBody);
                        this.tagBody = new DefineSoundBody(_io__raw_tagBody, this, _root);
                        ((DefineSoundBody) (this.tagBody))._read();
                        break;
                    }
                    case DO_ABC: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(this._raw_tagBody);
                        this.tagBody = new DoAbcBody(_io__raw_tagBody, this, _root);
                        ((DoAbcBody) (this.tagBody))._read();
                        break;
                    }
                    case EXPORT_ASSETS: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(this._raw_tagBody);
                        this.tagBody = new SymbolClassBody(_io__raw_tagBody, this, _root);
                        ((SymbolClassBody) (this.tagBody))._read();
                        break;
                    }
                    case SCRIPT_LIMITS: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(this._raw_tagBody);
                        this.tagBody = new ScriptLimitsBody(_io__raw_tagBody, this, _root);
                        ((ScriptLimitsBody) (this.tagBody))._read();
                        break;
                    }
                    case SET_BACKGROUND_COLOR: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(this._raw_tagBody);
                        this.tagBody = new Rgb(_io__raw_tagBody, this, _root);
                        ((Rgb) (this.tagBody))._read();
                        break;
                    }
                    case SYMBOL_CLASS: {
                        this._raw_tagBody = this._io.readBytes(recordHeader().len());
                        KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(this._raw_tagBody);
                        this.tagBody = new SymbolClassBody(_io__raw_tagBody, this, _root);
                        ((SymbolClassBody) (this.tagBody))._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            this.recordHeader._fetchInstances();
            {
                TagType on = recordHeader().tagType();
                if (on != null) {
                    switch (recordHeader().tagType()) {
                    case DEFINE_SOUND: {
                        ((DefineSoundBody) (this.tagBody))._fetchInstances();
                        break;
                    }
                    case DO_ABC: {
                        ((DoAbcBody) (this.tagBody))._fetchInstances();
                        break;
                    }
                    case EXPORT_ASSETS: {
                        ((SymbolClassBody) (this.tagBody))._fetchInstances();
                        break;
                    }
                    case SCRIPT_LIMITS: {
                        ((ScriptLimitsBody) (this.tagBody))._fetchInstances();
                        break;
                    }
                    case SET_BACKGROUND_COLOR: {
                        ((Rgb) (this.tagBody))._fetchInstances();
                        break;
                    }
                    case SYMBOL_CLASS: {
                        ((SymbolClassBody) (this.tagBody))._fetchInstances();
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

        public void _write_Seq() {
            _assertNotDirty();
            this.recordHeader._write_Seq(this._io);
            {
                TagType on = recordHeader().tagType();
                if (on != null) {
                    switch (recordHeader().tagType()) {
                    case DEFINE_SOUND: {
                        final KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(recordHeader().len());
                        this._io.addChildStream(_io__raw_tagBody);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (recordHeader().len()));
                            final Tag _this = this;
                            _io__raw_tagBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_tagBody = _io__raw_tagBody.toByteArray();
                                    if (((byte[]) (_this._raw_tagBody)).length != recordHeader().len())
                                        throw new ConsistencyError("raw(tag_body)", recordHeader().len(), ((byte[]) (_this._raw_tagBody)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagBody)))));
                                }
                            });
                        }
                        ((DefineSoundBody) (this.tagBody))._write_Seq(_io__raw_tagBody);
                        break;
                    }
                    case DO_ABC: {
                        final KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(recordHeader().len());
                        this._io.addChildStream(_io__raw_tagBody);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (recordHeader().len()));
                            final Tag _this = this;
                            _io__raw_tagBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_tagBody = _io__raw_tagBody.toByteArray();
                                    if (((byte[]) (_this._raw_tagBody)).length != recordHeader().len())
                                        throw new ConsistencyError("raw(tag_body)", recordHeader().len(), ((byte[]) (_this._raw_tagBody)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagBody)))));
                                }
                            });
                        }
                        ((DoAbcBody) (this.tagBody))._write_Seq(_io__raw_tagBody);
                        break;
                    }
                    case EXPORT_ASSETS: {
                        final KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(recordHeader().len());
                        this._io.addChildStream(_io__raw_tagBody);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (recordHeader().len()));
                            final Tag _this = this;
                            _io__raw_tagBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_tagBody = _io__raw_tagBody.toByteArray();
                                    if (((byte[]) (_this._raw_tagBody)).length != recordHeader().len())
                                        throw new ConsistencyError("raw(tag_body)", recordHeader().len(), ((byte[]) (_this._raw_tagBody)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagBody)))));
                                }
                            });
                        }
                        ((SymbolClassBody) (this.tagBody))._write_Seq(_io__raw_tagBody);
                        break;
                    }
                    case SCRIPT_LIMITS: {
                        final KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(recordHeader().len());
                        this._io.addChildStream(_io__raw_tagBody);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (recordHeader().len()));
                            final Tag _this = this;
                            _io__raw_tagBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_tagBody = _io__raw_tagBody.toByteArray();
                                    if (((byte[]) (_this._raw_tagBody)).length != recordHeader().len())
                                        throw new ConsistencyError("raw(tag_body)", recordHeader().len(), ((byte[]) (_this._raw_tagBody)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagBody)))));
                                }
                            });
                        }
                        ((ScriptLimitsBody) (this.tagBody))._write_Seq(_io__raw_tagBody);
                        break;
                    }
                    case SET_BACKGROUND_COLOR: {
                        final KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(recordHeader().len());
                        this._io.addChildStream(_io__raw_tagBody);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (recordHeader().len()));
                            final Tag _this = this;
                            _io__raw_tagBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_tagBody = _io__raw_tagBody.toByteArray();
                                    if (((byte[]) (_this._raw_tagBody)).length != recordHeader().len())
                                        throw new ConsistencyError("raw(tag_body)", recordHeader().len(), ((byte[]) (_this._raw_tagBody)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagBody)))));
                                }
                            });
                        }
                        ((Rgb) (this.tagBody))._write_Seq(_io__raw_tagBody);
                        break;
                    }
                    case SYMBOL_CLASS: {
                        final KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(recordHeader().len());
                        this._io.addChildStream(_io__raw_tagBody);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (recordHeader().len()));
                            final Tag _this = this;
                            _io__raw_tagBody.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_tagBody = _io__raw_tagBody.toByteArray();
                                    if (((byte[]) (_this._raw_tagBody)).length != recordHeader().len())
                                        throw new ConsistencyError("raw(tag_body)", recordHeader().len(), ((byte[]) (_this._raw_tagBody)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagBody)))));
                                }
                            });
                        }
                        ((SymbolClassBody) (this.tagBody))._write_Seq(_io__raw_tagBody);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.tagBody)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.tagBody)))));
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.recordHeader._root(), _root()))
                throw new ConsistencyError("record_header", _root(), this.recordHeader._root());
            if (!Objects.equals(this.recordHeader._parent(), this))
                throw new ConsistencyError("record_header", this, this.recordHeader._parent());
            {
                TagType on = recordHeader().tagType();
                if (on != null) {
                    switch (recordHeader().tagType()) {
                    case DEFINE_SOUND: {
                        if (!Objects.equals(((Swf.DefineSoundBody) (this.tagBody))._root(), _root()))
                            throw new ConsistencyError("tag_body", _root(), ((Swf.DefineSoundBody) (this.tagBody))._root());
                        if (!Objects.equals(((Swf.DefineSoundBody) (this.tagBody))._parent(), this))
                            throw new ConsistencyError("tag_body", this, ((Swf.DefineSoundBody) (this.tagBody))._parent());
                        break;
                    }
                    case DO_ABC: {
                        if (!Objects.equals(((Swf.DoAbcBody) (this.tagBody))._root(), _root()))
                            throw new ConsistencyError("tag_body", _root(), ((Swf.DoAbcBody) (this.tagBody))._root());
                        if (!Objects.equals(((Swf.DoAbcBody) (this.tagBody))._parent(), this))
                            throw new ConsistencyError("tag_body", this, ((Swf.DoAbcBody) (this.tagBody))._parent());
                        break;
                    }
                    case EXPORT_ASSETS: {
                        if (!Objects.equals(((Swf.SymbolClassBody) (this.tagBody))._root(), _root()))
                            throw new ConsistencyError("tag_body", _root(), ((Swf.SymbolClassBody) (this.tagBody))._root());
                        if (!Objects.equals(((Swf.SymbolClassBody) (this.tagBody))._parent(), this))
                            throw new ConsistencyError("tag_body", this, ((Swf.SymbolClassBody) (this.tagBody))._parent());
                        break;
                    }
                    case SCRIPT_LIMITS: {
                        if (!Objects.equals(((Swf.ScriptLimitsBody) (this.tagBody))._root(), _root()))
                            throw new ConsistencyError("tag_body", _root(), ((Swf.ScriptLimitsBody) (this.tagBody))._root());
                        if (!Objects.equals(((Swf.ScriptLimitsBody) (this.tagBody))._parent(), this))
                            throw new ConsistencyError("tag_body", this, ((Swf.ScriptLimitsBody) (this.tagBody))._parent());
                        break;
                    }
                    case SET_BACKGROUND_COLOR: {
                        if (!Objects.equals(((Swf.Rgb) (this.tagBody))._root(), _root()))
                            throw new ConsistencyError("tag_body", _root(), ((Swf.Rgb) (this.tagBody))._root());
                        if (!Objects.equals(((Swf.Rgb) (this.tagBody))._parent(), this))
                            throw new ConsistencyError("tag_body", this, ((Swf.Rgb) (this.tagBody))._parent());
                        break;
                    }
                    case SYMBOL_CLASS: {
                        if (!Objects.equals(((Swf.SymbolClassBody) (this.tagBody))._root(), _root()))
                            throw new ConsistencyError("tag_body", _root(), ((Swf.SymbolClassBody) (this.tagBody))._root());
                        if (!Objects.equals(((Swf.SymbolClassBody) (this.tagBody))._parent(), this))
                            throw new ConsistencyError("tag_body", this, ((Swf.SymbolClassBody) (this.tagBody))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.tagBody)).length != recordHeader().len())
                            throw new ConsistencyError("tag_body", recordHeader().len(), ((byte[]) (this.tagBody)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.tagBody)).length != recordHeader().len())
                        throw new ConsistencyError("tag_body", recordHeader().len(), ((byte[]) (this.tagBody)).length);
                }
            }
            _dirty = false;
        }
        private RecordHeader recordHeader;
        private Object tagBody;
        private Swf _root;
        private Swf.SwfBody _parent;
        private byte[] _raw_tagBody;
        public RecordHeader recordHeader() { return recordHeader; }
        public void setRecordHeader(RecordHeader _v) { _dirty = true; recordHeader = _v; }
        public Object tagBody() { return tagBody; }
        public void setTagBody(Object _v) { _dirty = true; tagBody = _v; }
        public Swf _root() { return _root; }
        public void set_root(Swf _v) { _dirty = true; _root = _v; }
        public Swf.SwfBody _parent() { return _parent; }
        public void set_parent(Swf.SwfBody _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_tagBody() { return _raw_tagBody; }
        public void set_raw_TagBody(byte[] _v) { _dirty = true; _raw_tagBody = _v; }
    }
    private Compressions compression;
    private byte[] signature;
    private int version;
    private long lenFile;
    private SwfBody plainBody;
    private SwfBody zlibBody;
    private Swf _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_plainBody;
    private byte[] _raw_zlibBody;
    private Integer zlibBody_InnerSize;
    private byte[] _raw__raw_zlibBody;
    public Compressions compression() { return compression; }
    public void setCompression(Compressions _v) { _dirty = true; compression = _v; }
    public byte[] signature() { return signature; }
    public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
    public int version() { return version; }
    public void setVersion(int _v) { _dirty = true; version = _v; }
    public long lenFile() { return lenFile; }
    public void setLenFile(long _v) { _dirty = true; lenFile = _v; }
    public SwfBody plainBody() { return plainBody; }
    public void setPlainBody(SwfBody _v) { _dirty = true; plainBody = _v; }
    public SwfBody zlibBody() { return zlibBody; }
    public void setZlibBody(SwfBody _v) { _dirty = true; zlibBody = _v; }
    public Swf _root() { return _root; }
    public void set_root(Swf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_plainBody() { return _raw_plainBody; }
    public void set_raw_PlainBody(byte[] _v) { _dirty = true; _raw_plainBody = _v; }
    public byte[] _raw_zlibBody() { return _raw_zlibBody; }
    public void set_raw_ZlibBody(byte[] _v) { _dirty = true; _raw_zlibBody = _v; }
    public Integer zlibBody_InnerSize() { return zlibBody_InnerSize; }
    public void setZlibBody_InnerSize(Integer _v) { _dirty = true; zlibBody_InnerSize = _v; }
    public byte[] _raw__raw_zlibBody() { return _raw__raw_zlibBody; }
    public void set_raw__raw_ZlibBody(byte[] _v) { _dirty = true; _raw__raw_zlibBody = _v; }
}
