// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// glTF is a format for distribution of 3D models optimized for being used in software
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout">Source</a>
    /// </remarks>
    public partial class GltfBinary : KaitaiStruct
    {
        public static GltfBinary FromFile(string fileName)
        {
            return new GltfBinary(new KaitaiStream(fileName));
        }


        public enum ChunkType
        {
            Bin = 5130562,
            Json = 1313821514,
        }
        public GltfBinary(KaitaiStream p__io, KaitaiStruct p__parent = null, GltfBinary p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            _chunks = new List<Chunk>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _chunks.Add(new Chunk(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, GltfBinary p__parent = null, GltfBinary p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 103, 108, 84, 70 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 103, 108, 84, 70 }, Magic, M_Io, "/types/header/seq/0");
                }
                _version = m_io.ReadU4le();
                _length = m_io.ReadU4le();
            }
            private byte[] _magic;
            private uint _version;
            private uint _length;
            private GltfBinary m_root;
            private GltfBinary m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Indicates the version of the Binary glTF container format.
            /// For this specification, should be set to 2.
            /// </summary>
            public uint Version { get { return _version; } }

            /// <summary>
            /// Total length of the Binary glTF, including Header and all Chunks, in bytes.
            /// </summary>
            public uint Length { get { return _length; } }
            public GltfBinary M_Root { get { return m_root; } }
            public GltfBinary M_Parent { get { return m_parent; } }
        }
        public partial class Chunk : KaitaiStruct
        {
            public static Chunk FromFile(string fileName)
            {
                return new Chunk(new KaitaiStream(fileName));
            }

            public Chunk(KaitaiStream p__io, GltfBinary p__parent = null, GltfBinary p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenData = m_io.ReadU4le();
                _type = ((GltfBinary.ChunkType) m_io.ReadU4le());
                switch (Type) {
                case GltfBinary.ChunkType.Json: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Json(io___raw_data, this, m_root);
                    break;
                }
                case GltfBinary.ChunkType.Bin: {
                    __raw_data = m_io.ReadBytes(LenData);
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new Bin(io___raw_data, this, m_root);
                    break;
                }
                default: {
                    _data = m_io.ReadBytes(LenData);
                    break;
                }
                }
            }
            private uint _lenData;
            private ChunkType _type;
            private object _data;
            private GltfBinary m_root;
            private GltfBinary m_parent;
            private byte[] __raw_data;
            public uint LenData { get { return _lenData; } }
            public ChunkType Type { get { return _type; } }
            public object Data { get { return _data; } }
            public GltfBinary M_Root { get { return m_root; } }
            public GltfBinary M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        public partial class Json : KaitaiStruct
        {
            public static Json FromFile(string fileName)
            {
                return new Json(new KaitaiStream(fileName));
            }

            public Json(KaitaiStream p__io, GltfBinary.Chunk p__parent = null, GltfBinary p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _data;
            private GltfBinary m_root;
            private GltfBinary.Chunk m_parent;

            /// <summary>
            /// This is where GLB deviates from being an elegant format.
            /// To parse the rest of the file, you have to parse the JSON first.
            /// </summary>
            public string Data { get { return _data; } }
            public GltfBinary M_Root { get { return m_root; } }
            public GltfBinary.Chunk M_Parent { get { return m_parent; } }
        }
        public partial class Bin : KaitaiStruct
        {
            public static Bin FromFile(string fileName)
            {
                return new Bin(new KaitaiStream(fileName));
            }

            public Bin(KaitaiStream p__io, GltfBinary.Chunk p__parent = null, GltfBinary p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _data = m_io.ReadBytesFull();
            }
            private byte[] _data;
            private GltfBinary m_root;
            private GltfBinary.Chunk m_parent;
            public byte[] Data { get { return _data; } }
            public GltfBinary M_Root { get { return m_root; } }
            public GltfBinary.Chunk M_Parent { get { return m_parent; } }
        }
        private Header _header;
        private List<Chunk> _chunks;
        private GltfBinary m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public List<Chunk> Chunks { get { return _chunks; } }
        public GltfBinary M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
