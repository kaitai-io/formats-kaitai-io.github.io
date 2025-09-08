// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// AppleSingle and AppleDouble files are used by certain Mac
    /// applications (e.g. Finder) to store Mac-specific file attributes on
    /// filesystems that do not support that.
    /// 
    /// Syntactically, both formats are the same, the only difference is how
    /// they are being used:
    /// 
    /// * AppleSingle means that only one file will be created on external
    ///   filesystem that will hold both the data (AKA &quot;data fork&quot; in Apple
    ///   terminology), and the attributes (AKA &quot;resource fork&quot;).
    /// * AppleDouble means that two files will be created: a normal file
    ///   that keeps the data (&quot;data fork&quot;) is kept separately from an
    ///   auxiliary file that contains attributes (&quot;resource fork&quot;), which
    ///   is kept with the same name, but starting with an extra dot and
    ///   underscore `._` to keep it hidden.
    /// 
    /// In modern practice (Mac OS X), Finder only uses AppleDouble to keep
    /// compatibility with other OSes, as virtually nobody outside of Mac
    /// understands how to access data in AppleSingle container.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf">Source</a>
    /// </remarks>
    public partial class AppleSingleDouble : KaitaiStruct
    {
        public static AppleSingleDouble FromFile(string fileName)
        {
            return new AppleSingleDouble(new KaitaiStream(fileName));
        }


        public enum FileType
        {
            AppleSingle = 333312,
            AppleDouble = 333319,
        }
        public AppleSingleDouble(KaitaiStream p__io, KaitaiStruct p__parent = null, AppleSingleDouble p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = ((FileType) m_io.ReadU4be());
            _version = m_io.ReadU4be();
            _reserved = m_io.ReadBytes(16);
            _numEntries = m_io.ReadU2be();
            _entries = new List<Entry>();
            for (var i = 0; i < NumEntries; i++)
            {
                _entries.Add(new Entry(m_io, this, m_root));
            }
        }
        public partial class Entry : KaitaiStruct
        {
            public static Entry FromFile(string fileName)
            {
                return new Entry(new KaitaiStream(fileName));
            }


            public enum Types
            {
                DataFork = 1,
                ResourceFork = 2,
                RealName = 3,
                Comment = 4,
                IconBw = 5,
                IconColor = 6,
                FileDatesInfo = 8,
                FinderInfo = 9,
                MacintoshFileInfo = 10,
                ProdosFileInfo = 11,
                MsdosFileInfo = 12,
                AfpShortName = 13,
                AfpFileInfo = 14,
                AfpDirectoryId = 15,
            }
            public Entry(KaitaiStream p__io, AppleSingleDouble p__parent = null, AppleSingleDouble p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _type = ((Types) m_io.ReadU4be());
                _ofsBody = m_io.ReadU4be();
                _lenBody = m_io.ReadU4be();
            }
            private bool f_body;
            private object _body;
            public object Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    f_body = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsBody);
                    switch (Type) {
                    case Types.FinderInfo: {
                        __raw_body = m_io.ReadBytes(LenBody);
                        var io___raw_body = new KaitaiStream(__raw_body);
                        _body = new FinderInfo(io___raw_body, this, m_root);
                        break;
                    }
                    default: {
                        _body = m_io.ReadBytes(LenBody);
                        break;
                    }
                    }
                    m_io.Seek(_pos);
                    return _body;
                }
            }
            private Types _type;
            private uint _ofsBody;
            private uint _lenBody;
            private AppleSingleDouble m_root;
            private AppleSingleDouble m_parent;
            private byte[] __raw_body;
            public Types Type { get { return _type; } }
            public uint OfsBody { get { return _ofsBody; } }
            public uint LenBody { get { return _lenBody; } }
            public AppleSingleDouble M_Root { get { return m_root; } }
            public AppleSingleDouble M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <summary>
        /// Information specific to Finder
        /// </summary>
        /// <remarks>
        /// Reference: older Inside Macintosh, Volume II page 84 or Volume IV page 104.
        /// </remarks>
        public partial class FinderInfo : KaitaiStruct
        {
            public static FinderInfo FromFile(string fileName)
            {
                return new FinderInfo(new KaitaiStream(fileName));
            }

            public FinderInfo(KaitaiStream p__io, AppleSingleDouble.Entry p__parent = null, AppleSingleDouble p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _fileType = m_io.ReadBytes(4);
                _fileCreator = m_io.ReadBytes(4);
                _flags = m_io.ReadU2be();
                _location = new Point(m_io, this, m_root);
                _folderId = m_io.ReadU2be();
            }
            private byte[] _fileType;
            private byte[] _fileCreator;
            private ushort _flags;
            private Point _location;
            private ushort _folderId;
            private AppleSingleDouble m_root;
            private AppleSingleDouble.Entry m_parent;
            public byte[] FileType { get { return _fileType; } }
            public byte[] FileCreator { get { return _fileCreator; } }
            public ushort Flags { get { return _flags; } }

            /// <summary>
            /// File icon's coordinates when displaying this folder.
            /// </summary>
            public Point Location { get { return _location; } }

            /// <summary>
            /// File folder ID (=window).
            /// </summary>
            public ushort FolderId { get { return _folderId; } }
            public AppleSingleDouble M_Root { get { return m_root; } }
            public AppleSingleDouble.Entry M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Specifies 2D coordinate in QuickDraw grid.
        /// </summary>
        public partial class Point : KaitaiStruct
        {
            public static Point FromFile(string fileName)
            {
                return new Point(new KaitaiStream(fileName));
            }

            public Point(KaitaiStream p__io, AppleSingleDouble.FinderInfo p__parent = null, AppleSingleDouble p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _x = m_io.ReadU2be();
                _y = m_io.ReadU2be();
            }
            private ushort _x;
            private ushort _y;
            private AppleSingleDouble m_root;
            private AppleSingleDouble.FinderInfo m_parent;
            public ushort X { get { return _x; } }
            public ushort Y { get { return _y; } }
            public AppleSingleDouble M_Root { get { return m_root; } }
            public AppleSingleDouble.FinderInfo M_Parent { get { return m_parent; } }
        }
        private FileType _magic;
        private uint _version;
        private byte[] _reserved;
        private ushort _numEntries;
        private List<Entry> _entries;
        private AppleSingleDouble m_root;
        private KaitaiStruct m_parent;
        public FileType Magic { get { return _magic; } }
        public uint Version { get { return _version; } }

        /// <summary>
        /// Must be all 0.
        /// </summary>
        public byte[] Reserved { get { return _reserved; } }
        public ushort NumEntries { get { return _numEntries; } }
        public List<Entry> Entries { get { return _entries; } }
        public AppleSingleDouble M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
