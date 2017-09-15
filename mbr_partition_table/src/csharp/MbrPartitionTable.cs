// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class MbrPartitionTable : KaitaiStruct
    {
        public static MbrPartitionTable FromFile(string fileName)
        {
            return new MbrPartitionTable(new KaitaiStream(fileName));
        }

        public MbrPartitionTable(KaitaiStream p__io, KaitaiStruct p__parent = null, MbrPartitionTable p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _bootstrapCode = m_io.ReadBytes(446);
            _partitions = new List<PartitionEntry>((int) (4));
            for (var i = 0; i < 4; i++)
            {
                _partitions.Add(new PartitionEntry(m_io, this, m_root));
            }
            _bootSignature = m_io.EnsureFixedContents(new byte[] { 85, 170 });
        }
        public partial class PartitionEntry : KaitaiStruct
        {
            public static PartitionEntry FromFile(string fileName)
            {
                return new PartitionEntry(new KaitaiStream(fileName));
            }

            public PartitionEntry(KaitaiStream p__io, MbrPartitionTable p__parent = null, MbrPartitionTable p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _status = m_io.ReadU1();
                _chsStart = new Chs(m_io, this, m_root);
                _partitionType = m_io.ReadU1();
                _chsEnd = new Chs(m_io, this, m_root);
                _lbaStart = m_io.ReadU4le();
                _numSectors = m_io.ReadU4le();
            }
            private byte _status;
            private Chs _chsStart;
            private byte _partitionType;
            private Chs _chsEnd;
            private uint _lbaStart;
            private uint _numSectors;
            private MbrPartitionTable m_root;
            private MbrPartitionTable m_parent;
            public byte Status { get { return _status; } }
            public Chs ChsStart { get { return _chsStart; } }
            public byte PartitionType { get { return _partitionType; } }
            public Chs ChsEnd { get { return _chsEnd; } }
            public uint LbaStart { get { return _lbaStart; } }
            public uint NumSectors { get { return _numSectors; } }
            public MbrPartitionTable M_Root { get { return m_root; } }
            public MbrPartitionTable M_Parent { get { return m_parent; } }
        }
        public partial class Chs : KaitaiStruct
        {
            public static Chs FromFile(string fileName)
            {
                return new Chs(new KaitaiStream(fileName));
            }

            public Chs(KaitaiStream p__io, MbrPartitionTable.PartitionEntry p__parent = null, MbrPartitionTable p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sector = false;
                f_cylinder = false;
                _read();
            }
            private void _read()
            {
                _head = m_io.ReadU1();
                _b2 = m_io.ReadU1();
                _b3 = m_io.ReadU1();
            }
            private bool f_sector;
            private int _sector;
            public int Sector
            {
                get
                {
                    if (f_sector)
                        return _sector;
                    _sector = (int) ((B2 & 63));
                    f_sector = true;
                    return _sector;
                }
            }
            private bool f_cylinder;
            private int _cylinder;
            public int Cylinder
            {
                get
                {
                    if (f_cylinder)
                        return _cylinder;
                    _cylinder = (int) ((B3 + ((B2 & 192) << 2)));
                    f_cylinder = true;
                    return _cylinder;
                }
            }
            private byte _head;
            private byte _b2;
            private byte _b3;
            private MbrPartitionTable m_root;
            private MbrPartitionTable.PartitionEntry m_parent;
            public byte Head { get { return _head; } }
            public byte B2 { get { return _b2; } }
            public byte B3 { get { return _b3; } }
            public MbrPartitionTable M_Root { get { return m_root; } }
            public MbrPartitionTable.PartitionEntry M_Parent { get { return m_parent; } }
        }
        private byte[] _bootstrapCode;
        private List<PartitionEntry> _partitions;
        private byte[] _bootSignature;
        private MbrPartitionTable m_root;
        private KaitaiStruct m_parent;
        public byte[] BootstrapCode { get { return _bootstrapCode; } }
        public List<PartitionEntry> Partitions { get { return _partitions; } }
        public byte[] BootSignature { get { return _bootSignature; } }
        public MbrPartitionTable M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
