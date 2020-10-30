// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// LHA (LHarc, LZH) is a file format used by a popular freeware
    /// eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
    /// years, many ports and implementations were developed, sporting many
    /// extensions to original 1988 LZH.
    /// 
    /// File format is pretty simple and essentially consists of a stream of
    /// records.
    /// </summary>
    public partial class Lzh : KaitaiStruct
    {
        public static Lzh FromFile(string fileName)
        {
            return new Lzh(new KaitaiStream(fileName));
        }

        public Lzh(KaitaiStream p__io, KaitaiStruct p__parent = null, Lzh p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _entries = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _entries.Add(new Record(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, Lzh p__parent = null, Lzh p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _headerLen = m_io.ReadU1();
                if (HeaderLen > 0) {
                    _fileRecord = new FileRecord(m_io, this, m_root);
                }
            }
            private byte _headerLen;
            private FileRecord _fileRecord;
            private Lzh m_root;
            private Lzh m_parent;
            public byte HeaderLen { get { return _headerLen; } }
            public FileRecord FileRecord { get { return _fileRecord; } }
            public Lzh M_Root { get { return m_root; } }
            public Lzh M_Parent { get { return m_parent; } }
        }
        public partial class FileRecord : KaitaiStruct
        {
            public static FileRecord FromFile(string fileName)
            {
                return new FileRecord(new KaitaiStream(fileName));
            }

            public FileRecord(KaitaiStream p__io, Lzh.Record p__parent = null, Lzh p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __raw_header = m_io.ReadBytes((M_Parent.HeaderLen - 1));
                var io___raw_header = new KaitaiStream(__raw_header);
                _header = new Header(io___raw_header, this, m_root);
                if (Header.Header1.LhaLevel == 0) {
                    _fileUncomprCrc16 = m_io.ReadU2le();
                }
                _body = m_io.ReadBytes(Header.Header1.FileSizeCompr);
            }
            private Header _header;
            private ushort? _fileUncomprCrc16;
            private byte[] _body;
            private Lzh m_root;
            private Lzh.Record m_parent;
            private byte[] __raw_header;
            public Header Header { get { return _header; } }
            public ushort? FileUncomprCrc16 { get { return _fileUncomprCrc16; } }
            public byte[] Body { get { return _body; } }
            public Lzh M_Root { get { return m_root; } }
            public Lzh.Record M_Parent { get { return m_parent; } }
            public byte[] M_RawHeader { get { return __raw_header; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Lzh.FileRecord p__parent = null, Lzh p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header1 = new Header1(m_io, this, m_root);
                if (Header1.LhaLevel == 0) {
                    _filenameLen = m_io.ReadU1();
                }
                if (Header1.LhaLevel == 0) {
                    _filename = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(FilenameLen));
                }
                if (Header1.LhaLevel == 2) {
                    _fileUncomprCrc16 = m_io.ReadU2le();
                }
                if (Header1.LhaLevel == 2) {
                    _os = m_io.ReadU1();
                }
                if (Header1.LhaLevel == 2) {
                    _extHeaderSize = m_io.ReadU2le();
                }
            }
            private Header1 _header1;
            private byte? _filenameLen;
            private string _filename;
            private ushort? _fileUncomprCrc16;
            private byte? _os;
            private ushort? _extHeaderSize;
            private Lzh m_root;
            private Lzh.FileRecord m_parent;

            /// <summary>
            /// Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
            /// </summary>
            public Header1 Header1 { get { return _header1; } }
            public byte? FilenameLen { get { return _filenameLen; } }
            public string Filename { get { return _filename; } }
            public ushort? FileUncomprCrc16 { get { return _fileUncomprCrc16; } }
            public byte? Os { get { return _os; } }
            public ushort? ExtHeaderSize { get { return _extHeaderSize; } }
            public Lzh M_Root { get { return m_root; } }
            public Lzh.FileRecord M_Parent { get { return m_parent; } }
        }
        public partial class Header1 : KaitaiStruct
        {
            public static Header1 FromFile(string fileName)
            {
                return new Header1(new KaitaiStream(fileName));
            }

            public Header1(KaitaiStream p__io, Lzh.Header p__parent = null, Lzh p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _headerChecksum = m_io.ReadU1();
                _methodId = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(5));
                _fileSizeCompr = m_io.ReadU4le();
                _fileSizeUncompr = m_io.ReadU4le();
                __raw_fileTimestamp = m_io.ReadBytes(4);
                var io___raw_fileTimestamp = new KaitaiStream(__raw_fileTimestamp);
                _fileTimestamp = new DosDatetime(io___raw_fileTimestamp);
                _attr = m_io.ReadU1();
                _lhaLevel = m_io.ReadU1();
            }
            private byte _headerChecksum;
            private string _methodId;
            private uint _fileSizeCompr;
            private uint _fileSizeUncompr;
            private DosDatetime _fileTimestamp;
            private byte _attr;
            private byte _lhaLevel;
            private Lzh m_root;
            private Lzh.Header m_parent;
            private byte[] __raw_fileTimestamp;
            public byte HeaderChecksum { get { return _headerChecksum; } }
            public string MethodId { get { return _methodId; } }

            /// <summary>
            /// Compressed file size
            /// </summary>
            public uint FileSizeCompr { get { return _fileSizeCompr; } }

            /// <summary>
            /// Uncompressed file size
            /// </summary>
            public uint FileSizeUncompr { get { return _fileSizeUncompr; } }

            /// <summary>
            /// Original file date/time
            /// </summary>
            public DosDatetime FileTimestamp { get { return _fileTimestamp; } }

            /// <summary>
            /// File or directory attribute
            /// </summary>
            public byte Attr { get { return _attr; } }
            public byte LhaLevel { get { return _lhaLevel; } }
            public Lzh M_Root { get { return m_root; } }
            public Lzh.Header M_Parent { get { return m_parent; } }
            public byte[] M_RawFileTimestamp { get { return __raw_fileTimestamp; } }
        }
        private List<Record> _entries;
        private Lzh m_root;
        private KaitaiStruct m_parent;
        public List<Record> Entries { get { return _entries; } }
        public Lzh M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
