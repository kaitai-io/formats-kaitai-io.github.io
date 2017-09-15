// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Swf : KaitaiStruct
    {
        public static Swf FromFile(string fileName)
        {
            return new Swf(new KaitaiStream(fileName));
        }


        public enum TagType
        {
            FileAttributes = 69,
            AbcTag = 82,
        }
        public Swf(KaitaiStream p__io, KaitaiStruct p__parent = null, Swf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _junk = m_io.ReadBytes(4);
            _fileSize = m_io.ReadU4le();
            __raw__raw_body = m_io.ReadBytesFull();
            __raw_body = m_io.ProcessZlib(__raw__raw_body);
            var io___raw_body = new KaitaiStream(__raw_body);
            _body = new SwfBody(io___raw_body, this, m_root);
        }
        public partial class SwfBody : KaitaiStruct
        {
            public static SwfBody FromFile(string fileName)
            {
                return new SwfBody(new KaitaiStream(fileName));
            }

            public SwfBody(KaitaiStream p__io, Swf p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _rect = new Rect(m_io, this, m_root);
                _frameRate = m_io.ReadU2le();
                _frameCount = m_io.ReadU2le();
                _tags = new List<Tag>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _tags.Add(new Tag(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private Rect _rect;
            private ushort _frameRate;
            private ushort _frameCount;
            private List<Tag> _tags;
            private Swf m_root;
            private Swf m_parent;
            public Rect Rect { get { return _rect; } }
            public ushort FrameRate { get { return _frameRate; } }
            public ushort FrameCount { get { return _frameCount; } }
            public List<Tag> Tags { get { return _tags; } }
            public Swf M_Root { get { return m_root; } }
            public Swf M_Parent { get { return m_parent; } }
        }
        public partial class Rect : KaitaiStruct
        {
            public static Rect FromFile(string fileName)
            {
                return new Rect(new KaitaiStream(fileName));
            }

            public Rect(KaitaiStream p__io, Swf.SwfBody p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numBits = false;
                f_numBytes = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                _skip = m_io.ReadBytes(NumBytes);
            }
            private bool f_numBits;
            private int _numBits;
            public int NumBits
            {
                get
                {
                    if (f_numBits)
                        return _numBits;
                    _numBits = (int) ((B1 >> 3));
                    f_numBits = true;
                    return _numBits;
                }
            }
            private bool f_numBytes;
            private int _numBytes;
            public int NumBytes
            {
                get
                {
                    if (f_numBytes)
                        return _numBytes;
                    _numBytes = (int) (((((NumBits * 4) - 3) + 7) / 8));
                    f_numBytes = true;
                    return _numBytes;
                }
            }
            private byte _b1;
            private byte[] _skip;
            private Swf m_root;
            private Swf.SwfBody m_parent;
            public byte B1 { get { return _b1; } }
            public byte[] Skip { get { return _skip; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.SwfBody M_Parent { get { return m_parent; } }
        }
        public partial class Tag : KaitaiStruct
        {
            public static Tag FromFile(string fileName)
            {
                return new Tag(new KaitaiStream(fileName));
            }

            public Tag(KaitaiStream p__io, Swf.SwfBody p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _recordHeader = new RecordHeader(m_io, this, m_root);
                switch (RecordHeader.TagType) {
                case Swf.TagType.AbcTag: {
                    __raw_tagBody = m_io.ReadBytes(RecordHeader.Len);
                    var io___raw_tagBody = new KaitaiStream(__raw_tagBody);
                    _tagBody = new AbcTagBody(io___raw_tagBody, this, m_root);
                    break;
                }
                default: {
                    _tagBody = m_io.ReadBytes(RecordHeader.Len);
                    break;
                }
                }
            }
            private RecordHeader _recordHeader;
            private object _tagBody;
            private Swf m_root;
            private Swf.SwfBody m_parent;
            private byte[] __raw_tagBody;
            public RecordHeader RecordHeader { get { return _recordHeader; } }
            public object TagBody { get { return _tagBody; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.SwfBody M_Parent { get { return m_parent; } }
            public byte[] M_RawTagBody { get { return __raw_tagBody; } }
        }
        public partial class AbcTagBody : KaitaiStruct
        {
            public static AbcTagBody FromFile(string fileName)
            {
                return new AbcTagBody(new KaitaiStream(fileName));
            }

            public AbcTagBody(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadU4le();
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _abcdata = m_io.ReadBytesFull();
            }
            private uint _flags;
            private string _name;
            private byte[] _abcdata;
            private Swf m_root;
            private Swf.Tag m_parent;
            public uint Flags { get { return _flags; } }
            public string Name { get { return _name; } }
            public byte[] Abcdata { get { return _abcdata; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        public partial class RecordHeader : KaitaiStruct
        {
            public static RecordHeader FromFile(string fileName)
            {
                return new RecordHeader(new KaitaiStream(fileName));
            }

            public RecordHeader(KaitaiStream p__io, Swf.Tag p__parent = null, Swf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_tagType = false;
                f_smallLen = false;
                f_len = false;
                _read();
            }
            private void _read()
            {
                _tagCodeAndLength = m_io.ReadU2le();
                if (SmallLen == 63) {
                    _bigLen = m_io.ReadS4le();
                }
            }
            private bool f_tagType;
            private TagType _tagType;
            public TagType TagType
            {
                get
                {
                    if (f_tagType)
                        return _tagType;
                    _tagType = (TagType) (((Swf.TagType) (TagCodeAndLength >> 6)));
                    f_tagType = true;
                    return _tagType;
                }
            }
            private bool f_smallLen;
            private int _smallLen;
            public int SmallLen
            {
                get
                {
                    if (f_smallLen)
                        return _smallLen;
                    _smallLen = (int) ((TagCodeAndLength & 63));
                    f_smallLen = true;
                    return _smallLen;
                }
            }
            private bool f_len;
            private int _len;
            public int Len
            {
                get
                {
                    if (f_len)
                        return _len;
                    _len = (int) ((SmallLen == 63 ? BigLen : SmallLen));
                    f_len = true;
                    return _len;
                }
            }
            private ushort _tagCodeAndLength;
            private int? _bigLen;
            private Swf m_root;
            private Swf.Tag m_parent;
            public ushort TagCodeAndLength { get { return _tagCodeAndLength; } }
            public int? BigLen { get { return _bigLen; } }
            public Swf M_Root { get { return m_root; } }
            public Swf.Tag M_Parent { get { return m_parent; } }
        }
        private byte[] _junk;
        private uint _fileSize;
        private SwfBody _body;
        private Swf m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw__raw_body;
        private byte[] __raw_body;
        public byte[] Junk { get { return _junk; } }
        public uint FileSize { get { return _fileSize; } }
        public SwfBody Body { get { return _body; } }
        public Swf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawM_RawBody { get { return __raw__raw_body; } }
        public byte[] M_RawBody { get { return __raw_body; } }
    }
}
