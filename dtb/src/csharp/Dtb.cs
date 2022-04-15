// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
    /// of data (primarily devicetree data, although other data is possible as well).
    /// The data is internally stored as a tree of named nodes and properties. Nodes
    /// contain properties and child nodes, while properties are name-value pairs.
    /// 
    /// The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
    /// files (`.dts`) through the Devicetree compiler (DTC).
    /// 
    /// On Linux systems that support this, the blobs can be accessed in
    /// `/sys/firmware/fdt`:
    /// 
    /// * &lt;https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw&gt;
    /// 
    /// The encoding of strings used in the `strings_block` and `structure_block` is
    /// actually a subset of ASCII:
    /// 
    /// &lt;https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names&gt;
    /// 
    /// Example files:
    /// 
    /// * &lt;https://github.com/qemu/qemu/tree/master/pc-bios&gt;
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf">Source</a>
    /// </remarks>
    public partial class Dtb : KaitaiStruct
    {
        public static Dtb FromFile(string fileName)
        {
            return new Dtb(new KaitaiStream(fileName));
        }


        public enum Fdt
        {
            BeginNode = 1,
            EndNode = 2,
            Prop = 3,
            Nop = 4,
            End = 9,
        }
        public Dtb(KaitaiStream p__io, KaitaiStruct p__parent = null, Dtb p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_memoryReservationBlock = false;
            f_structureBlock = false;
            f_stringsBlock = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 208, 13, 254, 237 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 208, 13, 254, 237 }, Magic, M_Io, "/seq/0");
            }
            _totalSize = m_io.ReadU4be();
            _ofsStructureBlock = m_io.ReadU4be();
            _ofsStringsBlock = m_io.ReadU4be();
            _ofsMemoryReservationBlock = m_io.ReadU4be();
            _version = m_io.ReadU4be();
            _minCompatibleVersion = m_io.ReadU4be();
            if (!(MinCompatibleVersion <= Version))
            {
                throw new ValidationGreaterThanError(Version, MinCompatibleVersion, M_Io, "/seq/6");
            }
            _bootCpuidPhys = m_io.ReadU4be();
            _lenStringsBlock = m_io.ReadU4be();
            _lenStructureBlock = m_io.ReadU4be();
        }
        public partial class MemoryBlock : KaitaiStruct
        {
            public static MemoryBlock FromFile(string fileName)
            {
                return new MemoryBlock(new KaitaiStream(fileName));
            }

            public MemoryBlock(KaitaiStream p__io, Dtb p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<MemoryBlockEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new MemoryBlockEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<MemoryBlockEntry> _entries;
            private Dtb m_root;
            private Dtb m_parent;
            public List<MemoryBlockEntry> Entries { get { return _entries; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb M_Parent { get { return m_parent; } }
        }
        public partial class FdtBlock : KaitaiStruct
        {
            public static FdtBlock FromFile(string fileName)
            {
                return new FdtBlock(new KaitaiStream(fileName));
            }

            public FdtBlock(KaitaiStream p__io, Dtb p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _nodes = new List<FdtNode>();
                {
                    var i = 0;
                    FdtNode M_;
                    do {
                        M_ = new FdtNode(m_io, this, m_root);
                        _nodes.Add(M_);
                        i++;
                    } while (!(M_.Type == Dtb.Fdt.End));
                }
            }
            private List<FdtNode> _nodes;
            private Dtb m_root;
            private Dtb m_parent;
            public List<FdtNode> Nodes { get { return _nodes; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb M_Parent { get { return m_parent; } }
        }
        public partial class MemoryBlockEntry : KaitaiStruct
        {
            public static MemoryBlockEntry FromFile(string fileName)
            {
                return new MemoryBlockEntry(new KaitaiStream(fileName));
            }

            public MemoryBlockEntry(KaitaiStream p__io, Dtb.MemoryBlock p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _address = m_io.ReadU8be();
                _size = m_io.ReadU8be();
            }
            private ulong _address;
            private ulong _size;
            private Dtb m_root;
            private Dtb.MemoryBlock m_parent;

            /// <summary>
            /// physical address of a reserved memory region
            /// </summary>
            public ulong Address { get { return _address; } }

            /// <summary>
            /// size of a reserved memory region
            /// </summary>
            public ulong Size { get { return _size; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb.MemoryBlock M_Parent { get { return m_parent; } }
        }
        public partial class Strings : KaitaiStruct
        {
            public static Strings FromFile(string fileName)
            {
                return new Strings(new KaitaiStream(fileName));
            }

            public Strings(KaitaiStream p__io, Dtb p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _strings = new List<string>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _strings.Add(System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true)));
                        i++;
                    }
                }
            }
            private List<string> _strings;
            private Dtb m_root;
            private Dtb m_parent;
            public List<string> Strings { get { return _strings; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb M_Parent { get { return m_parent; } }
        }
        public partial class FdtProp : KaitaiStruct
        {
            public static FdtProp FromFile(string fileName)
            {
                return new FdtProp(new KaitaiStream(fileName));
            }

            public FdtProp(KaitaiStream p__io, Dtb.FdtNode p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_name = false;
                _read();
            }
            private void _read()
            {
                _lenProperty = m_io.ReadU4be();
                _ofsName = m_io.ReadU4be();
                _property = m_io.ReadBytes(LenProperty);
                _padding = m_io.ReadBytes(KaitaiStream.Mod(-(M_Io.Pos), 4));
            }
            private bool f_name;
            private string _name;
            public string Name
            {
                get
                {
                    if (f_name)
                        return _name;
                    KaitaiStream io = M_Root.StringsBlock.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsName);
                    _name = System.Text.Encoding.GetEncoding("ASCII").GetString(io.ReadBytesTerm(0, false, true, true));
                    io.Seek(_pos);
                    f_name = true;
                    return _name;
                }
            }
            private uint _lenProperty;
            private uint _ofsName;
            private byte[] _property;
            private byte[] _padding;
            private Dtb m_root;
            private Dtb.FdtNode m_parent;
            public uint LenProperty { get { return _lenProperty; } }
            public uint OfsName { get { return _ofsName; } }
            public byte[] Property { get { return _property; } }
            public byte[] Padding { get { return _padding; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb.FdtNode M_Parent { get { return m_parent; } }
        }
        public partial class FdtNode : KaitaiStruct
        {
            public static FdtNode FromFile(string fileName)
            {
                return new FdtNode(new KaitaiStream(fileName));
            }

            public FdtNode(KaitaiStream p__io, Dtb.FdtBlock p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = ((Dtb.Fdt) m_io.ReadU4be());
                switch (Type) {
                case Dtb.Fdt.BeginNode: {
                    _body = new FdtBeginNode(m_io, this, m_root);
                    break;
                }
                case Dtb.Fdt.Prop: {
                    _body = new FdtProp(m_io, this, m_root);
                    break;
                }
                }
            }
            private Fdt _type;
            private KaitaiStruct _body;
            private Dtb m_root;
            private Dtb.FdtBlock m_parent;
            public Fdt Type { get { return _type; } }
            public KaitaiStruct Body { get { return _body; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb.FdtBlock M_Parent { get { return m_parent; } }
        }
        public partial class FdtBeginNode : KaitaiStruct
        {
            public static FdtBeginNode FromFile(string fileName)
            {
                return new FdtBeginNode(new KaitaiStream(fileName));
            }

            public FdtBeginNode(KaitaiStream p__io, Dtb.FdtNode p__parent = null, Dtb p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                _padding = m_io.ReadBytes(KaitaiStream.Mod(-(M_Io.Pos), 4));
            }
            private string _name;
            private byte[] _padding;
            private Dtb m_root;
            private Dtb.FdtNode m_parent;
            public string Name { get { return _name; } }
            public byte[] Padding { get { return _padding; } }
            public Dtb M_Root { get { return m_root; } }
            public Dtb.FdtNode M_Parent { get { return m_parent; } }
        }
        private bool f_memoryReservationBlock;
        private MemoryBlock _memoryReservationBlock;
        public MemoryBlock MemoryReservationBlock
        {
            get
            {
                if (f_memoryReservationBlock)
                    return _memoryReservationBlock;
                long _pos = m_io.Pos;
                m_io.Seek(OfsMemoryReservationBlock);
                __raw_memoryReservationBlock = m_io.ReadBytes((OfsStructureBlock - OfsMemoryReservationBlock));
                var io___raw_memoryReservationBlock = new KaitaiStream(__raw_memoryReservationBlock);
                _memoryReservationBlock = new MemoryBlock(io___raw_memoryReservationBlock, this, m_root);
                m_io.Seek(_pos);
                f_memoryReservationBlock = true;
                return _memoryReservationBlock;
            }
        }
        private bool f_structureBlock;
        private FdtBlock _structureBlock;
        public FdtBlock StructureBlock
        {
            get
            {
                if (f_structureBlock)
                    return _structureBlock;
                long _pos = m_io.Pos;
                m_io.Seek(OfsStructureBlock);
                __raw_structureBlock = m_io.ReadBytes(LenStructureBlock);
                var io___raw_structureBlock = new KaitaiStream(__raw_structureBlock);
                _structureBlock = new FdtBlock(io___raw_structureBlock, this, m_root);
                m_io.Seek(_pos);
                f_structureBlock = true;
                return _structureBlock;
            }
        }
        private bool f_stringsBlock;
        private Strings _stringsBlock;
        public Strings StringsBlock
        {
            get
            {
                if (f_stringsBlock)
                    return _stringsBlock;
                long _pos = m_io.Pos;
                m_io.Seek(OfsStringsBlock);
                __raw_stringsBlock = m_io.ReadBytes(LenStringsBlock);
                var io___raw_stringsBlock = new KaitaiStream(__raw_stringsBlock);
                _stringsBlock = new Strings(io___raw_stringsBlock, this, m_root);
                m_io.Seek(_pos);
                f_stringsBlock = true;
                return _stringsBlock;
            }
        }
        private byte[] _magic;
        private uint _totalSize;
        private uint _ofsStructureBlock;
        private uint _ofsStringsBlock;
        private uint _ofsMemoryReservationBlock;
        private uint _version;
        private uint _minCompatibleVersion;
        private uint _bootCpuidPhys;
        private uint _lenStringsBlock;
        private uint _lenStructureBlock;
        private Dtb m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_memoryReservationBlock;
        private byte[] __raw_structureBlock;
        private byte[] __raw_stringsBlock;
        public byte[] Magic { get { return _magic; } }
        public uint TotalSize { get { return _totalSize; } }
        public uint OfsStructureBlock { get { return _ofsStructureBlock; } }
        public uint OfsStringsBlock { get { return _ofsStringsBlock; } }
        public uint OfsMemoryReservationBlock { get { return _ofsMemoryReservationBlock; } }
        public uint Version { get { return _version; } }
        public uint MinCompatibleVersion { get { return _minCompatibleVersion; } }
        public uint BootCpuidPhys { get { return _bootCpuidPhys; } }
        public uint LenStringsBlock { get { return _lenStringsBlock; } }
        public uint LenStructureBlock { get { return _lenStructureBlock; } }
        public Dtb M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawMemoryReservationBlock { get { return __raw_memoryReservationBlock; } }
        public byte[] M_RawStructureBlock { get { return __raw_structureBlock; } }
        public byte[] M_RawStringsBlock { get { return __raw_stringsBlock; } }
    }
}
