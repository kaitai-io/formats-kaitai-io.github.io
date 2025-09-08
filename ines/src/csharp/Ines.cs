// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://www.nesdev.org/wiki/INES">Source</a>
    /// </remarks>
    public partial class Ines : KaitaiStruct
    {
        public static Ines FromFile(string fileName)
        {
            return new Ines(new KaitaiStream(fileName));
        }

        public Ines(KaitaiStream p__io, KaitaiStruct p__parent = null, Ines p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            __raw_header = m_io.ReadBytes(16);
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new Header(io___raw_header, this, m_root);
            if (Header.F6.Trainer) {
                _trainer = m_io.ReadBytes(512);
            }
            _prgRom = m_io.ReadBytes(Header.LenPrgRom * 16384);
            _chrRom = m_io.ReadBytes(Header.LenChrRom * 8192);
            if (Header.F7.Playchoice10) {
                _playchoice10 = new Playchoice10(m_io, this, m_root);
            }
            if (!(M_Io.IsEof)) {
                _title = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
            }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Ines p__parent = null, Ines p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_mapper = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 78, 69, 83, 26 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 78, 69, 83, 26 }, _magic, m_io, "/types/header/seq/0");
                }
                _lenPrgRom = m_io.ReadU1();
                _lenChrRom = m_io.ReadU1();
                __raw_f6 = m_io.ReadBytes(1);
                var io___raw_f6 = new KaitaiStream(__raw_f6);
                _f6 = new F6(io___raw_f6, this, m_root);
                __raw_f7 = m_io.ReadBytes(1);
                var io___raw_f7 = new KaitaiStream(__raw_f7);
                _f7 = new F7(io___raw_f7, this, m_root);
                _lenPrgRam = m_io.ReadU1();
                __raw_f9 = m_io.ReadBytes(1);
                var io___raw_f9 = new KaitaiStream(__raw_f9);
                _f9 = new F9(io___raw_f9, this, m_root);
                __raw_f10 = m_io.ReadBytes(1);
                var io___raw_f10 = new KaitaiStream(__raw_f10);
                _f10 = new F10(io___raw_f10, this, m_root);
                _reserved = m_io.ReadBytes(5);
                if (!((KaitaiStream.ByteArrayCompare(_reserved, new byte[] { 0, 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0 }, _reserved, m_io, "/types/header/seq/8");
                }
            }

            /// <remarks>
            /// Reference: <a href="https://www.nesdev.org/wiki/INES#Flags_10">Source</a>
            /// </remarks>
            public partial class F10 : KaitaiStruct
            {
                public static F10 FromFile(string fileName)
                {
                    return new F10(new KaitaiStream(fileName));
                }


                public enum TvSystem
                {
                    Ntsc = 0,
                    Dual1 = 1,
                    Pal = 2,
                    Dual2 = 3,
                }
                public F10(KaitaiStream p__io, Ines.Header p__parent = null, Ines p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved1 = m_io.ReadBitsIntBe(2);
                    _busConflict = m_io.ReadBitsIntBe(1) != 0;
                    _prgRam = m_io.ReadBitsIntBe(1) != 0;
                    _reserved2 = m_io.ReadBitsIntBe(2);
                    _tvSystem = ((TvSystem) m_io.ReadBitsIntBe(2));
                }
                private ulong _reserved1;
                private bool _busConflict;
                private bool _prgRam;
                private ulong _reserved2;
                private TvSystem _tvSystem;
                private Ines m_root;
                private Ines.Header m_parent;
                public ulong Reserved1 { get { return _reserved1; } }

                /// <summary>
                /// If 0, no bus conflicts. If 1, bus conflicts.
                /// </summary>
                public bool BusConflict { get { return _busConflict; } }

                /// <summary>
                /// If 0, PRG ram is present. If 1, not present.
                /// </summary>
                public bool PrgRam { get { return _prgRam; } }
                public ulong Reserved2 { get { return _reserved2; } }

                /// <summary>
                /// if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
                /// </summary>
                public TvSystem TvSystem { get { return _tvSystem; } }
                public Ines M_Root { get { return m_root; } }
                public Ines.Header M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://www.nesdev.org/wiki/INES#Flags_6">Source</a>
            /// </remarks>
            public partial class F6 : KaitaiStruct
            {
                public static F6 FromFile(string fileName)
                {
                    return new F6(new KaitaiStream(fileName));
                }


                public enum Mirroring
                {
                    Horizontal = 0,
                    Vertical = 1,
                }
                public F6(KaitaiStream p__io, Ines.Header p__parent = null, Ines p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lowerMapper = m_io.ReadBitsIntBe(4);
                    _fourScreen = m_io.ReadBitsIntBe(1) != 0;
                    _trainer = m_io.ReadBitsIntBe(1) != 0;
                    _hasBatteryRam = m_io.ReadBitsIntBe(1) != 0;
                    _mirroring = ((Mirroring) m_io.ReadBitsIntBe(1));
                }
                private ulong _lowerMapper;
                private bool _fourScreen;
                private bool _trainer;
                private bool _hasBatteryRam;
                private Mirroring _mirroring;
                private Ines m_root;
                private Ines.Header m_parent;

                /// <summary>
                /// Lower nibble of mapper number
                /// </summary>
                public ulong LowerMapper { get { return _lowerMapper; } }

                /// <summary>
                /// Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
                /// </summary>
                public bool FourScreen { get { return _fourScreen; } }

                /// <summary>
                /// 512-byte trainer at $7000-$71FF (stored before PRG data)
                /// </summary>
                public bool Trainer { get { return _trainer; } }

                /// <summary>
                /// If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
                /// </summary>
                public bool HasBatteryRam { get { return _hasBatteryRam; } }

                /// <summary>
                /// if 0, horizontal arrangement. if 1, vertical arrangement
                /// </summary>
                public Mirroring Mirroring { get { return _mirroring; } }
                public Ines M_Root { get { return m_root; } }
                public Ines.Header M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://www.nesdev.org/wiki/INES#Flags_7">Source</a>
            /// </remarks>
            public partial class F7 : KaitaiStruct
            {
                public static F7 FromFile(string fileName)
                {
                    return new F7(new KaitaiStream(fileName));
                }

                public F7(KaitaiStream p__io, Ines.Header p__parent = null, Ines p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _upperMapper = m_io.ReadBitsIntBe(4);
                    _format = m_io.ReadBitsIntBe(2);
                    _playchoice10 = m_io.ReadBitsIntBe(1) != 0;
                    _vsUnisystem = m_io.ReadBitsIntBe(1) != 0;
                }
                private ulong _upperMapper;
                private ulong _format;
                private bool _playchoice10;
                private bool _vsUnisystem;
                private Ines m_root;
                private Ines.Header m_parent;

                /// <summary>
                /// Upper nibble of mapper number
                /// </summary>
                public ulong UpperMapper { get { return _upperMapper; } }

                /// <summary>
                /// If equal to 2, flags 8-15 are in NES 2.0 format
                /// </summary>
                public ulong Format { get { return _format; } }

                /// <summary>
                /// Determines if it made for a Nintendo PlayChoice-10 or not
                /// </summary>
                public bool Playchoice10 { get { return _playchoice10; } }

                /// <summary>
                /// Determines if it is made for a Nintendo VS Unisystem or not
                /// </summary>
                public bool VsUnisystem { get { return _vsUnisystem; } }
                public Ines M_Root { get { return m_root; } }
                public Ines.Header M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://www.nesdev.org/wiki/INES#Flags_9">Source</a>
            /// </remarks>
            public partial class F9 : KaitaiStruct
            {
                public static F9 FromFile(string fileName)
                {
                    return new F9(new KaitaiStream(fileName));
                }


                public enum TvSystem
                {
                    Ntsc = 0,
                    Pal = 1,
                }
                public F9(KaitaiStream p__io, Ines.Header p__parent = null, Ines p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadBitsIntBe(7);
                    _tvSystem = ((TvSystem) m_io.ReadBitsIntBe(1));
                }
                private ulong _reserved;
                private TvSystem _tvSystem;
                private Ines m_root;
                private Ines.Header m_parent;
                public ulong Reserved { get { return _reserved; } }

                /// <summary>
                /// if 0, NTSC. If 1, PAL.
                /// </summary>
                public TvSystem TvSystem { get { return _tvSystem; } }
                public Ines M_Root { get { return m_root; } }
                public Ines.Header M_Parent { get { return m_parent; } }
            }
            private bool f_mapper;
            private int _mapper;

            /// <remarks>
            /// Reference: <a href="https://www.nesdev.org/wiki/Mapper">Source</a>
            /// </remarks>
            public int Mapper
            {
                get
                {
                    if (f_mapper)
                        return _mapper;
                    f_mapper = true;
                    _mapper = (int) (F6.LowerMapper | F7.UpperMapper << 4);
                    return _mapper;
                }
            }
            private byte[] _magic;
            private byte _lenPrgRom;
            private byte _lenChrRom;
            private F6 _f6;
            private F7 _f7;
            private byte _lenPrgRam;
            private F9 _f9;
            private F10 _f10;
            private byte[] _reserved;
            private Ines m_root;
            private Ines m_parent;
            private byte[] __raw_f6;
            private byte[] __raw_f7;
            private byte[] __raw_f9;
            private byte[] __raw_f10;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Size of PRG ROM in 16 KB units
            /// </summary>
            public byte LenPrgRom { get { return _lenPrgRom; } }

            /// <summary>
            /// Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
            /// </summary>
            public byte LenChrRom { get { return _lenChrRom; } }
            public F6 F6 { get { return _f6; } }
            public F7 F7 { get { return _f7; } }

            /// <summary>
            /// Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
            /// </summary>
            public byte LenPrgRam { get { return _lenPrgRam; } }
            public F9 F9 { get { return _f9; } }

            /// <summary>
            /// this one is unofficial
            /// </summary>
            public F10 F10 { get { return _f10; } }
            public byte[] Reserved { get { return _reserved; } }
            public Ines M_Root { get { return m_root; } }
            public Ines M_Parent { get { return m_parent; } }
            public byte[] M_RawF6 { get { return __raw_f6; } }
            public byte[] M_RawF7 { get { return __raw_f7; } }
            public byte[] M_RawF9 { get { return __raw_f9; } }
            public byte[] M_RawF10 { get { return __raw_f10; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.nesdev.org/wiki/PC10_ROM-Images">Source</a>
        /// </remarks>
        public partial class Playchoice10 : KaitaiStruct
        {
            public static Playchoice10 FromFile(string fileName)
            {
                return new Playchoice10(new KaitaiStream(fileName));
            }

            public Playchoice10(KaitaiStream p__io, Ines p__parent = null, Ines p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _instRom = m_io.ReadBytes(8192);
                _prom = new Prom(m_io, this, m_root);
            }
            public partial class Prom : KaitaiStruct
            {
                public static Prom FromFile(string fileName)
                {
                    return new Prom(new KaitaiStream(fileName));
                }

                public Prom(KaitaiStream p__io, Ines.Playchoice10 p__parent = null, Ines p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _data = m_io.ReadBytes(16);
                    _counterOut = m_io.ReadBytes(16);
                }
                private byte[] _data;
                private byte[] _counterOut;
                private Ines m_root;
                private Ines.Playchoice10 m_parent;
                public byte[] Data { get { return _data; } }
                public byte[] CounterOut { get { return _counterOut; } }
                public Ines M_Root { get { return m_root; } }
                public Ines.Playchoice10 M_Parent { get { return m_parent; } }
            }
            private byte[] _instRom;
            private Prom _prom;
            private Ines m_root;
            private Ines m_parent;
            public byte[] InstRom { get { return _instRom; } }
            public Prom Prom { get { return _prom; } }
            public Ines M_Root { get { return m_root; } }
            public Ines M_Parent { get { return m_parent; } }
        }
        private Header _header;
        private byte[] _trainer;
        private byte[] _prgRom;
        private byte[] _chrRom;
        private Playchoice10 _playchoice10;
        private string _title;
        private Ines m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        public Header Header { get { return _header; } }
        public byte[] Trainer { get { return _trainer; } }
        public byte[] PrgRom { get { return _prgRom; } }
        public byte[] ChrRom { get { return _chrRom; } }
        public Playchoice10 Playchoice10 { get { return _playchoice10; } }
        public string Title { get { return _title; } }
        public Ines M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
    }
}
