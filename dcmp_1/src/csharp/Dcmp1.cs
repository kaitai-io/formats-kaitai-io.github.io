// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Compressed resource data in `'dcmp' (1)` format,
    /// as stored in compressed resources with header type `8` and decompressor ID `1`.
    /// 
    /// The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
    /// This compression format is used for a few compressed resources in System 7.0's files
    /// (such as the Finder Help file).
    /// This decompressor is also included with and used by some other Apple applications,
    /// such as ResEdit.
    /// (Note: ResEdit includes the `'dcmp' (1)` resource,
    /// but none of its resources actually use this decompressor.)
    /// 
    /// This compression format supports some basic general-purpose compression schemes,
    /// including backreferences to previous data and run-length encoding.
    /// It also includes some types of compression tailored specifically to Mac OS resources,
    /// including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
    /// 
    /// The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
    /// with the main difference that it operates mostly on units of 2 or 4 bytes.
    /// This makes the ``dcmp' (0)` format more suitable for word-aligned data,
    /// such as executable code, bitmaps, sounds, etc.
    /// The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
    /// with the latter only being used in resource files that contain mostly unaligned data,
    /// such as text.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp1.py">Source</a>
    /// </remarks>
    public partial class Dcmp1 : KaitaiStruct
    {
        public static Dcmp1 FromFile(string fileName)
        {
            return new Dcmp1(new KaitaiStream(fileName));
        }

        public Dcmp1(KaitaiStream p__io, KaitaiStruct p__parent = null, Dcmp1 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _chunks = new List<Chunk>();
            {
                var i = 0;
                Chunk M_;
                do {
                    M_ = new Chunk(m_io, this, m_root);
                    _chunks.Add(M_);
                    i++;
                } while (!(M_.Tag == 255));
            }
        }

        /// <summary>
        /// A single chunk of compressed data.
        /// Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
        /// except when `tag == 0xff`,
        /// which marks the end of the data and does not correspond to any bytes in the uncompressed data.
        /// 
        /// Most chunks are stateless and always expand to the same data,
        /// regardless of where the chunk appears in the sequence.
        /// However,
        /// some chunks affect the behavior of future chunks,
        /// or expand to different data depending on which chunks came before them.
        /// </summary>
        public partial class Chunk : KaitaiStruct
        {
            public static Chunk FromFile(string fileName)
            {
                return new Chunk(new KaitaiStream(fileName));
            }


            public enum TagKind
            {
                Invalid = -1,
                Literal = 0,
                Backreference = 1,
                TableLookup = 2,
                Extended = 3,
                End = 4,
            }
            public Chunk(KaitaiStream p__io, Dcmp1 p__parent = null, Dcmp1 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _tag = m_io.ReadU1();
                switch (( ((Tag >= 0) && (Tag <= 31))  ? TagKind.Literal : ( ((Tag >= 32) && (Tag <= 207))  ? TagKind.Backreference : ( ((Tag >= 208) && (Tag <= 209))  ? TagKind.Literal : (Tag == 210 ? TagKind.Backreference : ( ((Tag >= 213) && (Tag <= 253))  ? TagKind.TableLookup : (Tag == 254 ? TagKind.Extended : (Tag == 255 ? TagKind.End : TagKind.Invalid)))))))) {
                case TagKind.Backreference: {
                    _body = new BackreferenceBody(Tag, m_io, this, m_root);
                    break;
                }
                case TagKind.End: {
                    _body = new EndBody(m_io, this, m_root);
                    break;
                }
                case TagKind.Extended: {
                    _body = new ExtendedBody(m_io, this, m_root);
                    break;
                }
                case TagKind.Literal: {
                    _body = new LiteralBody(Tag, m_io, this, m_root);
                    break;
                }
                case TagKind.TableLookup: {
                    _body = new TableLookupBody(Tag, m_io, this, m_root);
                    break;
                }
                }
            }

            /// <summary>
            /// The body of a backreference chunk.
            /// 
            /// This chunk expands to the data stored in a preceding literal chunk,
            /// indicated by an index number (`index`).
            /// </summary>
            public partial class BackreferenceBody : KaitaiStruct
            {
                public BackreferenceBody(byte p_tag, KaitaiStream p__io, Dcmp1.Chunk p__parent = null, Dcmp1 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _tag = p_tag;
                    f_index = false;
                    f_indexInTag = false;
                    f_indexSeparate = false;
                    f_isIndexSeparate = false;
                    _read();
                }
                private void _read()
                {
                    if (IsIndexSeparate) {
                        _indexSeparateMinus = m_io.ReadU1();
                    }
                }
                private bool f_index;
                private int _index;

                /// <summary>
                /// The index of the referenced literal chunk.
                /// 
                /// Stored literals are assigned index numbers in the order in which they appear in the compressed data,
                /// starting at 0.
                /// Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
                /// Once an index is assigned to a stored literal,
                /// it is never changed or unassigned for the entire length of the compressed data.
                /// 
                /// As the name indicates,
                /// a backreference can only reference stored literal chunks found *before* the backreference,
                /// not ones that come after it.
                /// </summary>
                public int Index
                {
                    get
                    {
                        if (f_index)
                            return _index;
                        f_index = true;
                        _index = (int) ((IsIndexSeparate ? IndexSeparate : IndexInTag));
                        return _index;
                    }
                }
                private bool f_indexInTag;
                private int _indexInTag;

                /// <summary>
                /// The index of the referenced literal chunk,
                /// as stored in the tag byte.
                /// </summary>
                public int IndexInTag
                {
                    get
                    {
                        if (f_indexInTag)
                            return _indexInTag;
                        f_indexInTag = true;
                        _indexInTag = (int) (Tag - 32);
                        return _indexInTag;
                    }
                }
                private bool f_indexSeparate;
                private int? _indexSeparate;

                /// <summary>
                /// The index of the referenced literal chunk,
                /// as stored separately from the tag byte,
                /// with the implicit offset corrected for.
                /// </summary>
                public int? IndexSeparate
                {
                    get
                    {
                        if (f_indexSeparate)
                            return _indexSeparate;
                        f_indexSeparate = true;
                        if (IsIndexSeparate) {
                            _indexSeparate = (int) (IndexSeparateMinus + 176);
                        }
                        return _indexSeparate;
                    }
                }
                private bool f_isIndexSeparate;
                private bool _isIndexSeparate;

                /// <summary>
                /// Whether the index is stored separately from the tag.
                /// </summary>
                public bool IsIndexSeparate
                {
                    get
                    {
                        if (f_isIndexSeparate)
                            return _isIndexSeparate;
                        f_isIndexSeparate = true;
                        _isIndexSeparate = (bool) (Tag == 210);
                        return _isIndexSeparate;
                    }
                }
                private byte? _indexSeparateMinus;
                private byte _tag;
                private Dcmp1 m_root;
                private Dcmp1.Chunk m_parent;

                /// <summary>
                /// The index of the referenced literal chunk,
                /// stored separately from the tag.
                /// The value in this field is stored minus 0xb0.
                /// 
                /// This field is only present if the tag byte is 0xd2.
                /// For other tag bytes,
                /// the index is encoded in the tag byte.
                /// Values smaller than 0xb0 cannot be stored in this field,
                /// they must always be encoded in the tag byte.
                /// </summary>
                public byte? IndexSeparateMinus { get { return _indexSeparateMinus; } }

                /// <summary>
                /// The tag byte preceding this chunk body.
                /// </summary>
                public byte Tag { get { return _tag; } }
                public Dcmp1 M_Root { get { return m_root; } }
                public Dcmp1.Chunk M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The body of an end chunk.
            /// This body is always empty.
            /// 
            /// The last chunk in the compressed data must always be an end chunk.
            /// An end chunk cannot appear elsewhere in the compressed data.
            /// </summary>
            public partial class EndBody : KaitaiStruct
            {
                public static EndBody FromFile(string fileName)
                {
                    return new EndBody(new KaitaiStream(fileName));
                }

                public EndBody(KaitaiStream p__io, Dcmp1.Chunk p__parent = null, Dcmp1 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                }
                private Dcmp1 m_root;
                private Dcmp1.Chunk m_parent;
                public Dcmp1 M_Root { get { return m_root; } }
                public Dcmp1.Chunk M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The body of an extended chunk.
            /// The meaning of this chunk depends on the extended tag byte stored in the chunk data.
            /// </summary>
            public partial class ExtendedBody : KaitaiStruct
            {
                public static ExtendedBody FromFile(string fileName)
                {
                    return new ExtendedBody(new KaitaiStream(fileName));
                }

                public ExtendedBody(KaitaiStream p__io, Dcmp1.Chunk p__parent = null, Dcmp1 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tag = m_io.ReadU1();
                    switch (Tag) {
                    case 2: {
                        _body = new RepeatBody(m_io, this, m_root);
                        break;
                    }
                    }
                }

                /// <summary>
                /// The body of a repeat chunk.
                /// 
                /// This chunk expands to the same byte repeated a number of times,
                /// i. e. it implements a form of run-length encoding.
                /// </summary>
                public partial class RepeatBody : KaitaiStruct
                {
                    public static RepeatBody FromFile(string fileName)
                    {
                        return new RepeatBody(new KaitaiStream(fileName));
                    }

                    public RepeatBody(KaitaiStream p__io, Dcmp1.Chunk.ExtendedBody p__parent = null, Dcmp1 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_repeatCount = false;
                        f_repeatCountM1 = false;
                        f_toRepeat = false;
                        _read();
                    }
                    private void _read()
                    {
                        _toRepeatRaw = new DcmpVariableLengthInteger(m_io);
                        _repeatCountM1Raw = new DcmpVariableLengthInteger(m_io);
                    }
                    private bool f_repeatCount;
                    private int _repeatCount;

                    /// <summary>
                    /// The number of times to repeat the value.
                    /// 
                    /// This value must be positive.
                    /// </summary>
                    public int RepeatCount
                    {
                        get
                        {
                            if (f_repeatCount)
                                return _repeatCount;
                            f_repeatCount = true;
                            _repeatCount = (int) (RepeatCountM1 + 1);
                            return _repeatCount;
                        }
                    }
                    private bool f_repeatCountM1;
                    private int _repeatCountM1;

                    /// <summary>
                    /// The number of times to repeat the value,
                    /// minus one.
                    /// 
                    /// This value must not be negative.
                    /// </summary>
                    public int RepeatCountM1
                    {
                        get
                        {
                            if (f_repeatCountM1)
                                return _repeatCountM1;
                            f_repeatCountM1 = true;
                            _repeatCountM1 = (int) (RepeatCountM1Raw.Value);
                            return _repeatCountM1;
                        }
                    }
                    private bool f_toRepeat;
                    private int _toRepeat;

                    /// <summary>
                    /// The value to repeat.
                    /// 
                    /// Although it is stored as a variable-length integer,
                    /// this value must fit into an unsigned 8-bit integer.
                    /// </summary>
                    public int ToRepeat
                    {
                        get
                        {
                            if (f_toRepeat)
                                return _toRepeat;
                            f_toRepeat = true;
                            _toRepeat = (int) (ToRepeatRaw.Value);
                            return _toRepeat;
                        }
                    }
                    private DcmpVariableLengthInteger _toRepeatRaw;
                    private DcmpVariableLengthInteger _repeatCountM1Raw;
                    private Dcmp1 m_root;
                    private Dcmp1.Chunk.ExtendedBody m_parent;

                    /// <summary>
                    /// Raw variable-length integer representation of `to_repeat`.
                    /// </summary>
                    public DcmpVariableLengthInteger ToRepeatRaw { get { return _toRepeatRaw; } }

                    /// <summary>
                    /// Raw variable-length integer representation of `repeat_count_m1`.
                    /// </summary>
                    public DcmpVariableLengthInteger RepeatCountM1Raw { get { return _repeatCountM1Raw; } }
                    public Dcmp1 M_Root { get { return m_root; } }
                    public Dcmp1.Chunk.ExtendedBody M_Parent { get { return m_parent; } }
                }
                private byte _tag;
                private RepeatBody _body;
                private Dcmp1 m_root;
                private Dcmp1.Chunk m_parent;

                /// <summary>
                /// The chunk's extended tag byte.
                /// This controls the structure of the body and the meaning of the chunk.
                /// </summary>
                public byte Tag { get { return _tag; } }

                /// <summary>
                /// The chunk's body.
                /// </summary>
                public RepeatBody Body { get { return _body; } }
                public Dcmp1 M_Root { get { return m_root; } }
                public Dcmp1.Chunk M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The body of a literal data chunk.
            /// 
            /// The data that this chunk expands to is stored literally in the body (`literal`).
            /// Optionally,
            /// the literal data may also be stored for use by future backreference chunks (`do_store`).
            /// </summary>
            public partial class LiteralBody : KaitaiStruct
            {
                public LiteralBody(byte p_tag, KaitaiStream p__io, Dcmp1.Chunk p__parent = null, Dcmp1 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _tag = p_tag;
                    f_doStore = false;
                    f_isLenLiteralSeparate = false;
                    f_lenLiteral = false;
                    f_lenLiteralM1InTag = false;
                    _read();
                }
                private void _read()
                {
                    if (IsLenLiteralSeparate) {
                        _lenLiteralSeparate = m_io.ReadU1();
                    }
                    _literal = m_io.ReadBytes(LenLiteral);
                }
                private bool f_doStore;
                private bool _doStore;

                /// <summary>
                /// Whether this literal should be stored for use by future backreference chunks.
                /// 
                /// See the documentation of the `backreference_body` type for details about backreference chunks.
                /// </summary>
                public bool DoStore
                {
                    get
                    {
                        if (f_doStore)
                            return _doStore;
                        f_doStore = true;
                        _doStore = (bool) ((IsLenLiteralSeparate ? Tag == 209 : (Tag & 16) != 0));
                        return _doStore;
                    }
                }
                private bool f_isLenLiteralSeparate;
                private bool _isLenLiteralSeparate;

                /// <summary>
                /// Whether the length of the literal is stored separately from the tag.
                /// </summary>
                public bool IsLenLiteralSeparate
                {
                    get
                    {
                        if (f_isLenLiteralSeparate)
                            return _isLenLiteralSeparate;
                        f_isLenLiteralSeparate = true;
                        _isLenLiteralSeparate = (bool) (Tag >= 208);
                        return _isLenLiteralSeparate;
                    }
                }
                private bool f_lenLiteral;
                private int _lenLiteral;

                /// <summary>
                /// The length of the literal data,
                /// in bytes.
                /// 
                /// In practice,
                /// this value is always greater than zero,
                /// as there is no use in storing a zero-length literal.
                /// </summary>
                public int LenLiteral
                {
                    get
                    {
                        if (f_lenLiteral)
                            return _lenLiteral;
                        f_lenLiteral = true;
                        _lenLiteral = (int) ((IsLenLiteralSeparate ? LenLiteralSeparate : LenLiteralM1InTag + 1));
                        return _lenLiteral;
                    }
                }
                private bool f_lenLiteralM1InTag;
                private int? _lenLiteralM1InTag;

                /// <summary>
                /// The part of the tag byte that indicates the length of the literal data,
                /// in bytes,
                /// minus one.
                /// 
                /// If the tag byte is 0xd0 or 0xd1,
                /// the length is stored in a separate byte after the tag byte and before the literal data.
                /// </summary>
                public int? LenLiteralM1InTag
                {
                    get
                    {
                        if (f_lenLiteralM1InTag)
                            return _lenLiteralM1InTag;
                        f_lenLiteralM1InTag = true;
                        if (!(IsLenLiteralSeparate)) {
                            _lenLiteralM1InTag = (int) (Tag & 15);
                        }
                        return _lenLiteralM1InTag;
                    }
                }
                private byte? _lenLiteralSeparate;
                private byte[] _literal;
                private byte _tag;
                private Dcmp1 m_root;
                private Dcmp1.Chunk m_parent;

                /// <summary>
                /// The length of the literal data,
                /// in bytes.
                /// 
                /// This field is only present if the tag byte is 0xd0 or 0xd1.
                /// In practice,
                /// this only happens if the length is 0x11 or greater,
                /// because smaller lengths can be encoded into the tag byte.
                /// </summary>
                public byte? LenLiteralSeparate { get { return _lenLiteralSeparate; } }

                /// <summary>
                /// The literal data.
                /// </summary>
                public byte[] Literal { get { return _literal; } }

                /// <summary>
                /// The tag byte preceding this chunk body.
                /// </summary>
                public byte Tag { get { return _tag; } }
                public Dcmp1 M_Root { get { return m_root; } }
                public Dcmp1.Chunk M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The body of a table lookup chunk.
            /// This body is always empty.
            /// 
            /// This chunk always expands to two bytes (`value`),
            /// determined from the tag byte using a fixed lookup table (`lookup_table`).
            /// This lookup table is hardcoded in the decompressor and always the same for all compressed data.
            /// </summary>
            public partial class TableLookupBody : KaitaiStruct
            {
                public TableLookupBody(byte p_tag, KaitaiStream p__io, Dcmp1.Chunk p__parent = null, Dcmp1 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _tag = p_tag;
                    f_lookupTable = false;
                    f_value = false;
                    _read();
                }
                private void _read()
                {
                }
                private bool f_lookupTable;
                private List<byte[]> _lookupTable;

                /// <summary>
                /// Fixed lookup table that maps tag byte numbers to two bytes each.
                /// 
                /// The entries in the lookup table are offset -
                /// index 0 stands for tag 0xd5, 1 for 0xd6, etc.
                /// </summary>
                public List<byte[]> LookupTable
                {
                    get
                    {
                        if (f_lookupTable)
                            return _lookupTable;
                        f_lookupTable = true;
                        _lookupTable = (List<byte[]>) (new List<byte[]> { new byte[] { 0, 0 }, new byte[] { 0, 1 }, new byte[] { 0, 2 }, new byte[] { 0, 3 }, new byte[] { 46, 1 }, new byte[] { 62, 1 }, new byte[] { 1, 1 }, new byte[] { 30, 1 }, new byte[] { 255, 255 }, new byte[] { 14, 1 }, new byte[] { 49, 0 }, new byte[] { 17, 18 }, new byte[] { 1, 7 }, new byte[] { 51, 50 }, new byte[] { 18, 57 }, new byte[] { 237, 16 }, new byte[] { 1, 39 }, new byte[] { 35, 34 }, new byte[] { 1, 55 }, new byte[] { 7, 6 }, new byte[] { 1, 23 }, new byte[] { 1, 35 }, new byte[] { 0, 255 }, new byte[] { 0, 47 }, new byte[] { 7, 14 }, new byte[] { 253, 60 }, new byte[] { 1, 53 }, new byte[] { 1, 21 }, new byte[] { 1, 2 }, new byte[] { 0, 7 }, new byte[] { 0, 62 }, new byte[] { 5, 213 }, new byte[] { 2, 1 }, new byte[] { 6, 7 }, new byte[] { 7, 8 }, new byte[] { 48, 1 }, new byte[] { 1, 51 }, new byte[] { 0, 16 }, new byte[] { 23, 22 }, new byte[] { 55, 62 }, new byte[] { 54, 55 } });
                        return _lookupTable;
                    }
                }
                private bool f_value;
                private byte[] _value;

                /// <summary>
                /// The two bytes that the tag byte expands to,
                /// based on the fixed lookup table.
                /// </summary>
                public byte[] Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        _value = (byte[]) (LookupTable[Tag - 213]);
                        return _value;
                    }
                }
                private byte _tag;
                private Dcmp1 m_root;
                private Dcmp1.Chunk m_parent;

                /// <summary>
                /// The tag byte preceding this chunk body.
                /// </summary>
                public byte Tag { get { return _tag; } }
                public Dcmp1 M_Root { get { return m_root; } }
                public Dcmp1.Chunk M_Parent { get { return m_parent; } }
            }
            private byte _tag;
            private KaitaiStruct _body;
            private Dcmp1 m_root;
            private Dcmp1 m_parent;

            /// <summary>
            /// The chunk's tag byte.
            /// This controls the structure of the body and the meaning of the chunk.
            /// </summary>
            public byte Tag { get { return _tag; } }

            /// <summary>
            /// The chunk's body.
            /// 
            /// Certain chunks do not have any data following the tag byte.
            /// In this case,
            /// the body is a zero-length structure.
            /// </summary>
            public KaitaiStruct Body { get { return _body; } }
            public Dcmp1 M_Root { get { return m_root; } }
            public Dcmp1 M_Parent { get { return m_parent; } }
        }
        private List<Chunk> _chunks;
        private Dcmp1 m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// The sequence of chunks that make up the compressed data.
        /// </summary>
        public List<Chunk> Chunks { get { return _chunks; } }
        public Dcmp1 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
