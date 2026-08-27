// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt">Source</a>
    /// </remarks>
    public partial class Zchunk : KaitaiStruct
    {
        public static Zchunk FromFile(string fileName)
        {
            return new Zchunk(new KaitaiStream(fileName));
        }


        public enum ChecksumTypes
        {
            Sha1 = 0,
            Sha256 = 1,
            Sha512 = 2,
            Sha512128 = 3,
        }

        public enum CompressionTypes
        {
            None = 0,
            Zstd = 2,
        }
        public Zchunk(KaitaiStream p__io, KaitaiStruct p__parent = null, Zchunk p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _lead = new HeaderLead(m_io, this, m_root);
            __raw_headerRest = m_io.ReadBytes(Lead.LenHeaderRest.Value);
            var io___raw_headerRest = new KaitaiStream(__raw_headerRest);
            _headerRest = new HeaderWithoutLead(io___raw_headerRest, this, m_root);
            _dict = m_io.ReadBytes(HeaderRest.Index.LenDict.Value);
            if (!(Lead.IsDetachedHeader)) {
                _chunks = new List<byte[]>();
                for (var i = 0; i < HeaderRest.Index.ChunksMetadata.Count; i++)
                {
                    _chunks.Add(m_io.ReadBytes(HeaderRest.Index.ChunksMetadata[i].LenChunk.Value));
                }
            }
        }
        public partial class ChecksumType : KaitaiStruct
        {
            public static ChecksumType FromFile(string fileName)
            {
                return new ChecksumType(new KaitaiStream(fileName));
            }

            public ChecksumType(KaitaiStream p__io, KaitaiStruct p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenChecksum = false;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _raw = new CompressedInteger(m_io, this, m_root);
                {
                    CompressedInteger M_ = _raw;
                    if (!(LenChecksum != 0))
                    {
                        throw new ValidationExprError(_raw, m_io, "/types/checksum_type/seq/0");
                    }
                }
            }
            private bool f_lenChecksum;
            private sbyte _lenChecksum;
            public sbyte LenChecksum
            {
                get
                {
                    if (f_lenChecksum)
                        return _lenChecksum;
                    f_lenChecksum = true;
                    _lenChecksum = (sbyte) ((Value == Zchunk.ChecksumTypes.Sha1 ? 20 : (Value == Zchunk.ChecksumTypes.Sha256 ? 32 : (Value == Zchunk.ChecksumTypes.Sha512 ? 64 : (Value == Zchunk.ChecksumTypes.Sha512128 ? 16 : 0)))));
                    return _lenChecksum;
                }
            }
            private bool f_value;
            private ChecksumTypes _value;
            public ChecksumTypes Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (ChecksumTypes) (((Zchunk.ChecksumTypes) Raw.Value));
                    return _value;
                }
            }
            private CompressedInteger _raw;
            private Zchunk m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Raw integer, don't read this field - access `value` instead.
            /// </summary>
            public CompressedInteger Raw { get { return _raw; } }
            public Zchunk M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Chunk : KaitaiStruct
        {
            public Chunk(uint p_lenChecksum, bool p_hasDataStreams, bool p_hasUncompressedSource, KaitaiStream p__io, Zchunk.Index p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _lenChecksum = p_lenChecksum;
                _hasDataStreams = p_hasDataStreams;
                _hasUncompressedSource = p_hasUncompressedSource;
                _read();
            }
            private void _read()
            {
                if (HasDataStreams) {
                    _chunkStream = new CompressedInteger(m_io, this, m_root);
                }
                _chunkChecksum = m_io.ReadBytes(LenChecksum);
                if (HasUncompressedSource) {
                    _uncompressedChunkChecksum = m_io.ReadBytes(LenChecksum);
                }
                _lenChunk = new CompressedInteger(m_io, this, m_root);
                _lenUncompressedChunk = new CompressedInteger(m_io, this, m_root);
            }
            private CompressedInteger _chunkStream;
            private byte[] _chunkChecksum;
            private byte[] _uncompressedChunkChecksum;
            private CompressedInteger _lenChunk;
            private CompressedInteger _lenUncompressedChunk;
            private uint _lenChecksum;
            private bool _hasDataStreams;
            private bool _hasUncompressedSource;
            private Zchunk m_root;
            private Zchunk.Index m_parent;
            public CompressedInteger ChunkStream { get { return _chunkStream; } }
            public byte[] ChunkChecksum { get { return _chunkChecksum; } }

            /// <summary>
            /// Checksum of the uncompressed chunk. Used to detect whether a chunk
            /// from an uncompressed source is identical to the compressed chunk.
            /// </summary>
            public byte[] UncompressedChunkChecksum { get { return _uncompressedChunkChecksum; } }
            public CompressedInteger LenChunk { get { return _lenChunk; } }
            public CompressedInteger LenUncompressedChunk { get { return _lenUncompressedChunk; } }
            public uint LenChecksum { get { return _lenChecksum; } }
            public bool HasDataStreams { get { return _hasDataStreams; } }
            public bool HasUncompressedSource { get { return _hasUncompressedSource; } }
            public Zchunk M_Root { get { return m_root; } }
            public Zchunk.Index M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Like `/common/vlq_base128_le` (LEB128), but the logic of the
        /// &quot;continuation&quot; flag in the most significant bit is inverted, so instead of
        /// `has_next`, it is called `is_last` (if the highest bit is set to zero, it
        /// means &quot;continue&quot;, whereas in standard LEB128, the highest bit set to
        /// **one** means &quot;continue&quot;). Therefore, we cannot simply import
        /// `/common/vlq_base128_le` and use it, because it is incompatible.
        /// </summary>
        public partial class CompressedInteger : KaitaiStruct
        {
            public static CompressedInteger FromFile(string fileName)
            {
                return new CompressedInteger(new KaitaiStream(fileName));
            }

            public CompressedInteger(KaitaiStream p__io, KaitaiStruct p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_len = false;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _groups = new List<Group>();
                {
                    var i = 0;
                    Group M_;
                    do {
                        M_ = new Group(i, m_io, this, m_root);
                        _groups.Add(M_);
                        i++;
                    } while (!(M_.IsLast));
                }
            }

            /// <summary>
            /// One byte group, clearly divided into 7-bit &quot;value&quot; chunk and 1-bit &quot;continuation&quot; flag.
            /// </summary>
            public partial class Group : KaitaiStruct
            {
                public Group(int p_idx, KaitaiStream p__io, Zchunk.CompressedInteger p__parent = null, Zchunk p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _idx = p_idx;
                    _read();
                }
                private void _read()
                {
                    _isLast = m_io.ReadBitsIntBe(1) != 0;
                    if (!(_isLast == (Idx == 9 ? true : IsLast)))
                    {
                        throw new ValidationNotEqualError((Idx == 9 ? true : IsLast), _isLast, m_io, "/types/compressed_integer/types/group/seq/0");
                    }
                    _value = m_io.ReadBitsIntBe(7);
                    if (!(_value <= ((ulong) ((Idx == 9 ? 1 : 127)))))
                    {
                        throw new ValidationGreaterThanError(((ulong) ((Idx == 9 ? 1 : 127))), _value, m_io, "/types/compressed_integer/types/group/seq/1");
                    }
                }
                private bool _isLast;
                private ulong _value;
                private int _idx;
                private Zchunk m_root;
                private Zchunk.CompressedInteger m_parent;

                /// <summary>
                /// If `true`, then this is the last byte of the compressed integer.
                /// 
                /// Since this implementation only supports serialized values up to 10
                /// bytes, this must be `true` in the 10th group (`groups[9]`).
                /// </summary>
                public bool IsLast { get { return _isLast; } }

                /// <summary>
                /// The 7-bit (base128) numeric value chunk of this group
                /// 
                /// Since this implementation only supports integer values up to 64 bits,
                /// the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
                /// (otherwise the width of the represented value would be 65 bits or
                /// more, which is not supported).
                /// </summary>
                public ulong Value { get { return _value; } }
                public int Idx { get { return _idx; } }
                public Zchunk M_Root { get { return m_root; } }
                public Zchunk.CompressedInteger M_Parent { get { return m_parent; } }
            }
            private bool f_len;
            private int _len;
            public int Len
            {
                get
                {
                    if (f_len)
                        return _len;
                    f_len = true;
                    _len = (int) (Groups.Count);
                    return _len;
                }
            }
            private bool f_value;
            private ulong _value;

            /// <summary>
            /// Resulting unsigned value as normal integer
            /// </summary>
            public ulong Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (ulong) (((ulong) (((((((((Groups[0].Value | (Len >= 2 ? Groups[1].Value << 7 : 0)) | (Len >= 3 ? Groups[2].Value << 14 : 0)) | (Len >= 4 ? Groups[3].Value << 21 : 0)) | (Len >= 5 ? Groups[4].Value << 28 : 0)) | (Len >= 6 ? Groups[5].Value << 35 : 0)) | (Len >= 7 ? Groups[6].Value << 42 : 0)) | (Len >= 8 ? Groups[7].Value << 49 : 0)) | (Len >= 9 ? Groups[8].Value << 56 : 0)) | (Len >= 10 ? Groups[9].Value << 63 : 0))));
                    return _value;
                }
            }
            private List<Group> _groups;
            private Zchunk m_root;
            private KaitaiStruct m_parent;
            public List<Group> Groups { get { return _groups; } }
            public Zchunk M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class HeaderLead : KaitaiStruct
        {
            public static HeaderLead FromFile(string fileName)
            {
                return new HeaderLead(new KaitaiStream(fileName));
            }

            public HeaderLead(KaitaiStream p__io, Zchunk p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isDetachedHeader = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(5);
                if (!( (((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 0, 90, 67, 75, 49 }) == 0)) || ((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 0, 90, 72, 82, 49 }) == 0))) ))
                {
                    throw new ValidationNotAnyOfError(_magic, m_io, "/types/header_lead/seq/0");
                }
                _overallChecksumType = new ChecksumType(m_io, this, m_root);
                _lenHeaderRest = new CompressedInteger(m_io, this, m_root);
                _headerChecksum = m_io.ReadBytes(OverallChecksumType.LenChecksum);
            }
            private bool f_isDetachedHeader;
            private bool _isDetachedHeader;

            /// <summary>
            /// Determines whether this file is a zchunk detached header (`.zhr`). If
            /// not, it is a complete zchunk file (`.zck`).
            /// </summary>
            public bool IsDetachedHeader
            {
                get
                {
                    if (f_isDetachedHeader)
                        return _isDetachedHeader;
                    f_isDetachedHeader = true;
                    _isDetachedHeader = (bool) (Magic[2] == 72);
                    return _isDetachedHeader;
                }
            }
            private byte[] _magic;
            private ChecksumType _overallChecksumType;
            private CompressedInteger _lenHeaderRest;
            private byte[] _headerChecksum;
            private Zchunk m_root;
            private Zchunk m_parent;

            /// <summary>
            /// There are two valid magic numbers for zchunk files:
            /// 
            /// * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
            /// * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
            /// </summary>
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Type of the checksum used for `header_checksum` and
            /// `_root.header_rest.preface.data_checksum`.
            /// </summary>
            public ChecksumType OverallChecksumType { get { return _overallChecksumType; } }

            /// <summary>
            /// Size of the header, not including the lead
            /// </summary>
            public CompressedInteger LenHeaderRest { get { return _lenHeaderRest; } }

            /// <summary>
            /// Checksum of the entire header, which consists of `_root.lead` and
            /// `_root.header_rest` (i.e. everything from the beginning of the file to
            /// the end of `_root.header_rest`), not including the `header_checksum`
            /// field itself (i.e. the input for the checksum algorithm is a
            /// concatenation of the bytes preceding the `header_checksum` field with
            /// the bytes following it).
            /// 
            /// For detached headers, the checksum is calculated as if the `magic`
            /// field were set to `'\0ZCK1'`, so that it matches the checksum in the
            /// full zchunk file.
            /// </summary>
            public byte[] HeaderChecksum { get { return _headerChecksum; } }
            public Zchunk M_Root { get { return m_root; } }
            public Zchunk M_Parent { get { return m_parent; } }
        }
        public partial class HeaderWithoutLead : KaitaiStruct
        {
            public static HeaderWithoutLead FromFile(string fileName)
            {
                return new HeaderWithoutLead(new KaitaiStream(fileName));
            }

            public HeaderWithoutLead(KaitaiStream p__io, Zchunk p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _preface = new Preface(m_io, this, m_root);
                _lenIndex = new CompressedInteger(m_io, this, m_root);
                __raw_index = m_io.ReadBytes(LenIndex.Value);
                var io___raw_index = new KaitaiStream(__raw_index);
                _index = new Index(io___raw_index, this, m_root);
                _numSignatures = new CompressedInteger(m_io, this, m_root);
                {
                    CompressedInteger M_ = _numSignatures;
                    if (!(M_.Value == 0))
                    {
                        throw new ValidationExprError(_numSignatures, m_io, "/types/header_without_lead/seq/3");
                    }
                }
            }
            private Preface _preface;
            private CompressedInteger _lenIndex;
            private Index _index;
            private CompressedInteger _numSignatures;
            private Zchunk m_root;
            private Zchunk m_parent;
            private byte[] __raw_index;
            public Preface Preface { get { return _preface; } }
            public CompressedInteger LenIndex { get { return _lenIndex; } }
            public Index Index { get { return _index; } }

            /// <summary>
            /// Must be 0. The reference implementation also rejects any file with a
            /// non-zero &quot;Signature count&quot;, throwing a fatal error stating &quot;Signatures
            /// aren't supported yet&quot; - see
            /// [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
            /// 
            /// Although the structure of signatures is defined [in the official
            /// textual
            /// specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
            /// no signature types are defined, and as of this writing no publicly
            /// known implementation generates or interprets these signatures.
            /// Therefore, we've decided not to implement them here either.
            /// 
            /// For more details, see
            /// &lt;https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887&gt;.
            /// </summary>
            public CompressedInteger NumSignatures { get { return _numSignatures; } }
            public Zchunk M_Root { get { return m_root; } }
            public Zchunk M_Parent { get { return m_parent; } }
            public byte[] M_RawIndex { get { return __raw_index; } }
        }
        public partial class Index : KaitaiStruct
        {
            public static Index FromFile(string fileName)
            {
                return new Index(new KaitaiStream(fileName));
            }

            public Index(KaitaiStream p__io, Zchunk.HeaderWithoutLead p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numDataChunks = false;
                _read();
            }
            private void _read()
            {
                _chunkChecksumType = new ChecksumType(m_io, this, m_root);
                _numChunks = new CompressedInteger(m_io, this, m_root);
                {
                    CompressedInteger M_ = _numChunks;
                    if (!(M_.Value >= 1))
                    {
                        throw new ValidationExprError(_numChunks, m_io, "/types/index/seq/1");
                    }
                }
                if (M_Parent.Preface.HasDataStreams) {
                    _dictStream = new CompressedInteger(m_io, this, m_root);
                    {
                        CompressedInteger M_ = _dictStream;
                        if (!(M_.Value == 0))
                        {
                            throw new ValidationExprError(_dictStream, m_io, "/types/index/seq/2");
                        }
                    }
                }
                _dictChecksum = m_io.ReadBytes(ChunkChecksumType.LenChecksum);
                if (M_Parent.Preface.HasUncompressedSource) {
                    _uncompressedDictChecksum = m_io.ReadBytes(ChunkChecksumType.LenChecksum);
                }
                _lenDict = new CompressedInteger(m_io, this, m_root);
                _lenUncompressedDict = new CompressedInteger(m_io, this, m_root);
                _chunksMetadata = new List<Chunk>();
                for (var i = 0; i < NumDataChunks; i++)
                {
                    _chunksMetadata.Add(new Chunk(ChunkChecksumType.LenChecksum, M_Parent.Preface.HasDataStreams, M_Parent.Preface.HasUncompressedSource, m_io, this, m_root));
                }
            }
            private bool f_numDataChunks;
            private int _numDataChunks;

            /// <summary>
            /// Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
            /// so it is one greater than this number.
            /// </summary>
            public int NumDataChunks
            {
                get
                {
                    if (f_numDataChunks)
                        return _numDataChunks;
                    f_numDataChunks = true;
                    _numDataChunks = (int) (NumChunks.Value - 1);
                    return _numDataChunks;
                }
            }
            private ChecksumType _chunkChecksumType;
            private CompressedInteger _numChunks;
            private CompressedInteger _dictStream;
            private byte[] _dictChecksum;
            private byte[] _uncompressedDictChecksum;
            private CompressedInteger _lenDict;
            private CompressedInteger _lenUncompressedDict;
            private List<Chunk> _chunksMetadata;
            private Zchunk m_root;
            private Zchunk.HeaderWithoutLead m_parent;

            /// <summary>
            /// Type of the checksum used for `dict_checksum` and for all
            /// `chunks_metadata[...].chunk_checksum` and
            /// `chunks_metadata[...].uncompressed_chunk_checksum`.
            /// </summary>
            public ChecksumType ChunkChecksumType { get { return _chunkChecksumType; } }

            /// <summary>
            /// Number of chunks, **including** the dictionary chunk.
            /// 
            /// Must be at least 1, because the dictionary chunk is always present,
            /// even if it is empty. The reference implementation also fails when the
            /// number of chunks is 0, see
            /// [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
            /// </summary>
            public CompressedInteger NumChunks { get { return _numChunks; } }

            /// <summary>
            /// If present, it must always be 0.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162">Source</a>
            /// </remarks>
            public CompressedInteger DictStream { get { return _dictStream; } }
            public byte[] DictChecksum { get { return _dictChecksum; } }

            /// <summary>
            /// Checksum of the uncompressed dictionary. It has no real use, as the
            /// uncompressed source won't have a dictionary.
            /// </summary>
            public byte[] UncompressedDictChecksum { get { return _uncompressedDictChecksum; } }
            public CompressedInteger LenDict { get { return _lenDict; } }
            public CompressedInteger LenUncompressedDict { get { return _lenUncompressedDict; } }

            /// <summary>
            /// Metadata of the data chunks. The dictionary is chunk 0 and its
            /// metadata is stored in the `*dict*` fields above, so there is one fewer
            /// entry here than indicated by `num_chunks`.
            /// </summary>
            public List<Chunk> ChunksMetadata { get { return _chunksMetadata; } }
            public Zchunk M_Root { get { return m_root; } }
            public Zchunk.HeaderWithoutLead M_Parent { get { return m_parent; } }
        }
        public partial class OptionalElement : KaitaiStruct
        {
            public static OptionalElement FromFile(string fileName)
            {
                return new OptionalElement(new KaitaiStream(fileName));
            }

            public OptionalElement(KaitaiStream p__io, Zchunk.Preface p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _elementId = new CompressedInteger(m_io, this, m_root);
                _lenData = new CompressedInteger(m_io, this, m_root);
                _data = m_io.ReadBytes(LenData.Value);
            }
            private CompressedInteger _elementId;
            private CompressedInteger _lenData;
            private byte[] _data;
            private Zchunk m_root;
            private Zchunk.Preface m_parent;
            public CompressedInteger ElementId { get { return _elementId; } }
            public CompressedInteger LenData { get { return _lenData; } }
            public byte[] Data { get { return _data; } }
            public Zchunk M_Root { get { return m_root; } }
            public Zchunk.Preface M_Parent { get { return m_parent; } }
        }
        public partial class Preface : KaitaiStruct
        {
            public static Preface FromFile(string fileName)
            {
                return new Preface(new KaitaiStream(fileName));
            }

            public Preface(KaitaiStream p__io, Zchunk.HeaderWithoutLead p__parent = null, Zchunk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_compressionType = false;
                f_hasDataStreams = false;
                f_hasOptionalElements = false;
                f_hasUncompressedSource = false;
                _read();
            }
            private void _read()
            {
                _dataChecksum = m_io.ReadBytes(M_Root.Lead.OverallChecksumType.LenChecksum);
                _flags = new CompressedInteger(m_io, this, m_root);
                {
                    CompressedInteger M_ = _flags;
                    if (!(M_.Value <= 7))
                    {
                        throw new ValidationExprError(_flags, m_io, "/types/preface/seq/1");
                    }
                }
                _compressionTypeInt = new CompressedInteger(m_io, this, m_root);
                {
                    CompressedInteger M_ = _compressionTypeInt;
                    if (!( ((M_.Value == ((int) Zchunk.CompressionTypes.None)) || (M_.Value == ((int) Zchunk.CompressionTypes.Zstd))) ))
                    {
                        throw new ValidationExprError(_compressionTypeInt, m_io, "/types/preface/seq/2");
                    }
                }
                if (HasOptionalElements) {
                    _numOptionalElements = new CompressedInteger(m_io, this, m_root);
                    {
                        CompressedInteger M_ = _numOptionalElements;
                        if (!(M_.Value >= 1))
                        {
                            throw new ValidationExprError(_numOptionalElements, m_io, "/types/preface/seq/3");
                        }
                    }
                }
                if (HasOptionalElements) {
                    _optionalElements = new List<OptionalElement>();
                    for (var i = 0; i < NumOptionalElements.Value; i++)
                    {
                        _optionalElements.Add(new OptionalElement(m_io, this, m_root));
                    }
                }
            }
            private bool f_compressionType;
            private CompressionTypes _compressionType;
            public CompressionTypes CompressionType
            {
                get
                {
                    if (f_compressionType)
                        return _compressionType;
                    f_compressionType = true;
                    _compressionType = (CompressionTypes) (((Zchunk.CompressionTypes) CompressionTypeInt.Value));
                    return _compressionType;
                }
            }
            private bool f_hasDataStreams;
            private bool _hasDataStreams;
            public bool HasDataStreams
            {
                get
                {
                    if (f_hasDataStreams)
                        return _hasDataStreams;
                    f_hasDataStreams = true;
                    _hasDataStreams = (bool) ((Flags.Value & 1) != 0);
                    return _hasDataStreams;
                }
            }
            private bool f_hasOptionalElements;
            private bool _hasOptionalElements;
            public bool HasOptionalElements
            {
                get
                {
                    if (f_hasOptionalElements)
                        return _hasOptionalElements;
                    f_hasOptionalElements = true;
                    _hasOptionalElements = (bool) ((Flags.Value & 2) != 0);
                    return _hasOptionalElements;
                }
            }
            private bool f_hasUncompressedSource;
            private bool _hasUncompressedSource;

            /// <summary>
            /// The file may be applied against an uncompressed source. This adds an
            /// uncompressed checksum to every index entry, including the dictionary.
            /// </summary>
            public bool HasUncompressedSource
            {
                get
                {
                    if (f_hasUncompressedSource)
                        return _hasUncompressedSource;
                    f_hasUncompressedSource = true;
                    _hasUncompressedSource = (bool) ((Flags.Value & 4) != 0);
                    return _hasUncompressedSource;
                }
            }
            private byte[] _dataChecksum;
            private CompressedInteger _flags;
            private CompressedInteger _compressionTypeInt;
            private CompressedInteger _numOptionalElements;
            private List<OptionalElement> _optionalElements;
            private Zchunk m_root;
            private Zchunk.HeaderWithoutLead m_parent;

            /// <summary>
            /// Total data checksum. Checksum of everything after the header,
            /// including the compressed dictionary (`_root.dict`) and all compressed
            /// chunks (`_root.chunks`). The type of this checksum is
            /// `_root.lead.overall_checksum_type.value`.
            /// 
            /// If `has_uncompressed_source` is true, this checksum must not be
            /// checked and should not be generated. In that case, the reference
            /// implementation writes it as all zeros - see the sample file
            /// [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
            /// </summary>
            public byte[] DataChecksum { get { return _dataChecksum; } }

            /// <summary>
            /// Compressed integer containing a bitmask of the flags. All unused flags
            /// MUST be set to 0. If a decoder sees a flag set that it doesn't
            /// recognize, it MUST exit with an error.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81">Source</a>
            /// </remarks>
            public CompressedInteger Flags { get { return _flags; } }

            /// <summary>
            /// Raw integer, don't read this field - access `compression_type`
            /// instead.
            /// </summary>
            public CompressedInteger CompressionTypeInt { get { return _compressionTypeInt; } }

            /// <summary>
            /// If present, it must be at least 1. This is because if there are no
            /// optional elements, `has_optional_elements` must be false, and then
            /// neither this field nor `optional_elements` is present.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102">Source</a>
            /// </remarks>
            public CompressedInteger NumOptionalElements { get { return _numOptionalElements; } }
            public List<OptionalElement> OptionalElements { get { return _optionalElements; } }
            public Zchunk M_Root { get { return m_root; } }
            public Zchunk.HeaderWithoutLead M_Parent { get { return m_parent; } }
        }
        private HeaderLead _lead;
        private HeaderWithoutLead _headerRest;
        private byte[] _dict;
        private List<byte[]> _chunks;
        private Zchunk m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_headerRest;
        public HeaderLead Lead { get { return _lead; } }
        public HeaderWithoutLead HeaderRest { get { return _headerRest; } }

        /// <summary>
        /// Custom dictionary used when compressing each chunk. It's compressed itself
        /// without a dictionary.
        /// 
        /// The official zchunk specification calls this section &quot;Compressed Dict&quot;.
        /// It's also called a &quot;dictionary chunk&quot;. `zck_read_header -c` presents it as
        /// &quot;chunk 0&quot; (which is always shown in the chunk table, but can have size 0
        /// if the dictionary is not in use).
        /// </summary>
        public byte[] Dict { get { return _dict; } }

        /// <summary>
        /// Chunks of data, each compressed with the custom dictionary `dict` (if
        /// applicable).
        /// 
        /// They are not included in a detached header (`.zhr`) file. Detached headers
        /// contain the dictionary, but none of the data chunks.
        /// </summary>
        public List<byte[]> Chunks { get { return _chunks; } }
        public Zchunk M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeaderRest { get { return __raw_headerRest; } }
    }
}
