// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c">Source</a>
    /// </remarks>
    public partial class AsusTrx : KaitaiStruct
    {
        public static AsusTrx FromFile(string fileName)
        {
            return new AsusTrx(new KaitaiStream(fileName));
        }

        public AsusTrx(KaitaiStream p__io, KaitaiStruct p__parent = null, AsusTrx p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_header = false;
            f_tail = false;
            _read();
        }
        private void _read()
        {
        }
        public partial class Revision : KaitaiStruct
        {
            public static Revision FromFile(string fileName)
            {
                return new Revision(new KaitaiStream(fileName));
            }

            public Revision(KaitaiStream p__io, AsusTrx.Tail.HwCompInfo p__parent = null, AsusTrx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _major = m_io.ReadU1();
                _minor = m_io.ReadU1();
            }
            private byte _major;
            private byte _minor;
            private AsusTrx m_root;
            private AsusTrx.Tail.HwCompInfo m_parent;
            public byte Major { get { return _major; } }
            public byte Minor { get { return _minor; } }
            public AsusTrx M_Root { get { return m_root; } }
            public AsusTrx.Tail.HwCompInfo M_Parent { get { return m_parent; } }
        }
        public partial class Version : KaitaiStruct
        {
            public static Version FromFile(string fileName)
            {
                return new Version(new KaitaiStream(fileName));
            }

            public Version(KaitaiStream p__io, AsusTrx.Tail p__parent = null, AsusTrx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _major = m_io.ReadU1();
                _minor = m_io.ReadU1();
                _patch = m_io.ReadU1();
                _tweak = m_io.ReadU1();
            }
            private byte _major;
            private byte _minor;
            private byte _patch;
            private byte _tweak;
            private AsusTrx m_root;
            private AsusTrx.Tail m_parent;
            public byte Major { get { return _major; } }
            public byte Minor { get { return _minor; } }
            public byte Patch { get { return _patch; } }
            public byte Tweak { get { return _tweak; } }
            public AsusTrx M_Root { get { return m_root; } }
            public AsusTrx.Tail M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A safeguard against installation of firmware to an incompatible device
        /// </summary>
        public partial class Tail : KaitaiStruct
        {
            public static Tail FromFile(string fileName)
            {
                return new Tail(new KaitaiStream(fileName));
            }

            public Tail(KaitaiStream p__io, AsusTrx p__parent = null, AsusTrx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = new Version(m_io, this, m_root);
                _productId = System.Text.Encoding.GetEncoding("utf-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(12), 0, false));
                _compHw = new List<HwCompInfo>((int) (4));
                for (var i = 0; i < 4; i++)
                {
                    _compHw.Add(new HwCompInfo(m_io, this, m_root));
                }
                _reserved = m_io.ReadBytes(32);
            }
            public partial class HwCompInfo : KaitaiStruct
            {
                public static HwCompInfo FromFile(string fileName)
                {
                    return new HwCompInfo(new KaitaiStream(fileName));
                }

                public HwCompInfo(KaitaiStream p__io, AsusTrx.Tail p__parent = null, AsusTrx p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _min = new Revision(m_io, this, m_root);
                    _max = new Revision(m_io, this, m_root);
                }
                private Revision _min;
                private Revision _max;
                private AsusTrx m_root;
                private AsusTrx.Tail m_parent;
                public Revision Min { get { return _min; } }
                public Revision Max { get { return _max; } }
                public AsusTrx M_Root { get { return m_root; } }
                public AsusTrx.Tail M_Parent { get { return m_parent; } }
            }
            private Version _version;
            private string _productId;
            private List<HwCompInfo> _compHw;
            private byte[] _reserved;
            private AsusTrx m_root;
            private AsusTrx m_parent;

            /// <summary>
            /// 1.9.2.7 by default
            /// </summary>
            public Version Version { get { return _version; } }
            public string ProductId { get { return _productId; } }

            /// <summary>
            /// 0.02 - 2.99
            /// </summary>
            public List<HwCompInfo> CompHw { get { return _compHw; } }
            public byte[] Reserved { get { return _reserved; } }
            public AsusTrx M_Root { get { return m_root; } }
            public AsusTrx M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, AsusTrx p__parent = null, AsusTrx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _signature = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Signature, new byte[] { 72, 68, 82, 48 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 72, 68, 82, 48 }, Signature, M_Io, "/types/header/seq/0");
                }
                _len = m_io.ReadU4le();
                _crc32 = m_io.ReadU4le();
                _version = m_io.ReadU2le();
                _flags = new Flags(m_io, this, m_root);
                _partitions = new List<Partition>();
                {
                    var i = 0;
                    Partition M_;
                    do {
                        M_ = new Partition(i, m_io, this, m_root);
                        _partitions.Add(M_);
                        i++;
                    } while (!( ((i >= 4) || (!(M_.Present))) ));
                }
            }
            public partial class Partition : KaitaiStruct
            {
                public Partition(byte p_idx, KaitaiStream p__io, AsusTrx.Header p__parent = null, AsusTrx p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _idx = p_idx;
                    f_present = false;
                    f_isLast = false;
                    f_size = false;
                    f_partition = false;
                    _read();
                }
                private void _read()
                {
                    _offset = m_io.ReadU4le();
                }
                private bool f_present;
                private bool _present;
                public bool Present
                {
                    get
                    {
                        if (f_present)
                            return _present;
                        _present = (bool) (Offset != 0);
                        f_present = true;
                        return _present;
                    }
                }
                private bool f_isLast;
                private bool? _isLast;
                public bool? IsLast
                {
                    get
                    {
                        if (f_isLast)
                            return _isLast;
                        if (Present) {
                            _isLast = (bool) ( ((Idx == (M_Parent.Partitions.Count - 1)) || (!(M_Parent.Partitions[(Idx + 1)].Present))) );
                        }
                        f_isLast = true;
                        return _isLast;
                    }
                }
                private bool f_size;
                private int? _size;
                public int? Size
                {
                    get
                    {
                        if (f_size)
                            return _size;
                        if (Present) {
                            _size = (int) ((IsLast ? (M_Root.M_Io.Size - Offset) : M_Parent.Partitions[(Idx + 1)].Offset));
                        }
                        f_size = true;
                        return _size;
                    }
                }
                private bool f_partition;
                private byte[] _partition;
                public byte[] Partition
                {
                    get
                    {
                        if (f_partition)
                            return _partition;
                        if (Present) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(Offset);
                            _partition = io.ReadBytes(Size);
                            io.Seek(_pos);
                            f_partition = true;
                        }
                        return _partition;
                    }
                }
                private uint _offset;
                private byte _idx;
                private AsusTrx m_root;
                private AsusTrx.Header m_parent;
                public uint Offset { get { return _offset; } }
                public byte Idx { get { return _idx; } }
                public AsusTrx M_Root { get { return m_root; } }
                public AsusTrx.Header M_Parent { get { return m_parent; } }
            }
            public partial class Flags : KaitaiStruct
            {
                public static Flags FromFile(string fileName)
                {
                    return new Flags(new KaitaiStream(fileName));
                }

                public Flags(KaitaiStream p__io, AsusTrx.Header p__parent = null, AsusTrx p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _flags = new List<bool>((int) (16));
                    for (var i = 0; i < 16; i++)
                    {
                        _flags.Add(m_io.ReadBitsIntLe(1) != 0);
                    }
                }
                private List<bool> _flags;
                private AsusTrx m_root;
                private AsusTrx.Header m_parent;
                public List<bool> Flags { get { return _flags; } }
                public AsusTrx M_Root { get { return m_root; } }
                public AsusTrx.Header M_Parent { get { return m_parent; } }
            }
            private byte[] _signature;
            private uint _len;
            private uint _crc32;
            private ushort _version;
            private Flags _flags;
            private List<Partition> _partitions;
            private AsusTrx m_root;
            private AsusTrx m_parent;
            public byte[] Signature { get { return _signature; } }

            /// <summary>
            /// Length of file including header
            /// </summary>
            public uint Len { get { return _len; } }

            /// <summary>
            /// CRC from `version` (??? todo: see the original and disambiguate) to end of file
            /// </summary>
            public uint Crc32 { get { return _crc32; } }
            public ushort Version { get { return _version; } }
            public Flags Flags { get { return _flags; } }

            /// <summary>
            /// Offsets of partitions from start of header
            /// </summary>
            public List<Partition> Partitions { get { return _partitions; } }
            public AsusTrx M_Root { get { return m_root; } }
            public AsusTrx M_Parent { get { return m_parent; } }
        }
        private bool f_header;
        private Header _header;
        public Header Header
        {
            get
            {
                if (f_header)
                    return _header;
                long _pos = m_io.Pos;
                m_io.Seek(0);
                _header = new Header(m_io, this, m_root);
                m_io.Seek(_pos);
                f_header = true;
                return _header;
            }
        }
        private bool f_tail;
        private Tail _tail;
        public Tail Tail
        {
            get
            {
                if (f_tail)
                    return _tail;
                long _pos = m_io.Pos;
                m_io.Seek((M_Io.Size - 64));
                _tail = new Tail(m_io, this, m_root);
                m_io.Seek(_pos);
                f_tail = true;
                return _tail;
            }
        }
        private AsusTrx m_root;
        private KaitaiStruct m_parent;
        public AsusTrx M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
