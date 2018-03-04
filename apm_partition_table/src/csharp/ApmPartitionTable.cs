// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: Specification taken from https://en.wikipedia.org/wiki/Apple_Partition_Map
    /// </remarks>
    public partial class ApmPartitionTable : KaitaiStruct
    {
        public static ApmPartitionTable FromFile(string fileName)
        {
            return new ApmPartitionTable(new KaitaiStream(fileName));
        }

        public ApmPartitionTable(KaitaiStream p__io, KaitaiStruct p__parent = null, ApmPartitionTable p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_sectorSize = false;
            f_partitionLookup = false;
            f_partitionEntries = false;
            _read();
        }
        private void _read()
        {
        }
        public partial class PartitionEntry : KaitaiStruct
        {
            public static PartitionEntry FromFile(string fileName)
            {
                return new PartitionEntry(new KaitaiStream(fileName));
            }

            public PartitionEntry(KaitaiStream p__io, ApmPartitionTable p__parent = null, ApmPartitionTable p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_partition = false;
                f_data = false;
                f_bootCode = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 80, 77 });
                _reserved1 = m_io.ReadBytes(2);
                _numberOfPartitions = m_io.ReadU4be();
                _partitionStart = m_io.ReadU4be();
                _partitionSize = m_io.ReadU4be();
                _partitionName = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(32), 0, false));
                _partitionType = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(32), 0, false));
                _dataStart = m_io.ReadU4be();
                _dataSize = m_io.ReadU4be();
                _partitionStatus = m_io.ReadU4be();
                _bootCodeStart = m_io.ReadU4be();
                _bootCodeSize = m_io.ReadU4be();
                _bootLoaderAddress = m_io.ReadU4be();
                _reserved2 = m_io.ReadBytes(4);
                _bootCodeEntry = m_io.ReadU4be();
                _reserved3 = m_io.ReadBytes(4);
                _bootCodeCksum = m_io.ReadU4be();
                _processorType = System.Text.Encoding.GetEncoding("ascii").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(16), 0, false));
            }
            private bool f_partition;
            private byte[] _partition;
            public byte[] Partition
            {
                get
                {
                    if (f_partition)
                        return _partition;
                    if ((PartitionStatus & 1) != 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek((PartitionStart * M_Root.SectorSize));
                        _partition = io.ReadBytes((PartitionSize * M_Root.SectorSize));
                        io.Seek(_pos);
                    }
                    f_partition = true;
                    return _partition;
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
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek((DataStart * M_Root.SectorSize));
                    _data = io.ReadBytes((DataSize * M_Root.SectorSize));
                    io.Seek(_pos);
                    f_data = true;
                    return _data;
                }
            }
            private bool f_bootCode;
            private byte[] _bootCode;
            public byte[] BootCode
            {
                get
                {
                    if (f_bootCode)
                        return _bootCode;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek((BootCodeStart * M_Root.SectorSize));
                    _bootCode = io.ReadBytes(BootCodeSize);
                    io.Seek(_pos);
                    f_bootCode = true;
                    return _bootCode;
                }
            }
            private byte[] _magic;
            private byte[] _reserved1;
            private uint _numberOfPartitions;
            private uint _partitionStart;
            private uint _partitionSize;
            private string _partitionName;
            private string _partitionType;
            private uint _dataStart;
            private uint _dataSize;
            private uint _partitionStatus;
            private uint _bootCodeStart;
            private uint _bootCodeSize;
            private uint _bootLoaderAddress;
            private byte[] _reserved2;
            private uint _bootCodeEntry;
            private byte[] _reserved3;
            private uint _bootCodeCksum;
            private string _processorType;
            private ApmPartitionTable m_root;
            private ApmPartitionTable m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] Reserved1 { get { return _reserved1; } }
            public uint NumberOfPartitions { get { return _numberOfPartitions; } }

            /// <summary>
            /// First sector
            /// </summary>
            public uint PartitionStart { get { return _partitionStart; } }

            /// <summary>
            /// Number of sectors
            /// </summary>
            public uint PartitionSize { get { return _partitionSize; } }
            public string PartitionName { get { return _partitionName; } }
            public string PartitionType { get { return _partitionType; } }

            /// <summary>
            /// First sector
            /// </summary>
            public uint DataStart { get { return _dataStart; } }

            /// <summary>
            /// Number of sectors
            /// </summary>
            public uint DataSize { get { return _dataSize; } }
            public uint PartitionStatus { get { return _partitionStatus; } }

            /// <summary>
            /// First sector
            /// </summary>
            public uint BootCodeStart { get { return _bootCodeStart; } }

            /// <summary>
            /// Number of bytes
            /// </summary>
            public uint BootCodeSize { get { return _bootCodeSize; } }

            /// <summary>
            /// Address of bootloader code
            /// </summary>
            public uint BootLoaderAddress { get { return _bootLoaderAddress; } }
            public byte[] Reserved2 { get { return _reserved2; } }

            /// <summary>
            /// Boot code entry point
            /// </summary>
            public uint BootCodeEntry { get { return _bootCodeEntry; } }
            public byte[] Reserved3 { get { return _reserved3; } }

            /// <summary>
            /// Boot code checksum
            /// </summary>
            public uint BootCodeCksum { get { return _bootCodeCksum; } }
            public string ProcessorType { get { return _processorType; } }
            public ApmPartitionTable M_Root { get { return m_root; } }
            public ApmPartitionTable M_Parent { get { return m_parent; } }
        }
        private bool f_sectorSize;
        private int _sectorSize;

        /// <summary>
        /// 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
        /// 0x800 (2048) bytes for CDROM
        /// </summary>
        public int SectorSize
        {
            get
            {
                if (f_sectorSize)
                    return _sectorSize;
                _sectorSize = (int) (512);
                f_sectorSize = true;
                return _sectorSize;
            }
        }
        private bool f_partitionLookup;
        private PartitionEntry _partitionLookup;

        /// <summary>
        /// Every partition entry contains the number of partition entries.
        /// We parse the first entry, to know how many to parse, including the first one.
        /// No logic is given what to do if other entries have a different number.
        /// </summary>
        public PartitionEntry PartitionLookup
        {
            get
            {
                if (f_partitionLookup)
                    return _partitionLookup;
                KaitaiStream io = M_Root.M_Io;
                long _pos = io.Pos;
                io.Seek(M_Root.SectorSize);
                __raw_partitionLookup = io.ReadBytes(SectorSize);
                var io___raw_partitionLookup = new KaitaiStream(__raw_partitionLookup);
                _partitionLookup = new PartitionEntry(io___raw_partitionLookup, this, m_root);
                io.Seek(_pos);
                f_partitionLookup = true;
                return _partitionLookup;
            }
        }
        private bool f_partitionEntries;
        private List<PartitionEntry> _partitionEntries;
        public List<PartitionEntry> PartitionEntries
        {
            get
            {
                if (f_partitionEntries)
                    return _partitionEntries;
                KaitaiStream io = M_Root.M_Io;
                long _pos = io.Pos;
                io.Seek(M_Root.SectorSize);
                __raw_partitionEntries = new List<byte[]>((int) (M_Root.PartitionLookup.NumberOfPartitions));
                _partitionEntries = new List<PartitionEntry>((int) (M_Root.PartitionLookup.NumberOfPartitions));
                for (var i = 0; i < M_Root.PartitionLookup.NumberOfPartitions; i++)
                {
                    __raw_partitionEntries.Add(io.ReadBytes(SectorSize));
                    var io___raw_partitionEntries = new KaitaiStream(__raw_partitionEntries[__raw_partitionEntries.Count - 1]);
                    _partitionEntries.Add(new PartitionEntry(io___raw_partitionEntries, this, m_root));
                }
                io.Seek(_pos);
                f_partitionEntries = true;
                return _partitionEntries;
            }
        }
        private ApmPartitionTable m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_partitionLookup;
        private List<byte[]> __raw_partitionEntries;
        public ApmPartitionTable M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawPartitionLookup { get { return __raw_partitionLookup; } }
        public List<byte[]> M_RawPartitionEntries { get { return __raw_partitionEntries; } }
    }
}
