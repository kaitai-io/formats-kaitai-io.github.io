// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class Ines : KaitaiStruct
    {
        public static Ines FromFile(string fileName)
        {
            return new Ines(new KaitaiStream(fileName));
        }

        public Ines(KaitaiStream io, KaitaiStruct parent = null, Ines root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_mapper = false;
            _read();
        }
        private void _read() {
            _header = new Header(m_io, this, m_root);
            _rom = m_io.ReadBytesFull();
            }
        public partial class F7 : KaitaiStruct
        {
            public static F7 FromFile(string fileName)
            {
                return new F7(new KaitaiStream(fileName));
            }

            public F7(KaitaiStream io, Ines.Header parent = null, Ines root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _upperNibble = m_io.ReadBitsInt(4);
                _format = m_io.ReadBitsInt(2);
                _arcade2 = m_io.ReadBitsInt(1) != 0;
                _arcade1 = m_io.ReadBitsInt(1) != 0;
                }
            private ulong _upperNibble;
            private ulong _format;
            private bool _arcade2;
            private bool _arcade1;
            private Ines m_root;
            private Ines.Header m_parent;

            /// <summary>
            /// Upper nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
            /// </summary>
            public ulong UpperNibble { get { return _upperNibble; } }

            /// <summary>
            /// If equal to 2, flags 8-15 are in NES 2.0 format
            /// </summary>
            public ulong Format { get { return _format; } }

            /// <summary>
            /// Determines if it made for a Nintendo PlayChoice-10 or not
            /// </summary>
            public bool Arcade2 { get { return _arcade2; } }

            /// <summary>
            /// Determines if it is made for a Nintendo VS Unisystem or not
            /// </summary>
            public bool Arcade1 { get { return _arcade1; } }
            public Ines M_Root { get { return m_root; } }
            public Ines.Header M_Parent { get { return m_parent; } }
        }
        public partial class F6 : KaitaiStruct
        {
            public static F6 FromFile(string fileName)
            {
                return new F6(new KaitaiStream(fileName));
            }

            public F6(KaitaiStream io, Ines.Header parent = null, Ines root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _lowerNibble = m_io.ReadBitsInt(4);
                _ignoreMirror = m_io.ReadBitsInt(1) != 0;
                _trainer = m_io.ReadBitsInt(1) != 0;
                _hasBatteryRam = m_io.ReadBitsInt(1) != 0;
                _mirror = m_io.ReadBitsInt(1) != 0;
                }
            private ulong _lowerNibble;
            private bool _ignoreMirror;
            private bool _trainer;
            private bool _hasBatteryRam;
            private bool _mirror;
            private Ines m_root;
            private Ines.Header m_parent;

            /// <summary>
            /// Lower nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
            /// </summary>
            public ulong LowerNibble { get { return _lowerNibble; } }

            /// <summary>
            /// Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
            /// </summary>
            public bool IgnoreMirror { get { return _ignoreMirror; } }

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
            public bool Mirror { get { return _mirror; } }
            public Ines M_Root { get { return m_root; } }
            public Ines.Header M_Parent { get { return m_parent; } }
        }
        public partial class F10 : KaitaiStruct
        {
            public static F10 FromFile(string fileName)
            {
                return new F10(new KaitaiStream(fileName));
            }

            public F10(KaitaiStream io, Ines.Header parent = null, Ines root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _nothing1 = m_io.ReadBitsInt(2);
                _busConflict = m_io.ReadBitsInt(1) != 0;
                _prgRam = m_io.ReadBitsInt(1) != 0;
                _nothing2 = m_io.ReadBitsInt(2);
                _tvSystem = m_io.ReadBitsInt(2);
                }
            private ulong _nothing1;
            private bool _busConflict;
            private bool _prgRam;
            private ulong _nothing2;
            private ulong _tvSystem;
            private Ines m_root;
            private Ines.Header m_parent;
            public ulong Nothing1 { get { return _nothing1; } }

            /// <summary>
            /// If 0, no bus conflicts. If 1, bus conflicts.
            /// </summary>
            public bool BusConflict { get { return _busConflict; } }

            /// <summary>
            /// If 0, PRG ram is present. If 1, not present.
            /// </summary>
            public bool PrgRam { get { return _prgRam; } }
            public ulong Nothing2 { get { return _nothing2; } }

            /// <summary>
            /// if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
            /// </summary>
            public ulong TvSystem { get { return _tvSystem; } }
            public Ines M_Root { get { return m_root; } }
            public Ines.Header M_Parent { get { return m_parent; } }
        }
        public partial class F9 : KaitaiStruct
        {
            public static F9 FromFile(string fileName)
            {
                return new F9(new KaitaiStream(fileName));
            }

            public F9(KaitaiStream io, Ines.Header parent = null, Ines root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _reserved = m_io.ReadBitsInt(7);
                _tvSystem = m_io.ReadBitsInt(1) != 0;
                }
            private ulong _reserved;
            private bool _tvSystem;
            private Ines m_root;
            private Ines.Header m_parent;
            public ulong Reserved { get { return _reserved; } }

            /// <summary>
            /// if 0, NTSC. If 1, PAL.
            /// </summary>
            public bool TvSystem { get { return _tvSystem; } }
            public Ines M_Root { get { return m_root; } }
            public Ines.Header M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream io, Ines parent = null, Ines root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 78, 69, 83, 26 });
                _prgRomSize = m_io.ReadU1();
                _chrRomSize = m_io.ReadU1();
                _f6 = new F6(m_io, this, m_root);
                _f7 = new F7(m_io, this, m_root);
                _prgRamSize = m_io.ReadU1();
                _f9 = new F9(m_io, this, m_root);
                _f10 = new F10(m_io, this, m_root);
                _zeroFill = m_io.ReadBytes(4);
                }
            private byte[] _magic;
            private byte _prgRomSize;
            private byte _chrRomSize;
            private F6 _f6;
            private F7 _f7;
            private byte _prgRamSize;
            private F9 _f9;
            private F10 _f10;
            private byte[] _zeroFill;
            private Ines m_root;
            private Ines m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Size of PRG ROM in 16 KB units
            /// </summary>
            public byte PrgRomSize { get { return _prgRomSize; } }

            /// <summary>
            /// Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
            /// </summary>
            public byte ChrRomSize { get { return _chrRomSize; } }
            public F6 F6 { get { return _f6; } }
            public F7 F7 { get { return _f7; } }

            /// <summary>
            /// Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
            /// </summary>
            public byte PrgRamSize { get { return _prgRamSize; } }
            public F9 F9 { get { return _f9; } }

            /// <summary>
            /// this one is unofficial
            /// </summary>
            public F10 F10 { get { return _f10; } }
            public byte[] ZeroFill { get { return _zeroFill; } }
            public Ines M_Root { get { return m_root; } }
            public Ines M_Parent { get { return m_parent; } }
        }
        private bool f_mapper;
        private int _mapper;
        public int Mapper
        {
            get
            {
                if (f_mapper)
                    return _mapper;
                _mapper = (int) ((M_Root.Header.F6.LowerNibble | (M_Root.Header.F7.UpperNibble << 4)));
                f_mapper = true;
                return _mapper;
            }
        }
        private Header _header;
        private byte[] _rom;
        private Ines m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public byte[] Rom { get { return _rom; } }
        public Ines M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
