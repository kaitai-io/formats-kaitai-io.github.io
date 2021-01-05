// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This type of executables could be found inside the UEFI firmware. The UEFI
    /// firmware is stored in SPI flash memory, which is a chip soldered on a
    /// system’s motherboard. UEFI firmware is very modular: it usually contains
    /// dozens, if not hundreds, of executables. To store all these separates files,
    /// the firmware is laid out in volumes using the Firmware File System (FFS), a
    /// file system specifically designed to store firmware images. The volumes
    /// contain files that are identified by GUIDs and each of these files contain
    /// one or more sections holding the data. One of these sections contains the
    /// actual executable image. Most of the executable images follow the PE format.
    /// However, some of them follow the TE format.
    /// 
    /// The Terse Executable (TE) image format was created as a mechanism to reduce
    /// the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
    /// corresponding reduction of image sizes for executables running in the PI
    /// (Platform Initialization) Architecture environment. Reducing image size
    /// provides an opportunity for use of a smaller system flash part.
    /// 
    /// So the TE format is basically a stripped version of PE.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf">Source</a>
    /// </remarks>
    public partial class UefiTe : KaitaiStruct
    {
        public static UefiTe FromFile(string fileName)
        {
            return new UefiTe(new KaitaiStream(fileName));
        }

        public UefiTe(KaitaiStream p__io, KaitaiStruct p__parent = null, UefiTe p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            __raw_teHdr = m_io.ReadBytes(40);
            var io___raw_teHdr = new KaitaiStream(__raw_teHdr);
            _teHdr = new TeHeader(io___raw_teHdr, this, m_root);
            _sections = new List<Section>((int) (TeHdr.NumSections));
            for (var i = 0; i < TeHdr.NumSections; i++)
            {
                _sections.Add(new Section(m_io, this, m_root));
            }
        }
        public partial class TeHeader : KaitaiStruct
        {
            public static TeHeader FromFile(string fileName)
            {
                return new TeHeader(new KaitaiStream(fileName));
            }


            public enum MachineType
            {
                Unknown = 0,
                I386 = 332,
                R4000 = 358,
                Wcemipsv2 = 361,
                Alpha = 388,
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
                Arm64 = 43620,
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
                WindowsBootApplication = 16,
            }
            public TeHeader(KaitaiStream p__io, UefiTe p__parent = null, UefiTe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 86, 90 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 86, 90 }, Magic, M_Io, "/types/te_header/seq/0");
                }
                _machine = ((MachineType) m_io.ReadU2le());
                _numSections = m_io.ReadU1();
                _subsystem = ((SubsystemEnum) m_io.ReadU1());
                _strippedSize = m_io.ReadU2le();
                _entryPointAddr = m_io.ReadU4le();
                _baseOfCode = m_io.ReadU4le();
                _imageBase = m_io.ReadU8le();
                _dataDirs = new HeaderDataDirs(m_io, this, m_root);
            }
            private byte[] _magic;
            private MachineType _machine;
            private byte _numSections;
            private SubsystemEnum _subsystem;
            private ushort _strippedSize;
            private uint _entryPointAddr;
            private uint _baseOfCode;
            private ulong _imageBase;
            private HeaderDataDirs _dataDirs;
            private UefiTe m_root;
            private UefiTe m_parent;
            public byte[] Magic { get { return _magic; } }
            public MachineType Machine { get { return _machine; } }
            public byte NumSections { get { return _numSections; } }
            public SubsystemEnum Subsystem { get { return _subsystem; } }
            public ushort StrippedSize { get { return _strippedSize; } }
            public uint EntryPointAddr { get { return _entryPointAddr; } }
            public uint BaseOfCode { get { return _baseOfCode; } }
            public ulong ImageBase { get { return _imageBase; } }
            public HeaderDataDirs DataDirs { get { return _dataDirs; } }
            public UefiTe M_Root { get { return m_root; } }
            public UefiTe M_Parent { get { return m_parent; } }
        }
        public partial class HeaderDataDirs : KaitaiStruct
        {
            public static HeaderDataDirs FromFile(string fileName)
            {
                return new HeaderDataDirs(new KaitaiStream(fileName));
            }

            public HeaderDataDirs(KaitaiStream p__io, UefiTe.TeHeader p__parent = null, UefiTe p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _baseRelocationTable = new DataDir(m_io, this, m_root);
                _debug = new DataDir(m_io, this, m_root);
            }
            private DataDir _baseRelocationTable;
            private DataDir _debug;
            private UefiTe m_root;
            private UefiTe.TeHeader m_parent;
            public DataDir BaseRelocationTable { get { return _baseRelocationTable; } }
            public DataDir Debug { get { return _debug; } }
            public UefiTe M_Root { get { return m_root; } }
            public UefiTe.TeHeader M_Parent { get { return m_parent; } }
        }
        public partial class DataDir : KaitaiStruct
        {
            public static DataDir FromFile(string fileName)
            {
                return new DataDir(new KaitaiStream(fileName));
            }

            public DataDir(KaitaiStream p__io, UefiTe.HeaderDataDirs p__parent = null, UefiTe p__root = null) : base(p__io)
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
            private UefiTe m_root;
            private UefiTe.HeaderDataDirs m_parent;
            public uint VirtualAddress { get { return _virtualAddress; } }
            public uint Size { get { return _size; } }
            public UefiTe M_Root { get { return m_root; } }
            public UefiTe.HeaderDataDirs M_Parent { get { return m_parent; } }
        }
        public partial class Section : KaitaiStruct
        {
            public static Section FromFile(string fileName)
            {
                return new Section(new KaitaiStream(fileName));
            }

            public Section(KaitaiStream p__io, UefiTe p__parent = null, UefiTe p__root = null) : base(p__io)
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
                _numRelocations = m_io.ReadU2le();
                _numLinenumbers = m_io.ReadU2le();
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
                    m_io.Seek(((PointerToRawData - M_Root.TeHdr.StrippedSize) + M_Root.TeHdr.M_Io.Size));
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
            private ushort _numRelocations;
            private ushort _numLinenumbers;
            private uint _characteristics;
            private UefiTe m_root;
            private UefiTe m_parent;
            public string Name { get { return _name; } }
            public uint VirtualSize { get { return _virtualSize; } }
            public uint VirtualAddress { get { return _virtualAddress; } }
            public uint SizeOfRawData { get { return _sizeOfRawData; } }
            public uint PointerToRawData { get { return _pointerToRawData; } }
            public uint PointerToRelocations { get { return _pointerToRelocations; } }
            public uint PointerToLinenumbers { get { return _pointerToLinenumbers; } }
            public ushort NumRelocations { get { return _numRelocations; } }
            public ushort NumLinenumbers { get { return _numLinenumbers; } }
            public uint Characteristics { get { return _characteristics; } }
            public UefiTe M_Root { get { return m_root; } }
            public UefiTe M_Parent { get { return m_parent; } }
        }
        private TeHeader _teHdr;
        private List<Section> _sections;
        private UefiTe m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_teHdr;
        public TeHeader TeHdr { get { return _teHdr; } }
        public List<Section> Sections { get { return _sections; } }
        public UefiTe M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawTeHdr { get { return __raw_teHdr; } }
    }
}
