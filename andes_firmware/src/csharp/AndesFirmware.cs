// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Firmware image found with MediaTek MT76xx wifi chipsets.
    /// </summary>
    public partial class AndesFirmware : KaitaiStruct
    {
        public static AndesFirmware FromFile(string fileName)
        {
            return new AndesFirmware(new KaitaiStream(fileName));
        }

        public AndesFirmware(KaitaiStream io, KaitaiStruct parent = null, AndesFirmware root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            __raw_imageHeader = m_io.ReadBytes(32);
            var io___raw_imageHeader = new KaitaiStream(__raw_imageHeader);
            _imageHeader = new ImageHeader(io___raw_imageHeader, this, m_root);
            _ilm = m_io.ReadBytes(ImageHeader.IlmLen);
            _dlm = m_io.ReadBytes(ImageHeader.DlmLen);
            }
        public partial class ImageHeader : KaitaiStruct
        {
            public static ImageHeader FromFile(string fileName)
            {
                return new ImageHeader(new KaitaiStream(fileName));
            }

            public ImageHeader(KaitaiStream io, AndesFirmware parent = null, AndesFirmware root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _ilmLen = m_io.ReadU4le();
                _dlmLen = m_io.ReadU4le();
                _fwVer = m_io.ReadU2le();
                _buildVer = m_io.ReadU2le();
                _extra = m_io.ReadU4le();
                _buildTime = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(16));
                }
            private uint _ilmLen;
            private uint _dlmLen;
            private ushort _fwVer;
            private ushort _buildVer;
            private uint _extra;
            private string _buildTime;
            private AndesFirmware m_root;
            private AndesFirmware m_parent;
            public uint IlmLen { get { return _ilmLen; } }
            public uint DlmLen { get { return _dlmLen; } }
            public ushort FwVer { get { return _fwVer; } }
            public ushort BuildVer { get { return _buildVer; } }
            public uint Extra { get { return _extra; } }
            public string BuildTime { get { return _buildTime; } }
            public AndesFirmware M_Root { get { return m_root; } }
            public AndesFirmware M_Parent { get { return m_parent; } }
        }
        private ImageHeader _imageHeader;
        private byte[] _ilm;
        private byte[] _dlm;
        private AndesFirmware m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_imageHeader;
        public ImageHeader ImageHeader { get { return _imageHeader; } }
        public byte[] Ilm { get { return _ilm; } }
        public byte[] Dlm { get { return _dlm; } }
        public AndesFirmware M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawImageHeader { get { return __raw_imageHeader; } }
    }
}
