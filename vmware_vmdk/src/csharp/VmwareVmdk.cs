// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header">Source</a>
    /// </remarks>
    public partial class VmwareVmdk : KaitaiStruct
    {
        public static VmwareVmdk FromFile(string fileName)
        {
            return new VmwareVmdk(new KaitaiStream(fileName));
        }


        public enum CompressionMethods
        {
            None = 0,
            Deflate = 1,
        }
        public VmwareVmdk(KaitaiStream p__io, KaitaiStruct p__parent = null, VmwareVmdk p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_descriptor = false;
            f_grainPrimary = false;
            f_grainSecondary = false;
            f_lenSector = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 75, 68, 77, 86 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 75, 68, 77, 86 }, _magic, m_io, "/seq/0");
            }
            _version = m_io.ReadS4le();
            _flags = new HeaderFlags(m_io, this, m_root);
            _sizeMax = m_io.ReadS8le();
            _sizeGrain = m_io.ReadS8le();
            _startDescriptor = m_io.ReadS8le();
            _sizeDescriptor = m_io.ReadS8le();
            _numGrainTableEntries = m_io.ReadS4le();
            _startSecondaryGrain = m_io.ReadS8le();
            _startPrimaryGrain = m_io.ReadS8le();
            _sizeMetadata = m_io.ReadS8le();
            _isDirty = m_io.ReadU1();
            _stuff = m_io.ReadBytes(4);
            _compressionMethod = ((CompressionMethods) m_io.ReadU2le());
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags">Source</a>
        /// </remarks>
        public partial class HeaderFlags : KaitaiStruct
        {
            public static HeaderFlags FromFile(string fileName)
            {
                return new HeaderFlags(new KaitaiStream(fileName));
            }

            public HeaderFlags(KaitaiStream p__io, VmwareVmdk p__parent = null, VmwareVmdk p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved1 = m_io.ReadBitsIntBe(5);
                _zeroedGrainTableEntry = m_io.ReadBitsIntBe(1) != 0;
                _useSecondaryGrainDir = m_io.ReadBitsIntBe(1) != 0;
                _validNewLineDetectionTest = m_io.ReadBitsIntBe(1) != 0;
                m_io.AlignToByte();
                _reserved2 = m_io.ReadU1();
                _reserved3 = m_io.ReadBitsIntBe(6);
                _hasMetadata = m_io.ReadBitsIntBe(1) != 0;
                _hasCompressedGrain = m_io.ReadBitsIntBe(1) != 0;
                m_io.AlignToByte();
                _reserved4 = m_io.ReadU1();
            }
            private ulong _reserved1;
            private bool _zeroedGrainTableEntry;
            private bool _useSecondaryGrainDir;
            private bool _validNewLineDetectionTest;
            private byte _reserved2;
            private ulong _reserved3;
            private bool _hasMetadata;
            private bool _hasCompressedGrain;
            private byte _reserved4;
            private VmwareVmdk m_root;
            private VmwareVmdk m_parent;
            public ulong Reserved1 { get { return _reserved1; } }
            public bool ZeroedGrainTableEntry { get { return _zeroedGrainTableEntry; } }
            public bool UseSecondaryGrainDir { get { return _useSecondaryGrainDir; } }
            public bool ValidNewLineDetectionTest { get { return _validNewLineDetectionTest; } }
            public byte Reserved2 { get { return _reserved2; } }
            public ulong Reserved3 { get { return _reserved3; } }
            public bool HasMetadata { get { return _hasMetadata; } }
            public bool HasCompressedGrain { get { return _hasCompressedGrain; } }
            public byte Reserved4 { get { return _reserved4; } }
            public VmwareVmdk M_Root { get { return m_root; } }
            public VmwareVmdk M_Parent { get { return m_parent; } }
        }
        private bool f_descriptor;
        private byte[] _descriptor;
        public byte[] Descriptor
        {
            get
            {
                if (f_descriptor)
                    return _descriptor;
                f_descriptor = true;
                long _pos = m_io.Pos;
                m_io.Seek(StartDescriptor * M_Root.LenSector);
                _descriptor = m_io.ReadBytes(SizeDescriptor * M_Root.LenSector);
                m_io.Seek(_pos);
                return _descriptor;
            }
        }
        private bool f_grainPrimary;
        private byte[] _grainPrimary;
        public byte[] GrainPrimary
        {
            get
            {
                if (f_grainPrimary)
                    return _grainPrimary;
                f_grainPrimary = true;
                long _pos = m_io.Pos;
                m_io.Seek(StartPrimaryGrain * M_Root.LenSector);
                _grainPrimary = m_io.ReadBytes(SizeGrain * M_Root.LenSector);
                m_io.Seek(_pos);
                return _grainPrimary;
            }
        }
        private bool f_grainSecondary;
        private byte[] _grainSecondary;
        public byte[] GrainSecondary
        {
            get
            {
                if (f_grainSecondary)
                    return _grainSecondary;
                f_grainSecondary = true;
                long _pos = m_io.Pos;
                m_io.Seek(StartSecondaryGrain * M_Root.LenSector);
                _grainSecondary = m_io.ReadBytes(SizeGrain * M_Root.LenSector);
                m_io.Seek(_pos);
                return _grainSecondary;
            }
        }
        private bool f_lenSector;
        private int _lenSector;
        public int LenSector
        {
            get
            {
                if (f_lenSector)
                    return _lenSector;
                f_lenSector = true;
                _lenSector = (int) (512);
                return _lenSector;
            }
        }
        private byte[] _magic;
        private int _version;
        private HeaderFlags _flags;
        private long _sizeMax;
        private long _sizeGrain;
        private long _startDescriptor;
        private long _sizeDescriptor;
        private int _numGrainTableEntries;
        private long _startSecondaryGrain;
        private long _startPrimaryGrain;
        private long _sizeMetadata;
        private byte _isDirty;
        private byte[] _stuff;
        private CompressionMethods _compressionMethod;
        private VmwareVmdk m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public int Version { get { return _version; } }
        public HeaderFlags Flags { get { return _flags; } }

        /// <summary>
        /// Maximum number of sectors in a given image file (capacity)
        /// </summary>
        public long SizeMax { get { return _sizeMax; } }
        public long SizeGrain { get { return _sizeGrain; } }

        /// <summary>
        /// Embedded descriptor file start sector number (0 if not available)
        /// </summary>
        public long StartDescriptor { get { return _startDescriptor; } }

        /// <summary>
        /// Number of sectors that embedded descriptor file occupies
        /// </summary>
        public long SizeDescriptor { get { return _sizeDescriptor; } }

        /// <summary>
        /// Number of grains table entries
        /// </summary>
        public int NumGrainTableEntries { get { return _numGrainTableEntries; } }

        /// <summary>
        /// Secondary (backup) grain directory start sector number
        /// </summary>
        public long StartSecondaryGrain { get { return _startSecondaryGrain; } }

        /// <summary>
        /// Primary grain directory start sector number
        /// </summary>
        public long StartPrimaryGrain { get { return _startPrimaryGrain; } }
        public long SizeMetadata { get { return _sizeMetadata; } }
        public byte IsDirty { get { return _isDirty; } }
        public byte[] Stuff { get { return _stuff; } }
        public CompressionMethods CompressionMethod { get { return _compressionMethod; } }
        public VmwareVmdk M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
