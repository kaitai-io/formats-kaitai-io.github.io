// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class BlenderBlend : KaitaiStruct
    {
        public static BlenderBlend FromFile(string fileName)
        {
            return new BlenderBlend(new KaitaiStream(fileName));
        }

        public enum PtrSize
        {
            Bits64 = 45,
            Bits32 = 95,
        }

        public enum Endian
        {
            Be = 86,
            Le = 118,
        }

        public BlenderBlend(KaitaiStream io, KaitaiStruct parent = null, BlenderBlend root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _hdr = new Header(m_io, this, m_root);
            _blocks = new List<FileBlock>();
            while (!m_io.IsEof) {
                _blocks.Add(new FileBlock(m_io, this, m_root));
            }
            }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream io, BlenderBlend parent = null, BlenderBlend root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_psize = false;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 66, 76, 69, 78, 68, 69, 82 });
                _ptrSizeId = ((BlenderBlend.PtrSize) m_io.ReadU1());
                _endian = ((BlenderBlend.Endian) m_io.ReadU1());
                _version = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(3));
                }
            private bool f_psize;
            private sbyte _psize;

            /// <summary>
            /// Number of bytes that a pointer occupies
            /// </summary>
            public sbyte Psize
            {
                get
                {
                    if (f_psize)
                        return _psize;
                    _psize = (sbyte) ((PtrSizeId == BlenderBlend.PtrSize.Bits64 ? 8 : 4));
                    f_psize = true;
                    return _psize;
                }
            }
            private byte[] _magic;
            private PtrSize _ptrSizeId;
            private Endian _endian;
            private string _version;
            private BlenderBlend m_root;
            private BlenderBlend m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Size of a pointer; all pointers in the file are stored in this format
            /// </summary>
            public PtrSize PtrSizeId { get { return _ptrSizeId; } }

            /// <summary>
            /// Type of byte ordering used
            /// </summary>
            public Endian Endian { get { return _endian; } }

            /// <summary>
            /// Blender version used to save this file
            /// </summary>
            public string Version { get { return _version; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend M_Parent { get { return m_parent; } }
        }
        public partial class FileBlock : KaitaiStruct
        {
            public static FileBlock FromFile(string fileName)
            {
                return new FileBlock(new KaitaiStream(fileName));
            }

            public FileBlock(KaitaiStream io, BlenderBlend parent = null, BlenderBlend root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _code = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _size = m_io.ReadU4le();
                _memAddr = m_io.ReadBytes(M_Root.Hdr.Psize);
                _sdnaIndex = m_io.ReadU4le();
                _count = m_io.ReadU4le();
                _body = m_io.ReadBytes(Size);
                }
            private string _code;
            private uint _size;
            private byte[] _memAddr;
            private uint _sdnaIndex;
            private uint _count;
            private byte[] _body;
            private BlenderBlend m_root;
            private BlenderBlend m_parent;

            /// <summary>
            /// Identifier of the file block
            /// </summary>
            public string Code { get { return _code; } }

            /// <summary>
            /// Total length of the data after the header of file block
            /// </summary>
            public uint Size { get { return _size; } }

            /// <summary>
            /// Memory address the structure was located when written to disk
            /// </summary>
            public byte[] MemAddr { get { return _memAddr; } }

            /// <summary>
            /// Index of the SDNA structure
            /// </summary>
            public uint SdnaIndex { get { return _sdnaIndex; } }

            /// <summary>
            /// Number of structure located in this file-block
            /// </summary>
            public uint Count { get { return _count; } }
            public byte[] Body { get { return _body; } }
            public BlenderBlend M_Root { get { return m_root; } }
            public BlenderBlend M_Parent { get { return m_parent; } }
        }
        private Header _hdr;
        private List<FileBlock> _blocks;
        private BlenderBlend m_root;
        private KaitaiStruct m_parent;
        public Header Hdr { get { return _hdr; } }
        public List<FileBlock> Blocks { get { return _blocks; } }
        public BlenderBlend M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
