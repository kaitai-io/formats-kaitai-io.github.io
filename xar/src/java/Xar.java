// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
 * 
 * "XAR (short for eXtensible ARchive format) is an open source file archiver
 * and the archiver’s file format. It was created within the OpenDarwin project
 * and is used in macOS X 10.5 and up for software installation routines, as
 * well as browser extensions in Safari 5.0 and up."
 * @see <a href="https://github.com/mackyle/xar/wiki/xarformat">Source</a>
 */
public class Xar extends KaitaiStruct {
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

    public Xar(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Xar(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Xar(KaitaiStream _io, KaitaiStruct _parent, Xar _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.headerPrefix = new FileHeaderPrefix(this._io, this, _root);
        this._raw_header = this._io.readBytes((headerPrefix().lenHeader() - 6));
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
        this.header = new FileHeader(_io__raw_header, this, _root);
        this._raw__raw_toc = this._io.readBytes(header().lenTocCompressed());
        this._raw_toc = KaitaiStream.processZlib(_raw__raw_toc);
        KaitaiStream _io__raw_toc = new ByteBufferKaitaiStream(_raw_toc);
        this.toc = new TocType(_io__raw_toc, this, _root);
    }
    public static class FileHeaderPrefix extends KaitaiStruct {
        public static FileHeaderPrefix fromFile(String fileName) throws IOException {
            return new FileHeaderPrefix(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 120, 97, 114, 33 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 120, 97, 114, 33 }, magic(), _io(), "/types/file_header_prefix/seq/0");
            }
            this.lenHeader = this._io.readU2be();
        }
        private byte[] magic;
        private int lenHeader;
        private Xar _root;
        private Xar _parent;
        public byte[] magic() { return magic; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        public int lenHeader() { return lenHeader; }
        public Xar _root() { return _root; }
        public Xar _parent() { return _parent; }
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.version = this._io.readU2be();
            if (!(version() == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, version(), _io(), "/types/file_header/seq/0");
            }
            this.lenTocCompressed = this._io.readU8be();
            this.tocLengthUncompressed = this._io.readU8be();
            this.checksumAlgorithmInt = this._io.readU4be();
            if (hasChecksumAlgName()) {
                this.checksumAlgName = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), Charset.forName("UTF-8"));
                {
                    String _it = checksumAlgName();
                    if (!( ((!(_it).equals("")) && (!(_it).equals("none"))) )) {
                        throw new KaitaiStream.ValidationExprError(checksumAlgName(), _io(), "/types/file_header/seq/4");
                    }
                }
            }
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
        private Boolean hasChecksumAlgName;
        public Boolean hasChecksumAlgName() {
            if (this.hasChecksumAlgName != null)
                return this.hasChecksumAlgName;
            boolean _tmp = (boolean) ( ((checksumAlgorithmInt() == _root.checksumAlgorithmOther()) && (lenHeader() >= 32) && (KaitaiStream.mod(lenHeader(), 4) == 0)) );
            this.hasChecksumAlgName = _tmp;
            return this.hasChecksumAlgName;
        }
        private Integer lenHeader;
        public Integer lenHeader() {
            if (this.lenHeader != null)
                return this.lenHeader;
            int _tmp = (int) (_root.headerPrefix().lenHeader());
            this.lenHeader = _tmp;
            return this.lenHeader;
        }
        private int version;
        private long lenTocCompressed;
        private long tocLengthUncompressed;
        private long checksumAlgorithmInt;
        private String checksumAlgName;
        private Xar _root;
        private Xar _parent;
        public int version() { return version; }
        public long lenTocCompressed() { return lenTocCompressed; }
        public long tocLengthUncompressed() { return tocLengthUncompressed; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        public long checksumAlgorithmInt() { return checksumAlgorithmInt; }

        /**
         * internal; access `checksum_algorithm_name` instead
         */
        public String checksumAlgName() { return checksumAlgName; }
        public Xar _root() { return _root; }
        public Xar _parent() { return _parent; }
    }
    public static class TocType extends KaitaiStruct {
        public static TocType fromFile(String fileName) throws IOException {
            return new TocType(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.xmlString = new String(this._io.readBytesFull(), Charset.forName("UTF-8"));
        }
        private String xmlString;
        private Xar _root;
        private Xar _parent;
        public String xmlString() { return xmlString; }
        public Xar _root() { return _root; }
        public Xar _parent() { return _parent; }
    }
    private Byte checksumAlgorithmOther;

    /**
     * @see <a href="https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85">Source</a>
     */
    public Byte checksumAlgorithmOther() {
        if (this.checksumAlgorithmOther != null)
            return this.checksumAlgorithmOther;
        byte _tmp = (byte) (3);
        this.checksumAlgorithmOther = _tmp;
        return this.checksumAlgorithmOther;
    }
    private FileHeaderPrefix headerPrefix;
    private FileHeader header;
    private TocType toc;
    private Xar _root;
    private KaitaiStruct _parent;
    private byte[] _raw_header;
    private byte[] _raw_toc;
    private byte[] _raw__raw_toc;

    /**
     * internal; access `_root.header` instead
     */
    public FileHeaderPrefix headerPrefix() { return headerPrefix; }
    public FileHeader header() { return header; }

    /**
     * zlib compressed XML further describing the content of the archive
     */
    public TocType toc() { return toc; }
    public Xar _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_header() { return _raw_header; }
    public byte[] _raw_toc() { return _raw_toc; }
    public byte[] _raw__raw_toc() { return _raw__raw_toc; }
}
