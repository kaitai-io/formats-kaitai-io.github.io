// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class Swf extends KaitaiStruct {
    public static Swf fromFile(String fileName) throws IOException {
        return new Swf(new ByteBufferKaitaiStream(fileName));
    }

    public enum TagType {
        FILE_ATTRIBUTES(69),
        ABC_TAG(82);

        private final long id;
        TagType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TagType> byId = new HashMap<Long, TagType>(2);
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
        this.junk = this._io.readBytes(4);
        this.fileSize = this._io.readU4le();
        this._raw__raw_body = this._io.readBytesFull();
        this._raw_body = KaitaiStream.processZlib(this._raw__raw_body);
        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
        this.body = new SwfBody(_io__raw_body, this, _root);
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
        private ArrayList<Tag> tags;
        private Swf _root;
        private Swf _parent;
        public Rect rect() { return rect; }
        public int frameRate() { return frameRate; }
        public int frameCount() { return frameCount; }
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
            switch (recordHeader().tagType()) {
            case ABC_TAG: {
                this._raw_tagBody = this._io.readBytes(recordHeader().len());
                KaitaiStream _io__raw_tagBody = new ByteBufferKaitaiStream(_raw_tagBody);
                this.tagBody = new AbcTagBody(_io__raw_tagBody, this, _root);
                break;
            }
            default: {
                this.tagBody = this._io.readBytes(recordHeader().len());
                break;
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
    public static class AbcTagBody extends KaitaiStruct {
        public static AbcTagBody fromFile(String fileName) throws IOException {
            return new AbcTagBody(new ByteBufferKaitaiStream(fileName));
        }

        public AbcTagBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AbcTagBody(KaitaiStream _io, Swf.Tag _parent) {
            this(_io, _parent, null);
        }

        public AbcTagBody(KaitaiStream _io, Swf.Tag _parent, Swf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.flags = this._io.readU4le();
            this.name = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
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
    private byte[] junk;
    private long fileSize;
    private SwfBody body;
    private Swf _root;
    private KaitaiStruct _parent;
    private byte[] _raw__raw_body;
    private byte[] _raw_body;
    public byte[] junk() { return junk; }
    public long fileSize() { return fileSize; }
    public SwfBody body() { return body; }
    public Swf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw__raw_body() { return _raw__raw_body; }
    public byte[] _raw_body() { return _raw_body; }
}
