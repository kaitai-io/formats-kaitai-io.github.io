<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

namespace {
    class PharWithoutStub extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_manifest = new \PharWithoutStub\Manifest($this->_io, $this, $this->_root);
            $this->_m_files = [];
            $n = $this->manifest()->numFiles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_files[] = $this->_io->readBytes($this->manifest()->fileEntries()[$i]->lenDataCompressed());
            }
            if ($this->manifest()->flags()->hasSignature()) {
                $this->_m__raw_signature = $this->_io->readBytesFull();
                $_io__raw_signature = new \Kaitai\Struct\Stream($this->_m__raw_signature);
                $this->_m_signature = new \PharWithoutStub\Signature($_io__raw_signature, $this, $this->_root);
            }
        }
        protected $_m_manifest;
        protected $_m_files;
        protected $_m_signature;
        protected $_m__raw_signature;

        /**
         * The archive's manifest, containing general metadata about the archive
         * and its files.
         */
        public function manifest() { return $this->_m_manifest; }

        /**
         * The contents of each file in the archive (possibly compressed,
         * as indicated by the file's flags in the manifest). The files are stored
         * in the same order as they appear in the manifest.
         */
        public function files() { return $this->_m_files; }

        /**
         * The archive's signature - a digest of all archive data before
         * the signature itself.
         * 
         * Note: Almost all of the available "signature" types are actually hashes,
         * not signatures, and cannot be used to verify that the archive has not
         * been tampered with. Only the OpenSSL signature type is a true
         * cryptographic signature.
         */
        public function signature() { return $this->_m_signature; }
        public function _raw_signature() { return $this->_m__raw_signature; }
    }
}

namespace PharWithoutStub {
    class SerializedValue extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_raw = $this->_io->readBytesFull();
        }
        protected $_m_parsed;

        /**
         * The serialized value, parsed as a structure.
         */
        public function parsed() {
            if ($this->_m_parsed !== null)
                return $this->_m_parsed;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_parsed = new \PhpSerializedValue($this->_io);
            $this->_io->seek($_pos);
            return $this->_m_parsed;
        }
        protected $_m_raw;

        /**
         * The serialized value, as a raw byte array.
         */
        public function raw() { return $this->_m_raw; }
    }
}

namespace PharWithoutStub {
    class Signature extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PharWithoutStub $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_data = $this->_io->readBytes((($this->_io()->size() - $this->_io()->pos()) - 8));
            $this->_m_type = $this->_io->readU4le();
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x47\x42\x4D\x42")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x47\x42\x4D\x42", $this->magic(), $this->_io(), "/types/signature/seq/2");
            }
        }
        protected $_m_data;
        protected $_m_type;
        protected $_m_magic;

        /**
         * The signature data. The size and contents depend on the
         * signature type.
         */
        public function data() { return $this->_m_data; }

        /**
         * The signature type.
         */
        public function type() { return $this->_m_type; }
        public function magic() { return $this->_m_magic; }
    }
}

namespace PharWithoutStub {
    class FileFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PharWithoutStub\FileEntry $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readU4le();
        }
        protected $_m_permissions;

        /**
         * The file's permission bits.
         */
        public function permissions() {
            if ($this->_m_permissions !== null)
                return $this->_m_permissions;
            $this->_m_permissions = ($this->value() & 511);
            return $this->_m_permissions;
        }
        protected $_m_zlibCompressed;

        /**
         * Whether this file's data is stored using zlib compression.
         */
        public function zlibCompressed() {
            if ($this->_m_zlibCompressed !== null)
                return $this->_m_zlibCompressed;
            $this->_m_zlibCompressed = ($this->value() & 4096) != 0;
            return $this->_m_zlibCompressed;
        }
        protected $_m_bzip2Compressed;

        /**
         * Whether this file's data is stored using bzip2 compression.
         */
        public function bzip2Compressed() {
            if ($this->_m_bzip2Compressed !== null)
                return $this->_m_bzip2Compressed;
            $this->_m_bzip2Compressed = ($this->value() & 8192) != 0;
            return $this->_m_bzip2Compressed;
        }
        protected $_m_value;

        /**
         * The unparsed flag bits.
         */
        public function value() { return $this->_m_value; }
    }
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

namespace PharWithoutStub {
    class ApiVersion extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PharWithoutStub\Manifest $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_release = $this->_io->readBitsIntBe(4);
            $this->_m_major = $this->_io->readBitsIntBe(4);
            $this->_m_minor = $this->_io->readBitsIntBe(4);
            $this->_m_unused = $this->_io->readBitsIntBe(4);
        }
        protected $_m_release;
        protected $_m_major;
        protected $_m_minor;
        protected $_m_unused;
        public function release() { return $this->_m_release; }
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
        public function unused() { return $this->_m_unused; }
    }
}

namespace PharWithoutStub {
    class GlobalFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PharWithoutStub\Manifest $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readU4le();
        }
        protected $_m_anyZlibCompressed;

        /**
         * Whether any of the files in this phar are stored using
         * zlib compression.
         */
        public function anyZlibCompressed() {
            if ($this->_m_anyZlibCompressed !== null)
                return $this->_m_anyZlibCompressed;
            $this->_m_anyZlibCompressed = ($this->value() & 4096) != 0;
            return $this->_m_anyZlibCompressed;
        }
        protected $_m_anyBzip2Compressed;

        /**
         * Whether any of the files in this phar are stored using
         * bzip2 compression.
         */
        public function anyBzip2Compressed() {
            if ($this->_m_anyBzip2Compressed !== null)
                return $this->_m_anyBzip2Compressed;
            $this->_m_anyBzip2Compressed = ($this->value() & 8192) != 0;
            return $this->_m_anyBzip2Compressed;
        }
        protected $_m_hasSignature;

        /**
         * Whether this phar contains a signature.
         */
        public function hasSignature() {
            if ($this->_m_hasSignature !== null)
                return $this->_m_hasSignature;
            $this->_m_hasSignature = ($this->value() & 65536) != 0;
            return $this->_m_hasSignature;
        }
        protected $_m_value;

        /**
         * The unparsed flag bits.
         */
        public function value() { return $this->_m_value; }
    }
}

namespace PharWithoutStub {
    class Manifest extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PharWithoutStub $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenManifest = $this->_io->readU4le();
            $this->_m_numFiles = $this->_io->readU4le();
            $this->_m_apiVersion = new \PharWithoutStub\ApiVersion($this->_io, $this, $this->_root);
            $this->_m_flags = new \PharWithoutStub\GlobalFlags($this->_io, $this, $this->_root);
            $this->_m_lenAlias = $this->_io->readU4le();
            $this->_m_alias = $this->_io->readBytes($this->lenAlias());
            $this->_m_lenMetadata = $this->_io->readU4le();
            if ($this->lenMetadata() != 0) {
                $this->_m__raw_metadata = $this->_io->readBytes($this->lenMetadata());
                $_io__raw_metadata = new \Kaitai\Struct\Stream($this->_m__raw_metadata);
                $this->_m_metadata = new \PharWithoutStub\SerializedValue($_io__raw_metadata, $this, $this->_root);
            }
            $this->_m_fileEntries = [];
            $n = $this->numFiles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_fileEntries[] = new \PharWithoutStub\FileEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_lenManifest;
        protected $_m_numFiles;
        protected $_m_apiVersion;
        protected $_m_flags;
        protected $_m_lenAlias;
        protected $_m_alias;
        protected $_m_lenMetadata;
        protected $_m_metadata;
        protected $_m_fileEntries;
        protected $_m__raw_metadata;

        /**
         * The length of the manifest, in bytes.
         * 
         * Note: The phar extension does not allow reading manifests
         * larger than 100 MiB.
         */
        public function lenManifest() { return $this->_m_lenManifest; }

        /**
         * The number of files in this phar.
         */
        public function numFiles() { return $this->_m_numFiles; }

        /**
         * The API version used by this phar manifest.
         */
        public function apiVersion() { return $this->_m_apiVersion; }

        /**
         * Global flags for this phar.
         */
        public function flags() { return $this->_m_flags; }

        /**
         * The length of the alias, in bytes.
         */
        public function lenAlias() { return $this->_m_lenAlias; }

        /**
         * The phar's alias, i. e. the name under which it is loaded into PHP.
         */
        public function alias() { return $this->_m_alias; }

        /**
         * The size of the metadata, in bytes, or 0 if there is none.
         */
        public function lenMetadata() { return $this->_m_lenMetadata; }

        /**
         * Metadata for this phar, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the archive.
         */
        public function metadata() { return $this->_m_metadata; }

        /**
         * Manifest entries for the files contained in this phar.
         */
        public function fileEntries() { return $this->_m_fileEntries; }
        public function _raw_metadata() { return $this->_m__raw_metadata; }
    }
}

namespace PharWithoutStub {
    class FileEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \PharWithoutStub\Manifest $_parent = null, \PharWithoutStub $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenFilename = $this->_io->readU4le();
            $this->_m_filename = $this->_io->readBytes($this->lenFilename());
            $this->_m_lenDataUncompressed = $this->_io->readU4le();
            $this->_m_timestamp = $this->_io->readU4le();
            $this->_m_lenDataCompressed = $this->_io->readU4le();
            $this->_m_crc32 = $this->_io->readU4le();
            $this->_m_flags = new \PharWithoutStub\FileFlags($this->_io, $this, $this->_root);
            $this->_m_lenMetadata = $this->_io->readU4le();
            if ($this->lenMetadata() != 0) {
                $this->_m__raw_metadata = $this->_io->readBytes($this->lenMetadata());
                $_io__raw_metadata = new \Kaitai\Struct\Stream($this->_m__raw_metadata);
                $this->_m_metadata = new \PharWithoutStub\SerializedValue($_io__raw_metadata, $this, $this->_root);
            }
        }
        protected $_m_lenFilename;
        protected $_m_filename;
        protected $_m_lenDataUncompressed;
        protected $_m_timestamp;
        protected $_m_lenDataCompressed;
        protected $_m_crc32;
        protected $_m_flags;
        protected $_m_lenMetadata;
        protected $_m_metadata;
        protected $_m__raw_metadata;

        /**
         * The length of the file name, in bytes.
         */
        public function lenFilename() { return $this->_m_lenFilename; }

        /**
         * The name of this file. If the name ends with a slash, this entry
         * represents a directory, otherwise a regular file. Directory entries
         * are supported since phar API version 1.1.1.
         * (Explicit directory entries are only needed for empty directories.
         * Non-empty directories are implied by the files located inside them.)
         */
        public function filename() { return $this->_m_filename; }

        /**
         * The length of the file's data when uncompressed, in bytes.
         */
        public function lenDataUncompressed() { return $this->_m_lenDataUncompressed; }

        /**
         * The time at which the file was added or last updated, as a
         * Unix timestamp.
         */
        public function timestamp() { return $this->_m_timestamp; }

        /**
         * The length of the file's data when compressed, in bytes.
         */
        public function lenDataCompressed() { return $this->_m_lenDataCompressed; }

        /**
         * The CRC32 checksum of the file's uncompressed data.
         */
        public function crc32() { return $this->_m_crc32; }

        /**
         * Flags for this file.
         */
        public function flags() { return $this->_m_flags; }

        /**
         * The length of the metadata, in bytes, or 0 if there is none.
         */
        public function lenMetadata() { return $this->_m_lenMetadata; }

        /**
         * Metadata for this file, in the format used by PHP's
         * `serialize` function. The meaning of the serialized data is not
         * specified further, it may be used to store arbitrary custom data
         * about the file.
         */
        public function metadata() { return $this->_m_metadata; }
        public function _raw_metadata() { return $this->_m__raw_metadata; }
    }
}

namespace PharWithoutStub {
    class SignatureType {

        /**
         * Indicates an MD5 hash.
         */
        const MD5 = 1;

        /**
         * Indicates a SHA-1 hash.
         */
        const SHA1 = 2;

        /**
         * Indicates a SHA-256 hash. Available since API version 1.1.0,
         * PHP_Archive 0.12.0 and phar extension 1.1.0.
         */
        const SHA256 = 4;

        /**
         * Indicates a SHA-512 hash. Available since API version 1.1.0,
         * PHP_Archive 0.12.0 and phar extension 1.1.0.
         */
        const SHA512 = 8;

        /**
         * Indicates an OpenSSL signature. Available since API version 1.1.1,
         * PHP_Archive 0.12.0 (even though it claims to only support
         * API version 1.1.0) and phar extension 1.3.0. This type is not
         * documented in the phar extension's documentation of the phar format.
         * 
         * Note: In older versions of the phar extension, this value was used
         * for an undocumented and unimplemented "PGP" signature type
         * (`PHAR_SIG_PGP`).
         */
        const OPENSSL = 16;
    }
}
