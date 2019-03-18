// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// The new uImage format allows more flexibility in handling images of various
    /// types (kernel, ramdisk, etc.), it also enhances integrity protection of images
    /// with sha1 and md5 checksums.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h">Source</a>
    /// </remarks>
    public partial class Uimage : KaitaiStruct
    {
        public static Uimage FromFile(string fileName)
        {
            return new Uimage(new KaitaiStream(fileName));
        }


        public enum UimageOs
        {
            Invalid = 0,
            Openbsd = 1,
            Netbsd = 2,
            Freebsd = 3,
            Bsd44 = 4,
            Linux = 5,
            Svr4 = 6,
            Esix = 7,
            Solaris = 8,
            Irix = 9,
            Sco = 10,
            Dell = 11,
            Ncr = 12,
            Lynxos = 13,
            Vxworks = 14,
            Psos = 15,
            Qnx = 16,
            UBoot = 17,
            Rtems = 18,
            Artos = 19,
            Unity = 20,
            Integrity = 21,
        }

        public enum UimageArch
        {
            Invalid = 0,
            Alpha = 1,
            Arm = 2,
            I386 = 3,
            Ia64 = 4,
            Mips = 5,
            Mips64 = 6,
            Ppc = 7,
            S390 = 8,
            Sh = 9,
            Sparc = 10,
            Sparc64 = 11,
            M68k = 12,
            Nios = 13,
            Microblaze = 14,
            Nios2 = 15,
            Blackfin = 16,
            Avr32 = 17,
            St200 = 18,
        }

        public enum UimageComp
        {
            None = 0,
            Gzip = 1,
            Bzip2 = 2,
            Lzma = 3,
            Lzo = 4,
        }

        public enum UimageType
        {
            Invalid = 0,
            Standalone = 1,
            Kernel = 2,
            Ramdisk = 3,
            Multi = 4,
            Firmware = 5,
            Script = 6,
            Filesystem = 7,
            Flatdt = 8,
            Kwbimage = 9,
            Imximage = 10,
        }
        public Uimage(KaitaiStream p__io, KaitaiStruct p__parent = null, Uimage p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Uheader(m_io, this, m_root);
            _data = m_io.ReadBytes(Header.LenImage);
        }
        public partial class Uheader : KaitaiStruct
        {
            public static Uheader FromFile(string fileName)
            {
                return new Uheader(new KaitaiStream(fileName));
            }

            public Uheader(KaitaiStream p__io, Uimage p__parent = null, Uimage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 39, 5, 25, 86 });
                _headerCrc = m_io.ReadU4be();
                _timestamp = m_io.ReadU4be();
                _lenImage = m_io.ReadU4be();
                _loadAddress = m_io.ReadU4be();
                _entryAddress = m_io.ReadU4be();
                _dataCrc = m_io.ReadU4be();
                _osType = ((Uimage.UimageOs) m_io.ReadU1());
                _architecture = ((Uimage.UimageArch) m_io.ReadU1());
                _imageType = ((Uimage.UimageType) m_io.ReadU1());
                _compressionType = ((Uimage.UimageComp) m_io.ReadU1());
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(32), 0, false));
            }
            private byte[] _magic;
            private uint _headerCrc;
            private uint _timestamp;
            private uint _lenImage;
            private uint _loadAddress;
            private uint _entryAddress;
            private uint _dataCrc;
            private UimageOs _osType;
            private UimageArch _architecture;
            private UimageType _imageType;
            private UimageComp _compressionType;
            private string _name;
            private Uimage m_root;
            private Uimage m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint HeaderCrc { get { return _headerCrc; } }
            public uint Timestamp { get { return _timestamp; } }
            public uint LenImage { get { return _lenImage; } }
            public uint LoadAddress { get { return _loadAddress; } }
            public uint EntryAddress { get { return _entryAddress; } }
            public uint DataCrc { get { return _dataCrc; } }
            public UimageOs OsType { get { return _osType; } }
            public UimageArch Architecture { get { return _architecture; } }
            public UimageType ImageType { get { return _imageType; } }
            public UimageComp CompressionType { get { return _compressionType; } }
            public string Name { get { return _name; } }
            public Uimage M_Root { get { return m_root; } }
            public Uimage M_Parent { get { return m_parent; } }
        }
        private Uheader _header;
        private byte[] _data;
        private Uimage m_root;
        private KaitaiStruct m_parent;
        public Uheader Header { get { return _header; } }
        public byte[] Data { get { return _data; } }
        public Uimage M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
