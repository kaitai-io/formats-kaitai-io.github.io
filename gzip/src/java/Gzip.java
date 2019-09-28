// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * Gzip is a popular and standard single-file archiving format. It
 * essentially provides a container that stores original file name,
 * timestamp and a few other things (like optional comment), basic
 * CRCs, etc, and a file compressed by a chosen compression algorithm.
 * 
 * As of 2019, there is actually only one working solution for
 * compression algorithms, so it's typically raw DEFLATE stream
 * (without zlib header) in all gzipped files.
 * @see <a href="https://tools.ietf.org/html/rfc1952">Source</a>
 */
public class Gzip extends KaitaiStruct {
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

    public Gzip(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gzip(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gzip(KaitaiStream _io, KaitaiStruct _parent, Gzip _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.ensureFixedContents(new byte[] { 31, -117 });
        this.compressionMethod = CompressionMethods.byId(this._io.readU1());
        this.flags = new Flags(this._io, this, _root);
        this.modTime = this._io.readU4le();
        {
            CompressionMethods on = compressionMethod();
            if (on != null) {
                switch (compressionMethod()) {
                case DEFLATE: {
                    this.extraFlags = new ExtraFlagsDeflate(this._io, this, _root);
                    break;
                }
                }
            }
        }
        this.os = Oses.byId(this._io.readU1());
        if (flags().hasExtra()) {
            this.extras = new Extras(this._io, this, _root);
        }
        if (flags().hasName()) {
            this.name = this._io.readBytesTerm(0, false, true, true);
        }
        if (flags().hasComment()) {
            this.comment = this._io.readBytesTerm(0, false, true, true);
        }
        if (flags().hasHeaderCrc()) {
            this.headerCrc16 = this._io.readU2le();
        }
        this.body = this._io.readBytes(((_io().size() - _io().pos()) - 8));
        this.bodyCrc32 = this._io.readU4le();
        this.lenUncompressed = this._io.readU4le();
    }
    public static class Flags extends KaitaiStruct {
        public static Flags fromFile(String fileName) throws IOException {
            return new Flags(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.reserved1 = this._io.readBitsInt(3);
            this.hasComment = this._io.readBitsInt(1) != 0;
            this.hasName = this._io.readBitsInt(1) != 0;
            this.hasExtra = this._io.readBitsInt(1) != 0;
            this.hasHeaderCrc = this._io.readBitsInt(1) != 0;
            this.isText = this._io.readBitsInt(1) != 0;
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
        public boolean hasComment() { return hasComment; }
        public boolean hasName() { return hasName; }

        /**
         * If true, optional extra fields are present in the archive.
         */
        public boolean hasExtra() { return hasExtra; }

        /**
         * If true, this archive includes a CRC16 checksum for the header.
         */
        public boolean hasHeaderCrc() { return hasHeaderCrc; }

        /**
         * If true, file inside this archive is a text file from
         * compressor's point of view.
         */
        public boolean isText() { return isText; }
        public Gzip _root() { return _root; }
        public Gzip _parent() { return _parent; }
    }
    public static class ExtraFlagsDeflate extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.compressionStrength = CompressionStrengths.byId(this._io.readU1());
        }
        private CompressionStrengths compressionStrength;
        private Gzip _root;
        private Gzip _parent;
        public CompressionStrengths compressionStrength() { return compressionStrength; }
        public Gzip _root() { return _root; }
        public Gzip _parent() { return _parent; }
    }

    /**
     * Container for many subfields, constrained by size of stream.
     */
    public static class Subfields extends KaitaiStruct {
        public static Subfields fromFile(String fileName) throws IOException {
            return new Subfields(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Subfield>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new Subfield(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Subfield> entries;
        private Gzip _root;
        private Gzip.Extras _parent;
        public ArrayList<Subfield> entries() { return entries; }
        public Gzip _root() { return _root; }
        public Gzip.Extras _parent() { return _parent; }
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
    public static class Subfield extends KaitaiStruct {
        public static Subfield fromFile(String fileName) throws IOException {
            return new Subfield(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.id = this._io.readU2le();
            this.lenData = this._io.readU2le();
            this.data = this._io.readBytes(lenData());
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
        public int lenData() { return lenData; }
        public byte[] data() { return data; }
        public Gzip _root() { return _root; }
        public Gzip.Subfields _parent() { return _parent; }
    }
    public static class Extras extends KaitaiStruct {
        public static Extras fromFile(String fileName) throws IOException {
            return new Extras(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenSubfields = this._io.readU2le();
            this._raw_subfields = this._io.readBytes(lenSubfields());
            KaitaiStream _io__raw_subfields = new ByteBufferKaitaiStream(_raw_subfields);
            this.subfields = new Subfields(_io__raw_subfields, this, _root);
        }
        private int lenSubfields;
        private Subfields subfields;
        private Gzip _root;
        private Gzip _parent;
        private byte[] _raw_subfields;
        public int lenSubfields() { return lenSubfields; }
        public Subfields subfields() { return subfields; }
        public Gzip _root() { return _root; }
        public Gzip _parent() { return _parent; }
        public byte[] _raw_subfields() { return _raw_subfields; }
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
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }

    /**
     * Compression method used to compress file body. In practice, only
     * one method is widely used: 8 = deflate.
     */
    public CompressionMethods compressionMethod() { return compressionMethod; }
    public Flags flags() { return flags; }

    /**
     * Last modification time of a file archived in UNIX timestamp format.
     */
    public long modTime() { return modTime; }

    /**
     * Extra flags, specific to compression method chosen.
     */
    public ExtraFlagsDeflate extraFlags() { return extraFlags; }

    /**
     * OS used to compress this file.
     */
    public Oses os() { return os; }
    public Extras extras() { return extras; }
    public byte[] name() { return name; }
    public byte[] comment() { return comment; }
    public Integer headerCrc16() { return headerCrc16; }

    /**
     * Compressed body of a file archived. Note that we don't make an
     * attempt to decompress it here.
     */
    public byte[] body() { return body; }

    /**
     * CRC32 checksum of an uncompressed file body
     */
    public long bodyCrc32() { return bodyCrc32; }

    /**
     * Size of original uncompressed data in bytes (truncated to 32
     * bits).
     */
    public long lenUncompressed() { return lenUncompressed; }
    public Gzip _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
