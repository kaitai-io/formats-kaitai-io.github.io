// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h">Source</a>
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


        public enum Bits
        {
            B32 = 1,
            B64 = 2,
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

        public enum Endian
        {
            Le = 1,
            Be = 2,
        }

        public enum Machine
        {
            NoMachine = 0,
            M32 = 1,
            Sparc = 2,
            I386 = 3,
            M68k = 4,
            M88k = 5,
            Iamcu = 6,
            I860 = 7,
            Mips = 8,
            S370 = 9,
            MipsRs3Le = 10,
            OldSparcV9 = 11,
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
            Mcore = 39,
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
            M68hc16 = 69,
            M68hc11 = 70,
            M68hc08 = 71,
            M68hc05 = 72,
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
            Or1k = 92,
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
            Cr = 103,
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
            CrayNv2 = 172,
            Rx = 173,
            Metag = 174,
            McstElbrus = 175,
            Ecog16 = 176,
            Cr16 = 177,
            Etpu = 178,
            Sle9x = 179,
            L1om = 180,
            K1om = 181,
            Intel182 = 182,
            Aarch64 = 183,
            Arm184 = 184,
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
            ArcCompact2 = 195,
            Open8 = 196,
            Rl78 = 197,
            Videocore5 = 198,
            Renesas78k0r = 199,
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
            Amdgpu = 224,
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
            Sbf = 263,
            AiEngine = 264,
            SimaMla = 265,
            Bang = 266,
            Loonggpu = 267,
            Sw64 = 268,
            AiEngineCtrlcode = 269,
            Ppu = 270,
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

        public enum ObjType
        {
            NoFileType = 0,
            Relocatable = 1,
            Executable = 2,
            Shared = 3,
            Core = 4,
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
            Cuda = 51,
            ArmAeabi = 64,
            ArmFdpic = 65,
            AmdgpuMesa3d = 66,
            Arm = 97,
            Standalone = 255,
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
            SunwUnwind = 1684333904,
            GnuEhFrame = 1685382480,
            GnuStack = 1685382481,
            GnuRelro = 1685382482,
            GnuProperty = 1685382483,
            GnuSframe = 1685382484,
            PaxFlags = 1694766464,
            OpenbsdMutable = 1705237477,
            OpenbsdRandomize = 1705237478,
            OpenbsdWxneeded = 1705237479,
            OpenbsdNobtcfi = 1705237480,
            OpenbsdSyscalls = 1705237481,
            OpenbsdBootdata = 1705253862,
            SunwSysstatZone = 1879048183,
            SunwSysstat = 1879048184,
            SunwReserve = 1879048185,
            SunwBss = 1879048186,
            SunwStack = 1879048187,
            SunwDtrace = 1879048188,
            SunwCap = 1879048189,
            ArmArchext = 1879048192,
            ArmExidx = 1879048193,
            Aarch64MemtagMte = 1879048194,
            RiscvAttributes = 1879048195,
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
            AndroidRel = 1610612737,
            AndroidRela = 1610612738,
            GnuIncrementalInputs = 1879000832,
            LlvmOdrtab = 1879002112,
            LlvmLinkerOptions = 1879002113,
            LlvmAddrsig = 1879002115,
            LlvmDependentLibraries = 1879002116,
            LlvmSympart = 1879002117,
            LlvmPartEhdr = 1879002118,
            LlvmPartPhdr = 1879002119,
            LlvmBbAddrMapV0 = 1879002120,
            LlvmCallGraphProfile = 1879002121,
            LlvmBbAddrMap = 1879002122,
            LlvmOffloading = 1879002123,
            LlvmLto = 1879002124,
            LlvmJtSizes = 1879002125,
            LlvmCfiJumpTable = 1879002126,
            LlvmCallGraph = 1879002127,
            LlvmDyndbgElf = 1879002128,
            AndroidRelr = 1879047936,
            SunwCtf = 1879048171,
            SunwSymnsort = 1879048172,
            SunwPhname = 1879048173,
            SunwAncillary = 1879048174,
            SunwCapchain = 1879048175,
            SunwCapinfo = 1879048176,
            SunwSymsort = 1879048177,
            SunwTlssort = 1879048178,
            SunwLdynsym = 1879048179,
            GnuSframe = 1879048180,
            GnuAttributes = 1879048181,
            GnuHash = 1879048182,
            GnuLiblist = 1879048183,
            Checksum = 1879048184,
            GnuObjectOnly = 1879048185,
            SunwMove = 1879048186,
            SunwComdat = 1879048187,
            SunwSyminfo = 1879048188,
            GnuVerdef = 1879048189,
            GnuVerneed = 1879048190,
            GnuVersym = 1879048191,
            SparcGotdata = 1879048192,
            X8664Unwind = 1879048193,
            ArmPreemptmap = 1879048194,
            ArmAttributes = 1879048195,
            ArmDebugoverlay = 1879048196,
            ArmOverlaysection = 1879048197,
            Aarch64MemtagGlobalsStatic = 1879048199,
            Aarch64MemtagGlobalsDynamic = 1879048200,
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

        public enum VersionIndexSpecial
        {
            Local = 0,
            GlobalSymbol = 1,
            Eliminate = 65281,
        }
        public Elf(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_shIdxHiOs = false;
            f_shIdxHiProc = false;
            f_shIdxHiReserved = false;
            f_shIdxLoOs = false;
            f_shIdxLoProc = false;
            f_shIdxLoReserved = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 127, 69, 76, 70 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 127, 69, 76, 70 }, _magic, m_io, "/seq/0");
            }
            _bits = ((Bits) m_io.ReadU1());
            _endian = ((Endian) m_io.ReadU1());
            _eiVersion = m_io.ReadU1();
            if (!(_eiVersion == 1))
            {
                throw new ValidationNotEqualError(1, _eiVersion, m_io, "/seq/3");
            }
            _abi = ((OsAbi) m_io.ReadU1());
            _abiVersion = m_io.ReadU1();
            _pad = m_io.ReadBytes(7);
            if (!((KaitaiStream.ByteArrayCompare(_pad, new byte[] { 0, 0, 0, 0, 0, 0, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0 }, _pad, m_io, "/seq/6");
            }
            _header = new EndianElf(m_io, this, m_root);
        }

        /// <remarks>
        /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53">Source</a>
        /// </remarks>
        public partial class DtFlag1Values : KaitaiStruct
        {
            public DtFlag1Values(uint p_value, KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_confAlt = false;
                f_direct = false;
                f_dispRelDne = false;
                f_dispRelPnd = false;
                f_edited = false;
                f_endFiltee = false;
                f_globAudit = false;
                f_group = false;
                f_ignMulDef = false;
                f_initFirst = false;
                f_interpose = false;
                f_kmod = false;
                f_loadFltr = false;
                f_noCommon = false;
                f_noDefLib = false;
                f_noDelete = false;
                f_noDirect = false;
                f_noDump = false;
                f_noHdr = false;
                f_noKsyms = false;
                f_noOpen = false;
                f_noReloc = false;
                f_now = false;
                f_origin = false;
                f_pie = false;
                f_rtldGlobal = false;
                f_singleton = false;
                f_stub = false;
                f_symIntpose = false;
                f_trans = false;
                f_weakFilter = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_confAlt;
            private bool _confAlt;

            /// <summary>
            /// Configuration alternative created.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1023">Source</a>
            /// </remarks>
            public bool ConfAlt
            {
                get
                {
                    if (f_confAlt)
                        return _confAlt;
                    f_confAlt = true;
                    _confAlt = (bool) ((Value & 8192) != 0);
                    return _confAlt;
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
                    f_direct = true;
                    _direct = (bool) ((Value & 256) != 0);
                    return _direct;
                }
            }
            private bool f_dispRelDne;
            private bool _dispRelDne;

            /// <summary>
            /// Displacement relocation done (applied at build time).
            /// </summary>
            public bool DispRelDne
            {
                get
                {
                    if (f_dispRelDne)
                        return _dispRelDne;
                    f_dispRelDne = true;
                    _dispRelDne = (bool) ((Value & 32768) != 0);
                    return _dispRelDne;
                }
            }
            private bool f_dispRelPnd;
            private bool _dispRelPnd;

            /// <summary>
            /// Displacement relocation pending (applied at runtime).
            /// </summary>
            public bool DispRelPnd
            {
                get
                {
                    if (f_dispRelPnd)
                        return _dispRelPnd;
                    f_dispRelPnd = true;
                    _dispRelPnd = (bool) ((Value & 65536) != 0);
                    return _dispRelPnd;
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
                    f_edited = true;
                    _edited = (bool) ((Value & 2097152) != 0);
                    return _edited;
                }
            }
            private bool f_endFiltee;
            private bool _endFiltee;

            /// <summary>
            /// Filtee terminates filters search.
            /// </summary>
            public bool EndFiltee
            {
                get
                {
                    if (f_endFiltee)
                        return _endFiltee;
                    f_endFiltee = true;
                    _endFiltee = (bool) ((Value & 16384) != 0);
                    return _endFiltee;
                }
            }
            private bool f_globAudit;
            private bool _globAudit;

            /// <summary>
            /// Global auditing required.
            /// </summary>
            public bool GlobAudit
            {
                get
                {
                    if (f_globAudit)
                        return _globAudit;
                    f_globAudit = true;
                    _globAudit = (bool) ((Value & 16777216) != 0);
                    return _globAudit;
                }
            }
            private bool f_group;
            private bool _group;

            /// <summary>
            /// Set `RTLD_GROUP` for this object.
            /// </summary>
            public bool Group
            {
                get
                {
                    if (f_group)
                        return _group;
                    f_group = true;
                    _group = (bool) ((Value & 4) != 0);
                    return _group;
                }
            }
            private bool f_ignMulDef;
            private bool _ignMulDef;
            public bool IgnMulDef
            {
                get
                {
                    if (f_ignMulDef)
                        return _ignMulDef;
                    f_ignMulDef = true;
                    _ignMulDef = (bool) ((Value & 262144) != 0);
                    return _ignMulDef;
                }
            }
            private bool f_initFirst;
            private bool _initFirst;

            /// <summary>
            /// Set `RTLD_INITFIRST` for this object.
            /// </summary>
            public bool InitFirst
            {
                get
                {
                    if (f_initFirst)
                        return _initFirst;
                    f_initFirst = true;
                    _initFirst = (bool) ((Value & 32) != 0);
                    return _initFirst;
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
                    f_interpose = true;
                    _interpose = (bool) ((Value & 1024) != 0);
                    return _interpose;
                }
            }
            private bool f_kmod;
            private bool _kmod;

            /// <summary>
            /// Object is a kernel module.
            /// </summary>
            public bool Kmod
            {
                get
                {
                    if (f_kmod)
                        return _kmod;
                    f_kmod = true;
                    _kmod = (bool) ((Value & 268435456) != 0);
                    return _kmod;
                }
            }
            private bool f_loadFltr;
            private bool _loadFltr;

            /// <summary>
            /// Trigger filtee loading at runtime.
            /// </summary>
            public bool LoadFltr
            {
                get
                {
                    if (f_loadFltr)
                        return _loadFltr;
                    f_loadFltr = true;
                    _loadFltr = (bool) ((Value & 16) != 0);
                    return _loadFltr;
                }
            }
            private bool f_noCommon;
            private bool _noCommon;

            /// <summary>
            /// No COMMON symbols exist.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1040">Source</a>
            /// </remarks>
            public bool NoCommon
            {
                get
                {
                    if (f_noCommon)
                        return _noCommon;
                    f_noCommon = true;
                    _noCommon = (bool) ((Value & 1073741824) != 0);
                    return _noCommon;
                }
            }
            private bool f_noDefLib;
            private bool _noDefLib;

            /// <summary>
            /// Ignore the default library search path.
            /// </summary>
            public bool NoDefLib
            {
                get
                {
                    if (f_noDefLib)
                        return _noDefLib;
                    f_noDefLib = true;
                    _noDefLib = (bool) ((Value & 2048) != 0);
                    return _noDefLib;
                }
            }
            private bool f_noDelete;
            private bool _noDelete;

            /// <summary>
            /// Set `RTLD_NODELETE` for this object.
            /// </summary>
            public bool NoDelete
            {
                get
                {
                    if (f_noDelete)
                        return _noDelete;
                    f_noDelete = true;
                    _noDelete = (bool) ((Value & 8) != 0);
                    return _noDelete;
                }
            }
            private bool f_noDirect;
            private bool _noDirect;

            /// <summary>
            /// Object contains non-direct bindings.
            /// </summary>
            public bool NoDirect
            {
                get
                {
                    if (f_noDirect)
                        return _noDirect;
                    f_noDirect = true;
                    _noDirect = (bool) ((Value & 131072) != 0);
                    return _noDirect;
                }
            }
            private bool f_noDump;
            private bool _noDump;

            /// <summary>
            /// Object can't be dldump'ed.
            /// </summary>
            public bool NoDump
            {
                get
                {
                    if (f_noDump)
                        return _noDump;
                    f_noDump = true;
                    _noDump = (bool) ((Value & 4096) != 0);
                    return _noDump;
                }
            }
            private bool f_noHdr;
            private bool _noHdr;
            public bool NoHdr
            {
                get
                {
                    if (f_noHdr)
                        return _noHdr;
                    f_noHdr = true;
                    _noHdr = (bool) ((Value & 1048576) != 0);
                    return _noHdr;
                }
            }
            private bool f_noKsyms;
            private bool _noKsyms;
            public bool NoKsyms
            {
                get
                {
                    if (f_noKsyms)
                        return _noKsyms;
                    f_noKsyms = true;
                    _noKsyms = (bool) ((Value & 524288) != 0);
                    return _noKsyms;
                }
            }
            private bool f_noOpen;
            private bool _noOpen;

            /// <summary>
            /// Set `RTLD_NOOPEN` for this object.
            /// </summary>
            public bool NoOpen
            {
                get
                {
                    if (f_noOpen)
                        return _noOpen;
                    f_noOpen = true;
                    _noOpen = (bool) ((Value & 64) != 0);
                    return _noOpen;
                }
            }
            private bool f_noReloc;
            private bool _noReloc;
            public bool NoReloc
            {
                get
                {
                    if (f_noReloc)
                        return _noReloc;
                    f_noReloc = true;
                    _noReloc = (bool) ((Value & 4194304) != 0);
                    return _noReloc;
                }
            }
            private bool f_now;
            private bool _now;

            /// <summary>
            /// Set `RTLD_NOW` for this object.
            /// </summary>
            public bool Now
            {
                get
                {
                    if (f_now)
                        return _now;
                    f_now = true;
                    _now = (bool) ((Value & 1) != 0);
                    return _now;
                }
            }
            private bool f_origin;
            private bool _origin;

            /// <summary>
            /// `$ORIGIN` must be handled.
            /// </summary>
            public bool Origin
            {
                get
                {
                    if (f_origin)
                        return _origin;
                    f_origin = true;
                    _origin = (bool) ((Value & 128) != 0);
                    return _origin;
                }
            }
            private bool f_pie;
            private bool _pie;

            /// <summary>
            /// Object is a Position Independent Executable (PIE).
            /// </summary>
            public bool Pie
            {
                get
                {
                    if (f_pie)
                        return _pie;
                    f_pie = true;
                    _pie = (bool) ((Value & 134217728) != 0);
                    return _pie;
                }
            }
            private bool f_rtldGlobal;
            private bool _rtldGlobal;

            /// <summary>
            /// Set `RTLD_GLOBAL` for this object.
            /// </summary>
            public bool RtldGlobal
            {
                get
                {
                    if (f_rtldGlobal)
                        return _rtldGlobal;
                    f_rtldGlobal = true;
                    _rtldGlobal = (bool) ((Value & 2) != 0);
                    return _rtldGlobal;
                }
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
                    f_singleton = true;
                    _singleton = (bool) ((Value & 33554432) != 0);
                    return _singleton;
                }
            }
            private bool f_stub;
            private bool _stub;

            /// <summary>
            /// Object is a stub.
            /// See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
            /// </summary>
            public bool Stub
            {
                get
                {
                    if (f_stub)
                        return _stub;
                    f_stub = true;
                    _stub = (bool) ((Value & 67108864) != 0);
                    return _stub;
                }
            }
            private bool f_symIntpose;
            private bool _symIntpose;

            /// <summary>
            /// Object has individual symbol interposers.
            /// </summary>
            public bool SymIntpose
            {
                get
                {
                    if (f_symIntpose)
                        return _symIntpose;
                    f_symIntpose = true;
                    _symIntpose = (bool) ((Value & 8388608) != 0);
                    return _symIntpose;
                }
            }
            private bool f_trans;
            private bool _trans;

            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1019">Source</a>
            /// </remarks>
            public bool Trans
            {
                get
                {
                    if (f_trans)
                        return _trans;
                    f_trans = true;
                    _trans = (bool) ((Value & 512) != 0);
                    return _trans;
                }
            }
            private bool f_weakFilter;
            private bool _weakFilter;

            /// <summary>
            /// Object is a weak standard filter.
            /// </summary>
            public bool WeakFilter
            {
                get
                {
                    if (f_weakFilter)
                        return _weakFilter;
                    f_weakFilter = true;
                    _weakFilter = (bool) ((Value & 536870912) != 0);
                    return _weakFilter;
                }
            }
            private uint _value;
            private Elf m_root;
            private KaitaiStruct m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
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
            public DtFlagValues(uint p_value, KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_bindNow = false;
                f_origin = false;
                f_staticTls = false;
                f_symbolic = false;
                f_textrel = false;
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
                    f_bindNow = true;
                    _bindNow = (bool) ((Value & 8) != 0);
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
                    f_origin = true;
                    _origin = (bool) ((Value & 1) != 0);
                    return _origin;
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
                    f_staticTls = true;
                    _staticTls = (bool) ((Value & 16) != 0);
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
                    f_symbolic = true;
                    _symbolic = (bool) ((Value & 2) != 0);
                    return _symbolic;
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
                    f_textrel = true;
                    _textrel = (bool) ((Value & 4) != 0);
                    return _textrel;
                }
            }
            private uint _value;
            private Elf m_root;
            private KaitaiStruct m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://gabi.xinuos.com/v42/elf/02-eheader.html">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html">Source</a>
        /// </remarks>
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
                if (!Enum.IsDefined(typeof(Machine), _machine))
                {
                    throw new ValidationNotInEnumError(_machine, m_io, "/types/endian_elf/seq/1");
                }
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
                    _ofsProgramHeaders = m_io.ReadU4le();
                    break;
                }
                case Elf.Bits.B64: {
                    _ofsProgramHeaders = m_io.ReadU8le();
                    break;
                }
                }
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _ofsSectionHeaders = m_io.ReadU4le();
                    break;
                }
                case Elf.Bits.B64: {
                    _ofsSectionHeaders = m_io.ReadU8le();
                    break;
                }
                }
                _flags = m_io.ReadBytes(4);
                _eEhsize = m_io.ReadU2le();
                _programHeaderSize = m_io.ReadU2le();
                _numProgramHeaders = m_io.ReadU2le();
                _sectionHeaderSize = m_io.ReadU2le();
                _numSectionHeaders = m_io.ReadU2le();
                _sectionNamesIdx = m_io.ReadU2le();
            }
            private void _readBE()
            {
                _eType = ((Elf.ObjType) m_io.ReadU2be());
                _machine = ((Elf.Machine) m_io.ReadU2be());
                if (!Enum.IsDefined(typeof(Machine), _machine))
                {
                    throw new ValidationNotInEnumError(_machine, m_io, "/types/endian_elf/seq/1");
                }
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
                    _ofsProgramHeaders = m_io.ReadU4be();
                    break;
                }
                case Elf.Bits.B64: {
                    _ofsProgramHeaders = m_io.ReadU8be();
                    break;
                }
                }
                switch (M_Root.Bits) {
                case Elf.Bits.B32: {
                    _ofsSectionHeaders = m_io.ReadU4be();
                    break;
                }
                case Elf.Bits.B64: {
                    _ofsSectionHeaders = m_io.ReadU8be();
                    break;
                }
                }
                _flags = m_io.ReadBytes(4);
                _eEhsize = m_io.ReadU2be();
                _programHeaderSize = m_io.ReadU2be();
                _numProgramHeaders = m_io.ReadU2be();
                _sectionHeaderSize = m_io.ReadU2be();
                _numSectionHeaders = m_io.ReadU2be();
                _sectionNamesIdx = m_io.ReadU2be();
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
                        f_isStringTableLinked = true;
                        _isStringTableLinked = (bool) (M_Parent.LinkedSection.Type == Elf.ShType.Strtab);
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

            /// <remarks>
            /// Reference: <a href="https://gabi.xinuos.com/elf/05-symtab.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html">Source</a>
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
                    f_isShIdxOs = false;
                    f_isShIdxProc = false;
                    f_isShIdxReserved = false;
                    f_name = false;
                    f_shIdxSpecial = false;
                    f_size = false;
                    f_value = false;
                    f_visibility = false;
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
                private bool f_isShIdxOs;
                private bool _isShIdxOs;
                public bool IsShIdxOs
                {
                    get
                    {
                        if (f_isShIdxOs)
                            return _isShIdxOs;
                        f_isShIdxOs = true;
                        _isShIdxOs = (bool) ( ((ShIdx >= M_Root.ShIdxLoOs) && (ShIdx <= M_Root.ShIdxHiOs)) );
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
                        f_isShIdxProc = true;
                        _isShIdxProc = (bool) ( ((ShIdx >= M_Root.ShIdxLoProc) && (ShIdx <= M_Root.ShIdxHiProc)) );
                        return _isShIdxProc;
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
                        f_isShIdxReserved = true;
                        _isShIdxReserved = (bool) ( ((ShIdx >= M_Root.ShIdxLoReserved) && (ShIdx <= M_Root.ShIdxHiReserved)) );
                        return _isShIdxReserved;
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
                        f_name = true;
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
                        f_shIdxSpecial = true;
                        _shIdxSpecial = (SectionHeaderIdxSpecial) (((Elf.SectionHeaderIdxSpecial) ShIdx));
                        return _shIdxSpecial;
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
                        f_size = true;
                        _size = (ulong) ((M_Root.Bits == Elf.Bits.B32 ? SizeB32 : (M_Root.Bits == Elf.Bits.B64 ? SizeB64 : 0)));
                        return _size;
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
                        f_value = true;
                        _value = (ulong) ((M_Root.Bits == Elf.Bits.B32 ? ValueB32 : (M_Root.Bits == Elf.Bits.B64 ? ValueB64 : 0)));
                        return _value;
                    }
                }
                private bool f_visibility;
                private SymbolVisibility _visibility;

                /// <remarks>
                /// Reference: <a href="https://github.com/xinuos/gabi/commit/acd5ebb2962cf243dca4983bc934442b42ef96f5">Source</a>
                /// </remarks>
                public SymbolVisibility Visibility
                {
                    get
                    {
                        if (f_visibility)
                            return _visibility;
                        f_visibility = true;
                        _visibility = (SymbolVisibility) (((Elf.SymbolVisibility) Other & 7));
                        return _visibility;
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
            public partial class NoteSection : KaitaiStruct
            {
                public static NoteSection FromFile(string fileName)
                {
                    return new NoteSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public NoteSection(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                private KaitaiStruct m_parent;
                public List<NoteSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
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

            /// <summary>
            /// Same type as `sh_dynamic_section`, but it does not use
            /// `_parent.linked_section`, which is available only in section headers
            /// (i.e. when `_parent` is of type `section_header`). This allows it to
            /// be used in program headers (i.e. from the `program_header` type).
            /// 
            /// The inability to access `linked_section` means that offsets in the
            /// string table (which should be stored in the `.dynstr` section) will
            /// not be resolved to strings and will be provided only in raw form in
            /// the `value_or_ptr` field. In other words, the
            /// `ph_dynamic_section_entry` type has no `value_str` instance, unlike
            /// the `sh_dynamic_section_entry` type.
            /// 
            /// There is another way to find the string table referenced by the
            /// dynamic section entries that does not rely on `linked_section`, but is
            /// a bit more complex (and is therefore considered out of scope of this
            /// .ksy spec): the mandatory dynamic tag `dynamic_array_tags::strtab`
            /// (`DT_STRTAB`) specifies the virtual address of the string table, and
            /// `dynamic_array_tags::strsz` (`DT_STRSZ`) specifies its size in bytes.
            /// The virtual address can be converted to a file offset by reading the
            /// program headers - see the source code for the `readelf` command:
            /// 
            /// 1. [`offset_from_vma` call site with an address from `DT_STRTAB` as an
            ///   argument](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13018)
            /// 2. [`offset_from_vma` function
            ///   definition](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L7788)
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
            /// </remarks>
            public partial class PhDynamicSection : KaitaiStruct
            {
                public static PhDynamicSection FromFile(string fileName)
                {
                    return new PhDynamicSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public PhDynamicSection(KaitaiStream p__io, Elf.EndianElf.ProgramHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                    _entries = new List<PhDynamicSectionEntry>();
                    {
                        var i = 0;
                        PhDynamicSectionEntry M_;
                        do {
                            M_ = new PhDynamicSectionEntry(m_io, this, m_root, m_isLe);
                            _entries.Add(M_);
                            i++;
                        } while (!(M_.TagEnum == Elf.DynamicArrayTags.Null));
                    }
                }
                private void _readBE()
                {
                    _entries = new List<PhDynamicSectionEntry>();
                    {
                        var i = 0;
                        PhDynamicSectionEntry M_;
                        do {
                            M_ = new PhDynamicSectionEntry(m_io, this, m_root, m_isLe);
                            _entries.Add(M_);
                            i++;
                        } while (!(M_.TagEnum == Elf.DynamicArrayTags.Null));
                    }
                }
                private List<PhDynamicSectionEntry> _entries;
                private Elf m_root;
                private Elf.EndianElf.ProgramHeader m_parent;
                public List<PhDynamicSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.ProgramHeader M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Same type as `sh_dynamic_section_entry`, but without the `value_str`
            /// instance - see the documentation for `ph_dynamic_section` for more
            /// details.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
            /// </remarks>
            public partial class PhDynamicSectionEntry : KaitaiStruct
            {
                public static PhDynamicSectionEntry FromFile(string fileName)
                {
                    return new PhDynamicSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public PhDynamicSectionEntry(KaitaiStream p__io, Elf.EndianElf.PhDynamicSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_flag1Values = false;
                    f_flagValues = false;
                    f_isValueStr = false;
                    f_tagEnum = false;
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
                        f_flag1Values = true;
                        if (TagEnum == Elf.DynamicArrayTags.Flags1) {
                            if (m_isLe == true) {
                                _flag1Values = new DtFlag1Values(ValueOrPtr, m_io, this, m_root);
                            } else {
                                _flag1Values = new DtFlag1Values(ValueOrPtr, m_io, this, m_root);
                            }
                        }
                        return _flag1Values;
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
                        f_flagValues = true;
                        if (TagEnum == Elf.DynamicArrayTags.Flags) {
                            if (m_isLe == true) {
                                _flagValues = new DtFlagValues(ValueOrPtr, m_io, this, m_root);
                            } else {
                                _flagValues = new DtFlagValues(ValueOrPtr, m_io, this, m_root);
                            }
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
                        f_isValueStr = true;
                        _isValueStr = (bool) ( ((ValueOrPtr != 0) && ( ((TagEnum == Elf.DynamicArrayTags.Needed) || (TagEnum == Elf.DynamicArrayTags.Soname) || (TagEnum == Elf.DynamicArrayTags.Rpath) || (TagEnum == Elf.DynamicArrayTags.Runpath) || (TagEnum == Elf.DynamicArrayTags.SunwAuxiliary) || (TagEnum == Elf.DynamicArrayTags.SunwFilter) || (TagEnum == Elf.DynamicArrayTags.Auxiliary) || (TagEnum == Elf.DynamicArrayTags.Filter) || (TagEnum == Elf.DynamicArrayTags.Config) || (TagEnum == Elf.DynamicArrayTags.Depaudit) || (TagEnum == Elf.DynamicArrayTags.Audit)) )) );
                        return _isValueStr;
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
                        f_tagEnum = true;
                        _tagEnum = (DynamicArrayTags) (((Elf.DynamicArrayTags) Tag));
                        return _tagEnum;
                    }
                }
                private ulong _tag;
                private ulong _valueOrPtr;
                private Elf m_root;
                private Elf.EndianElf.PhDynamicSection m_parent;
                public ulong Tag { get { return _tag; } }
                public ulong ValueOrPtr { get { return _valueOrPtr; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.PhDynamicSection M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html">Source</a>
            /// </remarks>
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
                    f_body = false;
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
                        _virtAddr = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _virtAddr = m_io.ReadU8le();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _physAddr = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _physAddr = m_io.ReadU8le();
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
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _memorySize = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _memorySize = m_io.ReadU8le();
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
                        _virtAddr = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _virtAddr = m_io.ReadU8be();
                        break;
                    }
                    }
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _physAddr = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _physAddr = m_io.ReadU8be();
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
                    switch (M_Root.Bits) {
                    case Elf.Bits.B32: {
                        _memorySize = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _memorySize = m_io.ReadU8be();
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

                /// <remarks>
                /// Reference: <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter">Source</a>
                /// </remarks>
                /// <remarks>
                /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html">Source</a>
                /// </remarks>
                public partial class PhInterpreter : KaitaiStruct
                {
                    public static PhInterpreter FromFile(string fileName)
                    {
                        return new PhInterpreter(new KaitaiStream(fileName));
                    }

                    private bool? m_isLe;
                    public PhInterpreter(KaitaiStream p__io, Elf.EndianElf.ProgramHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                        _pathName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                    }
                    private void _readBE()
                    {
                        _pathName = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                    }
                    private string _pathName;
                    private Elf m_root;
                    private Elf.EndianElf.ProgramHeader m_parent;
                    public string PathName { get { return _pathName; } }
                    public Elf M_Root { get { return m_root; } }
                    public Elf.EndianElf.ProgramHeader M_Parent { get { return m_parent; } }
                }
                private bool f_body;
                private object _body;

                /// <summary>
                /// Note: a program header may not have a valid body in the same ELF
                /// file, so accessing `body` may result in reading garbage or
                /// triggering EOF errors.
                /// 
                /// In particular, `*.debug` files produced by elfutils'
                /// `eu-strip --strip-debug` (as used by Fedora/RHEL and other
                /// RPM-based distros for their `*-debuginfo` packages, e.g.
                /// `glibc-debuginfo`) copy the original binary's program header table
                /// verbatim, including `ofs_body`/`len_body` (i.e.
                /// `p_offset`/`p_filesz`), while dropping the actual contents of most
                /// segments. Such segments can be recognized by the fact that the
                /// corresponding section headers have type `sh_type::nobits`
                /// (`SHT_NOBITS`). However, this Kaitai Struct implementation doesn't
                /// know the mapping between program headers and section headers, so
                /// this must be handled externally.
                /// 
                /// `*.debug` files from Debian/Ubuntu `*-dbg` packages (e.g.
                /// `libc6-dbg`) are usually not affected by this issue, because they
                /// are produced using GNU Binutils (`objcopy --only-keep-debug`),
                /// which zeroes `len_body` for segments whose contents were omitted
                /// (which reliably tells us that there is no `body`).
                /// </summary>
                public object Body
                {
                    get
                    {
                        if (f_body)
                            return _body;
                        f_body = true;
                        if (LenBody != 0) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsBody);
                            if (m_isLe == true) {
                                switch (Type) {
                                case Elf.PhType.Dynamic: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new PhDynamicSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.PhType.Interp: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new PhInterpreter(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.PhType.Note: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new NoteSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                default: {
                                    _body = io.ReadBytes(LenBody);
                                    break;
                                }
                                }
                            } else {
                                switch (Type) {
                                case Elf.PhType.Dynamic: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new PhDynamicSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.PhType.Interp: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new PhInterpreter(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.PhType.Note: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new NoteSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                default: {
                                    _body = io.ReadBytes(LenBody);
                                    break;
                                }
                                }
                            }
                            io.Seek(_pos);
                        }
                        return _body;
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
                        f_flagsObj = true;
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
                        return _flagsObj;
                    }
                }
                private PhType _type;
                private uint? _flags64;
                private ulong _ofsBody;
                private ulong _virtAddr;
                private ulong _physAddr;
                private ulong _lenBody;
                private ulong _memorySize;
                private uint? _flags32;
                private ulong _align;
                private Elf m_root;
                private Elf.EndianElf m_parent;
                private byte[] __raw_body;
                public PhType Type { get { return _type; } }
                public uint? Flags64 { get { return _flags64; } }
                public ulong OfsBody { get { return _ofsBody; } }
                public ulong VirtAddr { get { return _virtAddr; } }
                public ulong PhysAddr { get { return _physAddr; } }
                public ulong LenBody { get { return _lenBody; } }
                public ulong MemorySize { get { return _memorySize; } }
                public uint? Flags32 { get { return _flags32; } }
                public ulong Align { get { return _align; } }
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
            /// Reference: <a href="https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html">Source</a>
            /// </remarks>
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
                    f_flagsObj = false;
                    f_linkedSection = false;
                    f_name = false;
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
                    _info = m_io.ReadU4le();
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
                    _info = m_io.ReadU4be();
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
                        f_body = true;
                        if (Type != Elf.ShType.Nobits) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsBody);
                            if (m_isLe == true) {
                                switch (Type) {
                                case Elf.ShType.Dynamic: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new ShDynamicSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Dynsym: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.GnuVerdef: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new VerdefSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.GnuVerneed: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new VerneedSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.GnuVersym: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new VersymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Note: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new NoteSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Rel: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(false, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Rela: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(true, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Strtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new StringsStruct(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Symtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                default: {
                                    _body = io.ReadBytes(LenBody);
                                    break;
                                }
                                }
                            } else {
                                switch (Type) {
                                case Elf.ShType.Dynamic: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new ShDynamicSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Dynsym: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.GnuVerdef: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new VerdefSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.GnuVerneed: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new VerneedSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.GnuVersym: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new VersymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Note: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new NoteSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Rel: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(false, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Rela: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new RelocationSection(true, io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Strtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new StringsStruct(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                case Elf.ShType.Symtab: {
                                    __raw_body = io.ReadBytes(LenBody);
                                    var io___raw_body = new KaitaiStream(__raw_body);
                                    _body = new DynsymSection(io___raw_body, this, m_root, m_isLe);
                                    break;
                                }
                                default: {
                                    _body = io.ReadBytes(LenBody);
                                    break;
                                }
                                }
                            }
                            io.Seek(_pos);
                        }
                        return _body;
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
                        f_flagsObj = true;
                        if (m_isLe == true) {
                            _flagsObj = new SectionHeaderFlags(Flags, m_io, this, m_root);
                        } else {
                            _flagsObj = new SectionHeaderFlags(Flags, m_io, this, m_root);
                        }
                        return _flagsObj;
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
                        f_linkedSection = true;
                        if ( ((LinkedSectionIdx != ((int) Elf.SectionHeaderIdxSpecial.Undefined)) && (LinkedSectionIdx < M_Root.Header.NumSectionHeaders)) ) {
                            _linkedSection = (SectionHeader) (M_Root.Header.SectionHeaders[LinkedSectionIdx]);
                        }
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
                        f_name = true;
                        KaitaiStream io = M_Root.Header.SectionNames.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsName);
                        if (m_isLe == true) {
                            _name = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                        } else {
                            _name = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                        }
                        io.Seek(_pos);
                        return _name;
                    }
                }
                private uint _ofsName;
                private ShType _type;
                private ulong _flags;
                private ulong _addr;
                private ulong _ofsBody;
                private ulong _lenBody;
                private uint _linkedSectionIdx;
                private uint _info;
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
                public uint Info { get { return _info; } }
                public ulong Align { get { return _align; } }
                public ulong EntrySize { get { return _entrySize; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf M_Parent { get { return m_parent; } }
                public byte[] M_RawBody { get { return __raw_body; } }
            }

            /// <summary>
            /// Same type as `ph_dynamic_section`, but it depends on
            /// `_parent.linked_section`, so it can be used only in the
            /// `section_header` type. See the documentation for `ph_dynamic_section`
            /// for more details.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
            /// </remarks>
            public partial class ShDynamicSection : KaitaiStruct
            {
                public static ShDynamicSection FromFile(string fileName)
                {
                    return new ShDynamicSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public ShDynamicSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                    _entries = new List<ShDynamicSectionEntry>();
                    {
                        var i = 0;
                        ShDynamicSectionEntry M_;
                        do {
                            M_ = new ShDynamicSectionEntry(m_io, this, m_root, m_isLe);
                            _entries.Add(M_);
                            i++;
                        } while (!(M_.TagEnum == Elf.DynamicArrayTags.Null));
                    }
                }
                private void _readBE()
                {
                    _entries = new List<ShDynamicSectionEntry>();
                    {
                        var i = 0;
                        ShDynamicSectionEntry M_;
                        do {
                            M_ = new ShDynamicSectionEntry(m_io, this, m_root, m_isLe);
                            _entries.Add(M_);
                            i++;
                        } while (!(M_.TagEnum == Elf.DynamicArrayTags.Null));
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
                        f_isStringTableLinked = true;
                        _isStringTableLinked = (bool) (M_Parent.LinkedSection.Type == Elf.ShType.Strtab);
                        return _isStringTableLinked;
                    }
                }
                private List<ShDynamicSectionEntry> _entries;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public List<ShDynamicSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Same type as `ph_dynamic_section_entry`, but with the `value_str`
            /// instance - see the documentation for `ph_dynamic_section` for more
            /// details.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html">Source</a>
            /// </remarks>
            public partial class ShDynamicSectionEntry : KaitaiStruct
            {
                public static ShDynamicSectionEntry FromFile(string fileName)
                {
                    return new ShDynamicSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public ShDynamicSectionEntry(KaitaiStream p__io, Elf.EndianElf.ShDynamicSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_flag1Values = false;
                    f_flagValues = false;
                    f_isValueStr = false;
                    f_tagEnum = false;
                    f_valueStr = false;
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
                        f_flag1Values = true;
                        if (TagEnum == Elf.DynamicArrayTags.Flags1) {
                            if (m_isLe == true) {
                                _flag1Values = new DtFlag1Values(ValueOrPtr, m_io, this, m_root);
                            } else {
                                _flag1Values = new DtFlag1Values(ValueOrPtr, m_io, this, m_root);
                            }
                        }
                        return _flag1Values;
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
                        f_flagValues = true;
                        if (TagEnum == Elf.DynamicArrayTags.Flags) {
                            if (m_isLe == true) {
                                _flagValues = new DtFlagValues(ValueOrPtr, m_io, this, m_root);
                            } else {
                                _flagValues = new DtFlagValues(ValueOrPtr, m_io, this, m_root);
                            }
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
                        f_isValueStr = true;
                        _isValueStr = (bool) ( ((ValueOrPtr != 0) && ( ((TagEnum == Elf.DynamicArrayTags.Needed) || (TagEnum == Elf.DynamicArrayTags.Soname) || (TagEnum == Elf.DynamicArrayTags.Rpath) || (TagEnum == Elf.DynamicArrayTags.Runpath) || (TagEnum == Elf.DynamicArrayTags.SunwAuxiliary) || (TagEnum == Elf.DynamicArrayTags.SunwFilter) || (TagEnum == Elf.DynamicArrayTags.Auxiliary) || (TagEnum == Elf.DynamicArrayTags.Filter) || (TagEnum == Elf.DynamicArrayTags.Config) || (TagEnum == Elf.DynamicArrayTags.Depaudit) || (TagEnum == Elf.DynamicArrayTags.Audit)) )) );
                        return _isValueStr;
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
                        f_tagEnum = true;
                        _tagEnum = (DynamicArrayTags) (((Elf.DynamicArrayTags) Tag));
                        return _tagEnum;
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
                        f_valueStr = true;
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
                        }
                        return _valueStr;
                    }
                }
                private ulong _tag;
                private ulong _valueOrPtr;
                private Elf m_root;
                private Elf.EndianElf.ShDynamicSection m_parent;
                public ulong Tag { get { return _tag; } }
                public ulong ValueOrPtr { get { return _valueOrPtr; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.ShDynamicSection M_Parent { get { return m_parent; } }
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

            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VerdauxEntry : KaitaiStruct
            {
                public static VerdauxEntry FromFile(string fileName)
                {
                    return new VerdauxEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VerdauxEntry(KaitaiStream p__io, Elf.EndianElf.VerdefSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_name = false;
                    f_next = false;
                    f_ofsStart = false;
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
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _ofsName = m_io.ReadU4le();
                    _ofsNext = m_io.ReadU4le();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 8)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/verdaux_entry/seq/2");
                        }
                    }
                }
                private void _readBE()
                {
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _ofsName = m_io.ReadU4be();
                    _ofsNext = m_io.ReadU4be();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 8)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/verdaux_entry/seq/2");
                        }
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
                        f_name = true;
                        if (M_Parent.IsStringTableLinked) {
                            KaitaiStream io = ((Elf.EndianElf.StringsStruct) (M_Parent.M_Parent.LinkedSection.Body)).M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsName);
                            if (m_isLe == true) {
                                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            } else {
                                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            }
                            io.Seek(_pos);
                        }
                        return _name;
                    }
                }
                private bool f_next;
                private VerdauxEntry _next;
                public VerdauxEntry Next
                {
                    get
                    {
                        if (f_next)
                            return _next;
                        f_next = true;
                        if (OfsNext != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek(OfsStart + OfsNext);
                            if (m_isLe == true) {
                                _next = new VerdauxEntry(m_io, M_Parent, m_root, m_isLe);
                            } else {
                                _next = new VerdauxEntry(m_io, M_Parent, m_root, m_isLe);
                            }
                            m_io.Seek(_pos);
                        }
                        return _next;
                    }
                }
                private bool f_ofsStart;
                private int _ofsStart;
                public int OfsStart
                {
                    get
                    {
                        if (f_ofsStart)
                            return _ofsStart;
                        f_ofsStart = true;
                        _ofsStart = (int) (M_Io.Pos);
                        return _ofsStart;
                    }
                }
                private byte[] __unnamed0;
                private uint _ofsName;
                private uint _ofsNext;
                private Elf m_root;
                private Elf.EndianElf.VerdefSection m_parent;
                public byte[] Unnamed_0 { get { return __unnamed0; } }

                /// <summary>
                /// Byte offset to the version or dependency name string in the linked
                /// string table.
                /// </summary>
                public uint OfsName { get { return _ofsName; } }

                /// <summary>
                /// Byte offset to the next verdaux entry, relative to the start of
                /// this `verdaux_entry`. A value of zero means that there is no next
                /// entry.
                /// </summary>
                public uint OfsNext { get { return _ofsNext; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.VerdefSection M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Version Definitions, contained in the special section named
            /// `.gnu.version_d` with the section type `sh_type::gnu_verdef`
            /// (`SHT_GNU_verdef`).
            /// 
            /// The number of entries in this section must match the value of the
            /// dynamic tag `dynamic_array_tags::verdefnum` (`DT_VERDEFNUM`) in the
            /// Dynamic Section (`.dynamic`).
            /// 
            /// `_parent.linked_section` must be the string table that contains the
            /// strings referenced by this section. Specifically, the string table in
            /// the `.dynstr` section should be used (side note: the `readelf` command
            /// doesn't even check which string table `sh_link` points to, and always
            /// uses `.dynstr` for the lookups - see
            /// &lt;https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13787&gt;).
            /// 
            /// The `is_string_table_linked` value instance indicates whether the
            /// string table is linked. If it is not, version names (the `name`
            /// instance in the `verdaux_entry` type) will not be available.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERDEFS">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VerdefSection : KaitaiStruct
            {
                public static VerdefSection FromFile(string fileName)
                {
                    return new VerdefSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VerdefSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_isStringTableLinked = false;
                    f_numEntries = false;
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
                    _firstEntry = new VerdefSectionEntry(m_io, this, m_root, m_isLe);
                }
                private void _readBE()
                {
                    _firstEntry = new VerdefSectionEntry(m_io, this, m_root, m_isLe);
                }
                private bool f_isStringTableLinked;
                private bool _isStringTableLinked;

                /// <summary>
                /// Indicates whether a string table is linked. This should always be
                /// `true` in spec-compliant ELF files. If it is `false`, the string
                /// offsets in this section will not be resolved to strings.
                /// </summary>
                public bool IsStringTableLinked
                {
                    get
                    {
                        if (f_isStringTableLinked)
                            return _isStringTableLinked;
                        f_isStringTableLinked = true;
                        _isStringTableLinked = (bool) (M_Parent.LinkedSection.Type == Elf.ShType.Strtab);
                        return _isStringTableLinked;
                    }
                }
                private bool f_numEntries;
                private uint _numEntries;

                /// <summary>
                /// Number of entries (version definitions)
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976">Source</a>
                /// </remarks>
                public uint NumEntries
                {
                    get
                    {
                        if (f_numEntries)
                            return _numEntries;
                        f_numEntries = true;
                        _numEntries = (uint) (M_Parent.Info);
                        return _numEntries;
                    }
                }
                private VerdefSectionEntry _firstEntry;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public VerdefSectionEntry FirstEntry { get { return _firstEntry; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VerdefSectionEntry : KaitaiStruct
            {
                public static VerdefSectionEntry FromFile(string fileName)
                {
                    return new VerdefSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VerdefSectionEntry(KaitaiStream p__io, Elf.EndianElf.VerdefSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_firstAux = false;
                    f_flagsObj = false;
                    f_next = false;
                    f_ofsStart = false;
                    f_versionIndexSpecial = false;
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
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _version = m_io.ReadU2le();
                    if (!(_version == 1))
                    {
                        throw new ValidationNotEqualError(1, _version, m_io, "/types/endian_elf/types/verdef_section_entry/seq/1");
                    }
                    _flags = m_io.ReadU2le();
                    _versionIndex = m_io.ReadU2le();
                    {
                        ushort M_ = _versionIndex;
                        if (!((M_ & 32768) == 0))
                        {
                            throw new ValidationExprError(_versionIndex, m_io, "/types/endian_elf/types/verdef_section_entry/seq/3");
                        }
                    }
                    _numAuxEntries = m_io.ReadU2le();
                    if (!(_numAuxEntries >= 1))
                    {
                        throw new ValidationLessThanError(1, _numAuxEntries, m_io, "/types/endian_elf/types/verdef_section_entry/seq/4");
                    }
                    _hash = m_io.ReadU4le();
                    _ofsFirstAux = m_io.ReadU4le();
                    if (!(_ofsFirstAux >= 20))
                    {
                        throw new ValidationLessThanError(20, _ofsFirstAux, m_io, "/types/endian_elf/types/verdef_section_entry/seq/6");
                    }
                    _ofsNext = m_io.ReadU4le();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 20)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/verdef_section_entry/seq/7");
                        }
                    }
                }
                private void _readBE()
                {
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _version = m_io.ReadU2be();
                    if (!(_version == 1))
                    {
                        throw new ValidationNotEqualError(1, _version, m_io, "/types/endian_elf/types/verdef_section_entry/seq/1");
                    }
                    _flags = m_io.ReadU2be();
                    _versionIndex = m_io.ReadU2be();
                    {
                        ushort M_ = _versionIndex;
                        if (!((M_ & 32768) == 0))
                        {
                            throw new ValidationExprError(_versionIndex, m_io, "/types/endian_elf/types/verdef_section_entry/seq/3");
                        }
                    }
                    _numAuxEntries = m_io.ReadU2be();
                    if (!(_numAuxEntries >= 1))
                    {
                        throw new ValidationLessThanError(1, _numAuxEntries, m_io, "/types/endian_elf/types/verdef_section_entry/seq/4");
                    }
                    _hash = m_io.ReadU4be();
                    _ofsFirstAux = m_io.ReadU4be();
                    if (!(_ofsFirstAux >= 20))
                    {
                        throw new ValidationLessThanError(20, _ofsFirstAux, m_io, "/types/endian_elf/types/verdef_section_entry/seq/6");
                    }
                    _ofsNext = m_io.ReadU4be();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 20)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/verdef_section_entry/seq/7");
                        }
                    }
                }
                private bool f_firstAux;
                private VerdauxEntry _firstAux;

                /// <summary>
                /// First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
                /// The rest follow its `next` instance.
                /// </summary>
                public VerdauxEntry FirstAux
                {
                    get
                    {
                        if (f_firstAux)
                            return _firstAux;
                        f_firstAux = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(OfsStart + OfsFirstAux);
                        if (m_isLe == true) {
                            _firstAux = new VerdauxEntry(m_io, M_Parent, m_root, m_isLe);
                        } else {
                            _firstAux = new VerdauxEntry(m_io, M_Parent, m_root, m_isLe);
                        }
                        m_io.Seek(_pos);
                        return _firstAux;
                    }
                }
                private bool f_flagsObj;
                private VersionFlags _flagsObj;
                public VersionFlags FlagsObj
                {
                    get
                    {
                        if (f_flagsObj)
                            return _flagsObj;
                        f_flagsObj = true;
                        if (m_isLe == true) {
                            _flagsObj = new VersionFlags(Flags, m_io, this, m_root, m_isLe);
                        } else {
                            _flagsObj = new VersionFlags(Flags, m_io, this, m_root, m_isLe);
                        }
                        return _flagsObj;
                    }
                }
                private bool f_next;
                private VerdefSectionEntry _next;
                public VerdefSectionEntry Next
                {
                    get
                    {
                        if (f_next)
                            return _next;
                        f_next = true;
                        if (OfsNext != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek(OfsStart + OfsNext);
                            if (m_isLe == true) {
                                _next = new VerdefSectionEntry(m_io, M_Parent, m_root, m_isLe);
                            } else {
                                _next = new VerdefSectionEntry(m_io, M_Parent, m_root, m_isLe);
                            }
                            m_io.Seek(_pos);
                        }
                        return _next;
                    }
                }
                private bool f_ofsStart;
                private int _ofsStart;
                public int OfsStart
                {
                    get
                    {
                        if (f_ofsStart)
                            return _ofsStart;
                        f_ofsStart = true;
                        _ofsStart = (int) (M_Io.Pos);
                        return _ofsStart;
                    }
                }
                private bool f_versionIndexSpecial;
                private VersionIndexSpecial _versionIndexSpecial;
                public VersionIndexSpecial VersionIndexSpecial
                {
                    get
                    {
                        if (f_versionIndexSpecial)
                            return _versionIndexSpecial;
                        f_versionIndexSpecial = true;
                        _versionIndexSpecial = (VersionIndexSpecial) (((Elf.VersionIndexSpecial) VersionIndex));
                        return _versionIndexSpecial;
                    }
                }
                private byte[] __unnamed0;
                private ushort _version;
                private ushort _flags;
                private ushort _versionIndex;
                private ushort _numAuxEntries;
                private uint _hash;
                private uint _ofsFirstAux;
                private uint _ofsNext;
                private Elf m_root;
                private Elf.EndianElf.VerdefSection m_parent;
                public byte[] Unnamed_0 { get { return __unnamed0; } }

                /// <summary>
                /// Version of the structure. Must be set to 1.
                /// </summary>
                public ushort Version { get { return _version; } }

                /// <summary>
                /// Version information flag bitmask. Access `flags_obj` instead.
                /// </summary>
                public ushort Flags { get { return _flags; } }

                /// <summary>
                /// Version index assigned to this version definition. A unique index
                /// that entries in the Symbol Version Table (the `versym_section`
                /// type) use to reference the corresponding version definition.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html">Source</a>
                /// </remarks>
                public ushort VersionIndex { get { return _versionIndex; } }

                /// <summary>
                /// Number of associated auxiliary entries.
                /// </summary>
                public ushort NumAuxEntries { get { return _numAuxEntries; } }

                /// <summary>
                /// Version name hash value (ELF hash function).
                /// </summary>
                public uint Hash { get { return _hash; } }

                /// <summary>
                /// Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
                /// associated with this version definition. The offset is relative to
                /// the start of this `verdef_section_entry`.
                /// </summary>
                public uint OfsFirstAux { get { return _ofsFirstAux; } }

                /// <summary>
                /// Byte offset to the next verdef entry, relative to the start of
                /// this `verdef_section_entry`. A value of zero means that there is
                /// no next entry.
                /// </summary>
                public uint OfsNext { get { return _ofsNext; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.VerdefSection M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VernauxEntry : KaitaiStruct
            {
                public static VernauxEntry FromFile(string fileName)
                {
                    return new VernauxEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VernauxEntry(KaitaiStream p__io, Elf.EndianElf.VerneedSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_flagsObj = false;
                    f_name = false;
                    f_next = false;
                    f_ofsStart = false;
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
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _hash = m_io.ReadU4le();
                    _flags = m_io.ReadU2le();
                    _versionIndex = new VersionIndex(m_io, this, m_root, m_isLe);
                    _ofsName = m_io.ReadU4le();
                    _ofsNext = m_io.ReadU4le();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 16)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/vernaux_entry/seq/5");
                        }
                    }
                }
                private void _readBE()
                {
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _hash = m_io.ReadU4be();
                    _flags = m_io.ReadU2be();
                    _versionIndex = new VersionIndex(m_io, this, m_root, m_isLe);
                    _ofsName = m_io.ReadU4be();
                    _ofsNext = m_io.ReadU4be();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 16)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/vernaux_entry/seq/5");
                        }
                    }
                }
                private bool f_flagsObj;
                private VersionFlags _flagsObj;
                public VersionFlags FlagsObj
                {
                    get
                    {
                        if (f_flagsObj)
                            return _flagsObj;
                        f_flagsObj = true;
                        if (m_isLe == true) {
                            _flagsObj = new VersionFlags(Flags, m_io, this, m_root, m_isLe);
                        } else {
                            _flagsObj = new VersionFlags(Flags, m_io, this, m_root, m_isLe);
                        }
                        return _flagsObj;
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
                        f_name = true;
                        if (M_Parent.IsStringTableLinked) {
                            KaitaiStream io = ((Elf.EndianElf.StringsStruct) (M_Parent.M_Parent.LinkedSection.Body)).M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsName);
                            if (m_isLe == true) {
                                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            } else {
                                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            }
                            io.Seek(_pos);
                        }
                        return _name;
                    }
                }
                private bool f_next;
                private VernauxEntry _next;
                public VernauxEntry Next
                {
                    get
                    {
                        if (f_next)
                            return _next;
                        f_next = true;
                        if (OfsNext != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek(OfsStart + OfsNext);
                            if (m_isLe == true) {
                                _next = new VernauxEntry(m_io, M_Parent, m_root, m_isLe);
                            } else {
                                _next = new VernauxEntry(m_io, M_Parent, m_root, m_isLe);
                            }
                            m_io.Seek(_pos);
                        }
                        return _next;
                    }
                }
                private bool f_ofsStart;
                private int _ofsStart;
                public int OfsStart
                {
                    get
                    {
                        if (f_ofsStart)
                            return _ofsStart;
                        f_ofsStart = true;
                        _ofsStart = (int) (M_Io.Pos);
                        return _ofsStart;
                    }
                }
                private byte[] __unnamed0;
                private uint _hash;
                private ushort _flags;
                private VersionIndex _versionIndex;
                private uint _ofsName;
                private uint _ofsNext;
                private Elf m_root;
                private Elf.EndianElf.VerneedSection m_parent;
                public byte[] Unnamed_0 { get { return __unnamed0; } }

                /// <summary>
                /// Dependency name hash value (ELF hash function).
                /// </summary>
                public uint Hash { get { return _hash; } }

                /// <summary>
                /// Dependency information flag bitmask. Access `flags_obj` instead.
                /// </summary>
                public ushort Flags { get { return _flags; } }

                /// <summary>
                /// Version index assigned to this dependency version. A unique index
                /// that entries in the Symbol Version Table (the `versym_section`
                /// type) use to reference the corresponding dependency version.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
                /// </remarks>
                public VersionIndex VersionIndex { get { return _versionIndex; } }

                /// <summary>
                /// Byte offset to the dependency name string in the linked string
                /// table.
                /// </summary>
                public uint OfsName { get { return _ofsName; } }

                /// <summary>
                /// Byte offset to the next vernaux entry, relative to the start of
                /// this `vernaux_entry`. A value of zero means that there is no next
                /// entry.
                /// </summary>
                public uint OfsNext { get { return _ofsNext; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.VerneedSection M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Version Requirements, contained in the special section named
            /// `.gnu.version_r` with the section type `sh_type::gnu_verneed`
            /// (`SHT_GNU_verneed`). This section defines the required versions of
            /// dynamic symbols from other shared objects.
            /// 
            /// The number of entries in this section must match the value of the
            /// dynamic tag `dynamic_array_tags::verneednum` (`DT_VERNEEDNUM`) in the
            /// Dynamic Section (`.dynamic`).
            /// 
            /// `_parent.linked_section` must be the string table that contains the
            /// strings referenced by this section. Specifically, the string table in
            /// the `.dynstr` section should be used (side note: the `readelf` command
            /// doesn't even check which string table `sh_link` points to, and always
            /// uses `.dynstr` for the lookups - see
            /// &lt;https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13941&gt;).
            /// 
            /// The `is_string_table_linked` value instance indicates whether the
            /// string table is linked. If it is not, file names (the `file_name`
            /// instance in the `verneed_section_entry` type) or version names (the
            /// `name` instance in the `vernaux_entry` type) will not be available.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERRQMTS">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VerneedSection : KaitaiStruct
            {
                public static VerneedSection FromFile(string fileName)
                {
                    return new VerneedSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VerneedSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_isStringTableLinked = false;
                    f_numEntries = false;
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
                    _firstEntry = new VerneedSectionEntry(m_io, this, m_root, m_isLe);
                }
                private void _readBE()
                {
                    _firstEntry = new VerneedSectionEntry(m_io, this, m_root, m_isLe);
                }
                private bool f_isStringTableLinked;
                private bool _isStringTableLinked;

                /// <summary>
                /// Indicates whether a string table is linked. This should always be
                /// `true` in spec-compliant ELF files. If it is `false`, the string
                /// offsets in this section will not be resolved to strings.
                /// </summary>
                public bool IsStringTableLinked
                {
                    get
                    {
                        if (f_isStringTableLinked)
                            return _isStringTableLinked;
                        f_isStringTableLinked = true;
                        _isStringTableLinked = (bool) (M_Parent.LinkedSection.Type == Elf.ShType.Strtab);
                        return _isStringTableLinked;
                    }
                }
                private bool f_numEntries;
                private uint _numEntries;

                /// <summary>
                /// Number of entries (dependency versions)
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976">Source</a>
                /// </remarks>
                public uint NumEntries
                {
                    get
                    {
                        if (f_numEntries)
                            return _numEntries;
                        f_numEntries = true;
                        _numEntries = (uint) (M_Parent.Info);
                        return _numEntries;
                    }
                }
                private VerneedSectionEntry _firstEntry;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public VerneedSectionEntry FirstEntry { get { return _firstEntry; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VerneedSectionEntry : KaitaiStruct
            {
                public static VerneedSectionEntry FromFile(string fileName)
                {
                    return new VerneedSectionEntry(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VerneedSectionEntry(KaitaiStream p__io, Elf.EndianElf.VerneedSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_fileName = false;
                    f_firstAux = false;
                    f_next = false;
                    f_ofsStart = false;
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
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _version = m_io.ReadU2le();
                    if (!(_version == 1))
                    {
                        throw new ValidationNotEqualError(1, _version, m_io, "/types/endian_elf/types/verneed_section_entry/seq/1");
                    }
                    _numAuxEntries = m_io.ReadU2le();
                    if (!(_numAuxEntries >= 1))
                    {
                        throw new ValidationLessThanError(1, _numAuxEntries, m_io, "/types/endian_elf/types/verneed_section_entry/seq/2");
                    }
                    _ofsFileName = m_io.ReadU4le();
                    _ofsFirstAux = m_io.ReadU4le();
                    if (!(_ofsFirstAux >= 16))
                    {
                        throw new ValidationLessThanError(16, _ofsFirstAux, m_io, "/types/endian_elf/types/verneed_section_entry/seq/4");
                    }
                    _ofsNext = m_io.ReadU4le();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 16)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/verneed_section_entry/seq/5");
                        }
                    }
                }
                private void _readBE()
                {
                    if (OfsStart < 0) {
                        __unnamed0 = m_io.ReadBytes(0);
                    }
                    _version = m_io.ReadU2be();
                    if (!(_version == 1))
                    {
                        throw new ValidationNotEqualError(1, _version, m_io, "/types/endian_elf/types/verneed_section_entry/seq/1");
                    }
                    _numAuxEntries = m_io.ReadU2be();
                    if (!(_numAuxEntries >= 1))
                    {
                        throw new ValidationLessThanError(1, _numAuxEntries, m_io, "/types/endian_elf/types/verneed_section_entry/seq/2");
                    }
                    _ofsFileName = m_io.ReadU4be();
                    _ofsFirstAux = m_io.ReadU4be();
                    if (!(_ofsFirstAux >= 16))
                    {
                        throw new ValidationLessThanError(16, _ofsFirstAux, m_io, "/types/endian_elf/types/verneed_section_entry/seq/4");
                    }
                    _ofsNext = m_io.ReadU4be();
                    {
                        uint M_ = _ofsNext;
                        if (!( ((M_ == 0) || (M_ >= 16)) ))
                        {
                            throw new ValidationExprError(_ofsNext, m_io, "/types/endian_elf/types/verneed_section_entry/seq/5");
                        }
                    }
                }
                private bool f_fileName;
                private string _fileName;
                public string FileName
                {
                    get
                    {
                        if (f_fileName)
                            return _fileName;
                        f_fileName = true;
                        if (M_Parent.IsStringTableLinked) {
                            KaitaiStream io = ((Elf.EndianElf.StringsStruct) (M_Parent.M_Parent.LinkedSection.Body)).M_Io;
                            long _pos = io.Pos;
                            io.Seek(OfsFileName);
                            if (m_isLe == true) {
                                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            } else {
                                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(io.ReadBytesTerm(0, false, true, true));
                            }
                            io.Seek(_pos);
                        }
                        return _fileName;
                    }
                }
                private bool f_firstAux;
                private VernauxEntry _firstAux;

                /// <summary>
                /// First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
                /// The rest follow its `next` instance.
                /// </summary>
                public VernauxEntry FirstAux
                {
                    get
                    {
                        if (f_firstAux)
                            return _firstAux;
                        f_firstAux = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(OfsStart + OfsFirstAux);
                        if (m_isLe == true) {
                            _firstAux = new VernauxEntry(m_io, M_Parent, m_root, m_isLe);
                        } else {
                            _firstAux = new VernauxEntry(m_io, M_Parent, m_root, m_isLe);
                        }
                        m_io.Seek(_pos);
                        return _firstAux;
                    }
                }
                private bool f_next;
                private VerneedSectionEntry _next;
                public VerneedSectionEntry Next
                {
                    get
                    {
                        if (f_next)
                            return _next;
                        f_next = true;
                        if (OfsNext != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek(OfsStart + OfsNext);
                            if (m_isLe == true) {
                                _next = new VerneedSectionEntry(m_io, M_Parent, m_root, m_isLe);
                            } else {
                                _next = new VerneedSectionEntry(m_io, M_Parent, m_root, m_isLe);
                            }
                            m_io.Seek(_pos);
                        }
                        return _next;
                    }
                }
                private bool f_ofsStart;
                private int _ofsStart;
                public int OfsStart
                {
                    get
                    {
                        if (f_ofsStart)
                            return _ofsStart;
                        f_ofsStart = true;
                        _ofsStart = (int) (M_Io.Pos);
                        return _ofsStart;
                    }
                }
                private byte[] __unnamed0;
                private ushort _version;
                private ushort _numAuxEntries;
                private uint _ofsFileName;
                private uint _ofsFirstAux;
                private uint _ofsNext;
                private Elf m_root;
                private Elf.EndianElf.VerneedSection m_parent;
                public byte[] Unnamed_0 { get { return __unnamed0; } }

                /// <summary>
                /// Version of the structure. Must be set to 1.
                /// </summary>
                public ushort Version { get { return _version; } }

                /// <summary>
                /// Number of associated auxiliary entries.
                /// </summary>
                public ushort NumAuxEntries { get { return _numAuxEntries; } }

                /// <summary>
                /// Byte offset to the file name string in the linked string table.
                /// </summary>
                public uint OfsFileName { get { return _ofsFileName; } }

                /// <summary>
                /// Byte offset to the first associated `vernaux_entry`
                /// (`Elfxx_Vernaux`). The offset is relative to the start of this
                /// `verneed_section_entry`.
                /// </summary>
                public uint OfsFirstAux { get { return _ofsFirstAux; } }

                /// <summary>
                /// Byte offset to the next verneed entry, relative to the start of
                /// this `verneed_section_entry`. A value of zero means that there is
                /// no next entry.
                /// </summary>
                public uint OfsNext { get { return _ofsNext; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.VerneedSection M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Version information flag bitmask, shared by the `flags` (`vd_flags`)
            /// field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
            /// (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VersionFlags : KaitaiStruct
            {
                private bool? m_isLe;
                public VersionFlags(ushort p_value, KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _value = p_value;
                    f_base = false;
                    f_info = false;
                    f_weak = false;
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
                }
                private void _readBE()
                {
                }
                private bool f_base;
                private bool _base;

                /// <summary>
                /// Version definition of the file itself (the base definition).
                /// </summary>
                public bool Base
                {
                    get
                    {
                        if (f_base)
                            return _base;
                        f_base = true;
                        _base = (bool) ((Value & 1) != 0);
                        return _base;
                    }
                }
                private bool f_info;
                private bool _info;

                /// <summary>
                /// Version reference exists for informational purposes and does not
                /// need to be validated at runtime.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html">Source</a>
                /// </remarks>
                public bool Info
                {
                    get
                    {
                        if (f_info)
                            return _info;
                        f_info = true;
                        _info = (bool) ((Value & 4) != 0);
                        return _info;
                    }
                }
                private bool f_weak;
                private bool _weak;

                /// <summary>
                /// Weak version identifier.
                /// 
                /// A weak version definition has no symbols associated with the
                /// version. See [Creating a Weak Version
                /// Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
                /// </summary>
                public bool Weak
                {
                    get
                    {
                        if (f_weak)
                            return _weak;
                        f_weak = true;
                        _weak = (bool) ((Value & 2) != 0);
                        return _weak;
                    }
                }
                private ushort _value;
                private Elf m_root;
                private KaitaiStruct m_parent;
                public ushort Value { get { return _value; } }
                public Elf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class VersionIndex : KaitaiStruct
            {
                public static VersionIndex FromFile(string fileName)
                {
                    return new VersionIndex(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VersionIndex(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_isHidden = false;
                    f_value = false;
                    f_versionIndexSpecial = false;
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
                    _raw = m_io.ReadU2le();
                }
                private void _readBE()
                {
                    _raw = m_io.ReadU2be();
                }
                private bool f_isHidden;
                private bool _isHidden;

                /// <summary>
                /// This bit is set if the symbol is hidden, and is only visible with
                /// an explicit version number. This is a GNU extension.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1379">Source</a>
                /// </remarks>
                public bool IsHidden
                {
                    get
                    {
                        if (f_isHidden)
                            return _isHidden;
                        f_isHidden = true;
                        _isHidden = (bool) ((Raw & 32768) != 0);
                        return _isHidden;
                    }
                }
                private bool f_value;
                private int _value;

                /// <summary>
                /// The values `version_index_special::local` (0) and
                /// `version_index_special::global_symbol` (1) have special meanings.
                /// The `version_index_special` value instance converts the integer
                /// value to the `version_index_special` enum.
                /// </summary>
                public int Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        _value = (int) (Raw & 32767);
                        return _value;
                    }
                }
                private bool f_versionIndexSpecial;
                private VersionIndexSpecial _versionIndexSpecial;

                /// <summary>
                /// Note: we match special constants against the full 16-bit integer
                /// value (called `raw` in this .ksy implementation), because that's
                /// what the `readelf` command does when deciding whether to print
                /// `0 (*local*)` or `1 (*global*)` in the `.gnu.version`
                /// (`SHT_GNU_versym`) section - see
                /// &lt;https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L14079&gt;.
                /// 
                /// Besides, `version_index_special::eliminate` (`VER_NDX_ELIMINATE`)
                /// has a value of `0xff01`, which is a 16-bit value. If we matched
                /// against `value` instead, `version_index_special::eliminate` would
                /// be unreachable, because `value` contains only the lower 15 bits,
                /// so its maximum possible value is `0x7fff`.
                /// </summary>
                public VersionIndexSpecial VersionIndexSpecial
                {
                    get
                    {
                        if (f_versionIndexSpecial)
                            return _versionIndexSpecial;
                        f_versionIndexSpecial = true;
                        _versionIndexSpecial = (VersionIndexSpecial) (((Elf.VersionIndexSpecial) Raw));
                        return _versionIndexSpecial;
                    }
                }
                private ushort _raw;
                private Elf m_root;
                private KaitaiStruct m_parent;

                /// <summary>
                /// Raw value, don't read this field - access `value`,
                /// `version_index_special` and `is_hidden` instead.
                /// </summary>
                public ushort Raw { get { return _raw; } }
                public Elf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// Symbol Version Table, contained in the special section named
            /// `.gnu.version` with the section type `sh_type::gnu_versym`
            /// (`SHT_GNU_versym`).
            /// 
            /// This section must have the same number of entries as the Dynamic
            /// Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
            /// / `SHT_DYNSYM`). Each entry specifies the version defined for or
            /// required by the corresponding symbol in the Dynamic Symbol Table.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERTBL">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-symbol-section.html">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://www.akkadia.org/drepper/symbol-versioning">Source</a>
            /// </remarks>
            public partial class VersymSection : KaitaiStruct
            {
                public static VersymSection FromFile(string fileName)
                {
                    return new VersymSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public VersymSection(KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                    _entries = new List<VersionIndex>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new VersionIndex(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<VersionIndex>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _entries.Add(new VersionIndex(m_io, this, m_root, m_isLe));
                            i++;
                        }
                    }
                }
                private List<VersionIndex> _entries;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;

                /// <summary>
                /// Version indexes for the corresponding symbols in the Dynamic
                /// Symbol Table (`.dynsym` section).
                /// 
                /// These values are not the versions themselves: they are keys that
                /// are matched against the `version_index` (`vd_ndx`) field of the
                /// `verdef_section_entry` (`Elfxx_Verdef`) type if the symbol is
                /// defined in this object, or the `version_index` (`vna_other`) field
                /// of the `vernaux_entry` (`Elfxx_Vernaux`) type if the symbol is
                /// required from another object. The `name` instance of the matched
                /// entry specifies the version of the symbol.
                /// </summary>
                public List<VersionIndex> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }
            private bool f_programHeaders;
            private List<ProgramHeader> _programHeaders;
            public List<ProgramHeader> ProgramHeaders
            {
                get
                {
                    if (f_programHeaders)
                        return _programHeaders;
                    f_programHeaders = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsProgramHeaders);
                    if (m_isLe == true) {
                        __raw_programHeaders = new List<byte[]>();
                        _programHeaders = new List<ProgramHeader>();
                        for (var i = 0; i < NumProgramHeaders; i++)
                        {
                            __raw_programHeaders.Add(m_io.ReadBytes(ProgramHeaderSize));
                            var io___raw_programHeaders = new KaitaiStream(__raw_programHeaders[__raw_programHeaders.Count - 1]);
                            _programHeaders.Add(new ProgramHeader(io___raw_programHeaders, this, m_root, m_isLe));
                        }
                    } else {
                        __raw_programHeaders = new List<byte[]>();
                        _programHeaders = new List<ProgramHeader>();
                        for (var i = 0; i < NumProgramHeaders; i++)
                        {
                            __raw_programHeaders.Add(m_io.ReadBytes(ProgramHeaderSize));
                            var io___raw_programHeaders = new KaitaiStream(__raw_programHeaders[__raw_programHeaders.Count - 1]);
                            _programHeaders.Add(new ProgramHeader(io___raw_programHeaders, this, m_root, m_isLe));
                        }
                    }
                    m_io.Seek(_pos);
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
                    f_sectionHeaders = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsSectionHeaders);
                    if (m_isLe == true) {
                        __raw_sectionHeaders = new List<byte[]>();
                        _sectionHeaders = new List<SectionHeader>();
                        for (var i = 0; i < NumSectionHeaders; i++)
                        {
                            __raw_sectionHeaders.Add(m_io.ReadBytes(SectionHeaderSize));
                            var io___raw_sectionHeaders = new KaitaiStream(__raw_sectionHeaders[__raw_sectionHeaders.Count - 1]);
                            _sectionHeaders.Add(new SectionHeader(io___raw_sectionHeaders, this, m_root, m_isLe));
                        }
                    } else {
                        __raw_sectionHeaders = new List<byte[]>();
                        _sectionHeaders = new List<SectionHeader>();
                        for (var i = 0; i < NumSectionHeaders; i++)
                        {
                            __raw_sectionHeaders.Add(m_io.ReadBytes(SectionHeaderSize));
                            var io___raw_sectionHeaders = new KaitaiStream(__raw_sectionHeaders[__raw_sectionHeaders.Count - 1]);
                            _sectionHeaders.Add(new SectionHeader(io___raw_sectionHeaders, this, m_root, m_isLe));
                        }
                    }
                    m_io.Seek(_pos);
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
                    f_sectionNames = true;
                    if ( ((SectionNamesIdx != ((int) Elf.SectionHeaderIdxSpecial.Undefined)) && (SectionNamesIdx < M_Root.Header.NumSectionHeaders)) ) {
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
                    }
                    return _sectionNames;
                }
            }
            private ObjType _eType;
            private Machine _machine;
            private uint _eVersion;
            private ulong _entryPoint;
            private ulong _ofsProgramHeaders;
            private ulong _ofsSectionHeaders;
            private byte[] _flags;
            private ushort _eEhsize;
            private ushort _programHeaderSize;
            private ushort _numProgramHeaders;
            private ushort _sectionHeaderSize;
            private ushort _numSectionHeaders;
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
            public ulong OfsProgramHeaders { get { return _ofsProgramHeaders; } }
            public ulong OfsSectionHeaders { get { return _ofsSectionHeaders; } }
            public byte[] Flags { get { return _flags; } }
            public ushort EEhsize { get { return _eEhsize; } }
            public ushort ProgramHeaderSize { get { return _programHeaderSize; } }
            public ushort NumProgramHeaders { get { return _numProgramHeaders; } }
            public ushort SectionHeaderSize { get { return _sectionHeaderSize; } }
            public ushort NumSectionHeaders { get { return _numSectionHeaders; } }
            public ushort SectionNamesIdx { get { return _sectionNamesIdx; } }
            public Elf M_Root { get { return m_root; } }
            public Elf M_Parent { get { return m_parent; } }
            public List<byte[]> M_RawProgramHeaders { get { return __raw_programHeaders; } }
            public List<byte[]> M_RawSectionHeaders { get { return __raw_sectionHeaders; } }
            public byte[] M_RawSectionNames { get { return __raw_sectionNames; } }
        }
        public partial class PhdrTypeFlags : KaitaiStruct
        {
            public PhdrTypeFlags(uint p_value, KaitaiStream p__io, Elf.EndianElf.ProgramHeader p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_execute = false;
                f_maskProc = false;
                f_read = false;
                f_write = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_execute;
            private bool _execute;
            public bool Execute
            {
                get
                {
                    if (f_execute)
                        return _execute;
                    f_execute = true;
                    _execute = (bool) ((Value & 1) != 0);
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
                    f_maskProc = true;
                    _maskProc = (bool) ((Value & 4026531840) != 0);
                    return _maskProc;
                }
            }
            private bool f_read;
            private bool _read;
            public bool Read
            {
                get
                {
                    if (f_read)
                        return _read;
                    f_read = true;
                    _read = (bool) ((Value & 4) != 0);
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
                    f_write = true;
                    _write = (bool) ((Value & 2) != 0);
                    return _write;
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
        /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468">Source</a>
        /// </remarks>
        public partial class SectionHeaderFlags : KaitaiStruct
        {
            public SectionHeaderFlags(uint p_value, KaitaiStream p__io, Elf.EndianElf.SectionHeader p__parent = null, Elf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_alloc = false;
                f_compressed = false;
                f_exclude = false;
                f_execInstr = false;
                f_gnuMbind = false;
                f_group = false;
                f_infoLink = false;
                f_linkOrder = false;
                f_maskOs = false;
                f_maskProc = false;
                f_merge = false;
                f_ordered = false;
                f_osNonconforming = false;
                f_retain = false;
                f_strings = false;
                f_tls = false;
                f_write = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_alloc;
            private bool _alloc;

            /// <summary>
            /// Occupies memory during execution
            /// </summary>
            public bool Alloc
            {
                get
                {
                    if (f_alloc)
                        return _alloc;
                    f_alloc = true;
                    _alloc = (bool) ((Value & 2) != 0);
                    return _alloc;
                }
            }
            private bool f_compressed;
            private bool _compressed;

            /// <summary>
            /// Section with compressed data
            /// </summary>
            public bool Compressed
            {
                get
                {
                    if (f_compressed)
                        return _compressed;
                    f_compressed = true;
                    _compressed = (bool) ((Value & 2048) != 0);
                    return _compressed;
                }
            }
            private bool f_exclude;
            private bool _exclude;

            /// <summary>
            /// Section is excluded unless referenced or allocated (Solaris)
            /// </summary>
            public bool Exclude
            {
                get
                {
                    if (f_exclude)
                        return _exclude;
                    f_exclude = true;
                    _exclude = (bool) ((Value & 2147483648) != 0);
                    return _exclude;
                }
            }
            private bool f_execInstr;
            private bool _execInstr;

            /// <summary>
            /// Executable machine instructions
            /// </summary>
            public bool ExecInstr
            {
                get
                {
                    if (f_execInstr)
                        return _execInstr;
                    f_execInstr = true;
                    _execInstr = (bool) ((Value & 4) != 0);
                    return _execInstr;
                }
            }
            private bool f_gnuMbind;
            private bool _gnuMbind;

            /// <summary>
            /// Mbind section
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L631">Source</a>
            /// </remarks>
            public bool GnuMbind
            {
                get
                {
                    if (f_gnuMbind)
                        return _gnuMbind;
                    f_gnuMbind = true;
                    _gnuMbind = (bool) ((Value & 16777216) != 0);
                    return _gnuMbind;
                }
            }
            private bool f_group;
            private bool _group;

            /// <summary>
            /// Member of a section group
            /// </summary>
            public bool Group
            {
                get
                {
                    if (f_group)
                        return _group;
                    f_group = true;
                    _group = (bool) ((Value & 512) != 0);
                    return _group;
                }
            }
            private bool f_infoLink;
            private bool _infoLink;

            /// <summary>
            /// Section header's `sh_info` field holds a section header table index
            /// </summary>
            public bool InfoLink
            {
                get
                {
                    if (f_infoLink)
                        return _infoLink;
                    f_infoLink = true;
                    _infoLink = (bool) ((Value & 64) != 0);
                    return _infoLink;
                }
            }
            private bool f_linkOrder;
            private bool _linkOrder;

            /// <summary>
            /// Preserve section ordering when linking
            /// </summary>
            public bool LinkOrder
            {
                get
                {
                    if (f_linkOrder)
                        return _linkOrder;
                    f_linkOrder = true;
                    _linkOrder = (bool) ((Value & 128) != 0);
                    return _linkOrder;
                }
            }
            private bool f_maskOs;
            private bool _maskOs;

            /// <summary>
            /// OS-specific semantics
            /// </summary>
            public bool MaskOs
            {
                get
                {
                    if (f_maskOs)
                        return _maskOs;
                    f_maskOs = true;
                    _maskOs = (bool) ((Value & 267386880) != 0);
                    return _maskOs;
                }
            }
            private bool f_maskProc;
            private bool _maskProc;

            /// <summary>
            /// Processor-specific semantics
            /// </summary>
            public bool MaskProc
            {
                get
                {
                    if (f_maskProc)
                        return _maskProc;
                    f_maskProc = true;
                    _maskProc = (bool) ((Value & 4026531840) != 0);
                    return _maskProc;
                }
            }
            private bool f_merge;
            private bool _merge;

            /// <summary>
            /// Data in this section can be merged to eliminate duplication
            /// </summary>
            public bool Merge
            {
                get
                {
                    if (f_merge)
                        return _merge;
                    f_merge = true;
                    _merge = (bool) ((Value & 16) != 0);
                    return _merge;
                }
            }
            private bool f_ordered;
            private bool _ordered;

            /// <summary>
            /// Special ordering requirement (Solaris)
            /// 
            /// From &lt;https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675&gt;:
            /// 
            /// &gt; `SHF_ORDERED` is an older version of the functionality provided by
            /// &gt; `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
            /// &gt; `SHF_ORDERED` is no longer supported.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L485">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675">Source</a>
            /// </remarks>
            public bool Ordered
            {
                get
                {
                    if (f_ordered)
                        return _ordered;
                    f_ordered = true;
                    _ordered = (bool) ((Value & 1073741824) != 0);
                    return _ordered;
                }
            }
            private bool f_osNonconforming;
            private bool _osNonconforming;

            /// <summary>
            /// Special OS-specific handling required
            /// </summary>
            public bool OsNonconforming
            {
                get
                {
                    if (f_osNonconforming)
                        return _osNonconforming;
                    f_osNonconforming = true;
                    _osNonconforming = (bool) ((Value & 256) != 0);
                    return _osNonconforming;
                }
            }
            private bool f_retain;
            private bool _retain;

            /// <summary>
            /// Section should not be garbage collected by the linker
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L630">Source</a>
            /// </remarks>
            /// <remarks>
            /// Reference: <a href="https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L484">Source</a>
            /// </remarks>
            public bool Retain
            {
                get
                {
                    if (f_retain)
                        return _retain;
                    f_retain = true;
                    _retain = (bool) ((Value & 2097152) != 0);
                    return _retain;
                }
            }
            private bool f_strings;
            private bool _strings;

            /// <summary>
            /// Contains null-terminated character strings
            /// </summary>
            public bool Strings
            {
                get
                {
                    if (f_strings)
                        return _strings;
                    f_strings = true;
                    _strings = (bool) ((Value & 32) != 0);
                    return _strings;
                }
            }
            private bool f_tls;
            private bool _tls;

            /// <summary>
            /// Thread-local storage section (`.tbss` or `.tdata` according to [ELF
            /// Handling For Thread-Local
            /// Storage](https://www.akkadia.org/drepper/tls.pdf))
            /// </summary>
            public bool Tls
            {
                get
                {
                    if (f_tls)
                        return _tls;
                    f_tls = true;
                    _tls = (bool) ((Value & 1024) != 0);
                    return _tls;
                }
            }
            private bool f_write;
            private bool _write;

            /// <summary>
            /// Writable during execution
            /// </summary>
            public bool Write
            {
                get
                {
                    if (f_write)
                        return _write;
                    f_write = true;
                    _write = (bool) ((Value & 1) != 0);
                    return _write;
                }
            }
            private uint _value;
            private Elf m_root;
            private Elf.EndianElf.SectionHeader m_parent;
            public uint Value { get { return _value; } }
            public Elf M_Root { get { return m_root; } }
            public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
        }
        private bool f_shIdxHiOs;
        private int _shIdxHiOs;
        public int ShIdxHiOs
        {
            get
            {
                if (f_shIdxHiOs)
                    return _shIdxHiOs;
                f_shIdxHiOs = true;
                _shIdxHiOs = (int) (65343);
                return _shIdxHiOs;
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
                f_shIdxHiProc = true;
                _shIdxHiProc = (int) (65311);
                return _shIdxHiProc;
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
                f_shIdxHiReserved = true;
                _shIdxHiReserved = (int) (65535);
                return _shIdxHiReserved;
            }
        }
        private bool f_shIdxLoOs;
        private int _shIdxLoOs;
        public int ShIdxLoOs
        {
            get
            {
                if (f_shIdxLoOs)
                    return _shIdxLoOs;
                f_shIdxLoOs = true;
                _shIdxLoOs = (int) (65312);
                return _shIdxLoOs;
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
                f_shIdxLoProc = true;
                _shIdxLoProc = (int) (65280);
                return _shIdxLoProc;
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
                f_shIdxLoReserved = true;
                _shIdxLoReserved = (int) (65280);
                return _shIdxLoReserved;
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
