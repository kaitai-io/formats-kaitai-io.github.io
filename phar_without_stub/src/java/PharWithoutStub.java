// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * A phar (PHP archive) file. The phar format is a custom archive format
 * from the PHP ecosystem that is used to package a complete PHP library
 * or application into a single self-contained archive.
 * All phar archives start with an executable PHP stub, which can be used to
 * allow executing or including phar files as if they were regular PHP scripts.
 * PHP 5.3 and later include the phar extension, which adds native support for
 * reading and manipulating phar files.
 * 
 * The phar format was originally developed as part of the PEAR library
 * PHP_Archive, first released in 2005. Later, a native PHP extension
 * named "phar" was developed, which was first released on PECL in 2007,
 * and is included with PHP 5.3 and later. The phar extension has effectively
 * superseded the PHP_Archive library, which has not been updated since 2010.
 * The phar extension is also no longer released independently on PECL;
 * it is now developed and released as part of PHP itself.
 * 
 * Because of current limitations in Kaitai Struct
 * (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
 * the executable PHP stub that precedes the rest of the archive is not handled
 * by this spec. Before parsing a phar using this spec, the stub must be
 * removed manually.
 * 
 * A phar's stub is terminated by the special token `__HALT_COMPILER();`
 * (which may be followed by at most one space, the PHP tag end `?>`,
 * and an optional line terminator). The stub termination sequence is
 * immediately followed by the remaining parts of the phar format,
 * as described in this spec.
 * 
 * The phar stub usually contains code that loads the phar and runs
 * a contained PHP file, but this is not required. A minimal valid phar stub
 * is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
 * the phar directly, but still allows loading or manipulating it using the
 * phar extension.
 * 
 * Note: The phar format does not specify any encoding for text fields
 * (stub, alias name, and all file names), so these fields may contain arbitrary
 * binary data. The actual text encoding used in a specific phar file usually
 * depends on the application that created the phar, and on the
 * standard encoding of the system on which the phar was created.
 * @see <a href="https://www.php.net/manual/en/phar.fileformat.php">Source</a>
 * @see <a href="https://github.com/php/php-src/tree/master/ext/phar">Source</a>
 * @see <a href="https://svn.php.net/viewvc/pecl/phar/">Source</a>
 * @see <a href="https://svn.php.net/viewvc/pear/packages/PHP_Archive/">Source</a>
 */
public class PharWithoutStub extends KaitaiStruct {
    public static PharWithoutStub fromFile(String fileName) throws IOException {
        return new PharWithoutStub(new ByteBufferKaitaiStream(fileName));
    }

    public enum SignatureType {
        MD5(1),
        SHA1(2),
        SHA256(4),
        SHA512(8),
        OPENSSL(16);

        private final long id;
        SignatureType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SignatureType> byId = new HashMap<Long, SignatureType>(5);
        static {
            for (SignatureType e : SignatureType.values())
                byId.put(e.id(), e);
        }
        public static SignatureType byId(long id) { return byId.get(id); }
    }

    public PharWithoutStub(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PharWithoutStub(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PharWithoutStub(KaitaiStream _io, KaitaiStruct _parent, PharWithoutStub _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.manifest = new Manifest(this._io, this, _root);
        files = new ArrayList<byte[]>(((Number) (manifest().numFiles())).intValue());
        for (int i = 0; i < manifest().numFiles(); i++) {
            this.files.add(this._io.readBytes(manifest().fileEntries().get((int) i).lenDataCompressed()));
        }
        if (manifest().flags().hasSignature()) {
            this._raw_signature = this._io.readBytesFull();
            KaitaiStream _io__raw_signature = new ByteBufferKaitaiStream(_raw_signature);
            this.signature = new Signature(_io__raw_signature, this, _root);
        }
    }
    public static class SerializedValue extends KaitaiStruct {
        public static SerializedValue fromFile(String fileName) throws IOException {
            return new SerializedValue(new ByteBufferKaitaiStream(fileName));
        }

        public SerializedValue(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SerializedValue(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public SerializedValue(KaitaiStream _io, KaitaiStruct _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.raw = this._io.readBytesFull();
        }
        private PhpSerializedValue parsed;

        /**
         * The serialized value, parsed as a structure.
         */
        public PhpSerializedValue parsed() {
            if (this.parsed != null)
                return this.parsed;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.parsed = new PhpSerializedValue(this._io);
            this._io.seek(_pos);
            return this.parsed;
        }
        private byte[] raw;
        private PharWithoutStub _root;
        private KaitaiStruct _parent;

        /**
         * The serialized value, as a raw byte array.
         */
        public byte[] raw() { return raw; }
        public PharWithoutStub _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Signature extends KaitaiStruct {
        public static Signature fromFile(String fileName) throws IOException {
            return new Signature(new ByteBufferKaitaiStream(fileName));
        }

        public Signature(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Signature(KaitaiStream _io, PharWithoutStub _parent) {
            this(_io, _parent, null);
        }

        public Signature(KaitaiStream _io, PharWithoutStub _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.data = this._io.readBytes(((_io().size() - _io().pos()) - 8));
            this.type = PharWithoutStub.SignatureType.byId(this._io.readU4le());
            this.magic = this._io.ensureFixedContents(new byte[] { 71, 66, 77, 66 });
        }
        private byte[] data;
        private SignatureType type;
        private byte[] magic;
        private PharWithoutStub _root;
        private PharWithoutStub _parent;

        /**
         * The signature data. The size and contents depend on the
         * signature type.
         */
        public byte[] data() { return data; }

        /**
         * The signature type.
         */
        public SignatureType type() { return type; }
        public byte[] magic() { return magic; }
        public PharWithoutStub _root() { return _root; }
        public PharWithoutStub _parent() { return _parent; }
    }
    public static class FileFlags extends KaitaiStruct {
        public static FileFlags fromFile(String fileName) throws IOException {
            return new FileFlags(new ByteBufferKaitaiStream(fileName));
        }

        public FileFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileFlags(KaitaiStream _io, PharWithoutStub.FileEntry _parent) {
            this(_io, _parent, null);
        }

        public FileFlags(KaitaiStream _io, PharWithoutStub.FileEntry _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = this._io.readU4le();
        }
        private Integer permissions;

        /**
         * The file's permission bits.
         */
        public Integer permissions() {
            if (this.permissions != null)
                return this.permissions;
            int _tmp = (int) ((value() & 511));
            this.permissions = _tmp;
            return this.permissions;
        }
        private Boolean zlibCompressed;

        /**
         * Whether this file's data is stored using zlib compression.
         */
        public Boolean zlibCompressed() {
            if (this.zlibCompressed != null)
                return this.zlibCompressed;
            boolean _tmp = (boolean) ((value() & 4096) != 0);
            this.zlibCompressed = _tmp;
            return this.zlibCompressed;
        }
        private Boolean bzip2Compressed;

        /**
         * Whether this file's data is stored using bzip2 compression.
         */
        public Boolean bzip2Compressed() {
            if (this.bzip2Compressed != null)
                return this.bzip2Compressed;
            boolean _tmp = (boolean) ((value() & 8192) != 0);
            this.bzip2Compressed = _tmp;
            return this.bzip2Compressed;
        }
        private long value;
        private PharWithoutStub _root;
        private PharWithoutStub.FileEntry _parent;

        /**
         * The unparsed flag bits.
         */
        public long value() { return value; }
        public PharWithoutStub _root() { return _root; }
        public PharWithoutStub.FileEntry _parent() { return _parent; }
    }

    /**
     * A phar API version number. This version number is meant to indicate
     * which features are used in a specific phar, so that tools reading
     * the phar can easily check that they support all necessary features.
     * 
     * The following API versions exist so far:
     * 
     * * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
     *   the phar format was only used by the PHP_Archive library, and the
     *   API version numbers were identical to the PHP_Archive versions that
     *   supported them. Development of the native phar extension started around
     *   API version 0.7. These API versions could only be queried using the
     *   `PHP_Archive::APIversion()` method, but were not stored physically
     *   in archives. These API versions are not supported by this spec.
     * * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
     *   later development versions of the phar extension. This is the first
     *   version number to be physically stored in archives. This API version
     *   is not supported by this spec.
     * * 0.9.0: Used by later development/early beta versions of the
     *   phar extension. Also temporarily used by PHP_Archive 0.9.0
     *   (released 2006-12-15), but reverted back to API version 0.8.0 in
     *   PHP_Archive 0.9.1 (released 2007-01-05).
     * * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
     *   and phar extension 1.0.0 (released 2007-03-28). This is the first
     *   stable, forwards-compatible and documented version of the format.
     * * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
     *   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
     *   SHA-512 signature types.
     * * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
     *   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
     *   all features from API verison 1.1.1, but it reports API version 1.1.0.)
     *   Adds the OpenSSL signature type and support for storing
     *   empty directories.
     */
    public static class ApiVersion extends KaitaiStruct {
        public static ApiVersion fromFile(String fileName) throws IOException {
            return new ApiVersion(new ByteBufferKaitaiStream(fileName));
        }

        public ApiVersion(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ApiVersion(KaitaiStream _io, PharWithoutStub.Manifest _parent) {
            this(_io, _parent, null);
        }

        public ApiVersion(KaitaiStream _io, PharWithoutStub.Manifest _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.release = this._io.readBitsInt(4);
            this.major = this._io.readBitsInt(4);
            this.minor = this._io.readBitsInt(4);
            this.unused = this._io.readBitsInt(4);
        }
        private long release;
        private long major;
        private long minor;
        private long unused;
        private PharWithoutStub _root;
        private PharWithoutStub.Manifest _parent;
        public long release() { return release; }
        public long major() { return major; }
        public long minor() { return minor; }
        public long unused() { return unused; }
        public PharWithoutStub _root() { return _root; }
        public PharWithoutStub.Manifest _parent() { return _parent; }
    }
    public static class GlobalFlags extends KaitaiStruct {
        public static GlobalFlags fromFile(String fileName) throws IOException {
            return new GlobalFlags(new ByteBufferKaitaiStream(fileName));
        }

        public GlobalFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GlobalFlags(KaitaiStream _io, PharWithoutStub.Manifest _parent) {
            this(_io, _parent, null);
        }

        public GlobalFlags(KaitaiStream _io, PharWithoutStub.Manifest _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = this._io.readU4le();
        }
        private Boolean anyZlibCompressed;

        /**
         * Whether any of the files in this phar are stored using
         * zlib compression.
         */
        public Boolean anyZlibCompressed() {
            if (this.anyZlibCompressed != null)
                return this.anyZlibCompressed;
            boolean _tmp = (boolean) ((value() & 4096) != 0);
            this.anyZlibCompressed = _tmp;
            return this.anyZlibCompressed;
        }
        private Boolean anyBzip2Compressed;

        /**
         * Whether any of the files in this phar are stored using
         * bzip2 compression.
         */
        public Boolean anyBzip2Compressed() {
            if (this.anyBzip2Compressed != null)
                return this.anyBzip2Compressed;
            boolean _tmp = (boolean) ((value() & 8192) != 0);
            this.anyBzip2Compressed = _tmp;
            return this.anyBzip2Compressed;
        }
        private Boolean hasSignature;

        /**
         * Whether this phar contains a signature.
         */
        public Boolean hasSignature() {
            if (this.hasSignature != null)
                return this.hasSignature;
            boolean _tmp = (boolean) ((value() & 65536) != 0);
            this.hasSignature = _tmp;
            return this.hasSignature;
        }
        private long value;
        private PharWithoutStub _root;
        private PharWithoutStub.Manifest _parent;

        /**
         * The unparsed flag bits.
         */
        public long value() { return value; }
        public PharWithoutStub _root() { return _root; }
        public PharWithoutStub.Manifest _parent() { return _parent; }
    }
    public static class Manifest extends KaitaiStruct {
        public static Manifest fromFile(String fileName) throws IOException {
            return new Manifest(new ByteBufferKaitaiStream(fileName));
        }

        public Manifest(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Manifest(KaitaiStream _io, PharWithoutStub _parent) {
            this(_io, _parent, null);
        }

        public Manifest(KaitaiStream _io, PharWithoutStub _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenManifest = this._io.readU4le();
            this.numFiles = this._io.readU4le();
            this.apiVersion = new ApiVersion(this._io, this, _root);
            this.flags = new GlobalFlags(this._io, this, _root);
            this.lenAlias = this._io.readU4le();
            this.alias = this._io.readBytes(lenAlias());
            this.lenMetadata = this._io.readU4le();
            if (lenMetadata() != 0) {
                this._raw_metadata = this._io.readBytes(lenMetadata());
                KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(_raw_metadata);
                this.metadata = new SerializedValue(_io__raw_metadata, this, _root);
            }
            fileEntries = new ArrayList<FileEntry>(((Number) (numFiles())).intValue());
            for (int i = 0; i < numFiles(); i++) {
                this.fileEntries.add(new FileEntry(this._io, this, _root));
            }
        }
        private long lenManifest;
        private long numFiles;
        private ApiVersion apiVersion;
        private GlobalFlags flags;
        private long lenAlias;
        private byte[] alias;
        private long lenMetadata;
        private SerializedValue metadata;
        private ArrayList<FileEntry> fileEntries;
        private PharWithoutStub _root;
        private PharWithoutStub _parent;
        private byte[] _raw_metadata;

        /**
         * The length of the manifest, in bytes.
         * 
         * Note: The phar extension does not allow reading manifests
         * larger than 100 MiB.
         */
        public long lenManifest() { return lenManifest; }

        /**
         * The number of files in this phar.
         */
        public long numFiles() { return numFiles; }

        /**
         * The API version used by this phar manifest.
         */
        public ApiVersion apiVersion() { return apiVersion; }

        /**
         * Global flags for this phar.
         */
        public GlobalFlags flags() { return flags; }

        /**
         * The length of the alias, in bytes.
         */
        public long lenAlias() { return lenAlias; }

        /**
         * The phar's alias, i. e. the name under which it is loaded into PHP.
         */
        public byte[] alias() { return alias; }

        /**
         * The size of the metadata, in bytes, or 0 if there is none.
         */
        public long lenMetadata() { return lenMetadata; }

        /**
         * Metadata for this phar, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the archive.
         */
        public SerializedValue metadata() { return metadata; }

        /**
         * Manifest entries for the files contained in this phar.
         */
        public ArrayList<FileEntry> fileEntries() { return fileEntries; }
        public PharWithoutStub _root() { return _root; }
        public PharWithoutStub _parent() { return _parent; }
        public byte[] _raw_metadata() { return _raw_metadata; }
    }
    public static class FileEntry extends KaitaiStruct {
        public static FileEntry fromFile(String fileName) throws IOException {
            return new FileEntry(new ByteBufferKaitaiStream(fileName));
        }

        public FileEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileEntry(KaitaiStream _io, PharWithoutStub.Manifest _parent) {
            this(_io, _parent, null);
        }

        public FileEntry(KaitaiStream _io, PharWithoutStub.Manifest _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenFilename = this._io.readU4le();
            this.filename = this._io.readBytes(lenFilename());
            this.lenDataUncompressed = this._io.readU4le();
            this.timestamp = this._io.readU4le();
            this.lenDataCompressed = this._io.readU4le();
            this.crc32 = this._io.readU4le();
            this.flags = new FileFlags(this._io, this, _root);
            this.lenMetadata = this._io.readU4le();
            if (lenMetadata() != 0) {
                this._raw_metadata = this._io.readBytes(lenMetadata());
                KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(_raw_metadata);
                this.metadata = new SerializedValue(_io__raw_metadata, this, _root);
            }
        }
        private long lenFilename;
        private byte[] filename;
        private long lenDataUncompressed;
        private long timestamp;
        private long lenDataCompressed;
        private long crc32;
        private FileFlags flags;
        private long lenMetadata;
        private SerializedValue metadata;
        private PharWithoutStub _root;
        private PharWithoutStub.Manifest _parent;
        private byte[] _raw_metadata;

        /**
         * The length of the file name, in bytes.
         */
        public long lenFilename() { return lenFilename; }

        /**
         * The name of this file. If the name ends with a slash, this entry
         * represents a directory, otherwise a regular file. Directory entries
         * are supported since phar API version 1.1.1.
         * (Explicit directory entries are only needed for empty directories.
         * Non-empty directories are implied by the files located inside them.)
         */
        public byte[] filename() { return filename; }

        /**
         * The length of the file's data when uncompressed, in bytes.
         */
        public long lenDataUncompressed() { return lenDataUncompressed; }

        /**
         * The time at which the file was added or last updated, as a
         * Unix timestamp.
         */
        public long timestamp() { return timestamp; }

        /**
         * The length of the file's data when compressed, in bytes.
         */
        public long lenDataCompressed() { return lenDataCompressed; }

        /**
         * The CRC32 checksum of the file's uncompressed data.
         */
        public long crc32() { return crc32; }

        /**
         * Flags for this file.
         */
        public FileFlags flags() { return flags; }

        /**
         * The length of the metadata, in bytes, or 0 if there is none.
         */
        public long lenMetadata() { return lenMetadata; }

        /**
         * Metadata for this file, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the file.
         */
        public SerializedValue metadata() { return metadata; }
        public PharWithoutStub _root() { return _root; }
        public PharWithoutStub.Manifest _parent() { return _parent; }
        public byte[] _raw_metadata() { return _raw_metadata; }
    }
    private Manifest manifest;
    private ArrayList<byte[]> files;
    private Signature signature;
    private PharWithoutStub _root;
    private KaitaiStruct _parent;
    private byte[] _raw_signature;

    /**
     * The archive's manifest, containing general metadata about the archive
     * and its files.
     */
    public Manifest manifest() { return manifest; }

    /**
     * The contents of each file in the archive (possibly compressed,
     * as indicated by the file's flags in the manifest). The files are stored
     * in the same order as they appear in the manifest.
     */
    public ArrayList<byte[]> files() { return files; }

    /**
     * The archive's signature - a digest of all archive data before
     * the signature itself.
     * 
     * Note: Almost all of the available "signature" types are actually hashes,
     * not signatures, and cannot be used to verify that the archive has not
     * been tampered with. Only the OpenSSL signature type is a true
     * cryptographic signature.
     */
    public Signature signature() { return signature; }
    public PharWithoutStub _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_signature() { return _raw_signature; }
}
