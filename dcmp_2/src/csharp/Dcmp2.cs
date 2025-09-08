// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Compressed resource data in `'dcmp' (2)` format,
    /// as stored in compressed resources with header type `9` and decompressor ID `2`.
    /// 
    /// The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
    /// This compression format is used for a few compressed resources in System 7.0's files
    /// (such as the System file).
    /// This decompressor is also included with and used by some other Apple applications,
    /// such as ResEdit.
    /// (Note: ResEdit includes the `'dcmp' (2)` resource,
    /// but none of its resources actually use this decompressor.)
    /// 
    /// This compression format is based on simple dictionary coding,
    /// where each byte in the compressed data expands to two bytes,
    /// based on a lookup table
    /// (either included in the compressed data or provided by the decompressor).
    /// An alternative &quot;tagged&quot; compression format is also supported,
    /// which allows using two-byte literals in addition to single-byte table references,
    /// at the cost of requiring an extra &quot;tag&quot; byte every 16 output bytes,
    /// to differentiate literals and table references.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py">Source</a>
    /// </remarks>
    public partial class Dcmp2 : KaitaiStruct
    {
        public Dcmp2(uint p_lenDecompressed, BytesWithIo p_headerParametersWithIo, KaitaiStream p__io, KaitaiStruct p__parent = null, Dcmp2 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _lenDecompressed = p_lenDecompressed;
            _headerParametersWithIo = p_headerParametersWithIo;
            f_defaultLookupTable = false;
            f_headerParameters = false;
            f_isLenDecompressedOdd = false;
            f_lookupTable = false;
            _read();
        }
        private void _read()
        {
            if (HeaderParameters.Flags.HasCustomLookupTable) {
                _customLookupTable = new List<byte[]>();
                for (var i = 0; i < HeaderParameters.NumCustomLookupTableEntries; i++)
                {
                    _customLookupTable.Add(m_io.ReadBytes(2));
                }
            }
            {
                bool on = HeaderParameters.Flags.Tagged;
                if (on == true)
                {
                    __raw_data = m_io.ReadBytes((M_Io.Size - M_Io.Pos) - (IsLenDecompressedOdd ? 1 : 0));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new TaggedData(io___raw_data, this, m_root);
                }
                else
                {
                    __raw_data = m_io.ReadBytes((M_Io.Size - M_Io.Pos) - (IsLenDecompressedOdd ? 1 : 0));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new UntaggedData(io___raw_data, this, m_root);
                }
            }
            if (IsLenDecompressedOdd) {
                _lastByte = m_io.ReadBytes(1);
            }
        }

        /// <summary>
        /// Decompressor-specific parameters for this compression format,
        /// as stored in the compressed resource header.
        /// </summary>
        public partial class HeaderParameters : KaitaiStruct
        {
            public static HeaderParameters FromFile(string fileName)
            {
                return new HeaderParameters(new KaitaiStream(fileName));
            }

            public HeaderParameters(KaitaiStream p__io, Dcmp2 p__parent = null, Dcmp2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numCustomLookupTableEntries = false;
                _read();
            }
            private void _read()
            {
                _unknown = m_io.ReadU2be();
                _numCustomLookupTableEntriesM1 = m_io.ReadU1();
                _flags = new Flags(m_io, this, m_root);
            }

            /// <summary>
            /// Flags for the decompressor,
            /// as stored in the decompressor-specific parameters.
            /// </summary>
            public partial class Flags : KaitaiStruct
            {
                public static Flags FromFile(string fileName)
                {
                    return new Flags(new KaitaiStream(fileName));
                }

                public Flags(KaitaiStream p__io, Dcmp2.HeaderParameters p__parent = null, Dcmp2 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_asInt = false;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadBitsIntBe(6);
                    _tagged = m_io.ReadBitsIntBe(1) != 0;
                    _hasCustomLookupTable = m_io.ReadBitsIntBe(1) != 0;
                }
                private bool f_asInt;
                private byte _asInt;

                /// <summary>
                /// The flags as a packed integer,
                /// as they are stored in the data.
                /// </summary>
                public byte AsInt
                {
                    get
                    {
                        if (f_asInt)
                            return _asInt;
                        f_asInt = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _asInt = m_io.ReadU1();
                        m_io.Seek(_pos);
                        return _asInt;
                    }
                }
                private ulong _reserved;
                private bool _tagged;
                private bool _hasCustomLookupTable;
                private Dcmp2 m_root;
                private Dcmp2.HeaderParameters m_parent;

                /// <summary>
                /// These flags have no known usage or meaning and should always be zero.
                /// </summary>
                public ulong Reserved { get { return _reserved; } }

                /// <summary>
                /// Whether the &quot;tagged&quot; variant of this compression format should be used,
                /// rather than the default &quot;untagged&quot; variant.
                /// </summary>
                public bool Tagged { get { return _tagged; } }

                /// <summary>
                /// Whether a custom lookup table is included before the compressed data,
                /// which should be used instead of the default hardcoded lookup table.
                /// </summary>
                public bool HasCustomLookupTable { get { return _hasCustomLookupTable; } }
                public Dcmp2 M_Root { get { return m_root; } }
                public Dcmp2.HeaderParameters M_Parent { get { return m_parent; } }
            }
            private bool f_numCustomLookupTableEntries;
            private int? _numCustomLookupTableEntries;

            /// <summary>
            /// The number of entries in the custom lookup table.
            /// Only used if a custom lookup table is present.
            /// </summary>
            public int? NumCustomLookupTableEntries
            {
                get
                {
                    if (f_numCustomLookupTableEntries)
                        return _numCustomLookupTableEntries;
                    f_numCustomLookupTableEntries = true;
                    if (Flags.HasCustomLookupTable) {
                        _numCustomLookupTableEntries = (int) (NumCustomLookupTableEntriesM1 + 1);
                    }
                    return _numCustomLookupTableEntries;
                }
            }
            private ushort _unknown;
            private byte _numCustomLookupTableEntriesM1;
            private Flags _flags;
            private Dcmp2 m_root;
            private Dcmp2 m_parent;

            /// <summary>
            /// The meaning of this field is unknown.
            /// It does not appear to have any effect on the format of the compressed data or the decompression process.
            /// 
            /// The value of this field is usually zero and otherwise a small integer (&lt; 10).
            /// For `'lpch'` resources,
            /// the value is always nonzero,
            /// and sometimes larger than usual.
            /// </summary>
            public ushort Unknown { get { return _unknown; } }

            /// <summary>
            /// The number of entries in the custom lookup table,
            /// minus one.
            /// 
            /// If the default lookup table is used rather than a custom one,
            /// this value is zero.
            /// </summary>
            public byte NumCustomLookupTableEntriesM1 { get { return _numCustomLookupTableEntriesM1; } }

            /// <summary>
            /// Various flags that affect the format of the compressed data and the decompression process.
            /// </summary>
            public Flags Flags { get { return _flags; } }
            public Dcmp2 M_Root { get { return m_root; } }
            public Dcmp2 M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Compressed data in the &quot;tagged&quot; variant of the format.
        /// </summary>
        public partial class TaggedData : KaitaiStruct
        {
            public static TaggedData FromFile(string fileName)
            {
                return new TaggedData(new KaitaiStream(fileName));
            }

            public TaggedData(KaitaiStream p__io, Dcmp2 p__parent = null, Dcmp2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chunks = new List<Chunk>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _chunks.Add(new Chunk(m_io, this, m_root));
                        i++;
                    }
                }
            }

            /// <summary>
            /// A single tagged chunk of compressed data.
            /// 
            /// Each chunk expands to 16 bytes of decompressed data.
            /// In compressed form,
            /// the chunks have a variable length
            /// (between 9 and 17 bytes)
            /// depending on the value of the tag byte.
            /// </summary>
            public partial class Chunk : KaitaiStruct
            {
                public static Chunk FromFile(string fileName)
                {
                    return new Chunk(new KaitaiStream(fileName));
                }

                public Chunk(KaitaiStream p__io, Dcmp2.TaggedData p__parent = null, Dcmp2 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tag = new List<bool>();
                    for (var i = 0; i < 8; i++)
                    {
                        _tag.Add(m_io.ReadBitsIntBe(1) != 0);
                    }
                    m_io.AlignToByte();
                    _units = new List<object>();
                    {
                        var i = 0;
                        object M_;
                        do {
                            {
                                bool on = Tag[i];
                                if (on == true)
                                {
                                    M_ = m_io.ReadU1();
                                    _units.Add(M_);
                                }
                                else
                                {
                                    M_ = m_io.ReadBytes((Tag[i] ? 1 : 2));
                                    _units.Add(M_);
                                }
                            }
                            i++;
                        } while (!( ((i >= 7) || (M_Io.IsEof)) ));
                    }
                }
                private List<bool> _tag;
                private List<object> _units;
                private Dcmp2 m_root;
                private Dcmp2.TaggedData m_parent;

                /// <summary>
                /// The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
                /// </summary>
                public List<bool> Tag { get { return _tag; } }

                /// <summary>
                /// The compressed data units in this chunk.
                /// 
                /// The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
                /// If the bit is 0 (false),
                /// the unit is a pair of bytes,
                /// which are literally copied to the decompressed data.
                /// If the bit is 1 (true),
                /// the unit is a reference into the lookup table,
                /// an integer which is expanded to two bytes by looking it up in the table.
                /// </summary>
                public List<object> Units { get { return _units; } }
                public Dcmp2 M_Root { get { return m_root; } }
                public Dcmp2.TaggedData M_Parent { get { return m_parent; } }
            }
            private List<Chunk> _chunks;
            private Dcmp2 m_root;
            private Dcmp2 m_parent;

            /// <summary>
            /// The tagged chunks that make up the compressed data.
            /// </summary>
            public List<Chunk> Chunks { get { return _chunks; } }
            public Dcmp2 M_Root { get { return m_root; } }
            public Dcmp2 M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Compressed data in the &quot;untagged&quot; variant of the format.
        /// </summary>
        public partial class UntaggedData : KaitaiStruct
        {
            public static UntaggedData FromFile(string fileName)
            {
                return new UntaggedData(new KaitaiStream(fileName));
            }

            public UntaggedData(KaitaiStream p__io, Dcmp2 p__parent = null, Dcmp2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _tableReferences = new List<byte>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _tableReferences.Add(m_io.ReadU1());
                        i++;
                    }
                }
            }
            private List<byte> _tableReferences;
            private Dcmp2 m_root;
            private Dcmp2 m_parent;

            /// <summary>
            /// References into the lookup table.
            /// Each reference is an integer that is expanded to two bytes by looking it up in the table.
            /// </summary>
            public List<byte> TableReferences { get { return _tableReferences; } }
            public Dcmp2 M_Root { get { return m_root; } }
            public Dcmp2 M_Parent { get { return m_parent; } }
        }
        private bool f_defaultLookupTable;
        private List<byte[]> _defaultLookupTable;

        /// <summary>
        /// The default lookup table,
        /// which is used if no custom lookup table is included with the compressed data.
        /// </summary>
        public List<byte[]> DefaultLookupTable
        {
            get
            {
                if (f_defaultLookupTable)
                    return _defaultLookupTable;
                f_defaultLookupTable = true;
                _defaultLookupTable = (List<byte[]>) (new List<byte[]> { new byte[] { 0, 0 }, new byte[] { 0, 8 }, new byte[] { 78, 186 }, new byte[] { 32, 110 }, new byte[] { 78, 117 }, new byte[] { 0, 12 }, new byte[] { 0, 4 }, new byte[] { 112, 0 }, new byte[] { 0, 16 }, new byte[] { 0, 2 }, new byte[] { 72, 110 }, new byte[] { 255, 252 }, new byte[] { 96, 0 }, new byte[] { 0, 1 }, new byte[] { 72, 231 }, new byte[] { 47, 46 }, new byte[] { 78, 86 }, new byte[] { 0, 6 }, new byte[] { 78, 94 }, new byte[] { 47, 0 }, new byte[] { 97, 0 }, new byte[] { 255, 248 }, new byte[] { 47, 11 }, new byte[] { 255, 255 }, new byte[] { 0, 20 }, new byte[] { 0, 10 }, new byte[] { 0, 24 }, new byte[] { 32, 95 }, new byte[] { 0, 14 }, new byte[] { 32, 80 }, new byte[] { 63, 60 }, new byte[] { 255, 244 }, new byte[] { 76, 238 }, new byte[] { 48, 46 }, new byte[] { 103, 0 }, new byte[] { 76, 223 }, new byte[] { 38, 110 }, new byte[] { 0, 18 }, new byte[] { 0, 28 }, new byte[] { 66, 103 }, new byte[] { 255, 240 }, new byte[] { 48, 60 }, new byte[] { 47, 12 }, new byte[] { 0, 3 }, new byte[] { 78, 208 }, new byte[] { 0, 32 }, new byte[] { 112, 1 }, new byte[] { 0, 22 }, new byte[] { 45, 64 }, new byte[] { 72, 192 }, new byte[] { 32, 120 }, new byte[] { 114, 0 }, new byte[] { 88, 143 }, new byte[] { 102, 0 }, new byte[] { 79, 239 }, new byte[] { 66, 167 }, new byte[] { 103, 6 }, new byte[] { 255, 250 }, new byte[] { 85, 143 }, new byte[] { 40, 110 }, new byte[] { 63, 0 }, new byte[] { 255, 254 }, new byte[] { 47, 60 }, new byte[] { 103, 4 }, new byte[] { 89, 143 }, new byte[] { 32, 107 }, new byte[] { 0, 36 }, new byte[] { 32, 31 }, new byte[] { 65, 250 }, new byte[] { 129, 225 }, new byte[] { 102, 4 }, new byte[] { 103, 8 }, new byte[] { 0, 26 }, new byte[] { 78, 185 }, new byte[] { 80, 143 }, new byte[] { 32, 46 }, new byte[] { 0, 7 }, new byte[] { 78, 176 }, new byte[] { 255, 242 }, new byte[] { 61, 64 }, new byte[] { 0, 30 }, new byte[] { 32, 104 }, new byte[] { 102, 6 }, new byte[] { 255, 246 }, new byte[] { 78, 249 }, new byte[] { 8, 0 }, new byte[] { 12, 64 }, new byte[] { 61, 124 }, new byte[] { 255, 236 }, new byte[] { 0, 5 }, new byte[] { 32, 60 }, new byte[] { 255, 232 }, new byte[] { 222, 252 }, new byte[] { 74, 46 }, new byte[] { 0, 48 }, new byte[] { 0, 40 }, new byte[] { 47, 8 }, new byte[] { 32, 11 }, new byte[] { 96, 2 }, new byte[] { 66, 110 }, new byte[] { 45, 72 }, new byte[] { 32, 83 }, new byte[] { 32, 64 }, new byte[] { 24, 0 }, new byte[] { 96, 4 }, new byte[] { 65, 238 }, new byte[] { 47, 40 }, new byte[] { 47, 1 }, new byte[] { 103, 10 }, new byte[] { 72, 64 }, new byte[] { 32, 7 }, new byte[] { 102, 8 }, new byte[] { 1, 24 }, new byte[] { 47, 7 }, new byte[] { 48, 40 }, new byte[] { 63, 46 }, new byte[] { 48, 43 }, new byte[] { 34, 110 }, new byte[] { 47, 43 }, new byte[] { 0, 44 }, new byte[] { 103, 12 }, new byte[] { 34, 95 }, new byte[] { 96, 6 }, new byte[] { 0, 255 }, new byte[] { 48, 7 }, new byte[] { 255, 238 }, new byte[] { 83, 64 }, new byte[] { 0, 64 }, new byte[] { 255, 228 }, new byte[] { 74, 64 }, new byte[] { 102, 10 }, new byte[] { 0, 15 }, new byte[] { 78, 173 }, new byte[] { 112, 255 }, new byte[] { 34, 216 }, new byte[] { 72, 107 }, new byte[] { 0, 34 }, new byte[] { 32, 75 }, new byte[] { 103, 14 }, new byte[] { 74, 174 }, new byte[] { 78, 144 }, new byte[] { 255, 224 }, new byte[] { 255, 192 }, new byte[] { 0, 42 }, new byte[] { 39, 64 }, new byte[] { 103, 2 }, new byte[] { 81, 200 }, new byte[] { 2, 182 }, new byte[] { 72, 122 }, new byte[] { 34, 120 }, new byte[] { 176, 110 }, new byte[] { 255, 230 }, new byte[] { 0, 9 }, new byte[] { 50, 46 }, new byte[] { 62, 0 }, new byte[] { 72, 65 }, new byte[] { 255, 234 }, new byte[] { 67, 238 }, new byte[] { 78, 113 }, new byte[] { 116, 0 }, new byte[] { 47, 44 }, new byte[] { 32, 108 }, new byte[] { 0, 60 }, new byte[] { 0, 38 }, new byte[] { 0, 80 }, new byte[] { 24, 128 }, new byte[] { 48, 31 }, new byte[] { 34, 0 }, new byte[] { 102, 12 }, new byte[] { 255, 218 }, new byte[] { 0, 56 }, new byte[] { 102, 2 }, new byte[] { 48, 44 }, new byte[] { 32, 12 }, new byte[] { 45, 110 }, new byte[] { 66, 64 }, new byte[] { 255, 226 }, new byte[] { 169, 240 }, new byte[] { 255, 0 }, new byte[] { 55, 124 }, new byte[] { 229, 128 }, new byte[] { 255, 220 }, new byte[] { 72, 104 }, new byte[] { 89, 79 }, new byte[] { 0, 52 }, new byte[] { 62, 31 }, new byte[] { 96, 8 }, new byte[] { 47, 6 }, new byte[] { 255, 222 }, new byte[] { 96, 10 }, new byte[] { 112, 2 }, new byte[] { 0, 50 }, new byte[] { 255, 204 }, new byte[] { 0, 128 }, new byte[] { 34, 81 }, new byte[] { 16, 31 }, new byte[] { 49, 124 }, new byte[] { 160, 41 }, new byte[] { 255, 216 }, new byte[] { 82, 64 }, new byte[] { 1, 0 }, new byte[] { 103, 16 }, new byte[] { 160, 35 }, new byte[] { 255, 206 }, new byte[] { 255, 212 }, new byte[] { 32, 6 }, new byte[] { 72, 120 }, new byte[] { 0, 46 }, new byte[] { 80, 79 }, new byte[] { 67, 250 }, new byte[] { 103, 18 }, new byte[] { 118, 0 }, new byte[] { 65, 232 }, new byte[] { 74, 110 }, new byte[] { 32, 217 }, new byte[] { 0, 90 }, new byte[] { 127, 255 }, new byte[] { 81, 202 }, new byte[] { 0, 92 }, new byte[] { 46, 0 }, new byte[] { 2, 64 }, new byte[] { 72, 199 }, new byte[] { 103, 20 }, new byte[] { 12, 128 }, new byte[] { 46, 159 }, new byte[] { 255, 214 }, new byte[] { 128, 0 }, new byte[] { 16, 0 }, new byte[] { 72, 66 }, new byte[] { 74, 107 }, new byte[] { 255, 210 }, new byte[] { 0, 72 }, new byte[] { 74, 71 }, new byte[] { 78, 209 }, new byte[] { 32, 111 }, new byte[] { 0, 65 }, new byte[] { 96, 12 }, new byte[] { 42, 120 }, new byte[] { 66, 46 }, new byte[] { 50, 0 }, new byte[] { 101, 116 }, new byte[] { 103, 22 }, new byte[] { 0, 68 }, new byte[] { 72, 109 }, new byte[] { 32, 8 }, new byte[] { 72, 108 }, new byte[] { 11, 124 }, new byte[] { 38, 64 }, new byte[] { 4, 0 }, new byte[] { 0, 104 }, new byte[] { 32, 109 }, new byte[] { 0, 13 }, new byte[] { 42, 64 }, new byte[] { 0, 11 }, new byte[] { 0, 62 }, new byte[] { 2, 32 } });
                return _defaultLookupTable;
            }
        }
        private bool f_headerParameters;
        private HeaderParameters _headerParameters;

        /// <summary>
        /// The parsed decompressor-specific parameters from the compressed resource header.
        /// </summary>
        public HeaderParameters HeaderParameters
        {
            get
            {
                if (f_headerParameters)
                    return _headerParameters;
                f_headerParameters = true;
                KaitaiStream io = HeaderParametersWithIo.M_Io;
                long _pos = io.Pos;
                io.Seek(0);
                _headerParameters = new HeaderParameters(io, this, m_root);
                io.Seek(_pos);
                return _headerParameters;
            }
        }
        private bool f_isLenDecompressedOdd;
        private bool _isLenDecompressedOdd;

        /// <summary>
        /// Whether the length of the decompressed data is odd.
        /// This affects the meaning of the last byte of the compressed data.
        /// </summary>
        public bool IsLenDecompressedOdd
        {
            get
            {
                if (f_isLenDecompressedOdd)
                    return _isLenDecompressedOdd;
                f_isLenDecompressedOdd = true;
                _isLenDecompressedOdd = (bool) (KaitaiStream.Mod(LenDecompressed, 2) != 0);
                return _isLenDecompressedOdd;
            }
        }
        private bool f_lookupTable;
        private List<byte[]> _lookupTable;

        /// <summary>
        /// The lookup table to be used for this compressed data.
        /// </summary>
        public List<byte[]> LookupTable
        {
            get
            {
                if (f_lookupTable)
                    return _lookupTable;
                f_lookupTable = true;
                _lookupTable = (List<byte[]>) ((HeaderParameters.Flags.HasCustomLookupTable ? CustomLookupTable : DefaultLookupTable));
                return _lookupTable;
            }
        }
        private List<byte[]> _customLookupTable;
        private KaitaiStruct _data;
        private byte[] _lastByte;
        private uint _lenDecompressed;
        private BytesWithIo _headerParametersWithIo;
        private Dcmp2 m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_data;

        /// <summary>
        /// The custom lookup table to be used instead of the default lookup table.
        /// </summary>
        public List<byte[]> CustomLookupTable { get { return _customLookupTable; } }

        /// <summary>
        /// The compressed data.
        /// The structure of the data varies depending on whether the &quot;tagged&quot; or &quot;untagged&quot; variant of the compression format is used.
        /// </summary>
        public KaitaiStruct Data { get { return _data; } }

        /// <summary>
        /// The last byte of the decompressed data,
        /// stored literally.
        /// Only present if the decompressed data has an odd length.
        /// 
        /// This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
        /// either literally or as table references,
        /// so otherwise there would be no way to compress odd-length resources using this format.
        /// </summary>
        public byte[] LastByte { get { return _lastByte; } }

        /// <summary>
        /// The length of the decompressed data in bytes,
        /// from the compressed resource header.
        /// </summary>
        public uint LenDecompressed { get { return _lenDecompressed; } }

        /// <summary>
        /// The unparsed decompressor-specific parameters,
        /// from the compressed resource header.
        /// </summary>
        public BytesWithIo HeaderParametersWithIo { get { return _headerParametersWithIo; } }
        public Dcmp2 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawData { get { return __raw_data; } }
    }
}
