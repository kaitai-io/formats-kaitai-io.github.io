// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
    /// 
    /// &quot;XAR (short for eXtensible ARchive format) is an open source file archiver
    /// and the archiver's file format. It was created within the OpenDarwin project
    /// and is used in macOS X 10.5 and up for software installation routines, as
    /// well as browser extensions in Safari 5.0 and up.&quot;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/mackyle/xar/wiki/xarformat">Source</a>
    /// </remarks>
    public partial class Xar : KaitaiStruct
    {
        public static Xar FromFile(string fileName)
        {
            return new Xar(new KaitaiStream(fileName));
        }


        public enum ChecksumAlgorithmsApple
        {
            None = 0,
            Sha1 = 1,
            Md5 = 2,
            Sha256 = 3,
            Sha512 = 4,
        }
        public Xar(KaitaiStream p__io, KaitaiStruct p__parent = null, Xar p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_checksumAlgorithmOther = false;
            _read();
        }
        private void _read()
        {
            _headerPrefix = new FileHeaderPrefix(m_io, this, m_root);
            __raw_header = m_io.ReadBytes((HeaderPrefix.LenHeader - 6));
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new FileHeader(io___raw_header, this, m_root);
            __raw__raw_toc = m_io.ReadBytes(Header.LenTocCompressed);
            __raw_toc = m_io.ProcessZlib(__raw__raw_toc);
            var io___raw_toc = new KaitaiStream(__raw_toc);
            _toc = new TocType(io___raw_toc, this, m_root);
        }
        public partial class FileHeaderPrefix : KaitaiStruct
        {
            public static FileHeaderPrefix FromFile(string fileName)
            {
                return new FileHeaderPrefix(new KaitaiStream(fileName));
            }

            public FileHeaderPrefix(KaitaiStream p__io, Xar p__parent = null, Xar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 120, 97, 114, 33 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 120, 97, 114, 33 }, Magic, M_Io, "/types/file_header_prefix/seq/0");
                }
                _lenHeader = m_io.ReadU2be();
            }
            private byte[] _magic;
            private ushort _lenHeader;
            private Xar m_root;
            private Xar m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// internal; access `_root.header.len_header` instead
            /// </summary>
            public ushort LenHeader { get { return _lenHeader; } }
            public Xar M_Root { get { return m_root; } }
            public Xar M_Parent { get { return m_parent; } }
        }
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }

            public FileHeader(KaitaiStream p__io, Xar p__parent = null, Xar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_checksumAlgorithmName = false;
                f_hasChecksumAlgName = false;
                f_lenHeader = false;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU2be();
                if (!(Version == 1))
                {
                    throw new ValidationNotEqualError(1, Version, M_Io, "/types/file_header/seq/0");
                }
                _lenTocCompressed = m_io.ReadU8be();
                _tocLengthUncompressed = m_io.ReadU8be();
                _checksumAlgorithmInt = m_io.ReadU4be();
                if (HasChecksumAlgName) {
                    _checksumAlgName = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytesFull(), 0, false));
                    {
                        string M_ = ChecksumAlgName;
                        if (!( ((M_ != "") && (M_ != "none")) ))
                        {
                            throw new ValidationExprError(ChecksumAlgName, M_Io, "/types/file_header/seq/4");
                        }
                    }
                }
            }
            private bool f_checksumAlgorithmName;
            private string _checksumAlgorithmName;

            /// <summary>
            /// If it is not
            /// 
            /// * `&quot;&quot;` (empty string), indicating an unknown integer value (access
            ///   `checksum_algorithm_int` for debugging purposes to find out
            ///   what that value is), or
            /// * `&quot;none&quot;`, indicating that the TOC checksum is not provided (in that
            ///   case, the `&lt;checksum&gt;` property or its `style` attribute should be
            ///   missing, or the `style` attribute must be set to `&quot;none&quot;`),
            /// 
            /// it must exactly match the `style` attribute value of the
            /// `&lt;checksum&gt;` property in the root node `&lt;toc&gt;`. See
            /// &lt;https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371&gt;
            /// for reference.
            /// 
            /// The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
            /// `EVP_get_digestbyname`](
            ///   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
            /// ) to verify this value (if it's not `&quot;&quot;` or `&quot;none&quot;`, of course).
            /// So it's reasonable to assume that this can only have one of the values
            /// that OpenSSL recognizes.
            /// </summary>
            public string ChecksumAlgorithmName
            {
                get
                {
                    if (f_checksumAlgorithmName)
                        return _checksumAlgorithmName;
                    _checksumAlgorithmName = (string) ((HasChecksumAlgName ? ChecksumAlgName : (ChecksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.None ? "none" : (ChecksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.Sha1 ? "sha1" : (ChecksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.Md5 ? "md5" : (ChecksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.Sha256 ? "sha256" : (ChecksumAlgorithmInt == Xar.ChecksumAlgorithmsApple.Sha512 ? "sha512" : "")))))));
                    f_checksumAlgorithmName = true;
                    return _checksumAlgorithmName;
                }
            }
            private bool f_hasChecksumAlgName;
            private bool _hasChecksumAlgName;
            public bool HasChecksumAlgName
            {
                get
                {
                    if (f_hasChecksumAlgName)
                        return _hasChecksumAlgName;
                    _hasChecksumAlgName = (bool) ( ((ChecksumAlgorithmInt == M_Root.ChecksumAlgorithmOther) && (LenHeader >= 32) && (KaitaiStream.Mod(LenHeader, 4) == 0)) );
                    f_hasChecksumAlgName = true;
                    return _hasChecksumAlgName;
                }
            }
            private bool f_lenHeader;
            private ushort _lenHeader;
            public ushort LenHeader
            {
                get
                {
                    if (f_lenHeader)
                        return _lenHeader;
                    _lenHeader = (ushort) (M_Root.HeaderPrefix.LenHeader);
                    f_lenHeader = true;
                    return _lenHeader;
                }
            }
            private ushort _version;
            private ulong _lenTocCompressed;
            private ulong _tocLengthUncompressed;
            private uint _checksumAlgorithmInt;
            private string _checksumAlgName;
            private Xar m_root;
            private Xar m_parent;
            public ushort Version { get { return _version; } }
            public ulong LenTocCompressed { get { return _lenTocCompressed; } }
            public ulong TocLengthUncompressed { get { return _tocLengthUncompressed; } }

            /// <summary>
            /// internal; access `checksum_algorithm_name` instead
            /// </summary>
            public uint ChecksumAlgorithmInt { get { return _checksumAlgorithmInt; } }

            /// <summary>
            /// internal; access `checksum_algorithm_name` instead
            /// </summary>
            public string ChecksumAlgName { get { return _checksumAlgName; } }
            public Xar M_Root { get { return m_root; } }
            public Xar M_Parent { get { return m_parent; } }
        }
        public partial class TocType : KaitaiStruct
        {
            public static TocType FromFile(string fileName)
            {
                return new TocType(new KaitaiStream(fileName));
            }

            public TocType(KaitaiStream p__io, Xar p__parent = null, Xar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _xmlString = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _xmlString;
            private Xar m_root;
            private Xar m_parent;
            public string XmlString { get { return _xmlString; } }
            public Xar M_Root { get { return m_root; } }
            public Xar M_Parent { get { return m_parent; } }
        }
        private bool f_checksumAlgorithmOther;
        private sbyte _checksumAlgorithmOther;

        /// <remarks>
        /// Reference: <a href="https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85">Source</a>
        /// </remarks>
        public sbyte ChecksumAlgorithmOther
        {
            get
            {
                if (f_checksumAlgorithmOther)
                    return _checksumAlgorithmOther;
                _checksumAlgorithmOther = (sbyte) (3);
                f_checksumAlgorithmOther = true;
                return _checksumAlgorithmOther;
            }
        }
        private FileHeaderPrefix _headerPrefix;
        private FileHeader _header;
        private TocType _toc;
        private Xar m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        private byte[] __raw_toc;
        private byte[] __raw__raw_toc;

        /// <summary>
        /// internal; access `_root.header` instead
        /// </summary>
        public FileHeaderPrefix HeaderPrefix { get { return _headerPrefix; } }
        public FileHeader Header { get { return _header; } }

        /// <summary>
        /// zlib compressed XML further describing the content of the archive
        /// </summary>
        public TocType Toc { get { return _toc; } }
        public Xar M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
        public byte[] M_RawToc { get { return __raw_toc; } }
        public byte[] M_RawM_RawToc { get { return __raw__raw_toc; } }
    }
}
