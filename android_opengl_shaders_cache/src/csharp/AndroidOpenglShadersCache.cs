// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Android apps using directly or indirectly OpenGL cache compiled shaders into com.android.opengl.shaders_cache file.
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
            _signature = m_io.EnsureFixedContents(new byte[] { 69, 71, 76, 36 });
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
        public partial class String : KaitaiStruct
        {
            public static String FromFile(string fileName)
            {
                return new String(new KaitaiStream(fileName));
            }

            public String(KaitaiStream p__io, AndroidOpenglShadersCache.Cache p__parent = null, AndroidOpenglShadersCache p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _length = m_io.ReadU4le();
                _str = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(Length), 0, false));
                _alignment = new Alignment(m_io, this, m_root);
            }
            private uint _length;
            private string _str;
            private Alignment _alignment;
            private AndroidOpenglShadersCache m_root;
            private AndroidOpenglShadersCache.Cache m_parent;
            public uint Length { get { return _length; } }
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
                _signature = m_io.EnsureFixedContents(new byte[] { 36, 98, 66, 95 });
                _version = m_io.ReadU4le();
                _deviceVersion = m_io.ReadU4le();
                _countOfEntries = m_io.ReadU4le();
                if (Version >= 3) {
                    _buildId = new String(m_io, this, m_root);
                }
                _entries = new List<Entry>((int) (CountOfEntries));
                for (var i = 0; i < CountOfEntries; i++)
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
                    _keySize = m_io.ReadU4le();
                    _valueSize = m_io.ReadU4le();
                    _key = m_io.ReadBytes(KeySize);
                    _value = m_io.ReadBytes(ValueSize);
                    _alignment = new Alignment(m_io, this, m_root);
                }
                private uint _keySize;
                private uint _valueSize;
                private byte[] _key;
                private byte[] _value;
                private Alignment _alignment;
                private AndroidOpenglShadersCache m_root;
                private AndroidOpenglShadersCache.Cache m_parent;
                public uint KeySize { get { return _keySize; } }
                public uint ValueSize { get { return _valueSize; } }
                public byte[] Key { get { return _key; } }
                public byte[] Value { get { return _value; } }
                public Alignment Alignment { get { return _alignment; } }
                public AndroidOpenglShadersCache M_Root { get { return m_root; } }
                public AndroidOpenglShadersCache.Cache M_Parent { get { return m_parent; } }
            }
            private byte[] _signature;
            private uint _version;
            private uint _deviceVersion;
            private uint _countOfEntries;
            private String _buildId;
            private List<Entry> _entries;
            private AndroidOpenglShadersCache m_root;
            private AndroidOpenglShadersCache m_parent;
            public byte[] Signature { get { return _signature; } }
            public uint Version { get { return _version; } }
            public uint DeviceVersion { get { return _deviceVersion; } }
            public uint CountOfEntries { get { return _countOfEntries; } }
            public String BuildId { get { return _buildId; } }
            public List<Entry> Entries { get { return _entries; } }
            public AndroidOpenglShadersCache M_Root { get { return m_root; } }
            public AndroidOpenglShadersCache M_Parent { get { return m_parent; } }
        }
        private byte[] _signature;
        private uint _crc32;
        private Cache _contents;
        private AndroidOpenglShadersCache m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_contents;
        public byte[] Signature { get { return _signature; } }

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
