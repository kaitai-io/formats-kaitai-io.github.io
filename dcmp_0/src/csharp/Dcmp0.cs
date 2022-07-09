// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Compressed resource data in `'dcmp' (0)` format,
    /// as stored in compressed resources with header type `8` and decompressor ID `0`.
    /// 
    /// The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
    /// This compression format is used for most compressed resources in System 7.0's files.
    /// This decompressor is also included with and used by some other Apple applications,
    /// such as ResEdit.
    /// 
    /// This compression format supports some basic general-purpose compression schemes,
    /// including backreferences to previous data,
    /// run-length encoding,
    /// and delta encoding.
    /// It also includes some types of compression tailored specifically to Mac OS resources,
    /// including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
    /// and a specialized kind of delta encoding for segment loader jump tables.
    /// 
    /// Almost all parts of this compression format operate on units of 2 or 4 bytes.
    /// As a result,
    /// it is nearly impossible to store data with an odd length in this format.
    /// To work around this limitation,
    /// odd-length resources are padded with an extra byte before compressing them with this format.
    /// This extra byte is ignored after decompression,
    /// as the real (odd) length of the resource is stored in the compressed resource header.
    /// 
    /// The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
    /// with the main difference that it operates mostly on single bytes rather than two-byte units.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py">Source</a>
    /// </remarks>
    public partial class Dcmp0 : KaitaiStruct
    {
        public static Dcmp0 FromFile(string fileName)
        {
            return new Dcmp0(new KaitaiStream(fileName));
        }

        public Dcmp0(KaitaiStream p__io, KaitaiStruct p__parent = null, Dcmp0 p__root = null) : base(p__io)
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
            public Chunk(KaitaiStream p__io, Dcmp0 p__parent = null, Dcmp0 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _tag = m_io.ReadU1();
                switch (( ((Tag >= 0) && (Tag <= 31))  ? TagKind.Literal : ( ((Tag >= 32) && (Tag <= 74))  ? TagKind.Backreference : ( ((Tag >= 75) && (Tag <= 253))  ? TagKind.TableLookup : (Tag == 254 ? TagKind.Extended : (Tag == 255 ? TagKind.End : TagKind.Invalid)))))) {
                case TagKind.Extended: {
                    _body = new ExtendedBody(m_io, this, m_root);
                    break;
                }
                case TagKind.Literal: {
                    _body = new LiteralBody(Tag, m_io, this, m_root);
                    break;
                }
                case TagKind.End: {
                    _body = new EndBody(m_io, this, m_root);
                    break;
                }
                case TagKind.TableLookup: {
                    _body = new TableLookupBody(Tag, m_io, this, m_root);
                    break;
                }
                case TagKind.Backreference: {
                    _body = new BackreferenceBody(Tag, m_io, this, m_root);
                    break;
                }
                }
            }

            /// <summary>
            /// The body of a literal data chunk.
            /// 
            /// The data that this chunk expands to is stored literally in the body (`literal`).
            /// Optionally,
            /// the literal data may also be stored for use by future backreference chunks (`do_store`).
            /// 
            /// The length of the literal data is stored as a number of two-byte units.
            /// This means that the literal data always has an even length in bytes.
            /// </summary>
            public partial class LiteralBody : KaitaiStruct
            {
                public LiteralBody(byte p_tag, KaitaiStream p__io, Dcmp0.Chunk p__parent = null, Dcmp0 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _tag = p_tag;
                    f_doStore = false;
                    f_lenLiteralDiv2 = false;
                    f_lenLiteral = false;
                    f_lenLiteralDiv2InTag = false;
                    f_isLenLiteralDiv2Separate = false;
                    _read();
                }
                private void _read()
                {
                    if (IsLenLiteralDiv2Separate) {
                        _lenLiteralDiv2Separate = m_io.ReadU1();
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
                        _doStore = (bool) ((Tag & 16) != 0);
                        f_doStore = true;
                        return _doStore;
                    }
                }
                private bool f_lenLiteralDiv2;
                private int _lenLiteralDiv2;

                /// <summary>
                /// The length of the literal data,
                /// in two-byte units.
                /// 
                /// In practice,
                /// this value is always greater than zero,
                /// as there is no use in storing a zero-length literal.
                /// </summary>
                public int LenLiteralDiv2
                {
                    get
                    {
                        if (f_lenLiteralDiv2)
                            return _lenLiteralDiv2;
                        _lenLiteralDiv2 = (int) ((IsLenLiteralDiv2Separate ? LenLiteralDiv2Separate : LenLiteralDiv2InTag));
                        f_lenLiteralDiv2 = true;
                        return _lenLiteralDiv2;
                    }
                }
                private bool f_lenLiteral;
                private int _lenLiteral;

                /// <summary>
                /// The length of the literal data,
                /// in bytes.
                /// </summary>
                public int LenLiteral
                {
                    get
                    {
                        if (f_lenLiteral)
                            return _lenLiteral;
                        _lenLiteral = (int) ((LenLiteralDiv2 * 2));
                        f_lenLiteral = true;
                        return _lenLiteral;
                    }
                }
                private bool f_lenLiteralDiv2InTag;
                private int _lenLiteralDiv2InTag;

                /// <summary>
                /// The part of the tag byte that indicates the length of the literal data,
                /// in two-byte units.
                /// If this value is 0,
                /// the length is stored in a separate byte after the tag byte and before the literal data.
                /// </summary>
                public int LenLiteralDiv2InTag
                {
                    get
                    {
                        if (f_lenLiteralDiv2InTag)
                            return _lenLiteralDiv2InTag;
                        _lenLiteralDiv2InTag = (int) ((Tag & 15));
                        f_lenLiteralDiv2InTag = true;
                        return _lenLiteralDiv2InTag;
                    }
                }
                private bool f_isLenLiteralDiv2Separate;
                private bool _isLenLiteralDiv2Separate;

                /// <summary>
                /// Whether the length of the literal is stored separately from the tag.
                /// </summary>
                public bool IsLenLiteralDiv2Separate
                {
                    get
                    {
                        if (f_isLenLiteralDiv2Separate)
                            return _isLenLiteralDiv2Separate;
                        _isLenLiteralDiv2Separate = (bool) (LenLiteralDiv2InTag == 0);
                        f_isLenLiteralDiv2Separate = true;
                        return _isLenLiteralDiv2Separate;
                    }
                }
                private byte? _lenLiteralDiv2Separate;
                private byte[] _literal;
                private byte _tag;
                private Dcmp0 m_root;
                private Dcmp0.Chunk m_parent;

                /// <summary>
                /// The length of the literal data,
                /// in two-byte units.
                /// 
                /// This field is only present if the tag byte's low nibble is zero.
                /// In practice,
                /// this only happens if the length is 0x10 or greater,
                /// because smaller lengths can be encoded into the tag byte.
                /// </summary>
                public byte? LenLiteralDiv2Separate { get { return _lenLiteralDiv2Separate; } }

                /// <summary>
                /// The literal data.
                /// </summary>
                public byte[] Literal { get { return _literal; } }

                /// <summary>
                /// The tag byte preceding this chunk body.
                /// </summary>
                public byte Tag { get { return _tag; } }
                public Dcmp0 M_Root { get { return m_root; } }
                public Dcmp0.Chunk M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The body of a backreference chunk.
            /// 
            /// This chunk expands to the data stored in a preceding literal chunk,
            /// indicated by an index number (`index`).
            /// </summary>
            public partial class BackreferenceBody : KaitaiStruct
            {
                public BackreferenceBody(byte p_tag, KaitaiStream p__io, Dcmp0.Chunk p__parent = null, Dcmp0 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _tag = p_tag;
                    f_isIndexSeparate = false;
                    f_indexInTag = false;
                    f_indexSeparate = false;
                    f_index = false;
                    _read();
                }
                private void _read()
                {
                    if (IsIndexSeparate) {
                        switch (Tag) {
                        case 32: {
                            _indexSeparateMinus = m_io.ReadU1();
                            break;
                        }
                        case 33: {
                            _indexSeparateMinus = m_io.ReadU1();
                            break;
                        }
                        case 34: {
                            _indexSeparateMinus = m_io.ReadU2be();
                            break;
                        }
                        }
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
                        _isIndexSeparate = (bool) ( ((Tag >= 32) && (Tag <= 34)) );
                        f_isIndexSeparate = true;
                        return _isIndexSeparate;
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
                        _indexInTag = (int) ((Tag - 35));
                        f_indexInTag = true;
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
                        if (IsIndexSeparate) {
                            _indexSeparate = (int) (((IndexSeparateMinus + 40) + (Tag == 33 ? 256 : 0)));
                        }
                        f_indexSeparate = true;
                        return _indexSeparate;
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
                        _index = (int) ((IsIndexSeparate ? IndexSeparate : IndexInTag));
                        f_index = true;
                        return _index;
                    }
                }
                private ushort _indexSeparateMinus;
                private byte _tag;
                private Dcmp0 m_root;
                private Dcmp0.Chunk m_parent;

                /// <summary>
                /// The index of the referenced literal chunk,
                /// stored separately from the tag.
                /// The value in this field is stored minus 0x28.
                /// If the tag byte is 0x21,
                /// the value is also stored minus 0x100,
                /// *on top of* the regular offset
                /// (i. e. minus 0x128 in total).
                /// 
                /// In other words,
                /// for tag bytes 0x20 and 0x21,
                /// the index is actually 9 bits large,
                /// with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
                /// 
                /// This field is only present if the tag byte is 0x20 through 0x22.
                /// For higher tag bytes,
                /// the index is encoded in the tag byte.
                /// Values smaller than 0x28 cannot be stored in this field,
                /// they must always be encoded in the tag byte.
                /// </summary>
                public ushort IndexSeparateMinus { get { return _indexSeparateMinus; } }

                /// <summary>
                /// The tag byte preceding this chunk body.
                /// </summary>
                public byte Tag { get { return _tag; } }
                public Dcmp0 M_Root { get { return m_root; } }
                public Dcmp0.Chunk M_Parent { get { return m_parent; } }
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
                public TableLookupBody(byte p_tag, KaitaiStream p__io, Dcmp0.Chunk p__parent = null, Dcmp0 p__root = null) : base(p__io)
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
                /// index 0 stands for tag 0x4b, 1 for 0x4c, etc.
                /// </summary>
                public List<byte[]> LookupTable
                {
                    get
                    {
                        if (f_lookupTable)
                            return _lookupTable;
                        _lookupTable = (List<byte[]>) (new List<byte[]> { new byte[] { 0, 0 }, new byte[] { 78, 186 }, new byte[] { 0, 8 }, new byte[] { 78, 117 }, new byte[] { 0, 12 }, new byte[] { 78, 173 }, new byte[] { 32, 83 }, new byte[] { 47, 11 }, new byte[] { 97, 0 }, new byte[] { 0, 16 }, new byte[] { 112, 0 }, new byte[] { 47, 0 }, new byte[] { 72, 110 }, new byte[] { 32, 80 }, new byte[] { 32, 110 }, new byte[] { 47, 46 }, new byte[] { 255, 252 }, new byte[] { 72, 231 }, new byte[] { 63, 60 }, new byte[] { 0, 4 }, new byte[] { 255, 248 }, new byte[] { 47, 12 }, new byte[] { 32, 6 }, new byte[] { 78, 237 }, new byte[] { 78, 86 }, new byte[] { 32, 104 }, new byte[] { 78, 94 }, new byte[] { 0, 1 }, new byte[] { 88, 143 }, new byte[] { 79, 239 }, new byte[] { 0, 2 }, new byte[] { 0, 24 }, new byte[] { 96, 0 }, new byte[] { 255, 255 }, new byte[] { 80, 143 }, new byte[] { 78, 144 }, new byte[] { 0, 6 }, new byte[] { 38, 110 }, new byte[] { 0, 20 }, new byte[] { 255, 244 }, new byte[] { 76, 238 }, new byte[] { 0, 10 }, new byte[] { 0, 14 }, new byte[] { 65, 238 }, new byte[] { 76, 223 }, new byte[] { 72, 192 }, new byte[] { 255, 240 }, new byte[] { 45, 64 }, new byte[] { 0, 18 }, new byte[] { 48, 46 }, new byte[] { 112, 1 }, new byte[] { 47, 40 }, new byte[] { 32, 84 }, new byte[] { 103, 0 }, new byte[] { 0, 32 }, new byte[] { 0, 28 }, new byte[] { 32, 95 }, new byte[] { 24, 0 }, new byte[] { 38, 111 }, new byte[] { 72, 120 }, new byte[] { 0, 22 }, new byte[] { 65, 250 }, new byte[] { 48, 60 }, new byte[] { 40, 64 }, new byte[] { 114, 0 }, new byte[] { 40, 110 }, new byte[] { 32, 12 }, new byte[] { 102, 0 }, new byte[] { 32, 107 }, new byte[] { 47, 7 }, new byte[] { 85, 143 }, new byte[] { 0, 40 }, new byte[] { 255, 254 }, new byte[] { 255, 236 }, new byte[] { 34, 216 }, new byte[] { 32, 11 }, new byte[] { 0, 15 }, new byte[] { 89, 143 }, new byte[] { 47, 60 }, new byte[] { 255, 0 }, new byte[] { 1, 24 }, new byte[] { 129, 225 }, new byte[] { 74, 0 }, new byte[] { 78, 176 }, new byte[] { 255, 232 }, new byte[] { 72, 199 }, new byte[] { 0, 3 }, new byte[] { 0, 34 }, new byte[] { 0, 7 }, new byte[] { 0, 26 }, new byte[] { 103, 6 }, new byte[] { 103, 8 }, new byte[] { 78, 249 }, new byte[] { 0, 36 }, new byte[] { 32, 120 }, new byte[] { 8, 0 }, new byte[] { 102, 4 }, new byte[] { 0, 42 }, new byte[] { 78, 208 }, new byte[] { 48, 40 }, new byte[] { 38, 95 }, new byte[] { 103, 4 }, new byte[] { 0, 48 }, new byte[] { 67, 238 }, new byte[] { 63, 0 }, new byte[] { 32, 31 }, new byte[] { 0, 30 }, new byte[] { 255, 246 }, new byte[] { 32, 46 }, new byte[] { 66, 167 }, new byte[] { 32, 7 }, new byte[] { 255, 250 }, new byte[] { 96, 2 }, new byte[] { 61, 64 }, new byte[] { 12, 64 }, new byte[] { 102, 6 }, new byte[] { 0, 38 }, new byte[] { 45, 72 }, new byte[] { 47, 1 }, new byte[] { 112, 255 }, new byte[] { 96, 4 }, new byte[] { 24, 128 }, new byte[] { 74, 64 }, new byte[] { 0, 64 }, new byte[] { 0, 44 }, new byte[] { 47, 8 }, new byte[] { 0, 17 }, new byte[] { 255, 228 }, new byte[] { 33, 64 }, new byte[] { 38, 64 }, new byte[] { 255, 242 }, new byte[] { 66, 110 }, new byte[] { 78, 185 }, new byte[] { 61, 124 }, new byte[] { 0, 56 }, new byte[] { 0, 13 }, new byte[] { 96, 6 }, new byte[] { 66, 46 }, new byte[] { 32, 60 }, new byte[] { 103, 12 }, new byte[] { 45, 104 }, new byte[] { 102, 8 }, new byte[] { 74, 46 }, new byte[] { 74, 174 }, new byte[] { 0, 46 }, new byte[] { 72, 64 }, new byte[] { 34, 95 }, new byte[] { 34, 0 }, new byte[] { 103, 10 }, new byte[] { 48, 7 }, new byte[] { 66, 103 }, new byte[] { 0, 50 }, new byte[] { 32, 40 }, new byte[] { 0, 9 }, new byte[] { 72, 122 }, new byte[] { 2, 0 }, new byte[] { 47, 43 }, new byte[] { 0, 5 }, new byte[] { 34, 110 }, new byte[] { 102, 2 }, new byte[] { 229, 128 }, new byte[] { 103, 14 }, new byte[] { 102, 10 }, new byte[] { 0, 80 }, new byte[] { 62, 0 }, new byte[] { 102, 12 }, new byte[] { 46, 0 }, new byte[] { 255, 238 }, new byte[] { 32, 109 }, new byte[] { 32, 64 }, new byte[] { 255, 224 }, new byte[] { 83, 64 }, new byte[] { 96, 8 }, new byte[] { 4, 128 }, new byte[] { 0, 104 }, new byte[] { 11, 124 }, new byte[] { 68, 0 }, new byte[] { 65, 232 }, new byte[] { 72, 65 } });
                        f_lookupTable = true;
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
                        _value = (byte[]) (LookupTable[(Tag - 75)]);
                        f_value = true;
                        return _value;
                    }
                }
                private byte _tag;
                private Dcmp0 m_root;
                private Dcmp0.Chunk m_parent;

                /// <summary>
                /// The tag byte preceding this chunk body.
                /// </summary>
                public byte Tag { get { return _tag; } }
                public Dcmp0 M_Root { get { return m_root; } }
                public Dcmp0.Chunk M_Parent { get { return m_parent; } }
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

                public EndBody(KaitaiStream p__io, Dcmp0.Chunk p__parent = null, Dcmp0 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                }
                private Dcmp0 m_root;
                private Dcmp0.Chunk m_parent;
                public Dcmp0 M_Root { get { return m_root; } }
                public Dcmp0.Chunk M_Parent { get { return m_parent; } }
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

                public ExtendedBody(KaitaiStream p__io, Dcmp0.Chunk p__parent = null, Dcmp0 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tag = m_io.ReadU1();
                    switch (Tag) {
                    case 0: {
                        _body = new JumpTableBody(m_io, this, m_root);
                        break;
                    }
                    case 4: {
                        _body = new DeltaEncoding16BitBody(m_io, this, m_root);
                        break;
                    }
                    case 6: {
                        _body = new DeltaEncoding32BitBody(m_io, this, m_root);
                        break;
                    }
                    case 3: {
                        _body = new RepeatBody(Tag, m_io, this, m_root);
                        break;
                    }
                    case 2: {
                        _body = new RepeatBody(Tag, m_io, this, m_root);
                        break;
                    }
                    }
                }

                /// <summary>
                /// The body of a jump table chunk.
                /// 
                /// This chunk generates parts of a segment loader jump table,
                /// in the format found in `'CODE' (0)` resources.
                /// It expands to the following data,
                /// with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
                /// 
                /// * `0x3f 0x3c` (push following segment number onto stack)
                /// * The segment number
                /// * `0xa9 0xf0` (`_LoadSeg` trap)
                /// * For each address:
                ///   * The address
                ///   * `0x3f 0x3c` (push following segment number onto stack)
                ///   * The segment number
                ///   * `0xa9 0xf0` (`_LoadSeg` trap)
                /// 
                /// Note that this generates one jump table entry without an address before it,
                /// meaning that this address needs to be generated by the preceding chunk.
                /// All following jump table entries are generated with the addresses encoded in this chunk.
                /// </summary>
                public partial class JumpTableBody : KaitaiStruct
                {
                    public static JumpTableBody FromFile(string fileName)
                    {
                        return new JumpTableBody(new KaitaiStream(fileName));
                    }

                    public JumpTableBody(KaitaiStream p__io, Dcmp0.Chunk.ExtendedBody p__parent = null, Dcmp0 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_segmentNumber = false;
                        f_numAddresses = false;
                        _read();
                    }
                    private void _read()
                    {
                        _segmentNumberRaw = new DcmpVariableLengthInteger(m_io);
                        _numAddressesRaw = new DcmpVariableLengthInteger(m_io);
                        _addressesRaw = new List<DcmpVariableLengthInteger>();
                        for (var i = 0; i < NumAddresses; i++)
                        {
                            _addressesRaw.Add(new DcmpVariableLengthInteger(m_io));
                        }
                    }
                    private bool f_segmentNumber;
                    private int _segmentNumber;

                    /// <summary>
                    /// The segment number for all of the generated jump table entries.
                    /// 
                    /// Although it is stored as a variable-length integer,
                    /// the segment number must be in the range `0x0 &lt;= x &lt;= 0xffff`,
                    /// i. e. an unsigned 16-bit integer.
                    /// </summary>
                    public int SegmentNumber
                    {
                        get
                        {
                            if (f_segmentNumber)
                                return _segmentNumber;
                            _segmentNumber = (int) (SegmentNumberRaw.Value);
                            f_segmentNumber = true;
                            return _segmentNumber;
                        }
                    }
                    private bool f_numAddresses;
                    private int _numAddresses;

                    /// <summary>
                    /// The number of addresses stored in this chunk.
                    /// 
                    /// This number must be greater than 0.
                    /// </summary>
                    public int NumAddresses
                    {
                        get
                        {
                            if (f_numAddresses)
                                return _numAddresses;
                            _numAddresses = (int) (NumAddressesRaw.Value);
                            f_numAddresses = true;
                            return _numAddresses;
                        }
                    }
                    private DcmpVariableLengthInteger _segmentNumberRaw;
                    private DcmpVariableLengthInteger _numAddressesRaw;
                    private List<DcmpVariableLengthInteger> _addressesRaw;
                    private Dcmp0 m_root;
                    private Dcmp0.Chunk.ExtendedBody m_parent;

                    /// <summary>
                    /// Raw variable-length integer representation of `segment_number`.
                    /// </summary>
                    public DcmpVariableLengthInteger SegmentNumberRaw { get { return _segmentNumberRaw; } }

                    /// <summary>
                    /// Raw variable-length integer representation of `num_addresses`.
                    /// </summary>
                    public DcmpVariableLengthInteger NumAddressesRaw { get { return _numAddressesRaw; } }

                    /// <summary>
                    /// The addresses for each generated jump table entry,
                    /// stored as variable-length integers.
                    /// 
                    /// The first address is stored literally and must be in the range `0x0 &lt;= x &lt;= 0xffff`,
                    /// i. e. an unsigned 16-bit integer.
                    /// 
                    /// All following addresses are stored as deltas relative to the previous address.
                    /// Each of these deltas is stored plus 6;
                    /// this value needs to be subtracted before (or after) adding it to the previous address.
                    /// 
                    /// Each delta (after subtracting 6) should be positive,
                    /// and adding it to the previous address should not result in a value larger than `0xffff`,
                    /// i. e. there should be no 16-bit unsigned integer wraparound.
                    /// These conditions are always met in all known jump table chunks,
                    /// so it is not known how the original decompressor behaves otherwise.
                    /// </summary>
                    public List<DcmpVariableLengthInteger> AddressesRaw { get { return _addressesRaw; } }
                    public Dcmp0 M_Root { get { return m_root; } }
                    public Dcmp0.Chunk.ExtendedBody M_Parent { get { return m_parent; } }
                }

                /// <summary>
                /// The body of a repeat chunk.
                /// 
                /// This chunk expands to a 1-byte or 2-byte value repeated a number of times,
                /// i. e. it implements a form of run-length encoding.
                /// </summary>
                public partial class RepeatBody : KaitaiStruct
                {
                    public RepeatBody(byte p_tag, KaitaiStream p__io, Dcmp0.Chunk.ExtendedBody p__parent = null, Dcmp0 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _tag = p_tag;
                        f_byteCount = false;
                        f_toRepeat = false;
                        f_repeatCountM1 = false;
                        f_repeatCount = false;
                        _read();
                    }
                    private void _read()
                    {
                        _toRepeatRaw = new DcmpVariableLengthInteger(m_io);
                        _repeatCountM1Raw = new DcmpVariableLengthInteger(m_io);
                    }
                    private bool f_byteCount;
                    private int _byteCount;

                    /// <summary>
                    /// The length in bytes of the value to be repeated.
                    /// Regardless of the byte count,
                    /// the value to be repeated is stored as a variable-length integer.
                    /// </summary>
                    public int ByteCount
                    {
                        get
                        {
                            if (f_byteCount)
                                return _byteCount;
                            _byteCount = (int) ((Tag == 2 ? 1 : (Tag == 3 ? 2 : -1)));
                            f_byteCount = true;
                            return _byteCount;
                        }
                    }
                    private bool f_toRepeat;
                    private int _toRepeat;

                    /// <summary>
                    /// The value to repeat.
                    /// 
                    /// Although it is stored as a variable-length integer,
                    /// this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
                    /// i. e. either 8 or 16 bits.
                    /// </summary>
                    public int ToRepeat
                    {
                        get
                        {
                            if (f_toRepeat)
                                return _toRepeat;
                            _toRepeat = (int) (ToRepeatRaw.Value);
                            f_toRepeat = true;
                            return _toRepeat;
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
                            _repeatCountM1 = (int) (RepeatCountM1Raw.Value);
                            f_repeatCountM1 = true;
                            return _repeatCountM1;
                        }
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
                            _repeatCount = (int) ((RepeatCountM1 + 1));
                            f_repeatCount = true;
                            return _repeatCount;
                        }
                    }
                    private DcmpVariableLengthInteger _toRepeatRaw;
                    private DcmpVariableLengthInteger _repeatCountM1Raw;
                    private byte _tag;
                    private Dcmp0 m_root;
                    private Dcmp0.Chunk.ExtendedBody m_parent;

                    /// <summary>
                    /// Raw variable-length integer representation of `to_repeat`.
                    /// </summary>
                    public DcmpVariableLengthInteger ToRepeatRaw { get { return _toRepeatRaw; } }

                    /// <summary>
                    /// Raw variable-length integer representation of `repeat_count_m1`.
                    /// </summary>
                    public DcmpVariableLengthInteger RepeatCountM1Raw { get { return _repeatCountM1Raw; } }

                    /// <summary>
                    /// The extended tag byte preceding this chunk body.
                    /// </summary>
                    public byte Tag { get { return _tag; } }
                    public Dcmp0 M_Root { get { return m_root; } }
                    public Dcmp0.Chunk.ExtendedBody M_Parent { get { return m_parent; } }
                }

                /// <summary>
                /// The body of a 16-bit delta encoding chunk.
                /// 
                /// This chunk expands to a sequence of 16-bit big-endian integer values.
                /// The first value is stored literally.
                /// All following values are stored as deltas relative to the previous value.
                /// </summary>
                public partial class DeltaEncoding16BitBody : KaitaiStruct
                {
                    public static DeltaEncoding16BitBody FromFile(string fileName)
                    {
                        return new DeltaEncoding16BitBody(new KaitaiStream(fileName));
                    }

                    public DeltaEncoding16BitBody(KaitaiStream p__io, Dcmp0.Chunk.ExtendedBody p__parent = null, Dcmp0 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_firstValue = false;
                        f_numDeltas = false;
                        _read();
                    }
                    private void _read()
                    {
                        _firstValueRaw = new DcmpVariableLengthInteger(m_io);
                        _numDeltasRaw = new DcmpVariableLengthInteger(m_io);
                        _deltas = new List<sbyte>();
                        for (var i = 0; i < NumDeltas; i++)
                        {
                            _deltas.Add(m_io.ReadS1());
                        }
                    }
                    private bool f_firstValue;
                    private int _firstValue;

                    /// <summary>
                    /// The first value in the sequence.
                    /// 
                    /// Although it is stored as a variable-length integer,
                    /// this value must be in the range `-0x8000 &lt;= x &lt;= 0x7fff`,
                    /// i. e. a signed 16-bit integer.
                    /// </summary>
                    public int FirstValue
                    {
                        get
                        {
                            if (f_firstValue)
                                return _firstValue;
                            _firstValue = (int) (FirstValueRaw.Value);
                            f_firstValue = true;
                            return _firstValue;
                        }
                    }
                    private bool f_numDeltas;
                    private int _numDeltas;

                    /// <summary>
                    /// The number of deltas stored in this chunk.
                    /// 
                    /// This number must not be negative.
                    /// </summary>
                    public int NumDeltas
                    {
                        get
                        {
                            if (f_numDeltas)
                                return _numDeltas;
                            _numDeltas = (int) (NumDeltasRaw.Value);
                            f_numDeltas = true;
                            return _numDeltas;
                        }
                    }
                    private DcmpVariableLengthInteger _firstValueRaw;
                    private DcmpVariableLengthInteger _numDeltasRaw;
                    private List<sbyte> _deltas;
                    private Dcmp0 m_root;
                    private Dcmp0.Chunk.ExtendedBody m_parent;

                    /// <summary>
                    /// Raw variable-length integer representation of `first_value`.
                    /// </summary>
                    public DcmpVariableLengthInteger FirstValueRaw { get { return _firstValueRaw; } }

                    /// <summary>
                    /// Raw variable-length integer representation of `num_deltas`.
                    /// </summary>
                    public DcmpVariableLengthInteger NumDeltasRaw { get { return _numDeltasRaw; } }

                    /// <summary>
                    /// The deltas for each value relative to the previous value.
                    /// 
                    /// Each of these deltas is a signed 8-bit value.
                    /// When adding the delta to the previous value,
                    /// 16-bit integer wraparound is performed if necessary,
                    /// so that the resulting value always fits into a 16-bit signed integer.
                    /// </summary>
                    public List<sbyte> Deltas { get { return _deltas; } }
                    public Dcmp0 M_Root { get { return m_root; } }
                    public Dcmp0.Chunk.ExtendedBody M_Parent { get { return m_parent; } }
                }

                /// <summary>
                /// The body of a 32-bit delta encoding chunk.
                /// 
                /// This chunk expands to a sequence of 32-bit big-endian integer values.
                /// The first value is stored literally.
                /// All following values are stored as deltas relative to the previous value.
                /// </summary>
                public partial class DeltaEncoding32BitBody : KaitaiStruct
                {
                    public static DeltaEncoding32BitBody FromFile(string fileName)
                    {
                        return new DeltaEncoding32BitBody(new KaitaiStream(fileName));
                    }

                    public DeltaEncoding32BitBody(KaitaiStream p__io, Dcmp0.Chunk.ExtendedBody p__parent = null, Dcmp0 p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_firstValue = false;
                        f_numDeltas = false;
                        _read();
                    }
                    private void _read()
                    {
                        _firstValueRaw = new DcmpVariableLengthInteger(m_io);
                        _numDeltasRaw = new DcmpVariableLengthInteger(m_io);
                        _deltasRaw = new List<DcmpVariableLengthInteger>();
                        for (var i = 0; i < NumDeltas; i++)
                        {
                            _deltasRaw.Add(new DcmpVariableLengthInteger(m_io));
                        }
                    }
                    private bool f_firstValue;
                    private int _firstValue;

                    /// <summary>
                    /// The first value in the sequence.
                    /// </summary>
                    public int FirstValue
                    {
                        get
                        {
                            if (f_firstValue)
                                return _firstValue;
                            _firstValue = (int) (FirstValueRaw.Value);
                            f_firstValue = true;
                            return _firstValue;
                        }
                    }
                    private bool f_numDeltas;
                    private int _numDeltas;

                    /// <summary>
                    /// The number of deltas stored in this chunk.
                    /// 
                    /// This number must not be negative.
                    /// </summary>
                    public int NumDeltas
                    {
                        get
                        {
                            if (f_numDeltas)
                                return _numDeltas;
                            _numDeltas = (int) (NumDeltasRaw.Value);
                            f_numDeltas = true;
                            return _numDeltas;
                        }
                    }
                    private DcmpVariableLengthInteger _firstValueRaw;
                    private DcmpVariableLengthInteger _numDeltasRaw;
                    private List<DcmpVariableLengthInteger> _deltasRaw;
                    private Dcmp0 m_root;
                    private Dcmp0.Chunk.ExtendedBody m_parent;

                    /// <summary>
                    /// Raw variable-length integer representation of `first_value`.
                    /// </summary>
                    public DcmpVariableLengthInteger FirstValueRaw { get { return _firstValueRaw; } }

                    /// <summary>
                    /// Raw variable-length integer representation of `num_deltas`.
                    /// </summary>
                    public DcmpVariableLengthInteger NumDeltasRaw { get { return _numDeltasRaw; } }

                    /// <summary>
                    /// The deltas for each value relative to the previous value,
                    /// stored as variable-length integers.
                    /// 
                    /// Each of these deltas is a signed value.
                    /// When adding the delta to the previous value,
                    /// 32-bit integer wraparound is performed if necessary,
                    /// so that the resulting value always fits into a 32-bit signed integer.
                    /// </summary>
                    public List<DcmpVariableLengthInteger> DeltasRaw { get { return _deltasRaw; } }
                    public Dcmp0 M_Root { get { return m_root; } }
                    public Dcmp0.Chunk.ExtendedBody M_Parent { get { return m_parent; } }
                }
                private byte _tag;
                private KaitaiStruct _body;
                private Dcmp0 m_root;
                private Dcmp0.Chunk m_parent;

                /// <summary>
                /// The chunk's extended tag byte.
                /// This controls the structure of the body and the meaning of the chunk.
                /// </summary>
                public byte Tag { get { return _tag; } }

                /// <summary>
                /// The chunk's body.
                /// </summary>
                public KaitaiStruct Body { get { return _body; } }
                public Dcmp0 M_Root { get { return m_root; } }
                public Dcmp0.Chunk M_Parent { get { return m_parent; } }
            }
            private byte _tag;
            private KaitaiStruct _body;
            private Dcmp0 m_root;
            private Dcmp0 m_parent;

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
            public Dcmp0 M_Root { get { return m_root; } }
            public Dcmp0 M_Parent { get { return m_parent; } }
        }
        private List<Chunk> _chunks;
        private Dcmp0 m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// The sequence of chunks that make up the compressed data.
        /// </summary>
        public List<Chunk> Chunks { get { return _chunks; } }
        public Dcmp0 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
