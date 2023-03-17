// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Gzip is a popular and standard single-file archiving format. It
    /// essentially provides a container that stores original file name,
    /// timestamp and a few other things (like optional comment), basic
    /// CRCs, etc, and a file compressed by a chosen compression algorithm.
    /// 
    /// As of 2019, there is actually only one working solution for
    /// compression algorithms, so it's typically raw DEFLATE stream
    /// (without zlib header) in all gzipped files.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.rfc-editor.org/rfc/rfc1952">Source</a>
    /// </remarks>
    public partial class Gzip : KaitaiStruct
    {
        public static Gzip FromFile(string fileName)
        {
            return new Gzip(new KaitaiStream(fileName));
        }


        public enum CompressionMethods
        {
            Deflate = 8,
        }

        public enum Oses
        {
            Fat = 0,
            Amiga = 1,
            Vms = 2,
            Unix = 3,
            VmCms = 4,
            AtariTos = 5,
            Hpfs = 6,
            Macintosh = 7,
            ZSystem = 8,
            CpM = 9,
            Tops20 = 10,
            Ntfs = 11,
            Qdos = 12,
            AcornRiscos = 13,
            Unknown = 255,
        }
        public Gzip(KaitaiStream p__io, KaitaiStruct p__parent = null, Gzip p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(2);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 31, 139 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 31, 139 }, Magic, M_Io, "/seq/0");
            }
            _compressionMethod = ((CompressionMethods) m_io.ReadU1());
            _flags = new Flags(m_io, this, m_root);
            _modTime = m_io.ReadU4le();
            switch (CompressionMethod) {
            case CompressionMethods.Deflate: {
                _extraFlags = new ExtraFlagsDeflate(m_io, this, m_root);
                break;
            }
            }
            _os = ((Oses) m_io.ReadU1());
            if (Flags.HasExtra) {
                _extras = new Extras(m_io, this, m_root);
            }
            if (Flags.HasName) {
                _name = m_io.ReadBytesTerm(0, false, true, true);
            }
            if (Flags.HasComment) {
                _comment = m_io.ReadBytesTerm(0, false, true, true);
            }
            if (Flags.HasHeaderCrc) {
                _headerCrc16 = m_io.ReadU2le();
            }
            _body = m_io.ReadBytes(((M_Io.Size - M_Io.Pos) - 8));
            _bodyCrc32 = m_io.ReadU4le();
            _lenUncompressed = m_io.ReadU4le();
        }
        public partial class Flags : KaitaiStruct
        {
            public static Flags FromFile(string fileName)
            {
                return new Flags(new KaitaiStream(fileName));
            }

            public Flags(KaitaiStream p__io, Gzip p__parent = null, Gzip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved1 = m_io.ReadBitsIntBe(3);
                _hasComment = m_io.ReadBitsIntBe(1) != 0;
                _hasName = m_io.ReadBitsIntBe(1) != 0;
                _hasExtra = m_io.ReadBitsIntBe(1) != 0;
                _hasHeaderCrc = m_io.ReadBitsIntBe(1) != 0;
                _isText = m_io.ReadBitsIntBe(1) != 0;
            }
            private ulong _reserved1;
            private bool _hasComment;
            private bool _hasName;
            private bool _hasExtra;
            private bool _hasHeaderCrc;
            private bool _isText;
            private Gzip m_root;
            private Gzip m_parent;
            public ulong Reserved1 { get { return _reserved1; } }
            public bool HasComment { get { return _hasComment; } }
            public bool HasName { get { return _hasName; } }

            /// <summary>
            /// If true, optional extra fields are present in the archive.
            /// </summary>
            public bool HasExtra { get { return _hasExtra; } }

            /// <summary>
            /// If true, this archive includes a CRC16 checksum for the header.
            /// </summary>
            public bool HasHeaderCrc { get { return _hasHeaderCrc; } }

            /// <summary>
            /// If true, file inside this archive is a text file from
            /// compressor's point of view.
            /// </summary>
            public bool IsText { get { return _isText; } }
            public Gzip M_Root { get { return m_root; } }
            public Gzip M_Parent { get { return m_parent; } }
        }
        public partial class ExtraFlagsDeflate : KaitaiStruct
        {
            public static ExtraFlagsDeflate FromFile(string fileName)
            {
                return new ExtraFlagsDeflate(new KaitaiStream(fileName));
            }


            public enum CompressionStrengths
            {
                Best = 2,
                Fast = 4,
            }
            public ExtraFlagsDeflate(KaitaiStream p__io, Gzip p__parent = null, Gzip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _compressionStrength = ((CompressionStrengths) m_io.ReadU1());
            }
            private CompressionStrengths _compressionStrength;
            private Gzip m_root;
            private Gzip m_parent;
            public CompressionStrengths CompressionStrength { get { return _compressionStrength; } }
            public Gzip M_Root { get { return m_root; } }
            public Gzip M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Container for many subfields, constrained by size of stream.
        /// </summary>
        public partial class Subfields : KaitaiStruct
        {
            public static Subfields FromFile(string fileName)
            {
                return new Subfields(new KaitaiStream(fileName));
            }

            public Subfields(KaitaiStream p__io, Gzip.Extras p__parent = null, Gzip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Subfield>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Subfield(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Subfield> _entries;
            private Gzip m_root;
            private Gzip.Extras m_parent;
            public List<Subfield> Entries { get { return _entries; } }
            public Gzip M_Root { get { return m_root; } }
            public Gzip.Extras M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
        /// 
        /// * `id` serves role of &quot;T&quot;ype
        /// * `len_data` serves role of &quot;L&quot;ength
        /// * `data` serves role of &quot;V&quot;alue
        /// 
        /// This way it's possible to for arbitrary parser to skip over
        /// subfields it does not support.
        /// </summary>
        public partial class Subfield : KaitaiStruct
        {
            public static Subfield FromFile(string fileName)
            {
                return new Subfield(new KaitaiStream(fileName));
            }

            public Subfield(KaitaiStream p__io, Gzip.Subfields p__parent = null, Gzip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2le();
                _lenData = m_io.ReadU2le();
                _data = m_io.ReadBytes(LenData);
            }
            private ushort _id;
            private ushort _lenData;
            private byte[] _data;
            private Gzip m_root;
            private Gzip.Subfields m_parent;

            /// <summary>
            /// Subfield ID, typically two ASCII letters.
            /// </summary>
            public ushort Id { get { return _id; } }
            public ushort LenData { get { return _lenData; } }
            public byte[] Data { get { return _data; } }
            public Gzip M_Root { get { return m_root; } }
            public Gzip.Subfields M_Parent { get { return m_parent; } }
        }
        public partial class Extras : KaitaiStruct
        {
            public static Extras FromFile(string fileName)
            {
                return new Extras(new KaitaiStream(fileName));
            }

            public Extras(KaitaiStream p__io, Gzip p__parent = null, Gzip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenSubfields = m_io.ReadU2le();
                __raw_subfields = m_io.ReadBytes(LenSubfields);
                var io___raw_subfields = new KaitaiStream(__raw_subfields);
                _subfields = new Subfields(io___raw_subfields, this, m_root);
            }
            private ushort _lenSubfields;
            private Subfields _subfields;
            private Gzip m_root;
            private Gzip m_parent;
            private byte[] __raw_subfields;
            public ushort LenSubfields { get { return _lenSubfields; } }
            public Subfields Subfields { get { return _subfields; } }
            public Gzip M_Root { get { return m_root; } }
            public Gzip M_Parent { get { return m_parent; } }
            public byte[] M_RawSubfields { get { return __raw_subfields; } }
        }
        private byte[] _magic;
        private CompressionMethods _compressionMethod;
        private Flags _flags;
        private uint _modTime;
        private ExtraFlagsDeflate _extraFlags;
        private Oses _os;
        private Extras _extras;
        private byte[] _name;
        private byte[] _comment;
        private ushort? _headerCrc16;
        private byte[] _body;
        private uint _bodyCrc32;
        private uint _lenUncompressed;
        private Gzip m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// Compression method used to compress file body. In practice, only
        /// one method is widely used: 8 = deflate.
        /// </summary>
        public CompressionMethods CompressionMethod { get { return _compressionMethod; } }
        public Flags Flags { get { return _flags; } }

        /// <summary>
        /// Last modification time of a file archived in UNIX timestamp format.
        /// </summary>
        public uint ModTime { get { return _modTime; } }

        /// <summary>
        /// Extra flags, specific to compression method chosen.
        /// </summary>
        public ExtraFlagsDeflate ExtraFlags { get { return _extraFlags; } }

        /// <summary>
        /// OS used to compress this file.
        /// </summary>
        public Oses Os { get { return _os; } }
        public Extras Extras { get { return _extras; } }
        public byte[] Name { get { return _name; } }
        public byte[] Comment { get { return _comment; } }
        public ushort? HeaderCrc16 { get { return _headerCrc16; } }

        /// <summary>
        /// Compressed body of a file archived. Note that we don't make an
        /// attempt to decompress it here.
        /// </summary>
        public byte[] Body { get { return _body; } }

        /// <summary>
        /// CRC32 checksum of an uncompressed file body
        /// </summary>
        public uint BodyCrc32 { get { return _bodyCrc32; } }

        /// <summary>
        /// Size of original uncompressed data in bytes (truncated to 32
        /// bits).
        /// </summary>
        public uint LenUncompressed { get { return _lenUncompressed; } }
        public Gzip M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
