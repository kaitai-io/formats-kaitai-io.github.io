// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Compressed Macintosh resource data,
    /// as stored in resources with the &quot;compressed&quot; attribute.
    /// 
    /// Resource decompression is not documented by Apple.
    /// It is mostly used internally in System 7,
    /// some of Apple's own applications (such as ResEdit),
    /// and also by some third-party applications.
    /// Later versions of Classic Mac OS make less use of resource compression,
    /// but still support it fully for backwards compatibility.
    /// Carbon in Mac OS X no longer supports resource compression in any way.
    /// 
    /// The data of all compressed resources starts with a common header,
    /// followed by the compressed data.
    /// The data is decompressed using code in a `'dcmp'` resource.
    /// Some decompressors used by Apple are included in the System file,
    /// but applications can also include custom decompressors.
    /// The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
    /// along with some parameters for the decompressor.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://www.alysis.us/arctechnology.htm">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress">Source</a>
    /// </remarks>
    public partial class CompressedResource : KaitaiStruct
    {
        public static CompressedResource FromFile(string fileName)
        {
            return new CompressedResource(new KaitaiStream(fileName));
        }

        public CompressedResource(KaitaiStream p__io, KaitaiStruct p__parent = null, CompressedResource p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            _compressedData = m_io.ReadBytesFull();
        }

        /// <summary>
        /// Compressed resource data header,
        /// as stored at the start of all compressed resources.
        /// </summary>
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, CompressedResource p__parent = null, CompressedResource p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_typeSpecificPartRaw = false;
                f_typeSpecificPart = false;
                _read();
            }
            private void _read()
            {
                _commonPart = new CommonPart(m_io, this, m_root);
                __raw_typeSpecificPartRawWithIo = m_io.ReadBytes((CommonPart.LenHeader - 12));
                var io___raw_typeSpecificPartRawWithIo = new KaitaiStream(__raw_typeSpecificPartRawWithIo);
                _typeSpecificPartRawWithIo = new BytesWithIo(io___raw_typeSpecificPartRawWithIo);
            }

            /// <summary>
            /// The common part of a compressed resource data header.
            /// The format of this part is the same for all compressed resources.
            /// </summary>
            public partial class CommonPart : KaitaiStruct
            {
                public static CommonPart FromFile(string fileName)
                {
                    return new CommonPart(new KaitaiStream(fileName));
                }

                public CommonPart(KaitaiStream p__io, CompressedResource.Header p__parent = null, CompressedResource p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _magic = m_io.ReadBytes(4);
                    if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 168, 159, 101, 114 }) == 0)))
                    {
                        throw new ValidationNotEqualError(new byte[] { 168, 159, 101, 114 }, Magic, M_Io, "/types/header/types/common_part/seq/0");
                    }
                    _lenHeader = m_io.ReadU2be();
                    if (!(LenHeader == 18))
                    {
                        throw new ValidationNotEqualError(18, LenHeader, M_Io, "/types/header/types/common_part/seq/1");
                    }
                    _headerType = m_io.ReadU1();
                    _unknown = m_io.ReadU1();
                    if (!(Unknown == 1))
                    {
                        throw new ValidationNotEqualError(1, Unknown, M_Io, "/types/header/types/common_part/seq/3");
                    }
                    _lenDecompressed = m_io.ReadU4be();
                }
                private byte[] _magic;
                private ushort _lenHeader;
                private byte _headerType;
                private byte _unknown;
                private uint _lenDecompressed;
                private CompressedResource m_root;
                private CompressedResource.Header m_parent;

                /// <summary>
                /// The signature of all compressed resource data.
                /// 
                /// When interpreted as MacRoman, this byte sequence decodes to `®üer`.
                /// </summary>
                public byte[] Magic { get { return _magic; } }

                /// <summary>
                /// The byte length of the entire header (common and type-specific parts).
                /// 
                /// The meaning of this field is mostly a guess,
                /// as all known header types result in a total length of `0x12`.
                /// </summary>
                public ushort LenHeader { get { return _lenHeader; } }

                /// <summary>
                /// Type of the header.
                /// This determines the format of the data in the type-specific part of the header.
                /// 
                /// The only known header type values are `8` and `9`.
                /// 
                /// Every known decompressor is only compatible with one of the header types
                /// (but every header type is used by more than one decompressor).
                /// Apple's decompressors with IDs 0 and 1 use header type 8,
                /// and those with IDs 2 and 3 use header type 9.
                /// </summary>
                public byte HeaderType { get { return _headerType; } }

                /// <summary>
                /// The meaning of this field is not known.
                /// It has the value `0x01` in all known compressed resources.
                /// </summary>
                public byte Unknown { get { return _unknown; } }

                /// <summary>
                /// The byte length of the data after decompression.
                /// </summary>
                public uint LenDecompressed { get { return _lenDecompressed; } }
                public CompressedResource M_Root { get { return m_root; } }
                public CompressedResource.Header M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The type-specific part of a compressed resource header with header type `8`.
            /// </summary>
            public partial class TypeSpecificPartType8 : KaitaiStruct
            {
                public static TypeSpecificPartType8 FromFile(string fileName)
                {
                    return new TypeSpecificPartType8(new KaitaiStream(fileName));
                }

                public TypeSpecificPartType8(KaitaiStream p__io, CompressedResource.Header p__parent = null, CompressedResource p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _workingBufferFractionalSize = m_io.ReadU1();
                    _expansionBufferSize = m_io.ReadU1();
                    _decompressorId = m_io.ReadS2be();
                    _reserved = m_io.ReadU2be();
                    if (!(Reserved == 0))
                    {
                        throw new ValidationNotEqualError(0, Reserved, M_Io, "/types/header/types/type_specific_part_type_8/seq/3");
                    }
                }
                private byte _workingBufferFractionalSize;
                private byte _expansionBufferSize;
                private short _decompressorId;
                private ushort _reserved;
                private CompressedResource m_root;
                private CompressedResource.Header m_parent;

                /// <summary>
                /// The ratio of the compressed data size to the uncompressed data size,
                /// times 256.
                /// 
                /// This parameter affects the amount of memory allocated by the Resource Manager during decompression,
                /// but does not have a direct effect on the decompressor
                /// (except that it will misbehave if insufficient memory is provided).
                /// Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
                /// </summary>
                public byte WorkingBufferFractionalSize { get { return _workingBufferFractionalSize; } }

                /// <summary>
                /// The maximum number of bytes that the compressed data might &quot;grow&quot; during decompression.
                /// 
                /// This parameter affects the amount of memory allocated by the Resource Manager during decompression,
                /// but does not have a direct effect on the decompressor
                /// (except that it will misbehave if insufficient memory is provided).
                /// Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
                /// </summary>
                public byte ExpansionBufferSize { get { return _expansionBufferSize; } }

                /// <summary>
                /// The ID of the `'dcmp'` resource that should be used to decompress this resource.
                /// </summary>
                public short DecompressorId { get { return _decompressorId; } }

                /// <summary>
                /// The meaning of this field is not known.
                /// It has the value `0` in all known compressed resources,
                /// so it is most likely reserved.
                /// </summary>
                public ushort Reserved { get { return _reserved; } }
                public CompressedResource M_Root { get { return m_root; } }
                public CompressedResource.Header M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The type-specific part of a compressed resource header with header type `9`.
            /// </summary>
            public partial class TypeSpecificPartType9 : KaitaiStruct
            {
                public static TypeSpecificPartType9 FromFile(string fileName)
                {
                    return new TypeSpecificPartType9(new KaitaiStream(fileName));
                }

                public TypeSpecificPartType9(KaitaiStream p__io, CompressedResource.Header p__parent = null, CompressedResource p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_decompressorSpecificParameters = false;
                    _read();
                }
                private void _read()
                {
                    _decompressorId = m_io.ReadS2be();
                    __raw_decompressorSpecificParametersWithIo = m_io.ReadBytes(4);
                    var io___raw_decompressorSpecificParametersWithIo = new KaitaiStream(__raw_decompressorSpecificParametersWithIo);
                    _decompressorSpecificParametersWithIo = new BytesWithIo(io___raw_decompressorSpecificParametersWithIo);
                }
                private bool f_decompressorSpecificParameters;
                private byte[] _decompressorSpecificParameters;

                /// <summary>
                /// Decompressor-specific parameters.
                /// The exact structure and meaning of this field is different for each decompressor.
                /// 
                /// This field always has the same length,
                /// but decompressors don't always use the entirety of the field,
                /// so depending on the decompressor some parts of this field may be meaningless.
                /// </summary>
                public byte[] DecompressorSpecificParameters
                {
                    get
                    {
                        if (f_decompressorSpecificParameters)
                            return _decompressorSpecificParameters;
                        _decompressorSpecificParameters = (byte[]) (DecompressorSpecificParametersWithIo.Data);
                        f_decompressorSpecificParameters = true;
                        return _decompressorSpecificParameters;
                    }
                }
                private short _decompressorId;
                private BytesWithIo _decompressorSpecificParametersWithIo;
                private CompressedResource m_root;
                private CompressedResource.Header m_parent;
                private byte[] __raw_decompressorSpecificParametersWithIo;

                /// <summary>
                /// The ID of the `'dcmp'` resource that should be used to decompress this resource.
                /// </summary>
                public short DecompressorId { get { return _decompressorId; } }

                /// <summary>
                /// Use `decompressor_specific_parameters` instead,
                /// unless you need access to this field's `_io`.
                /// </summary>
                public BytesWithIo DecompressorSpecificParametersWithIo { get { return _decompressorSpecificParametersWithIo; } }
                public CompressedResource M_Root { get { return m_root; } }
                public CompressedResource.Header M_Parent { get { return m_parent; } }
                public byte[] M_RawDecompressorSpecificParametersWithIo { get { return __raw_decompressorSpecificParametersWithIo; } }
            }
            private bool f_typeSpecificPartRaw;
            private byte[] _typeSpecificPartRaw;

            /// <summary>
            /// The type-specific part of the header,
            /// as a raw byte array.
            /// </summary>
            public byte[] TypeSpecificPartRaw
            {
                get
                {
                    if (f_typeSpecificPartRaw)
                        return _typeSpecificPartRaw;
                    _typeSpecificPartRaw = (byte[]) (TypeSpecificPartRawWithIo.Data);
                    f_typeSpecificPartRaw = true;
                    return _typeSpecificPartRaw;
                }
            }
            private bool f_typeSpecificPart;
            private KaitaiStruct _typeSpecificPart;

            /// <summary>
            /// The type-specific part of the header,
            /// parsed according to the type from the common part.
            /// </summary>
            public KaitaiStruct TypeSpecificPart
            {
                get
                {
                    if (f_typeSpecificPart)
                        return _typeSpecificPart;
                    KaitaiStream io = TypeSpecificPartRawWithIo.M_Io;
                    long _pos = io.Pos;
                    io.Seek(0);
                    switch (CommonPart.HeaderType) {
                    case 8: {
                        _typeSpecificPart = new TypeSpecificPartType8(io, this, m_root);
                        break;
                    }
                    case 9: {
                        _typeSpecificPart = new TypeSpecificPartType9(io, this, m_root);
                        break;
                    }
                    }
                    io.Seek(_pos);
                    f_typeSpecificPart = true;
                    return _typeSpecificPart;
                }
            }
            private CommonPart _commonPart;
            private BytesWithIo _typeSpecificPartRawWithIo;
            private CompressedResource m_root;
            private CompressedResource m_parent;
            private byte[] __raw_typeSpecificPartRawWithIo;

            /// <summary>
            /// The common part of the header.
            /// Among other things,
            /// this part contains the header type,
            /// which determines the format of the data in the type-specific part of the header.
            /// </summary>
            public CommonPart CommonPart { get { return _commonPart; } }

            /// <summary>
            /// Use `type_specific_part_raw` instead,
            /// unless you need access to this field's `_io`.
            /// </summary>
            public BytesWithIo TypeSpecificPartRawWithIo { get { return _typeSpecificPartRawWithIo; } }
            public CompressedResource M_Root { get { return m_root; } }
            public CompressedResource M_Parent { get { return m_parent; } }
            public byte[] M_RawTypeSpecificPartRawWithIo { get { return __raw_typeSpecificPartRawWithIo; } }
        }
        private Header _header;
        private byte[] _compressedData;
        private CompressedResource m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// The header of the compressed data.
        /// </summary>
        public Header Header { get { return _header; } }

        /// <summary>
        /// The compressed resource data.
        /// 
        /// The format of this data is completely dependent on the decompressor and its parameters,
        /// as specified in the header.
        /// For details about the compressed data formats implemented by Apple's decompressors,
        /// see the specs in the resource_compression subdirectory.
        /// </summary>
        public byte[] CompressedData { get { return _compressedData; } }
        public CompressedResource M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
