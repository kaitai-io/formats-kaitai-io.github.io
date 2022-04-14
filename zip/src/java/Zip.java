// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * ZIP is a popular archive file format, introduced in 1989 by Phil Katz
 * and originally implemented in PKZIP utility by PKWARE.
 * 
 * Thanks to solid support of it in most desktop environments and
 * operating systems, and algorithms / specs availability in public
 * domain, it quickly became tool of choice for implementing file
 * containers.
 * 
 * For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
 * are actually ZIP archives.
 * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">Source</a>
 * @see <a href="https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html">Source</a>
 */
public class Zip extends KaitaiStruct {
    public static Zip fromFile(String fileName) throws IOException {
        return new Zip(new ByteBufferKaitaiStream(fileName));
    }

    public enum Compression {
        NONE(0),
        SHRUNK(1),
        REDUCED_1(2),
        REDUCED_2(3),
        REDUCED_3(4),
        REDUCED_4(5),
        IMPLODED(6),
        DEFLATED(8),
        ENHANCED_DEFLATED(9),
        PKWARE_DCL_IMPLODED(10),
        BZIP2(12),
        LZMA(14),
        IBM_TERSE(18),
        IBM_LZ77_Z(19),
        ZSTANDARD(93),
        MP3(94),
        XZ(95),
        JPEG(96),
        WAVPACK(97),
        PPMD(98),
        AEX_ENCRYPTION_MARKER(99);

        private final long id;
        Compression(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compression> byId = new HashMap<Long, Compression>(21);
        static {
            for (Compression e : Compression.values())
                byId.put(e.id(), e);
        }
        public static Compression byId(long id) { return byId.get(id); }
    }

    public enum ExtraCodes {
        ZIP64(1),
        AV_INFO(7),
        OS2(9),
        NTFS(10),
        OPENVMS(12),
        PKWARE_UNIX(13),
        FILE_STREAM_AND_FORK_DESCRIPTORS(14),
        PATCH_DESCRIPTOR(15),
        PKCS7(20),
        X509_CERT_ID_AND_SIGNATURE_FOR_FILE(21),
        X509_CERT_ID_FOR_CENTRAL_DIR(22),
        STRONG_ENCRYPTION_HEADER(23),
        RECORD_MANAGEMENT_CONTROLS(24),
        PKCS7_ENC_RECIP_CERT_LIST(25),
        IBM_S390_UNCOMP(101),
        IBM_S390_COMP(102),
        POSZIP_4690(18064),
        EXTENDED_TIMESTAMP(21589),
        BEOS(25922),
        ASI_UNIX(30062),
        INFOZIP_UNIX(30805),
        INFOZIP_UNIX_VAR_SIZE(30837),
        AEX_ENCRYPTION(39169),
        APACHE_COMMONS_COMPRESS(41246),
        MICROSOFT_OPEN_PACKAGING_GROWTH_HINT(41504),
        SMS_QDOS(64842);

        private final long id;
        ExtraCodes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ExtraCodes> byId = new HashMap<Long, ExtraCodes>(26);
        static {
            for (ExtraCodes e : ExtraCodes.values())
                byId.put(e.id(), e);
        }
        public static ExtraCodes byId(long id) { return byId.get(id); }
    }

    public Zip(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Zip(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Zip(KaitaiStream _io, KaitaiStruct _parent, Zip _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.sections = new ArrayList<PkSection>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.sections.add(new PkSection(this._io, this, _root));
                i++;
            }
        }
    }
    public static class LocalFile extends KaitaiStruct {
        public static LocalFile fromFile(String fileName) throws IOException {
            return new LocalFile(new ByteBufferKaitaiStream(fileName));
        }

        public LocalFile(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocalFile(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public LocalFile(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new LocalFileHeader(this._io, this, _root);
            this.body = this._io.readBytes(header().lenBodyCompressed());
        }
        private LocalFileHeader header;
        private byte[] body;
        private Zip _root;
        private Zip.PkSection _parent;
        public LocalFileHeader header() { return header; }
        public byte[] body() { return body; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
    }
    public static class DataDescriptor extends KaitaiStruct {
        public static DataDescriptor fromFile(String fileName) throws IOException {
            return new DataDescriptor(new ByteBufferKaitaiStream(fileName));
        }

        public DataDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataDescriptor(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public DataDescriptor(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.crc32 = this._io.readU4le();
            this.lenBodyCompressed = this._io.readU4le();
            this.lenBodyUncompressed = this._io.readU4le();
        }
        private long crc32;
        private long lenBodyCompressed;
        private long lenBodyUncompressed;
        private Zip _root;
        private Zip.PkSection _parent;
        public long crc32() { return crc32; }
        public long lenBodyCompressed() { return lenBodyCompressed; }
        public long lenBodyUncompressed() { return lenBodyUncompressed; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
    }
    public static class ExtraField extends KaitaiStruct {
        public static ExtraField fromFile(String fileName) throws IOException {
            return new ExtraField(new ByteBufferKaitaiStream(fileName));
        }

        public ExtraField(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtraField(KaitaiStream _io, Zip.Extras _parent) {
            this(_io, _parent, null);
        }

        public ExtraField(KaitaiStream _io, Zip.Extras _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = Zip.ExtraCodes.byId(this._io.readU2le());
            this.lenBody = this._io.readU2le();
            {
                ExtraCodes on = code();
                if (on != null) {
                    switch (code()) {
                    case NTFS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new Ntfs(_io__raw_body, this, _root);
                        break;
                    }
                    case EXTENDED_TIMESTAMP: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new ExtendedTimestamp(_io__raw_body, this, _root);
                        break;
                    }
                    case INFOZIP_UNIX_VAR_SIZE: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new InfozipUnixVarSize(_io__raw_body, this, _root);
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
        }

        /**
         * @see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191">Source</a>
         */
        public static class Ntfs extends KaitaiStruct {
            public static Ntfs fromFile(String fileName) throws IOException {
                return new Ntfs(new ByteBufferKaitaiStream(fileName));
            }

            public Ntfs(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Ntfs(KaitaiStream _io, Zip.ExtraField _parent) {
                this(_io, _parent, null);
            }

            public Ntfs(KaitaiStream _io, Zip.ExtraField _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.reserved = this._io.readU4le();
                this.attributes = new ArrayList<Attribute>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.attributes.add(new Attribute(this._io, this, _root));
                        i++;
                    }
                }
            }
            public static class Attribute extends KaitaiStruct {
                public static Attribute fromFile(String fileName) throws IOException {
                    return new Attribute(new ByteBufferKaitaiStream(fileName));
                }

                public Attribute(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Attribute(KaitaiStream _io, Zip.ExtraField.Ntfs _parent) {
                    this(_io, _parent, null);
                }

                public Attribute(KaitaiStream _io, Zip.ExtraField.Ntfs _parent, Zip _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.tag = this._io.readU2le();
                    this.lenBody = this._io.readU2le();
                    switch (tag()) {
                    case 1: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new Attribute1(_io__raw_body, this, _root);
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(lenBody());
                        break;
                    }
                    }
                }
                private int tag;
                private int lenBody;
                private Object body;
                private Zip _root;
                private Zip.ExtraField.Ntfs _parent;
                private byte[] _raw_body;
                public int tag() { return tag; }
                public int lenBody() { return lenBody; }
                public Object body() { return body; }
                public Zip _root() { return _root; }
                public Zip.ExtraField.Ntfs _parent() { return _parent; }
                public byte[] _raw_body() { return _raw_body; }
            }
            public static class Attribute1 extends KaitaiStruct {
                public static Attribute1 fromFile(String fileName) throws IOException {
                    return new Attribute1(new ByteBufferKaitaiStream(fileName));
                }

                public Attribute1(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Attribute1(KaitaiStream _io, Zip.ExtraField.Ntfs.Attribute _parent) {
                    this(_io, _parent, null);
                }

                public Attribute1(KaitaiStream _io, Zip.ExtraField.Ntfs.Attribute _parent, Zip _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.lastModTime = this._io.readU8le();
                    this.lastAccessTime = this._io.readU8le();
                    this.creationTime = this._io.readU8le();
                }
                private long lastModTime;
                private long lastAccessTime;
                private long creationTime;
                private Zip _root;
                private Zip.ExtraField.Ntfs.Attribute _parent;
                public long lastModTime() { return lastModTime; }
                public long lastAccessTime() { return lastAccessTime; }
                public long creationTime() { return creationTime; }
                public Zip _root() { return _root; }
                public Zip.ExtraField.Ntfs.Attribute _parent() { return _parent; }
            }
            private long reserved;
            private ArrayList<Attribute> attributes;
            private Zip _root;
            private Zip.ExtraField _parent;
            public long reserved() { return reserved; }
            public ArrayList<Attribute> attributes() { return attributes; }
            public Zip _root() { return _root; }
            public Zip.ExtraField _parent() { return _parent; }
        }

        /**
         * @see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817">Source</a>
         */
        public static class ExtendedTimestamp extends KaitaiStruct {
            public static ExtendedTimestamp fromFile(String fileName) throws IOException {
                return new ExtendedTimestamp(new ByteBufferKaitaiStream(fileName));
            }

            public ExtendedTimestamp(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ExtendedTimestamp(KaitaiStream _io, Zip.ExtraField _parent) {
                this(_io, _parent, null);
            }

            public ExtendedTimestamp(KaitaiStream _io, Zip.ExtraField _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this._raw_flags = this._io.readBytes(1);
                KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(_raw_flags);
                this.flags = new InfoFlags(_io__raw_flags, this, _root);
                if (flags().hasModTime()) {
                    this.modTime = this._io.readU4le();
                }
                if (flags().hasAccessTime()) {
                    this.accessTime = this._io.readU4le();
                }
                if (flags().hasCreateTime()) {
                    this.createTime = this._io.readU4le();
                }
            }
            public static class InfoFlags extends KaitaiStruct {
                public static InfoFlags fromFile(String fileName) throws IOException {
                    return new InfoFlags(new ByteBufferKaitaiStream(fileName));
                }

                public InfoFlags(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public InfoFlags(KaitaiStream _io, Zip.ExtraField.ExtendedTimestamp _parent) {
                    this(_io, _parent, null);
                }

                public InfoFlags(KaitaiStream _io, Zip.ExtraField.ExtendedTimestamp _parent, Zip _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.hasModTime = this._io.readBitsIntLe(1) != 0;
                    this.hasAccessTime = this._io.readBitsIntLe(1) != 0;
                    this.hasCreateTime = this._io.readBitsIntLe(1) != 0;
                    this.reserved = this._io.readBitsIntLe(5);
                }
                private boolean hasModTime;
                private boolean hasAccessTime;
                private boolean hasCreateTime;
                private long reserved;
                private Zip _root;
                private Zip.ExtraField.ExtendedTimestamp _parent;
                public boolean hasModTime() { return hasModTime; }
                public boolean hasAccessTime() { return hasAccessTime; }
                public boolean hasCreateTime() { return hasCreateTime; }
                public long reserved() { return reserved; }
                public Zip _root() { return _root; }
                public Zip.ExtraField.ExtendedTimestamp _parent() { return _parent; }
            }
            private InfoFlags flags;
            private Long modTime;
            private Long accessTime;
            private Long createTime;
            private Zip _root;
            private Zip.ExtraField _parent;
            private byte[] _raw_flags;
            public InfoFlags flags() { return flags; }

            /**
             * Unix timestamp
             */
            public Long modTime() { return modTime; }

            /**
             * Unix timestamp
             */
            public Long accessTime() { return accessTime; }

            /**
             * Unix timestamp
             */
            public Long createTime() { return createTime; }
            public Zip _root() { return _root; }
            public Zip.ExtraField _parent() { return _parent; }
            public byte[] _raw_flags() { return _raw_flags; }
        }

        /**
         * @see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339">Source</a>
         */
        public static class InfozipUnixVarSize extends KaitaiStruct {
            public static InfozipUnixVarSize fromFile(String fileName) throws IOException {
                return new InfozipUnixVarSize(new ByteBufferKaitaiStream(fileName));
            }

            public InfozipUnixVarSize(KaitaiStream _io) {
                this(_io, null, null);
            }

            public InfozipUnixVarSize(KaitaiStream _io, Zip.ExtraField _parent) {
                this(_io, _parent, null);
            }

            public InfozipUnixVarSize(KaitaiStream _io, Zip.ExtraField _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.version = this._io.readU1();
                this.lenUid = this._io.readU1();
                this.uid = this._io.readBytes(lenUid());
                this.lenGid = this._io.readU1();
                this.gid = this._io.readBytes(lenGid());
            }
            private int version;
            private int lenUid;
            private byte[] uid;
            private int lenGid;
            private byte[] gid;
            private Zip _root;
            private Zip.ExtraField _parent;

            /**
             * Version of this extra field, currently 1
             */
            public int version() { return version; }

            /**
             * Size of UID field
             */
            public int lenUid() { return lenUid; }

            /**
             * UID (User ID) for a file
             */
            public byte[] uid() { return uid; }

            /**
             * Size of GID field
             */
            public int lenGid() { return lenGid; }

            /**
             * GID (Group ID) for a file
             */
            public byte[] gid() { return gid; }
            public Zip _root() { return _root; }
            public Zip.ExtraField _parent() { return _parent; }
        }
        private ExtraCodes code;
        private int lenBody;
        private Object body;
        private Zip _root;
        private Zip.Extras _parent;
        private byte[] _raw_body;
        public ExtraCodes code() { return code; }
        public int lenBody() { return lenBody; }
        public Object body() { return body; }
        public Zip _root() { return _root; }
        public Zip.Extras _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }

    /**
     * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.3.12</a>
     */
    public static class CentralDirEntry extends KaitaiStruct {
        public static CentralDirEntry fromFile(String fileName) throws IOException {
            return new CentralDirEntry(new ByteBufferKaitaiStream(fileName));
        }

        public CentralDirEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CentralDirEntry(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public CentralDirEntry(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.versionMadeBy = this._io.readU2le();
            this.versionNeededToExtract = this._io.readU2le();
            this.flags = this._io.readU2le();
            this.compressionMethod = Zip.Compression.byId(this._io.readU2le());
            this._raw_fileModTime = this._io.readBytes(4);
            KaitaiStream _io__raw_fileModTime = new ByteBufferKaitaiStream(_raw_fileModTime);
            this.fileModTime = new DosDatetime(_io__raw_fileModTime);
            this.crc32 = this._io.readU4le();
            this.lenBodyCompressed = this._io.readU4le();
            this.lenBodyUncompressed = this._io.readU4le();
            this.lenFileName = this._io.readU2le();
            this.lenExtra = this._io.readU2le();
            this.lenComment = this._io.readU2le();
            this.diskNumberStart = this._io.readU2le();
            this.intFileAttr = this._io.readU2le();
            this.extFileAttr = this._io.readU4le();
            this.ofsLocalHeader = this._io.readS4le();
            this.fileName = new String(this._io.readBytes(lenFileName()), Charset.forName("UTF-8"));
            this._raw_extra = this._io.readBytes(lenExtra());
            KaitaiStream _io__raw_extra = new ByteBufferKaitaiStream(_raw_extra);
            this.extra = new Extras(_io__raw_extra, this, _root);
            this.comment = new String(this._io.readBytes(lenComment()), Charset.forName("UTF-8"));
        }
        private PkSection localHeader;
        public PkSection localHeader() {
            if (this.localHeader != null)
                return this.localHeader;
            long _pos = this._io.pos();
            this._io.seek(ofsLocalHeader());
            this.localHeader = new PkSection(this._io, this, _root);
            this._io.seek(_pos);
            return this.localHeader;
        }
        private int versionMadeBy;
        private int versionNeededToExtract;
        private int flags;
        private Compression compressionMethod;
        private DosDatetime fileModTime;
        private long crc32;
        private long lenBodyCompressed;
        private long lenBodyUncompressed;
        private int lenFileName;
        private int lenExtra;
        private int lenComment;
        private int diskNumberStart;
        private int intFileAttr;
        private long extFileAttr;
        private int ofsLocalHeader;
        private String fileName;
        private Extras extra;
        private String comment;
        private Zip _root;
        private Zip.PkSection _parent;
        private byte[] _raw_fileModTime;
        private byte[] _raw_extra;
        public int versionMadeBy() { return versionMadeBy; }
        public int versionNeededToExtract() { return versionNeededToExtract; }
        public int flags() { return flags; }
        public Compression compressionMethod() { return compressionMethod; }
        public DosDatetime fileModTime() { return fileModTime; }
        public long crc32() { return crc32; }
        public long lenBodyCompressed() { return lenBodyCompressed; }
        public long lenBodyUncompressed() { return lenBodyUncompressed; }
        public int lenFileName() { return lenFileName; }
        public int lenExtra() { return lenExtra; }
        public int lenComment() { return lenComment; }
        public int diskNumberStart() { return diskNumberStart; }
        public int intFileAttr() { return intFileAttr; }
        public long extFileAttr() { return extFileAttr; }
        public int ofsLocalHeader() { return ofsLocalHeader; }
        public String fileName() { return fileName; }
        public Extras extra() { return extra; }
        public String comment() { return comment; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
        public byte[] _raw_fileModTime() { return _raw_fileModTime; }
        public byte[] _raw_extra() { return _raw_extra; }
    }
    public static class PkSection extends KaitaiStruct {
        public static PkSection fromFile(String fileName) throws IOException {
            return new PkSection(new ByteBufferKaitaiStream(fileName));
        }

        public PkSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PkSection(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public PkSection(KaitaiStream _io, KaitaiStruct _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(magic(), new byte[] { 80, 75 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 75 }, magic(), _io(), "/types/pk_section/seq/0");
            }
            this.sectionType = this._io.readU2le();
            switch (sectionType()) {
            case 513: {
                this.body = new CentralDirEntry(this._io, this, _root);
                break;
            }
            case 1027: {
                this.body = new LocalFile(this._io, this, _root);
                break;
            }
            case 1541: {
                this.body = new EndOfCentralDir(this._io, this, _root);
                break;
            }
            case 2055: {
                this.body = new DataDescriptor(this._io, this, _root);
                break;
            }
            }
        }
        private byte[] magic;
        private int sectionType;
        private KaitaiStruct body;
        private Zip _root;
        private KaitaiStruct _parent;
        public byte[] magic() { return magic; }
        public int sectionType() { return sectionType; }
        public KaitaiStruct body() { return body; }
        public Zip _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Extras extends KaitaiStruct {
        public static Extras fromFile(String fileName) throws IOException {
            return new Extras(new ByteBufferKaitaiStream(fileName));
        }

        public Extras(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extras(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Extras(KaitaiStream _io, KaitaiStruct _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<ExtraField>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new ExtraField(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<ExtraField> entries;
        private Zip _root;
        private KaitaiStruct _parent;
        public ArrayList<ExtraField> entries() { return entries; }
        public Zip _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class LocalFileHeader extends KaitaiStruct {
        public static LocalFileHeader fromFile(String fileName) throws IOException {
            return new LocalFileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public LocalFileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocalFileHeader(KaitaiStream _io, Zip.LocalFile _parent) {
            this(_io, _parent, null);
        }

        public LocalFileHeader(KaitaiStream _io, Zip.LocalFile _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readU2le();
            this._raw_flags = this._io.readBytes(2);
            KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(_raw_flags);
            this.flags = new GpFlags(_io__raw_flags, this, _root);
            this.compressionMethod = Zip.Compression.byId(this._io.readU2le());
            this._raw_fileModTime = this._io.readBytes(4);
            KaitaiStream _io__raw_fileModTime = new ByteBufferKaitaiStream(_raw_fileModTime);
            this.fileModTime = new DosDatetime(_io__raw_fileModTime);
            this.crc32 = this._io.readU4le();
            this.lenBodyCompressed = this._io.readU4le();
            this.lenBodyUncompressed = this._io.readU4le();
            this.lenFileName = this._io.readU2le();
            this.lenExtra = this._io.readU2le();
            this.fileName = new String(this._io.readBytes(lenFileName()), Charset.forName("UTF-8"));
            this._raw_extra = this._io.readBytes(lenExtra());
            KaitaiStream _io__raw_extra = new ByteBufferKaitaiStream(_raw_extra);
            this.extra = new Extras(_io__raw_extra, this, _root);
        }

        /**
         * @see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.4.4</a>
         * @see <a href="https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html">Local file headers</a>
         */
        public static class GpFlags extends KaitaiStruct {
            public static GpFlags fromFile(String fileName) throws IOException {
                return new GpFlags(new ByteBufferKaitaiStream(fileName));
            }

            public enum DeflateMode {
                NORMAL(0),
                MAXIMUM(1),
                FAST(2),
                SUPER_FAST(3);

                private final long id;
                DeflateMode(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, DeflateMode> byId = new HashMap<Long, DeflateMode>(4);
                static {
                    for (DeflateMode e : DeflateMode.values())
                        byId.put(e.id(), e);
                }
                public static DeflateMode byId(long id) { return byId.get(id); }
            }

            public GpFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public GpFlags(KaitaiStream _io, Zip.LocalFileHeader _parent) {
                this(_io, _parent, null);
            }

            public GpFlags(KaitaiStream _io, Zip.LocalFileHeader _parent, Zip _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.fileEncrypted = this._io.readBitsIntLe(1) != 0;
                this.compOptionsRaw = this._io.readBitsIntLe(2);
                this.hasDataDescriptor = this._io.readBitsIntLe(1) != 0;
                this.reserved1 = this._io.readBitsIntLe(1) != 0;
                this.compPatchedData = this._io.readBitsIntLe(1) != 0;
                this.strongEncrypt = this._io.readBitsIntLe(1) != 0;
                this.reserved2 = this._io.readBitsIntLe(4);
                this.langEncoding = this._io.readBitsIntLe(1) != 0;
                this.reserved3 = this._io.readBitsIntLe(1) != 0;
                this.maskHeaderValues = this._io.readBitsIntLe(1) != 0;
                this.reserved4 = this._io.readBitsIntLe(2);
            }
            private DeflateMode deflatedMode;
            public DeflateMode deflatedMode() {
                if (this.deflatedMode != null)
                    return this.deflatedMode;
                if ( ((_parent().compressionMethod() == Zip.Compression.DEFLATED) || (_parent().compressionMethod() == Zip.Compression.ENHANCED_DEFLATED)) ) {
                    this.deflatedMode = DeflateMode.byId(compOptionsRaw());
                }
                return this.deflatedMode;
            }
            private Integer implodedDictByteSize;

            /**
             * 8KiB or 4KiB in bytes
             */
            public Integer implodedDictByteSize() {
                if (this.implodedDictByteSize != null)
                    return this.implodedDictByteSize;
                if (_parent().compressionMethod() == Zip.Compression.IMPLODED) {
                    int _tmp = (int) ((((compOptionsRaw() & 1) != 0 ? 8 : 4) * 1024));
                    this.implodedDictByteSize = _tmp;
                }
                return this.implodedDictByteSize;
            }
            private Byte implodedNumSfTrees;
            public Byte implodedNumSfTrees() {
                if (this.implodedNumSfTrees != null)
                    return this.implodedNumSfTrees;
                if (_parent().compressionMethod() == Zip.Compression.IMPLODED) {
                    byte _tmp = (byte) (((compOptionsRaw() & 2) != 0 ? 3 : 2));
                    this.implodedNumSfTrees = _tmp;
                }
                return this.implodedNumSfTrees;
            }
            private Boolean lzmaHasEosMarker;
            public Boolean lzmaHasEosMarker() {
                if (this.lzmaHasEosMarker != null)
                    return this.lzmaHasEosMarker;
                if (_parent().compressionMethod() == Zip.Compression.LZMA) {
                    boolean _tmp = (boolean) ((compOptionsRaw() & 1) != 0);
                    this.lzmaHasEosMarker = _tmp;
                }
                return this.lzmaHasEosMarker;
            }
            private boolean fileEncrypted;
            private long compOptionsRaw;
            private boolean hasDataDescriptor;
            private boolean reserved1;
            private boolean compPatchedData;
            private boolean strongEncrypt;
            private long reserved2;
            private boolean langEncoding;
            private boolean reserved3;
            private boolean maskHeaderValues;
            private long reserved4;
            private Zip _root;
            private Zip.LocalFileHeader _parent;
            public boolean fileEncrypted() { return fileEncrypted; }

            /**
             * internal; access derived value instances instead
             */
            public long compOptionsRaw() { return compOptionsRaw; }
            public boolean hasDataDescriptor() { return hasDataDescriptor; }
            public boolean reserved1() { return reserved1; }
            public boolean compPatchedData() { return compPatchedData; }
            public boolean strongEncrypt() { return strongEncrypt; }
            public long reserved2() { return reserved2; }
            public boolean langEncoding() { return langEncoding; }
            public boolean reserved3() { return reserved3; }
            public boolean maskHeaderValues() { return maskHeaderValues; }
            public long reserved4() { return reserved4; }
            public Zip _root() { return _root; }
            public Zip.LocalFileHeader _parent() { return _parent; }
        }
        private int version;
        private GpFlags flags;
        private Compression compressionMethod;
        private DosDatetime fileModTime;
        private long crc32;
        private long lenBodyCompressed;
        private long lenBodyUncompressed;
        private int lenFileName;
        private int lenExtra;
        private String fileName;
        private Extras extra;
        private Zip _root;
        private Zip.LocalFile _parent;
        private byte[] _raw_flags;
        private byte[] _raw_fileModTime;
        private byte[] _raw_extra;
        public int version() { return version; }
        public GpFlags flags() { return flags; }
        public Compression compressionMethod() { return compressionMethod; }
        public DosDatetime fileModTime() { return fileModTime; }
        public long crc32() { return crc32; }
        public long lenBodyCompressed() { return lenBodyCompressed; }
        public long lenBodyUncompressed() { return lenBodyUncompressed; }
        public int lenFileName() { return lenFileName; }
        public int lenExtra() { return lenExtra; }
        public String fileName() { return fileName; }
        public Extras extra() { return extra; }
        public Zip _root() { return _root; }
        public Zip.LocalFile _parent() { return _parent; }
        public byte[] _raw_flags() { return _raw_flags; }
        public byte[] _raw_fileModTime() { return _raw_fileModTime; }
        public byte[] _raw_extra() { return _raw_extra; }
    }
    public static class EndOfCentralDir extends KaitaiStruct {
        public static EndOfCentralDir fromFile(String fileName) throws IOException {
            return new EndOfCentralDir(new ByteBufferKaitaiStream(fileName));
        }

        public EndOfCentralDir(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EndOfCentralDir(KaitaiStream _io, Zip.PkSection _parent) {
            this(_io, _parent, null);
        }

        public EndOfCentralDir(KaitaiStream _io, Zip.PkSection _parent, Zip _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.diskOfEndOfCentralDir = this._io.readU2le();
            this.diskOfCentralDir = this._io.readU2le();
            this.numCentralDirEntriesOnDisk = this._io.readU2le();
            this.numCentralDirEntriesTotal = this._io.readU2le();
            this.lenCentralDir = this._io.readU4le();
            this.ofsCentralDir = this._io.readU4le();
            this.lenComment = this._io.readU2le();
            this.comment = new String(this._io.readBytes(lenComment()), Charset.forName("UTF-8"));
        }
        private int diskOfEndOfCentralDir;
        private int diskOfCentralDir;
        private int numCentralDirEntriesOnDisk;
        private int numCentralDirEntriesTotal;
        private long lenCentralDir;
        private long ofsCentralDir;
        private int lenComment;
        private String comment;
        private Zip _root;
        private Zip.PkSection _parent;
        public int diskOfEndOfCentralDir() { return diskOfEndOfCentralDir; }
        public int diskOfCentralDir() { return diskOfCentralDir; }
        public int numCentralDirEntriesOnDisk() { return numCentralDirEntriesOnDisk; }
        public int numCentralDirEntriesTotal() { return numCentralDirEntriesTotal; }
        public long lenCentralDir() { return lenCentralDir; }
        public long ofsCentralDir() { return ofsCentralDir; }
        public int lenComment() { return lenComment; }
        public String comment() { return comment; }
        public Zip _root() { return _root; }
        public Zip.PkSection _parent() { return _parent; }
    }
    private ArrayList<PkSection> sections;
    private Zip _root;
    private KaitaiStruct _parent;
    public ArrayList<PkSection> sections() { return sections; }
    public Zip _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
