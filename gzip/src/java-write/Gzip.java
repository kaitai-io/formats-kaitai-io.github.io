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
import java.util.ArrayList;
import java.util.List;


/**
 * Gzip is a popular and standard single-file archiving format. It
 * essentially provides a container that stores original file name,
 * timestamp and a few other things (like optional comment), basic
 * CRCs, etc, and a file compressed by a chosen compression algorithm.
 * 
 * As of 2019, there is actually only one working solution for
 * compression algorithms, so it's typically raw DEFLATE stream
 * (without zlib header) in all gzipped files.
 * @see <a href="https://www.rfc-editor.org/rfc/rfc1952">Source</a>
 */
public class Gzip extends KaitaiStruct.ReadWrite {
    public static Gzip fromFile(String fileName) throws IOException {
        return new Gzip(new ByteBufferKaitaiStream(fileName));
    }

    public enum CompressionMethods {
        DEFLATE(8);

        private final long id;
        CompressionMethods(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionMethods> byId = new HashMap<Long, CompressionMethods>(1);
        static {
            for (CompressionMethods e : CompressionMethods.values())
                byId.put(e.id(), e);
        }
        public static CompressionMethods byId(long id) { return byId.get(id); }
    }

    public enum Oses {
        FAT(0),
        AMIGA(1),
        VMS(2),
        UNIX(3),
        VM_CMS(4),
        ATARI_TOS(5),
        HPFS(6),
        MACINTOSH(7),
        Z_SYSTEM(8),
        CP_M(9),
        TOPS_20(10),
        NTFS(11),
        QDOS(12),
        ACORN_RISCOS(13),
        UNKNOWN(255);

        private final long id;
        Oses(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Oses> byId = new HashMap<Long, Oses>(15);
        static {
            for (Oses e : Oses.values())
                byId.put(e.id(), e);
        }
        public static Oses byId(long id) { return byId.get(id); }
    }
    public Gzip() {
        this(null, null, null);
    }

    public Gzip(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gzip(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Gzip(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gzip _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(2);
        if (!(Arrays.equals(this.magic, new byte[] { 31, -117 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 31, -117 }, this.magic, this._io, "/seq/0");
        }
        this.compressionMethod = CompressionMethods.byId(this._io.readU1());
        this.flags = new Flags(this._io, this, _root);
        this.flags._read();
        this.modTime = this._io.readU4le();
        {
            CompressionMethods on = compressionMethod();
            if (on != null) {
                switch (compressionMethod()) {
                case DEFLATE: {
                    this.extraFlags = new ExtraFlagsDeflate(this._io, this, _root);
                    this.extraFlags._read();
                    break;
                }
                }
            }
        }
        this.os = Oses.byId(this._io.readU1());
        if (flags().hasExtra()) {
            this.extras = new Extras(this._io, this, _root);
            this.extras._read();
        }
        if (flags().hasName()) {
            this.name = this._io.readBytesTerm((byte) 0, false, true, true);
        }
        if (flags().hasComment()) {
            this.comment = this._io.readBytesTerm((byte) 0, false, true, true);
        }
        if (flags().hasHeaderCrc()) {
            this.headerCrc16 = this._io.readU2le();
        }
        this.body = this._io.readBytes((_io().size() - _io().pos()) - 8);
        this.bodyCrc32 = this._io.readU4le();
        this.lenUncompressed = this._io.readU4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.flags._fetchInstances();
        {
            CompressionMethods on = compressionMethod();
            if (on != null) {
                switch (compressionMethod()) {
                case DEFLATE: {
                    this.extraFlags._fetchInstances();
                    break;
                }
                }
            }
        }
        if (flags().hasExtra()) {
            this.extras._fetchInstances();
        }
        if (flags().hasName()) {
        }
        if (flags().hasComment()) {
        }
        if (flags().hasHeaderCrc()) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU1(((Number) (this.compressionMethod.id())).intValue());
        this.flags._write_Seq(this._io);
        this._io.writeU4le(this.modTime);
        {
            CompressionMethods on = compressionMethod();
            if (on != null) {
                switch (compressionMethod()) {
                case DEFLATE: {
                    this.extraFlags._write_Seq(this._io);
                    break;
                }
                }
            }
        }
        this._io.writeU1(((Number) (this.os.id())).intValue());
        if (flags().hasExtra()) {
            this.extras._write_Seq(this._io);
        }
        if (flags().hasName()) {
            this._io.writeBytes(this.name);
            this._io.writeU1(0);
        }
        if (flags().hasComment()) {
            this._io.writeBytes(this.comment);
            this._io.writeU1(0);
        }
        if (flags().hasHeaderCrc()) {
            this._io.writeU2le(this.headerCrc16);
        }
        if (this.body.length != (_io().size() - _io().pos()) - 8)
            throw new ConsistencyError("body", (_io().size() - _io().pos()) - 8, this.body.length);
        this._io.writeBytes(this.body);
        this._io.writeU4le(this.bodyCrc32);
        this._io.writeU4le(this.lenUncompressed);
    }

    public void _check() {
        if (this.magic.length != 2)
            throw new ConsistencyError("magic", 2, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 31, -117 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 31, -117 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.flags._root(), _root()))
            throw new ConsistencyError("flags", _root(), this.flags._root());
        if (!Objects.equals(this.flags._parent(), this))
            throw new ConsistencyError("flags", this, this.flags._parent());
        {
            CompressionMethods on = compressionMethod();
            if (on != null) {
                switch (compressionMethod()) {
                case DEFLATE: {
                    if (!Objects.equals(this.extraFlags._root(), _root()))
                        throw new ConsistencyError("extra_flags", _root(), this.extraFlags._root());
                    if (!Objects.equals(this.extraFlags._parent(), this))
                        throw new ConsistencyError("extra_flags", this, this.extraFlags._parent());
                    break;
                }
                }
            }
        }
        if (flags().hasExtra()) {
            if (!Objects.equals(this.extras._root(), _root()))
                throw new ConsistencyError("extras", _root(), this.extras._root());
            if (!Objects.equals(this.extras._parent(), this))
                throw new ConsistencyError("extras", this, this.extras._parent());
        }
        if (flags().hasName()) {
            if (KaitaiStream.byteArrayIndexOf(this.name, ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf(this.name, ((byte) 0)));
        }
        if (flags().hasComment()) {
            if (KaitaiStream.byteArrayIndexOf(this.comment, ((byte) 0)) != -1)
                throw new ConsistencyError("comment", -1, KaitaiStream.byteArrayIndexOf(this.comment, ((byte) 0)));
        }
        if (flags().hasHeaderCrc()) {
        }
        _dirty = false;
    }
    public static class ExtraFlagsDeflate extends KaitaiStruct.ReadWrite {
        public static ExtraFlagsDeflate fromFile(String fileName) throws IOException {
            return new ExtraFlagsDeflate(new ByteBufferKaitaiStream(fileName));
        }

        public enum CompressionStrengths {
            BEST(2),
            FAST(4);

            private final long id;
            CompressionStrengths(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CompressionStrengths> byId = new HashMap<Long, CompressionStrengths>(2);
            static {
                for (CompressionStrengths e : CompressionStrengths.values())
                    byId.put(e.id(), e);
            }
            public static CompressionStrengths byId(long id) { return byId.get(id); }
        }
        public ExtraFlagsDeflate() {
            this(null, null, null);
        }

        public ExtraFlagsDeflate(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtraFlagsDeflate(KaitaiStream _io, Gzip _parent) {
            this(_io, _parent, null);
        }

        public ExtraFlagsDeflate(KaitaiStream _io, Gzip _parent, Gzip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.compressionStrength = CompressionStrengths.byId(this._io.readU1());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.compressionStrength.id())).intValue());
        }

        public void _check() {
            _dirty = false;
        }
        private CompressionStrengths compressionStrength;
        private Gzip _root;
        private Gzip _parent;
        public CompressionStrengths compressionStrength() { return compressionStrength; }
        public void setCompressionStrength(CompressionStrengths _v) { _dirty = true; compressionStrength = _v; }
        public Gzip _root() { return _root; }
        public void set_root(Gzip _v) { _dirty = true; _root = _v; }
        public Gzip _parent() { return _parent; }
        public void set_parent(Gzip _v) { _dirty = true; _parent = _v; }
    }
    public static class Extras extends KaitaiStruct.ReadWrite {
        public static Extras fromFile(String fileName) throws IOException {
            return new Extras(new ByteBufferKaitaiStream(fileName));
        }
        public Extras() {
            this(null, null, null);
        }

        public Extras(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extras(KaitaiStream _io, Gzip _parent) {
            this(_io, _parent, null);
        }

        public Extras(KaitaiStream _io, Gzip _parent, Gzip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenSubfields = this._io.readU2le();
            this._raw_subfields = this._io.readBytes(lenSubfields());
            KaitaiStream _io__raw_subfields = new ByteBufferKaitaiStream(this._raw_subfields);
            this.subfields = new Subfields(_io__raw_subfields, this, _root);
            this.subfields._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.subfields._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.lenSubfields);
            final KaitaiStream _io__raw_subfields = new ByteBufferKaitaiStream(lenSubfields());
            this._io.addChildStream(_io__raw_subfields);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenSubfields()));
                final Extras _this = this;
                _io__raw_subfields.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_subfields = _io__raw_subfields.toByteArray();
                        if (_this._raw_subfields.length != lenSubfields())
                            throw new ConsistencyError("raw(subfields)", lenSubfields(), _this._raw_subfields.length);
                        parent.writeBytes(_this._raw_subfields);
                    }
                });
            }
            this.subfields._write_Seq(_io__raw_subfields);
        }

        public void _check() {
            if (!Objects.equals(this.subfields._root(), _root()))
                throw new ConsistencyError("subfields", _root(), this.subfields._root());
            if (!Objects.equals(this.subfields._parent(), this))
                throw new ConsistencyError("subfields", this, this.subfields._parent());
            _dirty = false;
        }
        private int lenSubfields;
        private Subfields subfields;
        private Gzip _root;
        private Gzip _parent;
        private byte[] _raw_subfields;
        public int lenSubfields() { return lenSubfields; }
        public void setLenSubfields(int _v) { _dirty = true; lenSubfields = _v; }
        public Subfields subfields() { return subfields; }
        public void setSubfields(Subfields _v) { _dirty = true; subfields = _v; }
        public Gzip _root() { return _root; }
        public void set_root(Gzip _v) { _dirty = true; _root = _v; }
        public Gzip _parent() { return _parent; }
        public void set_parent(Gzip _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_subfields() { return _raw_subfields; }
        public void set_raw_Subfields(byte[] _v) { _dirty = true; _raw_subfields = _v; }
    }
    public static class Flags extends KaitaiStruct.ReadWrite {
        public static Flags fromFile(String fileName) throws IOException {
            return new Flags(new ByteBufferKaitaiStream(fileName));
        }
        public Flags() {
            this(null, null, null);
        }

        public Flags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Flags(KaitaiStream _io, Gzip _parent) {
            this(_io, _parent, null);
        }

        public Flags(KaitaiStream _io, Gzip _parent, Gzip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved1 = this._io.readBitsIntBe(3);
            this.hasComment = this._io.readBitsIntBe(1) != 0;
            this.hasName = this._io.readBitsIntBe(1) != 0;
            this.hasExtra = this._io.readBitsIntBe(1) != 0;
            this.hasHeaderCrc = this._io.readBitsIntBe(1) != 0;
            this.isText = this._io.readBitsIntBe(1) != 0;
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(3, this.reserved1);
            this._io.writeBitsIntBe(1, (this.hasComment ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasName ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasExtra ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasHeaderCrc ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isText ? 1 : 0));
        }

        public void _check() {
            _dirty = false;
        }
        private long reserved1;
        private boolean hasComment;
        private boolean hasName;
        private boolean hasExtra;
        private boolean hasHeaderCrc;
        private boolean isText;
        private Gzip _root;
        private Gzip _parent;
        public long reserved1() { return reserved1; }
        public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
        public boolean hasComment() { return hasComment; }
        public void setHasComment(boolean _v) { _dirty = true; hasComment = _v; }
        public boolean hasName() { return hasName; }
        public void setHasName(boolean _v) { _dirty = true; hasName = _v; }

        /**
         * If true, optional extra fields are present in the archive.
         */
        public boolean hasExtra() { return hasExtra; }
        public void setHasExtra(boolean _v) { _dirty = true; hasExtra = _v; }

        /**
         * If true, this archive includes a CRC16 checksum for the header.
         */
        public boolean hasHeaderCrc() { return hasHeaderCrc; }
        public void setHasHeaderCrc(boolean _v) { _dirty = true; hasHeaderCrc = _v; }

        /**
         * If true, file inside this archive is a text file from
         * compressor's point of view.
         */
        public boolean isText() { return isText; }
        public void setIsText(boolean _v) { _dirty = true; isText = _v; }
        public Gzip _root() { return _root; }
        public void set_root(Gzip _v) { _dirty = true; _root = _v; }
        public Gzip _parent() { return _parent; }
        public void set_parent(Gzip _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
     * 
     * * `id` serves role of "T"ype
     * * `len_data` serves role of "L"ength
     * * `data` serves role of "V"alue
     * 
     * This way it's possible to for arbitrary parser to skip over
     * subfields it does not support.
     */
    public static class Subfield extends KaitaiStruct.ReadWrite {
        public static Subfield fromFile(String fileName) throws IOException {
            return new Subfield(new ByteBufferKaitaiStream(fileName));
        }
        public Subfield() {
            this(null, null, null);
        }

        public Subfield(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subfield(KaitaiStream _io, Gzip.Subfields _parent) {
            this(_io, _parent, null);
        }

        public Subfield(KaitaiStream _io, Gzip.Subfields _parent, Gzip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU2le();
            this.lenData = this._io.readU2le();
            this.data = this._io.readBytes(lenData());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.id);
            this._io.writeU2le(this.lenData);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            _dirty = false;
        }
        private int id;
        private int lenData;
        private byte[] data;
        private Gzip _root;
        private Gzip.Subfields _parent;

        /**
         * Subfield ID, typically two ASCII letters.
         */
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public int lenData() { return lenData; }
        public void setLenData(int _v) { _dirty = true; lenData = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Gzip _root() { return _root; }
        public void set_root(Gzip _v) { _dirty = true; _root = _v; }
        public Gzip.Subfields _parent() { return _parent; }
        public void set_parent(Gzip.Subfields _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Container for many subfields, constrained by size of stream.
     */
    public static class Subfields extends KaitaiStruct.ReadWrite {
        public static Subfields fromFile(String fileName) throws IOException {
            return new Subfields(new ByteBufferKaitaiStream(fileName));
        }
        public Subfields() {
            this(null, null, null);
        }

        public Subfields(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subfields(KaitaiStream _io, Gzip.Extras _parent) {
            this(_io, _parent, null);
        }

        public Subfields(KaitaiStream _io, Gzip.Extras _parent, Gzip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Subfield>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Subfield _t_entries = new Subfield(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Subfield> entries;
        private Gzip _root;
        private Gzip.Extras _parent;
        public List<Subfield> entries() { return entries; }
        public void setEntries(List<Subfield> _v) { _dirty = true; entries = _v; }
        public Gzip _root() { return _root; }
        public void set_root(Gzip _v) { _dirty = true; _root = _v; }
        public Gzip.Extras _parent() { return _parent; }
        public void set_parent(Gzip.Extras _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private CompressionMethods compressionMethod;
    private Flags flags;
    private long modTime;
    private ExtraFlagsDeflate extraFlags;
    private Oses os;
    private Extras extras;
    private byte[] name;
    private byte[] comment;
    private Integer headerCrc16;
    private byte[] body;
    private long bodyCrc32;
    private long lenUncompressed;
    private Gzip _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * Compression method used to compress file body. In practice, only
     * one method is widely used: 8 = deflate.
     */
    public CompressionMethods compressionMethod() { return compressionMethod; }
    public void setCompressionMethod(CompressionMethods _v) { _dirty = true; compressionMethod = _v; }
    public Flags flags() { return flags; }
    public void setFlags(Flags _v) { _dirty = true; flags = _v; }

    /**
     * Last modification time of a file archived in UNIX timestamp format.
     */
    public long modTime() { return modTime; }
    public void setModTime(long _v) { _dirty = true; modTime = _v; }

    /**
     * Extra flags, specific to compression method chosen.
     */
    public ExtraFlagsDeflate extraFlags() { return extraFlags; }
    public void setExtraFlags(ExtraFlagsDeflate _v) { _dirty = true; extraFlags = _v; }

    /**
     * OS used to compress this file.
     */
    public Oses os() { return os; }
    public void setOs(Oses _v) { _dirty = true; os = _v; }
    public Extras extras() { return extras; }
    public void setExtras(Extras _v) { _dirty = true; extras = _v; }
    public byte[] name() { return name; }
    public void setName(byte[] _v) { _dirty = true; name = _v; }
    public byte[] comment() { return comment; }
    public void setComment(byte[] _v) { _dirty = true; comment = _v; }
    public Integer headerCrc16() { return headerCrc16; }
    public void setHeaderCrc16(Integer _v) { _dirty = true; headerCrc16 = _v; }

    /**
     * Compressed body of a file archived. Note that we don't make an
     * attempt to decompress it here.
     */
    public byte[] body() { return body; }
    public void setBody(byte[] _v) { _dirty = true; body = _v; }

    /**
     * CRC32 checksum of an uncompressed file body
     */
    public long bodyCrc32() { return bodyCrc32; }
    public void setBodyCrc32(long _v) { _dirty = true; bodyCrc32 = _v; }

    /**
     * Size of original uncompressed data in bytes (truncated to 32
     * bits).
     */
    public long lenUncompressed() { return lenUncompressed; }
    public void setLenUncompressed(long _v) { _dirty = true; lenUncompressed = _v; }
    public Gzip _root() { return _root; }
    public void set_root(Gzip _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
