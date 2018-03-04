// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// It is a color scheme for visualising SPM scans.
    /// </summary>
    public partial class NtMdtPal : KaitaiStruct
    {
        public static NtMdtPal FromFile(string fileName)
        {
            return new NtMdtPal(new KaitaiStream(fileName));
        }

        public NtMdtPal(KaitaiStream p__io, KaitaiStruct p__parent = null, NtMdtPal p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _signature = m_io.EnsureFixedContents(new byte[] { 78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33 });
            _count = m_io.ReadU4be();
            _meta = new List<Meta>((int) (Count));
            for (var i = 0; i < Count; i++)
            {
                _meta.Add(new Meta(m_io, this, m_root));
            }
            _something2 = m_io.ReadBytes(1);
            _tables = new List<ColTable>((int) (Count));
            for (var i = 0; i < Count; i++)
            {
                _tables.Add(new ColTable(i, m_io, this, m_root));
            }
        }
        public partial class Meta : KaitaiStruct
        {
            public static Meta FromFile(string fileName)
            {
                return new Meta(new KaitaiStream(fileName));
            }

            public Meta(KaitaiStream p__io, NtMdtPal p__parent = null, NtMdtPal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _unkn00 = m_io.ReadBytes(3);
                _unkn01 = m_io.ReadBytes(2);
                _unkn02 = m_io.ReadBytes(1);
                _unkn03 = m_io.ReadBytes(1);
                _colorsCount = m_io.ReadU2le();
                _unkn10 = m_io.ReadBytes(2);
                _unkn11 = m_io.ReadBytes(1);
                _unkn12 = m_io.ReadBytes(2);
                _nameSize = m_io.ReadU2be();
            }
            private byte[] _unkn00;
            private byte[] _unkn01;
            private byte[] _unkn02;
            private byte[] _unkn03;
            private ushort _colorsCount;
            private byte[] _unkn10;
            private byte[] _unkn11;
            private byte[] _unkn12;
            private ushort _nameSize;
            private NtMdtPal m_root;
            private NtMdtPal m_parent;

            /// <summary>
            /// usually 0s
            /// </summary>
            public byte[] Unkn00 { get { return _unkn00; } }
            public byte[] Unkn01 { get { return _unkn01; } }
            public byte[] Unkn02 { get { return _unkn02; } }

            /// <summary>
            /// usually 0s
            /// </summary>
            public byte[] Unkn03 { get { return _unkn03; } }
            public ushort ColorsCount { get { return _colorsCount; } }

            /// <summary>
            /// usually 0s
            /// </summary>
            public byte[] Unkn10 { get { return _unkn10; } }

            /// <summary>
            /// usually 4
            /// </summary>
            public byte[] Unkn11 { get { return _unkn11; } }

            /// <summary>
            /// usually 0s
            /// </summary>
            public byte[] Unkn12 { get { return _unkn12; } }
            public ushort NameSize { get { return _nameSize; } }
            public NtMdtPal M_Root { get { return m_root; } }
            public NtMdtPal M_Parent { get { return m_parent; } }
        }
        public partial class Color : KaitaiStruct
        {
            public static Color FromFile(string fileName)
            {
                return new Color(new KaitaiStream(fileName));
            }

            public Color(KaitaiStream p__io, NtMdtPal.ColTable p__parent = null, NtMdtPal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _red = m_io.ReadU1();
                _unkn = m_io.ReadU1();
                _blue = m_io.ReadU1();
                _green = m_io.ReadU1();
            }
            private byte _red;
            private byte _unkn;
            private byte _blue;
            private byte _green;
            private NtMdtPal m_root;
            private NtMdtPal.ColTable m_parent;
            public byte Red { get { return _red; } }
            public byte Unkn { get { return _unkn; } }
            public byte Blue { get { return _blue; } }
            public byte Green { get { return _green; } }
            public NtMdtPal M_Root { get { return m_root; } }
            public NtMdtPal.ColTable M_Parent { get { return m_parent; } }
        }
        public partial class ColTable : KaitaiStruct
        {
            public ColTable(ushort p_index, KaitaiStream p__io, NtMdtPal p__parent = null, NtMdtPal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _index = p_index;
                _read();
            }
            private void _read()
            {
                _size1 = m_io.ReadU1();
                _unkn = m_io.ReadU1();
                _title = System.Text.Encoding.GetEncoding("UTF-16").GetString(m_io.ReadBytes(M_Root.Meta[Index].NameSize));
                _unkn1 = m_io.ReadU2be();
                _colors = new List<Color>((int) ((M_Root.Meta[Index].ColorsCount - 1)));
                for (var i = 0; i < (M_Root.Meta[Index].ColorsCount - 1); i++)
                {
                    _colors.Add(new Color(m_io, this, m_root));
                }
            }
            private byte _size1;
            private byte _unkn;
            private string _title;
            private ushort _unkn1;
            private List<Color> _colors;
            private ushort _index;
            private NtMdtPal m_root;
            private NtMdtPal m_parent;
            public byte Size1 { get { return _size1; } }
            public byte Unkn { get { return _unkn; } }
            public string Title { get { return _title; } }
            public ushort Unkn1 { get { return _unkn1; } }
            public List<Color> Colors { get { return _colors; } }
            public ushort Index { get { return _index; } }
            public NtMdtPal M_Root { get { return m_root; } }
            public NtMdtPal M_Parent { get { return m_parent; } }
        }
        private byte[] _signature;
        private uint _count;
        private List<Meta> _meta;
        private byte[] _something2;
        private List<ColTable> _tables;
        private NtMdtPal m_root;
        private KaitaiStruct m_parent;
        public byte[] Signature { get { return _signature; } }
        public uint Count { get { return _count; } }
        public List<Meta> Meta { get { return _meta; } }
        public byte[] Something2 { get { return _something2; } }
        public List<ColTable> Tables { get { return _tables; } }
        public NtMdtPal M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
