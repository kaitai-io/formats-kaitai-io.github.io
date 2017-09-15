// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// DOS MZ file format is a traditional format for executables in MS-DOS
    /// environment. Many modern formats (i.e. Windows PE) still maintain
    /// compatibility stub with this format.
    /// 
    /// As opposed to .com file format (which basically sports one 64K code
    /// segment of raw CPU instructions), DOS MZ .exe file format allowed
    /// more flexible memory management, loading of larger programs and
    /// added support for relocations.
    /// </summary>
    public partial class DosMz : KaitaiStruct
    {
        public static DosMz FromFile(string fileName)
        {
            return new DosMz(new KaitaiStream(fileName));
        }

        public DosMz(KaitaiStream p__io, KaitaiStruct p__parent = null, DosMz p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _hdr = new MzHeader(m_io, this, m_root);
            _mzHeader2 = m_io.ReadBytes((Hdr.RelocationsOfs - 28));
            _relocations = new List<Relocation>((int) (Hdr.QtyRelocations));
            for (var i = 0; i < Hdr.QtyRelocations; i++)
            {
                _relocations.Add(new Relocation(m_io, this, m_root));
            }
            _body = m_io.ReadBytesFull();
        }
        public partial class MzHeader : KaitaiStruct
        {
            public static MzHeader FromFile(string fileName)
            {
                return new MzHeader(new KaitaiStream(fileName));
            }

            public MzHeader(KaitaiStream p__io, DosMz p__parent = null, DosMz p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(2);
                _lastPageExtraBytes = m_io.ReadU2le();
                _qtyPages = m_io.ReadU2le();
                _qtyRelocations = m_io.ReadU2le();
                _headerSize = m_io.ReadU2le();
                _minAllocation = m_io.ReadU2le();
                _maxAllocation = m_io.ReadU2le();
                _initialSs = m_io.ReadU2le();
                _initialSp = m_io.ReadU2le();
                _checksum = m_io.ReadU2le();
                _initialIp = m_io.ReadU2le();
                _initialCs = m_io.ReadU2le();
                _relocationsOfs = m_io.ReadU2le();
                _overlayId = m_io.ReadU2le();
            }
            private byte[] _magic;
            private ushort _lastPageExtraBytes;
            private ushort _qtyPages;
            private ushort _qtyRelocations;
            private ushort _headerSize;
            private ushort _minAllocation;
            private ushort _maxAllocation;
            private ushort _initialSs;
            private ushort _initialSp;
            private ushort _checksum;
            private ushort _initialIp;
            private ushort _initialCs;
            private ushort _relocationsOfs;
            private ushort _overlayId;
            private DosMz m_root;
            private DosMz m_parent;
            public byte[] Magic { get { return _magic; } }
            public ushort LastPageExtraBytes { get { return _lastPageExtraBytes; } }
            public ushort QtyPages { get { return _qtyPages; } }
            public ushort QtyRelocations { get { return _qtyRelocations; } }
            public ushort HeaderSize { get { return _headerSize; } }
            public ushort MinAllocation { get { return _minAllocation; } }
            public ushort MaxAllocation { get { return _maxAllocation; } }
            public ushort InitialSs { get { return _initialSs; } }
            public ushort InitialSp { get { return _initialSp; } }
            public ushort Checksum { get { return _checksum; } }
            public ushort InitialIp { get { return _initialIp; } }
            public ushort InitialCs { get { return _initialCs; } }
            public ushort RelocationsOfs { get { return _relocationsOfs; } }
            public ushort OverlayId { get { return _overlayId; } }
            public DosMz M_Root { get { return m_root; } }
            public DosMz M_Parent { get { return m_parent; } }
        }
        public partial class Relocation : KaitaiStruct
        {
            public static Relocation FromFile(string fileName)
            {
                return new Relocation(new KaitaiStream(fileName));
            }

            public Relocation(KaitaiStream p__io, DosMz p__parent = null, DosMz p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ofs = m_io.ReadU2le();
                _seg = m_io.ReadU2le();
            }
            private ushort _ofs;
            private ushort _seg;
            private DosMz m_root;
            private DosMz m_parent;
            public ushort Ofs { get { return _ofs; } }
            public ushort Seg { get { return _seg; } }
            public DosMz M_Root { get { return m_root; } }
            public DosMz M_Parent { get { return m_parent; } }
        }
        private MzHeader _hdr;
        private byte[] _mzHeader2;
        private List<Relocation> _relocations;
        private byte[] _body;
        private DosMz m_root;
        private KaitaiStruct m_parent;
        public MzHeader Hdr { get { return _hdr; } }
        public byte[] MzHeader2 { get { return _mzHeader2; } }
        public List<Relocation> Relocations { get { return _relocations; } }
        public byte[] Body { get { return _body; } }
        public DosMz M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
