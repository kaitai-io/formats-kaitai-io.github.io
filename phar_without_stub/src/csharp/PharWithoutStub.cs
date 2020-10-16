// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// A phar (PHP archive) file. The phar format is a custom archive format
    /// from the PHP ecosystem that is used to package a complete PHP library
    /// or application into a single self-contained archive.
    /// All phar archives start with an executable PHP stub, which can be used to
    /// allow executing or including phar files as if they were regular PHP scripts.
    /// PHP 5.3 and later include the phar extension, which adds native support for
    /// reading and manipulating phar files.
    /// 
    /// The phar format was originally developed as part of the PEAR library
    /// PHP_Archive, first released in 2005. Later, a native PHP extension
    /// named &quot;phar&quot; was developed, which was first released on PECL in 2007,
    /// and is included with PHP 5.3 and later. The phar extension has effectively
    /// superseded the PHP_Archive library, which has not been updated since 2010.
    /// The phar extension is also no longer released independently on PECL;
    /// it is now developed and released as part of PHP itself.
    /// 
    /// Because of current limitations in Kaitai Struct
    /// (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
    /// the executable PHP stub that precedes the rest of the archive is not handled
    /// by this spec. Before parsing a phar using this spec, the stub must be
    /// removed manually.
    /// 
    /// A phar's stub is terminated by the special token `__HALT_COMPILER();`
    /// (which may be followed by at most one space, the PHP tag end `?&gt;`,
    /// and an optional line terminator). The stub termination sequence is
    /// immediately followed by the remaining parts of the phar format,
    /// as described in this spec.
    /// 
    /// The phar stub usually contains code that loads the phar and runs
    /// a contained PHP file, but this is not required. A minimal valid phar stub
    /// is `&lt;?php __HALT_COMPILER();` - such a stub makes it impossible to execute
    /// the phar directly, but still allows loading or manipulating it using the
    /// phar extension.
    /// 
    /// Note: The phar format does not specify any encoding for text fields
    /// (stub, alias name, and all file names), so these fields may contain arbitrary
    /// binary data. The actual text encoding used in a specific phar file usually
    /// depends on the application that created the phar, and on the
    /// standard encoding of the system on which the phar was created.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.php.net/manual/en/phar.fileformat.php">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/php/php-src/tree/master/ext/phar">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://svn.php.net/viewvc/pecl/phar/">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://svn.php.net/viewvc/pear/packages/PHP_Archive/">Source</a>
    /// </remarks>
    public partial class PharWithoutStub : KaitaiStruct
    {
        public static PharWithoutStub FromFile(string fileName)
        {
            return new PharWithoutStub(new KaitaiStream(fileName));
        }


        public enum SignatureType
        {
            Md5 = 1,
            Sha1 = 2,
            Sha256 = 4,
            Sha512 = 8,
            Openssl = 16,
        }
        public PharWithoutStub(KaitaiStream p__io, KaitaiStruct p__parent = null, PharWithoutStub p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _manifest = new Manifest(m_io, this, m_root);
            _files = new List<byte[]>((int) (Manifest.NumFiles));
            for (var i = 0; i < Manifest.NumFiles; i++)
            {
                _files.Add(m_io.ReadBytes(Manifest.FileEntries[i].LenDataCompressed));
            }
            if (Manifest.Flags.HasSignature) {
                __raw_signature = m_io.ReadBytesFull();
                var io___raw_signature = new KaitaiStream(__raw_signature);
                _signature = new Signature(io___raw_signature, this, m_root);
            }
        }
        public partial class SerializedValue : KaitaiStruct
        {
            public static SerializedValue FromFile(string fileName)
            {
                return new SerializedValue(new KaitaiStream(fileName));
            }

            public SerializedValue(KaitaiStream p__io, KaitaiStruct p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_parsed = false;
                _read();
            }
            private void _read()
            {
                _raw = m_io.ReadBytesFull();
            }
            private bool f_parsed;
            private PhpSerializedValue _parsed;

            /// <summary>
            /// The serialized value, parsed as a structure.
            /// </summary>
            public PhpSerializedValue Parsed
            {
                get
                {
                    if (f_parsed)
                        return _parsed;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _parsed = new PhpSerializedValue(m_io);
                    m_io.Seek(_pos);
                    f_parsed = true;
                    return _parsed;
                }
            }
            private byte[] _raw;
            private PharWithoutStub m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// The serialized value, as a raw byte array.
            /// </summary>
            public byte[] Raw { get { return _raw; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Signature : KaitaiStruct
        {
            public static Signature FromFile(string fileName)
            {
                return new Signature(new KaitaiStream(fileName));
            }

            public Signature(KaitaiStream p__io, PharWithoutStub p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = m_io.ReadBytes(((M_Io.Size - M_Io.Pos) - 8));
                _type = ((PharWithoutStub.SignatureType) m_io.ReadU4le());
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 71, 66, 77, 66 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 71, 66, 77, 66 }, Magic, M_Io, "/types/signature/seq/2");
                }
            }
            private byte[] _data;
            private SignatureType _type;
            private byte[] _magic;
            private PharWithoutStub m_root;
            private PharWithoutStub m_parent;

            /// <summary>
            /// The signature data. The size and contents depend on the
            /// signature type.
            /// </summary>
            public byte[] Data { get { return _data; } }

            /// <summary>
            /// The signature type.
            /// </summary>
            public SignatureType Type { get { return _type; } }
            public byte[] Magic { get { return _magic; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public PharWithoutStub M_Parent { get { return m_parent; } }
        }
        public partial class FileFlags : KaitaiStruct
        {
            public static FileFlags FromFile(string fileName)
            {
                return new FileFlags(new KaitaiStream(fileName));
            }

            public FileFlags(KaitaiStream p__io, PharWithoutStub.FileEntry p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_permissions = false;
                f_zlibCompressed = false;
                f_bzip2Compressed = false;
                _read();
            }
            private void _read()
            {
                _value = m_io.ReadU4le();
            }
            private bool f_permissions;
            private int _permissions;

            /// <summary>
            /// The file's permission bits.
            /// </summary>
            public int Permissions
            {
                get
                {
                    if (f_permissions)
                        return _permissions;
                    _permissions = (int) ((Value & 511));
                    f_permissions = true;
                    return _permissions;
                }
            }
            private bool f_zlibCompressed;
            private bool _zlibCompressed;

            /// <summary>
            /// Whether this file's data is stored using zlib compression.
            /// </summary>
            public bool ZlibCompressed
            {
                get
                {
                    if (f_zlibCompressed)
                        return _zlibCompressed;
                    _zlibCompressed = (bool) ((Value & 4096) != 0);
                    f_zlibCompressed = true;
                    return _zlibCompressed;
                }
            }
            private bool f_bzip2Compressed;
            private bool _bzip2Compressed;

            /// <summary>
            /// Whether this file's data is stored using bzip2 compression.
            /// </summary>
            public bool Bzip2Compressed
            {
                get
                {
                    if (f_bzip2Compressed)
                        return _bzip2Compressed;
                    _bzip2Compressed = (bool) ((Value & 8192) != 0);
                    f_bzip2Compressed = true;
                    return _bzip2Compressed;
                }
            }
            private uint _value;
            private PharWithoutStub m_root;
            private PharWithoutStub.FileEntry m_parent;

            /// <summary>
            /// The unparsed flag bits.
            /// </summary>
            public uint Value { get { return _value; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public PharWithoutStub.FileEntry M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A phar API version number. This version number is meant to indicate
        /// which features are used in a specific phar, so that tools reading
        /// the phar can easily check that they support all necessary features.
        /// 
        /// The following API versions exist so far:
        /// 
        /// * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
        ///   the phar format was only used by the PHP_Archive library, and the
        ///   API version numbers were identical to the PHP_Archive versions that
        ///   supported them. Development of the native phar extension started around
        ///   API version 0.7. These API versions could only be queried using the
        ///   `PHP_Archive::APIversion()` method, but were not stored physically
        ///   in archives. These API versions are not supported by this spec.
        /// * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
        ///   later development versions of the phar extension. This is the first
        ///   version number to be physically stored in archives. This API version
        ///   is not supported by this spec.
        /// * 0.9.0: Used by later development/early beta versions of the
        ///   phar extension. Also temporarily used by PHP_Archive 0.9.0
        ///   (released 2006-12-15), but reverted back to API version 0.8.0 in
        ///   PHP_Archive 0.9.1 (released 2007-01-05).
        /// * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
        ///   and phar extension 1.0.0 (released 2007-03-28). This is the first
        ///   stable, forwards-compatible and documented version of the format.
        /// * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
        ///   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
        ///   SHA-512 signature types.
        /// * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
        ///   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
        ///   all features from API verison 1.1.1, but it reports API version 1.1.0.)
        ///   Adds the OpenSSL signature type and support for storing
        ///   empty directories.
        /// </summary>
        public partial class ApiVersion : KaitaiStruct
        {
            public static ApiVersion FromFile(string fileName)
            {
                return new ApiVersion(new KaitaiStream(fileName));
            }

            public ApiVersion(KaitaiStream p__io, PharWithoutStub.Manifest p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _release = m_io.ReadBitsIntBe(4);
                _major = m_io.ReadBitsIntBe(4);
                _minor = m_io.ReadBitsIntBe(4);
                _unused = m_io.ReadBitsIntBe(4);
            }
            private ulong _release;
            private ulong _major;
            private ulong _minor;
            private ulong _unused;
            private PharWithoutStub m_root;
            private PharWithoutStub.Manifest m_parent;
            public ulong Release { get { return _release; } }
            public ulong Major { get { return _major; } }
            public ulong Minor { get { return _minor; } }
            public ulong Unused { get { return _unused; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public PharWithoutStub.Manifest M_Parent { get { return m_parent; } }
        }
        public partial class GlobalFlags : KaitaiStruct
        {
            public static GlobalFlags FromFile(string fileName)
            {
                return new GlobalFlags(new KaitaiStream(fileName));
            }

            public GlobalFlags(KaitaiStream p__io, PharWithoutStub.Manifest p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_anyZlibCompressed = false;
                f_anyBzip2Compressed = false;
                f_hasSignature = false;
                _read();
            }
            private void _read()
            {
                _value = m_io.ReadU4le();
            }
            private bool f_anyZlibCompressed;
            private bool _anyZlibCompressed;

            /// <summary>
            /// Whether any of the files in this phar are stored using
            /// zlib compression.
            /// </summary>
            public bool AnyZlibCompressed
            {
                get
                {
                    if (f_anyZlibCompressed)
                        return _anyZlibCompressed;
                    _anyZlibCompressed = (bool) ((Value & 4096) != 0);
                    f_anyZlibCompressed = true;
                    return _anyZlibCompressed;
                }
            }
            private bool f_anyBzip2Compressed;
            private bool _anyBzip2Compressed;

            /// <summary>
            /// Whether any of the files in this phar are stored using
            /// bzip2 compression.
            /// </summary>
            public bool AnyBzip2Compressed
            {
                get
                {
                    if (f_anyBzip2Compressed)
                        return _anyBzip2Compressed;
                    _anyBzip2Compressed = (bool) ((Value & 8192) != 0);
                    f_anyBzip2Compressed = true;
                    return _anyBzip2Compressed;
                }
            }
            private bool f_hasSignature;
            private bool _hasSignature;

            /// <summary>
            /// Whether this phar contains a signature.
            /// </summary>
            public bool HasSignature
            {
                get
                {
                    if (f_hasSignature)
                        return _hasSignature;
                    _hasSignature = (bool) ((Value & 65536) != 0);
                    f_hasSignature = true;
                    return _hasSignature;
                }
            }
            private uint _value;
            private PharWithoutStub m_root;
            private PharWithoutStub.Manifest m_parent;

            /// <summary>
            /// The unparsed flag bits.
            /// </summary>
            public uint Value { get { return _value; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public PharWithoutStub.Manifest M_Parent { get { return m_parent; } }
        }
        public partial class Manifest : KaitaiStruct
        {
            public static Manifest FromFile(string fileName)
            {
                return new Manifest(new KaitaiStream(fileName));
            }

            public Manifest(KaitaiStream p__io, PharWithoutStub p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenManifest = m_io.ReadU4le();
                _numFiles = m_io.ReadU4le();
                _apiVersion = new ApiVersion(m_io, this, m_root);
                _flags = new GlobalFlags(m_io, this, m_root);
                _lenAlias = m_io.ReadU4le();
                _alias = m_io.ReadBytes(LenAlias);
                _lenMetadata = m_io.ReadU4le();
                if (LenMetadata != 0) {
                    __raw_metadata = m_io.ReadBytes(LenMetadata);
                    var io___raw_metadata = new KaitaiStream(__raw_metadata);
                    _metadata = new SerializedValue(io___raw_metadata, this, m_root);
                }
                _fileEntries = new List<FileEntry>((int) (NumFiles));
                for (var i = 0; i < NumFiles; i++)
                {
                    _fileEntries.Add(new FileEntry(m_io, this, m_root));
                }
            }
            private uint _lenManifest;
            private uint _numFiles;
            private ApiVersion _apiVersion;
            private GlobalFlags _flags;
            private uint _lenAlias;
            private byte[] _alias;
            private uint _lenMetadata;
            private SerializedValue _metadata;
            private List<FileEntry> _fileEntries;
            private PharWithoutStub m_root;
            private PharWithoutStub m_parent;
            private byte[] __raw_metadata;

            /// <summary>
            /// The length of the manifest, in bytes.
            /// 
            /// Note: The phar extension does not allow reading manifests
            /// larger than 100 MiB.
            /// </summary>
            public uint LenManifest { get { return _lenManifest; } }

            /// <summary>
            /// The number of files in this phar.
            /// </summary>
            public uint NumFiles { get { return _numFiles; } }

            /// <summary>
            /// The API version used by this phar manifest.
            /// </summary>
            public ApiVersion ApiVersion { get { return _apiVersion; } }

            /// <summary>
            /// Global flags for this phar.
            /// </summary>
            public GlobalFlags Flags { get { return _flags; } }

            /// <summary>
            /// The length of the alias, in bytes.
            /// </summary>
            public uint LenAlias { get { return _lenAlias; } }

            /// <summary>
            /// The phar's alias, i. e. the name under which it is loaded into PHP.
            /// </summary>
            public byte[] Alias { get { return _alias; } }

            /// <summary>
            /// The size of the metadata, in bytes, or 0 if there is none.
            /// </summary>
            public uint LenMetadata { get { return _lenMetadata; } }

            /// <summary>
            /// Metadata for this phar, in the format used by PHP's
            /// `serialize` function. The meaning of the serialized data is not
            /// specified further, it may be used to store arbitrary custom data
            /// about the archive.
            /// </summary>
            public SerializedValue Metadata { get { return _metadata; } }

            /// <summary>
            /// Manifest entries for the files contained in this phar.
            /// </summary>
            public List<FileEntry> FileEntries { get { return _fileEntries; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public PharWithoutStub M_Parent { get { return m_parent; } }
            public byte[] M_RawMetadata { get { return __raw_metadata; } }
        }
        public partial class FileEntry : KaitaiStruct
        {
            public static FileEntry FromFile(string fileName)
            {
                return new FileEntry(new KaitaiStream(fileName));
            }

            public FileEntry(KaitaiStream p__io, PharWithoutStub.Manifest p__parent = null, PharWithoutStub p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenFilename = m_io.ReadU4le();
                _filename = m_io.ReadBytes(LenFilename);
                _lenDataUncompressed = m_io.ReadU4le();
                _timestamp = m_io.ReadU4le();
                _lenDataCompressed = m_io.ReadU4le();
                _crc32 = m_io.ReadU4le();
                _flags = new FileFlags(m_io, this, m_root);
                _lenMetadata = m_io.ReadU4le();
                if (LenMetadata != 0) {
                    __raw_metadata = m_io.ReadBytes(LenMetadata);
                    var io___raw_metadata = new KaitaiStream(__raw_metadata);
                    _metadata = new SerializedValue(io___raw_metadata, this, m_root);
                }
            }
            private uint _lenFilename;
            private byte[] _filename;
            private uint _lenDataUncompressed;
            private uint _timestamp;
            private uint _lenDataCompressed;
            private uint _crc32;
            private FileFlags _flags;
            private uint _lenMetadata;
            private SerializedValue _metadata;
            private PharWithoutStub m_root;
            private PharWithoutStub.Manifest m_parent;
            private byte[] __raw_metadata;

            /// <summary>
            /// The length of the file name, in bytes.
            /// </summary>
            public uint LenFilename { get { return _lenFilename; } }

            /// <summary>
            /// The name of this file. If the name ends with a slash, this entry
            /// represents a directory, otherwise a regular file. Directory entries
            /// are supported since phar API version 1.1.1.
            /// (Explicit directory entries are only needed for empty directories.
            /// Non-empty directories are implied by the files located inside them.)
            /// </summary>
            public byte[] Filename { get { return _filename; } }

            /// <summary>
            /// The length of the file's data when uncompressed, in bytes.
            /// </summary>
            public uint LenDataUncompressed { get { return _lenDataUncompressed; } }

            /// <summary>
            /// The time at which the file was added or last updated, as a
            /// Unix timestamp.
            /// </summary>
            public uint Timestamp { get { return _timestamp; } }

            /// <summary>
            /// The length of the file's data when compressed, in bytes.
            /// </summary>
            public uint LenDataCompressed { get { return _lenDataCompressed; } }

            /// <summary>
            /// The CRC32 checksum of the file's uncompressed data.
            /// </summary>
            public uint Crc32 { get { return _crc32; } }

            /// <summary>
            /// Flags for this file.
            /// </summary>
            public FileFlags Flags { get { return _flags; } }

            /// <summary>
            /// The length of the metadata, in bytes, or 0 if there is none.
            /// </summary>
            public uint LenMetadata { get { return _lenMetadata; } }

            /// <summary>
            /// Metadata for this file, in the format used by PHP's
            /// `serialize` function. The meaning of the serialized data is not
            /// specified further, it may be used to store arbitrary custom data
            /// about the file.
            /// </summary>
            public SerializedValue Metadata { get { return _metadata; } }
            public PharWithoutStub M_Root { get { return m_root; } }
            public PharWithoutStub.Manifest M_Parent { get { return m_parent; } }
            public byte[] M_RawMetadata { get { return __raw_metadata; } }
        }
        private Manifest _manifest;
        private List<byte[]> _files;
        private Signature _signature;
        private PharWithoutStub m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_signature;

        /// <summary>
        /// The archive's manifest, containing general metadata about the archive
        /// and its files.
        /// </summary>
        public Manifest Manifest { get { return _manifest; } }

        /// <summary>
        /// The contents of each file in the archive (possibly compressed,
        /// as indicated by the file's flags in the manifest). The files are stored
        /// in the same order as they appear in the manifest.
        /// </summary>
        public List<byte[]> Files { get { return _files; } }

        /// <summary>
        /// The archive's signature - a digest of all archive data before
        /// the signature itself.
        /// 
        /// Note: Almost all of the available &quot;signature&quot; types are actually hashes,
        /// not signatures, and cannot be used to verify that the archive has not
        /// been tampered with. Only the OpenSSL signature type is a true
        /// cryptographic signature.
        /// </summary>
        public Signature Signature { get { return _signature; } }
        public PharWithoutStub M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawSignature { get { return __raw_signature; } }
    }
}
