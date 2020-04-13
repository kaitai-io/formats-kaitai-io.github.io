// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Android apps using directly or indirectly OpenGL cache compiled shaders
    /// into com.android.opengl.shaders_cache file.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp">Source</a>
    /// </remarks>
    public partial class AndroidOpenglShadersCache : KaitaiStruct
    {
        public static AndroidOpenglShadersCache FromFile(string fileName)
        {
            return new AndroidOpenglShadersCache(new KaitaiStream(fileName));
        }

        public AndroidOpenglShadersCache(KaitaiStream p__io, KaitaiStruct p__parent = null, AndroidOpenglShadersCache p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.EnsureFixedContents(new byte[] { 69, 71, 76, 36 });
            _crc32 = m_io.ReadU4le();
            __raw_contents = m_io.ReadBytesFull();
            var io___raw_contents = new KaitaiStream(__raw_contents);
            _contents = new Cache(io___raw_contents, this, m_root);
        }
        public partial class Alignment : KaitaiStruct
        {
            public static Alignment FromFile(string fileName)
            {
                return new Alignment(new KaitaiStream(fileName));
            }

            public Alignment(KaitaiStream p__io, KaitaiStruct p__parent = null, AndroidOpenglShadersCache p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _alignment = m_io.ReadBytes(((M_Io.Pos + 3) & (~3 - M_Io.Pos)));
            }
            private byte[] _alignment;
            private AndroidOpenglShadersCache m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// garbage from memory
            /// </summary>
            public byte[] Alignment { get { return _alignment; } }
            public AndroidOpenglShadersCache M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class PrefixedString : KaitaiStruct
        {
            public static PrefixedString FromFile(string fileName)
            {
                return new PrefixedString(new KaitaiStream(fileName));
            }

            public PrefixedString(KaitaiStream p__io, AndroidOpenglShadersCache.Cache p__parent = null, AndroidOpenglShadersCache p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenStr = m_io.ReadU4le();
                _str = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(LenStr), 0, false));
                _alignment = new Alignment(m_io, this, m_root);
            }
            private uint _lenStr;
            private string _str;
            private Alignment _alignment;
            private AndroidOpenglShadersCache m_root;
            private AndroidOpenglShadersCache.Cache m_parent;
            public uint LenStr { get { return _lenStr; } }
            public string Str { get { return _str; } }
            public Alignment Alignment { get { return _alignment; } }
            public AndroidOpenglShadersCache M_Root { get { return m_root; } }
            public AndroidOpenglShadersCache.Cache M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp">Source</a>
        /// </remarks>
        public partial class Cache : KaitaiStruct
        {
            public static Cache FromFile(string fileName)
            {
                return new Cache(new KaitaiStream(fileName));
            }

            public Cache(KaitaiStream p__io, AndroidOpenglShadersCache p__parent = null, AndroidOpenglShadersCache p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 36, 98, 66, 95 });
                _version = m_io.ReadU4le();
                _deviceVersion = m_io.ReadU4le();
                _numEntries = m_io.ReadU4le();
                if (Version >= 3) {
                    _buildId = new PrefixedString(m_io, this, m_root);
                }
                _entries = new List<Entry>((int) (NumEntries));
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

                public Entry(KaitaiStream p__io, AndroidOpenglShadersCache.Cache p__parent = null, AndroidOpenglShadersCache p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lenKey = m_io.ReadU4le();
                    _lenValue = m_io.ReadU4le();
                    _key = m_io.ReadBytes(LenKey);
                    _value = m_io.ReadBytes(LenValue);
                    _alignment = new Alignment(m_io, this, m_root);
                }
                private uint _lenKey;
                private uint _lenValue;
                private byte[] _key;
                private byte[] _value;
                private Alignment _alignment;
                private AndroidOpenglShadersCache m_root;
                private AndroidOpenglShadersCache.Cache m_parent;
                public uint LenKey { get { return _lenKey; } }
                public uint LenValue { get { return _lenValue; } }
                public byte[] Key { get { return _key; } }
                public byte[] Value { get { return _value; } }
                public Alignment Alignment { get { return _alignment; } }
                public AndroidOpenglShadersCache M_Root { get { return m_root; } }
                public AndroidOpenglShadersCache.Cache M_Parent { get { return m_parent; } }
            }
            private byte[] _magic;
            private uint _version;
            private uint _deviceVersion;
            private uint _numEntries;
            private PrefixedString _buildId;
            private List<Entry> _entries;
            private AndroidOpenglShadersCache m_root;
            private AndroidOpenglShadersCache m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint Version { get { return _version; } }
            public uint DeviceVersion { get { return _deviceVersion; } }
            public uint NumEntries { get { return _numEntries; } }
            public PrefixedString BuildId { get { return _buildId; } }
            public List<Entry> Entries { get { return _entries; } }
            public AndroidOpenglShadersCache M_Root { get { return m_root; } }
            public AndroidOpenglShadersCache M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private uint _crc32;
        private Cache _contents;
        private AndroidOpenglShadersCache m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_contents;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// crc32 of `contents`
        /// </summary>
        public uint Crc32 { get { return _crc32; } }
        public Cache Contents { get { return _contents; } }
        public AndroidOpenglShadersCache M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawContents { get { return __raw_contents; } }
    }
}
