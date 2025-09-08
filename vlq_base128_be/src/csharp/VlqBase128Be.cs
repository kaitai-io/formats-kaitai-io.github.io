// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// A variable-length unsigned integer using base128 encoding. 1-byte groups
    /// consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
    /// &quot;most significant group first&quot;, i.e. in &quot;big-endian&quot; manner.
    /// 
    /// This particular encoding is specified and used in:
    /// 
    /// * Standard MIDI file format
    /// * ASN.1 BER encoding
    /// * RAR 5.0 file format
    /// 
    /// More information on this encoding is available at
    /// &lt;https://en.wikipedia.org/wiki/Variable-length_quantity&gt;
    /// 
    /// This particular implementation supports serialized values to up 8 bytes long.
    /// </summary>
    public partial class VlqBase128Be : KaitaiStruct
    {
        public static VlqBase128Be FromFile(string fileName)
        {
            return new VlqBase128Be(new KaitaiStream(fileName));
        }

        public VlqBase128Be(KaitaiStream p__io, KaitaiStruct p__parent = null, VlqBase128Be p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_last = false;
            f_value = false;
            _read();
        }
        private void _read()
        {
            _groups = new List<Group>();
            {
                var i = 0;
                Group M_;
                do {
                    M_ = new Group(m_io, this, m_root);
                    _groups.Add(M_);
                    i++;
                } while (!(!(M_.HasNext)));
            }
        }

        /// <summary>
        /// One byte group, clearly divided into 7-bit &quot;value&quot; chunk and 1-bit &quot;continuation&quot; flag.
        /// </summary>
        public partial class Group : KaitaiStruct
        {
            public static Group FromFile(string fileName)
            {
                return new Group(new KaitaiStream(fileName));
            }

            public Group(KaitaiStream p__io, VlqBase128Be p__parent = null, VlqBase128Be p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _hasNext = m_io.ReadBitsIntBe(1) != 0;
                _value = m_io.ReadBitsIntBe(7);
            }
            private bool _hasNext;
            private ulong _value;
            private VlqBase128Be m_root;
            private VlqBase128Be m_parent;

            /// <summary>
            /// If true, then we have more bytes to read
            /// </summary>
            public bool HasNext { get { return _hasNext; } }

            /// <summary>
            /// The 7-bit (base128) numeric value chunk of this group
            /// </summary>
            public ulong Value { get { return _value; } }
            public VlqBase128Be M_Root { get { return m_root; } }
            public VlqBase128Be M_Parent { get { return m_parent; } }
        }
        private bool f_last;
        private int _last;
        public int Last
        {
            get
            {
                if (f_last)
                    return _last;
                f_last = true;
                _last = (int) (Groups.Count - 1);
                return _last;
            }
        }
        private bool f_value;
        private ulong _value;

        /// <summary>
        /// Resulting value as normal integer
        /// </summary>
        public ulong Value
        {
            get
            {
                if (f_value)
                    return _value;
                f_value = true;
                _value = (ulong) (((ulong) (((((((Groups[Last].Value + (Last >= 1 ? Groups[Last - 1].Value << 7 : 0)) + (Last >= 2 ? Groups[Last - 2].Value << 14 : 0)) + (Last >= 3 ? Groups[Last - 3].Value << 21 : 0)) + (Last >= 4 ? Groups[Last - 4].Value << 28 : 0)) + (Last >= 5 ? Groups[Last - 5].Value << 35 : 0)) + (Last >= 6 ? Groups[Last - 6].Value << 42 : 0)) + (Last >= 7 ? Groups[Last - 7].Value << 49 : 0))));
                return _value;
            }
        }
        private List<Group> _groups;
        private VlqBase128Be m_root;
        private KaitaiStruct m_parent;
        public List<Group> Groups { get { return _groups; } }
        public VlqBase128Be M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
