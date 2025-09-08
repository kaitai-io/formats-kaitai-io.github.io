// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
 * 
 * "XAR (short for eXtensible ARchive format) is an open source file archiver
 * and the archiver's file format. It was created within the OpenDarwin project
 * and is used in macOS X 10.5 and up for software installation routines, as
 * well as browser extensions in Safari 5.0 and up."
 * @see <a href="https://github.com/mackyle/xar/wiki/xarformat">Source</a>
 */
public class Xar extends KaitaiStruct.ReadWrite {
    public static Xar fromFile(String fileName) throws IOException {
        return new Xar(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChecksumAlgorithmsApple {
        NONE(0),
        SHA1(1),
        MD5(2),
        SHA256(3),
        SHA512(4);

        private final long id;
        ChecksumAlgorithmsApple(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChecksumAlgorithmsApple> byId = new HashMap<Long, ChecksumAlgorithmsApple>(5);
        static {
            for (ChecksumAlgorithmsApple e : ChecksumAlgorithmsApple.values())
                byId.put(e.id(), e);
        }
        public static ChecksumAlgorithmsApple byId(long id) { return byId.get(id); }
    }
    public Xar() {
        this(null, null, null);
    }

    public Xar(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Xar(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Xar(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Xar _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.headerPrefix = new FileHeaderPrefix(this._io, this, _root);
        this.headerPrefix._read();
        this._raw_header = this._io.readBytes(headerPrefix().lenHeader() - 6);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new FileHeader(_io__raw_header, this, _root);
        this.header._read();
        this._raw__raw_toc = this._io.readBytes(header().lenTocCompressed());
        this._raw_toc = KaitaiStream.processZlib(this._raw__raw_toc);
        this.toc_InnerSize = this._raw_toc.length;
        KaitaiStream _io__raw_toc = new ByteBufferKaitaiStream(this._raw_toc);
        this.toc = new TocType(_io__raw_toc, this, _root);
        this.toc._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.headerPrefix._fetchInstances();
        this.header._fetchInstances();
        this.toc._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.headerPrefix._write_Seq(this._io);
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerPrefix().lenHeader() - 6);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (headerPrefix().lenHeader() - 6));
            final Xar _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != headerPrefix().lenHeader() - 6)
                        throw new ConsistencyError("raw(header)", headerPrefix().lenHeader() - 6, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
        final KaitaiStream _io__raw_toc = new ByteBufferKaitaiStream(this.toc_InnerSize);
        this._io.addChildStream(_io__raw_toc);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (header().lenTocCompressed()));
            final Xar _this = this;
            _io__raw_toc.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_toc = _io__raw_toc.toByteArray();
                    _this._raw__raw_toc = KaitaiStream.unprocessZlib(_this._raw_toc);
                    if (_this._raw__raw_toc.length != header().lenTocCompressed())
                        throw new ConsistencyError("raw(toc)", header().lenTocCompressed(), _this._raw__raw_toc.length);
                    parent.writeBytes(_this._raw__raw_toc);
                }
            });
        }
        this.toc._write_Seq(_io__raw_toc);
    }

    public void _check() {
        if (!Objects.equals(this.headerPrefix._root(), _root()))
            throw new ConsistencyError("header_prefix", _root(), this.headerPrefix._root());
        if (!Objects.equals(this.headerPrefix._parent(), this))
            throw new ConsistencyError("header_prefix", this, this.headerPrefix._parent());
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (!Objects.equals(this.toc._root(), _root()))
            throw new ConsistencyError("toc", _root(), this.toc._root());
        if (!Objects.equals(this.toc._parent(), this))
            throw new ConsistencyError("toc", this, this.toc._parent());
        _dirty = false;
    }
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, Xar _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, Xar _parent, Xar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.version = this._io.readU2be();
            if (!(this.version == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.version, this._io, "/types/file_header/seq/0");
            }
            this.lenTocCompressed = this._io.readU8be();
            this.tocLengthUncompressed = this._io.readU8be();
            this.checksumAlgorithmInt = this._io.readU4be();
            if (hasChecksumAlgName()) {
                this.checksumAlgName = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), StandardCharsets.UTF_8);
                {
                    String _it = this.checksumAlgName;
                    if (!( ((!_it.equals("")) && (!_it.equals("none"))) )) {
                        throw new KaitaiStream.ValidationExprError(this.checksumAlgName, this._io, "/types/file_header/seq/4");
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasChecksumAlgName()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.version);
            this._io.writeU8be(this.lenTocCompressed);
            this._io.writeU8be(this.tocLengthUncompressed);
            this._io.writeU4be(this.checksumAlgorithmInt);
            if (hasChecksumAlgName()) {
                this._io.writeBytesLimit((this.checksumAlgName).getBytes(Charset.forName("UTF-8")), this._io.size() - this._io.pos(), (byte) 0, (byte) 0);
                if (!(this._io.isEof()))
                    throw new ConsistencyError("checksum_alg_name", 0, this._io.size() - this._io.pos());
            }
        }

        public void _check() {
            if (!(this.version == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.version, null, "/types/file_header/seq/0");
            }
            if (hasChecksumAlgName()) {
                {
                    String _it = this.checksumAlgName;
                    if (!( ((!_it.equals("")) && (!_it.equals("none"))) )) {
                        throw new KaitaiStream.ValidationExprError(this.checksumAlgName, null, "/types/file_header/seq/4");
                    }
                }
            }
            _dirty = false;
        }
        private String checksumAlgorithmName;

        /**
         * If it is not
         * 
         * * `""` (empty string), indicating an unknown integer value (access
         *   `checksum_algorithm_int` for debugging purposes to find out
         *   what that value is), or
         * * `"none"`, indicating that the TOC checksum is not provided (in that
         *   case, the `<checksum>` property or its `style` attribute should be
         *   missing, or the `style` attribute must be set to `"none"`),
         * 
         * it must exactly match the `style` attribute value of the
         * `<checksum>` property in the root node `<toc>`. See
         * <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
         * for reference.
         * 
         * The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
         * `EVP_get_digestbyname`](
         *   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
         * ) to verify this value (if it's not `""` or `"none"`, of course).
         * So it's reasonable to assume that this can only have one of the values
         * that OpenSSL recognizes.
         */
        public String checksumAlgorithmName() {
            if (this.checksumAlgorithmName != null)
                return this.checksumAlgorithmName;
            this.checksumAlgorithmName = (hasChecksumAlgName() ? checksumAlgName() : (checksumAlgorithmInt() == Xar.ChecksumAlgorithmsApple.NONE.id() ? "none" : (checksumAlgorithmInt() == Xar.ChecksumAlgorithmsApple.SHA1.id() ? "sha1" : (checksumAlgorithmInt() == Xar.ChecksumAlgorithmsApple.MD5.id() ? "md5" : (checksumAlgorithmInt() == Xar.ChecksumAlgorithmsApple.SHA256.id() ? "sha256" : (checksumAlgorithmInt() == Xar.ChecksumAlgorithmsApple.SHA512.id() ? "sha512" : ""))))));
            return this.checksumAlgorithmName;
        }
        public void _invalidateChecksumAlgorithmName() { this.checksumAlgorithmName = null; }
        private Boolean hasChecksumAlgName;
        public Boolean hasChecksumAlgName() {
            if (this.hasChecksumAlgName != null)
                return this.hasChecksumAlgName;
            this.hasChecksumAlgName =  ((checksumAlgorithmInt() == _root().checksumAlgorithmOther()) && (lenHeader() >= 32) && (KaitaiStream.mod(lenHeader(), 4) == 0)) ;
            return this.hasChecksumAlgName;
        }
        public void _invalidateHasChecksumAlgName() { this.hasChecksumAlgName = null; }
        private Integer lenHeader;
        public Integer lenHeader() {
            if (this.lenHeader != null)
                return this.lenHeader;
            this.lenHeader = ((Number) (_root().headerPrefix().lenHeader())).intValue();
            return this.lenHeader;
        }
        public void _invalidateLenHeader() { this.lenHeader = null; }
        private int version;
        private long lenTocCompressed;
        private long tocLengthUncompressed;
        private long checksumAlgorithmInt;
        private String checksumAlgName;
        private Xar _root;
        private Xar _parent;
        public int version() { return version; }
        public void setVersion(int _v) { _dirty = true; version = _v; }
        public long lenTocCompressed() { return lenTocCompressed; }
        public void setLenTocCompressed(long _v) { _dirty = true; lenTocCompressed = _v; }
        public long tocLengthUncompressed() { return tocLengthUncompressed; }
        public void setTocLengthUncompressed(long _v) { _dirty = true; tocLengthUncompressed = _v; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        public long checksumAlgorithmInt() { return checksumAlgorithmInt; }
        public void setChecksumAlgorithmInt(long _v) { _dirty = true; checksumAlgorithmInt = _v; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        public String checksumAlgName() { return checksumAlgName; }
        public void setChecksumAlgName(String _v) { _dirty = true; checksumAlgName = _v; }
        public Xar _root() { return _root; }
        public void set_root(Xar _v) { _dirty = true; _root = _v; }
        public Xar _parent() { return _parent; }
        public void set_parent(Xar _v) { _dirty = true; _parent = _v; }
    }
    public static class FileHeaderPrefix extends KaitaiStruct.ReadWrite {
        public static FileHeaderPrefix fromFile(String fileName) throws IOException {
            return new FileHeaderPrefix(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeaderPrefix() {
            this(null, null, null);
        }

        public FileHeaderPrefix(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeaderPrefix(KaitaiStream _io, Xar _parent) {
            this(_io, _parent, null);
        }

        public FileHeaderPrefix(KaitaiStream _io, Xar _parent, Xar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 120, 97, 114, 33 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 120, 97, 114, 33 }, this.magic, this._io, "/types/file_header_prefix/seq/0");
            }
            this.lenHeader = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU2be(this.lenHeader);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 120, 97, 114, 33 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 120, 97, 114, 33 }, this.magic, null, "/types/file_header_prefix/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private int lenHeader;
        private Xar _root;
        private Xar _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        public int lenHeader() { return lenHeader; }
        public void setLenHeader(int _v) { _dirty = true; lenHeader = _v; }
        public Xar _root() { return _root; }
        public void set_root(Xar _v) { _dirty = true; _root = _v; }
        public Xar _parent() { return _parent; }
        public void set_parent(Xar _v) { _dirty = true; _parent = _v; }
    }
    public static class TocType extends KaitaiStruct.ReadWrite {
        public static TocType fromFile(String fileName) throws IOException {
            return new TocType(new ByteBufferKaitaiStream(fileName));
        }
        public TocType() {
            this(null, null, null);
        }

        public TocType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TocType(KaitaiStream _io, Xar _parent) {
            this(_io, _parent, null);
        }

        public TocType(KaitaiStream _io, Xar _parent, Xar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.xmlString = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.xmlString).getBytes(Charset.forName("UTF-8")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("xml_string", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private String xmlString;
        private Xar _root;
        private Xar _parent;
        public String xmlString() { return xmlString; }
        public void setXmlString(String _v) { _dirty = true; xmlString = _v; }
        public Xar _root() { return _root; }
        public void set_root(Xar _v) { _dirty = true; _root = _v; }
        public Xar _parent() { return _parent; }
        public void set_parent(Xar _v) { _dirty = true; _parent = _v; }
    }
    private Byte checksumAlgorithmOther;

    /**
     * @see <a href="https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85">Source</a>
     */
    public Byte checksumAlgorithmOther() {
        if (this.checksumAlgorithmOther != null)
            return this.checksumAlgorithmOther;
        this.checksumAlgorithmOther = ((byte) 3);
        return this.checksumAlgorithmOther;
    }
    public void _invalidateChecksumAlgorithmOther() { this.checksumAlgorithmOther = null; }
    private FileHeaderPrefix headerPrefix;
    private FileHeader header;
    private TocType toc;
    private Xar _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    private byte[] _raw_toc;
    private int toc_InnerSize;
    private byte[] _raw__raw_toc;

    /**
     * internal; access `_root.header` instead
     */
    public FileHeaderPrefix headerPrefix() { return headerPrefix; }
    public void setHeaderPrefix(FileHeaderPrefix _v) { _dirty = true; headerPrefix = _v; }
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }

    /**
     * zlib compressed XML further describing the content of the archive
     */
    public TocType toc() { return toc; }
    public void setToc(TocType _v) { _dirty = true; toc = _v; }
    public Xar _root() { return _root; }
    public void set_root(Xar _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
    public byte[] _raw_toc() { return _raw_toc; }
    public void set_raw_Toc(byte[] _v) { _dirty = true; _raw_toc = _v; }
    public int toc_InnerSize() { return toc_InnerSize; }
    public void setToc_InnerSize(int _v) { _dirty = true; toc_InnerSize = _v; }
    public byte[] _raw__raw_toc() { return _raw__raw_toc; }
    public void set_raw__raw_Toc(byte[] _v) { _dirty = true; _raw__raw_toc = _v; }
}
