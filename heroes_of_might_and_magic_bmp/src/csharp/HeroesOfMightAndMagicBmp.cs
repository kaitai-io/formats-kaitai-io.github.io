// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class HeroesOfMightAndMagicBmp : KaitaiStruct
    {
        public static HeroesOfMightAndMagicBmp FromFile(string fileName)
        {
            return new HeroesOfMightAndMagicBmp(new KaitaiStream(fileName));
        }

        public HeroesOfMightAndMagicBmp(KaitaiStream p__io, KaitaiStruct p__parent = null, HeroesOfMightAndMagicBmp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadU2le();
            _width = m_io.ReadU2le();
            _height = m_io.ReadU2le();
            _data = m_io.ReadBytes((Width * Height));
        }
        private ushort _magic;
        private ushort _width;
        private ushort _height;
        private byte[] _data;
        private HeroesOfMightAndMagicBmp m_root;
        private KaitaiStruct m_parent;
        public ushort Magic { get { return _magic; } }
        public ushort Width { get { return _width; } }
        public ushort Height { get { return _height; } }
        public byte[] Data { get { return _data; } }
        public HeroesOfMightAndMagicBmp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
