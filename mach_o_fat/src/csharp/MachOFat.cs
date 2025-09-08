// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This is a simple container format that encapsulates multiple Mach-O files,
    /// each generally for a different architecture. XNU can execute these files just
    /// like single-arch Mach-Os and will pick the appropriate entry.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html">Source</a>
    /// </remarks>
    public partial class MachOFat : KaitaiStruct
    {
        public static MachOFat FromFile(string fileName)
        {
            return new MachOFat(new KaitaiStream(fileName));
        }

        public MachOFat(KaitaiStream p__io, KaitaiStruct p__parent = null, MachOFat p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 202, 254, 186, 190 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 202, 254, 186, 190 }, _magic, m_io, "/seq/0");
            }
            _numFatArch = m_io.ReadU4be();
            _fatArchs = new List<FatArch>();
            for (var i = 0; i < NumFatArch; i++)
            {
                _fatArchs.Add(new FatArch(m_io, this, m_root));
            }
        }
        public partial class FatArch : KaitaiStruct
        {
            public static FatArch FromFile(string fileName)
            {
                return new FatArch(new KaitaiStream(fileName));
            }

            public FatArch(KaitaiStream p__io, MachOFat p__parent = null, MachOFat p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_object = false;
                _read();
            }
            private void _read()
            {
                _cpuType = ((MachO.CpuType) m_io.ReadU4be());
                _cpuSubtype = m_io.ReadU4be();
                _ofsObject = m_io.ReadU4be();
                _lenObject = m_io.ReadU4be();
                _align = m_io.ReadU4be();
            }
            private bool f_object;
            private MachO _object;
            public MachO Object
            {
                get
                {
                    if (f_object)
                        return _object;
                    f_object = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsObject);
                    __raw_object = m_io.ReadBytes(LenObject);
                    var io___raw_object = new KaitaiStream(__raw_object);
                    _object = new MachO(io___raw_object);
                    m_io.Seek(_pos);
                    return _object;
                }
            }
            private MachO.CpuType _cpuType;
            private uint _cpuSubtype;
            private uint _ofsObject;
            private uint _lenObject;
            private uint _align;
            private MachOFat m_root;
            private MachOFat m_parent;
            private byte[] __raw_object;
            public MachO.CpuType CpuType { get { return _cpuType; } }
            public uint CpuSubtype { get { return _cpuSubtype; } }
            public uint OfsObject { get { return _ofsObject; } }
            public uint LenObject { get { return _lenObject; } }
            public uint Align { get { return _align; } }
            public MachOFat M_Root { get { return m_root; } }
            public MachOFat M_Parent { get { return m_parent; } }
            public byte[] M_RawObject { get { return __raw_object; } }
        }
        private byte[] _magic;
        private uint _numFatArch;
        private List<FatArch> _fatArchs;
        private MachOFat m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public uint NumFatArch { get { return _numFatArch; } }
        public List<FatArch> FatArchs { get { return _fatArchs; } }
        public MachOFat M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
