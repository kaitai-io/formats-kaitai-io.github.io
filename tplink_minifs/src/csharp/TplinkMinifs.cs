// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// MiniFS is a file system found in certain firmware files from TP-Link
    /// (including its Mercusys brand) and Mercury. Such firmware contains an RTOS
    /// kernel, e.g. VxWorks in
    /// [`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
    /// ([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
    /// or TPOS, TP-Link's RTOS, in
    /// [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
    /// ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
    /// 
    /// According to a TP-Link manager quoted in a
    /// [2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
    /// ([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
    /// Mercusys has been sold in China as Mercury since 2001. All Mercury images
    /// examined contain a certificate with `O=tplink` in its issuer and subject.
    /// 
    /// All versions share the same header, and its `version` field determines the
    /// layout of the rest of the image.
    /// 
    /// In version 3, the header is followed by a table of directory paths and file
    /// names, followed by meta information for each file, meta information about
    /// the LZMA compressed blobs including length, offset and uncompressed length,
    /// and then a number of LZMA compressed blobs.
    /// 
    /// The LZMA blobs can contain the concatenated contents of multiple files.
    /// The meta information of a file contains the offsets of its directory path
    /// and file name, the LZMA blob (numbering starts at 0), the offset of the file
    /// in the uncompressed data and the size of the uncompressed file.
    /// 
    /// Some version 3 images have no uncompressed length in the meta information
    /// about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).
    /// 
    /// In version 2, the header is followed by the length of the files area and a
    /// meta information record for each file, each followed directly by the file's
    /// data. Unlike versions 1 and 3, version 2 stores no paths or file names at
    /// all, only the MD5 hash of each file's path.
    /// 
    /// In version 1, the header is followed by a record with the path, the compressed
    /// length and the offset of each file, and then one LZMA blob per file.
    /// 
    /// This Kaitai Struct implementation was written independently of the paper
    /// [Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
    /// It was started in the firmware analysis project
    /// [BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
    /// Next Generation) in
    /// [2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
    /// and submitted to the Kaitai Struct format gallery in
    /// [September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
    /// whereas the paper was published in July 2024.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S4">The paper, section 4 (version 3)</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py">tp_research's `Minifs.py` (version 2)</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py">unblob's MiniFS handler (version 3)</a>
    /// </remarks>
    public partial class TplinkMinifs : KaitaiStruct
    {
        public static TplinkMinifs FromFile(string fileName)
        {
            return new TplinkMinifs(new KaitaiStream(fileName));
        }


        public enum CompressionType
        {
            Lzma = 0,
            Raw = 2,
            Lzma2014 = 4,
        }
        public TplinkMinifs(KaitaiStream p__io, KaitaiStruct p__parent = null, TplinkMinifs p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new MinifsHeader(m_io, this, m_root);
            switch (Header.Version) {
            case 1: {
                _body = new BodyV1(m_io, this, m_root);
                break;
            }
            case 2: {
                _body = new BodyV2(m_io, this, m_root);
                break;
            }
            case 3: {
                _body = new BodyV3(m_io, this, m_root);
                break;
            }
            }
        }

        /// <remarks>
        /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S2.SS2">Source</a>
        /// </remarks>
        public partial class BodyV1 : KaitaiStruct
        {
            public static BodyV1 FromFile(string fileName)
            {
                return new BodyV1(new KaitaiStream(fileName));
            }

            public BodyV1(KaitaiStream p__io, TplinkMinifs p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _inodes = new List<InodeV1>();
                for (var i = 0; i < M_Root.Header.NumFiles; i++)
                {
                    _inodes.Add(new InodeV1(((uint) ((i != 0 ? Inodes[i - 1].OfsEnd : 0))), m_io, this, m_root));
                }
                __raw_blobsArea = m_io.ReadBytes(Inodes[Inodes.Count - 1].OfsEnd);
                var io___raw_blobsArea = new KaitaiStream(__raw_blobsArea);
                _blobsArea = new Dummy(io___raw_blobsArea, this, m_root);
            }
            private List<InodeV1> _inodes;
            private Dummy _blobsArea;
            private TplinkMinifs m_root;
            private TplinkMinifs m_parent;
            private byte[] __raw_blobsArea;
            public List<InodeV1> Inodes { get { return _inodes; } }
            public Dummy BlobsArea { get { return _blobsArea; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs M_Parent { get { return m_parent; } }
            public byte[] M_RawBlobsArea { get { return __raw_blobsArea; } }
        }
        public partial class BodyV2 : KaitaiStruct
        {
            public static BodyV2 FromFile(string fileName)
            {
                return new BodyV2(new KaitaiStream(fileName));
            }

            public BodyV2(KaitaiStream p__io, TplinkMinifs p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenFilesArea = m_io.ReadU4be();
                __raw_filesArea = m_io.ReadBytes(LenFilesArea);
                var io___raw_filesArea = new KaitaiStream(__raw_filesArea);
                _filesArea = new FilesAreaV2(io___raw_filesArea, this, m_root);
            }
            private uint _lenFilesArea;
            private FilesAreaV2 _filesArea;
            private TplinkMinifs m_root;
            private TplinkMinifs m_parent;
            private byte[] __raw_filesArea;
            public uint LenFilesArea { get { return _lenFilesArea; } }
            public FilesAreaV2 FilesArea { get { return _filesArea; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs M_Parent { get { return m_parent; } }
            public byte[] M_RawFilesArea { get { return __raw_filesArea; } }
        }
        public partial class BodyV3 : KaitaiStruct
        {
            public static BodyV3 FromFile(string fileName)
            {
                return new BodyV3(new KaitaiStream(fileName));
            }

            public BodyV3(KaitaiStream p__io, TplinkMinifs p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_has8ByteLzmaMetas = false;
                f_lenFirstBlobUncompressedIf8ByteMetas = false;
                f_lenLzmaMeta = false;
                f_numLzmaBlobs = false;
                f_ofsLzmaMetas = false;
                _read();
            }
            private void _read()
            {
                _lenNameTable = m_io.ReadU4be();
                __raw_nameTable = m_io.ReadBytes(LenNameTable);
                var io___raw_nameTable = new KaitaiStream(__raw_nameTable);
                _nameTable = new NameTable(io___raw_nameTable, this, m_root);
                _inodes = new List<Inode>();
                for (var i = 0; i < M_Root.Header.NumFiles; i++)
                {
                    _inodes.Add(new Inode(((uint) ((i != 0 ? Inodes[i - 1].CurMaxLzmaBlob : 0))), m_io, this, m_root));
                }
                if (OfsLzmaMetas < 0) {
                    __unnamed3 = m_io.ReadBytes(0);
                }
                _lzmaMetas = new List<LzmaMeta>();
                for (var i = 0; i < NumLzmaBlobs; i++)
                {
                    _lzmaMetas.Add(new LzmaMeta(((uint) ((i != 0 ? LzmaMetas[i - 1].OfsEnd : 0))), m_io, this, m_root));
                }
                __raw_lzmaBlobsArea = m_io.ReadBytes(LzmaMetas[LzmaMetas.Count - 1].OfsEnd);
                var io___raw_lzmaBlobsArea = new KaitaiStream(__raw_lzmaBlobsArea);
                _lzmaBlobsArea = new Dummy(io___raw_lzmaBlobsArea, this, m_root);
            }
            private bool f_has8ByteLzmaMetas;
            private bool _has8ByteLzmaMetas;

            /// <summary>
            /// Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
            /// is therefore 8 bytes in size instead of 12.
            /// 
            /// The MiniFS header doesn't say which size is used (both use version 3),
            /// so this Kaitai Struct implementation infers it using a heuristic based
            /// on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
            /// are the uncompressed size, which was unknown (all bits set) for all
            /// blobs in all version 3 images examined. So with 8-byte records,
            /// `len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
            /// 12-byte records, the same 8 bytes aren't the uncompressed size. With 3
            /// or more blobs, they include a whole offset or length in `lzma_metas`,
            /// which would have to be 4 GiB. With 1 or 2 blobs, they include the
            /// first blob's dictionary size, which is 8 MiB in all images examined.
            /// 
            /// An image with 8-byte records and a known uncompressed size would be
            /// rejected, or misparsed if it has a single blob and other data follows it.
            /// 
            /// In the images examined, 8-byte records occur in firmware files with
            /// modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
            /// [`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
            /// ([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
            /// listed on &lt;https://www.mercusys.com/en/download/mw301r/v2/&gt;
            /// ([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).
            /// 
            /// As far as we know, this implementation is the first description of
            /// 8-byte records. The other descriptions and tools found either assume
            /// 12 bytes or don't read `lzma_metas` at all. So there is no reference
            /// to compare it with, and the evidence comes from the images. In all 49
            /// distinct images examined with 8-byte records, the bytes at each
            /// record's offset and length are exactly one complete LZMA stream. Each
            /// such stream decompresses to exactly the length that the files packed
            /// into it need. The file that ends last in it ends exactly where the
            /// decompressed data ends. In addition:
            /// 
            /// * 2614 of the 7230 files in these 49 images have the same path and
            ///   contents as a file in an image with 12-byte records. For example,
            ///   49 files are the same in the image with 8-byte records in
            ///   [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
            ///   ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
            ///   and the image with 12-byte records in
            ///   [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
            ///   ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
            /// * The repository
            ///   [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
            ///   has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
            ///   of the image with 8-byte records in
            ///   [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
            ///   ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
            ///   They match the files parsed by this implementation in all 92 files
            ///   that can be compared. Its
            ///   [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
            ///   finds the blobs by searching for LZMA headers instead of reading
            ///   `lzma_metas`.
            /// </summary>
            public bool Has8ByteLzmaMetas
            {
                get
                {
                    if (f_has8ByteLzmaMetas)
                        return _has8ByteLzmaMetas;
                    f_has8ByteLzmaMetas = true;
                    _has8ByteLzmaMetas = (bool) (LenFirstBlobUncompressedIf8ByteMetas == 18446744073709551615);
                    return _has8ByteLzmaMetas;
                }
            }
            private bool f_lenFirstBlobUncompressedIf8ByteMetas;
            private ulong _lenFirstBlobUncompressedIf8ByteMetas;

            /// <summary>
            /// The uncompressed size in the `.lzma` header of the first blob, if
            /// `lzma_metas` have 8-byte records. It follows the properties byte and the
            /// 4-byte dictionary size.
            /// </summary>
            public ulong LenFirstBlobUncompressedIf8ByteMetas
            {
                get
                {
                    if (f_lenFirstBlobUncompressedIf8ByteMetas)
                        return _lenFirstBlobUncompressedIf8ByteMetas;
                    f_lenFirstBlobUncompressedIf8ByteMetas = true;
                    long _pos = m_io.Pos;
                    m_io.Seek((OfsLzmaMetas + 8 * NumLzmaBlobs) + 5);
                    _lenFirstBlobUncompressedIf8ByteMetas = m_io.ReadU8le();
                    m_io.Seek(_pos);
                    return _lenFirstBlobUncompressedIf8ByteMetas;
                }
            }
            private bool f_lenLzmaMeta;
            private sbyte _lenLzmaMeta;

            /// <summary>
            /// The size of each record in `lzma_metas` (8 or 12 bytes).
            /// </summary>
            public sbyte LenLzmaMeta
            {
                get
                {
                    if (f_lenLzmaMeta)
                        return _lenLzmaMeta;
                    f_lenLzmaMeta = true;
                    _lenLzmaMeta = (sbyte) ((Has8ByteLzmaMetas ? 8 : 12));
                    return _lenLzmaMeta;
                }
            }
            private bool f_numLzmaBlobs;
            private int _numLzmaBlobs;

            /// <summary>
            /// Count starts at 0, so there is one more blob than the highest blob number
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130">Source</a>
            /// </remarks>
            public int NumLzmaBlobs
            {
                get
                {
                    if (f_numLzmaBlobs)
                        return _numLzmaBlobs;
                    f_numLzmaBlobs = true;
                    _numLzmaBlobs = (int) (Inodes[Inodes.Count - 1].CurMaxLzmaBlob + 1);
                    return _numLzmaBlobs;
                }
            }
            private bool f_ofsLzmaMetas;
            private int _ofsLzmaMetas;
            public int OfsLzmaMetas
            {
                get
                {
                    if (f_ofsLzmaMetas)
                        return _ofsLzmaMetas;
                    f_ofsLzmaMetas = true;
                    _ofsLzmaMetas = (int) (M_Io.Pos);
                    return _ofsLzmaMetas;
                }
            }
            private uint _lenNameTable;
            private NameTable _nameTable;
            private List<Inode> _inodes;
            private byte[] __unnamed3;
            private List<LzmaMeta> _lzmaMetas;
            private Dummy _lzmaBlobsArea;
            private TplinkMinifs m_root;
            private TplinkMinifs m_parent;
            private byte[] __raw_nameTable;
            private byte[] __raw_lzmaBlobsArea;
            public uint LenNameTable { get { return _lenNameTable; } }
            public NameTable NameTable { get { return _nameTable; } }
            public List<Inode> Inodes { get { return _inodes; } }
            public byte[] Unnamed_3 { get { return __unnamed3; } }
            public List<LzmaMeta> LzmaMetas { get { return _lzmaMetas; } }
            public Dummy LzmaBlobsArea { get { return _lzmaBlobsArea; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs M_Parent { get { return m_parent; } }
            public byte[] M_RawNameTable { get { return __raw_nameTable; } }
            public byte[] M_RawLzmaBlobsArea { get { return __raw_lzmaBlobsArea; } }
        }
        public partial class Dummy : KaitaiStruct
        {
            public static Dummy FromFile(string fileName)
            {
                return new Dummy(new KaitaiStream(fileName));
            }

            public Dummy(KaitaiStream p__io, KaitaiStruct p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private TplinkMinifs m_root;
            private KaitaiStruct m_parent;
            public TplinkMinifs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52">Source</a>
        /// </remarks>
        public partial class FileV2 : KaitaiStruct
        {
            public static FileV2 FromFile(string fileName)
            {
                return new FileV2(new KaitaiStream(fileName));
            }

            public FileV2(KaitaiStream p__io, TplinkMinifs.FilesAreaV2 p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pathMd5 = m_io.ReadBytes(16);
                _lenData = m_io.ReadU4be();
                _ofsData = m_io.ReadU4be();
                if (!(_ofsData == M_Io.Pos + 8))
                {
                    throw new ValidationNotEqualError(M_Io.Pos + 8, _ofsData, m_io, "/types/file_v2/seq/2");
                }
                _lenDataUncompressed = m_io.ReadU4be();
                _compression = ((TplinkMinifs.CompressionType) m_io.ReadU4be());
                _data = m_io.ReadBytes(LenData);
            }
            private byte[] _pathMd5;
            private uint _lenData;
            private uint _ofsData;
            private uint _lenDataUncompressed;
            private CompressionType _compression;
            private byte[] _data;
            private TplinkMinifs m_root;
            private TplinkMinifs.FilesAreaV2 m_parent;

            /// <summary>
            /// The MD5 hash of the absolute path of the file, e.g. of
            /// `/conf/priv-key.pem`.
            /// 
            /// Version 2 images store only these hashes, not the paths, so a path can
            /// only be found by hashing candidate paths and comparing.
            /// [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
            /// takes the candidates from path-like strings in the files' contents.
            /// </summary>
            public byte[] PathMd5 { get { return _pathMd5; } }
            public uint LenData { get { return _lenData; } }

            /// <summary>
            /// Offset of `data` relative to the start of `&lt;body_v2&gt;.files_area`.
            /// </summary>
            public uint OfsData { get { return _ofsData; } }
            public uint LenDataUncompressed { get { return _lenDataUncompressed; } }
            public CompressionType Compression { get { return _compression; } }

            /// <summary>
            /// With `compression_type::lzma`, an LZMA stream in the `.lzma` format
            /// (also known as LZMA_Alone). Decompress it in the same way as
            /// `&lt;lzma_meta&gt;.blob`.
            /// 
            /// In all images examined, the `.lzma` header specifies the properties
            /// lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
            /// bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
            /// stream, and there is no end-of-payload marker.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs.FilesAreaV2 M_Parent { get { return m_parent; } }
        }
        public partial class FilesAreaV2 : KaitaiStruct
        {
            public static FilesAreaV2 FromFile(string fileName)
            {
                return new FilesAreaV2(new KaitaiStream(fileName));
            }

            public FilesAreaV2(KaitaiStream p__io, TplinkMinifs.BodyV2 p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _files = new List<FileV2>();
                for (var i = 0; i < M_Root.Header.NumFiles; i++)
                {
                    _files.Add(new FileV2(m_io, this, m_root));
                }
            }
            private List<FileV2> _files;
            private TplinkMinifs m_root;
            private TplinkMinifs.BodyV2 m_parent;
            public List<FileV2> Files { get { return _files; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs.BodyV2 M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S4.SS3">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42">Source</a>
        /// </remarks>
        public partial class Inode : KaitaiStruct
        {
            public Inode(uint p_prevMaxLzmaBlob, KaitaiStream p__io, TplinkMinifs.BodyV3 p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _prevMaxLzmaBlob = p_prevMaxLzmaBlob;
                f_curMaxLzmaBlob = false;
                f_directoryPath = false;
                f_fileName = false;
                _read();
            }
            private void _read()
            {
                _ofsDirectoryPath = m_io.ReadU4be();
                _ofsFileName = m_io.ReadU4be();
                _lzmaBlob = m_io.ReadU4be();
                _ofsFile = m_io.ReadU4be();
                _lenFile = m_io.ReadU4be();
            }
            private bool f_curMaxLzmaBlob;
            private int _curMaxLzmaBlob;
            public int CurMaxLzmaBlob
            {
                get
                {
                    if (f_curMaxLzmaBlob)
                        return _curMaxLzmaBlob;
                    f_curMaxLzmaBlob = true;
                    _curMaxLzmaBlob = (int) ((LzmaBlob > PrevMaxLzmaBlob ? LzmaBlob : PrevMaxLzmaBlob));
                    return _curMaxLzmaBlob;
                }
            }
            private bool f_directoryPath;
            private string _directoryPath;
            public string DirectoryPath
            {
                get
                {
                    if (f_directoryPath)
                        return _directoryPath;
                    f_directoryPath = true;
                    KaitaiStream io = M_Parent.NameTable.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsDirectoryPath);
                    _directoryPath = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                    io.Seek(_pos);
                    return _directoryPath;
                }
            }
            private bool f_fileName;
            private string _fileName;
            public string FileName
            {
                get
                {
                    if (f_fileName)
                        return _fileName;
                    f_fileName = true;
                    KaitaiStream io = M_Parent.NameTable.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsFileName);
                    _fileName = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                    io.Seek(_pos);
                    return _fileName;
                }
            }
            private uint _ofsDirectoryPath;
            private uint _ofsFileName;
            private uint _lzmaBlob;
            private uint _ofsFile;
            private uint _lenFile;
            private uint _prevMaxLzmaBlob;
            private TplinkMinifs m_root;
            private TplinkMinifs.BodyV3 m_parent;
            public uint OfsDirectoryPath { get { return _ofsDirectoryPath; } }
            public uint OfsFileName { get { return _ofsFileName; } }
            public uint LzmaBlob { get { return _lzmaBlob; } }
            public uint OfsFile { get { return _ofsFile; } }
            public uint LenFile { get { return _lenFile; } }
            public uint PrevMaxLzmaBlob { get { return _prevMaxLzmaBlob; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs.BodyV3 M_Parent { get { return m_parent; } }
        }
        public partial class InodeV1 : KaitaiStruct
        {
            public InodeV1(uint p_prevOfsEnd, KaitaiStream p__io, TplinkMinifs.BodyV1 p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _prevOfsEnd = p_prevOfsEnd;
                f_blob = false;
                f_ofsEnd = false;
                _read();
            }
            private void _read()
            {
                _path = System.Text.Encoding.GetEncoding("ASCII").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(80), 0, false));
                _lenBlob = m_io.ReadU4be();
                _ofsBlob = m_io.ReadU4be();
                if (!(_ofsBlob == PrevOfsEnd))
                {
                    throw new ValidationNotEqualError(PrevOfsEnd, _ofsBlob, m_io, "/types/inode_v1/seq/2");
                }
            }
            private bool f_blob;
            private byte[] _blob;

            /// <summary>
            /// An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
            /// the contents of the file. Decompress it in the same way as
            /// `&lt;lzma_meta&gt;.blob`.
            /// 
            /// In all images examined, the `.lzma` header specifies the properties
            /// lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
            /// bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
            /// stream, and there is no end-of-payload marker.
            /// </summary>
            public byte[] Blob
            {
                get
                {
                    if (f_blob)
                        return _blob;
                    f_blob = true;
                    KaitaiStream io = M_Parent.BlobsArea.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsBlob);
                    _blob = io.ReadBytes(LenBlob);
                    io.Seek(_pos);
                    return _blob;
                }
            }
            private bool f_ofsEnd;
            private int _ofsEnd;
            public int OfsEnd
            {
                get
                {
                    if (f_ofsEnd)
                        return _ofsEnd;
                    f_ofsEnd = true;
                    _ofsEnd = (int) (OfsBlob + LenBlob);
                    return _ofsEnd;
                }
            }
            private string _path;
            private uint _lenBlob;
            private uint _ofsBlob;
            private uint _prevOfsEnd;
            private TplinkMinifs m_root;
            private TplinkMinifs.BodyV1 m_parent;
            public string Path { get { return _path; } }
            public uint LenBlob { get { return _lenBlob; } }

            /// <summary>
            /// Relative to the start of `&lt;body_v1&gt;.blobs_area`.
            /// </summary>
            public uint OfsBlob { get { return _ofsBlob; } }
            public uint PrevOfsEnd { get { return _prevOfsEnd; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs.BodyV1 M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S4.SS4">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48">Source</a>
        /// </remarks>
        public partial class LzmaMeta : KaitaiStruct
        {
            public LzmaMeta(uint p_prevOfsEnd, KaitaiStream p__io, TplinkMinifs.BodyV3 p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _prevOfsEnd = p_prevOfsEnd;
                f_blob = false;
                f_ofsEnd = false;
                _read();
            }
            private void _read()
            {
                _ofsBlob = m_io.ReadU4be();
                if (!(_ofsBlob == PrevOfsEnd))
                {
                    throw new ValidationNotEqualError(PrevOfsEnd, _ofsBlob, m_io, "/types/lzma_meta/seq/0");
                }
                _lenBlob = m_io.ReadU4be();
                if (!(M_Parent.Has8ByteLzmaMetas)) {
                    _lenBlobUncompressed = m_io.ReadU4be();
                }
            }
            private bool f_blob;
            private byte[] _blob;

            /// <summary>
            /// An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
            /// a 13-byte header followed by the compressed data. Decompress it
            /// with a ready-made LZMA decoder that reads this header, e.g. in
            /// Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
            /// size of the decompressed data is `len_blob_uncompressed`, if present.
            /// 
            /// In all images examined with `header.version` = 3, the `.lzma` header
            /// specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
            /// dictionary, so it starts with the bytes `5D 00 00 80 00`. The
            /// uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
            /// so the stream ends with an end-of-payload marker.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S4.SS5">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187">Source</a>
            /// </remarks>
            public byte[] Blob
            {
                get
                {
                    if (f_blob)
                        return _blob;
                    f_blob = true;
                    KaitaiStream io = M_Parent.LzmaBlobsArea.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsBlob);
                    _blob = io.ReadBytes(LenBlob);
                    io.Seek(_pos);
                    return _blob;
                }
            }
            private bool f_ofsEnd;
            private int _ofsEnd;
            public int OfsEnd
            {
                get
                {
                    if (f_ofsEnd)
                        return _ofsEnd;
                    f_ofsEnd = true;
                    _ofsEnd = (int) (OfsBlob + LenBlob);
                    return _ofsEnd;
                }
            }
            private uint _ofsBlob;
            private uint _lenBlob;
            private uint? _lenBlobUncompressed;
            private uint _prevOfsEnd;
            private TplinkMinifs m_root;
            private TplinkMinifs.BodyV3 m_parent;
            public uint OfsBlob { get { return _ofsBlob; } }
            public uint LenBlob { get { return _lenBlob; } }
            public uint? LenBlobUncompressed { get { return _lenBlobUncompressed; } }
            public uint PrevOfsEnd { get { return _prevOfsEnd; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs.BodyV3 M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S4.SS1">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34">Source</a>
        /// </remarks>
        public partial class MinifsHeader : KaitaiStruct
        {
            public static MinifsHeader FromFile(string fileName)
            {
                return new MinifsHeader(new KaitaiStream(fileName));
            }

            public MinifsHeader(KaitaiStream p__io, TplinkMinifs p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(16);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 77, 73, 78, 73, 70, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, _magic, m_io, "/types/minifs_header/seq/0");
                }
                _version = m_io.ReadU4be();
                if (!( ((_version == 1) || (_version == 2) || (_version == 3)) ))
                {
                    throw new ValidationNotAnyOfError(_version, m_io, "/types/minifs_header/seq/1");
                }
                _numFiles = m_io.ReadU4be();
                _lenLargestFile = m_io.ReadU4be();
            }
            private byte[] _magic;
            private uint _version;
            private uint _numFiles;
            private uint _lenLargestFile;
            private TplinkMinifs m_root;
            private TplinkMinifs m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint Version { get { return _version; } }
            public uint NumFiles { get { return _numFiles; } }

            /// <summary>
            /// The uncompressed size of the largest file. In all images examined with
            /// version 3, the inodes are sorted by size in descending order, so it is
            /// also the size of the first file. In all images examined with versions
            /// 1 and 2, the value is rounded up to a multiple of 4.
            /// </summary>
            public uint LenLargestFile { get { return _lenLargestFile; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Table of null-terminated directory paths and file names, referenced by
        /// `&lt;inode&gt;.ofs_directory_path` and `&lt;inode&gt;.ofs_file_name`. In all images
        /// examined, each non-empty string occurs only once, which saves space in
        /// flash memory, as many files share a directory or a name.
        /// 
        /// In all images examined, the table is padded with null bytes to a multiple
        /// of 4 bytes, so `names` can end with up to 3 empty strings (one for each
        /// padding byte).
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://arxiv.org/html/2407.05064v1#S4.SS2">Source</a>
        /// </remarks>
        public partial class NameTable : KaitaiStruct
        {
            public static NameTable FromFile(string fileName)
            {
                return new NameTable(new KaitaiStream(fileName));
            }

            public NameTable(KaitaiStream p__io, TplinkMinifs.BodyV3 p__parent = null, TplinkMinifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _names = new List<string>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _names.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                        i++;
                    }
                }
            }
            private List<string> _names;
            private TplinkMinifs m_root;
            private TplinkMinifs.BodyV3 m_parent;
            public List<string> Names { get { return _names; } }
            public TplinkMinifs M_Root { get { return m_root; } }
            public TplinkMinifs.BodyV3 M_Parent { get { return m_parent; } }
        }
        private MinifsHeader _header;
        private KaitaiStruct _body;
        private TplinkMinifs m_root;
        private KaitaiStruct m_parent;
        public MinifsHeader Header { get { return _header; } }
        public KaitaiStruct Body { get { return _body; } }
        public TplinkMinifs M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
