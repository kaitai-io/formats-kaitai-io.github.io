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
    /// <remarks>
    /// Reference: <a href="http://www.delorie.com/djgpp/doc/exe/">Source</a>
    /// </remarks>
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
            f_relocations = false;
            _read();
        }
        private void _read()
        {
            _header = new ExeHeader(m_io, this, m_root);
            _body = m_io.ReadBytes(Header.LenBody);
        }
        public partial class ExeHeader : KaitaiStruct
        {
            public static ExeHeader FromFile(string fileName)
            {
                return new ExeHeader(new KaitaiStream(fileName));
            }

            public ExeHeader(KaitaiStream p__io, DosMz p__parent = null, DosMz p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenBody = false;
                _read();
            }
            private void _read()
            {
                _mz = new MzHeader(m_io, this, m_root);
                _restOfHeader = m_io.ReadBytes(Mz.LenHeader - 28);
            }
            private bool f_lenBody;
            private int _lenBody;
            public int LenBody
            {
                get
                {
                    if (f_lenBody)
                        return _lenBody;
                    f_lenBody = true;
                    _lenBody = (int) ((Mz.LastPageExtraBytes == 0 ? Mz.NumPages * 512 : (Mz.NumPages - 1) * 512 + Mz.LastPageExtraBytes) - Mz.LenHeader);
                    return _lenBody;
                }
            }
            private MzHeader _mz;
            private byte[] _restOfHeader;
            private DosMz m_root;
            private DosMz m_parent;
            public MzHeader Mz { get { return _mz; } }
            public byte[] RestOfHeader { get { return _restOfHeader; } }
            public DosMz M_Root { get { return m_root; } }
            public DosMz M_Parent { get { return m_parent; } }
        }
        public partial class MzHeader : KaitaiStruct
        {
            public static MzHeader FromFile(string fileName)
            {
                return new MzHeader(new KaitaiStream(fileName));
            }

            public MzHeader(KaitaiStream p__io, DosMz.ExeHeader p__parent = null, DosMz p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenHeader = false;
                _read();
            }
            private void _read()
            {
                _magic = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(2));
                if (!( ((_magic == "MZ") || (_magic == "ZM")) ))
                {
                    throw new ValidationNotAnyOfError(_magic, m_io, "/types/mz_header/seq/0");
                }
                _lastPageExtraBytes = m_io.ReadU2le();
                _numPages = m_io.ReadU2le();
                _numRelocations = m_io.ReadU2le();
                _headerSize = m_io.ReadU2le();
                _minAllocation = m_io.ReadU2le();
                _maxAllocation = m_io.ReadU2le();
                _initialSs = m_io.ReadU2le();
                _initialSp = m_io.ReadU2le();
                _checksum = m_io.ReadU2le();
                _initialIp = m_io.ReadU2le();
                _initialCs = m_io.ReadU2le();
                _ofsRelocations = m_io.ReadU2le();
                _overlayId = m_io.ReadU2le();
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
                    _lenHeader = (int) (HeaderSize * 16);
                    return _lenHeader;
                }
            }
            private string _magic;
            private ushort _lastPageExtraBytes;
            private ushort _numPages;
            private ushort _numRelocations;
            private ushort _headerSize;
            private ushort _minAllocation;
            private ushort _maxAllocation;
            private ushort _initialSs;
            private ushort _initialSp;
            private ushort _checksum;
            private ushort _initialIp;
            private ushort _initialCs;
            private ushort _ofsRelocations;
            private ushort _overlayId;
            private DosMz m_root;
            private DosMz.ExeHeader m_parent;
            public string Magic { get { return _magic; } }
            public ushort LastPageExtraBytes { get { return _lastPageExtraBytes; } }
            public ushort NumPages { get { return _numPages; } }
            public ushort NumRelocations { get { return _numRelocations; } }
            public ushort HeaderSize { get { return _headerSize; } }
            public ushort MinAllocation { get { return _minAllocation; } }
            public ushort MaxAllocation { get { return _maxAllocation; } }
            public ushort InitialSs { get { return _initialSs; } }
            public ushort InitialSp { get { return _initialSp; } }
            public ushort Checksum { get { return _checksum; } }
            public ushort InitialIp { get { return _initialIp; } }
            public ushort InitialCs { get { return _initialCs; } }
            public ushort OfsRelocations { get { return _ofsRelocations; } }
            public ushort OverlayId { get { return _overlayId; } }
            public DosMz M_Root { get { return m_root; } }
            public DosMz.ExeHeader M_Parent { get { return m_parent; } }
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
        private bool f_relocations;
        private List<Relocation> _relocations;
        public List<Relocation> Relocations
        {
            get
            {
                if (f_relocations)
                    return _relocations;
                f_relocations = true;
                if (Header.Mz.OfsRelocations != 0) {
                    KaitaiStream io = Header.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Header.Mz.OfsRelocations);
                    _relocations = new List<Relocation>();
                    for (var i = 0; i < Header.Mz.NumRelocations; i++)
                    {
                        _relocations.Add(new Relocation(io, this, m_root));
                    }
                    io.Seek(_pos);
                }
                return _relocations;
            }
        }
        private ExeHeader _header;
        private byte[] _body;
        private DosMz m_root;
        private KaitaiStruct m_parent;
        public ExeHeader Header { get { return _header; } }
        public byte[] Body { get { return _body; } }
        public DosMz M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
