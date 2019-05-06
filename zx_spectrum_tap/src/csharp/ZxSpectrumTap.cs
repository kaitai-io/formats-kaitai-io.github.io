// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://faqwiki.zxnet.co.uk/wiki/TAP_format">Source</a>
    /// </remarks>
    public partial class ZxSpectrumTap : KaitaiStruct
    {
        public static ZxSpectrumTap FromFile(string fileName)
        {
            return new ZxSpectrumTap(new KaitaiStream(fileName));
        }


        public enum FlagEnum
        {
            Header = 0,
            Data = 255,
        }

        public enum HeaderTypeEnum
        {
            Program = 0,
            NumArray = 1,
            CharArray = 2,
            Bytes = 3,
        }
        public ZxSpectrumTap(KaitaiStream p__io, KaitaiStruct p__parent = null, ZxSpectrumTap p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _block = new List<Block>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _block.Add(new Block(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, ZxSpectrumTap p__parent = null, ZxSpectrumTap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenBlock = m_io.ReadU2le();
                _flag = ((ZxSpectrumTap.FlagEnum) m_io.ReadU1());
                if ( ((LenBlock == 19) && (Flag == ZxSpectrumTap.FlagEnum.Header)) ) {
                    _header = new Header(m_io, this, m_root);
                }
                if (LenBlock == 19) {
                    _data = m_io.ReadBytes((Header.LenData + 4));
                }
                if (Flag == ZxSpectrumTap.FlagEnum.Data) {
                    _headerlessData = m_io.ReadBytes((LenBlock - 1));
                }
            }
            private ushort _lenBlock;
            private FlagEnum _flag;
            private Header _header;
            private byte[] _data;
            private byte[] _headerlessData;
            private ZxSpectrumTap m_root;
            private ZxSpectrumTap m_parent;
            public ushort LenBlock { get { return _lenBlock; } }
            public FlagEnum Flag { get { return _flag; } }
            public Header Header { get { return _header; } }
            public byte[] Data { get { return _data; } }
            public byte[] HeaderlessData { get { return _headerlessData; } }
            public ZxSpectrumTap M_Root { get { return m_root; } }
            public ZxSpectrumTap M_Parent { get { return m_parent; } }
        }
        public partial class ProgramParams : KaitaiStruct
        {
            public static ProgramParams FromFile(string fileName)
            {
                return new ProgramParams(new KaitaiStream(fileName));
            }

            public ProgramParams(KaitaiStream p__io, ZxSpectrumTap.Header p__parent = null, ZxSpectrumTap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _autostartLine = m_io.ReadU2le();
                _lenProgram = m_io.ReadU2le();
            }
            private ushort _autostartLine;
            private ushort _lenProgram;
            private ZxSpectrumTap m_root;
            private ZxSpectrumTap.Header m_parent;
            public ushort AutostartLine { get { return _autostartLine; } }
            public ushort LenProgram { get { return _lenProgram; } }
            public ZxSpectrumTap M_Root { get { return m_root; } }
            public ZxSpectrumTap.Header M_Parent { get { return m_parent; } }
        }
        public partial class BytesParams : KaitaiStruct
        {
            public static BytesParams FromFile(string fileName)
            {
                return new BytesParams(new KaitaiStream(fileName));
            }

            public BytesParams(KaitaiStream p__io, ZxSpectrumTap.Header p__parent = null, ZxSpectrumTap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _startAddress = m_io.ReadU2le();
                _reserved = m_io.ReadBytes(2);
            }
            private ushort _startAddress;
            private byte[] _reserved;
            private ZxSpectrumTap m_root;
            private ZxSpectrumTap.Header m_parent;
            public ushort StartAddress { get { return _startAddress; } }
            public byte[] Reserved { get { return _reserved; } }
            public ZxSpectrumTap M_Root { get { return m_root; } }
            public ZxSpectrumTap.Header M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, ZxSpectrumTap.Block p__parent = null, ZxSpectrumTap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _headerType = ((ZxSpectrumTap.HeaderTypeEnum) m_io.ReadU1());
                _filename = KaitaiStream.BytesStripRight(m_io.ReadBytes(10), 32);
                _lenData = m_io.ReadU2le();
                switch (HeaderType) {
                case ZxSpectrumTap.HeaderTypeEnum.Program: {
                    _params = new ProgramParams(m_io, this, m_root);
                    break;
                }
                case ZxSpectrumTap.HeaderTypeEnum.NumArry: {
                    _params = new ArrayParams(m_io, this, m_root);
                    break;
                }
                case ZxSpectrumTap.HeaderTypeEnum.CharArry: {
                    _params = new ArrayParams(m_io, this, m_root);
                    break;
                }
                case ZxSpectrumTap.HeaderTypeEnum.Bytes: {
                    _params = new BytesParams(m_io, this, m_root);
                    break;
                }
                }
                _checksum = m_io.ReadU1();
            }
            private HeaderTypeEnum _headerType;
            private byte[] _filename;
            private ushort _lenData;
            private KaitaiStruct _params;
            private byte _checksum;
            private ZxSpectrumTap m_root;
            private ZxSpectrumTap.Block m_parent;
            public HeaderTypeEnum HeaderType { get { return _headerType; } }
            public byte[] Filename { get { return _filename; } }
            public ushort LenData { get { return _lenData; } }
            public KaitaiStruct Params { get { return _params; } }

            /// <summary>
            /// Bitwise XOR of all bytes including the flag byte
            /// </summary>
            public byte Checksum { get { return _checksum; } }
            public ZxSpectrumTap M_Root { get { return m_root; } }
            public ZxSpectrumTap.Block M_Parent { get { return m_parent; } }
        }
        public partial class ArrayParams : KaitaiStruct
        {
            public static ArrayParams FromFile(string fileName)
            {
                return new ArrayParams(new KaitaiStream(fileName));
            }

            public ArrayParams(KaitaiStream p__io, ZxSpectrumTap.Header p__parent = null, ZxSpectrumTap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved = m_io.ReadU1();
                _varName = m_io.ReadU1();
                _reserved1 = m_io.EnsureFixedContents(new byte[] { 0, 128 });
            }
            private byte _reserved;
            private byte _varName;
            private byte[] _reserved1;
            private ZxSpectrumTap m_root;
            private ZxSpectrumTap.Header m_parent;
            public byte Reserved { get { return _reserved; } }

            /// <summary>
            /// Variable name (1..26 meaning A$..Z$ +192)
            /// </summary>
            public byte VarName { get { return _varName; } }
            public byte[] Reserved1 { get { return _reserved1; } }
            public ZxSpectrumTap M_Root { get { return m_root; } }
            public ZxSpectrumTap.Header M_Parent { get { return m_parent; } }
        }
        private List<Block> _block;
        private ZxSpectrumTap m_root;
        private KaitaiStruct m_parent;
        public List<Block> Block { get { return _block; } }
        public ZxSpectrumTap M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
