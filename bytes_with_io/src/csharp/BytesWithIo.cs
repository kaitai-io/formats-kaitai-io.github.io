// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
    /// </summary>
    public partial class BytesWithIo : KaitaiStruct
    {
        public static BytesWithIo FromFile(string fileName)
        {
            return new BytesWithIo(new KaitaiStream(fileName));
        }

        public BytesWithIo(KaitaiStream p__io, KaitaiStruct p__parent = null, BytesWithIo p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _data = m_io.ReadBytesFull();
        }
        private byte[] _data;
        private BytesWithIo m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// The actual data.
        /// </summary>
        public byte[] Data { get { return _data; } }
        public BytesWithIo M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
