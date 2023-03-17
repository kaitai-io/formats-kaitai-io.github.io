// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html">Source</a>
    /// </remarks>
    public partial class Elf : KaitaiStruct
    {
        public static Elf FromFile(string fileName)
        {
            return new Elf(new KaitaiStream(fileName));
        }


        public enum SymbolVisibility
        {
            Default = 0,
            Internal = 1,
            Hidden = 2,
            Protected = 3,
            Exported = 4,
            Singleton = 5,
            Eliminate = 6,
        }

        public enum SymbolBinding
        {
            Local = 0,
            GlobalSymbol = 1,
            Weak = 2,
            Os10 = 10,
            Os11 = 11,
            Os12 = 12,
            Proc13 = 13,
            Proc14 = 14,
            Proc15 = 15,
        }

        public enum Endian
        {
            Le = 1,
            Be = 2,
        }

        public enum ShType
        {
            NullType = 0,
            Progbits = 1,
            Symtab = 2,
            Strtab = 3,
            Rela = 4,
            Hash = 5,
            Dynamic = 6,
            Note = 7,
            Nobits = 8,
            Rel = 9,
            Shlib = 10,
            Dynsym = 11,
            InitArray = 14,
            FiniArray = 15,
            PreinitArray = 16,
            Group = 17,
            SymtabShndx = 18,
            Relr = 19,
            SunwSymnsort = 1879048172,
            SunwPhname = 1879048173,
            SunwAncillary = 1879048174,
            SunwCapchain = 1879048175,
            SunwCapinfo = 1879048176,
            SunwSymsort = 1879048177,
            SunwTlssort = 1879048178,
            SunwLdynsym = 1879048179,
            SunwDof = 1879048180,
            SunwCap = 1879048181,
            SunwSignature = 1879048182,
            SunwAnnotate = 1879048183,
            SunwDebugstr = 1879048184,
            SunwDebug = 1879048185,
            SunwMove = 1879048186,
            SunwComdat = 1879048187,
            SunwSyminfo = 1879048188,
            SunwVerdef = 1879048189,
            SunwVerneed = 1879048190,
            SunwVersym = 1879048191,
            SparcGotdata = 1879048192,
            Amd64Unwind = 1879048193,
            ArmPreemptmap = 1879048194,
            ArmAttributes = 1879048195,
            ArmDebugoverlay = 1879048196,
            ArmOverlaysection = 1879048197,
        }

        public enum OsAbi
        {
            SystemV = 0,
            HpUx = 1,
            Netbsd = 2,
            Gnu = 3,
            Solaris = 6,
            Aix = 7,
            Irix = 8,
            Freebsd = 9,
            Tru64 = 10,
            Modesto = 11,
            Openbsd = 12,
            Openvms = 13,
            Nsk = 14,
            Aros = 15,
            Fenixos = 16,
            Cloudabi = 17,
            Openvos = 18,
        }

        public enum Machine
        {
            NoMachine = 0,
            M32 = 1,
            Sparc = 2,
            X86 = 3,
            M68k = 4,
            M88k = 5,
            Iamcu = 6,
            I860 = 7,
            Mips = 8,
            S370 = 9,
            MipsRs3Le = 10,
            Parisc = 15,
            Vpp500 = 17,
            Sparc32plus = 18,
            I960 = 19,
            Powerpc = 20,
            Powerpc64 = 21,
            S390 = 22,
            Spu = 23,
            V800 = 36,
            Fr20 = 37,
            Rh32 = 38,
            Rce = 39,
            Arm = 40,
            OldAlpha = 41,
            Superh = 42,
            SparcV9 = 43,
            Tricore = 44,
            Arc = 45,
            H8300 = 46,
            H8300h = 47,
            H8s = 48,
            H8500 = 49,
            Ia64 = 50,
            MipsX = 51,
            Coldfire = 52,
            M68hc12 = 53,
            Mma = 54,
            Pcp = 55,
            Ncpu = 56,
            Ndr1 = 57,
            Starcore = 58,
            Me16 = 59,
            St100 = 60,
            Tinyj = 61,
            X8664 = 62,
            Pdsp = 63,
            Pdp10 = 64,
            Pdp11 = 65,
            Fx66 = 66,
            St9plus = 67,
            St7 = 68,
            Mc68hc16 = 69,
            Mc68hc11 = 70,
            Mc68hc08 = 71,
            Mc68hc05 = 72,
            Svx = 73,
            St19 = 74,
            Vax = 75,
            Cris = 76,
            Javelin = 77,
            Firepath = 78,
            Zsp = 79,
            Mmix = 80,
            Huany = 81,
            Prism = 82,
            Avr = 83,
            Fr30 = 84,
            D10v = 85,
            D30v = 86,
            V850 = 87,
            M32r = 88,
            Mn10300 = 89,
            Mn10200 = 90,
            Picojava = 91,
            Openrisc = 92,
            ArcCompact = 93,
            Xtensa = 94,
            Videocore = 95,
            TmmGpp = 96,
            Ns32k = 97,
            Tpc = 98,
            Snp1k = 99,
            St200 = 100,
            Ip2k = 101,
            Max = 102,
            CompactRisc = 103,
            F2mc16 = 104,
            Msp430 = 105,
            Blackfin = 106,
            SeC33 = 107,
            Sep = 108,
            Arca = 109,
            Unicore = 110,
            Excess = 111,
            Dxp = 112,
            AlteraNios2 = 113,
            Crx = 114,
            Xgate = 115,
            C166 = 116,
            M16c = 117,
            Dspic30f = 118,
            FreescaleCe = 119,
            M32c = 120,
            Tsk3000 = 131,
            Rs08 = 132,
            Sharc = 133,
            Ecog2 = 134,
            Score7 = 135,
            Dsp24 = 136,
            Videocore3 = 137,
            Latticemico32 = 138,
            SeC17 = 139,
            TiC6000 = 140,
            TiC2000 = 141,
            TiC5500 = 142,
            TiArp32 = 143,
            TiPru = 144,
            MmdspPlus = 160,
            CypressM8c = 161,
            R32c = 162,
            Trimedia = 163,
            Qdsp6 = 164,
            I8051 = 165,
            Stxp7x = 166,
            Nds32 = 167,
            Ecog1x = 168,
            Maxq30 = 169,
            Ximo16 = 170,
            Manik = 171,
            Craynv2 = 172,
            Rx = 173,
            Metag = 174,
            McstElbrus = 175,
            Ecog16 = 176,
            Cr16 = 177,
            Etpu = 178,
            Sle9x = 179,
            L10m = 180,
            K10m = 181,
            Aarch64 = 183,
            Avr32 = 185,
            Stm8 = 186,
            Tile64 = 187,
            Tilepro = 188,
            Microblaze = 189,
            Cuda = 190,
            Tilegx = 191,
            Cloudshield = 192,
            Corea1st = 193,
            Corea2nd = 194,
            Arcv2 = 195,
            Open8 = 196,
            Rl78 = 197,
            Videocore5 = 198,
            Renesas78kor = 199,
            Freescale56800ex = 200,
            Ba1 = 201,
            Ba2 = 202,
            Xcore = 203,
            MchpPic = 204,
            Intelgt = 205,
            Intel206 = 206,
            Intel207 = 207,
            Intel208 = 208,
            Intel209 = 209,
            Km32 = 210,
            Kmx32 = 211,
            Kmx16 = 212,
            Kmx8 = 213,
            Kvarc = 214,
            Cdp = 215,
            Coge = 216,
            Cool = 217,
            Norc = 218,
            CsrKalimba = 219,
            Z80 = 220,
            Visium = 221,
            Ft32 = 222,
            Moxie = 223,
            AmdGpu = 224,
            Riscv = 243,
            Lanai = 244,
            Ceva = 245,
            CevaX2 = 246,
            Bpf = 247,
            GraphcoreIpu = 248,
            Img1 = 249,
            Nfp = 250,
            Ve = 251,
            Csky = 252,
            ArcCompact364 = 253,
            Mcs6502 = 254,
            ArcCompact3 = 255,
            Kvx = 256,
            Wdc65816 = 257,
            Loongarch = 258,
            Kf32 = 259,
            U16U8core = 260,
            Tachyum = 261,
            Nxp56800ef = 262,
            AvrOld = 4183,
            Msp430Old = 4185,
            AdaptevaEpiphany = 4643,
            Mt = 9520,
            CygnusFr30 = 13104,
            Webassembly = 16727,
            Xc16x = 18056,
            S12z = 19951,
            CygnusFrv = 21569,
            Dlx = 23205,
            CygnusD10v = 30288,
            CygnusD30v = 30326,
            Ip2kOld = 33303,
            CygnusPowerpc = 36901,
            Alpha = 36902,
            CygnusM32r = 36929,
            CygnusV850 = 36992,
            S390Old = 41872,
            XtensaOld = 43975,
            Xstormy16 = 44357,
            MicroblazeOld = 47787,
            CygnusMn10300 = 48879,
            CygnusMn10200 = 57005,
            CygnusMep = 61453,
            M32cOld = 65200,
            Iq2000 = 65210,
            Nios32 = 65211,
            MoxieOld = 65261,
        }

        public enum SymbolType
        {
            NoType = 0,
            Object = 1,
            Func = 2,
            Section = 3,
            File = 4,
            Common = 5,
            Tls = 6,
            Relc = 8,
            Srelc = 9,
            GnuIfunc = 10,
            Os11 = 11,
            Os12 = 12,
            Proc13 = 13,
            Proc14 = 14,
            Proc15 = 15,
        }

        public enum DynamicArrayTags
        {
            Null = 0,
            Needed = 1,
            Pltrelsz = 2,
            Pltgot = 3,
            Hash = 4,
            Strtab = 5,
            Symtab = 6,
            Rela = 7,
            Relasz = 8,
            Relaent = 9,
            Strsz = 10,
            Syment = 11,
            Init = 12,
            Fini = 13,
            Soname = 14,
            Rpath = 15,
            Symbolic = 16,
            Rel = 17,
            Relsz = 18,
            Relent = 19,
            Pltrel = 20,
            Debug = 21,
            Textrel = 22,
            Jmprel = 23,
            BindNow = 24,
            InitArray = 25,
            FiniArray = 26,
            InitArraysz = 27,
            FiniArraysz = 28,
            Runpath = 29,
            Flags = 30,
            PreinitArray = 32,
            PreinitArraysz = 33,
            SymtabShndx = 34,
            Relrsz = 35,
            Relr = 36,
            Relrent = 37,
            DeprecatedSparcRegister = 117440513,
            SunwAuxiliary = 1610612749,
            SunwRtldinf = 1610612750,
            SunwFilter = 1610612751,
            SunwCap = 1610612752,
            SunwSymtab = 1610612753,
            SunwSymsz = 1610612754,
            SunwSortent = 1610612755,
            SunwSymsort = 1610612756,
            SunwSymsortsz = 1610612757,
            SunwTlssort = 1610612758,
            SunwTlssortsz = 1610612759,
            SunwCapinfo = 1610612760,
            SunwStrpad = 1610612761,
            SunwCapchain = 1610612762,
            SunwLdmach = 1610612763,
            SunwSymtabShndx = 1610612764,
            SunwCapchainent = 1610612765,
            SunwDeferred = 1610612766,
            SunwCapchainsz = 1610612767,
            SunwPhname = 1610612768,
            SunwParent = 1610612769,
            SunwSxAslr = 1610612771,
            SunwRelax = 1610612773,
            SunwKmod = 1610612775,
            SunwSxNxheap = 1610612777,
            SunwSxNxstack = 1610612779,
            SunwSxAdiheap = 1610612781,
            SunwSxAdistack = 1610612783,
            SunwSxSsbd = 1610612785,
            SunwSymnsort = 1610612786,
            SunwSymnsortsz = 1610612787,
            GnuFlags1 = 1879047668,
            GnuPrelinked = 1879047669,
            GnuConflictsz = 1879047670,
            GnuLiblistsz = 1879047671,
            Checksum = 1879047672,
            Pltpadsz = 1879047673,
            Moveent = 1879047674,
            Movesz = 1879047675,
            Feature1 = 1879047676,
            Posflag1 = 1879047677,
            Syminsz = 1879047678,
            Syminent = 1879047679,
            GnuHash = 1879047925,
            TlsdescPlt = 1879047926,
            TlsdescGot = 1879047927,
            GnuConflict = 1879047928,
            GnuLiblist = 1879047929,
            Config = 1879047930,
            Depaudit = 1879047931,
            Audit = 1879047932,
            Pltpad = 1879047933,
            Movetab = 1879047934,
            Syminfo = 1879047935,
            Versym = 1879048176,
            Relacount = 1879048185,
            Relcount = 1879048186,
            Flags1 = 1879048187,
            Verdef = 1879048188,
            Verdefnum = 1879048189,
            Verneed = 1879048190,
            Verneednum = 1879048191,
            SparcRegister = 1879048193,
            Auxiliary = 2147483645,
            Used = 2147483646,
            Filter = 2147483647,
        }

        public enum Bits
        {
            B32 = 1,
            B64 = 2,
        }

        public enum PhType
        {
            NullType = 0,
            Load = 1,
            Dynamic = 2,
            Interp = 3,
            Note = 4,
            Shlib = 5,
            Phdr = 6,
            Tls = 7,
            GnuEhFrame = 1685382480,
            GnuStack = 1685382481,
            GnuRelro = 1685382482,
            GnuProperty = 1685382483,
            PaxFlags = 1694766464,
            ArmExidx = 1879048193,
        }

        public enum ObjType
        {
            NoFileType = 0,
            Relocatable = 1,
            Executable = 2,
            Shared = 3,
            Core = 4,
        }

        public enum SectionHeaderIdxSpecial
        {
            Undefined = 0,
            Before = 65280,
            After = 65281,
            Amd64Lcommon = 65282,
            SunwIgnore = 65343,
            Abs = 65521,
            Common = 65522,
            Xindex = 65535,
        }
        public Elf(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_shIdxLoOs = false;
            f_shIdxLoReserved = false;
            f_shIdxHiProc = false;
            f_shIdxLoProc = false;
            f_shIdxHiOs = false;
            f_shIdxHiReserved = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 127, 69, 76, 70 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 127, 69, 76, 70 }, Magic, M_Io, "/seq/0");
            }
            _bits = ((Bits) m_io.ReadU1());
            _endian = ((Endian) m_io.ReadU1());
            _eiVersion = m_io.ReadU1();
            if (!(EiVersion == 1))
            {
                throw new ValidationNotEqualError(1, EiVersion, M_Io, "/seq/3");
            }
            _abi = ((OsAbi) m_io.ReadU1());
            _abiVersion = m_io.ReadU1();
            _pad = m_io.ReadBytes(7);
            if (!((KaitaiStream.ByteArrayCompare(Pad, new byte[] { 0, 0, 0, 0, 0, 0, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0 }, Pad, M_Io, "/seq/6");
            }
            _header = new EndianElf(m_io, this, m_root);
        }
        public partial class EndianElf : KaitaiStruct
        {
            public static EndianElf FromFile(string fileName)
            {
                return new EndianElf(new KaitaiStream(fileName));
            }

            private bool? m_isLe;
            public EndianElf(KaitaiStream p__io, Elf p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_programHeaders = false;
                f_sectionHeaders = false;
                f_sectionNames = false;
                _read();
            }
            private void _read()
            {
                switch (M_Root.Endian) {
                case Elf.Endian.Le: {
                    m_isLe = (bool) (true);
                    break;
                }
                case Elf.Endian.Be: {
                    m_isLe = (bool) (false);
                    break;
                }
                }

                if (m_isLe == null) {
                    throw new UndecidedEndiannessError();
                } else if (m_isLe == true) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE()
            {
                _eType = ((Elf.ObjType) m_io.ReadU2le());
                _machine = ((Elf.Machine) m_io.ReadU2le());
                _eVersion = m_io.ReadU4le();
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _entryPoint = m_io.ReadU4le();
                    break;
                }
                case Elf.Bits.B64: {
                    _entryPoint = m_io.ReadU8le();
                    break;
                }
                }
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _programHeaderOffset = m_io.ReadU4le();
                    break;
                }
                case Elf.Bits.B64: {
                    _programHeaderOffset = m_io.ReadU8le();
                    break;
                }
                }
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _sectionHeaderOffset = m_io.ReadU4le();
                    break;
                }
                case Elf.Bits.B64: {
                    _sectionHeaderOffset = m_io.ReadU8le();
                    break;
                }
                }
                _flags = m_io.ReadBytes(4);
                _eEhsize = m_io.ReadU2le();
                _programHeaderEntrySize = m_io.ReadU2le();
                _qtyProgramHeader = m_io.ReadU2le();
                _sectionHeaderEntrySize = m_io.ReadU2le();
                _qtySectionHeader = m_io.ReadU2le();
                _sectionNamesIdx = m_io.ReadU2le();
            }
            private void _readBE()
            {
                _eType = ((Elf.ObjType) m_io.ReadU2be());
                _machine = ((Elf.Machine) m_io.ReadU2be());
                _eVersion = m_io.ReadU4be();
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _entryPoint = m_io.ReadU4be();
                    break;
                }
                case Elf.Bits.B64: {
                    _entryPoint = m_io.ReadU8be();
                    break;
                }
                }
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _programHeaderOffset = m_io.ReadU4be();
                    break;
                }
                case Elf.Bits.B64: {
                    _programHeaderOffset = m_io.ReadU8be();
                    break;
                }
                }
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _sectionHeaderOffset = m_io.ReadU4be();
                    break;
                }
                case Elf.Bits.B64: {
                    _sectionHeaderOffset = m_io.ReadU8be();
                    break;
                }
                }
                _flags = m_io.ReadBytes(4);
                _eEhsize = m_io.ReadU2be();
                _programHeaderEntrySize = m_io.ReadU2be();
                _qtyProgramHeader = m_io.ReadU2be();
                _sectionHeaderEntrySize = m_io.ReadU2be();
                _qtySectionHeader = m_io.ReadU2be();
                _sectionNamesIdx = m_io.ReadU2be();
            }
            public partial class NoteSection : KaitaiStruct
            {
                public static NoteSection FromFile(string fileName)
                {
                    return new NoteSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public NoteSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _entries = new List<NoteSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new NoteSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<NoteSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new NoteSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private List<NoteSectionEntry> _entries;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public List<NoteSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }
            public partial class ProgramHeader : KaitaiStruct
            {
                public static ProgramHeader FromFile(string fileName)
                {
                    return new ProgramHeader(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public ProgramHeader(KaitaiStream p__io, Elf.EndianElf p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_flagsObj = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _type = ((Elf.PhType) m_io.ReadU4le());
                    if (M_Root.Bits == Elf.Bits.B64) {
                        _flags64 = m_io.ReadU4le();
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _offset = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _offset = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _vaddr = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _vaddr = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _paddr = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _paddr = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _filesz = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _filesz = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _memsz = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _memsz = m_io.ReadU8le();
                        break;
                    }
                    }
                    if (M_Root.Bits == Elf.Bits.B32) {
                        _flags32 = m_io.ReadU4le();
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _align = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _align = m_io.ReadU8le();
                        break;
                    }
                    }
                }
                private void _readBE()
                {
                    _type = ((Elf.PhType) m_io.ReadU4be());
                    if (M_Root.Bits == Elf.Bits.B64) {
                        _flags64 = m_io.ReadU4be();
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _offset = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _offset = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _vaddr = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _vaddr = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _paddr = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _paddr = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _filesz = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _filesz = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _memsz = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _memsz = m_io.ReadU8be();
                        break;
                    }
                    }
                    if (M_Root.Bits == Elf.Bits.B32) {
                        _flags32 = m_io.ReadU4be();
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _align = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _align = m_io.ReadU8be();
                        break;
                    }
                    }
                }
                private bool f_flagsObj;
                private PhdrTypeFlags _flagsObj;
                public PhdrTypeFlags FlagsObj
                {
                    get
                    {
                        if (f_flagsObj)
                            return _flagsObj;
                        if (m_isLe == true) {
                            switch (M_Root.Bits) {
                            case Elf.Bits.B32: {
                                _flagsObj = new PhdrTypeFlags(Flags32, m_io, this, m_root);
                                break;
                            }
                            case Elf.Bits.B64: {
                                _flagsObj = new PhdrTypeFlags(Flags64, m_io, this, m_root);
                                break;
                            }
                            }
                        } else {
                            switch (M_Root.Bits) {
                            case Elf.Bits.B32: {
                                _flagsObj = new PhdrTypeFlags(Flags32, m_io, this, m_root);
                                break;
                            }
                            case Elf.Bits.B64: {
                                _flagsObj = new PhdrTypeFlags(Flags64, m_io, this, m_root);
                                break;
                            }
                            }
                        }
                        f_flagsObj = true;
                        return _flagsObj;
                    }
                }
                private PhType _type;
                private uint? _flags64;
                private ulong _offset;
                private ulong _vaddr;
                private ulong _paddr;
                private ulong _filesz;
                private ulong _memsz;
                private uint? _flags32;
                private ulong _align;
                private Elf m_root;
                private Elf.EndianElf m_parent;
                public PhType Type { get { return _type; } }
                public uint? Flags64 { get { return _flags64; } }
                public ulong Offset { get { return _offset; } }
                public ulong Vaddr { get { return _vaddr; } }
                public ulong Paddr { get { return _paddr; } }
                public ulong Filesz { get { return _filesz; } }
                public ulong Memsz { get { return _memsz; } }
                public uint? Flags32 { get { return _flags32; } }
                public ulong Align { get { return _align; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section">Source</a>
            /// </remarks>
            public partial class DynamicSectionEntry : KaitaiStruct
            {
                public static DynamicSectionEntry FromFile(string fileName)
                {
                    return new DynamicSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynamicSectionEntry(KaitaiStream p__io, Elf.EndianElf.DynamicSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_flag1Values = false;
                    f_valueStr = false;
                    f_tagEnum = false;
                    f_flagValues = false;
                    f_isValueStr = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _tag = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _tag = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _valueOrPtr = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _valueOrPtr = m_io.ReadU8le();
                        break;
                    }
                    }
                }
                private void _readBE()
                {
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _tag = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _tag = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _valueOrPtr = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _valueOrPtr = m_io.ReadU8be();
                        break;
                    }
                    }
                }
                private bool f_flag1Values;
                private DtFlag1Values _flag1Values;
                public DtFlag1Values Flag1Values
                {
                    get
                    {
                        if (f_flag1Values)
                            return _flag1Values;
                        if (TagEnum == Elf.DynamicArrayTags.Flags1) {
                            if (m_isLe == true) {
                                _flag1Values = new DtFlag1Values(ValueOrPtr, m_io, this, m_root);
                            } else {
                                _flag1Values = new DtFlag1Values(ValueOrPtr, m_io, this, m_root);
                            }
                            f_flag1Values = true;
                        }
                        return _flag1Values;
                    }
                }
                private bool f_valueStr;
                private string _valueStr;
                public string ValueStr
                {
                    get
                    {
                        if (f_valueStr)
                            return _valueStr;
                        if ( ((IsValueStr) && (M_Parent.IsStringTableLinked)) ) {
                            KaitaiStream io = ((Elf.EndianElf.StringsStruct) (M_Parent.M_Parent.LinkedSection.Body)).M_Io;
                            long _pos = io.Pos;
                            io.Seek(ValueOrPtr);
                            if (m_isLe == true) {
                                _valueStr = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                            } else {
                                _valueStr = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                            }
                            io.Seek(_pos);
                            f_valueStr = true;
                        }
                        return _valueStr;
                    }
                }
                private bool f_tagEnum;
                private DynamicArrayTags _tagEnum;
                public DynamicArrayTags TagEnum
                {
                    get
                    {
                        if (f_tagEnum)
                            return _tagEnum;
                        _tagEnum = (DynamicArrayTags) (((Elf.DynamicArrayTags) Tag));
                        f_tagEnum = true;
                        return _tagEnum;
                    }
                }
                private bool f_flagValues;
                private DtFlagValues _flagValues;
                public DtFlagValues FlagValues
                {
                    get
                    {
                        if (f_flagValues)
                            return _flagValues;
                        if (TagEnum == Elf.DynamicArrayTags.Flags) {
                            if (m_isLe == true) {
                                _flagValues = new DtFlagValues(ValueOrPtr, m_io, this, m_root);
                            } else {
                                _flagValues = new DtFlagValues(ValueOrPtr, m_io, this, m_root);
                            }
                            f_flagValues = true;
                        }
                        return _flagValues;
                    }
                }
                private bool f_isValueStr;
                private bool _isValueStr;
                public bool IsValueStr
                {
                    get
                    {
                        if (f_isValueStr)
                            return _isValueStr;
                        _isValueStr = (bool) ( ((ValueOrPtr != 0) && ( ((TagEnum == Elf.DynamicArrayTags.Needed) || (TagEnum == Elf.DynamicArrayTags.Soname) || (TagEnum == Elf.DynamicArrayTags.Rpath) || (TagEnum == Elf.DynamicArrayTags.Runpath) || (TagEnum == Elf.DynamicArrayTags.SunwAuxiliary) || (TagEnum == Elf.DynamicArrayTags.SunwFilter) || (TagEnum == Elf.DynamicArrayTags.Auxiliary) || (TagEnum == Elf.DynamicArrayTags.Filter) || (TagEnum == Elf.DynamicArrayTags.Config) || (TagEnum == Elf.DynamicArrayTags.Depaudit) || (TagEnum == Elf.DynamicArrayTags.Audit)) )) );
                        f_isValueStr = true;
                        return _isValueStr;
                    }
                }
                private ulong _tag;
                private ulong _valueOrPtr;
                private Elf m_root;
                private Elf.EndianElf.DynamicSection m_parent;
                public ulong Tag { get { return _tag; } }
                public ulong ValueOrPtr { get { return _valueOrPtr; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.DynamicSection M_Parent { get { return m_parent; } }
            }
            public partial class SectionHeader : KaitaiStruct
            {
                public static SectionHeader FromFile(string fileName)
                {
                    return new SectionHeader(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public SectionHeader(KaitaiStream p__io, Elf.EndianElf p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_body = false;
                    f_linkedSection = false;
                    f_name = false;
                    f_flagsObj = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _ofsName = m_io.ReadU4le();
                    _type = ((Elf.ShType) m_io.ReadU4le());
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _flags = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _flags = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _addr = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _addr = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _ofsBody = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _ofsBody = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _lenBody = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _lenBody = m_io.ReadU8le();
                        break;
                    }
                    }
                    _linkedSectionIdx = m_io.ReadU4le();
                    _info = m_io.ReadBytes(4);
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _align = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _align = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _entrySize = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _entrySize = m_io.ReadU8le();
                        break;
                    }
                    }
                }
                private void _readBE()
                {
                    _ofsName = m_io.ReadU4be();
                    _type = ((Elf.ShType) m_io.ReadU4be());
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _flags = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _flags = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _addr = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _addr = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _ofsBody = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _ofsBody = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _lenBody = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _lenBody = m_io.ReadU8be();
                        break;
                    }
                    }
                    _linkedSectionIdx = m_io.ReadU4be();
                    _info = m_io.ReadBytes(4);
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _align = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _align = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _entrySize = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _entrySize = m_io.ReadU8be();
                        break;
                    }
                    }
                }
                private bool f_body;
                private object _body;
                public object Body
                {
                    get
                    {
                        if (f_body)
                            return _body;
                        if (Type != Elf.ShType.Nobits) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsBody);
                            if (m_isLe == true) {
                                switch (Type) {
                                case Elf.ShType.Rel: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(false, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Note: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new NoteSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Symtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Strtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new StringsStruct(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Dynamic: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynamicSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Dynsym: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Rela: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(true, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                default: {
                                    _body = io.ReadBytes(LenBody);
                                    break;
                                }
                                }
                            } else {
                                switch (Type) {
                                case Elf.ShType.Rel: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(false, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Note: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new NoteSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Symtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Strtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new StringsStruct(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Dynamic: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynamicSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Dynsym: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Rela: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(true, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                default: {
                                    _body = io.ReadBytes(LenBody);
                                    break;
                                }
                                }
                            }
                            io.Seek(_pos);
                            f_body = true;
                        }
                        return _body;
                    }
                }
                private bool f_linkedSection;
                private SectionHeader _linkedSection;

                /// <summary>
                /// may reference a later section header, so don't try to access too early (use only lazy `instances`)
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link">Source</a>
                /// </remarks>
                public SectionHeader LinkedSection
                {
                    get
                    {
                        if (f_linkedSection)
                            return _linkedSection;
                        if ( ((LinkedSectionIdx != Elf.SectionHeaderIdxSpecial.Undefined) && (LinkedSectionIdx < M_Root.Header.QtySectionHeader)) ) {
                            _linkedSection = (SectionHeader) (M_Root.Header.SectionHeaders[LinkedSectionIdx]);
                        }
                        f_linkedSection = true;
                        return _linkedSection;
                    }
                }
                private bool f_name;
                private string _name;
                public string Name
                {
                    get
                    {
                        if (f_name)
                            return _name;
                        KaitaiStream io = M_Root.Header.SectionNames.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsName);
                        if (m_isLe == true) {
                            _name = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                        } else {
                            _name = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                        }
                        io.Seek(_pos);
                        f_name = true;
                        return _name;
                    }
                }
                private bool f_flagsObj;
                private SectionHeaderFlags _flagsObj;
                public SectionHeaderFlags FlagsObj
                {
                    get
                    {
                        if (f_flagsObj)
                            return _flagsObj;
                        if (m_isLe == true) {
                            _flagsObj = new SectionHeaderFlags(Flags, m_io, this, m_root);
                        } else {
                            _flagsObj = new SectionHeaderFlags(Flags, m_io, this, m_root);
                        }
                        f_flagsObj = true;
                        return _flagsObj;
                    }
                }
                private uint _ofsName;
                private ShType _type;
                private ulong _flags;
                private ulong _addr;
                private ulong _ofsBody;
                private ulong _lenBody;
                private uint _linkedSectionIdx;
                private byte[] _info;
                private ulong _align;
                private ulong _entrySize;
                private Elf m_root;
                private Elf.EndianElf m_parent;
                private byte[] __raw_body;
                public uint OfsName { get { return _ofsName; } }
                public ShType Type { get { return _type; } }
                public ulong Flags { get { return _flags; } }
                public ulong Addr { get { return _addr; } }
                public ulong OfsBody { get { return _ofsBody; } }
                public ulong LenBody { get { return _lenBody; } }
                public uint LinkedSectionIdx { get { return _linkedSectionIdx; } }
                public byte[] Info { get { return _info; } }
                public ulong Align { get { return _align; } }
                public ulong EntrySize { get { return _entrySize; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf M_Parent { get { return m_parent; } }
                public byte[] M_RawBody { get { return __raw_body; } }
            }

            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html">Source</a>
            /// </remarks>
            public partial class RelocationSection : KaitaiStruct
            {
                private bool? m_isLe;
                public RelocationSection(bool p_hasAddend, KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _hasAddend = p_hasAddend;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _entries = new List<RelocationSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new RelocationSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<RelocationSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new RelocationSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private List<RelocationSectionEntry> _entries;
                private bool _hasAddend;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public List<RelocationSectionEntry> Entries { get { return _entries; } }
                public bool HasAddend { get { return _hasAddend; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }
            public partial class DynamicSection : KaitaiStruct
            {
                public static DynamicSection FromFile(string fileName)
                {
                    return new DynamicSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynamicSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_isStringTableLinked = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _entries = new List<DynamicSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new DynamicSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<DynamicSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new DynamicSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private bool f_isStringTableLinked;
                private bool _isStringTableLinked;
                public bool IsStringTableLinked
                {
                    get
                    {
                        if (f_isStringTableLinked)
                            return _isStringTableLinked;
                        _isStringTableLinked = (bool) (M_Parent.LinkedSection.Type == Elf.ShType.Strtab);
                        f_isStringTableLinked = true;
                        return _isStringTableLinked;
                    }
                }
                private List<DynamicSectionEntry> _entries;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public List<DynamicSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }
            public partial class DynsymSection : KaitaiStruct
            {
                public static DynsymSection FromFile(string fileName)
                {
                    return new DynsymSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynsymSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_isStringTableLinked = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _entries = new List<DynsymSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new DynsymSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<DynsymSectionEntry>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new DynsymSectionEntry(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private bool f_isStringTableLinked;
                private bool _isStringTableLinked;
                public bool IsStringTableLinked
                {
                    get
                    {
                        if (f_isStringTableLinked)
                            return _isStringTableLinked;
                        _isStringTableLinked = (bool) (M_Parent.LinkedSection.Type == Elf.ShType.Strtab);
                        f_isStringTableLinked = true;
                        return _isStringTableLinked;
                    }
                }
                private List<DynsymSectionEntry> _entries;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public List<DynsymSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }
            public partial class RelocationSectionEntry : KaitaiStruct
            {
                public static RelocationSectionEntry FromFile(string fileName)
                {
                    return new RelocationSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public RelocationSectionEntry(KaitaiStream p__io, Elf.EndianElf.RelocationSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _offset = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _offset = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _info = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _info = m_io.ReadU8le();
                        break;
                    }
                    }
                    if (M_Parent.HasAddend) {
                        switch (M_Root.Bits) {
                        case Elf.Bits.B32: {
                            _addend = m_io.ReadS4le();
                            break;
                        }
                        case Elf.Bits.B64: {
                            _addend = m_io.ReadS8le();
                            break;
                        }
                        }
                    }
                }
                private void _readBE()
                {
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _offset = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _offset = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _info = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _info = m_io.ReadU8be();
                        break;
                    }
                    }
                    if (M_Parent.HasAddend) {
                        switch (M_Root.Bits) {
                        case Elf.Bits.B32: {
                            _addend = m_io.ReadS4be();
                            break;
                        }
                        case Elf.Bits.B64: {
                            _addend = m_io.ReadS8be();
                            break;
                        }
                        }
                    }
                }
                private ulong _offset;
                private ulong _info;
                private long _addend;
                private Elf m_root;
                private Elf.EndianElf.RelocationSection m_parent;
                public ulong Offset { get { return _offset; } }
                public ulong Info { get { return _info; } }
                public long Addend { get { return _addend; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.RelocationSection M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html">Source</a>
            /// </remarks>
            public partial class DynsymSectionEntry : KaitaiStruct
            {
                public static DynsymSectionEntry FromFile(string fileName)
                {
                    return new DynsymSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynsymSectionEntry(KaitaiStream p__io, Elf.EndianElf.DynsymSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_isShIdxReserved = false;
                    f_isShIdxOs = false;
                    f_isShIdxProc = false;
                    f_size = false;
                    f_visibility = false;
                    f_value = false;
                    f_name = false;
                    f_shIdxSpecial = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _ofsName = m_io.ReadU4le();
                    if (M_Root.Bits == Elf.Bits.B32) {
                        _valueB32 = m_io.ReadU4le();
                    }
                    if (M_Root.Bits == Elf.Bits.B32) {
                        _sizeB32 = m_io.ReadU4le();
                    }
                    _bind = ((Elf.SymbolBinding) m_io.ReadBitsIntBe(4));
                    _type = ((Elf.SymbolType) m_io.ReadBitsIntBe(4));
                    m_io.AlignToByte();
                    _other = m_io.ReadU1();
                    _shIdx = m_io.ReadU2le();
                    if (M_Root.Bits == Elf.Bits.B64) {
                        _valueB64 = m_io.ReadU8le();
                    }
                    if (M_Root.Bits == Elf.Bits.B64) {
                        _sizeB64 = m_io.ReadU8le();
                    }
                }
                private void _readBE()
                {
                    _ofsName = m_io.ReadU4be();
                    if (M_Root.Bits == Elf.Bits.B32) {
                        _valueB32 = m_io.ReadU4be();
                    }
                    if (M_Root.Bits == Elf.Bits.B32) {
                        _sizeB32 = m_io.ReadU4be();
                    }
                    _bind = ((Elf.SymbolBinding) m_io.ReadBitsIntBe(4));
                    _type = ((Elf.SymbolType) m_io.ReadBitsIntBe(4));
                    m_io.AlignToByte();
                    _other = m_io.ReadU1();
                    _shIdx = m_io.ReadU2be();
                    if (M_Root.Bits == Elf.Bits.B64) {
                        _valueB64 = m_io.ReadU8be();
                    }
                    if (M_Root.Bits == Elf.Bits.B64) {
                        _sizeB64 = m_io.ReadU8be();
                    }
                }
                private bool f_isShIdxReserved;
                private bool _isShIdxReserved;
                public bool IsShIdxReserved
                {
                    get
                    {
                        if (f_isShIdxReserved)
                            return _isShIdxReserved;
                        _isShIdxReserved = (bool) ( ((ShIdx >= M_Root.ShIdxLoReserved) && (ShIdx <= M_Root.ShIdxHiReserved)) );
                        f_isShIdxReserved = true;
                        return _isShIdxReserved;
                    }
                }
                private bool f_isShIdxOs;
                private bool _isShIdxOs;
                public bool IsShIdxOs
                {
                    get
                    {
                        if (f_isShIdxOs)
                            return _isShIdxOs;
                        _isShIdxOs = (bool) ( ((ShIdx >= M_Root.ShIdxLoOs) && (ShIdx <= M_Root.ShIdxHiOs)) );
                        f_isShIdxOs = true;
                        return _isShIdxOs;
                    }
                }
                private bool f_isShIdxProc;
                private bool _isShIdxProc;
                public bool IsShIdxProc
                {
                    get
                    {
                        if (f_isShIdxProc)
                            return _isShIdxProc;
                        _isShIdxProc = (bool) ( ((ShIdx >= M_Root.ShIdxLoProc) && (ShIdx <= M_Root.ShIdxHiProc)) );
                        f_isShIdxProc = true;
                        return _isShIdxProc;
                    }
                }
                private bool f_size;
                private ulong _size;
                public ulong Size
                {
                    get
                    {
                        if (f_size)
                            return _size;
                        _size = (ulong) ((M_Root.Bits == Elf.Bits.B32 ? SizeB32 : (M_Root.Bits == Elf.Bits.B64 ? SizeB64 : 0)));
                        f_size = true;
                        return _size;
                    }
                }
                private bool f_visibility;
                private SymbolVisibility _visibility;
                public SymbolVisibility Visibility
                {
                    get
                    {
                        if (f_visibility)
                            return _visibility;
                        _visibility = (SymbolVisibility) (((Elf.SymbolVisibility) (Other & 3)));
                        f_visibility = true;
                        return _visibility;
                    }
                }
                private bool f_value;
                private ulong _value;
                public ulong Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        _value = (ulong) ((M_Root.Bits == Elf.Bits.B32 ? ValueB32 : (M_Root.Bits == Elf.Bits.B64 ? ValueB64 : 0)));
                        f_value = true;
                        return _value;
                    }
                }
                private bool f_name;
                private string _name;
                public string Name
                {
                    get
                    {
                        if (f_name)
                            return _name;
                        if ( ((OfsName != 0) && (M_Parent.IsStringTableLinked)) ) {
                            KaitaiStream io = ((Elf.EndianElf.StringsStruct) (M_Parent.M_Parent.LinkedSection.Body)).M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsName);
                            if (m_isLe == true) {
                                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            } else {
                                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            }
                            io.Seek(_pos);
                            f_name = true;
                        }
                        return _name;
                    }
                }
                private bool f_shIdxSpecial;
                private SectionHeaderIdxSpecial _shIdxSpecial;
                public SectionHeaderIdxSpecial ShIdxSpecial
                {
                    get
                    {
                        if (f_shIdxSpecial)
                            return _shIdxSpecial;
                        _shIdxSpecial = (SectionHeaderIdxSpecial) (((Elf.SectionHeaderIdxSpecial) ShIdx));
                        f_shIdxSpecial = true;
                        return _shIdxSpecial;
                    }
                }
                private uint _ofsName;
                private uint? _valueB32;
                private uint? _sizeB32;
                private SymbolBinding _bind;
                private SymbolType _type;
                private byte _other;
                private ushort _shIdx;
                private ulong? _valueB64;
                private ulong? _sizeB64;
                private Elf m_root;
                private Elf.EndianElf.DynsymSection m_parent;
                public uint OfsName { get { return _ofsName; } }
                public uint? ValueB32 { get { return _valueB32; } }
                public uint? SizeB32 { get { return _sizeB32; } }
                public SymbolBinding Bind { get { return _bind; } }
                public SymbolType Type { get { return _type; } }

                /// <summary>
                /// don't read this field, access `visibility` instead
                /// </summary>
                public byte Other { get { return _other; } }

                /// <summary>
                /// section header index
                /// </summary>
                public ushort ShIdx { get { return _shIdx; } }
                public ulong? ValueB64 { get { return _valueB64; } }
                public ulong? SizeB64 { get { return _sizeB64; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.DynsymSection M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section">Source</a>
            /// </remarks>
            public partial class NoteSectionEntry : KaitaiStruct
            {
                public static NoteSectionEntry FromFile(string fileName)
                {
                    return new NoteSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public NoteSectionEntry(KaitaiStream p__io, Elf.EndianElf.NoteSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _lenName = m_io.ReadU4le();
                    _lenDescriptor = m_io.ReadU4le();
                    _type = m_io.ReadU4le();
                    _name = KaitaiStream.BytesTerminate(m_io.ReadBytes(LenName), 0, false);
                    _namePadding = m_io.ReadBytes(KaitaiStream.Mod(-(LenName), 4));
                    _descriptor = m_io.ReadBytes(LenDescriptor);
                    _descriptorPadding = m_io.ReadBytes(KaitaiStream.Mod(-(LenDescriptor), 4));
                }
                private void _readBE()
                {
                    _lenName = m_io.ReadU4be();
                    _lenDescriptor = m_io.ReadU4be();
                    _type = m_io.ReadU4be();
                    _name = KaitaiStream.BytesTerminate(m_io.ReadBytes(LenName), 0, false);
                    _namePadding = m_io.ReadBytes(KaitaiStream.Mod(-(LenName), 4));
                    _descriptor = m_io.ReadBytes(LenDescriptor);
                    _descriptorPadding = m_io.ReadBytes(KaitaiStream.Mod(-(LenDescriptor), 4));
                }
                private uint _lenName;
                private uint _lenDescriptor;
                private uint _type;
                private byte[] _name;
                private byte[] _namePadding;
                private byte[] _descriptor;
                private byte[] _descriptorPadding;
                private Elf m_root;
                private Elf.EndianElf.NoteSection m_parent;
                public uint LenName { get { return _lenName; } }
                public uint LenDescriptor { get { return _lenDescriptor; } }
                public uint Type { get { return _type; } }

                /// <summary>
                /// Although the ELF specification seems to hint that the `note_name` field
                /// is ASCII this isn't the case for Linux binaries that have a
                /// `.gnu.build.attributes` section.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes">Source</a>
                /// </remarks>
                public byte[] Name { get { return _name; } }
                public byte[] NamePadding { get { return _namePadding; } }
                public byte[] Descriptor { get { return _descriptor; } }
                public byte[] DescriptorPadding { get { return _descriptorPadding; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.NoteSection M_Parent { get { return m_parent; } }
            }
            public partial class StringsStruct : KaitaiStruct
            {
                public static StringsStruct FromFile(string fileName)
                {
                    return new StringsStruct(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public StringsStruct(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _entries = new List<string>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<string>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                            i++;
                        }
                    }
                }
                private List<string> _entries;
                private Elf m_root;
                private KaitaiStruct m_parent;
                public List<string> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            private bool f_programHeaders;
            private List<ProgramHeader> _programHeaders;
            public List<ProgramHeader> ProgramHeaders
            {
                get
                {
                    if (f_programHeaders)
                        return _programHeaders;
                    long _pos = m_io.Pos;
                    m_io.Seek(ProgramHeaderOffset);
                    if (m_isLe == true) {
                        __raw_programHeaders = new List<byte[]>();
                        _programHeaders = new List<ProgramHeader>();
                        for (var i = 0; i < QtyProgramHeader; i++)
                        {
                            __raw_programHeaders.Add(m_io.ReadBytes(ProgramHeaderEntrySize));
                            var io___raw_programHeaders = new KaitaiStream(__raw_programHeaders[__raw_programHeaders.Count - 1]);
                            _programHeaders.Add(new ProgramHeader(io___raw_programHeaders, this, m_root, m_isLe));
                        }
                    } else {
                        __raw_programHeaders = new List<byte[]>();
                        _programHeaders = new List<ProgramHeader>();
                        for (var i = 0; i < QtyProgramHeader; i++)
                        {
                            __raw_programHeaders.Add(m_io.ReadBytes(ProgramHeaderEntrySize));
                            var io___raw_programHeaders = new KaitaiStream(__raw_programHeaders[__raw_programHeaders.Count - 1]);
                            _programHeaders.Add(new ProgramHeader(io___raw_programHeaders, this, m_root, m_isLe));
                        }
                    }
                    m_io.Seek(_pos);
                    f_programHeaders = true;
                    return _programHeaders;
                }
            }
            private bool f_sectionHeaders;
            private List<SectionHeader> _sectionHeaders;
            public List<SectionHeader> SectionHeaders
            {
                get
                {
                    if (f_sectionHeaders)
                        return _sectionHeaders;
                    long _pos = m_io.Pos;
                    m_io.Seek(SectionHeaderOffset);
                    if (m_isLe == true) {
                        __raw_sectionHeaders = new List<byte[]>();
                        _sectionHeaders = new List<SectionHeader>();
                        for (var i = 0; i < QtySectionHeader; i++)
                        {
                            __raw_sectionHeaders.Add(m_io.ReadBytes(SectionHeaderEntrySize));
                            var io___raw_sectionHeaders = new KaitaiStream(__raw_sectionHeaders[__raw_sectionHeaders.Count - 1]);
                            _sectionHeaders.Add(new SectionHeader(io___raw_sectionHeaders, this, m_root, m_isLe));
                        }
                    } else {
                        __raw_sectionHeaders = new List<byte[]>();
                        _sectionHeaders = new List<SectionHeader>();
                        for (var i = 0; i < QtySectionHeader; i++)
                        {
                            __raw_sectionHeaders.Add(m_io.ReadBytes(SectionHeaderEntrySize));
                            var io___raw_sectionHeaders = new KaitaiStream(__raw_sectionHeaders[__raw_sectionHeaders.Count - 1]);
                            _sectionHeaders.Add(new SectionHeader(io___raw_sectionHeaders, this, m_root, m_isLe));
                        }
                    }
                    m_io.Seek(_pos);
                    f_sectionHeaders = true;
                    return _sectionHeaders;
                }
            }
            private bool f_sectionNames;
            private StringsStruct _sectionNames;
            public StringsStruct SectionNames
            {
                get
                {
                    if (f_sectionNames)
                        return _sectionNames;
                    if ( ((SectionNamesIdx != Elf.SectionHeaderIdxSpecial.Undefined) && (SectionNamesIdx < M_Root.Header.QtySectionHeader)) ) {
                        long _pos = m_io.Pos;
                        m_io.Seek(SectionHeaders[SectionNamesIdx].OfsBody);
                        if (m_isLe == true) {
                            __raw_sectionNames = m_io.ReadBytes(SectionHeaders[SectionNamesIdx].LenBody);
                            var io___raw_sectionNames = new KaitaiStream(__raw_sectionNames);
                            _sectionNames = new StringsStruct(io___raw_sectionNames, this, m_root, m_isLe);
                        } else {
                            __raw_sectionNames = m_io.ReadBytes(SectionHeaders[SectionNamesIdx].LenBody);
                            var io___raw_sectionNames = new KaitaiStream(__raw_sectionNames);
                            _sectionNames = new StringsStruct(io___raw_sectionNames, this, m_root, m_isLe);
                        }
                        m_io.Seek(_pos);
                        f_sectionNames = true;
                    }
                    return _sectionNames;
                }
            }
            private ObjType _eType;
            private Machine _machine;
            private uint _eVersion;
            private ulong _entryPoint;
            private ulong _programHeaderOffset;
            private ulong _sectionHeaderOffset;
            private byte[] _flags;
            private ushort _eEhsize;
            private ushort _programHeaderEntrySize;
            private ushort _qtyProgramHeader;
            private ushort _sectionHeaderEntrySize;
            private ushort _qtySectionHeader;
            private ushort _sectionNamesIdx;
            private Elf m_root;
            private Elf m_parent;
            private List<byte[]> __raw_programHeaders;
            private List<byte[]> __raw_sectionHeaders;
            private byte[] __raw_sectionNames;
            public ObjType EType { get { return _eType; } }
            public Machine Machine { get { return _machine; } }
            public uint EVersion { get { return _eVersion; } }
            public ulong EntryPoint { get { return _entryPoint; } }
            public ulong ProgramHeaderOffset { get { return _programHeaderOffset; } }
            public ulong SectionHeaderOffset { get { return _sectionHeaderOffset; } }
            public byte[] Flags { get { return _flags; } }
            public ushort EEhsize { get { return _eEhsize; } }
            public ushort ProgramHeaderEntrySize { get { return _programHeaderEntrySize; } }
            public ushort QtyProgramHeader { get { return _qtyProgramHeader; } }
            public ushort SectionHeaderEntrySize { get { return _sectionHeaderEntrySize; } }
            public ushort QtySectionHeader { get { return _qtySectionHeader; } }
            public ushort SectionNamesIdx { get { return _sectionNamesIdx; } }
            public Elf M_Root { get { return m_root; } }
            public Elf M_Parent { get { return m_parent; } }
            public List<byte[]> M_RawProgramHeaders { get { return __raw_programHeaders; } }
            public List<byte[]> M_RawSectionHeaders { get { return __raw_sectionHeaders; } }
            public byte[] M_RawSectionNames { get { return __raw_sectionNames; } }
        }
        public partial class DtFlag1Values : KaitaiStruct
        {
            public DtFlag1Values(uint p_value, KaitaiStream p__io, Elf.EndianElf.DynamicSectionEntry p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_singleton = false;
                f_ignmuldef = false;
                f_loadfltr = false;
                f_initfirst = false;
                f_symintpose = false;
                f_noreloc = false;
                f_confalt = false;
                f_dispreldne = false;
                f_rtldGlobal = false;
                f_nodelete = false;
                f_trans = false;
                f_origin = false;
                f_now = false;
                f_nohdr = false;
                f_endfiltee = false;
                f_nodirect = false;
                f_globaudit = false;
                f_noksyms = false;
                f_interpose = false;
                f_nodump = false;
                f_disprelpnd = false;
                f_noopen = false;
                f_stub = false;
                f_direct = false;
                f_edited = false;
                f_group = false;
                f_pie = false;
                f_nodeflib = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_singleton;
            private bool _singleton;

            /// <summary>
            /// Singleton symbols are used.
            /// </summary>
            public bool Singleton
            {
                get
                {
                    if (f_singleton)
                        return _singleton;
                    _singleton = (bool) ((Value & 33554432) != 0);
                    f_singleton = true;
                    return _singleton;
                }
            }
            private bool f_ignmuldef;
            private bool _ignmuldef;
            public bool Ignmuldef
            {
                get
                {
                    if (f_ignmuldef)
                        return _ignmuldef;
                    _ignmuldef = (bool) ((Value & 262144) != 0);
                    f_ignmuldef = true;
                    return _ignmuldef;
                }
            }
            private bool f_loadfltr;
            private bool _loadfltr;

            /// <summary>
            /// Trigger filtee loading at runtime.
            /// </summary>
            public bool Loadfltr
            {
                get
                {
                    if (f_loadfltr)
                        return _loadfltr;
                    _loadfltr = (bool) ((Value & 16) != 0);
                    f_loadfltr = true;
                    return _loadfltr;
                }
            }
            private bool f_initfirst;
            private bool _initfirst;

            /// <summary>
            /// Set RTLD_INITFIRST for this object
            /// </summary>
            public bool Initfirst
            {
                get
                {
                    if (f_initfirst)
                        return _initfirst;
                    _initfirst = (bool) ((Value & 32) != 0);
                    f_initfirst = true;
                    return _initfirst;
                }
            }
            private bool f_symintpose;
            private bool _symintpose;

            /// <summary>
            /// Object has individual interposers.
            /// </summary>
            public bool Symintpose
            {
                get
                {
                    if (f_symintpose)
                        return _symintpose;
                    _symintpose = (bool) ((Value & 8388608) != 0);
                    f_symintpose = true;
                    return _symintpose;
                }
            }
            private bool f_noreloc;
            private bool _noreloc;
            public bool Noreloc
            {
                get
                {
                    if (f_noreloc)
                        return _noreloc;
                    _noreloc = (bool) ((Value & 4194304) != 0);
                    f_noreloc = true;
                    return _noreloc;
                }
            }
            private bool f_confalt;
            private bool _confalt;

            /// <summary>
            /// Configuration alternative created.
            /// </summary>
            public bool Confalt
            {
                get
                {
                    if (f_confalt)
                        return _confalt;
                    _confalt = (bool) ((Value & 8192) != 0);
                    f_confalt = true;
                    return _confalt;
                }
            }
            private bool f_dispreldne;
            private bool _dispreldne;

            /// <summary>
            /// Disp reloc applied at build time.
            /// </summary>
            public bool Dispreldne
            {
                get
                {
                    if (f_dispreldne)
                        return _dispreldne;
                    _dispreldne = (bool) ((Value & 32768) != 0);
                    f_dispreldne = true;
                    return _dispreldne;
                }
            }
            private bool f_rtldGlobal;
            private bool _rtldGlobal;

            /// <summary>
            /// Set RTLD_GLOBAL for this object.
            /// </summary>
            public bool RtldGlobal
            {
                get
                {
                    if (f_rtldGlobal)
                        return _rtldGlobal;
                    _rtldGlobal = (bool) ((Value & 2) != 0);
                    f_rtldGlobal = true;
                    return _rtldGlobal;
                }
            }
            private bool f_nodelete;
            private bool _nodelete;

            /// <summary>
            /// Set RTLD_NODELETE for this object.
            /// </summary>
            public bool Nodelete
            {
                get
                {
                    if (f_nodelete)
                        return _nodelete;
                    _nodelete = (bool) ((Value & 8) != 0);
                    f_nodelete = true;
                    return _nodelete;
                }
            }
            private bool f_trans;
            private bool _trans;
            public bool Trans
            {
                get
                {
                    if (f_trans)
                        return _trans;
                    _trans = (bool) ((Value & 512) != 0);
                    f_trans = true;
                    return _trans;
                }
            }
            private bool f_origin;
            private bool _origin;

            /// <summary>
            /// $ORIGIN must be handled.
            /// </summary>
            public bool Origin
            {
                get
                {
                    if (f_origin)
                        return _origin;
                    _origin = (bool) ((Value & 128) != 0);
                    f_origin = true;
                    return _origin;
                }
            }
            private bool f_now;
            private bool _now;

            /// <summary>
            /// Set RTLD_NOW for this object.
            /// </summary>
            public bool Now
            {
                get
                {
                    if (f_now)
                        return _now;
                    _now = (bool) ((Value & 1) != 0);
                    f_now = true;
                    return _now;
                }
            }
            private bool f_nohdr;
            private bool _nohdr;
            public bool Nohdr
            {
                get
                {
                    if (f_nohdr)
                        return _nohdr;
                    _nohdr = (bool) ((Value & 1048576) != 0);
                    f_nohdr = true;
                    return _nohdr;
                }
            }
            private bool f_endfiltee;
            private bool _endfiltee;

            /// <summary>
            /// Filtee terminates filters search.
            /// </summary>
            public bool Endfiltee
            {
                get
                {
                    if (f_endfiltee)
                        return _endfiltee;
                    _endfiltee = (bool) ((Value & 16384) != 0);
                    f_endfiltee = true;
                    return _endfiltee;
                }
            }
            private bool f_nodirect;
            private bool _nodirect;

            /// <summary>
            /// Object has no-direct binding.
            /// </summary>
            public bool Nodirect
            {
                get
                {
                    if (f_nodirect)
                        return _nodirect;
                    _nodirect = (bool) ((Value & 131072) != 0);
                    f_nodirect = true;
                    return _nodirect;
                }
            }
            private bool f_globaudit;
            private bool _globaudit;

            /// <summary>
            /// Global auditing required.
            /// </summary>
            public bool Globaudit
            {
                get
                {
                    if (f_globaudit)
                        return _globaudit;
                    _globaudit = (bool) ((Value & 16777216) != 0);
                    f_globaudit = true;
                    return _globaudit;
                }
            }
            private bool f_noksyms;
            private bool _noksyms;
            public bool Noksyms
            {
                get
                {
                    if (f_noksyms)
                        return _noksyms;
                    _noksyms = (bool) ((Value & 524288) != 0);
                    f_noksyms = true;
                    return _noksyms;
                }
            }
            private bool f_interpose;
            private bool _interpose;

            /// <summary>
            /// Object is used to interpose.
            /// </summary>
            public bool Interpose
            {
                get
                {
                    if (f_interpose)
                        return _interpose;
                    _interpose = (bool) ((Value & 1024) != 0);
                    f_interpose = true;
                    return _interpose;
                }
            }
            private bool f_nodump;
            private bool _nodump;

            /// <summary>
            /// Object can't be dldump'ed.
            /// </summary>
            public bool Nodump
            {
                get
                {
                    if (f_nodump)
                        return _nodump;
                    _nodump = (bool) ((Value & 4096) != 0);
                    f_nodump = true;
                    return _nodump;
                }
            }
            private bool f_disprelpnd;
            private bool _disprelpnd;

            /// <summary>
            /// Disp reloc applied at run-time.
            /// </summary>
            public bool Disprelpnd
            {
                get
                {
                    if (f_disprelpnd)
                        return _disprelpnd;
                    _disprelpnd = (bool) ((Value & 65536) != 0);
                    f_disprelpnd = true;
                    return _disprelpnd;
                }
            }
            private bool f_noopen;
            private bool _noopen;

            /// <summary>
            /// Set RTLD_NOOPEN for this object.
            /// </summary>
            public bool Noopen
            {
                get
                {
                    if (f_noopen)
                        return _noopen;
                    _noopen = (bool) ((Value & 64) != 0);
                    f_noopen = true;
                    return _noopen;
                }
            }
            private bool f_stub;
            private bool _stub;
            public bool Stub
            {
                get
                {
                    if (f_stub)
                        return _stub;
                    _stub = (bool) ((Value & 67108864) != 0);
                    f_stub = true;
                    return _stub;
                }
            }
            private bool f_direct;
            private bool _direct;

            /// <summary>
            /// Direct binding enabled.
            /// </summary>
            public bool Direct
            {
                get
                {
                    if (f_direct)
                        return _direct;
                    _direct = (bool) ((Value & 256) != 0);
                    f_direct = true;
                    return _direct;
                }
            }
            private bool f_edited;
            private bool _edited;

            /// <summary>
            /// Object is modified after built.
            /// </summary>
            public bool Edited
            {
                get
                {
                    if (f_edited)
                        return _edited;
                    _edited = (bool) ((Value & 2097152) != 0);
                    f_edited = true;
                    return _edited;
                }
            }
            private bool f_group;
            private bool _group;

            /// <summary>
            /// Set RTLD_GROUP for this object.
            /// </summary>
            public bool Group
            {
                get
                {
                    if (f_group)
                        return _group;
                    _group = (bool) ((Value & 4) != 0);
                    f_group = true;
                    return _group;
                }
            }
            private bool f_pie;
            private bool _pie;
            public bool Pie
            {
                get
                {
                    if (f_pie)
                        return _pie;
                    _pie = (bool) ((Value & 134217728) != 0);
                    f_pie = true;
                    return _pie;
                }
            }
            private bool f_nodeflib;
            private bool _nodeflib;

            /// <summary>
            /// Ignore default lib search path.
            /// </summary>
            public bool Nodeflib
            {
                get
                {
                    if (f_nodeflib)
                        return _nodeflib;
                    _nodeflib = (bool) ((Value & 2048) != 0);
                    f_nodeflib = true;
                    return _nodeflib;
                }
            }
            private uint _value;
            private Elf m_root;
            private Elf.EndianElf.DynamicSectionEntry m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public Elf.EndianElf.DynamicSectionEntry M_Parent { get { return m_parent; } }
        }
        public partial class SectionHeaderFlags : KaitaiStruct
        {
            public SectionHeaderFlags(uint p_value, KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_merge = false;
                f_maskOs = false;
                f_exclude = false;
                f_maskProc = false;
                f_strings = false;
                f_osNonConforming = false;
                f_alloc = false;
                f_execInstr = false;
                f_infoLink = false;
                f_write = false;
                f_linkOrder = false;
                f_ordered = false;
                f_tls = false;
                f_group = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_merge;
            private bool _merge;

            /// <summary>
            /// might be merged
            /// </summary>
            public bool Merge
            {
                get
                {
                    if (f_merge)
                        return _merge;
                    _merge = (bool) ((Value & 16) != 0);
                    f_merge = true;
                    return _merge;
                }
            }
            private bool f_maskOs;
            private bool _maskOs;

            /// <summary>
            /// OS-specific
            /// </summary>
            public bool MaskOs
            {
                get
                {
                    if (f_maskOs)
                        return _maskOs;
                    _maskOs = (bool) ((Value & 267386880) != 0);
                    f_maskOs = true;
                    return _maskOs;
                }
            }
            private bool f_exclude;
            private bool _exclude;

            /// <summary>
            /// section is excluded unless referenced or allocated (Solaris)
            /// </summary>
            public bool Exclude
            {
                get
                {
                    if (f_exclude)
                        return _exclude;
                    _exclude = (bool) ((Value & 134217728) != 0);
                    f_exclude = true;
                    return _exclude;
                }
            }
            private bool f_maskProc;
            private bool _maskProc;

            /// <summary>
            /// Processor-specific
            /// </summary>
            public bool MaskProc
            {
                get
                {
                    if (f_maskProc)
                        return _maskProc;
                    _maskProc = (bool) ((Value & 4026531840) != 0);
                    f_maskProc = true;
                    return _maskProc;
                }
            }
            private bool f_strings;
            private bool _strings;

            /// <summary>
            /// contains nul-terminated strings
            /// </summary>
            public bool Strings
            {
                get
                {
                    if (f_strings)
                        return _strings;
                    _strings = (bool) ((Value & 32) != 0);
                    f_strings = true;
                    return _strings;
                }
            }
            private bool f_osNonConforming;
            private bool _osNonConforming;

            /// <summary>
            /// non-standard OS specific handling required
            /// </summary>
            public bool OsNonConforming
            {
                get
                {
                    if (f_osNonConforming)
                        return _osNonConforming;
                    _osNonConforming = (bool) ((Value & 256) != 0);
                    f_osNonConforming = true;
                    return _osNonConforming;
                }
            }
            private bool f_alloc;
            private bool _alloc;

            /// <summary>
            /// occupies memory during execution
            /// </summary>
            public bool Alloc
            {
                get
                {
                    if (f_alloc)
                        return _alloc;
                    _alloc = (bool) ((Value & 2) != 0);
                    f_alloc = true;
                    return _alloc;
                }
            }
            private bool f_execInstr;
            private bool _execInstr;

            /// <summary>
            /// executable
            /// </summary>
            public bool ExecInstr
            {
                get
                {
                    if (f_execInstr)
                        return _execInstr;
                    _execInstr = (bool) ((Value & 4) != 0);
                    f_execInstr = true;
                    return _execInstr;
                }
            }
            private bool f_infoLink;
            private bool _infoLink;

            /// <summary>
            /// 'sh_info' contains SHT index
            /// </summary>
            public bool InfoLink
            {
                get
                {
                    if (f_infoLink)
                        return _infoLink;
                    _infoLink = (bool) ((Value & 64) != 0);
                    f_infoLink = true;
                    return _infoLink;
                }
            }
            private bool f_write;
            private bool _write;

            /// <summary>
            /// writable
            /// </summary>
            public bool Write
            {
                get
                {
                    if (f_write)
                        return _write;
                    _write = (bool) ((Value & 1) != 0);
                    f_write = true;
                    return _write;
                }
            }
            private bool f_linkOrder;
            private bool _linkOrder;

            /// <summary>
            /// preserve order after combining
            /// </summary>
            public bool LinkOrder
            {
                get
                {
                    if (f_linkOrder)
                        return _linkOrder;
                    _linkOrder = (bool) ((Value & 128) != 0);
                    f_linkOrder = true;
                    return _linkOrder;
                }
            }
            private bool f_ordered;
            private bool _ordered;

            /// <summary>
            /// special ordering requirement (Solaris)
            /// </summary>
            public bool Ordered
            {
                get
                {
                    if (f_ordered)
                        return _ordered;
                    _ordered = (bool) ((Value & 67108864) != 0);
                    f_ordered = true;
                    return _ordered;
                }
            }
            private bool f_tls;
            private bool _tls;

            /// <summary>
            /// section hold thread-local data
            /// </summary>
            public bool Tls
            {
                get
                {
                    if (f_tls)
                        return _tls;
                    _tls = (bool) ((Value & 1024) != 0);
                    f_tls = true;
                    return _tls;
                }
            }
            private bool f_group;
            private bool _group;

            /// <summary>
            /// section is member of a group
            /// </summary>
            public bool Group
            {
                get
                {
                    if (f_group)
                        return _group;
                    _group = (bool) ((Value & 512) != 0);
                    f_group = true;
                    return _group;
                }
            }
            private uint _value;
            private Elf m_root;
            private Elf.EndianElf.SectionHeader m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
        }
        public partial class PhdrTypeFlags : KaitaiStruct
        {
            public PhdrTypeFlags(uint p_value, KaitaiStream p__io, Elf.EndianElf.ProgramHeader p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_read = false;
                f_write = false;
                f_execute = false;
                f_maskProc = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_read;
            private bool _read;
            public bool Read
            {
                get
                {
                    if (f_read)
                        return _read;
                    _read = (bool) ((Value & 4) != 0);
                    f_read = true;
                    return _read;
                }
            }
            private bool f_write;
            private bool _write;
            public bool Write
            {
                get
                {
                    if (f_write)
                        return _write;
                    _write = (bool) ((Value & 2) != 0);
                    f_write = true;
                    return _write;
                }
            }
            private bool f_execute;
            private bool _execute;
            public bool Execute
            {
                get
                {
                    if (f_execute)
                        return _execute;
                    _execute = (bool) ((Value & 1) != 0);
                    f_execute = true;
                    return _execute;
                }
            }
            private bool f_maskProc;
            private bool _maskProc;
            public bool MaskProc
            {
                get
                {
                    if (f_maskProc)
                        return _maskProc;
                    _maskProc = (bool) ((Value & 4026531840) != 0);
                    f_maskProc = true;
                    return _maskProc;
                }
            }
            private uint _value;
            private Elf m_root;
            private Elf.EndianElf.ProgramHeader m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public Elf.EndianElf.ProgramHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html">Figure 5-11: DT_FLAGS values</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5">Source</a>
        /// </remarks>
        public partial class DtFlagValues : KaitaiStruct
        {
            public DtFlagValues(uint p_value, KaitaiStream p__io, Elf.EndianElf.DynamicSectionEntry p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_bindNow = false;
                f_origin = false;
                f_textrel = false;
                f_staticTls = false;
                f_symbolic = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_bindNow;
            private bool _bindNow;

            /// <summary>
            /// all relocations for this object must be processed before returning
            /// control to the program
            /// </summary>
            public bool BindNow
            {
                get
                {
                    if (f_bindNow)
                        return _bindNow;
                    _bindNow = (bool) ((Value & 8) != 0);
                    f_bindNow = true;
                    return _bindNow;
                }
            }
            private bool f_origin;
            private bool _origin;

            /// <summary>
            /// object may reference the $ORIGIN substitution string
            /// </summary>
            public bool Origin
            {
                get
                {
                    if (f_origin)
                        return _origin;
                    _origin = (bool) ((Value & 1) != 0);
                    f_origin = true;
                    return _origin;
                }
            }
            private bool f_textrel;
            private bool _textrel;

            /// <summary>
            /// relocation entries might request modifications to a non-writable segment
            /// </summary>
            public bool Textrel
            {
                get
                {
                    if (f_textrel)
                        return _textrel;
                    _textrel = (bool) ((Value & 4) != 0);
                    f_textrel = true;
                    return _textrel;
                }
            }
            private bool f_staticTls;
            private bool _staticTls;

            /// <summary>
            /// object uses static thread-local storage scheme
            /// </summary>
            public bool StaticTls
            {
                get
                {
                    if (f_staticTls)
                        return _staticTls;
                    _staticTls = (bool) ((Value & 16) != 0);
                    f_staticTls = true;
                    return _staticTls;
                }
            }
            private bool f_symbolic;
            private bool _symbolic;

            /// <summary>
            /// symbolic linking
            /// </summary>
            public bool Symbolic
            {
                get
                {
                    if (f_symbolic)
                        return _symbolic;
                    _symbolic = (bool) ((Value & 2) != 0);
                    f_symbolic = true;
                    return _symbolic;
                }
            }
            private uint _value;
            private Elf m_root;
            private Elf.EndianElf.DynamicSectionEntry m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public Elf.EndianElf.DynamicSectionEntry M_Parent { get { return m_parent; } }
        }
        private bool f_shIdxLoOs;
        private int _shIdxLoOs;
        public int ShIdxLoOs
        {
            get
            {
                if (f_shIdxLoOs)
                    return _shIdxLoOs;
                _shIdxLoOs = (int) (65312);
                f_shIdxLoOs = true;
                return _shIdxLoOs;
            }
        }
        private bool f_shIdxLoReserved;
        private int _shIdxLoReserved;
        public int ShIdxLoReserved
        {
            get
            {
                if (f_shIdxLoReserved)
                    return _shIdxLoReserved;
                _shIdxLoReserved = (int) (65280);
                f_shIdxLoReserved = true;
                return _shIdxLoReserved;
            }
        }
        private bool f_shIdxHiProc;
        private int _shIdxHiProc;
        public int ShIdxHiProc
        {
            get
            {
                if (f_shIdxHiProc)
                    return _shIdxHiProc;
                _shIdxHiProc = (int) (65311);
                f_shIdxHiProc = true;
                return _shIdxHiProc;
            }
        }
        private bool f_shIdxLoProc;
        private int _shIdxLoProc;
        public int ShIdxLoProc
        {
            get
            {
                if (f_shIdxLoProc)
                    return _shIdxLoProc;
                _shIdxLoProc = (int) (65280);
                f_shIdxLoProc = true;
                return _shIdxLoProc;
            }
        }
        private bool f_shIdxHiOs;
        private int _shIdxHiOs;
        public int ShIdxHiOs
        {
            get
            {
                if (f_shIdxHiOs)
                    return _shIdxHiOs;
                _shIdxHiOs = (int) (65343);
                f_shIdxHiOs = true;
                return _shIdxHiOs;
            }
        }
        private bool f_shIdxHiReserved;
        private int _shIdxHiReserved;
        public int ShIdxHiReserved
        {
            get
            {
                if (f_shIdxHiReserved)
                    return _shIdxHiReserved;
                _shIdxHiReserved = (int) (65535);
                f_shIdxHiReserved = true;
                return _shIdxHiReserved;
            }
        }
        private byte[] _magic;
        private Bits _bits;
        private Endian _endian;
        private byte _eiVersion;
        private OsAbi _abi;
        private byte _abiVersion;
        private byte[] _pad;
        private EndianElf _header;
        private Elf m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// File identification, must be 0x7f + &quot;ELF&quot;.
        /// </summary>
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// File class: designates target machine word size (32 or 64
        /// bits). The size of many integer fields in this format will
        /// depend on this setting.
        /// </summary>
        public Bits Bits { get { return _bits; } }

        /// <summary>
        /// Endianness used for all integers.
        /// </summary>
        public Endian Endian { get { return _endian; } }

        /// <summary>
        /// ELF header version.
        /// </summary>
        public byte EiVersion { get { return _eiVersion; } }

        /// <summary>
        /// Specifies which OS- and ABI-related extensions will be used
        /// in this ELF file.
        /// </summary>
        public OsAbi Abi { get { return _abi; } }

        /// <summary>
        /// Version of ABI targeted by this ELF file. Interpretation
        /// depends on `abi` attribute.
        /// </summary>
        public byte AbiVersion { get { return _abiVersion; } }
        public byte[] Pad { get { return _pad; } }
        public EndianElf Header { get { return _header; } }
        public Elf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
