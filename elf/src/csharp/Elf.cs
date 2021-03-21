// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=HEAD">Source</a>
    /// </remarks>
    public partial class Elf : KaitaiStruct
    {
        public static Elf FromFile(string fileName)
        {
            return new Elf(new KaitaiStream(fileName));
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
            Mips = 8,
            Powerpc = 20,
            Powerpc64 = 21,
            S390 = 22,
            Arm = 40,
            Superh = 42,
            Sparcv9 = 43,
            Ia64 = 50,
            X8664 = 62,
            Avr = 83,
            Qdsp6 = 164,
            Aarch64 = 183,
            Avr32 = 185,
            Amdgpu = 224,
            Riscv = 243,
            Bpf = 247,
            Csky = 252,
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
            Maxpostags = 34,
            SunwAuxiliary = 1610612749,
            SunwFilter = 1610612750,
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
            SunwCapchainent = 1610612765,
            SunwCapchainsz = 1610612767,
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
            Hios = 1879048191,
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
        public Elf(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
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
            _abi = ((OsAbi) m_io.ReadU1());
            _abiVersion = m_io.ReadU1();
            _pad = m_io.ReadBytes(7);
            _header = new EndianElf(m_io, this, m_root);
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
                f_strings = false;
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
            public partial class DynsymSectionEntry64 : KaitaiStruct
            {
                public static DynsymSectionEntry64 FromFile(string fileName)
                {
                    return new DynsymSectionEntry64(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynsymSectionEntry64(KaitaiStream p__io, Elf.EndianElf.DynsymSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                    _nameOffset = m_io.ReadU4le();
                    _info = m_io.ReadU1();
                    _other = m_io.ReadU1();
                    _shndx = m_io.ReadU2le();
                    _value = m_io.ReadU8le();
                    _size = m_io.ReadU8le();
                }
                private void _readBE()
                {
                    _nameOffset = m_io.ReadU4be();
                    _info = m_io.ReadU1();
                    _other = m_io.ReadU1();
                    _shndx = m_io.ReadU2be();
                    _value = m_io.ReadU8be();
                    _size = m_io.ReadU8be();
                }
                private uint _nameOffset;
                private byte _info;
                private byte _other;
                private ushort _shndx;
                private ulong _value;
                private ulong _size;
                private Elf m_root;
                private Elf.EndianElf.DynsymSection m_parent;
                public uint NameOffset { get { return _nameOffset; } }
                public byte Info { get { return _info; } }
                public byte Other { get { return _other; } }
                public ushort Shndx { get { return _shndx; } }
                public ulong Value { get { return _value; } }
                public ulong Size { get { return _size; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.DynsymSection M_Parent { get { return m_parent; } }
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
                    f_dynamic = false;
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
                private bool f_dynamic;
                private DynamicSection _dynamic;
                public DynamicSection Dynamic
                {
                    get
                    {
                        if (f_dynamic)
                            return _dynamic;
                        if (Type == Elf.PhType.Dynamic) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(Offset);
                            if (m_isLe == true) {
                                __raw_dynamic = io.ReadBytes(Filesz);
                                var io___raw_dynamic = new KaitaiStream(__raw_dynamic);
                                _dynamic = new DynamicSection(io___raw_dynamic, this, m_root, m_isLe);
                            } else {
                                __raw_dynamic = io.ReadBytes(Filesz);
                                var io___raw_dynamic = new KaitaiStream(__raw_dynamic);
                                _dynamic = new DynamicSection(io___raw_dynamic, this, m_root, m_isLe);
                            }
                            io.Seek(_pos);
                            f_dynamic = true;
                        }
                        return _dynamic;
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
                private byte[] __raw_dynamic;
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
                public byte[] M_RawDynamic { get { return __raw_dynamic; } }
            }
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
                    f_tagEnum = false;
                    f_flag1Values = false;
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
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(OfsBody);
                        if (m_isLe == true) {
                            switch (Type) {
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
                            case Elf.ShType.Dynstr: {
                                __raw_body = io.ReadBytes(LenBody);
                                var io___raw_body = new KaitaiStream(__raw_body);
                                _body = new StringsStruct(io___raw_body, this, m_root, m_isLe);
                                break;
                            }
                            default: {
                                _body = io.ReadBytes(LenBody);
                                break;
                            }
                            }
                        } else {
                            switch (Type) {
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
                            case Elf.ShType.Dynstr: {
                                __raw_body = io.ReadBytes(LenBody);
                                var io___raw_body = new KaitaiStream(__raw_body);
                                _body = new StringsStruct(io___raw_body, this, m_root, m_isLe);
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
                        return _body;
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
                        KaitaiStream io = M_Root.Header.Strings.M_Io;
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
            public partial class DynamicSection : KaitaiStruct
            {
                public static DynamicSection FromFile(string fileName)
                {
                    return new DynamicSection(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynamicSection(KaitaiStream p__io, KaitaiStruct p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                private List<DynamicSectionEntry> _entries;
                private Elf m_root;
                private KaitaiStruct m_parent;
                public List<DynamicSectionEntry> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
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
                    _entries = new List<KaitaiStruct>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            switch (M_Root.Bits) {
                            case Elf.Bits.B32: {
                                _entries.Add(new DynsymSectionEntry32(m_io, this, m_root, m_isLe));
                                break;
                            }
                            case Elf.Bits.B64: {
                                _entries.Add(new DynsymSectionEntry64(m_io, this, m_root, m_isLe));
                                break;
                            }
                            }
                            i++;
                        }
                    }
                }
                private void _readBE()
                {
                    _entries = new List<KaitaiStruct>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            switch (M_Root.Bits) {
                            case Elf.Bits.B32: {
                                _entries.Add(new DynsymSectionEntry32(m_io, this, m_root, m_isLe));
                                break;
                            }
                            case Elf.Bits.B64: {
                                _entries.Add(new DynsymSectionEntry64(m_io, this, m_root, m_isLe));
                                break;
                            }
                            }
                            i++;
                        }
                    }
                }
                private List<KaitaiStruct> _entries;
                private Elf m_root;
                private Elf.EndianElf.SectionHeader m_parent;
                public List<KaitaiStruct> Entries { get { return _entries; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.SectionHeader M_Parent { get { return m_parent; } }
            }
            public partial class DynsymSectionEntry32 : KaitaiStruct
            {
                public static DynsymSectionEntry32 FromFile(string fileName)
                {
                    return new DynsymSectionEntry32(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public DynsymSectionEntry32(KaitaiStream p__io, Elf.EndianElf.DynsymSection p__parent = null, Elf p__root = null, bool? isLe = null) : base(p__io)
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
                    _nameOffset = m_io.ReadU4le();
                    _value = m_io.ReadU4le();
                    _size = m_io.ReadU4le();
                    _info = m_io.ReadU1();
                    _other = m_io.ReadU1();
                    _shndx = m_io.ReadU2le();
                }
                private void _readBE()
                {
                    _nameOffset = m_io.ReadU4be();
                    _value = m_io.ReadU4be();
                    _size = m_io.ReadU4be();
                    _info = m_io.ReadU1();
                    _other = m_io.ReadU1();
                    _shndx = m_io.ReadU2be();
                }
                private uint _nameOffset;
                private uint _value;
                private uint _size;
                private byte _info;
                private byte _other;
                private ushort _shndx;
                private Elf m_root;
                private Elf.EndianElf.DynsymSection m_parent;
                public uint NameOffset { get { return _nameOffset; } }
                public uint Value { get { return _value; } }
                public uint Size { get { return _size; } }
                public byte Info { get { return _info; } }
                public byte Other { get { return _other; } }
                public ushort Shndx { get { return _shndx; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf.DynsymSection M_Parent { get { return m_parent; } }
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
                            _entries.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true)));
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
                            _entries.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true)));
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
                        __raw_programHeaders = new List<byte[]>((int) (QtyProgramHeader));
                        _programHeaders = new List<ProgramHeader>((int) (QtyProgramHeader));
                        for (var i = 0; i < QtyProgramHeader; i++)
                        {
                            __raw_programHeaders.Add(m_io.ReadBytes(ProgramHeaderEntrySize));
                            var io___raw_programHeaders = new KaitaiStream(__raw_programHeaders[__raw_programHeaders.Count - 1]);
                            _programHeaders.Add(new ProgramHeader(io___raw_programHeaders, this, m_root, m_isLe));
                        }
                    } else {
                        __raw_programHeaders = new List<byte[]>((int) (QtyProgramHeader));
                        _programHeaders = new List<ProgramHeader>((int) (QtyProgramHeader));
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
                        __raw_sectionHeaders = new List<byte[]>((int) (QtySectionHeader));
                        _sectionHeaders = new List<SectionHeader>((int) (QtySectionHeader));
                        for (var i = 0; i < QtySectionHeader; i++)
                        {
                            __raw_sectionHeaders.Add(m_io.ReadBytes(SectionHeaderEntrySize));
                            var io___raw_sectionHeaders = new KaitaiStream(__raw_sectionHeaders[__raw_sectionHeaders.Count - 1]);
                            _sectionHeaders.Add(new SectionHeader(io___raw_sectionHeaders, this, m_root, m_isLe));
                        }
                    } else {
                        __raw_sectionHeaders = new List<byte[]>((int) (QtySectionHeader));
                        _sectionHeaders = new List<SectionHeader>((int) (QtySectionHeader));
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
            private bool f_strings;
            private StringsStruct _strings;
            public StringsStruct Strings
            {
                get
                {
                    if (f_strings)
                        return _strings;
                    long _pos = m_io.Pos;
                    m_io.Seek(SectionHeaders[SectionNamesIdx].OfsBody);
                    if (m_isLe == true) {
                        __raw_strings = m_io.ReadBytes(SectionHeaders[SectionNamesIdx].LenBody);
                        var io___raw_strings = new KaitaiStream(__raw_strings);
                        _strings = new StringsStruct(io___raw_strings, this, m_root, m_isLe);
                    } else {
                        __raw_strings = m_io.ReadBytes(SectionHeaders[SectionNamesIdx].LenBody);
                        var io___raw_strings = new KaitaiStream(__raw_strings);
                        _strings = new StringsStruct(io___raw_strings, this, m_root, m_isLe);
                    }
                    m_io.Seek(_pos);
                    f_strings = true;
                    return _strings;
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
            private byte[] __raw_strings;
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
            public byte[] M_RawStrings { get { return __raw_strings; } }
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
