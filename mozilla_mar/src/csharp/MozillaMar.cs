// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
    /// Test files can be found on Mozilla's FTP site, for example:
    /// 
    /// &lt;http://ftp.mozilla.org/pub/firefox/nightly/partials/&gt;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://wiki.mozilla.org/Software_Update:MAR">Source</a>
    /// </remarks>
    public partial class MozillaMar : KaitaiStruct
    {
        public static MozillaMar FromFile(string fileName)
        {
            return new MozillaMar(new KaitaiStream(fileName));
        }


        public enum SignatureAlgorithms
        {
            RsaPkcs1Sha1 = 1,
            RsaPkcs1Sha384 = 2,
        }

        public enum BlockIdentifiers
        {
            ProductInformation = 1,
        }
        public MozillaMar(KaitaiStream p__io, KaitaiStruct p__parent = null, MozillaMar p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_index = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 77, 65, 82, 49 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 77, 65, 82, 49 }, Magic, M_Io, "/seq/0");
            }
            _ofsIndex = m_io.ReadU4be();
            _fileSize = m_io.ReadU8be();
            _lenSignatures = m_io.ReadU4be();
            _signatures = new List<Signature>();
            for (var i = 0; i < LenSignatures; i++)
            {
                _signatures.Add(new Signature(m_io, this, m_root));
            }
            _lenAdditionalSections = m_io.ReadU4be();
            _additionalSections = new List<AdditionalSection>();
            for (var i = 0; i < LenAdditionalSections; i++)
            {
                _additionalSections.Add(new AdditionalSection(m_io, this, m_root));
            }
        }
        public partial class MarIndex : KaitaiStruct
        {
            public static MarIndex FromFile(string fileName)
            {
                return new MarIndex(new KaitaiStream(fileName));
            }

            public MarIndex(KaitaiStream p__io, MozillaMar p__parent = null, MozillaMar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenIndex = m_io.ReadU4be();
                __raw_indexEntries = m_io.ReadBytes(LenIndex);
                var io___raw_indexEntries = new KaitaiStream(__raw_indexEntries);
                _indexEntries = new IndexEntries(io___raw_indexEntries, this, m_root);
            }
            private uint _lenIndex;
            private IndexEntries _indexEntries;
            private MozillaMar m_root;
            private MozillaMar m_parent;
            private byte[] __raw_indexEntries;
            public uint LenIndex { get { return _lenIndex; } }
            public IndexEntries IndexEntries { get { return _indexEntries; } }
            public MozillaMar M_Root { get { return m_root; } }
            public MozillaMar M_Parent { get { return m_parent; } }
            public byte[] M_RawIndexEntries { get { return __raw_indexEntries; } }
        }
        public partial class IndexEntries : KaitaiStruct
        {
            public static IndexEntries FromFile(string fileName)
            {
                return new IndexEntries(new KaitaiStream(fileName));
            }

            public IndexEntries(KaitaiStream p__io, MozillaMar.MarIndex p__parent = null, MozillaMar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _indexEntry = new List<IndexEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _indexEntry.Add(new IndexEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<IndexEntry> _indexEntry;
            private MozillaMar m_root;
            private MozillaMar.MarIndex m_parent;
            public List<IndexEntry> IndexEntry { get { return _indexEntry; } }
            public MozillaMar M_Root { get { return m_root; } }
            public MozillaMar.MarIndex M_Parent { get { return m_parent; } }
        }
        public partial class Signature : KaitaiStruct
        {
            public static Signature FromFile(string fileName)
            {
                return new Signature(new KaitaiStream(fileName));
            }

            public Signature(KaitaiStream p__io, MozillaMar p__parent = null, MozillaMar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _algorithm = ((MozillaMar.SignatureAlgorithms) m_io.ReadU4be());
                _lenSignature = m_io.ReadU4be();
                _signature = m_io.ReadBytes(LenSignature);
            }
            private SignatureAlgorithms _algorithm;
            private uint _lenSignature;
            private byte[] _signature;
            private MozillaMar m_root;
            private MozillaMar m_parent;
            public SignatureAlgorithms Algorithm { get { return _algorithm; } }
            public uint LenSignature { get { return _lenSignature; } }
            public byte[] Signature { get { return _signature; } }
            public MozillaMar M_Root { get { return m_root; } }
            public MozillaMar M_Parent { get { return m_parent; } }
        }
        public partial class ProductInformationBlock : KaitaiStruct
        {
            public static ProductInformationBlock FromFile(string fileName)
            {
                return new ProductInformationBlock(new KaitaiStream(fileName));
            }

            public ProductInformationBlock(KaitaiStream p__io, MozillaMar.AdditionalSection p__parent = null, MozillaMar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _marChannelName = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(64), 0, false));
                _productVersion = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(32), 0, false));
            }
            private string _marChannelName;
            private string _productVersion;
            private MozillaMar m_root;
            private MozillaMar.AdditionalSection m_parent;
            public string MarChannelName { get { return _marChannelName; } }
            public string ProductVersion { get { return _productVersion; } }
            public MozillaMar M_Root { get { return m_root; } }
            public MozillaMar.AdditionalSection M_Parent { get { return m_parent; } }
        }
        public partial class IndexEntry : KaitaiStruct
        {
            public static IndexEntry FromFile(string fileName)
            {
                return new IndexEntry(new KaitaiStream(fileName));
            }

            public IndexEntry(KaitaiStream p__io, MozillaMar.IndexEntries p__parent = null, MozillaMar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _ofsContent = m_io.ReadU4be();
                _lenContent = m_io.ReadU4be();
                _flags = m_io.ReadU4be();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private bool f_body;
            private byte[] _body;
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsContent);
                    _body = io.ReadBytes(LenContent);
                    io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private uint _ofsContent;
            private uint _lenContent;
            private uint _flags;
            private string _fileName;
            private MozillaMar m_root;
            private MozillaMar.IndexEntries m_parent;
            public uint OfsContent { get { return _ofsContent; } }
            public uint LenContent { get { return _lenContent; } }

            /// <summary>
            /// File permission bits (in standard unix-style format).
            /// </summary>
            public uint Flags { get { return _flags; } }
            public string FileName { get { return _fileName; } }
            public MozillaMar M_Root { get { return m_root; } }
            public MozillaMar.IndexEntries M_Parent { get { return m_parent; } }
        }
        public partial class AdditionalSection : KaitaiStruct
        {
            public static AdditionalSection FromFile(string fileName)
            {
                return new AdditionalSection(new KaitaiStream(fileName));
            }

            public AdditionalSection(KaitaiStream p__io, MozillaMar p__parent = null, MozillaMar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenBlock = m_io.ReadU4be();
                _blockIdentifier = ((MozillaMar.BlockIdentifiers) m_io.ReadU4be());
                switch (BlockIdentifier) {
                case MozillaMar.BlockIdentifiers.ProductInformation: {
                    __raw_bytes = m_io.ReadBytes(((LenBlock - 4) - 4));
                    var io___raw_bytes = new KaitaiStream(__raw_bytes);
                    _bytes = new ProductInformationBlock(io___raw_bytes, this, m_root);
                    break;
                }
                default: {
                    _bytes = m_io.ReadBytes(((LenBlock - 4) - 4));
                    break;
                }
                }
            }
            private uint _lenBlock;
            private BlockIdentifiers _blockIdentifier;
            private object _bytes;
            private MozillaMar m_root;
            private MozillaMar m_parent;
            private byte[] __raw_bytes;
            public uint LenBlock { get { return _lenBlock; } }
            public BlockIdentifiers BlockIdentifier { get { return _blockIdentifier; } }
            public object Bytes { get { return _bytes; } }
            public MozillaMar M_Root { get { return m_root; } }
            public MozillaMar M_Parent { get { return m_parent; } }
            public byte[] M_RawBytes { get { return __raw_bytes; } }
        }
        private bool f_index;
        private MarIndex _index;
        public MarIndex Index
        {
            get
            {
                if (f_index)
                    return _index;
                long _pos = m_io.Pos;
                m_io.Seek(OfsIndex);
                _index = new MarIndex(m_io, this, m_root);
                m_io.Seek(_pos);
                f_index = true;
                return _index;
            }
        }
        private byte[] _magic;
        private uint _ofsIndex;
        private ulong _fileSize;
        private uint _lenSignatures;
        private List<Signature> _signatures;
        private uint _lenAdditionalSections;
        private List<AdditionalSection> _additionalSections;
        private MozillaMar m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public uint OfsIndex { get { return _ofsIndex; } }
        public ulong FileSize { get { return _fileSize; } }
        public uint LenSignatures { get { return _lenSignatures; } }
        public List<Signature> Signatures { get { return _signatures; } }
        public uint LenAdditionalSections { get { return _lenAdditionalSections; } }
        public List<AdditionalSection> AdditionalSections { get { return _additionalSections; } }
        public MozillaMar M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
