// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;
using System;

namespace Kaitai
{

    /// <summary>
    /// An RPM package consists of the lead, the signature (contains digests and
    /// signatures), the header (contains the package metadata) and the payload (a
    /// compressed archive of the package files).
    /// 
    /// This structure is shared by all package format versions supported by this
    /// Kaitai Struct implementation:
    /// 
    /// * v3, written by RPM 2.1 to 3.x.
    /// * v4, written by RPM 4.x, and by RPM 6.x when the `%_rpmformat` macro is set
    ///   to 4 - see
    ///   &lt;https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/man/rpmbuild-config.5.scd?plain=1#L189-L192&gt;.
    ///   For example, Fedora 43 and 44 patch RPM 6.0 to keep producing v4 packages by
    ///   default - see
    ///   &lt;https://src.fedoraproject.org/rpms/rpm/blob/7099d81c3b5ecf1777a43095be429cb198bcc566/f/rpm-6.0-rpmformat.patch&gt;.
    /// * v6, written by upstream RPM 6.0 by default - see
    ///   &lt;https://github.com/rpm-software-management/rpm/commit/99d80a22d3d299bdc4418f7e61cd491731626d37&gt;.
    /// 
    /// The versions differ mainly in the tags they use: v6 packages store all sizes
    /// as 64-bit integers, carry only cryptographic data in the signature and always
    /// use the stripped-down cpio archive format (see the `payload` instance).
    /// 
    /// The formats before v3, as well as the abandoned rpm5 fork, are not covered by
    /// this implementation.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_v6.md">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_v4.md">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_v3.md">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/signatures_digests.md">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/large_files.md">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/tags.md">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://ftp.osuosl.org/pub/rpm/max-rpm/">Source</a>
    /// </remarks>
    public partial class Rpm : KaitaiStruct
    {
        public static Rpm FromFile(string fileName)
        {
            return new Rpm(new KaitaiStream(fileName));
        }


        public enum Architectures
        {
            NotSet = 0,
            X86 = 1,
            Alpha = 2,
            Sparc = 3,
            Mips = 4,
            Ppc = 5,
            M68k = 6,
            Sgi = 7,
            Rs6000 = 8,
            Ia64 = 9,
            Sparc64 = 10,
            Mips64 = 11,
            Arm = 12,
            M68kMint = 13,
            S390 = 14,
            S390x = 15,
            Ppc64 = 16,
            Sh = 17,
            Xtensa = 18,
            Aarch64 = 19,
            MipsR6 = 20,
            Mips64R6 = 21,
            Riscv = 22,
            Loongarch64 = 23,
            E2k = 24,
            NoArch = 255,
        }

        public enum HeaderTags
        {
            Signatures = 62,
            HeaderImmutable = 63,
            I18nTable = 100,
            Name = 1000,
            Version = 1001,
            Release = 1002,
            Epoch = 1003,
            Summary = 1004,
            Description = 1005,
            BuildTime = 1006,
            BuildHost = 1007,
            InstallTime = 1008,
            Size = 1009,
            Distribution = 1010,
            Vendor = 1011,
            GifObsolete = 1012,
            XpmObsolete = 1013,
            License = 1014,
            Packager = 1015,
            Group = 1016,
            ChangelogInternal = 1017,
            Source = 1018,
            Patch = 1019,
            Url = 1020,
            Os = 1021,
            Arch = 1022,
            PreInstallScriptlet = 1023,
            PostInstallScriptlet = 1024,
            PreUninstallScriptlet = 1025,
            PostUninstallScriptlet = 1026,
            OldFileNamesObsolete = 1027,
            FileSizes = 1028,
            FileStates = 1029,
            FileModes = 1030,
            FileUidsInternal = 1031,
            FileGidsInternal = 1032,
            DeviceNumber = 1033,
            Mtimes = 1034,
            FileDigests = 1035,
            LinkTos = 1036,
            FileFlags = 1037,
            RootInternal = 1038,
            FileOwner = 1039,
            FileGroup = 1040,
            ExcludeInternal = 1041,
            ExclusiveInternal = 1042,
            IconObsolete = 1043,
            SourceRpm = 1044,
            FileVerifyFlags = 1045,
            ArchiveSize = 1046,
            ProvideName = 1047,
            RequireFlags = 1048,
            RequireName = 1049,
            RequireVersion = 1050,
            NoSource = 1051,
            NoPatch = 1052,
            ConflictFlags = 1053,
            ConflictName = 1054,
            ConflictVersion = 1055,
            DefaultPrefixInternal = 1056,
            BuildRootInternal = 1057,
            InstallPrefixInternal = 1058,
            ExcludeArch = 1059,
            ExcludeOs = 1060,
            ExclusiveArch = 1061,
            ExclusiveOs = 1062,
            AutoreqprovInternal = 1063,
            RpmVersion = 1064,
            TriggerScripts = 1065,
            TriggerName = 1066,
            TriggerVersion = 1067,
            TriggerFlags = 1068,
            TriggerIndex = 1069,
            VerifyScript = 1079,
            ChangelogTime = 1080,
            ChangelogName = 1081,
            ChangelogText = 1082,
            BrokenMd5Internal = 1083,
            PrereqInternal = 1084,
            PreInstallInterpreter = 1085,
            PostInstallInterpreter = 1086,
            PreUninstallInterpreter = 1087,
            PostUninstallInterpreter = 1088,
            BuildArchs = 1089,
            ObsoleteName = 1090,
            VerifyScriptProg = 1091,
            TriggerScriptProg = 1092,
            DocDirInternal = 1093,
            Cookie = 1094,
            FileDevices = 1095,
            FileInodes = 1096,
            FileLangs = 1097,
            Prefixes = 1098,
            InstallPrefixes = 1099,
            TriggerInstallInternal = 1100,
            TriggerUninstallInternal = 1101,
            TriggerPostUninstallInternal = 1102,
            AutoreqInternal = 1103,
            AutoprovInternal = 1104,
            CapabilityInternal = 1105,
            SourcePackage = 1106,
            OldOrigFilenamesInternal = 1107,
            BuildPrereqInternal = 1108,
            BuildRequiresInternal = 1109,
            BuildConflictsInternal = 1110,
            BuildMacrosInternal = 1111,
            ProvideFlags = 1112,
            ProvideVersion = 1113,
            ObsoleteFlags = 1114,
            ObsoleteVersion = 1115,
            DirIndexes = 1116,
            BaseNames = 1117,
            DirNames = 1118,
            OrigDirIndexes = 1119,
            OrigBaseNames = 1120,
            OrigDirNames = 1121,
            OptFlags = 1122,
            DistUrl = 1123,
            PayloadFormat = 1124,
            PayloadCompressor = 1125,
            PayloadFlags = 1126,
            InstallColor = 1127,
            InstallTid = 1128,
            RemoveTidObsolete = 1129,
            Sha1RhnInternal = 1130,
            RhnPlatformInternal = 1131,
            Platform = 1132,
            PatchesNameObsolete = 1133,
            PatchesFlagsObsolete = 1134,
            PatchesVersionObsolete = 1135,
            CacheCtimeInternal = 1136,
            CachePkgPathInternal = 1137,
            CachePkgSizeInternal = 1138,
            CachePkgMtimeInternal = 1139,
            FileColors = 1140,
            FileClass = 1141,
            ClassDict = 1142,
            FileDependsIdx = 1143,
            FileDependsNum = 1144,
            DependsDict = 1145,
            SourceSigMd5 = 1146,
            FileContextsObsolete = 1147,
            FsContextsObsolete = 1148,
            ReContextsObsolete = 1149,
            Policies = 1150,
            PreTrans = 1151,
            PostTrans = 1152,
            PreTransProg = 1153,
            PostTransProg = 1154,
            DistTag = 1155,
            OldSuggestsNameObsolete = 1156,
            OldSuggestsVersionObsolete = 1157,
            OldSuggestsFlagsObsolete = 1158,
            OldEnhancesNameObsolete = 1159,
            OldEnhancesVersionObsolete = 1160,
            OldEnhancesFlagsObsolete = 1161,
            PriorityUnimplemented = 1162,
            CvsidUnimplemented = 1163,
            BlinkPkgidUnimplemented = 1164,
            BlinkHdridUnimplemented = 1165,
            BlinkNevraUnimplemented = 1166,
            FlinkPkgidUnimplemented = 1167,
            FlinkHdridUnimplemented = 1168,
            FlinkNevraUnimplemented = 1169,
            PackageOriginUnimplemented = 1170,
            TriggerPreInstallInternal = 1171,
            BuildSuggestsUnimplemented = 1172,
            BuildEnhancesUnimplemented = 1173,
            ScriptStatesUnimplemented = 1174,
            ScriptMetricsUnimplemented = 1175,
            BuildCpuClockUnimplemented = 1176,
            FileDigestAlgosUnimplemented = 1177,
            VariantsUnimplemented = 1178,
            XmajorUnimplemented = 1179,
            XminorUnimplemented = 1180,
            RepoTagUnimplemented = 1181,
            KeywordsUnimplemented = 1182,
            BuildPlatformsUnimplemented = 1183,
            PackageColorUnimplemented = 1184,
            PackagePrefColorUnimplemented = 1185,
            XattrsDictUnimplemented = 1186,
            FilexAttrsxUnimplemented = 1187,
            DepAttrsDictUnimplemented = 1188,
            ConflictAttrsxUnimplemented = 1189,
            ObsoleteAttrsxUnimplemented = 1190,
            ProvideAttrsxUnimplemented = 1191,
            RequireAttrsxUnimplemented = 1192,
            BuildProvidesUnimplemented = 1193,
            BuildObsoletesUnimplemented = 1194,
            DbInstance = 1195,
            Nvra = 1196,
            FileNames = 5000,
            FileProvide = 5001,
            FileRequire = 5002,
            FsNamesUnimplemented = 5003,
            FsSizesUnimplemented = 5004,
            TriggerConds = 5005,
            TriggerType = 5006,
            OrigFileNames = 5007,
            LongFileSizes = 5008,
            LongSize = 5009,
            FileCaps = 5010,
            FileDigestAlgo = 5011,
            BugUrl = 5012,
            Evr = 5013,
            Nvr = 5014,
            Nevr = 5015,
            Nevra = 5016,
            HeaderColor = 5017,
            Verbose = 5018,
            EpochNum = 5019,
            PreInstallFlags = 5020,
            PostInstallFlags = 5021,
            PreUninstallFlags = 5022,
            PostUninstallFlags = 5023,
            PreTransFlags = 5024,
            PostTransFlags = 5025,
            VerifyScriptFlags = 5026,
            TriggerScriptFlags = 5027,
            CollectionsUnimplemented = 5029,
            PolicyNames = 5030,
            PolicyTypes = 5031,
            PolicyTypesIndexes = 5032,
            PolicyFlags = 5033,
            Vcs = 5034,
            OrderName = 5035,
            OrderVersion = 5036,
            OrderFlags = 5037,
            MssfManifestUnimplemented = 5038,
            MssfDomainUnimplemented = 5039,
            InstFileNames = 5040,
            RequireNevrs = 5041,
            ProvideNevrs = 5042,
            ObsoleteNevrs = 5043,
            ConflictNevrs = 5044,
            FileNlinks = 5045,
            RecommendName = 5046,
            RecommendVersion = 5047,
            RecommendFlags = 5048,
            SuggestName = 5049,
            SuggestVersion = 5050,
            SuggestFlags = 5051,
            SupplementName = 5052,
            SupplementVersion = 5053,
            SupplementFlags = 5054,
            EnhanceName = 5055,
            EnhanceVersion = 5056,
            EnhanceFlags = 5057,
            RecommendNevrs = 5058,
            SuggestNevrs = 5059,
            SupplementNevrs = 5060,
            EnhanceNevrs = 5061,
            Encoding = 5062,
            FileTriggerInstallInternal = 5063,
            FileTriggerUninstallInternal = 5064,
            FileTriggerPostUninstallInternal = 5065,
            FileTriggerScripts = 5066,
            FileTriggerScriptProg = 5067,
            FileTriggerScriptFlags = 5068,
            FileTriggerName = 5069,
            FileTriggerIndex = 5070,
            FileTriggerVersion = 5071,
            FileTriggerFlags = 5072,
            TransFileTriggerInstallInternal = 5073,
            TransFileTriggerUninstallInternal = 5074,
            TransFileTriggerPostUninstallInternal = 5075,
            TransFileTriggerScripts = 5076,
            TransFileTriggerScriptProg = 5077,
            TransFileTriggerScriptFlags = 5078,
            TransFileTriggerName = 5079,
            TransFileTriggerIndex = 5080,
            TransFileTriggerVersion = 5081,
            TransFileTriggerFlags = 5082,
            RemovePathPostfixesInternal = 5083,
            FileTriggerPriorities = 5084,
            TransFileTriggerPriorities = 5085,
            FileTriggerConds = 5086,
            FileTriggerType = 5087,
            TransFileTriggerConds = 5088,
            TransFileTriggerType = 5089,
            FileSignatures = 5090,
            FileSignatureLength = 5091,
            PayloadSha256 = 5092,
            PayloadSha256AlgoObsolete = 5093,
            AutoInstalledUnimplemented = 5094,
            IdentityUnimplemented = 5095,
            ModularityLabel = 5096,
            PayloadSha256Alt = 5097,
            ArchSuffix = 5098,
            Spec = 5099,
            TranslationUrl = 5100,
            UpstreamReleases = 5101,
            SourceLicenseInternal = 5102,
            PreUntrans = 5103,
            PostUntrans = 5104,
            PreUntransProg = 5105,
            PostUntransProg = 5106,
            PreUntransFlags = 5107,
            PostUntransFlags = 5108,
            SysUsers = 5109,
            BuildSystemInternal = 5110,
            BuildOptionInternal = 5111,
            PayloadSize = 5112,
            PayloadSizeAlt = 5113,
            RpmFormat = 5114,
            FileMimeIndex = 5115,
            MimeDict = 5116,
            FileMimes = 5117,
            PackageDigests = 5118,
            PackageDigestAlgos = 5119,
            SourceNevr = 5120,
            PayloadSha512 = 5121,
            PayloadSha512Alt = 5122,
            PayloadSha3256 = 5123,
            PayloadSha3256Alt = 5124,
        }

        public enum OperatingSystems
        {
            NotSet = 0,
            Linux = 1,
            Irix = 2,
            NoOs = 255,
        }

        public enum RecordTypes
        {
            Char = 1,
            Uint8 = 2,
            Uint16 = 3,
            Uint32 = 4,
            Uint64 = 5,
            String = 6,
            Bin = 7,
            StringArray = 8,
            I18nString = 9,
        }

        public enum RpmTypes
        {
            Binary = 0,
            Source = 1,
        }

        public enum SignatureTags
        {
            Signatures = 62,
            HeaderImmutable = 63,
            I18nTable = 100,
            BadSha11Obsolete = 264,
            BadSha12Obsolete = 265,
            Dsa = 267,
            Rsa = 268,
            Sha1 = 269,
            LongSize = 270,
            LongArchiveSize = 271,
            Sha256 = 273,
            FileSignatures = 274,
            FileSignatureLength = 275,
            VeritySignatures = 276,
            VeritySignatureAlgo = 277,
            Openpgp = 278,
            Sha3256 = 279,
            Reserved = 999,
            Size = 1000,
            LeMd51Obsolete = 1001,
            Pgp = 1002,
            LeMd52Obsolete = 1003,
            Md5 = 1004,
            Gpg = 1005,
            Pgp5Obsolete = 1006,
            PayloadSize = 1007,
            ReservedSpace = 1008,
        }
        public Rpm(KaitaiStream p__io, KaitaiStruct p__parent = null, Rpm p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_hasHeaderPayloadSizeTag = false;
            f_hasPayload = false;
            f_hasSignatureLongSizeTag = false;
            f_hasSignatureSizeTag = false;
            f_headerPayloadSizeTag = false;
            f_lenHeader = false;
            f_lenPayload = false;
            f_ofsHeader = false;
            f_ofsPayload = false;
            f_payload = false;
            f_signatureLongSizeTag = false;
            f_signatureSizeTag = false;
            _read();
        }
        private void _read()
        {
            _lead = new Lead(m_io, this, m_root);
            _signature = new Header(true, m_io, this, m_root);
            _signaturePadding = m_io.ReadBytes(KaitaiStream.Mod(-(M_Io.Pos), 8));
            if (OfsHeader < 0) {
                __unnamed3 = m_io.ReadBytes(0);
            }
            _header = new Header(false, m_io, this, m_root);
            if (OfsPayload < 0) {
                __unnamed5 = m_io.ReadBytes(0);
            }
            _signatureTagsSteps = new List<SignatureTagsStep>();
            for (var i = 0; i < Signature.HeaderRecord.NumIndexRecords; i++)
            {
                _signatureTagsSteps.Add(new SignatureTagsStep(i, (i != 0 ? SignatureTagsSteps[i - 1].SizeTagIdx : -1), (i != 0 ? SignatureTagsSteps[i - 1].LongSizeTagIdx : -1), m_io, this, m_root));
            }
            _headerTagsSteps = new List<HeaderTagsStep>();
            for (var i = 0; i < Header.HeaderRecord.NumIndexRecords; i++)
            {
                _headerTagsSteps.Add(new HeaderTagsStep(i, (i != 0 ? HeaderTagsSteps[i - 1].PayloadSizeTagIdx : -1), m_io, this, m_root));
            }
        }
        public partial class Dummy : KaitaiStruct
        {
            public static Dummy FromFile(string fileName)
            {
                return new Dummy(new KaitaiStream(fileName));
            }

            public Dummy(KaitaiStream p__io, Rpm.Header p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Rpm m_root;
            private Rpm.Header m_parent;
            public Rpm M_Root { get { return m_root; } }
            public Rpm.Header M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// header structure used for both the &quot;header&quot; and &quot;signature&quot;, but some tag
        /// values have different meanings in signature and header (hence they use
        /// different enums)
        /// </summary>
        public partial class Header : KaitaiStruct
        {
            public Header(bool p_isSignature, KaitaiStream p__io, Rpm p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _isSignature = p_isSignature;
                f_isHeader = false;
                _read();
            }
            private void _read()
            {
                _headerRecord = new HeaderRecord(m_io, this, m_root);
                _indexRecords = new List<HeaderIndexRecord>();
                for (var i = 0; i < HeaderRecord.NumIndexRecords; i++)
                {
                    _indexRecords.Add(new HeaderIndexRecord(m_io, this, m_root));
                }
                __raw_storageSection = m_io.ReadBytes(HeaderRecord.LenStorageSection);
                var io___raw_storageSection = new KaitaiStream(__raw_storageSection);
                _storageSection = new Dummy(io___raw_storageSection, this, m_root);
            }
            private bool f_isHeader;
            private bool _isHeader;
            public bool IsHeader
            {
                get
                {
                    if (f_isHeader)
                        return _isHeader;
                    f_isHeader = true;
                    _isHeader = (bool) (!(IsSignature));
                    return _isHeader;
                }
            }
            private HeaderRecord _headerRecord;
            private List<HeaderIndexRecord> _indexRecords;
            private Dummy _storageSection;
            private bool _isSignature;
            private Rpm m_root;
            private Rpm m_parent;
            private byte[] __raw_storageSection;
            public HeaderRecord HeaderRecord { get { return _headerRecord; } }
            public List<HeaderIndexRecord> IndexRecords { get { return _indexRecords; } }
            public Dummy StorageSection { get { return _storageSection; } }
            public bool IsSignature { get { return _isSignature; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm M_Parent { get { return m_parent; } }
            public byte[] M_RawStorageSection { get { return __raw_storageSection; } }
        }
        public partial class HeaderIndexRecord : KaitaiStruct
        {
            public static HeaderIndexRecord FromFile(string fileName)
            {
                return new HeaderIndexRecord(new KaitaiStream(fileName));
            }

            public HeaderIndexRecord(KaitaiStream p__io, Rpm.Header p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                f_headerTag = false;
                f_lenValue = false;
                f_numValues = false;
                f_signatureTag = false;
                _read();
            }
            private void _read()
            {
                _tagRaw = m_io.ReadU4be();
                _recordType = ((Rpm.RecordTypes) m_io.ReadU4be());
                if (!Enum.IsDefined(typeof(RecordTypes), _recordType))
                {
                    throw new ValidationNotInEnumError(_recordType, m_io, "/types/header_index_record/seq/1");
                }
                _ofsBody = m_io.ReadU4be();
                _count = m_io.ReadU4be();
            }
            private bool f_body;
            private KaitaiStruct _body;
            public KaitaiStruct Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    f_body = true;
                    KaitaiStream io = M_Parent.StorageSection.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsBody);
                    switch (RecordType) {
                    case Rpm.RecordTypes.Bin: {
                        _body = new RecordTypeBin(LenValue, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.Char: {
                        _body = new RecordTypeUint8(NumValues, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.I18nString: {
                        _body = new RecordTypeStringArray(NumValues, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.String: {
                        _body = new RecordTypeString(io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.StringArray: {
                        _body = new RecordTypeStringArray(NumValues, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.Uint16: {
                        _body = new RecordTypeUint16(NumValues, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.Uint32: {
                        _body = new RecordTypeUint32(NumValues, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.Uint64: {
                        _body = new RecordTypeUint64(NumValues, io, this, m_root);
                        break;
                    }
                    case Rpm.RecordTypes.Uint8: {
                        _body = new RecordTypeUint8(NumValues, io, this, m_root);
                        break;
                    }
                    }
                    io.Seek(_pos);
                    return _body;
                }
            }
            private bool f_headerTag;
            private HeaderTags _headerTag;
            public HeaderTags HeaderTag
            {
                get
                {
                    if (f_headerTag)
                        return _headerTag;
                    f_headerTag = true;
                    if (M_Parent.IsHeader) {
                        _headerTag = (HeaderTags) (((Rpm.HeaderTags) TagRaw));
                    }
                    return _headerTag;
                }
            }
            private bool f_lenValue;
            private uint? _lenValue;
            public uint? LenValue
            {
                get
                {
                    if (f_lenValue)
                        return _lenValue;
                    f_lenValue = true;
                    if (RecordType == Rpm.RecordTypes.Bin) {
                        _lenValue = (uint) (Count);
                    }
                    return _lenValue;
                }
            }
            private bool f_numValues;
            private uint? _numValues;
            public uint? NumValues
            {
                get
                {
                    if (f_numValues)
                        return _numValues;
                    f_numValues = true;
                    if (RecordType != Rpm.RecordTypes.Bin) {
                        _numValues = (uint) (Count);
                    }
                    return _numValues;
                }
            }
            private bool f_signatureTag;
            private SignatureTags _signatureTag;
            public SignatureTags SignatureTag
            {
                get
                {
                    if (f_signatureTag)
                        return _signatureTag;
                    f_signatureTag = true;
                    if (M_Parent.IsSignature) {
                        _signatureTag = (SignatureTags) (((Rpm.SignatureTags) TagRaw));
                    }
                    return _signatureTag;
                }
            }
            private uint _tagRaw;
            private RecordTypes _recordType;
            private uint _ofsBody;
            private uint _count;
            private Rpm m_root;
            private Rpm.Header m_parent;

            /// <summary>
            /// prefer to access `signature_tag` and `header_tag` instead
            /// </summary>
            public uint TagRaw { get { return _tagRaw; } }
            public RecordTypes RecordType { get { return _recordType; } }
            public uint OfsBody { get { return _ofsBody; } }

            /// <summary>
            /// internal; access `num_values` and `len_value` instead
            /// </summary>
            public uint Count { get { return _count; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.Header M_Parent { get { return m_parent; } }
        }
        public partial class HeaderRecord : KaitaiStruct
        {
            public static HeaderRecord FromFile(string fileName)
            {
                return new HeaderRecord(new KaitaiStream(fileName));
            }

            public HeaderRecord(KaitaiStream p__io, Rpm.Header p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 142, 173, 232, 1 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 142, 173, 232, 1 }, _magic, m_io, "/types/header_record/seq/0");
                }
                _reserved = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_reserved, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _reserved, m_io, "/types/header_record/seq/1");
                }
                _numIndexRecords = m_io.ReadU4be();
                if (!(_numIndexRecords >= 1))
                {
                    throw new ValidationLessThanError(1, _numIndexRecords, m_io, "/types/header_record/seq/2");
                }
                if (!(_numIndexRecords <= (M_Parent.IsSignature ? 32 : 65535)))
                {
                    throw new ValidationGreaterThanError((M_Parent.IsSignature ? 32 : 65535), _numIndexRecords, m_io, "/types/header_record/seq/2");
                }
                _lenStorageSection = m_io.ReadU4be();
                if (!(_lenStorageSection <= (M_Parent.IsSignature ? (64 * 1024) * 1024 : 268435455)))
                {
                    throw new ValidationGreaterThanError((M_Parent.IsSignature ? (64 * 1024) * 1024 : 268435455), _lenStorageSection, m_io, "/types/header_record/seq/3");
                }
            }
            private byte[] _magic;
            private byte[] _reserved;
            private uint _numIndexRecords;
            private uint _lenStorageSection;
            private Rpm m_root;
            private Rpm.Header m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] Reserved { get { return _reserved; } }
            public uint NumIndexRecords { get { return _numIndexRecords; } }

            /// <summary>
            /// Size of the storage area for the data
            /// pointed to by the Index Records.
            /// </summary>
            public uint LenStorageSection { get { return _lenStorageSection; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.Header M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Like `signature_tags_step`, but looks for `header_tags::payload_size`,
        /// which is where v6 packages store the payload size.
        /// </summary>
        public partial class HeaderTagsStep : KaitaiStruct
        {
            public HeaderTagsStep(int p_idx, int p_prevPayloadSizeTagIdx, KaitaiStream p__io, Rpm p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _prevPayloadSizeTagIdx = p_prevPayloadSizeTagIdx;
                f_payloadSizeTagIdx = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_payloadSizeTagIdx;
            private int _payloadSizeTagIdx;
            public int PayloadSizeTagIdx
            {
                get
                {
                    if (f_payloadSizeTagIdx)
                        return _payloadSizeTagIdx;
                    f_payloadSizeTagIdx = true;
                    _payloadSizeTagIdx = (int) ((PrevPayloadSizeTagIdx != -1 ? PrevPayloadSizeTagIdx : ( ((M_Parent.Header.IndexRecords[Idx].HeaderTag == Rpm.HeaderTags.PayloadSize) && (M_Parent.Header.IndexRecords[Idx].RecordType == Rpm.RecordTypes.Uint64) && (M_Parent.Header.IndexRecords[Idx].NumValues >= 1))  ? Idx : -1)));
                    return _payloadSizeTagIdx;
                }
            }
            private int _idx;
            private int _prevPayloadSizeTagIdx;
            private Rpm m_root;
            private Rpm m_parent;
            public int Idx { get { return _idx; } }
            public int PrevPayloadSizeTagIdx { get { return _prevPayloadSizeTagIdx; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// In 2021, Panu Matilainen (an RPM developer) [described this
        /// structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
        /// as follows:
        /// 
        /// &gt; The lead as a structure is 25 years obsolete, the data there is
        /// &gt; meaningless. Seriously. Except to check for the magic to detect that
        /// &gt; it's an rpm file in the first place, just ignore everything in it.
        /// &gt; Literally everything.
        /// 
        /// RPM 4.19 and older rejected packages that didn't meet the `valid`
        /// constraints specified here, while RPM 4.20 and later only check the
        /// `magic` - see
        /// &lt;https://github.com/rpm-software-management/rpm/commit/b3449a0774487a091bbe59e821b4004b06d4fa66&gt;.
        /// Nevertheless, RPM still writes values that pass these checks for backwards
        /// compatibility, so any `.rpm` file should pass.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_lead.md">Source</a>
        /// </remarks>
        public partial class Lead : KaitaiStruct
        {
            public static Lead FromFile(string fileName)
            {
                return new Lead(new KaitaiStream(fileName));
            }

            public Lead(KaitaiStream p__io, Rpm p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 237, 171, 238, 219 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 237, 171, 238, 219 }, _magic, m_io, "/types/lead/seq/0");
                }
                _version = new RpmVersion(m_io, this, m_root);
                _type = ((Rpm.RpmTypes) m_io.ReadU2be());
                _architecture = ((Rpm.Architectures) m_io.ReadU2be());
                _packageName = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(66), 0, false));
                _os = ((Rpm.OperatingSystems) m_io.ReadU2be());
                _signatureType = m_io.ReadU2be();
                if (!(_signatureType == 5))
                {
                    throw new ValidationNotEqualError(5, _signatureType, m_io, "/types/lead/seq/6");
                }
                _reserved = m_io.ReadBytes(16);
            }
            private byte[] _magic;
            private RpmVersion _version;
            private RpmTypes _type;
            private Architectures _architecture;
            private string _packageName;
            private OperatingSystems _os;
            private ushort _signatureType;
            private byte[] _reserved;
            private Rpm m_root;
            private Rpm m_parent;
            public byte[] Magic { get { return _magic; } }
            public RpmVersion Version { get { return _version; } }
            public RpmTypes Type { get { return _type; } }
            public Architectures Architecture { get { return _architecture; } }
            public string PackageName { get { return _packageName; } }
            public OperatingSystems Os { get { return _os; } }

            /// <remarks>
            /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/lib/rpmlead.cc#L20-L21">Source</a>
            /// </remarks>
            public ushort SignatureType { get { return _signatureType; } }
            public byte[] Reserved { get { return _reserved; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeBin : KaitaiStruct
        {
            public RecordTypeBin(uint p_lenValue, KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _lenValue = p_lenValue;
                _read();
            }
            private void _read()
            {
                _values = new List<byte[]>();
                for (var i = 0; i < 1; i++)
                {
                    _values.Add(m_io.ReadBytes(LenValue));
                }
            }
            private List<byte[]> _values;
            private uint _lenValue;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<byte[]> Values { get { return _values; } }
            public uint LenValue { get { return _lenValue; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeString : KaitaiStruct
        {
            public static RecordTypeString FromFile(string fileName)
            {
                return new RecordTypeString(new KaitaiStream(fileName));
            }

            public RecordTypeString(KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _values = new List<string>();
                for (var i = 0; i < 1; i++)
                {
                    _values.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                }
            }
            private List<string> _values;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<string> Values { get { return _values; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeStringArray : KaitaiStruct
        {
            public RecordTypeStringArray(uint p_numValues, KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _numValues = p_numValues;
                _read();
            }
            private void _read()
            {
                _values = new List<string>();
                for (var i = 0; i < NumValues; i++)
                {
                    _values.Add(System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                }
            }
            private List<string> _values;
            private uint _numValues;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<string> Values { get { return _values; } }
            public uint NumValues { get { return _numValues; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeUint16 : KaitaiStruct
        {
            public RecordTypeUint16(uint p_numValues, KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _numValues = p_numValues;
                _read();
            }
            private void _read()
            {
                _values = new List<ushort>();
                for (var i = 0; i < NumValues; i++)
                {
                    _values.Add(m_io.ReadU2be());
                }
            }
            private List<ushort> _values;
            private uint _numValues;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<ushort> Values { get { return _values; } }
            public uint NumValues { get { return _numValues; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeUint32 : KaitaiStruct
        {
            public RecordTypeUint32(uint p_numValues, KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _numValues = p_numValues;
                _read();
            }
            private void _read()
            {
                _values = new List<uint>();
                for (var i = 0; i < NumValues; i++)
                {
                    _values.Add(m_io.ReadU4be());
                }
            }
            private List<uint> _values;
            private uint _numValues;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<uint> Values { get { return _values; } }
            public uint NumValues { get { return _numValues; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeUint64 : KaitaiStruct
        {
            public RecordTypeUint64(uint p_numValues, KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _numValues = p_numValues;
                _read();
            }
            private void _read()
            {
                _values = new List<ulong>();
                for (var i = 0; i < NumValues; i++)
                {
                    _values.Add(m_io.ReadU8be());
                }
            }
            private List<ulong> _values;
            private uint _numValues;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<ulong> Values { get { return _values; } }
            public uint NumValues { get { return _numValues; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RecordTypeUint8 : KaitaiStruct
        {
            public RecordTypeUint8(uint p_numValues, KaitaiStream p__io, Rpm.HeaderIndexRecord p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _numValues = p_numValues;
                _read();
            }
            private void _read()
            {
                _values = new List<byte>();
                for (var i = 0; i < NumValues; i++)
                {
                    _values.Add(m_io.ReadU1());
                }
            }
            private List<byte> _values;
            private uint _numValues;
            private Rpm m_root;
            private Rpm.HeaderIndexRecord m_parent;
            public List<byte> Values { get { return _values; } }
            public uint NumValues { get { return _numValues; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.HeaderIndexRecord M_Parent { get { return m_parent; } }
        }
        public partial class RpmVersion : KaitaiStruct
        {
            public static RpmVersion FromFile(string fileName)
            {
                return new RpmVersion(new KaitaiStream(fileName));
            }

            public RpmVersion(KaitaiStream p__io, Rpm.Lead p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _major = m_io.ReadU1();
                if (!(_major >= 3))
                {
                    throw new ValidationLessThanError(3, _major, m_io, "/types/rpm_version/seq/0");
                }
                if (!(_major <= 4))
                {
                    throw new ValidationGreaterThanError(4, _major, m_io, "/types/rpm_version/seq/0");
                }
                _minor = m_io.ReadU1();
            }
            private byte _major;
            private byte _minor;
            private Rpm m_root;
            private Rpm.Lead m_parent;

            /// <summary>
            /// 3 in v3 and v4 packages, 4 in v6 packages.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/lib/rpmlead.cc#L51-L52">Source</a>
            /// </remarks>
            public byte Major { get { return _major; } }
            public byte Minor { get { return _minor; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm.Lead M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Finds the first `signature_tags::size` and `signature_tags::long_size`
        /// index record. Since Kaitai Struct doesn't have a built-in way to search an
        /// array directly, each step receives the indexes found so far via
        /// parameters.
        /// </summary>
        public partial class SignatureTagsStep : KaitaiStruct
        {
            public SignatureTagsStep(int p_idx, int p_prevSizeTagIdx, int p_prevLongSizeTagIdx, KaitaiStream p__io, Rpm p__parent = null, Rpm p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _prevSizeTagIdx = p_prevSizeTagIdx;
                _prevLongSizeTagIdx = p_prevLongSizeTagIdx;
                f_longSizeTagIdx = false;
                f_sizeTagIdx = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_longSizeTagIdx;
            private int _longSizeTagIdx;
            public int LongSizeTagIdx
            {
                get
                {
                    if (f_longSizeTagIdx)
                        return _longSizeTagIdx;
                    f_longSizeTagIdx = true;
                    _longSizeTagIdx = (int) ((PrevLongSizeTagIdx != -1 ? PrevLongSizeTagIdx : ( ((M_Parent.Signature.IndexRecords[Idx].SignatureTag == Rpm.SignatureTags.LongSize) && (M_Parent.Signature.IndexRecords[Idx].RecordType == Rpm.RecordTypes.Uint64) && (M_Parent.Signature.IndexRecords[Idx].NumValues >= 1))  ? Idx : -1)));
                    return _longSizeTagIdx;
                }
            }
            private bool f_sizeTagIdx;
            private int _sizeTagIdx;
            public int SizeTagIdx
            {
                get
                {
                    if (f_sizeTagIdx)
                        return _sizeTagIdx;
                    f_sizeTagIdx = true;
                    _sizeTagIdx = (int) ((PrevSizeTagIdx != -1 ? PrevSizeTagIdx : ( ((M_Parent.Signature.IndexRecords[Idx].SignatureTag == Rpm.SignatureTags.Size) && (M_Parent.Signature.IndexRecords[Idx].RecordType == Rpm.RecordTypes.Uint32) && (M_Parent.Signature.IndexRecords[Idx].NumValues >= 1))  ? Idx : -1)));
                    return _sizeTagIdx;
                }
            }
            private int _idx;
            private int _prevSizeTagIdx;
            private int _prevLongSizeTagIdx;
            private Rpm m_root;
            private Rpm m_parent;
            public int Idx { get { return _idx; } }
            public int PrevSizeTagIdx { get { return _prevSizeTagIdx; } }
            public int PrevLongSizeTagIdx { get { return _prevLongSizeTagIdx; } }
            public Rpm M_Root { get { return m_root; } }
            public Rpm M_Parent { get { return m_parent; } }
        }
        private bool f_hasHeaderPayloadSizeTag;
        private bool _hasHeaderPayloadSizeTag;
        public bool HasHeaderPayloadSizeTag
        {
            get
            {
                if (f_hasHeaderPayloadSizeTag)
                    return _hasHeaderPayloadSizeTag;
                f_hasHeaderPayloadSizeTag = true;
                _hasHeaderPayloadSizeTag = (bool) (HeaderTagsSteps[HeaderTagsSteps.Count - 1].PayloadSizeTagIdx != -1);
                return _hasHeaderPayloadSizeTag;
            }
        }
        private bool f_hasPayload;
        private bool _hasPayload;
        public bool HasPayload
        {
            get
            {
                if (f_hasPayload)
                    return _hasPayload;
                f_hasPayload = true;
                _hasPayload = (bool) ( ((HasHeaderPayloadSizeTag) || (HasSignatureLongSizeTag) || (HasSignatureSizeTag)) );
                return _hasPayload;
            }
        }
        private bool f_hasSignatureLongSizeTag;
        private bool _hasSignatureLongSizeTag;
        public bool HasSignatureLongSizeTag
        {
            get
            {
                if (f_hasSignatureLongSizeTag)
                    return _hasSignatureLongSizeTag;
                f_hasSignatureLongSizeTag = true;
                _hasSignatureLongSizeTag = (bool) (SignatureTagsSteps[SignatureTagsSteps.Count - 1].LongSizeTagIdx != -1);
                return _hasSignatureLongSizeTag;
            }
        }
        private bool f_hasSignatureSizeTag;
        private bool _hasSignatureSizeTag;
        public bool HasSignatureSizeTag
        {
            get
            {
                if (f_hasSignatureSizeTag)
                    return _hasSignatureSizeTag;
                f_hasSignatureSizeTag = true;
                _hasSignatureSizeTag = (bool) (SignatureTagsSteps[SignatureTagsSteps.Count - 1].SizeTagIdx != -1);
                return _hasSignatureSizeTag;
            }
        }
        private bool f_headerPayloadSizeTag;
        private HeaderIndexRecord _headerPayloadSizeTag;
        public HeaderIndexRecord HeaderPayloadSizeTag
        {
            get
            {
                if (f_headerPayloadSizeTag)
                    return _headerPayloadSizeTag;
                f_headerPayloadSizeTag = true;
                if (HasHeaderPayloadSizeTag) {
                    _headerPayloadSizeTag = (HeaderIndexRecord) (Header.IndexRecords[HeaderTagsSteps[HeaderTagsSteps.Count - 1].PayloadSizeTagIdx]);
                }
                return _headerPayloadSizeTag;
            }
        }
        private bool f_lenHeader;
        private int _lenHeader;
        public int LenHeader
        {
            get
            {
                if (f_lenHeader)
                    return _lenHeader;
                f_lenHeader = true;
                _lenHeader = (int) (OfsPayload - OfsHeader);
                return _lenHeader;
            }
        }
        private bool f_lenPayload;
        private int? _lenPayload;

        /// <summary>
        /// Size of the (compressed) payload in bytes. v6 packages store it in
        /// `header_tags::payload_size`, v4/v3 packages in `signature_tags::size`
        /// (which also includes the size of the header).
        /// 
        /// If the header and payload together or the uncompressed payload reach
        /// 4 GiB, v4 packages use `signature_tags::long_size` instead - see
        /// &lt;https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/lib/signature.cc#L182-L212&gt;.
        /// 
        /// RPM never writes both (so this is just a hypothetical scenario), but if
        /// both are present, `signature_tags::long_size` takes precedence over
        /// `signature_tags::size`, just like in RPM's `printSize()` function:
        /// &lt;https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/lib/signature.cc#L36-L43&gt;
        /// </summary>
        public int? LenPayload
        {
            get
            {
                if (f_lenPayload)
                    return _lenPayload;
                f_lenPayload = true;
                if (HasPayload) {
                    _lenPayload = (int) ((HasHeaderPayloadSizeTag ? ((Rpm.RecordTypeUint64) (HeaderPayloadSizeTag.Body)).Values[0] : (HasSignatureLongSizeTag ? ((Rpm.RecordTypeUint64) (SignatureLongSizeTag.Body)).Values[0] - LenHeader : ((Rpm.RecordTypeUint32) (SignatureSizeTag.Body)).Values[0] - LenHeader)));
                }
                return _lenPayload;
            }
        }
        private bool f_ofsHeader;
        private int _ofsHeader;
        public int OfsHeader
        {
            get
            {
                if (f_ofsHeader)
                    return _ofsHeader;
                f_ofsHeader = true;
                _ofsHeader = (int) (M_Io.Pos);
                return _ofsHeader;
            }
        }
        private bool f_ofsPayload;
        private int _ofsPayload;
        public int OfsPayload
        {
            get
            {
                if (f_ofsPayload)
                    return _ofsPayload;
                f_ofsPayload = true;
                _ofsPayload = (int) (M_Io.Pos);
                return _ofsPayload;
            }
        }
        private bool f_payload;
        private byte[] _payload;

        /// <summary>
        /// Archive of the package files, compressed using the method specified by
        /// `header_tags::payload_compressor`. If this tag is missing, it's almost
        /// certainly uncompressed (except for some very old v3 packages built by RPM
        /// 3.0.3 or earlier, which didn't use the tag because the payload was always
        /// gzipped; RPM 3.0.5 added support for bzip2 payloads and started writing
        /// the tag). However, RPM reads the payload as gzip by default - see
        /// &lt;https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/lib/rpmte.cc#L643-L645&gt;.
        /// Since zlib's gzip reader passes data that is not in gzip format through
        /// unchanged (see
        /// &lt;https://github.com/madler/zlib/blob/da607da739fa6047df13e66a2af6b8bec7c2a498/zlib.h#L1386-L1389&gt;),
        /// this also works for uncompressed payloads.
        /// 
        /// The archive format is given by `header_tags::payload_format`, which is
        /// `&quot;cpio&quot;` for regular packages. In v4/v3 packages, it's a SVR4 cpio archive
        /// without a checksum (the `070701` variant) - the [v4 format
        /// documentation](https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_v4.md?plain=1#L106-L107)
        /// claims &quot;with a CRC checksum&quot;, but that's not true since RPM 2.4.4
        /// (released in 1997).
        /// 
        /// v6 packages and v4 packages with a file over 4 GiB use a stripped-down
        /// variant of cpio with the magic `07070X`. Its file headers only hold the
        /// index of the file in the file lists of the RPM header, which is the only
        /// place where the file names, sizes and other metadata are stored.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_v6.md#payload">Source</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://github.com/rpm-software-management/rpm/blob/ec9ea8c43808c346da4b6cb454cdc58aef8e506a/docs/manual/format_v4.md#payload">Source</a>
        /// </remarks>
        public byte[] Payload
        {
            get
            {
                if (f_payload)
                    return _payload;
                f_payload = true;
                if (HasPayload) {
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsPayload);
                    _payload = m_io.ReadBytes(LenPayload);
                    m_io.Seek(_pos);
                }
                return _payload;
            }
        }
        private bool f_signatureLongSizeTag;
        private HeaderIndexRecord _signatureLongSizeTag;
        public HeaderIndexRecord SignatureLongSizeTag
        {
            get
            {
                if (f_signatureLongSizeTag)
                    return _signatureLongSizeTag;
                f_signatureLongSizeTag = true;
                if (HasSignatureLongSizeTag) {
                    _signatureLongSizeTag = (HeaderIndexRecord) (Signature.IndexRecords[SignatureTagsSteps[SignatureTagsSteps.Count - 1].LongSizeTagIdx]);
                }
                return _signatureLongSizeTag;
            }
        }
        private bool f_signatureSizeTag;
        private HeaderIndexRecord _signatureSizeTag;
        public HeaderIndexRecord SignatureSizeTag
        {
            get
            {
                if (f_signatureSizeTag)
                    return _signatureSizeTag;
                f_signatureSizeTag = true;
                if (HasSignatureSizeTag) {
                    _signatureSizeTag = (HeaderIndexRecord) (Signature.IndexRecords[SignatureTagsSteps[SignatureTagsSteps.Count - 1].SizeTagIdx]);
                }
                return _signatureSizeTag;
            }
        }
        private Lead _lead;
        private Header _signature;
        private byte[] _signaturePadding;
        private byte[] __unnamed3;
        private Header _header;
        private byte[] __unnamed5;
        private List<SignatureTagsStep> _signatureTagsSteps;
        private List<HeaderTagsStep> _headerTagsSteps;
        private Rpm m_root;
        private KaitaiStruct m_parent;
        public Lead Lead { get { return _lead; } }
        public Header Signature { get { return _signature; } }
        public byte[] SignaturePadding { get { return _signaturePadding; } }
        public byte[] Unnamed_3 { get { return __unnamed3; } }
        public Header Header { get { return _header; } }
        public byte[] Unnamed_5 { get { return __unnamed5; } }
        public List<SignatureTagsStep> SignatureTagsSteps { get { return _signatureTagsSteps; } }
        public List<HeaderTagsStep> HeaderTagsSteps { get { return _headerTagsSteps; } }
        public Rpm M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
