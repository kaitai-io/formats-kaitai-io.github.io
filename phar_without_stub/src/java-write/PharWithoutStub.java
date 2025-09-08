// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.util.Arrays;


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
public class PharWithoutStub extends KaitaiStruct.ReadWrite {
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
    public PharWithoutStub() {
        this(null, null, null);
    }

    public PharWithoutStub(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PharWithoutStub(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PharWithoutStub(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PharWithoutStub _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.manifest = new Manifest(this._io, this, _root);
        this.manifest._read();
        this.files = new ArrayList<byte[]>();
        for (int i = 0; i < manifest().numFiles(); i++) {
            this.files.add(this._io.readBytes(manifest().fileEntries().get(((Number) (i)).intValue()).lenDataCompressed()));
        }
        if (manifest().flags().hasSignature()) {
            this._raw_signature = this._io.readBytesFull();
            KaitaiStream _io__raw_signature = new ByteBufferKaitaiStream(this._raw_signature);
            this.signature = new Signature(_io__raw_signature, this, _root);
            this.signature._read();
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.manifest._fetchInstances();
        for (int i = 0; i < this.files.size(); i++) {
        }
        if (manifest().flags().hasSignature()) {
            this.signature._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.manifest._write_Seq(this._io);
        for (int i = 0; i < this.files.size(); i++) {
            this._io.writeBytes(this.files.get(((Number) (i)).intValue()));
        }
        if (manifest().flags().hasSignature()) {
            final KaitaiStream _io__raw_signature = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
            this._io.addChildStream(_io__raw_signature);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                final PharWithoutStub _this = this;
                _io__raw_signature.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_signature = _io__raw_signature.toByteArray();
                        parent.writeBytes(_this._raw_signature);
                        if (!(parent.isEof()))
                            throw new ConsistencyError("raw(signature)", 0, parent.size() - parent.pos());
                    }
                });
            }
            this.signature._write_Seq(_io__raw_signature);
        }
    }

    public void _check() {
        if (!Objects.equals(this.manifest._root(), _root()))
            throw new ConsistencyError("manifest", _root(), this.manifest._root());
        if (!Objects.equals(this.manifest._parent(), this))
            throw new ConsistencyError("manifest", this, this.manifest._parent());
        if (this.files.size() != manifest().numFiles())
            throw new ConsistencyError("files", manifest().numFiles(), this.files.size());
        for (int i = 0; i < this.files.size(); i++) {
            if (this.files.get(((Number) (i)).intValue()).length != manifest().fileEntries().get(((Number) (i)).intValue()).lenDataCompressed())
                throw new ConsistencyError("files", manifest().fileEntries().get(((Number) (i)).intValue()).lenDataCompressed(), this.files.get(((Number) (i)).intValue()).length);
        }
        if (manifest().flags().hasSignature()) {
            if (!Objects.equals(this.signature._root(), _root()))
                throw new ConsistencyError("signature", _root(), this.signature._root());
            if (!Objects.equals(this.signature._parent(), this))
                throw new ConsistencyError("signature", this, this.signature._parent());
        }
        _dirty = false;
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
    public static class ApiVersion extends KaitaiStruct.ReadWrite {
        public static ApiVersion fromFile(String fileName) throws IOException {
            return new ApiVersion(new ByteBufferKaitaiStream(fileName));
        }
        public ApiVersion() {
            this(null, null, null);
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
        }
        public void _read() {
            this.release = this._io.readBitsIntBe(4);
            this.major = this._io.readBitsIntBe(4);
            this.minor = this._io.readBitsIntBe(4);
            this.unused = this._io.readBitsIntBe(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(4, this.release);
            this._io.writeBitsIntBe(4, this.major);
            this._io.writeBitsIntBe(4, this.minor);
            this._io.writeBitsIntBe(4, this.unused);
        }

        public void _check() {
            _dirty = false;
        }
        private long release;
        private long major;
        private long minor;
        private long unused;
        private PharWithoutStub _root;
        private PharWithoutStub.Manifest _parent;
        public long release() { return release; }
        public void setRelease(long _v) { _dirty = true; release = _v; }
        public long major() { return major; }
        public void setMajor(long _v) { _dirty = true; major = _v; }
        public long minor() { return minor; }
        public void setMinor(long _v) { _dirty = true; minor = _v; }
        public long unused() { return unused; }
        public void setUnused(long _v) { _dirty = true; unused = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public PharWithoutStub.Manifest _parent() { return _parent; }
        public void set_parent(PharWithoutStub.Manifest _v) { _dirty = true; _parent = _v; }
    }
    public static class FileEntry extends KaitaiStruct.ReadWrite {
        public static FileEntry fromFile(String fileName) throws IOException {
            return new FileEntry(new ByteBufferKaitaiStream(fileName));
        }
        public FileEntry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenFilename = this._io.readU4le();
            this.filename = this._io.readBytes(lenFilename());
            this.lenDataUncompressed = this._io.readU4le();
            this.timestamp = this._io.readU4le();
            this.lenDataCompressed = this._io.readU4le();
            this.crc32 = this._io.readU4le();
            this.flags = new FileFlags(this._io, this, _root);
            this.flags._read();
            this.lenMetadata = this._io.readU4le();
            if (lenMetadata() != 0) {
                this._raw_metadata = this._io.readBytes(lenMetadata());
                KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(this._raw_metadata);
                this.metadata = new SerializedValue(_io__raw_metadata, this, _root);
                this.metadata._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            if (lenMetadata() != 0) {
                this.metadata._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenFilename);
            this._io.writeBytes(this.filename);
            this._io.writeU4le(this.lenDataUncompressed);
            this._io.writeU4le(this.timestamp);
            this._io.writeU4le(this.lenDataCompressed);
            this._io.writeU4le(this.crc32);
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.lenMetadata);
            if (lenMetadata() != 0) {
                final KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(lenMetadata());
                this._io.addChildStream(_io__raw_metadata);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenMetadata()));
                    final FileEntry _this = this;
                    _io__raw_metadata.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_metadata = _io__raw_metadata.toByteArray();
                            if (_this._raw_metadata.length != lenMetadata())
                                throw new ConsistencyError("raw(metadata)", lenMetadata(), _this._raw_metadata.length);
                            parent.writeBytes(_this._raw_metadata);
                        }
                    });
                }
                this.metadata._write_Seq(_io__raw_metadata);
            }
        }

        public void _check() {
            if (this.filename.length != lenFilename())
                throw new ConsistencyError("filename", lenFilename(), this.filename.length);
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (lenMetadata() != 0) {
                if (!Objects.equals(this.metadata._root(), _root()))
                    throw new ConsistencyError("metadata", _root(), this.metadata._root());
                if (!Objects.equals(this.metadata._parent(), this))
                    throw new ConsistencyError("metadata", this, this.metadata._parent());
            }
            _dirty = false;
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
        public void setLenFilename(long _v) { _dirty = true; lenFilename = _v; }

        /**
         * The name of this file. If the name ends with a slash, this entry
         * represents a directory, otherwise a regular file. Directory entries
         * are supported since phar API version 1.1.1.
         * (Explicit directory entries are only needed for empty directories.
         * Non-empty directories are implied by the files located inside them.)
         */
        public byte[] filename() { return filename; }
        public void setFilename(byte[] _v) { _dirty = true; filename = _v; }

        /**
         * The length of the file's data when uncompressed, in bytes.
         */
        public long lenDataUncompressed() { return lenDataUncompressed; }
        public void setLenDataUncompressed(long _v) { _dirty = true; lenDataUncompressed = _v; }

        /**
         * The time at which the file was added or last updated, as a
         * Unix timestamp.
         */
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }

        /**
         * The length of the file's data when compressed, in bytes.
         */
        public long lenDataCompressed() { return lenDataCompressed; }
        public void setLenDataCompressed(long _v) { _dirty = true; lenDataCompressed = _v; }

        /**
         * The CRC32 checksum of the file's uncompressed data.
         */
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }

        /**
         * Flags for this file.
         */
        public FileFlags flags() { return flags; }
        public void setFlags(FileFlags _v) { _dirty = true; flags = _v; }

        /**
         * The length of the metadata, in bytes, or 0 if there is none.
         */
        public long lenMetadata() { return lenMetadata; }
        public void setLenMetadata(long _v) { _dirty = true; lenMetadata = _v; }

        /**
         * Metadata for this file, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the file.
         */
        public SerializedValue metadata() { return metadata; }
        public void setMetadata(SerializedValue _v) { _dirty = true; metadata = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public PharWithoutStub.Manifest _parent() { return _parent; }
        public void set_parent(PharWithoutStub.Manifest _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_metadata() { return _raw_metadata; }
        public void set_raw_Metadata(byte[] _v) { _dirty = true; _raw_metadata = _v; }
    }
    public static class FileFlags extends KaitaiStruct.ReadWrite {
        public static FileFlags fromFile(String fileName) throws IOException {
            return new FileFlags(new ByteBufferKaitaiStream(fileName));
        }
        public FileFlags() {
            this(null, null, null);
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
        }
        public void _read() {
            this.value = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private Boolean bzip2Compressed;

        /**
         * Whether this file's data is stored using bzip2 compression.
         */
        public Boolean bzip2Compressed() {
            if (this.bzip2Compressed != null)
                return this.bzip2Compressed;
            this.bzip2Compressed = (value() & 8192) != 0;
            return this.bzip2Compressed;
        }
        public void _invalidateBzip2Compressed() { this.bzip2Compressed = null; }
        private Integer permissions;

        /**
         * The file's permission bits.
         */
        public Integer permissions() {
            if (this.permissions != null)
                return this.permissions;
            this.permissions = ((Number) (value() & 511)).intValue();
            return this.permissions;
        }
        public void _invalidatePermissions() { this.permissions = null; }
        private Boolean zlibCompressed;

        /**
         * Whether this file's data is stored using zlib compression.
         */
        public Boolean zlibCompressed() {
            if (this.zlibCompressed != null)
                return this.zlibCompressed;
            this.zlibCompressed = (value() & 4096) != 0;
            return this.zlibCompressed;
        }
        public void _invalidateZlibCompressed() { this.zlibCompressed = null; }
        private long value;
        private PharWithoutStub _root;
        private PharWithoutStub.FileEntry _parent;

        /**
         * The unparsed flag bits.
         */
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public PharWithoutStub.FileEntry _parent() { return _parent; }
        public void set_parent(PharWithoutStub.FileEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class GlobalFlags extends KaitaiStruct.ReadWrite {
        public static GlobalFlags fromFile(String fileName) throws IOException {
            return new GlobalFlags(new ByteBufferKaitaiStream(fileName));
        }
        public GlobalFlags() {
            this(null, null, null);
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
        }
        public void _read() {
            this.value = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private Boolean anyBzip2Compressed;

        /**
         * Whether any of the files in this phar are stored using
         * bzip2 compression.
         */
        public Boolean anyBzip2Compressed() {
            if (this.anyBzip2Compressed != null)
                return this.anyBzip2Compressed;
            this.anyBzip2Compressed = (value() & 8192) != 0;
            return this.anyBzip2Compressed;
        }
        public void _invalidateAnyBzip2Compressed() { this.anyBzip2Compressed = null; }
        private Boolean anyZlibCompressed;

        /**
         * Whether any of the files in this phar are stored using
         * zlib compression.
         */
        public Boolean anyZlibCompressed() {
            if (this.anyZlibCompressed != null)
                return this.anyZlibCompressed;
            this.anyZlibCompressed = (value() & 4096) != 0;
            return this.anyZlibCompressed;
        }
        public void _invalidateAnyZlibCompressed() { this.anyZlibCompressed = null; }
        private Boolean hasSignature;

        /**
         * Whether this phar contains a signature.
         */
        public Boolean hasSignature() {
            if (this.hasSignature != null)
                return this.hasSignature;
            this.hasSignature = (value() & 65536) != 0;
            return this.hasSignature;
        }
        public void _invalidateHasSignature() { this.hasSignature = null; }
        private long value;
        private PharWithoutStub _root;
        private PharWithoutStub.Manifest _parent;

        /**
         * The unparsed flag bits.
         */
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public PharWithoutStub.Manifest _parent() { return _parent; }
        public void set_parent(PharWithoutStub.Manifest _v) { _dirty = true; _parent = _v; }
    }
    public static class Manifest extends KaitaiStruct.ReadWrite {
        public static Manifest fromFile(String fileName) throws IOException {
            return new Manifest(new ByteBufferKaitaiStream(fileName));
        }
        public Manifest() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenManifest = this._io.readU4le();
            this.numFiles = this._io.readU4le();
            this.apiVersion = new ApiVersion(this._io, this, _root);
            this.apiVersion._read();
            this.flags = new GlobalFlags(this._io, this, _root);
            this.flags._read();
            this.lenAlias = this._io.readU4le();
            this.alias = this._io.readBytes(lenAlias());
            this.lenMetadata = this._io.readU4le();
            if (lenMetadata() != 0) {
                this._raw_metadata = this._io.readBytes(lenMetadata());
                KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(this._raw_metadata);
                this.metadata = new SerializedValue(_io__raw_metadata, this, _root);
                this.metadata._read();
            }
            this.fileEntries = new ArrayList<FileEntry>();
            for (int i = 0; i < numFiles(); i++) {
                FileEntry _t_fileEntries = new FileEntry(this._io, this, _root);
                try {
                    _t_fileEntries._read();
                } finally {
                    this.fileEntries.add(_t_fileEntries);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.apiVersion._fetchInstances();
            this.flags._fetchInstances();
            if (lenMetadata() != 0) {
                this.metadata._fetchInstances();
            }
            for (int i = 0; i < this.fileEntries.size(); i++) {
                this.fileEntries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenManifest);
            this._io.writeU4le(this.numFiles);
            this.apiVersion._write_Seq(this._io);
            this.flags._write_Seq(this._io);
            this._io.writeU4le(this.lenAlias);
            this._io.writeBytes(this.alias);
            this._io.writeU4le(this.lenMetadata);
            if (lenMetadata() != 0) {
                final KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(lenMetadata());
                this._io.addChildStream(_io__raw_metadata);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenMetadata()));
                    final Manifest _this = this;
                    _io__raw_metadata.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_metadata = _io__raw_metadata.toByteArray();
                            if (_this._raw_metadata.length != lenMetadata())
                                throw new ConsistencyError("raw(metadata)", lenMetadata(), _this._raw_metadata.length);
                            parent.writeBytes(_this._raw_metadata);
                        }
                    });
                }
                this.metadata._write_Seq(_io__raw_metadata);
            }
            for (int i = 0; i < this.fileEntries.size(); i++) {
                this.fileEntries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.apiVersion._root(), _root()))
                throw new ConsistencyError("api_version", _root(), this.apiVersion._root());
            if (!Objects.equals(this.apiVersion._parent(), this))
                throw new ConsistencyError("api_version", this, this.apiVersion._parent());
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.alias.length != lenAlias())
                throw new ConsistencyError("alias", lenAlias(), this.alias.length);
            if (lenMetadata() != 0) {
                if (!Objects.equals(this.metadata._root(), _root()))
                    throw new ConsistencyError("metadata", _root(), this.metadata._root());
                if (!Objects.equals(this.metadata._parent(), this))
                    throw new ConsistencyError("metadata", this, this.metadata._parent());
            }
            if (this.fileEntries.size() != numFiles())
                throw new ConsistencyError("file_entries", numFiles(), this.fileEntries.size());
            for (int i = 0; i < this.fileEntries.size(); i++) {
                if (!Objects.equals(this.fileEntries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("file_entries", _root(), this.fileEntries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.fileEntries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("file_entries", this, this.fileEntries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long lenManifest;
        private long numFiles;
        private ApiVersion apiVersion;
        private GlobalFlags flags;
        private long lenAlias;
        private byte[] alias;
        private long lenMetadata;
        private SerializedValue metadata;
        private List<FileEntry> fileEntries;
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
        public void setLenManifest(long _v) { _dirty = true; lenManifest = _v; }

        /**
         * The number of files in this phar.
         */
        public long numFiles() { return numFiles; }
        public void setNumFiles(long _v) { _dirty = true; numFiles = _v; }

        /**
         * The API version used by this phar manifest.
         */
        public ApiVersion apiVersion() { return apiVersion; }
        public void setApiVersion(ApiVersion _v) { _dirty = true; apiVersion = _v; }

        /**
         * Global flags for this phar.
         */
        public GlobalFlags flags() { return flags; }
        public void setFlags(GlobalFlags _v) { _dirty = true; flags = _v; }

        /**
         * The length of the alias, in bytes.
         */
        public long lenAlias() { return lenAlias; }
        public void setLenAlias(long _v) { _dirty = true; lenAlias = _v; }

        /**
         * The phar's alias, i. e. the name under which it is loaded into PHP.
         */
        public byte[] alias() { return alias; }
        public void setAlias(byte[] _v) { _dirty = true; alias = _v; }

        /**
         * The size of the metadata, in bytes, or 0 if there is none.
         */
        public long lenMetadata() { return lenMetadata; }
        public void setLenMetadata(long _v) { _dirty = true; lenMetadata = _v; }

        /**
         * Metadata for this phar, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the archive.
         */
        public SerializedValue metadata() { return metadata; }
        public void setMetadata(SerializedValue _v) { _dirty = true; metadata = _v; }

        /**
         * Manifest entries for the files contained in this phar.
         */
        public List<FileEntry> fileEntries() { return fileEntries; }
        public void setFileEntries(List<FileEntry> _v) { _dirty = true; fileEntries = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public PharWithoutStub _parent() { return _parent; }
        public void set_parent(PharWithoutStub _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_metadata() { return _raw_metadata; }
        public void set_raw_Metadata(byte[] _v) { _dirty = true; _raw_metadata = _v; }
    }
    public static class SerializedValue extends KaitaiStruct.ReadWrite {
        public static SerializedValue fromFile(String fileName) throws IOException {
            return new SerializedValue(new ByteBufferKaitaiStream(fileName));
        }
        public SerializedValue() {
            this(null, null, null);
        }

        public SerializedValue(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SerializedValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public SerializedValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PharWithoutStub _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.raw = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
            parsed();
            if (this.parsed != null) {
                this.parsed._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteParsed = _enabledParsed;
            this._io.writeBytes(this.raw);
            if (!(this._io.isEof()))
                throw new ConsistencyError("raw", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (_enabledParsed) {
            }
            _dirty = false;
        }
        private PhpSerializedValue parsed;
        private boolean _shouldWriteParsed = false;
        private boolean _enabledParsed = true;

        /**
         * The serialized value, parsed as a structure.
         */
        public PhpSerializedValue parsed() {
            if (_shouldWriteParsed)
                _writeParsed();
            if (this.parsed != null)
                return this.parsed;
            if (!_enabledParsed)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.parsed = new PhpSerializedValue(this._io);
            this.parsed._read();
            this._io.seek(_pos);
            return this.parsed;
        }
        public void setParsed(PhpSerializedValue _v) { _dirty = true; parsed = _v; }
        public void setParsed_Enabled(boolean _v) { _dirty = true; _enabledParsed = _v; }

        private void _writeParsed() {
            _shouldWriteParsed = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.parsed._write_Seq(this._io);
            this._io.seek(_pos);
        }
        private byte[] raw;
        private PharWithoutStub _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * The serialized value, as a raw byte array.
         */
        public byte[] raw() { return raw; }
        public void setRaw(byte[] _v) { _dirty = true; raw = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Signature extends KaitaiStruct.ReadWrite {
        public static Signature fromFile(String fileName) throws IOException {
            return new Signature(new ByteBufferKaitaiStream(fileName));
        }
        public Signature() {
            this(null, null, null);
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
        }
        public void _read() {
            this.data = this._io.readBytes((_io().size() - _io().pos()) - 8);
            this.type = PharWithoutStub.SignatureType.byId(this._io.readU4le());
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 71, 66, 77, 66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 66, 77, 66 }, this.magic, this._io, "/types/signature/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (this.data.length != (_io().size() - _io().pos()) - 8)
                throw new ConsistencyError("data", (_io().size() - _io().pos()) - 8, this.data.length);
            this._io.writeBytes(this.data);
            this._io.writeU4le(((Number) (this.type.id())).longValue());
            this._io.writeBytes(this.magic);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 71, 66, 77, 66 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 66, 77, 66 }, this.magic, null, "/types/signature/seq/2");
            }
            _dirty = false;
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
        public void setData(byte[] _v) { _dirty = true; data = _v; }

        /**
         * The signature type.
         */
        public SignatureType type() { return type; }
        public void setType(SignatureType _v) { _dirty = true; type = _v; }
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public PharWithoutStub _root() { return _root; }
        public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
        public PharWithoutStub _parent() { return _parent; }
        public void set_parent(PharWithoutStub _v) { _dirty = true; _parent = _v; }
    }
    private Manifest manifest;
    private List<byte[]> files;
    private Signature signature;
    private PharWithoutStub _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_signature;

    /**
     * The archive's manifest, containing general metadata about the archive
     * and its files.
     */
    public Manifest manifest() { return manifest; }
    public void setManifest(Manifest _v) { _dirty = true; manifest = _v; }

    /**
     * The contents of each file in the archive (possibly compressed,
     * as indicated by the file's flags in the manifest). The files are stored
     * in the same order as they appear in the manifest.
     */
    public List<byte[]> files() { return files; }
    public void setFiles(List<byte[]> _v) { _dirty = true; files = _v; }

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
    public void setSignature(Signature _v) { _dirty = true; signature = _v; }
    public PharWithoutStub _root() { return _root; }
    public void set_root(PharWithoutStub _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_signature() { return _raw_signature; }
    public void set_raw_Signature(byte[] _v) { _dirty = true; _raw_signature = _v; }
}
