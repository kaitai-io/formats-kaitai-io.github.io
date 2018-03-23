// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://github.com/lattera/glibc/blob/master/elf/elf.h">Source</a>
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
            NotSet = 0,
            Sparc = 2,
            X86 = 3,
            Mips = 8,
            Powerpc = 20,
            Arm = 40,
            Superh = 42,
            Ia64 = 50,
            X8664 = 62,
            Aarch64 = 183,
        }

        public enum PhdrType
        {
            Read = 1,
            Write = 2,
            Execute = 4,
            MaskProc = 4026531840,
        }

        public enum SectionHeaderFlags
        {
            Write = 1,
            Alloc = 2,
            ExecInstr = 4,
            Merge = 16,
            Strings = 32,
            InfoLink = 64,
            LinkOrder = 128,
            OsNonConforming = 256,
            Group = 512,
            Tls = 1024,
            Ordered = 67108864,
            Exclude = 134217728,
            MaskProc = 4026531840,
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
            Hios = 1879044096,
            Valrnglo = 1879047424,
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
            Valrnghi = 1879047679,
            Addrrnglo = 1879047680,
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
            Addrrnghi = 1879047935,
            Versym = 1879048176,
            Relacount = 1879048185,
            Relcount = 1879048186,
            Flags1 = 1879048187,
            Verdef = 1879048188,
            Verdefnum = 1879048189,
            Verneed = 1879048190,
            Verneednum = 1879048191,
            Loproc = 1879048192,
            SparcRegister = 1879048193,
            Auxiliary = 2147483645,
            Used = 2147483646,
            Hiproc = 2147483647,
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
            PaxFlags = 1694766464,
            Hios = 1879048191,
        }

        public enum ObjType
        {
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
            _magic = m_io.EnsureFixedContents(new byte[] { 127, 69, 76, 70 });
            _bits = ((Bits) m_io.ReadU1());
            _endian = ((Endian) m_io.ReadU1());
            _eiVersion = m_io.ReadU1();
            _abi = ((OsAbi) m_io.ReadU1());
            _abiVersion = m_io.ReadU1();
            _pad = m_io.ReadBytes(7);
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
                    throw new Exception("Unable to decide on endianness");
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
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new Exception("Unable to decide on endianness");
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
                        _flags64 = ((Elf.PhdrType) m_io.ReadU4le());
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
                        _flags64 = ((Elf.PhdrType) m_io.ReadU4be());
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
                        }
                        f_dynamic = true;
                        return _dynamic;
                    }
                }
                private PhType _type;
                private PhdrType _flags64;
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
                public PhdrType Flags64 { get { return _flags64; } }
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
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new Exception("Unable to decide on endianness");
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
                    f_flagsEnum = false;
                    f_body = false;
                    f_strtab = false;
                    f_name = false;
                    f_dynamic = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new Exception("Unable to decide on endianness");
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _nameOffset = m_io.ReadU4le();
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
                        _size = m_io.ReadU4le();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _size = m_io.ReadU8le();
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
                    _nameOffset = m_io.ReadU4be();
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
                        _size = m_io.ReadU4be();
                        break;
                    }
                    case Elf.Bits.B64: {
                        _size = m_io.ReadU8be();
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
                private bool f_flagsEnum;
                private SectionHeaderFlags _flagsEnum;
                public SectionHeaderFlags FlagsEnum
                {
                    get
                    {
                        if (f_flagsEnum)
                            return _flagsEnum;
                        _flagsEnum = (SectionHeaderFlags) (((Elf.SectionHeaderFlags) Flags));
                        f_flagsEnum = true;
                        return _flagsEnum;
                    }
                }
                private bool f_body;
                private byte[] _body;
                public byte[] Body
                {
                    get
                    {
                        if (f_body)
                            return _body;
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(Offset);
                        if (m_isLe == true) {
                            _body = io.ReadBytes(Size);
                        } else {
                            _body = io.ReadBytes(Size);
                        }
                        io.Seek(_pos);
                        f_body = true;
                        return _body;
                    }
                }
                private bool f_strtab;
                private StringsStruct _strtab;
                public StringsStruct Strtab
                {
                    get
                    {
                        if (f_strtab)
                            return _strtab;
                        if (Type == Elf.ShType.Strtab) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(Offset);
                            if (m_isLe == true) {
                                __raw_strtab = io.ReadBytes(Size);
                                var io___raw_strtab = new KaitaiStream(__raw_strtab);
                                _strtab = new StringsStruct(io___raw_strtab, this, m_root, m_isLe);
                            } else {
                                __raw_strtab = io.ReadBytes(Size);
                                var io___raw_strtab = new KaitaiStream(__raw_strtab);
                                _strtab = new StringsStruct(io___raw_strtab, this, m_root, m_isLe);
                            }
                            io.Seek(_pos);
                        }
                        f_strtab = true;
                        return _strtab;
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
                        io.Seek(NameOffset);
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
                private bool f_dynamic;
                private DynamicSection _dynamic;
                public DynamicSection Dynamic
                {
                    get
                    {
                        if (f_dynamic)
                            return _dynamic;
                        if (Type == Elf.ShType.Dynamic) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(Offset);
                            if (m_isLe == true) {
                                __raw_dynamic = io.ReadBytes(Size);
                                var io___raw_dynamic = new KaitaiStream(__raw_dynamic);
                                _dynamic = new DynamicSection(io___raw_dynamic, this, m_root, m_isLe);
                            } else {
                                __raw_dynamic = io.ReadBytes(Size);
                                var io___raw_dynamic = new KaitaiStream(__raw_dynamic);
                                _dynamic = new DynamicSection(io___raw_dynamic, this, m_root, m_isLe);
                            }
                            io.Seek(_pos);
                        }
                        f_dynamic = true;
                        return _dynamic;
                    }
                }
                private uint _nameOffset;
                private ShType _type;
                private ulong _flags;
                private ulong _addr;
                private ulong _offset;
                private ulong _size;
                private uint _linkedSectionIdx;
                private byte[] _info;
                private ulong _align;
                private ulong _entrySize;
                private Elf m_root;
                private Elf.EndianElf m_parent;
                private byte[] __raw_strtab;
                private byte[] __raw_dynamic;
                public uint NameOffset { get { return _nameOffset; } }
                public ShType Type { get { return _type; } }
                public ulong Flags { get { return _flags; } }
                public ulong Addr { get { return _addr; } }
                public ulong Offset { get { return _offset; } }
                public ulong Size { get { return _size; } }
                public uint LinkedSectionIdx { get { return _linkedSectionIdx; } }
                public byte[] Info { get { return _info; } }
                public ulong Align { get { return _align; } }
                public ulong EntrySize { get { return _entrySize; } }
                public Elf M_Root { get { return m_root; } }
                public Elf.EndianElf M_Parent { get { return m_parent; } }
                public byte[] M_RawStrtab { get { return __raw_strtab; } }
                public byte[] M_RawDynamic { get { return __raw_dynamic; } }
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
                        throw new Exception("Unable to decide on endianness");
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
                        throw new Exception("Unable to decide on endianness");
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
                    m_io.Seek(SectionHeaders[SectionNamesIdx].Offset);
                    if (m_isLe == true) {
                        __raw_strings = m_io.ReadBytes(SectionHeaders[SectionNamesIdx].Size);
                        var io___raw_strings = new KaitaiStream(__raw_strings);
                        _strings = new StringsStruct(io___raw_strings, this, m_root, m_isLe);
                    } else {
                        __raw_strings = m_io.ReadBytes(SectionHeaders[SectionNamesIdx].Size);
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
