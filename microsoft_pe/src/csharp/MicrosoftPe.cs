// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="http://www.microsoft.com/whdc/system/platform/firmware/PECOFF.mspx">Source</a>
    /// </remarks>
    public partial class MicrosoftPe : KaitaiStruct
    {
        public static MicrosoftPe FromFile(string fileName)
        {
            return new MicrosoftPe(new KaitaiStream(fileName));
        }


        public enum PeFormat
        {
            RomImage = 263,
            Pe32 = 267,
            Pe32Plus = 523,
        }
        public MicrosoftPe(KaitaiStream p__io, KaitaiStruct p__parent = null, MicrosoftPe p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _mz1 = new MzPlaceholder(m_io, this, m_root);
            _mz2 = m_io.ReadBytes((Mz1.HeaderSize - 64));
            _peSignature = m_io.EnsureFixedContents(new byte[] { 80, 69, 0, 0 });
            _coffHdr = new CoffHeader(m_io, this, m_root);
            __raw_optionalHdr = m_io.ReadBytes(CoffHdr.SizeOfOptionalHeader);
            var io___raw_optionalHdr = new KaitaiStream(__raw_optionalHdr);
            _optionalHdr = new OptionalHeader(io___raw_optionalHdr, this, m_root);
            _sections = new List<Section>((int) (CoffHdr.NumberOfSections));
            for (var i = 0; i < CoffHdr.NumberOfSections; i++)
            {
                _sections.Add(new Section(m_io, this, m_root));
            }
        }
        public partial class OptionalHeaderWindows : KaitaiStruct
        {
            public static OptionalHeaderWindows FromFile(string fileName)
            {
                return new OptionalHeaderWindows(new KaitaiStream(fileName));
            }


            public enum SubsystemEnum
            {
                Unknown = 0,
                Native = 1,
                WindowsGui = 2,
                WindowsCui = 3,
                PosixCui = 7,
                WindowsCeGui = 9,
                EfiApplication = 10,
                EfiBootServiceDriver = 11,
                EfiRuntimeDriver = 12,
                EfiRom = 13,
                Xbox = 14,
            }
            public OptionalHeaderWindows(KaitaiStream p__io, MicrosoftPe.OptionalHeader p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32) {
                    _imageBase32 = m_io.ReadU4le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32Plus) {
                    _imageBase64 = m_io.ReadU8le();
                }
                _sectionAlignment = m_io.ReadU4le();
                _fileAlignment = m_io.ReadU4le();
                _majorOperatingSystemVersion = m_io.ReadU2le();
                _minorOperatingSystemVersion = m_io.ReadU2le();
                _majorImageVersion = m_io.ReadU2le();
                _minorImageVersion = m_io.ReadU2le();
                _majorSubsystemVersion = m_io.ReadU2le();
                _minorSubsystemVersion = m_io.ReadU2le();
                _win32VersionValue = m_io.ReadU4le();
                _sizeOfImage = m_io.ReadU4le();
                _sizeOfHeaders = m_io.ReadU4le();
                _checkSum = m_io.ReadU4le();
                _subsystem = ((SubsystemEnum) m_io.ReadU2le());
                _dllCharacteristics = m_io.ReadU2le();
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32) {
                    _sizeOfStackReserve32 = m_io.ReadU4le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32Plus) {
                    _sizeOfStackReserve64 = m_io.ReadU8le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32) {
                    _sizeOfStackCommit32 = m_io.ReadU4le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32Plus) {
                    _sizeOfStackCommit64 = m_io.ReadU8le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32) {
                    _sizeOfHeapReserve32 = m_io.ReadU4le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32Plus) {
                    _sizeOfHeapReserve64 = m_io.ReadU8le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32) {
                    _sizeOfHeapCommit32 = m_io.ReadU4le();
                }
                if (M_Parent.Std.Format == MicrosoftPe.PeFormat.Pe32Plus) {
                    _sizeOfHeapCommit64 = m_io.ReadU8le();
                }
                _loaderFlags = m_io.ReadU4le();
                _numberOfRvaAndSizes = m_io.ReadU4le();
            }
            private uint? _imageBase32;
            private ulong? _imageBase64;
            private uint _sectionAlignment;
            private uint _fileAlignment;
            private ushort _majorOperatingSystemVersion;
            private ushort _minorOperatingSystemVersion;
            private ushort _majorImageVersion;
            private ushort _minorImageVersion;
            private ushort _majorSubsystemVersion;
            private ushort _minorSubsystemVersion;
            private uint _win32VersionValue;
            private uint _sizeOfImage;
            private uint _sizeOfHeaders;
            private uint _checkSum;
            private SubsystemEnum _subsystem;
            private ushort _dllCharacteristics;
            private uint? _sizeOfStackReserve32;
            private ulong? _sizeOfStackReserve64;
            private uint? _sizeOfStackCommit32;
            private ulong? _sizeOfStackCommit64;
            private uint? _sizeOfHeapReserve32;
            private ulong? _sizeOfHeapReserve64;
            private uint? _sizeOfHeapCommit32;
            private ulong? _sizeOfHeapCommit64;
            private uint _loaderFlags;
            private uint _numberOfRvaAndSizes;
            private MicrosoftPe m_root;
            private MicrosoftPe.OptionalHeader m_parent;
            public uint? ImageBase32 { get { return _imageBase32; } }
            public ulong? ImageBase64 { get { return _imageBase64; } }
            public uint SectionAlignment { get { return _sectionAlignment; } }
            public uint FileAlignment { get { return _fileAlignment; } }
            public ushort MajorOperatingSystemVersion { get { return _majorOperatingSystemVersion; } }
            public ushort MinorOperatingSystemVersion { get { return _minorOperatingSystemVersion; } }
            public ushort MajorImageVersion { get { return _majorImageVersion; } }
            public ushort MinorImageVersion { get { return _minorImageVersion; } }
            public ushort MajorSubsystemVersion { get { return _majorSubsystemVersion; } }
            public ushort MinorSubsystemVersion { get { return _minorSubsystemVersion; } }
            public uint Win32VersionValue { get { return _win32VersionValue; } }
            public uint SizeOfImage { get { return _sizeOfImage; } }
            public uint SizeOfHeaders { get { return _sizeOfHeaders; } }
            public uint CheckSum { get { return _checkSum; } }
            public SubsystemEnum Subsystem { get { return _subsystem; } }
            public ushort DllCharacteristics { get { return _dllCharacteristics; } }
            public uint? SizeOfStackReserve32 { get { return _sizeOfStackReserve32; } }
            public ulong? SizeOfStackReserve64 { get { return _sizeOfStackReserve64; } }
            public uint? SizeOfStackCommit32 { get { return _sizeOfStackCommit32; } }
            public ulong? SizeOfStackCommit64 { get { return _sizeOfStackCommit64; } }
            public uint? SizeOfHeapReserve32 { get { return _sizeOfHeapReserve32; } }
            public ulong? SizeOfHeapReserve64 { get { return _sizeOfHeapReserve64; } }
            public uint? SizeOfHeapCommit32 { get { return _sizeOfHeapCommit32; } }
            public ulong? SizeOfHeapCommit64 { get { return _sizeOfHeapCommit64; } }
            public uint LoaderFlags { get { return _loaderFlags; } }
            public uint NumberOfRvaAndSizes { get { return _numberOfRvaAndSizes; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe.OptionalHeader M_Parent { get { return m_parent; } }
        }
        public partial class OptionalHeaderDataDirs : KaitaiStruct
        {
            public static OptionalHeaderDataDirs FromFile(string fileName)
            {
                return new OptionalHeaderDataDirs(new KaitaiStream(fileName));
            }

            public OptionalHeaderDataDirs(KaitaiStream p__io, MicrosoftPe.OptionalHeader p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _exportTable = new DataDir(m_io, this, m_root);
                _importTable = new DataDir(m_io, this, m_root);
                _resourceTable = new DataDir(m_io, this, m_root);
                _exceptionTable = new DataDir(m_io, this, m_root);
                _certificateTable = new DataDir(m_io, this, m_root);
                _baseRelocationTable = new DataDir(m_io, this, m_root);
                _debug = new DataDir(m_io, this, m_root);
                _architecture = new DataDir(m_io, this, m_root);
                _globalPtr = new DataDir(m_io, this, m_root);
                _tlsTable = new DataDir(m_io, this, m_root);
                _loadConfigTable = new DataDir(m_io, this, m_root);
                _boundImport = new DataDir(m_io, this, m_root);
                _iat = new DataDir(m_io, this, m_root);
                _delayImportDescriptor = new DataDir(m_io, this, m_root);
                _clrRuntimeHeader = new DataDir(m_io, this, m_root);
            }
            private DataDir _exportTable;
            private DataDir _importTable;
            private DataDir _resourceTable;
            private DataDir _exceptionTable;
            private DataDir _certificateTable;
            private DataDir _baseRelocationTable;
            private DataDir _debug;
            private DataDir _architecture;
            private DataDir _globalPtr;
            private DataDir _tlsTable;
            private DataDir _loadConfigTable;
            private DataDir _boundImport;
            private DataDir _iat;
            private DataDir _delayImportDescriptor;
            private DataDir _clrRuntimeHeader;
            private MicrosoftPe m_root;
            private MicrosoftPe.OptionalHeader m_parent;
            public DataDir ExportTable { get { return _exportTable; } }
            public DataDir ImportTable { get { return _importTable; } }
            public DataDir ResourceTable { get { return _resourceTable; } }
            public DataDir ExceptionTable { get { return _exceptionTable; } }
            public DataDir CertificateTable { get { return _certificateTable; } }
            public DataDir BaseRelocationTable { get { return _baseRelocationTable; } }
            public DataDir Debug { get { return _debug; } }
            public DataDir Architecture { get { return _architecture; } }
            public DataDir GlobalPtr { get { return _globalPtr; } }
            public DataDir TlsTable { get { return _tlsTable; } }
            public DataDir LoadConfigTable { get { return _loadConfigTable; } }
            public DataDir BoundImport { get { return _boundImport; } }
            public DataDir Iat { get { return _iat; } }
            public DataDir DelayImportDescriptor { get { return _delayImportDescriptor; } }
            public DataDir ClrRuntimeHeader { get { return _clrRuntimeHeader; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe.OptionalHeader M_Parent { get { return m_parent; } }
        }
        public partial class DataDir : KaitaiStruct
        {
            public static DataDir FromFile(string fileName)
            {
                return new DataDir(new KaitaiStream(fileName));
            }

            public DataDir(KaitaiStream p__io, MicrosoftPe.OptionalHeaderDataDirs p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _virtualAddress = m_io.ReadU4le();
                _size = m_io.ReadU4le();
            }
            private uint _virtualAddress;
            private uint _size;
            private MicrosoftPe m_root;
            private MicrosoftPe.OptionalHeaderDataDirs m_parent;
            public uint VirtualAddress { get { return _virtualAddress; } }
            public uint Size { get { return _size; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe.OptionalHeaderDataDirs M_Parent { get { return m_parent; } }
        }
        public partial class CoffSymbol : KaitaiStruct
        {
            public static CoffSymbol FromFile(string fileName)
            {
                return new CoffSymbol(new KaitaiStream(fileName));
            }

            public CoffSymbol(KaitaiStream p__io, MicrosoftPe.CoffHeader p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_section = false;
                f_data = false;
                _read();
            }
            private void _read()
            {
                __raw_nameAnnoying = m_io.ReadBytes(8);
                var io___raw_nameAnnoying = new KaitaiStream(__raw_nameAnnoying);
                _nameAnnoying = new Annoyingstring(io___raw_nameAnnoying, this, m_root);
                _value = m_io.ReadU4le();
                _sectionNumber = m_io.ReadU2le();
                _type = m_io.ReadU2le();
                _storageClass = m_io.ReadU1();
                _numberOfAuxSymbols = m_io.ReadU1();
            }
            private bool f_section;
            private Section _section;
            public Section Section
            {
                get
                {
                    if (f_section)
                        return _section;
                    _section = (Section) (M_Root.Sections[(SectionNumber - 1)]);
                    f_section = true;
                    return _section;
                }
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    long _pos = m_io.Pos;
                    m_io.Seek((Section.PointerToRawData + Value));
                    _data = m_io.ReadBytes(1);
                    m_io.Seek(_pos);
                    f_data = true;
                    return _data;
                }
            }
            private Annoyingstring _nameAnnoying;
            private uint _value;
            private ushort _sectionNumber;
            private ushort _type;
            private byte _storageClass;
            private byte _numberOfAuxSymbols;
            private MicrosoftPe m_root;
            private MicrosoftPe.CoffHeader m_parent;
            private byte[] __raw_nameAnnoying;
            public Annoyingstring NameAnnoying { get { return _nameAnnoying; } }
            public uint Value { get { return _value; } }
            public ushort SectionNumber { get { return _sectionNumber; } }
            public ushort Type { get { return _type; } }
            public byte StorageClass { get { return _storageClass; } }
            public byte NumberOfAuxSymbols { get { return _numberOfAuxSymbols; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe.CoffHeader M_Parent { get { return m_parent; } }
            public byte[] M_RawNameAnnoying { get { return __raw_nameAnnoying; } }
        }
        public partial class OptionalHeader : KaitaiStruct
        {
            public static OptionalHeader FromFile(string fileName)
            {
                return new OptionalHeader(new KaitaiStream(fileName));
            }

            public OptionalHeader(KaitaiStream p__io, MicrosoftPe p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _std = new OptionalHeaderStd(m_io, this, m_root);
                _windows = new OptionalHeaderWindows(m_io, this, m_root);
                _dataDirs = new OptionalHeaderDataDirs(m_io, this, m_root);
            }
            private OptionalHeaderStd _std;
            private OptionalHeaderWindows _windows;
            private OptionalHeaderDataDirs _dataDirs;
            private MicrosoftPe m_root;
            private MicrosoftPe m_parent;
            public OptionalHeaderStd Std { get { return _std; } }
            public OptionalHeaderWindows Windows { get { return _windows; } }
            public OptionalHeaderDataDirs DataDirs { get { return _dataDirs; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe M_Parent { get { return m_parent; } }
        }
        public partial class Section : KaitaiStruct
        {
            public static Section FromFile(string fileName)
            {
                return new Section(new KaitaiStream(fileName));
            }

            public Section(KaitaiStream p__io, MicrosoftPe p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesStripRight(m_io.ReadBytes(8), 0));
                _virtualSize = m_io.ReadU4le();
                _virtualAddress = m_io.ReadU4le();
                _sizeOfRawData = m_io.ReadU4le();
                _pointerToRawData = m_io.ReadU4le();
                _pointerToRelocations = m_io.ReadU4le();
                _pointerToLinenumbers = m_io.ReadU4le();
                _numberOfRelocations = m_io.ReadU2le();
                _numberOfLinenumbers = m_io.ReadU2le();
                _characteristics = m_io.ReadU4le();
            }
            private bool f_body;
            private byte[] _body;
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek(PointerToRawData);
                    _body = m_io.ReadBytes(SizeOfRawData);
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private string _name;
            private uint _virtualSize;
            private uint _virtualAddress;
            private uint _sizeOfRawData;
            private uint _pointerToRawData;
            private uint _pointerToRelocations;
            private uint _pointerToLinenumbers;
            private ushort _numberOfRelocations;
            private ushort _numberOfLinenumbers;
            private uint _characteristics;
            private MicrosoftPe m_root;
            private MicrosoftPe m_parent;
            public string Name { get { return _name; } }
            public uint VirtualSize { get { return _virtualSize; } }
            public uint VirtualAddress { get { return _virtualAddress; } }
            public uint SizeOfRawData { get { return _sizeOfRawData; } }
            public uint PointerToRawData { get { return _pointerToRawData; } }
            public uint PointerToRelocations { get { return _pointerToRelocations; } }
            public uint PointerToLinenumbers { get { return _pointerToLinenumbers; } }
            public ushort NumberOfRelocations { get { return _numberOfRelocations; } }
            public ushort NumberOfLinenumbers { get { return _numberOfLinenumbers; } }
            public uint Characteristics { get { return _characteristics; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe M_Parent { get { return m_parent; } }
        }
        public partial class MzPlaceholder : KaitaiStruct
        {
            public static MzPlaceholder FromFile(string fileName)
            {
                return new MzPlaceholder(new KaitaiStream(fileName));
            }

            public MzPlaceholder(KaitaiStream p__io, MicrosoftPe p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 77, 90 });
                _data1 = m_io.ReadBytes(58);
                _headerSize = m_io.ReadU4le();
            }
            private byte[] _magic;
            private byte[] _data1;
            private uint _headerSize;
            private MicrosoftPe m_root;
            private MicrosoftPe m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] Data1 { get { return _data1; } }
            public uint HeaderSize { get { return _headerSize; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe M_Parent { get { return m_parent; } }
        }
        public partial class OptionalHeaderStd : KaitaiStruct
        {
            public static OptionalHeaderStd FromFile(string fileName)
            {
                return new OptionalHeaderStd(new KaitaiStream(fileName));
            }

            public OptionalHeaderStd(KaitaiStream p__io, MicrosoftPe.OptionalHeader p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _format = ((MicrosoftPe.PeFormat) m_io.ReadU2le());
                _majorLinkerVersion = m_io.ReadU1();
                _minorLinkerVersion = m_io.ReadU1();
                _sizeOfCode = m_io.ReadU4le();
                _sizeOfInitializedData = m_io.ReadU4le();
                _sizeOfUninitializedData = m_io.ReadU4le();
                _addressOfEntryPoint = m_io.ReadU4le();
                _baseOfCode = m_io.ReadU4le();
                if (Format == MicrosoftPe.PeFormat.Pe32) {
                    _baseOfData = m_io.ReadU4le();
                }
            }
            private PeFormat _format;
            private byte _majorLinkerVersion;
            private byte _minorLinkerVersion;
            private uint _sizeOfCode;
            private uint _sizeOfInitializedData;
            private uint _sizeOfUninitializedData;
            private uint _addressOfEntryPoint;
            private uint _baseOfCode;
            private uint? _baseOfData;
            private MicrosoftPe m_root;
            private MicrosoftPe.OptionalHeader m_parent;
            public PeFormat Format { get { return _format; } }
            public byte MajorLinkerVersion { get { return _majorLinkerVersion; } }
            public byte MinorLinkerVersion { get { return _minorLinkerVersion; } }
            public uint SizeOfCode { get { return _sizeOfCode; } }
            public uint SizeOfInitializedData { get { return _sizeOfInitializedData; } }
            public uint SizeOfUninitializedData { get { return _sizeOfUninitializedData; } }
            public uint AddressOfEntryPoint { get { return _addressOfEntryPoint; } }
            public uint BaseOfCode { get { return _baseOfCode; } }
            public uint? BaseOfData { get { return _baseOfData; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe.OptionalHeader M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: 3.3. COFF File Header (Object and Image)
        /// </remarks>
        public partial class CoffHeader : KaitaiStruct
        {
            public static CoffHeader FromFile(string fileName)
            {
                return new CoffHeader(new KaitaiStream(fileName));
            }


            public enum MachineType
            {
                Unknown = 0,
                I386 = 332,
                R4000 = 358,
                Wcemipsv2 = 361,
                Sh3 = 418,
                Sh3dsp = 419,
                Sh4 = 422,
                Sh5 = 424,
                Arm = 448,
                Thumb = 450,
                Armnt = 452,
                Am33 = 467,
                Powerpc = 496,
                Powerpcfp = 497,
                Ia64 = 512,
                Mips16 = 614,
                Mipsfpu = 870,
                Mipsfpu16 = 1126,
                Ebc = 3772,
                Riscv32 = 20530,
                Riscv64 = 20580,
                Riscv128 = 20776,
                Amd64 = 34404,
                M32r = 36929,
            }
            public CoffHeader(KaitaiStream p__io, MicrosoftPe p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_symbolTableSize = false;
                f_symbolNameTableOffset = false;
                f_symbolNameTableSize = false;
                f_symbolTable = false;
                _read();
            }
            private void _read()
            {
                _machine = ((MachineType) m_io.ReadU2le());
                _numberOfSections = m_io.ReadU2le();
                _timeDateStamp = m_io.ReadU4le();
                _pointerToSymbolTable = m_io.ReadU4le();
                _numberOfSymbols = m_io.ReadU4le();
                _sizeOfOptionalHeader = m_io.ReadU2le();
                _characteristics = m_io.ReadU2le();
            }
            private bool f_symbolTableSize;
            private int _symbolTableSize;
            public int SymbolTableSize
            {
                get
                {
                    if (f_symbolTableSize)
                        return _symbolTableSize;
                    _symbolTableSize = (int) ((NumberOfSymbols * 18));
                    f_symbolTableSize = true;
                    return _symbolTableSize;
                }
            }
            private bool f_symbolNameTableOffset;
            private int _symbolNameTableOffset;
            public int SymbolNameTableOffset
            {
                get
                {
                    if (f_symbolNameTableOffset)
                        return _symbolNameTableOffset;
                    _symbolNameTableOffset = (int) ((PointerToSymbolTable + SymbolTableSize));
                    f_symbolNameTableOffset = true;
                    return _symbolNameTableOffset;
                }
            }
            private bool f_symbolNameTableSize;
            private uint _symbolNameTableSize;
            public uint SymbolNameTableSize
            {
                get
                {
                    if (f_symbolNameTableSize)
                        return _symbolNameTableSize;
                    long _pos = m_io.Pos;
                    m_io.Seek(SymbolNameTableOffset);
                    _symbolNameTableSize = m_io.ReadU4le();
                    m_io.Seek(_pos);
                    f_symbolNameTableSize = true;
                    return _symbolNameTableSize;
                }
            }
            private bool f_symbolTable;
            private List<CoffSymbol> _symbolTable;
            public List<CoffSymbol> SymbolTable
            {
                get
                {
                    if (f_symbolTable)
                        return _symbolTable;
                    long _pos = m_io.Pos;
                    m_io.Seek(PointerToSymbolTable);
                    _symbolTable = new List<CoffSymbol>((int) (NumberOfSymbols));
                    for (var i = 0; i < NumberOfSymbols; i++)
                    {
                        _symbolTable.Add(new CoffSymbol(m_io, this, m_root));
                    }
                    m_io.Seek(_pos);
                    f_symbolTable = true;
                    return _symbolTable;
                }
            }
            private MachineType _machine;
            private ushort _numberOfSections;
            private uint _timeDateStamp;
            private uint _pointerToSymbolTable;
            private uint _numberOfSymbols;
            private ushort _sizeOfOptionalHeader;
            private ushort _characteristics;
            private MicrosoftPe m_root;
            private MicrosoftPe m_parent;
            public MachineType Machine { get { return _machine; } }
            public ushort NumberOfSections { get { return _numberOfSections; } }
            public uint TimeDateStamp { get { return _timeDateStamp; } }
            public uint PointerToSymbolTable { get { return _pointerToSymbolTable; } }
            public uint NumberOfSymbols { get { return _numberOfSymbols; } }
            public ushort SizeOfOptionalHeader { get { return _sizeOfOptionalHeader; } }
            public ushort Characteristics { get { return _characteristics; } }
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe M_Parent { get { return m_parent; } }
        }
        public partial class Annoyingstring : KaitaiStruct
        {
            public static Annoyingstring FromFile(string fileName)
            {
                return new Annoyingstring(new KaitaiStream(fileName));
            }

            public Annoyingstring(KaitaiStream p__io, MicrosoftPe.CoffSymbol p__parent = null, MicrosoftPe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_nameFromOffset = false;
                f_nameOffset = false;
                f_name = false;
                f_nameZeroes = false;
                f_nameFromShort = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_nameFromOffset;
            private string _nameFromOffset;
            public string NameFromOffset
            {
                get
                {
                    if (f_nameFromOffset)
                        return _nameFromOffset;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek((NameZeroes == 0 ? (M_Parent.M_Parent.SymbolNameTableOffset + NameOffset) : 0));
                    _nameFromOffset = System.Text.Encoding.GetEncoding("ascii").GetString(io.ReadBytesTerm(0, false, true, false));
                    io.Seek(_pos);
                    f_nameFromOffset = true;
                    return _nameFromOffset;
                }
            }
            private bool f_nameOffset;
            private uint _nameOffset;
            public uint NameOffset
            {
                get
                {
                    if (f_nameOffset)
                        return _nameOffset;
                    long _pos = m_io.Pos;
                    m_io.Seek(4);
                    _nameOffset = m_io.ReadU4le();
                    m_io.Seek(_pos);
                    f_nameOffset = true;
                    return _nameOffset;
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
                    _name = (string) ((NameZeroes == 0 ? NameFromOffset : NameFromShort));
                    f_name = true;
                    return _name;
                }
            }
            private bool f_nameZeroes;
            private uint _nameZeroes;
            public uint NameZeroes
            {
                get
                {
                    if (f_nameZeroes)
                        return _nameZeroes;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _nameZeroes = m_io.ReadU4le();
                    m_io.Seek(_pos);
                    f_nameZeroes = true;
                    return _nameZeroes;
                }
            }
            private bool f_nameFromShort;
            private string _nameFromShort;
            public string NameFromShort
            {
                get
                {
                    if (f_nameFromShort)
                        return _nameFromShort;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _nameFromShort = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(0, false, true, false));
                    m_io.Seek(_pos);
                    f_nameFromShort = true;
                    return _nameFromShort;
                }
            }
            private MicrosoftPe m_root;
            private MicrosoftPe.CoffSymbol m_parent;
            public MicrosoftPe M_Root { get { return m_root; } }
            public MicrosoftPe.CoffSymbol M_Parent { get { return m_parent; } }
        }
        private MzPlaceholder _mz1;
        private byte[] _mz2;
        private byte[] _peSignature;
        private CoffHeader _coffHdr;
        private OptionalHeader _optionalHdr;
        private List<Section> _sections;
        private MicrosoftPe m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_optionalHdr;
        public MzPlaceholder Mz1 { get { return _mz1; } }
        public byte[] Mz2 { get { return _mz2; } }
        public byte[] PeSignature { get { return _peSignature; } }
        public CoffHeader CoffHdr { get { return _coffHdr; } }
        public OptionalHeader OptionalHdr { get { return _optionalHdr; } }
        public List<Section> Sections { get { return _sections; } }
        public MicrosoftPe M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawOptionalHdr { get { return __raw_optionalHdr; } }
    }
}