// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This is an unnamed and undocumented partition table format implemented by
    /// the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
    /// series at least, and probably others). They appear to use this rather than GPT,
    /// the industry standard, because their BootROM loads and executes the next stage
    /// loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
    /// header would have to start. So instead of changing their BootROM, Amlogic
    /// devised this partition table, which lives at an offset of 36MiB (0x240_0000)
    /// on the eMMC and so doesn't conflict. This parser expects as input just the
    /// partition table from that offset. The maximum number of partitions in a table
    /// is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef">Source</a>
    /// </remarks>
    public partial class AmlogicEmmcPartitions : KaitaiStruct
    {
        public static AmlogicEmmcPartitions FromFile(string fileName)
        {
            return new AmlogicEmmcPartitions(new KaitaiStream(fileName));
        }

        public AmlogicEmmcPartitions(KaitaiStream p__io, KaitaiStruct p__parent = null, AmlogicEmmcPartitions p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 77, 80, 84, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 77, 80, 84, 0 }, Magic, M_Io, "/seq/0");
            }
            _version = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(12), 0, false));
            _numPartitions = m_io.ReadS4le();
            if (!(NumPartitions >= 1))
            {
                throw new ValidationLessThanError(1, NumPartitions, M_Io, "/seq/2");
            }
            if (!(NumPartitions <= 32))
            {
                throw new ValidationGreaterThanError(32, NumPartitions, M_Io, "/seq/2");
            }
            _checksum = m_io.ReadU4le();
            _partitions = new List<Partition>();
            for (var i = 0; i < NumPartitions; i++)
            {
                _partitions.Add(new Partition(m_io, this, m_root));
            }
        }
        public partial class Partition : KaitaiStruct
        {
            public static Partition FromFile(string fileName)
            {
                return new Partition(new KaitaiStream(fileName));
            }

            public Partition(KaitaiStream p__io, AmlogicEmmcPartitions p__parent = null, AmlogicEmmcPartitions p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(16), 0, false));
                _size = m_io.ReadU8le();
                _offset = m_io.ReadU8le();
                __raw_flags = m_io.ReadBytes(4);
                var io___raw_flags = new KaitaiStream(__raw_flags);
                _flags = new PartFlags(io___raw_flags, this, m_root);
                _padding = m_io.ReadBytes(4);
            }
            public partial class PartFlags : KaitaiStruct
            {
                public static PartFlags FromFile(string fileName)
                {
                    return new PartFlags(new KaitaiStream(fileName));
                }

                public PartFlags(KaitaiStream p__io, AmlogicEmmcPartitions.Partition p__parent = null, AmlogicEmmcPartitions p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _isCode = m_io.ReadBitsIntLe(1) != 0;
                    _isCache = m_io.ReadBitsIntLe(1) != 0;
                    _isData = m_io.ReadBitsIntLe(1) != 0;
                }
                private bool _isCode;
                private bool _isCache;
                private bool _isData;
                private AmlogicEmmcPartitions m_root;
                private AmlogicEmmcPartitions.Partition m_parent;
                public bool IsCode { get { return _isCode; } }
                public bool IsCache { get { return _isCache; } }
                public bool IsData { get { return _isData; } }
                public AmlogicEmmcPartitions M_Root { get { return m_root; } }
                public AmlogicEmmcPartitions.Partition M_Parent { get { return m_parent; } }
            }
            private string _name;
            private ulong _size;
            private ulong _offset;
            private PartFlags _flags;
            private byte[] _padding;
            private AmlogicEmmcPartitions m_root;
            private AmlogicEmmcPartitions m_parent;
            private byte[] __raw_flags;
            public string Name { get { return _name; } }
            public ulong Size { get { return _size; } }

            /// <summary>
            /// The start of the partition relative to the start of the eMMC, in bytes
            /// </summary>
            public ulong Offset { get { return _offset; } }
            public PartFlags Flags { get { return _flags; } }
            public byte[] Padding { get { return _padding; } }
            public AmlogicEmmcPartitions M_Root { get { return m_root; } }
            public AmlogicEmmcPartitions M_Parent { get { return m_parent; } }
            public byte[] M_RawFlags { get { return __raw_flags; } }
        }
        private byte[] _magic;
        private string _version;
        private int _numPartitions;
        private uint _checksum;
        private List<Partition> _partitions;
        private AmlogicEmmcPartitions m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public string Version { get { return _version; } }
        public int NumPartitions { get { return _numPartitions; } }

        /// <summary>
        /// To calculate this, treat the first (and only the first) partition
        /// descriptor in the table below as an array of unsigned little-endian
        /// 32-bit integers. Sum all those integers mod 2^32, then multiply the
        /// result by the total number of partitions, also mod 2^32. Amlogic
        /// likely meant to include all the partition descriptors in the sum,
        /// but their code as written instead repeatedly loops over the first
        /// one, once for each partition in the table.
        /// </summary>
        public uint Checksum { get { return _checksum; } }
        public List<Partition> Partitions { get { return _partitions; } }
        public AmlogicEmmcPartitions M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
