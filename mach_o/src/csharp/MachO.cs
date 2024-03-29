// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://www.stonedcoder.org/~kd/lib/MachORuntime.pdf">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://opensource.apple.com/source/python_modules/python_modules-43/Modules/macholib-1.5.1/macholib-1.5.1.tar.gz">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/comex/cs/blob/07a88f9/macho_cs.py">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://opensource.apple.com/source/Security/Security-55471/libsecurity_codesigning/requirements.grammar.auto.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/apple/darwin-xnu/blob/xnu-2782.40.9/bsd/sys/codesign.h">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachO.cpp.auto.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachOCompressed.cpp.auto.html">Source</a>
    /// </remarks>
    public partial class MachO : KaitaiStruct
    {
        public static MachO FromFile(string fileName)
        {
            return new MachO(new KaitaiStream(fileName));
        }


        public enum MagicType
        {
            MachoLeX86 = 3472551422,
            MachoLeX64 = 3489328638,
            MachoBeX86 = 4277009102,
            MachoBeX64 = 4277009103,
        }

        public enum CpuType
        {
            Vax = 1,
            Romp = 2,
            Ns32032 = 4,
            Ns32332 = 5,
            I386 = 7,
            Mips = 8,
            Ns32532 = 9,
            Hppa = 11,
            Arm = 12,
            Mc88000 = 13,
            Sparc = 14,
            I860 = 15,
            I860Little = 16,
            Rs6000 = 17,
            Powerpc = 18,
            Abi64 = 16777216,
            X8664 = 16777223,
            Arm64 = 16777228,
            Powerpc64 = 16777234,
            Any = 4294967295,
        }

        public enum FileType
        {
            Object = 1,
            Execute = 2,
            Fvmlib = 3,
            Core = 4,
            Preload = 5,
            Dylib = 6,
            Dylinker = 7,
            Bundle = 8,
            DylibStub = 9,
            Dsym = 10,
            KextBundle = 11,
        }

        public enum LoadCommandType
        {
            Segment = 1,
            Symtab = 2,
            Symseg = 3,
            Thread = 4,
            UnixThread = 5,
            LoadFvmLib = 6,
            IdFvmLib = 7,
            Ident = 8,
            FvmFile = 9,
            Prepage = 10,
            Dysymtab = 11,
            LoadDylib = 12,
            IdDylib = 13,
            LoadDylinker = 14,
            IdDylinker = 15,
            PreboundDylib = 16,
            Routines = 17,
            SubFramework = 18,
            SubUmbrella = 19,
            SubClient = 20,
            SubLibrary = 21,
            TwolevelHints = 22,
            PrebindCksum = 23,
            Segment64 = 25,
            Routines64 = 26,
            Uuid = 27,
            CodeSignature = 29,
            SegmentSplitInfo = 30,
            LazyLoadDylib = 32,
            EncryptionInfo = 33,
            DyldInfo = 34,
            VersionMinMacosx = 36,
            VersionMinIphoneos = 37,
            FunctionStarts = 38,
            DyldEnvironment = 39,
            DataInCode = 41,
            SourceVersion = 42,
            DylibCodeSignDrs = 43,
            EncryptionInfo64 = 44,
            LinkerOption = 45,
            LinkerOptimizationHint = 46,
            VersionMinTvos = 47,
            VersionMinWatchos = 48,
            BuildVersion = 50,
            ReqDyld = 2147483648,
            LoadWeakDylib = 2147483672,
            Rpath = 2147483676,
            ReexportDylib = 2147483679,
            DyldInfoOnly = 2147483682,
            LoadUpwardDylib = 2147483683,
            Main = 2147483688,
        }
        public MachO(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = ((MagicType) m_io.ReadU4be());
            _header = new MachHeader(m_io, this, m_root);
            _loadCommands = new List<LoadCommand>();
            for (var i = 0; i < Header.Ncmds; i++)
            {
                _loadCommands.Add(new LoadCommand(m_io, this, m_root));
            }
        }
        public partial class RpathCommand : KaitaiStruct
        {
            public static RpathCommand FromFile(string fileName)
            {
                return new RpathCommand(new KaitaiStream(fileName));
            }

            public RpathCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pathOffset = m_io.ReadU4le();
                _path = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private uint _pathOffset;
            private string _path;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint PathOffset { get { return _pathOffset; } }
            public string Path { get { return _path; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class Uleb128 : KaitaiStruct
        {
            public static Uleb128 FromFile(string fileName)
            {
                return new Uleb128(new KaitaiStream(fileName));
            }

            public Uleb128(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                if ((B1 & 128) != 0) {
                    _b2 = m_io.ReadU1();
                }
                if ((B2 & 128) != 0) {
                    _b3 = m_io.ReadU1();
                }
                if ((B3 & 128) != 0) {
                    _b4 = m_io.ReadU1();
                }
                if ((B4 & 128) != 0) {
                    _b5 = m_io.ReadU1();
                }
                if ((B5 & 128) != 0) {
                    _b6 = m_io.ReadU1();
                }
                if ((B6 & 128) != 0) {
                    _b7 = m_io.ReadU1();
                }
                if ((B7 & 128) != 0) {
                    _b8 = m_io.ReadU1();
                }
                if ((B8 & 128) != 0) {
                    _b9 = m_io.ReadU1();
                }
                if ((B9 & 128) != 0) {
                    _b10 = m_io.ReadU1();
                }
            }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (int) (((KaitaiStream.Mod(B1, 128) << 0) + ((B1 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B2, 128) << 7) + ((B2 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B3, 128) << 14) + ((B3 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B4, 128) << 21) + ((B4 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B5, 128) << 28) + ((B5 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B6, 128) << 35) + ((B6 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B7, 128) << 42) + ((B7 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B8, 128) << 49) + ((B8 & 128) == 0 ? 0 : ((KaitaiStream.Mod(B9, 128) << 56) + ((B8 & 128) == 0 ? 0 : (KaitaiStream.Mod(B10, 128) << 63))))))))))))))))))));
                    f_value = true;
                    return _value;
                }
            }
            private byte _b1;
            private byte? _b2;
            private byte? _b3;
            private byte? _b4;
            private byte? _b5;
            private byte? _b6;
            private byte? _b7;
            private byte? _b8;
            private byte? _b9;
            private byte? _b10;
            private MachO m_root;
            private KaitaiStruct m_parent;
            public byte B1 { get { return _b1; } }
            public byte? B2 { get { return _b2; } }
            public byte? B3 { get { return _b3; } }
            public byte? B4 { get { return _b4; } }
            public byte? B5 { get { return _b5; } }
            public byte? B6 { get { return _b6; } }
            public byte? B7 { get { return _b7; } }
            public byte? B8 { get { return _b8; } }
            public byte? B9 { get { return _b9; } }
            public byte? B10 { get { return _b10; } }
            public MachO M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class SourceVersionCommand : KaitaiStruct
        {
            public static SourceVersionCommand FromFile(string fileName)
            {
                return new SourceVersionCommand(new KaitaiStream(fileName));
            }

            public SourceVersionCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU8le();
            }
            private ulong _version;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public ulong Version { get { return _version; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class CsBlob : KaitaiStruct
        {
            public static CsBlob FromFile(string fileName)
            {
                return new CsBlob(new KaitaiStream(fileName));
            }


            public enum CsMagic
            {
                BlobWrapper = 4208855809,
                Requirement = 4208856064,
                Requirements = 4208856065,
                CodeDirectory = 4208856066,
                EmbeddedSignature = 4208856256,
                DetachedSignature = 4208856257,
                Entitlements = 4208882033,
                DerEntitlements = 4208882034,
            }
            public CsBlob(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = ((CsMagic) m_io.ReadU4be());
                _length = m_io.ReadU4be();
                switch (Magic) {
                case CsMagic.Requirement: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Requirement(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.CodeDirectory: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new CodeDirectory(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.Requirements: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Requirements(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.BlobWrapper: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new BlobWrapper(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.EmbeddedSignature: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SuperBlob(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.Entitlements: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Entitlements(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.DetachedSignature: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SuperBlob(io___raw_body, this, m_root);
                    break;
                }
                case CsMagic.DerEntitlements: {
                    __raw_body = m_io.ReadBytes((Length - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Asn1Der(io___raw_body);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes((Length - 8));
                    break;
                }
                }
            }
            public partial class CodeDirectory : KaitaiStruct
            {
                public static CodeDirectory FromFile(string fileName)
                {
                    return new CodeDirectory(new KaitaiStream(fileName));
                }

                public CodeDirectory(KaitaiStream p__io, MachO.CsBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_ident = false;
                    f_teamId = false;
                    f_hashes = false;
                    _read();
                }
                private void _read()
                {
                    _version = m_io.ReadU4be();
                    _flags = m_io.ReadU4be();
                    _hashOffset = m_io.ReadU4be();
                    _identOffset = m_io.ReadU4be();
                    _nSpecialSlots = m_io.ReadU4be();
                    _nCodeSlots = m_io.ReadU4be();
                    _codeLimit = m_io.ReadU4be();
                    _hashSize = m_io.ReadU1();
                    _hashType = m_io.ReadU1();
                    _spare1 = m_io.ReadU1();
                    _pageSize = m_io.ReadU1();
                    _spare2 = m_io.ReadU4be();
                    if (Version >= 131328) {
                        _scatterOffset = m_io.ReadU4be();
                    }
                    if (Version >= 131584) {
                        _teamIdOffset = m_io.ReadU4be();
                    }
                }
                private bool f_ident;
                private string _ident;
                public string Ident
                {
                    get
                    {
                        if (f_ident)
                            return _ident;
                        long _pos = m_io.Pos;
                        m_io.Seek((IdentOffset - 8));
                        _ident = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                        m_io.Seek(_pos);
                        f_ident = true;
                        return _ident;
                    }
                }
                private bool f_teamId;
                private string _teamId;
                public string TeamId
                {
                    get
                    {
                        if (f_teamId)
                            return _teamId;
                        long _pos = m_io.Pos;
                        m_io.Seek((TeamIdOffset - 8));
                        _teamId = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                        m_io.Seek(_pos);
                        f_teamId = true;
                        return _teamId;
                    }
                }
                private bool f_hashes;
                private List<byte[]> _hashes;
                public List<byte[]> Hashes
                {
                    get
                    {
                        if (f_hashes)
                            return _hashes;
                        long _pos = m_io.Pos;
                        m_io.Seek(((HashOffset - 8) - (HashSize * NSpecialSlots)));
                        _hashes = new List<byte[]>();
                        for (var i = 0; i < (NSpecialSlots + NCodeSlots); i++)
                        {
                            _hashes.Add(m_io.ReadBytes(HashSize));
                        }
                        m_io.Seek(_pos);
                        f_hashes = true;
                        return _hashes;
                    }
                }
                private uint _version;
                private uint _flags;
                private uint _hashOffset;
                private uint _identOffset;
                private uint _nSpecialSlots;
                private uint _nCodeSlots;
                private uint _codeLimit;
                private byte _hashSize;
                private byte _hashType;
                private byte _spare1;
                private byte _pageSize;
                private uint _spare2;
                private uint? _scatterOffset;
                private uint? _teamIdOffset;
                private MachO m_root;
                private MachO.CsBlob m_parent;
                public uint Version { get { return _version; } }
                public uint Flags { get { return _flags; } }
                public uint HashOffset { get { return _hashOffset; } }
                public uint IdentOffset { get { return _identOffset; } }
                public uint NSpecialSlots { get { return _nSpecialSlots; } }
                public uint NCodeSlots { get { return _nCodeSlots; } }
                public uint CodeLimit { get { return _codeLimit; } }
                public byte HashSize { get { return _hashSize; } }
                public byte HashType { get { return _hashType; } }
                public byte Spare1 { get { return _spare1; } }
                public byte PageSize { get { return _pageSize; } }
                public uint Spare2 { get { return _spare2; } }
                public uint? ScatterOffset { get { return _scatterOffset; } }
                public uint? TeamIdOffset { get { return _teamIdOffset; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob M_Parent { get { return m_parent; } }
            }
            public partial class Data : KaitaiStruct
            {
                public static Data FromFile(string fileName)
                {
                    return new Data(new KaitaiStream(fileName));
                }

                public Data(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _length = m_io.ReadU4be();
                    _value = m_io.ReadBytes(Length);
                    _padding = m_io.ReadBytes(KaitaiStream.Mod(-(Length), 4));
                }
                private uint _length;
                private byte[] _value;
                private byte[] _padding;
                private MachO m_root;
                private KaitaiStruct m_parent;
                public uint Length { get { return _length; } }
                public byte[] Value { get { return _value; } }
                public byte[] Padding { get { return _padding; } }
                public MachO M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class SuperBlob : KaitaiStruct
            {
                public static SuperBlob FromFile(string fileName)
                {
                    return new SuperBlob(new KaitaiStream(fileName));
                }

                public SuperBlob(KaitaiStream p__io, MachO.CsBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _count = m_io.ReadU4be();
                    _blobs = new List<BlobIndex>();
                    for (var i = 0; i < Count; i++)
                    {
                        _blobs.Add(new BlobIndex(m_io, this, m_root));
                    }
                }
                private uint _count;
                private List<BlobIndex> _blobs;
                private MachO m_root;
                private MachO.CsBlob m_parent;
                public uint Count { get { return _count; } }
                public List<BlobIndex> Blobs { get { return _blobs; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob M_Parent { get { return m_parent; } }
            }
            public partial class Expr : KaitaiStruct
            {
                public static Expr FromFile(string fileName)
                {
                    return new Expr(new KaitaiStream(fileName));
                }


                public enum OpEnum
                {
                    False = 0,
                    True = 1,
                    Ident = 2,
                    AppleAnchor = 3,
                    AnchorHash = 4,
                    InfoKeyValue = 5,
                    AndOp = 6,
                    OrOp = 7,
                    CdHash = 8,
                    NotOp = 9,
                    InfoKeyField = 10,
                    CertField = 11,
                    TrustedCert = 12,
                    TrustedCerts = 13,
                    CertGeneric = 14,
                    AppleGenericAnchor = 15,
                    EntitlementField = 16,
                }

                public enum CertSlot
                {
                    LeftCert = 0,
                    AnchorCert = 4294967295,
                }
                public Expr(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _op = ((OpEnum) m_io.ReadU4be());
                    switch (Op) {
                    case OpEnum.Ident: {
                        _data = new IdentExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.OrOp: {
                        _data = new OrExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.InfoKeyValue: {
                        _data = new Data(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.AnchorHash: {
                        _data = new AnchorHashExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.InfoKeyField: {
                        _data = new InfoKeyFieldExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.NotOp: {
                        _data = new Expr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.EntitlementField: {
                        _data = new EntitlementFieldExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.TrustedCert: {
                        _data = new CertSlotExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.AndOp: {
                        _data = new AndExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.CertGeneric: {
                        _data = new CertGenericExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.CertField: {
                        _data = new CertFieldExpr(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.CdHash: {
                        _data = new Data(m_io, this, m_root);
                        break;
                    }
                    case OpEnum.AppleGenericAnchor: {
                        _data = new AppleGenericAnchorExpr(m_io, this, m_root);
                        break;
                    }
                    }
                }
                public partial class InfoKeyFieldExpr : KaitaiStruct
                {
                    public static InfoKeyFieldExpr FromFile(string fileName)
                    {
                        return new InfoKeyFieldExpr(new KaitaiStream(fileName));
                    }

                    public InfoKeyFieldExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _data = new Data(m_io, this, m_root);
                        _match = new Match(m_io, this, m_root);
                    }
                    private Data _data;
                    private Match _match;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public Data Data { get { return _data; } }
                    public Match Match { get { return _match; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class CertSlotExpr : KaitaiStruct
                {
                    public static CertSlotExpr FromFile(string fileName)
                    {
                        return new CertSlotExpr(new KaitaiStream(fileName));
                    }

                    public CertSlotExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _value = ((MachO.CsBlob.Expr.CertSlot) m_io.ReadU4be());
                    }
                    private CertSlot _value;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public CertSlot Value { get { return _value; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class CertGenericExpr : KaitaiStruct
                {
                    public static CertGenericExpr FromFile(string fileName)
                    {
                        return new CertGenericExpr(new KaitaiStream(fileName));
                    }

                    public CertGenericExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _certSlot = ((MachO.CsBlob.Expr.CertSlot) m_io.ReadU4be());
                        _data = new Data(m_io, this, m_root);
                        _match = new Match(m_io, this, m_root);
                    }
                    private CertSlot _certSlot;
                    private Data _data;
                    private Match _match;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public CertSlot CertSlot { get { return _certSlot; } }
                    public Data Data { get { return _data; } }
                    public Match Match { get { return _match; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class IdentExpr : KaitaiStruct
                {
                    public static IdentExpr FromFile(string fileName)
                    {
                        return new IdentExpr(new KaitaiStream(fileName));
                    }

                    public IdentExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _identifier = new Data(m_io, this, m_root);
                    }
                    private Data _identifier;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public Data Identifier { get { return _identifier; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class CertFieldExpr : KaitaiStruct
                {
                    public static CertFieldExpr FromFile(string fileName)
                    {
                        return new CertFieldExpr(new KaitaiStream(fileName));
                    }

                    public CertFieldExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _certSlot = ((MachO.CsBlob.Expr.CertSlot) m_io.ReadU4be());
                        _data = new Data(m_io, this, m_root);
                        _match = new Match(m_io, this, m_root);
                    }
                    private CertSlot _certSlot;
                    private Data _data;
                    private Match _match;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public CertSlot CertSlot { get { return _certSlot; } }
                    public Data Data { get { return _data; } }
                    public Match Match { get { return _match; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class AnchorHashExpr : KaitaiStruct
                {
                    public static AnchorHashExpr FromFile(string fileName)
                    {
                        return new AnchorHashExpr(new KaitaiStream(fileName));
                    }

                    public AnchorHashExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _certSlot = ((MachO.CsBlob.Expr.CertSlot) m_io.ReadU4be());
                        _data = new Data(m_io, this, m_root);
                    }
                    private CertSlot _certSlot;
                    private Data _data;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public CertSlot CertSlot { get { return _certSlot; } }
                    public Data Data { get { return _data; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class AppleGenericAnchorExpr : KaitaiStruct
                {
                    public static AppleGenericAnchorExpr FromFile(string fileName)
                    {
                        return new AppleGenericAnchorExpr(new KaitaiStream(fileName));
                    }

                    public AppleGenericAnchorExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_value = false;
                        _read();
                    }
                    private void _read()
                    {
                    }
                    private bool f_value;
                    private string _value;
                    public string Value
                    {
                        get
                        {
                            if (f_value)
                                return _value;
                            _value = (string) ("anchor apple generic");
                            f_value = true;
                            return _value;
                        }
                    }
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class EntitlementFieldExpr : KaitaiStruct
                {
                    public static EntitlementFieldExpr FromFile(string fileName)
                    {
                        return new EntitlementFieldExpr(new KaitaiStream(fileName));
                    }

                    public EntitlementFieldExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _data = new Data(m_io, this, m_root);
                        _match = new Match(m_io, this, m_root);
                    }
                    private Data _data;
                    private Match _match;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public Data Data { get { return _data; } }
                    public Match Match { get { return _match; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class AndExpr : KaitaiStruct
                {
                    public static AndExpr FromFile(string fileName)
                    {
                        return new AndExpr(new KaitaiStream(fileName));
                    }

                    public AndExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _left = new Expr(m_io, this, m_root);
                        _right = new Expr(m_io, this, m_root);
                    }
                    private Expr _left;
                    private Expr _right;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public Expr Left { get { return _left; } }
                    public Expr Right { get { return _right; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                public partial class OrExpr : KaitaiStruct
                {
                    public static OrExpr FromFile(string fileName)
                    {
                        return new OrExpr(new KaitaiStream(fileName));
                    }

                    public OrExpr(KaitaiStream p__io, MachO.CsBlob.Expr p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _left = new Expr(m_io, this, m_root);
                        _right = new Expr(m_io, this, m_root);
                    }
                    private Expr _left;
                    private Expr _right;
                    private MachO m_root;
                    private MachO.CsBlob.Expr m_parent;
                    public Expr Left { get { return _left; } }
                    public Expr Right { get { return _right; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.CsBlob.Expr M_Parent { get { return m_parent; } }
                }
                private OpEnum _op;
                private KaitaiStruct _data;
                private MachO m_root;
                private KaitaiStruct m_parent;
                public OpEnum Op { get { return _op; } }
                public KaitaiStruct Data { get { return _data; } }
                public MachO M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class BlobIndex : KaitaiStruct
            {
                public static BlobIndex FromFile(string fileName)
                {
                    return new BlobIndex(new KaitaiStream(fileName));
                }


                public enum CsslotType
                {
                    CodeDirectory = 0,
                    InfoSlot = 1,
                    Requirements = 2,
                    ResourceDir = 3,
                    Application = 4,
                    Entitlements = 5,
                    DerEntitlements = 7,
                    AlternateCodeDirectories = 4096,
                    SignatureSlot = 65536,
                }
                public BlobIndex(KaitaiStream p__io, MachO.CsBlob.SuperBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_blob = false;
                    _read();
                }
                private void _read()
                {
                    _type = ((CsslotType) m_io.ReadU4be());
                    _offset = m_io.ReadU4be();
                }
                private bool f_blob;
                private CsBlob _blob;
                public CsBlob Blob
                {
                    get
                    {
                        if (f_blob)
                            return _blob;
                        KaitaiStream io = M_Parent.M_Io;
                        long _pos = io.Pos;
                        io.Seek((Offset - 8));
                        __raw_blob = io.ReadBytesFull();
                        var io___raw_blob = new KaitaiStream(__raw_blob);
                        _blob = new CsBlob(io___raw_blob, this, m_root);
                        io.Seek(_pos);
                        f_blob = true;
                        return _blob;
                    }
                }
                private CsslotType _type;
                private uint _offset;
                private MachO m_root;
                private MachO.CsBlob.SuperBlob m_parent;
                private byte[] __raw_blob;
                public CsslotType Type { get { return _type; } }
                public uint Offset { get { return _offset; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob.SuperBlob M_Parent { get { return m_parent; } }
                public byte[] M_RawBlob { get { return __raw_blob; } }
            }
            public partial class Match : KaitaiStruct
            {
                public static Match FromFile(string fileName)
                {
                    return new Match(new KaitaiStream(fileName));
                }


                public enum Op
                {
                    Exists = 0,
                    Equal = 1,
                    Contains = 2,
                    BeginsWith = 3,
                    EndsWith = 4,
                    LessThan = 5,
                    GreaterThan = 6,
                    LessEqual = 7,
                    GreaterEqual = 8,
                }
                public Match(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _matchOp = ((Op) m_io.ReadU4be());
                    if (MatchOp != Op.Exists) {
                        _data = new Data(m_io, this, m_root);
                    }
                }
                private Op _matchOp;
                private Data _data;
                private MachO m_root;
                private KaitaiStruct m_parent;
                public Op MatchOp { get { return _matchOp; } }
                public Data Data { get { return _data; } }
                public MachO M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class Requirement : KaitaiStruct
            {
                public static Requirement FromFile(string fileName)
                {
                    return new Requirement(new KaitaiStream(fileName));
                }

                public Requirement(KaitaiStream p__io, MachO.CsBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _kind = m_io.ReadU4be();
                    _expr = new Expr(m_io, this, m_root);
                }
                private uint _kind;
                private Expr _expr;
                private MachO m_root;
                private MachO.CsBlob m_parent;
                public uint Kind { get { return _kind; } }
                public Expr Expr { get { return _expr; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob M_Parent { get { return m_parent; } }
            }
            public partial class Requirements : KaitaiStruct
            {
                public static Requirements FromFile(string fileName)
                {
                    return new Requirements(new KaitaiStream(fileName));
                }

                public Requirements(KaitaiStream p__io, MachO.CsBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _count = m_io.ReadU4be();
                    _items = new List<RequirementsBlobIndex>();
                    for (var i = 0; i < Count; i++)
                    {
                        _items.Add(new RequirementsBlobIndex(m_io, this, m_root));
                    }
                }
                private uint _count;
                private List<RequirementsBlobIndex> _items;
                private MachO m_root;
                private MachO.CsBlob m_parent;
                public uint Count { get { return _count; } }
                public List<RequirementsBlobIndex> Items { get { return _items; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob M_Parent { get { return m_parent; } }
            }
            public partial class BlobWrapper : KaitaiStruct
            {
                public static BlobWrapper FromFile(string fileName)
                {
                    return new BlobWrapper(new KaitaiStream(fileName));
                }

                public BlobWrapper(KaitaiStream p__io, MachO.CsBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _data = m_io.ReadBytesFull();
                }
                private byte[] _data;
                private MachO m_root;
                private MachO.CsBlob m_parent;
                public byte[] Data { get { return _data; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob M_Parent { get { return m_parent; } }
            }
            public partial class Entitlements : KaitaiStruct
            {
                public static Entitlements FromFile(string fileName)
                {
                    return new Entitlements(new KaitaiStream(fileName));
                }

                public Entitlements(KaitaiStream p__io, MachO.CsBlob p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _data = m_io.ReadBytesFull();
                }
                private byte[] _data;
                private MachO m_root;
                private MachO.CsBlob m_parent;
                public byte[] Data { get { return _data; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob M_Parent { get { return m_parent; } }
            }
            public partial class RequirementsBlobIndex : KaitaiStruct
            {
                public static RequirementsBlobIndex FromFile(string fileName)
                {
                    return new RequirementsBlobIndex(new KaitaiStream(fileName));
                }


                public enum RequirementType
                {
                    Host = 1,
                    Guest = 2,
                    Designated = 3,
                    Library = 4,
                }
                public RequirementsBlobIndex(KaitaiStream p__io, MachO.CsBlob.Requirements p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_value = false;
                    _read();
                }
                private void _read()
                {
                    _type = ((RequirementType) m_io.ReadU4be());
                    _offset = m_io.ReadU4be();
                }
                private bool f_value;
                private CsBlob _value;
                public CsBlob Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        long _pos = m_io.Pos;
                        m_io.Seek((Offset - 8));
                        _value = new CsBlob(m_io, this, m_root);
                        m_io.Seek(_pos);
                        f_value = true;
                        return _value;
                    }
                }
                private RequirementType _type;
                private uint _offset;
                private MachO m_root;
                private MachO.CsBlob.Requirements m_parent;
                public RequirementType Type { get { return _type; } }
                public uint Offset { get { return _offset; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.CsBlob.Requirements M_Parent { get { return m_parent; } }
            }
            private CsMagic _magic;
            private uint _length;
            private object _body;
            private MachO m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_body;
            public CsMagic Magic { get { return _magic; } }
            public uint Length { get { return _length; } }
            public object Body { get { return _body; } }
            public MachO M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class BuildVersionCommand : KaitaiStruct
        {
            public static BuildVersionCommand FromFile(string fileName)
            {
                return new BuildVersionCommand(new KaitaiStream(fileName));
            }

            public BuildVersionCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _platform = m_io.ReadU4le();
                _minos = m_io.ReadU4le();
                _sdk = m_io.ReadU4le();
                _ntools = m_io.ReadU4le();
                _tools = new List<BuildToolVersion>();
                for (var i = 0; i < Ntools; i++)
                {
                    _tools.Add(new BuildToolVersion(m_io, this, m_root));
                }
            }
            public partial class BuildToolVersion : KaitaiStruct
            {
                public static BuildToolVersion FromFile(string fileName)
                {
                    return new BuildToolVersion(new KaitaiStream(fileName));
                }

                public BuildToolVersion(KaitaiStream p__io, MachO.BuildVersionCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _tool = m_io.ReadU4le();
                    _version = m_io.ReadU4le();
                }
                private uint _tool;
                private uint _version;
                private MachO m_root;
                private MachO.BuildVersionCommand m_parent;
                public uint Tool { get { return _tool; } }
                public uint Version { get { return _version; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.BuildVersionCommand M_Parent { get { return m_parent; } }
            }
            private uint _platform;
            private uint _minos;
            private uint _sdk;
            private uint _ntools;
            private List<BuildToolVersion> _tools;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint Platform { get { return _platform; } }
            public uint Minos { get { return _minos; } }
            public uint Sdk { get { return _sdk; } }
            public uint Ntools { get { return _ntools; } }
            public List<BuildToolVersion> Tools { get { return _tools; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class RoutinesCommand : KaitaiStruct
        {
            public static RoutinesCommand FromFile(string fileName)
            {
                return new RoutinesCommand(new KaitaiStream(fileName));
            }

            public RoutinesCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _initAddress = m_io.ReadU4le();
                _initModule = m_io.ReadU4le();
                _reserved = m_io.ReadBytes(24);
            }
            private uint _initAddress;
            private uint _initModule;
            private byte[] _reserved;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint InitAddress { get { return _initAddress; } }
            public uint InitModule { get { return _initModule; } }
            public byte[] Reserved { get { return _reserved; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class MachoFlags : KaitaiStruct
        {
            public MachoFlags(uint p_value, KaitaiStream p__io, MachO.MachHeader p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _value = p_value;
                f_subsectionsViaSymbols = false;
                f_deadStrippableDylib = false;
                f_weakDefines = false;
                f_prebound = false;
                f_allModsBound = false;
                f_hasTlvDescriptors = false;
                f_forceFlat = false;
                f_rootSafe = false;
                f_noUndefs = false;
                f_setuidSafe = false;
                f_noHeapExecution = false;
                f_noReexportedDylibs = false;
                f_noMultiDefs = false;
                f_appExtensionSafe = false;
                f_prebindable = false;
                f_incrLink = false;
                f_bindAtLoad = false;
                f_canonical = false;
                f_twoLevel = false;
                f_splitSegs = false;
                f_lazyInit = false;
                f_allowStackExecution = false;
                f_bindsToWeak = false;
                f_noFixPrebinding = false;
                f_dyldLink = false;
                f_pie = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_subsectionsViaSymbols;
            private bool _subsectionsViaSymbols;

            /// <summary>
            /// safe to divide up the sections into sub-sections via symbols for dead code stripping
            /// </summary>
            public bool SubsectionsViaSymbols
            {
                get
                {
                    if (f_subsectionsViaSymbols)
                        return _subsectionsViaSymbols;
                    _subsectionsViaSymbols = (bool) ((Value & 8192) != 0);
                    f_subsectionsViaSymbols = true;
                    return _subsectionsViaSymbols;
                }
            }
            private bool f_deadStrippableDylib;
            private bool _deadStrippableDylib;
            public bool DeadStrippableDylib
            {
                get
                {
                    if (f_deadStrippableDylib)
                        return _deadStrippableDylib;
                    _deadStrippableDylib = (bool) ((Value & 4194304) != 0);
                    f_deadStrippableDylib = true;
                    return _deadStrippableDylib;
                }
            }
            private bool f_weakDefines;
            private bool _weakDefines;

            /// <summary>
            /// the final linked image contains external weak symbols
            /// </summary>
            public bool WeakDefines
            {
                get
                {
                    if (f_weakDefines)
                        return _weakDefines;
                    _weakDefines = (bool) ((Value & 32768) != 0);
                    f_weakDefines = true;
                    return _weakDefines;
                }
            }
            private bool f_prebound;
            private bool _prebound;

            /// <summary>
            /// the file has its dynamic undefined references prebound.
            /// </summary>
            public bool Prebound
            {
                get
                {
                    if (f_prebound)
                        return _prebound;
                    _prebound = (bool) ((Value & 16) != 0);
                    f_prebound = true;
                    return _prebound;
                }
            }
            private bool f_allModsBound;
            private bool _allModsBound;

            /// <summary>
            /// indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
            /// </summary>
            public bool AllModsBound
            {
                get
                {
                    if (f_allModsBound)
                        return _allModsBound;
                    _allModsBound = (bool) ((Value & 4096) != 0);
                    f_allModsBound = true;
                    return _allModsBound;
                }
            }
            private bool f_hasTlvDescriptors;
            private bool _hasTlvDescriptors;
            public bool HasTlvDescriptors
            {
                get
                {
                    if (f_hasTlvDescriptors)
                        return _hasTlvDescriptors;
                    _hasTlvDescriptors = (bool) ((Value & 8388608) != 0);
                    f_hasTlvDescriptors = true;
                    return _hasTlvDescriptors;
                }
            }
            private bool f_forceFlat;
            private bool _forceFlat;

            /// <summary>
            /// the executable is forcing all images to use flat name space bindings
            /// </summary>
            public bool ForceFlat
            {
                get
                {
                    if (f_forceFlat)
                        return _forceFlat;
                    _forceFlat = (bool) ((Value & 256) != 0);
                    f_forceFlat = true;
                    return _forceFlat;
                }
            }
            private bool f_rootSafe;
            private bool _rootSafe;

            /// <summary>
            /// When this bit is set, the binary declares it is safe for use in processes with uid zero
            /// </summary>
            public bool RootSafe
            {
                get
                {
                    if (f_rootSafe)
                        return _rootSafe;
                    _rootSafe = (bool) ((Value & 262144) != 0);
                    f_rootSafe = true;
                    return _rootSafe;
                }
            }
            private bool f_noUndefs;
            private bool _noUndefs;

            /// <summary>
            /// the object file has no undefined references
            /// </summary>
            public bool NoUndefs
            {
                get
                {
                    if (f_noUndefs)
                        return _noUndefs;
                    _noUndefs = (bool) ((Value & 1) != 0);
                    f_noUndefs = true;
                    return _noUndefs;
                }
            }
            private bool f_setuidSafe;
            private bool _setuidSafe;

            /// <summary>
            /// When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
            /// </summary>
            public bool SetuidSafe
            {
                get
                {
                    if (f_setuidSafe)
                        return _setuidSafe;
                    _setuidSafe = (bool) ((Value & 524288) != 0);
                    f_setuidSafe = true;
                    return _setuidSafe;
                }
            }
            private bool f_noHeapExecution;
            private bool _noHeapExecution;
            public bool NoHeapExecution
            {
                get
                {
                    if (f_noHeapExecution)
                        return _noHeapExecution;
                    _noHeapExecution = (bool) ((Value & 16777216) != 0);
                    f_noHeapExecution = true;
                    return _noHeapExecution;
                }
            }
            private bool f_noReexportedDylibs;
            private bool _noReexportedDylibs;

            /// <summary>
            /// When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
            /// </summary>
            public bool NoReexportedDylibs
            {
                get
                {
                    if (f_noReexportedDylibs)
                        return _noReexportedDylibs;
                    _noReexportedDylibs = (bool) ((Value & 1048576) != 0);
                    f_noReexportedDylibs = true;
                    return _noReexportedDylibs;
                }
            }
            private bool f_noMultiDefs;
            private bool _noMultiDefs;

            /// <summary>
            /// this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
            /// </summary>
            public bool NoMultiDefs
            {
                get
                {
                    if (f_noMultiDefs)
                        return _noMultiDefs;
                    _noMultiDefs = (bool) ((Value & 512) != 0);
                    f_noMultiDefs = true;
                    return _noMultiDefs;
                }
            }
            private bool f_appExtensionSafe;
            private bool _appExtensionSafe;
            public bool AppExtensionSafe
            {
                get
                {
                    if (f_appExtensionSafe)
                        return _appExtensionSafe;
                    _appExtensionSafe = (bool) ((Value & 33554432) != 0);
                    f_appExtensionSafe = true;
                    return _appExtensionSafe;
                }
            }
            private bool f_prebindable;
            private bool _prebindable;

            /// <summary>
            /// the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
            /// </summary>
            public bool Prebindable
            {
                get
                {
                    if (f_prebindable)
                        return _prebindable;
                    _prebindable = (bool) ((Value & 2048) != 0);
                    f_prebindable = true;
                    return _prebindable;
                }
            }
            private bool f_incrLink;
            private bool _incrLink;

            /// <summary>
            /// the object file is the output of an incremental link against a base file and can't be link edited again
            /// </summary>
            public bool IncrLink
            {
                get
                {
                    if (f_incrLink)
                        return _incrLink;
                    _incrLink = (bool) ((Value & 2) != 0);
                    f_incrLink = true;
                    return _incrLink;
                }
            }
            private bool f_bindAtLoad;
            private bool _bindAtLoad;

            /// <summary>
            /// the object file's undefined references are bound by the dynamic linker when loaded.
            /// </summary>
            public bool BindAtLoad
            {
                get
                {
                    if (f_bindAtLoad)
                        return _bindAtLoad;
                    _bindAtLoad = (bool) ((Value & 8) != 0);
                    f_bindAtLoad = true;
                    return _bindAtLoad;
                }
            }
            private bool f_canonical;
            private bool _canonical;

            /// <summary>
            /// the binary has been canonicalized via the unprebind operation
            /// </summary>
            public bool Canonical
            {
                get
                {
                    if (f_canonical)
                        return _canonical;
                    _canonical = (bool) ((Value & 16384) != 0);
                    f_canonical = true;
                    return _canonical;
                }
            }
            private bool f_twoLevel;
            private bool _twoLevel;

            /// <summary>
            /// the image is using two-level name space bindings
            /// </summary>
            public bool TwoLevel
            {
                get
                {
                    if (f_twoLevel)
                        return _twoLevel;
                    _twoLevel = (bool) ((Value & 128) != 0);
                    f_twoLevel = true;
                    return _twoLevel;
                }
            }
            private bool f_splitSegs;
            private bool _splitSegs;

            /// <summary>
            /// the file has its read-only and read-write segments split
            /// </summary>
            public bool SplitSegs
            {
                get
                {
                    if (f_splitSegs)
                        return _splitSegs;
                    _splitSegs = (bool) ((Value & 32) != 0);
                    f_splitSegs = true;
                    return _splitSegs;
                }
            }
            private bool f_lazyInit;
            private bool _lazyInit;

            /// <summary>
            /// the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
            /// </summary>
            public bool LazyInit
            {
                get
                {
                    if (f_lazyInit)
                        return _lazyInit;
                    _lazyInit = (bool) ((Value & 64) != 0);
                    f_lazyInit = true;
                    return _lazyInit;
                }
            }
            private bool f_allowStackExecution;
            private bool _allowStackExecution;

            /// <summary>
            /// When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
            /// </summary>
            public bool AllowStackExecution
            {
                get
                {
                    if (f_allowStackExecution)
                        return _allowStackExecution;
                    _allowStackExecution = (bool) ((Value & 131072) != 0);
                    f_allowStackExecution = true;
                    return _allowStackExecution;
                }
            }
            private bool f_bindsToWeak;
            private bool _bindsToWeak;

            /// <summary>
            /// the final linked image uses weak symbols
            /// </summary>
            public bool BindsToWeak
            {
                get
                {
                    if (f_bindsToWeak)
                        return _bindsToWeak;
                    _bindsToWeak = (bool) ((Value & 65536) != 0);
                    f_bindsToWeak = true;
                    return _bindsToWeak;
                }
            }
            private bool f_noFixPrebinding;
            private bool _noFixPrebinding;

            /// <summary>
            /// do not have dyld notify the prebinding agent about this executable
            /// </summary>
            public bool NoFixPrebinding
            {
                get
                {
                    if (f_noFixPrebinding)
                        return _noFixPrebinding;
                    _noFixPrebinding = (bool) ((Value & 1024) != 0);
                    f_noFixPrebinding = true;
                    return _noFixPrebinding;
                }
            }
            private bool f_dyldLink;
            private bool _dyldLink;

            /// <summary>
            /// the object file is input for the dynamic linker and can't be staticly link edited again
            /// </summary>
            public bool DyldLink
            {
                get
                {
                    if (f_dyldLink)
                        return _dyldLink;
                    _dyldLink = (bool) ((Value & 4) != 0);
                    f_dyldLink = true;
                    return _dyldLink;
                }
            }
            private bool f_pie;
            private bool _pie;

            /// <summary>
            /// When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
            /// </summary>
            public bool Pie
            {
                get
                {
                    if (f_pie)
                        return _pie;
                    _pie = (bool) ((Value & 2097152) != 0);
                    f_pie = true;
                    return _pie;
                }
            }
            private uint _value;
            private MachO m_root;
            private MachO.MachHeader m_parent;
            public uint Value { get { return _value; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.MachHeader M_Parent { get { return m_parent; } }
        }
        public partial class RoutinesCommand64 : KaitaiStruct
        {
            public static RoutinesCommand64 FromFile(string fileName)
            {
                return new RoutinesCommand64(new KaitaiStream(fileName));
            }

            public RoutinesCommand64(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _initAddress = m_io.ReadU8le();
                _initModule = m_io.ReadU8le();
                _reserved = m_io.ReadBytes(48);
            }
            private ulong _initAddress;
            private ulong _initModule;
            private byte[] _reserved;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public ulong InitAddress { get { return _initAddress; } }
            public ulong InitModule { get { return _initModule; } }
            public byte[] Reserved { get { return _reserved; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class LinkerOptionCommand : KaitaiStruct
        {
            public static LinkerOptionCommand FromFile(string fileName)
            {
                return new LinkerOptionCommand(new KaitaiStream(fileName));
            }

            public LinkerOptionCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numStrings = m_io.ReadU4le();
                _strings = new List<string>();
                for (var i = 0; i < NumStrings; i++)
                {
                    _strings.Add(System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                }
            }
            private uint _numStrings;
            private List<string> _strings;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint NumStrings { get { return _numStrings; } }
            public List<string> Strings { get { return _strings; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class SegmentCommand64 : KaitaiStruct
        {
            public static SegmentCommand64 FromFile(string fileName)
            {
                return new SegmentCommand64(new KaitaiStream(fileName));
            }

            public SegmentCommand64(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _segname = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0));
                _vmaddr = m_io.ReadU8le();
                _vmsize = m_io.ReadU8le();
                _fileoff = m_io.ReadU8le();
                _filesize = m_io.ReadU8le();
                _maxprot = new VmProt(m_io, this, m_root);
                _initprot = new VmProt(m_io, this, m_root);
                _nsects = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                _sections = new List<Section64>();
                for (var i = 0; i < Nsects; i++)
                {
                    _sections.Add(new Section64(m_io, this, m_root));
                }
            }
            public partial class Section64 : KaitaiStruct
            {
                public static Section64 FromFile(string fileName)
                {
                    return new Section64(new KaitaiStream(fileName));
                }

                public Section64(KaitaiStream p__io, MachO.SegmentCommand64 p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_data = false;
                    _read();
                }
                private void _read()
                {
                    _sectName = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0));
                    _segName = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0));
                    _addr = m_io.ReadU8le();
                    _size = m_io.ReadU8le();
                    _offset = m_io.ReadU4le();
                    _align = m_io.ReadU4le();
                    _reloff = m_io.ReadU4le();
                    _nreloc = m_io.ReadU4le();
                    _flags = m_io.ReadU4le();
                    _reserved1 = m_io.ReadU4le();
                    _reserved2 = m_io.ReadU4le();
                    _reserved3 = m_io.ReadU4le();
                }
                public partial class CfStringList : KaitaiStruct
                {
                    public static CfStringList FromFile(string fileName)
                    {
                        return new CfStringList(new KaitaiStream(fileName));
                    }

                    public CfStringList(KaitaiStream p__io, MachO.SegmentCommand64.Section64 p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _items = new List<CfString>();
                        {
                            var i = 0;
                            while (!m_io.IsEof) {
                                _items.Add(new CfString(m_io, this, m_root));
                                i++;
                            }
                        }
                    }
                    private List<CfString> _items;
                    private MachO m_root;
                    private MachO.SegmentCommand64.Section64 m_parent;
                    public List<CfString> Items { get { return _items; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.SegmentCommand64.Section64 M_Parent { get { return m_parent; } }
                }
                public partial class CfString : KaitaiStruct
                {
                    public static CfString FromFile(string fileName)
                    {
                        return new CfString(new KaitaiStream(fileName));
                    }

                    public CfString(KaitaiStream p__io, MachO.SegmentCommand64.Section64.CfStringList p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _isa = m_io.ReadU8le();
                        _info = m_io.ReadU8le();
                        _data = m_io.ReadU8le();
                        _length = m_io.ReadU8le();
                    }
                    private ulong _isa;
                    private ulong _info;
                    private ulong _data;
                    private ulong _length;
                    private MachO m_root;
                    private MachO.SegmentCommand64.Section64.CfStringList m_parent;
                    public ulong Isa { get { return _isa; } }
                    public ulong Info { get { return _info; } }
                    public ulong Data { get { return _data; } }
                    public ulong Length { get { return _length; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.SegmentCommand64.Section64.CfStringList M_Parent { get { return m_parent; } }
                }
                public partial class EhFrameItem : KaitaiStruct
                {
                    public static EhFrameItem FromFile(string fileName)
                    {
                        return new EhFrameItem(new KaitaiStream(fileName));
                    }

                    public EhFrameItem(KaitaiStream p__io, MachO.SegmentCommand64.Section64.EhFrame p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _length = m_io.ReadU4le();
                        if (Length == 4294967295) {
                            _length64 = m_io.ReadU8le();
                        }
                        _id = m_io.ReadU4le();
                        if (Length > 0) {
                            switch (Id) {
                            case 0: {
                                __raw_body = m_io.ReadBytes((Length - 4));
                                var io___raw_body = new KaitaiStream(__raw_body);
                                _body = new Cie(io___raw_body, this, m_root);
                                break;
                            }
                            default: {
                                _body = m_io.ReadBytes((Length - 4));
                                break;
                            }
                            }
                        }
                    }
                    public partial class CharChain : KaitaiStruct
                    {
                        public static CharChain FromFile(string fileName)
                        {
                            return new CharChain(new KaitaiStream(fileName));
                        }

                        public CharChain(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _chr = m_io.ReadU1();
                            if (Chr != 0) {
                                _next = new CharChain(m_io, this, m_root);
                            }
                        }
                        private byte _chr;
                        private CharChain _next;
                        private MachO m_root;
                        private KaitaiStruct m_parent;
                        public byte Chr { get { return _chr; } }
                        public CharChain Next { get { return _next; } }
                        public MachO M_Root { get { return m_root; } }
                        public KaitaiStruct M_Parent { get { return m_parent; } }
                    }
                    public partial class Cie : KaitaiStruct
                    {
                        public static Cie FromFile(string fileName)
                        {
                            return new Cie(new KaitaiStream(fileName));
                        }

                        public Cie(KaitaiStream p__io, MachO.SegmentCommand64.Section64.EhFrameItem p__parent = null, MachO p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _version = m_io.ReadU1();
                            _augStr = new CharChain(m_io, this, m_root);
                            _codeAlignmentFactor = new Uleb128(m_io, this, m_root);
                            _dataAlignmentFactor = new Uleb128(m_io, this, m_root);
                            _returnAddressRegister = m_io.ReadU1();
                            if (AugStr.Chr == 122) {
                                _augmentation = new AugmentationEntry(m_io, this, m_root);
                            }
                        }
                        private byte _version;
                        private CharChain _augStr;
                        private Uleb128 _codeAlignmentFactor;
                        private Uleb128 _dataAlignmentFactor;
                        private byte _returnAddressRegister;
                        private AugmentationEntry _augmentation;
                        private MachO m_root;
                        private MachO.SegmentCommand64.Section64.EhFrameItem m_parent;
                        public byte Version { get { return _version; } }
                        public CharChain AugStr { get { return _augStr; } }
                        public Uleb128 CodeAlignmentFactor { get { return _codeAlignmentFactor; } }
                        public Uleb128 DataAlignmentFactor { get { return _dataAlignmentFactor; } }
                        public byte ReturnAddressRegister { get { return _returnAddressRegister; } }
                        public AugmentationEntry Augmentation { get { return _augmentation; } }
                        public MachO M_Root { get { return m_root; } }
                        public MachO.SegmentCommand64.Section64.EhFrameItem M_Parent { get { return m_parent; } }
                    }
                    public partial class AugmentationEntry : KaitaiStruct
                    {
                        public static AugmentationEntry FromFile(string fileName)
                        {
                            return new AugmentationEntry(new KaitaiStream(fileName));
                        }

                        public AugmentationEntry(KaitaiStream p__io, MachO.SegmentCommand64.Section64.EhFrameItem.Cie p__parent = null, MachO p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _length = new Uleb128(m_io, this, m_root);
                            if (M_Parent.AugStr.Next.Chr == 82) {
                                _fdePointerEncoding = m_io.ReadU1();
                            }
                        }
                        private Uleb128 _length;
                        private byte? _fdePointerEncoding;
                        private MachO m_root;
                        private MachO.SegmentCommand64.Section64.EhFrameItem.Cie m_parent;
                        public Uleb128 Length { get { return _length; } }
                        public byte? FdePointerEncoding { get { return _fdePointerEncoding; } }
                        public MachO M_Root { get { return m_root; } }
                        public MachO.SegmentCommand64.Section64.EhFrameItem.Cie M_Parent { get { return m_parent; } }
                    }
                    private uint _length;
                    private ulong? _length64;
                    private uint _id;
                    private object _body;
                    private MachO m_root;
                    private MachO.SegmentCommand64.Section64.EhFrame m_parent;
                    private byte[] __raw_body;
                    public uint Length { get { return _length; } }
                    public ulong? Length64 { get { return _length64; } }
                    public uint Id { get { return _id; } }
                    public object Body { get { return _body; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.SegmentCommand64.Section64.EhFrame M_Parent { get { return m_parent; } }
                    public byte[] M_RawBody { get { return __raw_body; } }
                }
                public partial class EhFrame : KaitaiStruct
                {
                    public static EhFrame FromFile(string fileName)
                    {
                        return new EhFrame(new KaitaiStream(fileName));
                    }

                    public EhFrame(KaitaiStream p__io, MachO.SegmentCommand64.Section64 p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _items = new List<EhFrameItem>();
                        {
                            var i = 0;
                            while (!m_io.IsEof) {
                                _items.Add(new EhFrameItem(m_io, this, m_root));
                                i++;
                            }
                        }
                    }
                    private List<EhFrameItem> _items;
                    private MachO m_root;
                    private MachO.SegmentCommand64.Section64 m_parent;
                    public List<EhFrameItem> Items { get { return _items; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.SegmentCommand64.Section64 M_Parent { get { return m_parent; } }
                }
                public partial class PointerList : KaitaiStruct
                {
                    public static PointerList FromFile(string fileName)
                    {
                        return new PointerList(new KaitaiStream(fileName));
                    }

                    public PointerList(KaitaiStream p__io, MachO.SegmentCommand64.Section64 p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _items = new List<ulong>();
                        {
                            var i = 0;
                            while (!m_io.IsEof) {
                                _items.Add(m_io.ReadU8le());
                                i++;
                            }
                        }
                    }
                    private List<ulong> _items;
                    private MachO m_root;
                    private MachO.SegmentCommand64.Section64 m_parent;
                    public List<ulong> Items { get { return _items; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.SegmentCommand64.Section64 M_Parent { get { return m_parent; } }
                }
                public partial class StringList : KaitaiStruct
                {
                    public static StringList FromFile(string fileName)
                    {
                        return new StringList(new KaitaiStream(fileName));
                    }

                    public StringList(KaitaiStream p__io, MachO.SegmentCommand64.Section64 p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _strings = new List<string>();
                        {
                            var i = 0;
                            while (!m_io.IsEof) {
                                _strings.Add(System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                                i++;
                            }
                        }
                    }
                    private List<string> _strings;
                    private MachO m_root;
                    private MachO.SegmentCommand64.Section64 m_parent;
                    public List<string> Strings { get { return _strings; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.SegmentCommand64.Section64 M_Parent { get { return m_parent; } }
                }
                private bool f_data;
                private object _data;
                public object Data
                {
                    get
                    {
                        if (f_data)
                            return _data;
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(Offset);
                        switch (SectName) {
                        case "__objc_nlclslist": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_methname": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new StringList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__nl_symbol_ptr": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__la_symbol_ptr": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_selrefs": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__cstring": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new StringList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_classlist": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_protolist": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_imageinfo": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_methtype": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new StringList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__cfstring": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new CfStringList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_classrefs": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_protorefs": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_classname": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new StringList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__got": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        case "__eh_frame": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new EhFrame(io___raw_data, this, m_root);
                            break;
                        }
                        case "__objc_superrefs": {
                            __raw_data = io.ReadBytes(Size);
                            var io___raw_data = new KaitaiStream(__raw_data);
                            _data = new PointerList(io___raw_data, this, m_root);
                            break;
                        }
                        default: {
                            _data = io.ReadBytes(Size);
                            break;
                        }
                        }
                        io.Seek(_pos);
                        f_data = true;
                        return _data;
                    }
                }
                private string _sectName;
                private string _segName;
                private ulong _addr;
                private ulong _size;
                private uint _offset;
                private uint _align;
                private uint _reloff;
                private uint _nreloc;
                private uint _flags;
                private uint _reserved1;
                private uint _reserved2;
                private uint _reserved3;
                private MachO m_root;
                private MachO.SegmentCommand64 m_parent;
                private byte[] __raw_data;
                public string SectName { get { return _sectName; } }
                public string SegName { get { return _segName; } }
                public ulong Addr { get { return _addr; } }
                public ulong Size { get { return _size; } }
                public uint Offset { get { return _offset; } }
                public uint Align { get { return _align; } }
                public uint Reloff { get { return _reloff; } }
                public uint Nreloc { get { return _nreloc; } }
                public uint Flags { get { return _flags; } }
                public uint Reserved1 { get { return _reserved1; } }
                public uint Reserved2 { get { return _reserved2; } }
                public uint Reserved3 { get { return _reserved3; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.SegmentCommand64 M_Parent { get { return m_parent; } }
                public byte[] M_RawData { get { return __raw_data; } }
            }
            private string _segname;
            private ulong _vmaddr;
            private ulong _vmsize;
            private ulong _fileoff;
            private ulong _filesize;
            private VmProt _maxprot;
            private VmProt _initprot;
            private uint _nsects;
            private uint _flags;
            private List<Section64> _sections;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public string Segname { get { return _segname; } }
            public ulong Vmaddr { get { return _vmaddr; } }
            public ulong Vmsize { get { return _vmsize; } }
            public ulong Fileoff { get { return _fileoff; } }
            public ulong Filesize { get { return _filesize; } }
            public VmProt Maxprot { get { return _maxprot; } }
            public VmProt Initprot { get { return _initprot; } }
            public uint Nsects { get { return _nsects; } }
            public uint Flags { get { return _flags; } }
            public List<Section64> Sections { get { return _sections; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class VmProt : KaitaiStruct
        {
            public static VmProt FromFile(string fileName)
            {
                return new VmProt(new KaitaiStream(fileName));
            }

            public VmProt(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _stripRead = m_io.ReadBitsIntBe(1) != 0;
                _isMask = m_io.ReadBitsIntBe(1) != 0;
                _reserved0 = m_io.ReadBitsIntBe(1) != 0;
                _copy = m_io.ReadBitsIntBe(1) != 0;
                _noChange = m_io.ReadBitsIntBe(1) != 0;
                _execute = m_io.ReadBitsIntBe(1) != 0;
                _write = m_io.ReadBitsIntBe(1) != 0;
                _read = m_io.ReadBitsIntBe(1) != 0;
                _reserved1 = m_io.ReadBitsIntBe(24);
            }
            private bool _stripRead;
            private bool _isMask;
            private bool _reserved0;
            private bool _copy;
            private bool _noChange;
            private bool _execute;
            private bool _write;
            private bool _read;
            private ulong _reserved1;
            private MachO m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Special marker to support execute-only protection.
            /// </summary>
            public bool StripRead { get { return _stripRead; } }

            /// <summary>
            /// Indicates to use value as a mask against the actual protection bits.
            /// </summary>
            public bool IsMask { get { return _isMask; } }

            /// <summary>
            /// Reserved (unused) bit.
            /// </summary>
            public bool Reserved0 { get { return _reserved0; } }

            /// <summary>
            /// Used when write permission can not be obtained, to mark the entry as COW.
            /// </summary>
            public bool Copy { get { return _copy; } }

            /// <summary>
            /// Used only by memory_object_lock_request to indicate no change to page locks.
            /// </summary>
            public bool NoChange { get { return _noChange; } }

            /// <summary>
            /// Execute permission.
            /// </summary>
            public bool Execute { get { return _execute; } }

            /// <summary>
            /// Write permission.
            /// </summary>
            public bool Write { get { return _write; } }

            /// <summary>
            /// Read permission.
            /// </summary>
            public bool Read { get { return _read; } }

            /// <summary>
            /// Reserved (unused) bits.
            /// </summary>
            public ulong Reserved1 { get { return _reserved1; } }
            public MachO M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class DysymtabCommand : KaitaiStruct
        {
            public static DysymtabCommand FromFile(string fileName)
            {
                return new DysymtabCommand(new KaitaiStream(fileName));
            }

            public DysymtabCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_indirectSymbols = false;
                _read();
            }
            private void _read()
            {
                _iLocalSym = m_io.ReadU4le();
                _nLocalSym = m_io.ReadU4le();
                _iExtDefSym = m_io.ReadU4le();
                _nExtDefSym = m_io.ReadU4le();
                _iUndefSym = m_io.ReadU4le();
                _nUndefSym = m_io.ReadU4le();
                _tocOff = m_io.ReadU4le();
                _nToc = m_io.ReadU4le();
                _modTabOff = m_io.ReadU4le();
                _nModTab = m_io.ReadU4le();
                _extRefSymOff = m_io.ReadU4le();
                _nExtRefSyms = m_io.ReadU4le();
                _indirectSymOff = m_io.ReadU4le();
                _nIndirectSyms = m_io.ReadU4le();
                _extRelOff = m_io.ReadU4le();
                _nExtRel = m_io.ReadU4le();
                _locRelOff = m_io.ReadU4le();
                _nLocRel = m_io.ReadU4le();
            }
            private bool f_indirectSymbols;
            private List<uint> _indirectSymbols;
            public List<uint> IndirectSymbols
            {
                get
                {
                    if (f_indirectSymbols)
                        return _indirectSymbols;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(IndirectSymOff);
                    _indirectSymbols = new List<uint>();
                    for (var i = 0; i < NIndirectSyms; i++)
                    {
                        _indirectSymbols.Add(io.ReadU4le());
                    }
                    io.Seek(_pos);
                    f_indirectSymbols = true;
                    return _indirectSymbols;
                }
            }
            private uint _iLocalSym;
            private uint _nLocalSym;
            private uint _iExtDefSym;
            private uint _nExtDefSym;
            private uint _iUndefSym;
            private uint _nUndefSym;
            private uint _tocOff;
            private uint _nToc;
            private uint _modTabOff;
            private uint _nModTab;
            private uint _extRefSymOff;
            private uint _nExtRefSyms;
            private uint _indirectSymOff;
            private uint _nIndirectSyms;
            private uint _extRelOff;
            private uint _nExtRel;
            private uint _locRelOff;
            private uint _nLocRel;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint ILocalSym { get { return _iLocalSym; } }
            public uint NLocalSym { get { return _nLocalSym; } }
            public uint IExtDefSym { get { return _iExtDefSym; } }
            public uint NExtDefSym { get { return _nExtDefSym; } }
            public uint IUndefSym { get { return _iUndefSym; } }
            public uint NUndefSym { get { return _nUndefSym; } }
            public uint TocOff { get { return _tocOff; } }
            public uint NToc { get { return _nToc; } }
            public uint ModTabOff { get { return _modTabOff; } }
            public uint NModTab { get { return _nModTab; } }
            public uint ExtRefSymOff { get { return _extRefSymOff; } }
            public uint NExtRefSyms { get { return _nExtRefSyms; } }
            public uint IndirectSymOff { get { return _indirectSymOff; } }
            public uint NIndirectSyms { get { return _nIndirectSyms; } }
            public uint ExtRelOff { get { return _extRelOff; } }
            public uint NExtRel { get { return _nExtRel; } }
            public uint LocRelOff { get { return _locRelOff; } }
            public uint NLocRel { get { return _nLocRel; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class MachHeader : KaitaiStruct
        {
            public static MachHeader FromFile(string fileName)
            {
                return new MachHeader(new KaitaiStream(fileName));
            }

            public MachHeader(KaitaiStream p__io, MachO p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_flagsObj = false;
                _read();
            }
            private void _read()
            {
                _cputype = ((MachO.CpuType) m_io.ReadU4le());
                _cpusubtype = m_io.ReadU4le();
                _filetype = ((MachO.FileType) m_io.ReadU4le());
                _ncmds = m_io.ReadU4le();
                _sizeofcmds = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                if ( ((M_Root.Magic == MachO.MagicType.MachoBeX64) || (M_Root.Magic == MachO.MagicType.MachoLeX64)) ) {
                    _reserved = m_io.ReadU4le();
                }
            }
            private bool f_flagsObj;
            private MachoFlags _flagsObj;
            public MachoFlags FlagsObj
            {
                get
                {
                    if (f_flagsObj)
                        return _flagsObj;
                    _flagsObj = new MachoFlags(Flags, m_io, this, m_root);
                    f_flagsObj = true;
                    return _flagsObj;
                }
            }
            private CpuType _cputype;
            private uint _cpusubtype;
            private FileType _filetype;
            private uint _ncmds;
            private uint _sizeofcmds;
            private uint _flags;
            private uint? _reserved;
            private MachO m_root;
            private MachO m_parent;
            public CpuType Cputype { get { return _cputype; } }
            public uint Cpusubtype { get { return _cpusubtype; } }
            public FileType Filetype { get { return _filetype; } }
            public uint Ncmds { get { return _ncmds; } }
            public uint Sizeofcmds { get { return _sizeofcmds; } }
            public uint Flags { get { return _flags; } }
            public uint? Reserved { get { return _reserved; } }
            public MachO M_Root { get { return m_root; } }
            public MachO M_Parent { get { return m_parent; } }
        }
        public partial class LinkeditDataCommand : KaitaiStruct
        {
            public static LinkeditDataCommand FromFile(string fileName)
            {
                return new LinkeditDataCommand(new KaitaiStream(fileName));
            }

            public LinkeditDataCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dataOff = m_io.ReadU4le();
                _dataSize = m_io.ReadU4le();
            }
            private uint _dataOff;
            private uint _dataSize;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint DataOff { get { return _dataOff; } }
            public uint DataSize { get { return _dataSize; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class SubCommand : KaitaiStruct
        {
            public static SubCommand FromFile(string fileName)
            {
                return new SubCommand(new KaitaiStream(fileName));
            }

            public SubCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = new LcStr(m_io, this, m_root);
            }
            private LcStr _name;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public LcStr Name { get { return _name; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class TwolevelHintsCommand : KaitaiStruct
        {
            public static TwolevelHintsCommand FromFile(string fileName)
            {
                return new TwolevelHintsCommand(new KaitaiStream(fileName));
            }

            public TwolevelHintsCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _offset = m_io.ReadU4le();
                _numHints = m_io.ReadU4le();
            }
            private uint _offset;
            private uint _numHints;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint Offset { get { return _offset; } }
            public uint NumHints { get { return _numHints; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class Version : KaitaiStruct
        {
            public static Version FromFile(string fileName)
            {
                return new Version(new KaitaiStream(fileName));
            }

            public Version(KaitaiStream p__io, MachO.VersionMinCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _p1 = m_io.ReadU1();
                _minor = m_io.ReadU1();
                _major = m_io.ReadU1();
                _release = m_io.ReadU1();
            }
            private byte _p1;
            private byte _minor;
            private byte _major;
            private byte _release;
            private MachO m_root;
            private MachO.VersionMinCommand m_parent;
            public byte P1 { get { return _p1; } }
            public byte Minor { get { return _minor; } }
            public byte Major { get { return _major; } }
            public byte Release { get { return _release; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.VersionMinCommand M_Parent { get { return m_parent; } }
        }
        public partial class EncryptionInfoCommand : KaitaiStruct
        {
            public static EncryptionInfoCommand FromFile(string fileName)
            {
                return new EncryptionInfoCommand(new KaitaiStream(fileName));
            }

            public EncryptionInfoCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _cryptoff = m_io.ReadU4le();
                _cryptsize = m_io.ReadU4le();
                _cryptid = m_io.ReadU4le();
                if ( ((M_Root.Magic == MachO.MagicType.MachoBeX64) || (M_Root.Magic == MachO.MagicType.MachoLeX64)) ) {
                    _pad = m_io.ReadU4le();
                }
            }
            private uint _cryptoff;
            private uint _cryptsize;
            private uint _cryptid;
            private uint? _pad;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint Cryptoff { get { return _cryptoff; } }
            public uint Cryptsize { get { return _cryptsize; } }
            public uint Cryptid { get { return _cryptid; } }
            public uint? Pad { get { return _pad; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class CodeSignatureCommand : KaitaiStruct
        {
            public static CodeSignatureCommand FromFile(string fileName)
            {
                return new CodeSignatureCommand(new KaitaiStream(fileName));
            }

            public CodeSignatureCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_codeSignature = false;
                _read();
            }
            private void _read()
            {
                _dataOff = m_io.ReadU4le();
                _dataSize = m_io.ReadU4le();
            }
            private bool f_codeSignature;
            private CsBlob _codeSignature;
            public CsBlob CodeSignature
            {
                get
                {
                    if (f_codeSignature)
                        return _codeSignature;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(DataOff);
                    __raw_codeSignature = io.ReadBytes(DataSize);
                    var io___raw_codeSignature = new KaitaiStream(__raw_codeSignature);
                    _codeSignature = new CsBlob(io___raw_codeSignature, this, m_root);
                    io.Seek(_pos);
                    f_codeSignature = true;
                    return _codeSignature;
                }
            }
            private uint _dataOff;
            private uint _dataSize;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            private byte[] __raw_codeSignature;
            public uint DataOff { get { return _dataOff; } }
            public uint DataSize { get { return _dataSize; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
            public byte[] M_RawCodeSignature { get { return __raw_codeSignature; } }
        }
        public partial class DyldInfoCommand : KaitaiStruct
        {
            public static DyldInfoCommand FromFile(string fileName)
            {
                return new DyldInfoCommand(new KaitaiStream(fileName));
            }


            public enum BindOpcode
            {
                Done = 0,
                SetDylibOrdinalImmediate = 16,
                SetDylibOrdinalUleb = 32,
                SetDylibSpecialImmediate = 48,
                SetSymbolTrailingFlagsImmediate = 64,
                SetTypeImmediate = 80,
                SetAppendSleb = 96,
                SetSegmentAndOffsetUleb = 112,
                AddAddressUleb = 128,
                DoBind = 144,
                DoBindAddAddressUleb = 160,
                DoBindAddAddressImmediateScaled = 176,
                DoBindUlebTimesSkippingUleb = 192,
            }
            public DyldInfoCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_bind = false;
                f_exports = false;
                f_weakBind = false;
                f_rebase = false;
                f_lazyBind = false;
                _read();
            }
            private void _read()
            {
                _rebaseOff = m_io.ReadU4le();
                _rebaseSize = m_io.ReadU4le();
                _bindOff = m_io.ReadU4le();
                _bindSize = m_io.ReadU4le();
                _weakBindOff = m_io.ReadU4le();
                _weakBindSize = m_io.ReadU4le();
                _lazyBindOff = m_io.ReadU4le();
                _lazyBindSize = m_io.ReadU4le();
                _exportOff = m_io.ReadU4le();
                _exportSize = m_io.ReadU4le();
            }
            public partial class RebaseData : KaitaiStruct
            {
                public static RebaseData FromFile(string fileName)
                {
                    return new RebaseData(new KaitaiStream(fileName));
                }


                public enum Opcode
                {
                    Done = 0,
                    SetTypeImmediate = 16,
                    SetSegmentAndOffsetUleb = 32,
                    AddAddressUleb = 48,
                    AddAddressImmediateScaled = 64,
                    DoRebaseImmediateTimes = 80,
                    DoRebaseUlebTimes = 96,
                    DoRebaseAddAddressUleb = 112,
                    DoRebaseUlebTimesSkippingUleb = 128,
                }
                public RebaseData(KaitaiStream p__io, MachO.DyldInfoCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _items = new List<RebaseItem>();
                    {
                        var i = 0;
                        RebaseItem M_;
                        do {
                            M_ = new RebaseItem(m_io, this, m_root);
                            _items.Add(M_);
                            i++;
                        } while (!(M_.Opcode == Opcode.Done));
                    }
                }
                public partial class RebaseItem : KaitaiStruct
                {
                    public static RebaseItem FromFile(string fileName)
                    {
                        return new RebaseItem(new KaitaiStream(fileName));
                    }

                    public RebaseItem(KaitaiStream p__io, MachO.DyldInfoCommand.RebaseData p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_opcode = false;
                        f_immediate = false;
                        _read();
                    }
                    private void _read()
                    {
                        _opcodeAndImmediate = m_io.ReadU1();
                        if ( ((Opcode == MachO.DyldInfoCommand.RebaseData.Opcode.SetSegmentAndOffsetUleb) || (Opcode == MachO.DyldInfoCommand.RebaseData.Opcode.AddAddressUleb) || (Opcode == MachO.DyldInfoCommand.RebaseData.Opcode.DoRebaseUlebTimes) || (Opcode == MachO.DyldInfoCommand.RebaseData.Opcode.DoRebaseAddAddressUleb) || (Opcode == MachO.DyldInfoCommand.RebaseData.Opcode.DoRebaseUlebTimesSkippingUleb)) ) {
                            _uleb = new Uleb128(m_io, this, m_root);
                        }
                        if (Opcode == MachO.DyldInfoCommand.RebaseData.Opcode.DoRebaseUlebTimesSkippingUleb) {
                            _skip = new Uleb128(m_io, this, m_root);
                        }
                    }
                    private bool f_opcode;
                    private Opcode _opcode;
                    public Opcode Opcode
                    {
                        get
                        {
                            if (f_opcode)
                                return _opcode;
                            _opcode = (Opcode) (((MachO.DyldInfoCommand.RebaseData.Opcode) (OpcodeAndImmediate & 240)));
                            f_opcode = true;
                            return _opcode;
                        }
                    }
                    private bool f_immediate;
                    private int _immediate;
                    public int Immediate
                    {
                        get
                        {
                            if (f_immediate)
                                return _immediate;
                            _immediate = (int) ((OpcodeAndImmediate & 15));
                            f_immediate = true;
                            return _immediate;
                        }
                    }
                    private byte _opcodeAndImmediate;
                    private Uleb128 _uleb;
                    private Uleb128 _skip;
                    private MachO m_root;
                    private MachO.DyldInfoCommand.RebaseData m_parent;
                    public byte OpcodeAndImmediate { get { return _opcodeAndImmediate; } }
                    public Uleb128 Uleb { get { return _uleb; } }
                    public Uleb128 Skip { get { return _skip; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.DyldInfoCommand.RebaseData M_Parent { get { return m_parent; } }
                }
                private List<RebaseItem> _items;
                private MachO m_root;
                private MachO.DyldInfoCommand m_parent;
                public List<RebaseItem> Items { get { return _items; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.DyldInfoCommand M_Parent { get { return m_parent; } }
            }
            public partial class BindItem : KaitaiStruct
            {
                public static BindItem FromFile(string fileName)
                {
                    return new BindItem(new KaitaiStream(fileName));
                }

                public BindItem(KaitaiStream p__io, MachO.DyldInfoCommand.BindData p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_opcode = false;
                    f_immediate = false;
                    _read();
                }
                private void _read()
                {
                    _opcodeAndImmediate = m_io.ReadU1();
                    if ( ((Opcode == MachO.DyldInfoCommand.BindOpcode.SetDylibOrdinalUleb) || (Opcode == MachO.DyldInfoCommand.BindOpcode.SetAppendSleb) || (Opcode == MachO.DyldInfoCommand.BindOpcode.SetSegmentAndOffsetUleb) || (Opcode == MachO.DyldInfoCommand.BindOpcode.AddAddressUleb) || (Opcode == MachO.DyldInfoCommand.BindOpcode.DoBindAddAddressUleb) || (Opcode == MachO.DyldInfoCommand.BindOpcode.DoBindUlebTimesSkippingUleb)) ) {
                        _uleb = new Uleb128(m_io, this, m_root);
                    }
                    if (Opcode == MachO.DyldInfoCommand.BindOpcode.DoBindUlebTimesSkippingUleb) {
                        _skip = new Uleb128(m_io, this, m_root);
                    }
                    if (Opcode == MachO.DyldInfoCommand.BindOpcode.SetSymbolTrailingFlagsImmediate) {
                        _symbol = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(0, false, true, true));
                    }
                }
                private bool f_opcode;
                private BindOpcode _opcode;
                public BindOpcode Opcode
                {
                    get
                    {
                        if (f_opcode)
                            return _opcode;
                        _opcode = (BindOpcode) (((MachO.DyldInfoCommand.BindOpcode) (OpcodeAndImmediate & 240)));
                        f_opcode = true;
                        return _opcode;
                    }
                }
                private bool f_immediate;
                private int _immediate;
                public int Immediate
                {
                    get
                    {
                        if (f_immediate)
                            return _immediate;
                        _immediate = (int) ((OpcodeAndImmediate & 15));
                        f_immediate = true;
                        return _immediate;
                    }
                }
                private byte _opcodeAndImmediate;
                private Uleb128 _uleb;
                private Uleb128 _skip;
                private string _symbol;
                private MachO m_root;
                private MachO.DyldInfoCommand.BindData m_parent;
                public byte OpcodeAndImmediate { get { return _opcodeAndImmediate; } }
                public Uleb128 Uleb { get { return _uleb; } }
                public Uleb128 Skip { get { return _skip; } }
                public string Symbol { get { return _symbol; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.DyldInfoCommand.BindData M_Parent { get { return m_parent; } }
            }
            public partial class BindData : KaitaiStruct
            {
                public static BindData FromFile(string fileName)
                {
                    return new BindData(new KaitaiStream(fileName));
                }

                public BindData(KaitaiStream p__io, MachO.DyldInfoCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _items = new List<BindItem>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _items.Add(new BindItem(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                private List<BindItem> _items;
                private MachO m_root;
                private MachO.DyldInfoCommand m_parent;
                public List<BindItem> Items { get { return _items; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.DyldInfoCommand M_Parent { get { return m_parent; } }
            }
            public partial class ExportNode : KaitaiStruct
            {
                public static ExportNode FromFile(string fileName)
                {
                    return new ExportNode(new KaitaiStream(fileName));
                }

                public ExportNode(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _terminalSize = new Uleb128(m_io, this, m_root);
                    _childrenCount = m_io.ReadU1();
                    _children = new List<Child>();
                    for (var i = 0; i < ChildrenCount; i++)
                    {
                        _children.Add(new Child(m_io, this, m_root));
                    }
                    _terminal = m_io.ReadBytes(TerminalSize.Value);
                }
                public partial class Child : KaitaiStruct
                {
                    public static Child FromFile(string fileName)
                    {
                        return new Child(new KaitaiStream(fileName));
                    }

                    public Child(KaitaiStream p__io, MachO.DyldInfoCommand.ExportNode p__parent = null, MachO p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        f_value = false;
                        _read();
                    }
                    private void _read()
                    {
                        _name = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(0, false, true, true));
                        _nodeOffset = new Uleb128(m_io, this, m_root);
                    }
                    private bool f_value;
                    private ExportNode _value;
                    public ExportNode Value
                    {
                        get
                        {
                            if (f_value)
                                return _value;
                            long _pos = m_io.Pos;
                            m_io.Seek(NodeOffset.Value);
                            _value = new ExportNode(m_io, this, m_root);
                            m_io.Seek(_pos);
                            f_value = true;
                            return _value;
                        }
                    }
                    private string _name;
                    private Uleb128 _nodeOffset;
                    private MachO m_root;
                    private MachO.DyldInfoCommand.ExportNode m_parent;
                    public string Name { get { return _name; } }
                    public Uleb128 NodeOffset { get { return _nodeOffset; } }
                    public MachO M_Root { get { return m_root; } }
                    public MachO.DyldInfoCommand.ExportNode M_Parent { get { return m_parent; } }
                }
                private Uleb128 _terminalSize;
                private byte _childrenCount;
                private List<Child> _children;
                private byte[] _terminal;
                private MachO m_root;
                private KaitaiStruct m_parent;
                public Uleb128 TerminalSize { get { return _terminalSize; } }
                public byte ChildrenCount { get { return _childrenCount; } }
                public List<Child> Children { get { return _children; } }
                public byte[] Terminal { get { return _terminal; } }
                public MachO M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            private bool f_bind;
            private BindData _bind;
            public BindData Bind
            {
                get
                {
                    if (f_bind)
                        return _bind;
                    if (BindSize != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(BindOff);
                        __raw_bind = io.ReadBytes(BindSize);
                        var io___raw_bind = new KaitaiStream(__raw_bind);
                        _bind = new BindData(io___raw_bind, this, m_root);
                        io.Seek(_pos);
                        f_bind = true;
                    }
                    return _bind;
                }
            }
            private bool f_exports;
            private ExportNode _exports;
            public ExportNode Exports
            {
                get
                {
                    if (f_exports)
                        return _exports;
                    if (ExportSize != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(ExportOff);
                        __raw_exports = io.ReadBytes(ExportSize);
                        var io___raw_exports = new KaitaiStream(__raw_exports);
                        _exports = new ExportNode(io___raw_exports, this, m_root);
                        io.Seek(_pos);
                        f_exports = true;
                    }
                    return _exports;
                }
            }
            private bool f_weakBind;
            private BindData _weakBind;
            public BindData WeakBind
            {
                get
                {
                    if (f_weakBind)
                        return _weakBind;
                    if (WeakBindSize != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(WeakBindOff);
                        __raw_weakBind = io.ReadBytes(WeakBindSize);
                        var io___raw_weakBind = new KaitaiStream(__raw_weakBind);
                        _weakBind = new BindData(io___raw_weakBind, this, m_root);
                        io.Seek(_pos);
                        f_weakBind = true;
                    }
                    return _weakBind;
                }
            }
            private bool f_rebase;
            private RebaseData _rebase;
            public RebaseData Rebase
            {
                get
                {
                    if (f_rebase)
                        return _rebase;
                    if (RebaseSize != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(RebaseOff);
                        __raw_rebase = io.ReadBytes(RebaseSize);
                        var io___raw_rebase = new KaitaiStream(__raw_rebase);
                        _rebase = new RebaseData(io___raw_rebase, this, m_root);
                        io.Seek(_pos);
                        f_rebase = true;
                    }
                    return _rebase;
                }
            }
            private bool f_lazyBind;
            private BindData _lazyBind;
            public BindData LazyBind
            {
                get
                {
                    if (f_lazyBind)
                        return _lazyBind;
                    if (LazyBindSize != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(LazyBindOff);
                        __raw_lazyBind = io.ReadBytes(LazyBindSize);
                        var io___raw_lazyBind = new KaitaiStream(__raw_lazyBind);
                        _lazyBind = new BindData(io___raw_lazyBind, this, m_root);
                        io.Seek(_pos);
                        f_lazyBind = true;
                    }
                    return _lazyBind;
                }
            }
            private uint _rebaseOff;
            private uint _rebaseSize;
            private uint _bindOff;
            private uint _bindSize;
            private uint _weakBindOff;
            private uint _weakBindSize;
            private uint _lazyBindOff;
            private uint _lazyBindSize;
            private uint _exportOff;
            private uint _exportSize;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            private byte[] __raw_bind;
            private byte[] __raw_exports;
            private byte[] __raw_weakBind;
            private byte[] __raw_rebase;
            private byte[] __raw_lazyBind;
            public uint RebaseOff { get { return _rebaseOff; } }
            public uint RebaseSize { get { return _rebaseSize; } }
            public uint BindOff { get { return _bindOff; } }
            public uint BindSize { get { return _bindSize; } }
            public uint WeakBindOff { get { return _weakBindOff; } }
            public uint WeakBindSize { get { return _weakBindSize; } }
            public uint LazyBindOff { get { return _lazyBindOff; } }
            public uint LazyBindSize { get { return _lazyBindSize; } }
            public uint ExportOff { get { return _exportOff; } }
            public uint ExportSize { get { return _exportSize; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
            public byte[] M_RawBind { get { return __raw_bind; } }
            public byte[] M_RawExports { get { return __raw_exports; } }
            public byte[] M_RawWeakBind { get { return __raw_weakBind; } }
            public byte[] M_RawRebase { get { return __raw_rebase; } }
            public byte[] M_RawLazyBind { get { return __raw_lazyBind; } }
        }
        public partial class DylinkerCommand : KaitaiStruct
        {
            public static DylinkerCommand FromFile(string fileName)
            {
                return new DylinkerCommand(new KaitaiStream(fileName));
            }

            public DylinkerCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = new LcStr(m_io, this, m_root);
            }
            private LcStr _name;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public LcStr Name { get { return _name; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class DylibCommand : KaitaiStruct
        {
            public static DylibCommand FromFile(string fileName)
            {
                return new DylibCommand(new KaitaiStream(fileName));
            }

            public DylibCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _nameOffset = m_io.ReadU4le();
                _timestamp = m_io.ReadU4le();
                _currentVersion = m_io.ReadU4le();
                _compatibilityVersion = m_io.ReadU4le();
                _name = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private uint _nameOffset;
            private uint _timestamp;
            private uint _currentVersion;
            private uint _compatibilityVersion;
            private string _name;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public uint NameOffset { get { return _nameOffset; } }
            public uint Timestamp { get { return _timestamp; } }
            public uint CurrentVersion { get { return _currentVersion; } }
            public uint CompatibilityVersion { get { return _compatibilityVersion; } }
            public string Name { get { return _name; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class SegmentCommand : KaitaiStruct
        {
            public static SegmentCommand FromFile(string fileName)
            {
                return new SegmentCommand(new KaitaiStream(fileName));
            }

            public SegmentCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _segname = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0));
                _vmaddr = m_io.ReadU4le();
                _vmsize = m_io.ReadU4le();
                _fileoff = m_io.ReadU4le();
                _filesize = m_io.ReadU4le();
                _maxprot = new VmProt(m_io, this, m_root);
                _initprot = new VmProt(m_io, this, m_root);
                _nsects = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                _sections = new List<Section>();
                for (var i = 0; i < Nsects; i++)
                {
                    _sections.Add(new Section(m_io, this, m_root));
                }
            }
            public partial class Section : KaitaiStruct
            {
                public static Section FromFile(string fileName)
                {
                    return new Section(new KaitaiStream(fileName));
                }

                public Section(KaitaiStream p__io, MachO.SegmentCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_data = false;
                    _read();
                }
                private void _read()
                {
                    _sectName = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0));
                    _segName = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(16), 0));
                    _addr = m_io.ReadU4le();
                    _size = m_io.ReadU4le();
                    _offset = m_io.ReadU4le();
                    _align = m_io.ReadU4le();
                    _reloff = m_io.ReadU4le();
                    _nreloc = m_io.ReadU4le();
                    _flags = m_io.ReadU4le();
                    _reserved1 = m_io.ReadU4le();
                    _reserved2 = m_io.ReadU4le();
                }
                private bool f_data;
                private byte[] _data;
                public byte[] Data
                {
                    get
                    {
                        if (f_data)
                            return _data;
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(Offset);
                        _data = io.ReadBytes(Size);
                        io.Seek(_pos);
                        f_data = true;
                        return _data;
                    }
                }
                private string _sectName;
                private string _segName;
                private uint _addr;
                private uint _size;
                private uint _offset;
                private uint _align;
                private uint _reloff;
                private uint _nreloc;
                private uint _flags;
                private uint _reserved1;
                private uint _reserved2;
                private MachO m_root;
                private MachO.SegmentCommand m_parent;
                public string SectName { get { return _sectName; } }
                public string SegName { get { return _segName; } }
                public uint Addr { get { return _addr; } }
                public uint Size { get { return _size; } }
                public uint Offset { get { return _offset; } }
                public uint Align { get { return _align; } }
                public uint Reloff { get { return _reloff; } }
                public uint Nreloc { get { return _nreloc; } }
                public uint Flags { get { return _flags; } }
                public uint Reserved1 { get { return _reserved1; } }
                public uint Reserved2 { get { return _reserved2; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.SegmentCommand M_Parent { get { return m_parent; } }
            }
            private string _segname;
            private uint _vmaddr;
            private uint _vmsize;
            private uint _fileoff;
            private uint _filesize;
            private VmProt _maxprot;
            private VmProt _initprot;
            private uint _nsects;
            private uint _flags;
            private List<Section> _sections;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public string Segname { get { return _segname; } }
            public uint Vmaddr { get { return _vmaddr; } }
            public uint Vmsize { get { return _vmsize; } }
            public uint Fileoff { get { return _fileoff; } }
            public uint Filesize { get { return _filesize; } }
            public VmProt Maxprot { get { return _maxprot; } }
            public VmProt Initprot { get { return _initprot; } }
            public uint Nsects { get { return _nsects; } }
            public uint Flags { get { return _flags; } }
            public List<Section> Sections { get { return _sections; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class LcStr : KaitaiStruct
        {
            public static LcStr FromFile(string fileName)
            {
                return new LcStr(new KaitaiStream(fileName));
            }

            public LcStr(KaitaiStream p__io, KaitaiStruct p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _length = m_io.ReadU4le();
                _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private uint _length;
            private string _value;
            private MachO m_root;
            private KaitaiStruct m_parent;
            public uint Length { get { return _length; } }
            public string Value { get { return _value; } }
            public MachO M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LoadCommand : KaitaiStruct
        {
            public static LoadCommand FromFile(string fileName)
            {
                return new LoadCommand(new KaitaiStream(fileName));
            }

            public LoadCommand(KaitaiStream p__io, MachO p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = ((MachO.LoadCommandType) m_io.ReadU4le());
                _size = m_io.ReadU4le();
                switch (Type) {
                case MachO.LoadCommandType.IdDylinker: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylinkerCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.ReexportDylib: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylibCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.BuildVersion: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new BuildVersionCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.SourceVersion: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SourceVersionCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.FunctionStarts: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new LinkeditDataCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Rpath: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RpathCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.SubFramework: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SubCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Routines: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RoutinesCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.SubLibrary: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SubCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.DyldInfoOnly: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DyldInfoCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.DyldEnvironment: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylinkerCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LoadDylinker: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylinkerCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.SegmentSplitInfo: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new LinkeditDataCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Main: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EntryPointCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LoadDylib: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylibCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.EncryptionInfo: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EncryptionInfoCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Dysymtab: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DysymtabCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.TwolevelHints: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new TwolevelHintsCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.EncryptionInfo64: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EncryptionInfoCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LinkerOption: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new LinkerOptionCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.DyldInfo: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DyldInfoCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.VersionMinTvos: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new VersionMinCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LoadUpwardDylib: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylibCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Segment64: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SegmentCommand64(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Segment: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SegmentCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.SubUmbrella: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SubCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.VersionMinWatchos: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new VersionMinCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Routines64: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RoutinesCommand64(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.IdDylib: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylibCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.SubClient: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SubCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.DylibCodeSignDrs: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new LinkeditDataCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Symtab: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SymtabCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LinkerOptimizationHint: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new LinkeditDataCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.DataInCode: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new LinkeditDataCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.CodeSignature: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new CodeSignatureCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.VersionMinIphoneos: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new VersionMinCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LoadWeakDylib: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylibCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.LazyLoadDylib: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new DylibCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.Uuid: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new UuidCommand(io___raw_body, this, m_root);
                    break;
                }
                case MachO.LoadCommandType.VersionMinMacosx: {
                    __raw_body = m_io.ReadBytes((Size - 8));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new VersionMinCommand(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes((Size - 8));
                    break;
                }
                }
            }
            private LoadCommandType _type;
            private uint _size;
            private object _body;
            private MachO m_root;
            private MachO m_parent;
            private byte[] __raw_body;
            public LoadCommandType Type { get { return _type; } }
            public uint Size { get { return _size; } }
            public object Body { get { return _body; } }
            public MachO M_Root { get { return m_root; } }
            public MachO M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class UuidCommand : KaitaiStruct
        {
            public static UuidCommand FromFile(string fileName)
            {
                return new UuidCommand(new KaitaiStream(fileName));
            }

            public UuidCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _uuid = m_io.ReadBytes(16);
            }
            private byte[] _uuid;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public byte[] Uuid { get { return _uuid; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class SymtabCommand : KaitaiStruct
        {
            public static SymtabCommand FromFile(string fileName)
            {
                return new SymtabCommand(new KaitaiStream(fileName));
            }

            public SymtabCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_symbols = false;
                f_strs = false;
                _read();
            }
            private void _read()
            {
                _symOff = m_io.ReadU4le();
                _nSyms = m_io.ReadU4le();
                _strOff = m_io.ReadU4le();
                _strSize = m_io.ReadU4le();
            }
            public partial class StrTable : KaitaiStruct
            {
                public static StrTable FromFile(string fileName)
                {
                    return new StrTable(new KaitaiStream(fileName));
                }

                public StrTable(KaitaiStream p__io, MachO.SymtabCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _unknown = m_io.ReadU4le();
                    _items = new List<string>();
                    {
                        var i = 0;
                        string M_;
                        do {
                            M_ = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, false));
                            _items.Add(M_);
                            i++;
                        } while (!(M_ == ""));
                    }
                }
                private uint _unknown;
                private List<string> _items;
                private MachO m_root;
                private MachO.SymtabCommand m_parent;
                public uint Unknown { get { return _unknown; } }
                public List<string> Items { get { return _items; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.SymtabCommand M_Parent { get { return m_parent; } }
            }
            public partial class Nlist64 : KaitaiStruct
            {
                public static Nlist64 FromFile(string fileName)
                {
                    return new Nlist64(new KaitaiStream(fileName));
                }

                public Nlist64(KaitaiStream p__io, MachO.SymtabCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_name = false;
                    _read();
                }
                private void _read()
                {
                    _un = m_io.ReadU4le();
                    _type = m_io.ReadU1();
                    _sect = m_io.ReadU1();
                    _desc = m_io.ReadU2le();
                    _value = m_io.ReadU8le();
                }
                private bool f_name;
                private string _name;
                public string Name
                {
                    get
                    {
                        if (f_name)
                            return _name;
                        if (Un != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek((M_Parent.StrOff + Un));
                            _name = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                            m_io.Seek(_pos);
                            f_name = true;
                        }
                        return _name;
                    }
                }
                private uint _un;
                private byte _type;
                private byte _sect;
                private ushort _desc;
                private ulong _value;
                private MachO m_root;
                private MachO.SymtabCommand m_parent;
                public uint Un { get { return _un; } }
                public byte Type { get { return _type; } }
                public byte Sect { get { return _sect; } }
                public ushort Desc { get { return _desc; } }
                public ulong Value { get { return _value; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.SymtabCommand M_Parent { get { return m_parent; } }
            }
            public partial class Nlist : KaitaiStruct
            {
                public static Nlist FromFile(string fileName)
                {
                    return new Nlist(new KaitaiStream(fileName));
                }

                public Nlist(KaitaiStream p__io, MachO.SymtabCommand p__parent = null, MachO p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_name = false;
                    _read();
                }
                private void _read()
                {
                    _un = m_io.ReadU4le();
                    _type = m_io.ReadU1();
                    _sect = m_io.ReadU1();
                    _desc = m_io.ReadU2le();
                    _value = m_io.ReadU4le();
                }
                private bool f_name;
                private string _name;
                public string Name
                {
                    get
                    {
                        if (f_name)
                            return _name;
                        if (Un != 0) {
                            long _pos = m_io.Pos;
                            m_io.Seek((M_Parent.StrOff + Un));
                            _name = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
                            m_io.Seek(_pos);
                            f_name = true;
                        }
                        return _name;
                    }
                }
                private uint _un;
                private byte _type;
                private byte _sect;
                private ushort _desc;
                private uint _value;
                private MachO m_root;
                private MachO.SymtabCommand m_parent;
                public uint Un { get { return _un; } }
                public byte Type { get { return _type; } }
                public byte Sect { get { return _sect; } }
                public ushort Desc { get { return _desc; } }
                public uint Value { get { return _value; } }
                public MachO M_Root { get { return m_root; } }
                public MachO.SymtabCommand M_Parent { get { return m_parent; } }
            }
            private bool f_symbols;
            private List<KaitaiStruct> _symbols;
            public List<KaitaiStruct> Symbols
            {
                get
                {
                    if (f_symbols)
                        return _symbols;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(SymOff);
                    _symbols = new List<KaitaiStruct>();
                    for (var i = 0; i < NSyms; i++)
                    {
                        switch (M_Root.Magic) {
                        case MachO.MagicType.MachoLeX64: {
                            _symbols.Add(new Nlist64(io, this, m_root));
                            break;
                        }
                        case MachO.MagicType.MachoBeX64: {
                            _symbols.Add(new Nlist64(io, this, m_root));
                            break;
                        }
                        case MachO.MagicType.MachoLeX86: {
                            _symbols.Add(new Nlist(io, this, m_root));
                            break;
                        }
                        case MachO.MagicType.MachoBeX86: {
                            _symbols.Add(new Nlist(io, this, m_root));
                            break;
                        }
                        }
                    }
                    io.Seek(_pos);
                    f_symbols = true;
                    return _symbols;
                }
            }
            private bool f_strs;
            private StrTable _strs;
            public StrTable Strs
            {
                get
                {
                    if (f_strs)
                        return _strs;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(StrOff);
                    __raw_strs = io.ReadBytes(StrSize);
                    var io___raw_strs = new KaitaiStream(__raw_strs);
                    _strs = new StrTable(io___raw_strs, this, m_root);
                    io.Seek(_pos);
                    f_strs = true;
                    return _strs;
                }
            }
            private uint _symOff;
            private uint _nSyms;
            private uint _strOff;
            private uint _strSize;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            private byte[] __raw_strs;
            public uint SymOff { get { return _symOff; } }
            public uint NSyms { get { return _nSyms; } }
            public uint StrOff { get { return _strOff; } }
            public uint StrSize { get { return _strSize; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
            public byte[] M_RawStrs { get { return __raw_strs; } }
        }
        public partial class VersionMinCommand : KaitaiStruct
        {
            public static VersionMinCommand FromFile(string fileName)
            {
                return new VersionMinCommand(new KaitaiStream(fileName));
            }

            public VersionMinCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = new Version(m_io, this, m_root);
                _sdk = new Version(m_io, this, m_root);
            }
            private Version _version;
            private Version _sdk;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public Version Version { get { return _version; } }
            public Version Sdk { get { return _sdk; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        public partial class EntryPointCommand : KaitaiStruct
        {
            public static EntryPointCommand FromFile(string fileName)
            {
                return new EntryPointCommand(new KaitaiStream(fileName));
            }

            public EntryPointCommand(KaitaiStream p__io, MachO.LoadCommand p__parent = null, MachO p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entryOff = m_io.ReadU8le();
                _stackSize = m_io.ReadU8le();
            }
            private ulong _entryOff;
            private ulong _stackSize;
            private MachO m_root;
            private MachO.LoadCommand m_parent;
            public ulong EntryOff { get { return _entryOff; } }
            public ulong StackSize { get { return _stackSize; } }
            public MachO M_Root { get { return m_root; } }
            public MachO.LoadCommand M_Parent { get { return m_parent; } }
        }
        private MagicType _magic;
        private MachHeader _header;
        private List<LoadCommand> _loadCommands;
        private MachO m_root;
        private KaitaiStruct m_parent;
        public MagicType Magic { get { return _magic; } }
        public MachHeader Header { get { return _header; } }
        public List<LoadCommand> LoadCommands { get { return _loadCommands; } }
        public MachO M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
