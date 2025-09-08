// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// MCAP is a modular container format and logging library for pub/sub messages with
    /// arbitrary message serialization. It is primarily intended for use in robotics
    /// applications, and works well under various workloads, resource constraints, and
    /// durability requirements.
    /// 
    /// Time values (`log_time`, `publish_time`, `create_time`) are represented in
    /// nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
    /// etc.)
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme">Source</a>
    /// </remarks>
    public partial class Mcap : KaitaiStruct
    {
        public static Mcap FromFile(string fileName)
        {
            return new Mcap(new KaitaiStream(fileName));
        }


        public enum Opcode
        {
            Header = 1,
            Footer = 2,
            Schema = 3,
            Channel = 4,
            Message = 5,
            Chunk = 6,
            MessageIndex = 7,
            ChunkIndex = 8,
            Attachment = 9,
            AttachmentIndex = 10,
            Statistics = 11,
            Metadata = 12,
            MetadataIndex = 13,
            SummaryOffset = 14,
            DataEnd = 15,
        }
        public Mcap(KaitaiStream p__io, KaitaiStruct p__parent = null, Mcap p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_footer = false;
            f_ofsFooter = false;
            _read();
        }
        private void _read()
        {
            _headerMagic = new Magic(m_io, this, m_root);
            _records = new List<Record>();
            {
                var i = 0;
                Record M_;
                do {
                    M_ = new Record(m_io, this, m_root);
                    _records.Add(M_);
                    i++;
                } while (!(M_.Op == Opcode.Footer));
            }
            _footerMagic = new Magic(m_io, this, m_root);
        }
        public partial class Attachment : KaitaiStruct
        {
            public static Attachment FromFile(string fileName)
            {
                return new Attachment(new KaitaiStream(fileName));
            }

            public Attachment(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_crc32Input = false;
                f_crc32InputEnd = false;
                _read();
            }
            private void _read()
            {
                _logTime = m_io.ReadU8le();
                _createTime = m_io.ReadU8le();
                _name = new PrefixedStr(m_io, this, m_root);
                _contentType = new PrefixedStr(m_io, this, m_root);
                _lenData = m_io.ReadU8le();
                _data = m_io.ReadBytes(LenData);
                if (Crc32InputEnd >= 0) {
                    _invokeCrc32InputEnd = m_io.ReadBytes(0);
                }
                _crc32 = m_io.ReadU4le();
            }
            private bool f_crc32Input;
            private byte[] _crc32Input;
            public byte[] Crc32Input
            {
                get
                {
                    if (f_crc32Input)
                        return _crc32Input;
                    f_crc32Input = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _crc32Input = m_io.ReadBytes(Crc32InputEnd);
                    m_io.Seek(_pos);
                    return _crc32Input;
                }
            }
            private bool f_crc32InputEnd;
            private int _crc32InputEnd;
            public int Crc32InputEnd
            {
                get
                {
                    if (f_crc32InputEnd)
                        return _crc32InputEnd;
                    f_crc32InputEnd = true;
                    _crc32InputEnd = (int) (M_Io.Pos);
                    return _crc32InputEnd;
                }
            }
            private ulong _logTime;
            private ulong _createTime;
            private PrefixedStr _name;
            private PrefixedStr _contentType;
            private ulong _lenData;
            private byte[] _data;
            private byte[] _invokeCrc32InputEnd;
            private uint _crc32;
            private Mcap m_root;
            private Mcap.Record m_parent;
            public ulong LogTime { get { return _logTime; } }
            public ulong CreateTime { get { return _createTime; } }
            public PrefixedStr Name { get { return _name; } }
            public PrefixedStr ContentType { get { return _contentType; } }
            public ulong LenData { get { return _lenData; } }
            public byte[] Data { get { return _data; } }
            public byte[] InvokeCrc32InputEnd { get { return _invokeCrc32InputEnd; } }

            /// <summary>
            /// CRC-32 checksum of preceding fields in the record. A value of zero indicates that
            /// CRC validation should not be performed.
            /// </summary>
            public uint Crc32 { get { return _crc32; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class AttachmentIndex : KaitaiStruct
        {
            public static AttachmentIndex FromFile(string fileName)
            {
                return new AttachmentIndex(new KaitaiStream(fileName));
            }

            public AttachmentIndex(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_attachment = false;
                _read();
            }
            private void _read()
            {
                _ofsAttachment = m_io.ReadU8le();
                _lenAttachment = m_io.ReadU8le();
                _logTime = m_io.ReadU8le();
                _createTime = m_io.ReadU8le();
                _dataSize = m_io.ReadU8le();
                _name = new PrefixedStr(m_io, this, m_root);
                _contentType = new PrefixedStr(m_io, this, m_root);
            }
            private bool f_attachment;
            private Record _attachment;
            public Record Attachment
            {
                get
                {
                    if (f_attachment)
                        return _attachment;
                    f_attachment = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsAttachment);
                    __raw_attachment = io.ReadBytes(LenAttachment);
                    var io___raw_attachment = new KaitaiStream(__raw_attachment);
                    _attachment = new Record(io___raw_attachment, this, m_root);
                    io.Seek(_pos);
                    return _attachment;
                }
            }
            private ulong _ofsAttachment;
            private ulong _lenAttachment;
            private ulong _logTime;
            private ulong _createTime;
            private ulong _dataSize;
            private PrefixedStr _name;
            private PrefixedStr _contentType;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_attachment;
            public ulong OfsAttachment { get { return _ofsAttachment; } }
            public ulong LenAttachment { get { return _lenAttachment; } }
            public ulong LogTime { get { return _logTime; } }
            public ulong CreateTime { get { return _createTime; } }
            public ulong DataSize { get { return _dataSize; } }
            public PrefixedStr Name { get { return _name; } }
            public PrefixedStr ContentType { get { return _contentType; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawAttachment { get { return __raw_attachment; } }
        }
        public partial class Channel : KaitaiStruct
        {
            public static Channel FromFile(string fileName)
            {
                return new Channel(new KaitaiStream(fileName));
            }

            public Channel(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2le();
                _schemaId = m_io.ReadU2le();
                _topic = new PrefixedStr(m_io, this, m_root);
                _messageEncoding = new PrefixedStr(m_io, this, m_root);
                _metadata = new MapStrStr(m_io, this, m_root);
            }
            private ushort _id;
            private ushort _schemaId;
            private PrefixedStr _topic;
            private PrefixedStr _messageEncoding;
            private MapStrStr _metadata;
            private Mcap m_root;
            private Mcap.Record m_parent;
            public ushort Id { get { return _id; } }
            public ushort SchemaId { get { return _schemaId; } }
            public PrefixedStr Topic { get { return _topic; } }
            public PrefixedStr MessageEncoding { get { return _messageEncoding; } }
            public MapStrStr Metadata { get { return _metadata; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class Chunk : KaitaiStruct
        {
            public static Chunk FromFile(string fileName)
            {
                return new Chunk(new KaitaiStream(fileName));
            }

            public Chunk(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _messageStartTime = m_io.ReadU8le();
                _messageEndTime = m_io.ReadU8le();
                _uncompressedSize = m_io.ReadU8le();
                _uncompressedCrc32 = m_io.ReadU4le();
                _compression = new PrefixedStr(m_io, this, m_root);
                _lenRecords = m_io.ReadU8le();
                switch (Compression.Str) {
                case "": {
                    __raw_records = m_io.ReadBytes(LenRecords);
                    var io___raw_records = new KaitaiStream(__raw_records);
                    _records = new Records(io___raw_records, this, m_root);
                    break;
                }
                default: {
                    _records = m_io.ReadBytes(LenRecords);
                    break;
                }
                }
            }
            private ulong _messageStartTime;
            private ulong _messageEndTime;
            private ulong _uncompressedSize;
            private uint _uncompressedCrc32;
            private PrefixedStr _compression;
            private ulong _lenRecords;
            private object _records;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_records;
            public ulong MessageStartTime { get { return _messageStartTime; } }
            public ulong MessageEndTime { get { return _messageEndTime; } }
            public ulong UncompressedSize { get { return _uncompressedSize; } }

            /// <summary>
            /// CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
            /// CRC validation should not be performed.
            /// </summary>
            public uint UncompressedCrc32 { get { return _uncompressedCrc32; } }
            public PrefixedStr Compression { get { return _compression; } }
            public ulong LenRecords { get { return _lenRecords; } }
            public object Records { get { return _records; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawRecords { get { return __raw_records; } }
        }
        public partial class ChunkIndex : KaitaiStruct
        {
            public static ChunkIndex FromFile(string fileName)
            {
                return new ChunkIndex(new KaitaiStream(fileName));
            }

            public ChunkIndex(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_chunk = false;
                _read();
            }
            private void _read()
            {
                _messageStartTime = m_io.ReadU8le();
                _messageEndTime = m_io.ReadU8le();
                _ofsChunk = m_io.ReadU8le();
                _lenChunk = m_io.ReadU8le();
                _lenMessageIndexOffsets = m_io.ReadU4le();
                __raw_messageIndexOffsets = m_io.ReadBytes(LenMessageIndexOffsets);
                var io___raw_messageIndexOffsets = new KaitaiStream(__raw_messageIndexOffsets);
                _messageIndexOffsets = new MessageIndexOffsets(io___raw_messageIndexOffsets, this, m_root);
                _messageIndexLength = m_io.ReadU8le();
                _compression = new PrefixedStr(m_io, this, m_root);
                _compressedSize = m_io.ReadU8le();
                _uncompressedSize = m_io.ReadU8le();
            }
            public partial class MessageIndexOffset : KaitaiStruct
            {
                public static MessageIndexOffset FromFile(string fileName)
                {
                    return new MessageIndexOffset(new KaitaiStream(fileName));
                }

                public MessageIndexOffset(KaitaiStream p__io, Mcap.ChunkIndex.MessageIndexOffsets p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _channelId = m_io.ReadU2le();
                    _offset = m_io.ReadU8le();
                }
                private ushort _channelId;
                private ulong _offset;
                private Mcap m_root;
                private Mcap.ChunkIndex.MessageIndexOffsets m_parent;
                public ushort ChannelId { get { return _channelId; } }
                public ulong Offset { get { return _offset; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.ChunkIndex.MessageIndexOffsets M_Parent { get { return m_parent; } }
            }
            public partial class MessageIndexOffsets : KaitaiStruct
            {
                public static MessageIndexOffsets FromFile(string fileName)
                {
                    return new MessageIndexOffsets(new KaitaiStream(fileName));
                }

                public MessageIndexOffsets(KaitaiStream p__io, Mcap.ChunkIndex p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _entries = new List<MessageIndexOffset>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new MessageIndexOffset(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<MessageIndexOffset> _entries;
                private Mcap m_root;
                private Mcap.ChunkIndex m_parent;
                public List<MessageIndexOffset> Entries { get { return _entries; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.ChunkIndex M_Parent { get { return m_parent; } }
            }
            private bool f_chunk;
            private Record _chunk;
            public Record Chunk
            {
                get
                {
                    if (f_chunk)
                        return _chunk;
                    f_chunk = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsChunk);
                    __raw_chunk = io.ReadBytes(LenChunk);
                    var io___raw_chunk = new KaitaiStream(__raw_chunk);
                    _chunk = new Record(io___raw_chunk, this, m_root);
                    io.Seek(_pos);
                    return _chunk;
                }
            }
            private ulong _messageStartTime;
            private ulong _messageEndTime;
            private ulong _ofsChunk;
            private ulong _lenChunk;
            private uint _lenMessageIndexOffsets;
            private MessageIndexOffsets _messageIndexOffsets;
            private ulong _messageIndexLength;
            private PrefixedStr _compression;
            private ulong _compressedSize;
            private ulong _uncompressedSize;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_messageIndexOffsets;
            private byte[] __raw_chunk;
            public ulong MessageStartTime { get { return _messageStartTime; } }
            public ulong MessageEndTime { get { return _messageEndTime; } }
            public ulong OfsChunk { get { return _ofsChunk; } }
            public ulong LenChunk { get { return _lenChunk; } }
            public uint LenMessageIndexOffsets { get { return _lenMessageIndexOffsets; } }
            public MessageIndexOffsets MessageIndexOffsets { get { return _messageIndexOffsets; } }
            public ulong MessageIndexLength { get { return _messageIndexLength; } }
            public PrefixedStr Compression { get { return _compression; } }
            public ulong CompressedSize { get { return _compressedSize; } }
            public ulong UncompressedSize { get { return _uncompressedSize; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawMessageIndexOffsets { get { return __raw_messageIndexOffsets; } }
            public byte[] M_RawChunk { get { return __raw_chunk; } }
        }
        public partial class DataEnd : KaitaiStruct
        {
            public static DataEnd FromFile(string fileName)
            {
                return new DataEnd(new KaitaiStream(fileName));
            }

            public DataEnd(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dataSectionCrc32 = m_io.ReadU4le();
            }
            private uint _dataSectionCrc32;
            private Mcap m_root;
            private Mcap.Record m_parent;

            /// <summary>
            /// CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
            /// available.
            /// </summary>
            public uint DataSectionCrc32 { get { return _dataSectionCrc32; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class Footer : KaitaiStruct
        {
            public static Footer FromFile(string fileName)
            {
                return new Footer(new KaitaiStream(fileName));
            }

            public Footer(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_ofsSummaryCrc32Input = false;
                f_summaryCrc32Input = false;
                f_summaryOffsetSection = false;
                f_summarySection = false;
                _read();
            }
            private void _read()
            {
                _ofsSummarySection = m_io.ReadU8le();
                _ofsSummaryOffsetSection = m_io.ReadU8le();
                _summaryCrc32 = m_io.ReadU4le();
            }
            private bool f_ofsSummaryCrc32Input;
            private int _ofsSummaryCrc32Input;
            public int OfsSummaryCrc32Input
            {
                get
                {
                    if (f_ofsSummaryCrc32Input)
                        return _ofsSummaryCrc32Input;
                    f_ofsSummaryCrc32Input = true;
                    _ofsSummaryCrc32Input = (int) ((OfsSummarySection != 0 ? OfsSummarySection : M_Root.OfsFooter));
                    return _ofsSummaryCrc32Input;
                }
            }
            private bool f_summaryCrc32Input;
            private byte[] _summaryCrc32Input;
            public byte[] SummaryCrc32Input
            {
                get
                {
                    if (f_summaryCrc32Input)
                        return _summaryCrc32Input;
                    f_summaryCrc32Input = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsSummaryCrc32Input);
                    _summaryCrc32Input = io.ReadBytes(((M_Root.M_Io.Size - OfsSummaryCrc32Input) - 8) - 4);
                    io.Seek(_pos);
                    return _summaryCrc32Input;
                }
            }
            private bool f_summaryOffsetSection;
            private Records _summaryOffsetSection;
            public Records SummaryOffsetSection
            {
                get
                {
                    if (f_summaryOffsetSection)
                        return _summaryOffsetSection;
                    f_summaryOffsetSection = true;
                    if (OfsSummaryOffsetSection != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsSummaryOffsetSection);
                        __raw_summaryOffsetSection = io.ReadBytes(M_Root.OfsFooter - OfsSummaryOffsetSection);
                        var io___raw_summaryOffsetSection = new KaitaiStream(__raw_summaryOffsetSection);
                        _summaryOffsetSection = new Records(io___raw_summaryOffsetSection, this, m_root);
                        io.Seek(_pos);
                    }
                    return _summaryOffsetSection;
                }
            }
            private bool f_summarySection;
            private Records _summarySection;
            public Records SummarySection
            {
                get
                {
                    if (f_summarySection)
                        return _summarySection;
                    f_summarySection = true;
                    if (OfsSummarySection != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsSummarySection);
                        __raw_summarySection = io.ReadBytes((OfsSummaryOffsetSection != 0 ? OfsSummaryOffsetSection : M_Root.OfsFooter) - OfsSummarySection);
                        var io___raw_summarySection = new KaitaiStream(__raw_summarySection);
                        _summarySection = new Records(io___raw_summarySection, this, m_root);
                        io.Seek(_pos);
                    }
                    return _summarySection;
                }
            }
            private ulong _ofsSummarySection;
            private ulong _ofsSummaryOffsetSection;
            private uint _summaryCrc32;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_summaryOffsetSection;
            private byte[] __raw_summarySection;
            public ulong OfsSummarySection { get { return _ofsSummarySection; } }
            public ulong OfsSummaryOffsetSection { get { return _ofsSummaryOffsetSection; } }

            /// <summary>
            /// A CRC-32 of all bytes from the start of the Summary section up through and
            /// including the end of the previous field (summary_offset_start) in the footer
            /// record. A value of 0 indicates the CRC-32 is not available.
            /// </summary>
            public uint SummaryCrc32 { get { return _summaryCrc32; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawSummaryOffsetSection { get { return __raw_summaryOffsetSection; } }
            public byte[] M_RawSummarySection { get { return __raw_summarySection; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _profile = new PrefixedStr(m_io, this, m_root);
                _library = new PrefixedStr(m_io, this, m_root);
            }
            private PrefixedStr _profile;
            private PrefixedStr _library;
            private Mcap m_root;
            private Mcap.Record m_parent;
            public PrefixedStr Profile { get { return _profile; } }
            public PrefixedStr Library { get { return _library; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class Magic : KaitaiStruct
        {
            public static Magic FromFile(string fileName)
            {
                return new Magic(new KaitaiStream(fileName));
            }

            public Magic(KaitaiStream p__io, Mcap p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(8);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 137, 77, 67, 65, 80, 48, 13, 10 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 137, 77, 67, 65, 80, 48, 13, 10 }, _magic, m_io, "/types/magic/seq/0");
                }
            }
            private byte[] _magic;
            private Mcap m_root;
            private Mcap m_parent;
            public byte[] Magic { get { return _magic; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap M_Parent { get { return m_parent; } }
        }
        public partial class MapStrStr : KaitaiStruct
        {
            public static MapStrStr FromFile(string fileName)
            {
                return new MapStrStr(new KaitaiStream(fileName));
            }

            public MapStrStr(KaitaiStream p__io, KaitaiStruct p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenEntries = m_io.ReadU4le();
                __raw_entries = m_io.ReadBytes(LenEntries);
                var io___raw_entries = new KaitaiStream(__raw_entries);
                _entries = new Entries(io___raw_entries, this, m_root);
            }
            public partial class Entries : KaitaiStruct
            {
                public static Entries FromFile(string fileName)
                {
                    return new Entries(new KaitaiStream(fileName));
                }

                public Entries(KaitaiStream p__io, Mcap.MapStrStr p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _entries = new List<TupleStrStr>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new TupleStrStr(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<TupleStrStr> _entries;
                private Mcap m_root;
                private Mcap.MapStrStr m_parent;
                public List<TupleStrStr> Entries { get { return _entries; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.MapStrStr M_Parent { get { return m_parent; } }
            }
            private uint _lenEntries;
            private Entries _entries;
            private Mcap m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_entries;
            public uint LenEntries { get { return _lenEntries; } }
            public Entries Entries { get { return _entries; } }
            public Mcap M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawEntries { get { return __raw_entries; } }
        }
        public partial class Message : KaitaiStruct
        {
            public static Message FromFile(string fileName)
            {
                return new Message(new KaitaiStream(fileName));
            }

            public Message(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _channelId = m_io.ReadU2le();
                _sequence = m_io.ReadU4le();
                _logTime = m_io.ReadU8le();
                _publishTime = m_io.ReadU8le();
                _data = m_io.ReadBytesFull();
            }
            private ushort _channelId;
            private uint _sequence;
            private ulong _logTime;
            private ulong _publishTime;
            private byte[] _data;
            private Mcap m_root;
            private Mcap.Record m_parent;
            public ushort ChannelId { get { return _channelId; } }
            public uint Sequence { get { return _sequence; } }
            public ulong LogTime { get { return _logTime; } }
            public ulong PublishTime { get { return _publishTime; } }
            public byte[] Data { get { return _data; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class MessageIndex : KaitaiStruct
        {
            public static MessageIndex FromFile(string fileName)
            {
                return new MessageIndex(new KaitaiStream(fileName));
            }

            public MessageIndex(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _channelId = m_io.ReadU2le();
                _lenRecords = m_io.ReadU4le();
                __raw_records = m_io.ReadBytes(LenRecords);
                var io___raw_records = new KaitaiStream(__raw_records);
                _records = new MessageIndexEntries(io___raw_records, this, m_root);
            }
            public partial class MessageIndexEntries : KaitaiStruct
            {
                public static MessageIndexEntries FromFile(string fileName)
                {
                    return new MessageIndexEntries(new KaitaiStream(fileName));
                }

                public MessageIndexEntries(KaitaiStream p__io, Mcap.MessageIndex p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _entries = new List<MessageIndexEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new MessageIndexEntry(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<MessageIndexEntry> _entries;
                private Mcap m_root;
                private Mcap.MessageIndex m_parent;
                public List<MessageIndexEntry> Entries { get { return _entries; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.MessageIndex M_Parent { get { return m_parent; } }
            }
            public partial class MessageIndexEntry : KaitaiStruct
            {
                public static MessageIndexEntry FromFile(string fileName)
                {
                    return new MessageIndexEntry(new KaitaiStream(fileName));
                }

                public MessageIndexEntry(KaitaiStream p__io, Mcap.MessageIndex.MessageIndexEntries p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _logTime = m_io.ReadU8le();
                    _offset = m_io.ReadU8le();
                }
                private ulong _logTime;
                private ulong _offset;
                private Mcap m_root;
                private Mcap.MessageIndex.MessageIndexEntries m_parent;
                public ulong LogTime { get { return _logTime; } }
                public ulong Offset { get { return _offset; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.MessageIndex.MessageIndexEntries M_Parent { get { return m_parent; } }
            }
            private ushort _channelId;
            private uint _lenRecords;
            private MessageIndexEntries _records;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_records;
            public ushort ChannelId { get { return _channelId; } }
            public uint LenRecords { get { return _lenRecords; } }
            public MessageIndexEntries Records { get { return _records; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawRecords { get { return __raw_records; } }
        }
        public partial class Metadata : KaitaiStruct
        {
            public static Metadata FromFile(string fileName)
            {
                return new Metadata(new KaitaiStream(fileName));
            }

            public Metadata(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = new PrefixedStr(m_io, this, m_root);
                _metadata = new MapStrStr(m_io, this, m_root);
            }
            private PrefixedStr _name;
            private MapStrStr _metadata;
            private Mcap m_root;
            private Mcap.Record m_parent;
            public PrefixedStr Name { get { return _name; } }
            public MapStrStr Metadata { get { return _metadata; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class MetadataIndex : KaitaiStruct
        {
            public static MetadataIndex FromFile(string fileName)
            {
                return new MetadataIndex(new KaitaiStream(fileName));
            }

            public MetadataIndex(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_metadata = false;
                _read();
            }
            private void _read()
            {
                _ofsMetadata = m_io.ReadU8le();
                _lenMetadata = m_io.ReadU8le();
                _name = new PrefixedStr(m_io, this, m_root);
            }
            private bool f_metadata;
            private Record _metadata;
            public Record Metadata
            {
                get
                {
                    if (f_metadata)
                        return _metadata;
                    f_metadata = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsMetadata);
                    __raw_metadata = io.ReadBytes(LenMetadata);
                    var io___raw_metadata = new KaitaiStream(__raw_metadata);
                    _metadata = new Record(io___raw_metadata, this, m_root);
                    io.Seek(_pos);
                    return _metadata;
                }
            }
            private ulong _ofsMetadata;
            private ulong _lenMetadata;
            private PrefixedStr _name;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_metadata;
            public ulong OfsMetadata { get { return _ofsMetadata; } }
            public ulong LenMetadata { get { return _lenMetadata; } }
            public PrefixedStr Name { get { return _name; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawMetadata { get { return __raw_metadata; } }
        }
        public partial class PrefixedStr : KaitaiStruct
        {
            public static PrefixedStr FromFile(string fileName)
            {
                return new PrefixedStr(new KaitaiStream(fileName));
            }

            public PrefixedStr(KaitaiStream p__io, KaitaiStruct p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenStr = m_io.ReadU4le();
                _str = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenStr));
            }
            private uint _lenStr;
            private string _str;
            private Mcap m_root;
            private KaitaiStruct m_parent;
            public uint LenStr { get { return _lenStr; } }
            public string Str { get { return _str; } }
            public Mcap M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, KaitaiStruct p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _op = ((Mcap.Opcode) m_io.ReadU1());
                _lenBody = m_io.ReadU8le();
                switch (Op) {
                case Mcap.Opcode.Attachment: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Attachment(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.AttachmentIndex: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new AttachmentIndex(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Channel: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Channel(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Chunk: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Chunk(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.ChunkIndex: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ChunkIndex(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.DataEnd: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DataEnd(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Footer: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Footer(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Header: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Header(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Message: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Message(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.MessageIndex: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new MessageIndex(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Metadata: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Metadata(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.MetadataIndex: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new MetadataIndex(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Schema: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Schema(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.Statistics: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Statistics(io___raw_body, this, m_root);
                    break;
                }
                case Mcap.Opcode.SummaryOffset: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SummaryOffset(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(LenBody);
                    break;
                }
                }
            }
            private Opcode _op;
            private ulong _lenBody;
            private object _body;
            private Mcap m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_body;
            public Opcode Op { get { return _op; } }
            public ulong LenBody { get { return _lenBody; } }
            public object Body { get { return _body; } }
            public Mcap M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class Records : KaitaiStruct
        {
            public static Records FromFile(string fileName)
            {
                return new Records(new KaitaiStream(fileName));
            }

            public Records(KaitaiStream p__io, KaitaiStruct p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _records = new List<Record>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _records.Add(new Record(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Record> _records;
            private Mcap m_root;
            private KaitaiStruct m_parent;
            public List<Record> Records { get { return _records; } }
            public Mcap M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Schema : KaitaiStruct
        {
            public static Schema FromFile(string fileName)
            {
                return new Schema(new KaitaiStream(fileName));
            }

            public Schema(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2le();
                _name = new PrefixedStr(m_io, this, m_root);
                _encoding = new PrefixedStr(m_io, this, m_root);
                _lenData = m_io.ReadU4le();
                _data = m_io.ReadBytes(LenData);
            }
            private ushort _id;
            private PrefixedStr _name;
            private PrefixedStr _encoding;
            private uint _lenData;
            private byte[] _data;
            private Mcap m_root;
            private Mcap.Record m_parent;
            public ushort Id { get { return _id; } }
            public PrefixedStr Name { get { return _name; } }
            public PrefixedStr Encoding { get { return _encoding; } }
            public uint LenData { get { return _lenData; } }
            public byte[] Data { get { return _data; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
        }
        public partial class Statistics : KaitaiStruct
        {
            public static Statistics FromFile(string fileName)
            {
                return new Statistics(new KaitaiStream(fileName));
            }

            public Statistics(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _messageCount = m_io.ReadU8le();
                _schemaCount = m_io.ReadU2le();
                _channelCount = m_io.ReadU4le();
                _attachmentCount = m_io.ReadU4le();
                _metadataCount = m_io.ReadU4le();
                _chunkCount = m_io.ReadU4le();
                _messageStartTime = m_io.ReadU8le();
                _messageEndTime = m_io.ReadU8le();
                _lenChannelMessageCounts = m_io.ReadU4le();
                __raw_channelMessageCounts = m_io.ReadBytes(LenChannelMessageCounts);
                var io___raw_channelMessageCounts = new KaitaiStream(__raw_channelMessageCounts);
                _channelMessageCounts = new ChannelMessageCounts(io___raw_channelMessageCounts, this, m_root);
            }
            public partial class ChannelMessageCount : KaitaiStruct
            {
                public static ChannelMessageCount FromFile(string fileName)
                {
                    return new ChannelMessageCount(new KaitaiStream(fileName));
                }

                public ChannelMessageCount(KaitaiStream p__io, Mcap.Statistics.ChannelMessageCounts p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _channelId = m_io.ReadU2le();
                    _messageCount = m_io.ReadU8le();
                }
                private ushort _channelId;
                private ulong _messageCount;
                private Mcap m_root;
                private Mcap.Statistics.ChannelMessageCounts m_parent;
                public ushort ChannelId { get { return _channelId; } }
                public ulong MessageCount { get { return _messageCount; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.Statistics.ChannelMessageCounts M_Parent { get { return m_parent; } }
            }
            public partial class ChannelMessageCounts : KaitaiStruct
            {
                public static ChannelMessageCounts FromFile(string fileName)
                {
                    return new ChannelMessageCounts(new KaitaiStream(fileName));
                }

                public ChannelMessageCounts(KaitaiStream p__io, Mcap.Statistics p__parent = null, Mcap p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _entries = new List<ChannelMessageCount>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new ChannelMessageCount(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<ChannelMessageCount> _entries;
                private Mcap m_root;
                private Mcap.Statistics m_parent;
                public List<ChannelMessageCount> Entries { get { return _entries; } }
                public Mcap M_Root { get { return m_root; } }
                public Mcap.Statistics M_Parent { get { return m_parent; } }
            }
            private ulong _messageCount;
            private ushort _schemaCount;
            private uint _channelCount;
            private uint _attachmentCount;
            private uint _metadataCount;
            private uint _chunkCount;
            private ulong _messageStartTime;
            private ulong _messageEndTime;
            private uint _lenChannelMessageCounts;
            private ChannelMessageCounts _channelMessageCounts;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_channelMessageCounts;
            public ulong MessageCount { get { return _messageCount; } }
            public ushort SchemaCount { get { return _schemaCount; } }
            public uint ChannelCount { get { return _channelCount; } }
            public uint AttachmentCount { get { return _attachmentCount; } }
            public uint MetadataCount { get { return _metadataCount; } }
            public uint ChunkCount { get { return _chunkCount; } }
            public ulong MessageStartTime { get { return _messageStartTime; } }
            public ulong MessageEndTime { get { return _messageEndTime; } }
            public uint LenChannelMessageCounts { get { return _lenChannelMessageCounts; } }
            public ChannelMessageCounts ChannelMessageCounts { get { return _channelMessageCounts; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawChannelMessageCounts { get { return __raw_channelMessageCounts; } }
        }
        public partial class SummaryOffset : KaitaiStruct
        {
            public static SummaryOffset FromFile(string fileName)
            {
                return new SummaryOffset(new KaitaiStream(fileName));
            }

            public SummaryOffset(KaitaiStream p__io, Mcap.Record p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_group = false;
                _read();
            }
            private void _read()
            {
                _groupOpcode = ((Mcap.Opcode) m_io.ReadU1());
                _ofsGroup = m_io.ReadU8le();
                _lenGroup = m_io.ReadU8le();
            }
            private bool f_group;
            private Records _group;
            public Records Group
            {
                get
                {
                    if (f_group)
                        return _group;
                    f_group = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsGroup);
                    __raw_group = io.ReadBytes(LenGroup);
                    var io___raw_group = new KaitaiStream(__raw_group);
                    _group = new Records(io___raw_group, this, m_root);
                    io.Seek(_pos);
                    return _group;
                }
            }
            private Opcode _groupOpcode;
            private ulong _ofsGroup;
            private ulong _lenGroup;
            private Mcap m_root;
            private Mcap.Record m_parent;
            private byte[] __raw_group;
            public Opcode GroupOpcode { get { return _groupOpcode; } }
            public ulong OfsGroup { get { return _ofsGroup; } }
            public ulong LenGroup { get { return _lenGroup; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawGroup { get { return __raw_group; } }
        }
        public partial class TupleStrStr : KaitaiStruct
        {
            public static TupleStrStr FromFile(string fileName)
            {
                return new TupleStrStr(new KaitaiStream(fileName));
            }

            public TupleStrStr(KaitaiStream p__io, Mcap.MapStrStr.Entries p__parent = null, Mcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _key = new PrefixedStr(m_io, this, m_root);
                _value = new PrefixedStr(m_io, this, m_root);
            }
            private PrefixedStr _key;
            private PrefixedStr _value;
            private Mcap m_root;
            private Mcap.MapStrStr.Entries m_parent;
            public PrefixedStr Key { get { return _key; } }
            public PrefixedStr Value { get { return _value; } }
            public Mcap M_Root { get { return m_root; } }
            public Mcap.MapStrStr.Entries M_Parent { get { return m_parent; } }
        }
        private bool f_footer;
        private Record _footer;
        public Record Footer
        {
            get
            {
                if (f_footer)
                    return _footer;
                f_footer = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsFooter);
                __raw_footer = m_io.ReadBytesFull();
                var io___raw_footer = new KaitaiStream(__raw_footer);
                _footer = new Record(io___raw_footer, this, m_root);
                m_io.Seek(_pos);
                return _footer;
            }
        }
        private bool f_ofsFooter;
        private int _ofsFooter;
        public int OfsFooter
        {
            get
            {
                if (f_ofsFooter)
                    return _ofsFooter;
                f_ofsFooter = true;
                _ofsFooter = (int) ((((M_Io.Size - 1) - 8) - 20) - 8);
                return _ofsFooter;
            }
        }
        private Magic _headerMagic;
        private List<Record> _records;
        private Magic _footerMagic;
        private Mcap m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_footer;
        public Magic HeaderMagic { get { return _headerMagic; } }
        public List<Record> Records { get { return _records; } }
        public Magic FooterMagic { get { return _footerMagic; } }
        public Mcap M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFooter { get { return __raw_footer; } }
    }
}
