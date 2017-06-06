// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class Exif : KaitaiStruct
    {
        public static Exif FromFile(string fileName)
        {
            return new Exif(new KaitaiStream(fileName));
        }

        public Exif(KaitaiStream io, KaitaiStruct parent = null, Exif root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _endianness = m_io.ReadU2le();
            switch (Endianness) {
            case 18761: {
                _body = new ExifLe(m_io);
                break;
            }
            case 19789: {
                _body = new ExifBe(m_io);
                break;
            }
            }
            }
        private ushort _endianness;
        private KaitaiStruct _body;
        private Exif m_root;
        private KaitaiStruct m_parent;
        public ushort Endianness { get { return _endianness; } }
        public KaitaiStruct Body { get { return _body; } }
        public Exif M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
