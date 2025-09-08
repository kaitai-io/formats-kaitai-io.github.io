// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
    /// consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
    /// &quot;least significant group first&quot;, i.e. in &quot;little-endian&quot; manner.
    /// 
    /// This particular encoding is specified and used in:
    /// 
    /// * DWARF debug file format, where it's dubbed &quot;unsigned LEB128&quot; or &quot;ULEB128&quot;.
    ///   &lt;https://dwarfstd.org/doc/dwarf-2.0.0.pdf&gt; - page 139
    /// * Google Protocol Buffers, where it's called &quot;Base 128 Varints&quot;.
    ///   &lt;https://protobuf.dev/programming-guides/encoding/#varints&gt;
    /// * Apache Lucene, where it's called &quot;VInt&quot;
    ///   &lt;https://lucene.apache.org/core/3_5_0/fileformats.html#VInt&gt;
    /// * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
    ///   top of it for signed ints
    ///   &lt;https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1&gt;
    /// 
    /// More information on this encoding is available at &lt;https://en.wikipedia.org/wiki/LEB128&gt;
    /// 
    /// This particular implementation supports integer values up to 64 bits (i.e. the
    /// maximum unsigned value supported is `2**64 - 1`), which implies that serialized
    /// values can be up to 10 bytes in length.
    /// 
    /// If the most significant 10th byte (`groups[9]`) is present, its `has_next`
    /// must be `false` (otherwise we would have 11 or more bytes, which is not
    /// supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
    /// represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
    /// since only integers up to 64 bits are supported). These restrictions are
    /// enforced by this implementation. They were inspired by the Protoscope tool,
    /// see &lt;https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648&gt;.
    /// </summary>
    public partial class VlqBase128Le : KaitaiStruct
    {
        public static VlqBase128Le FromFile(string fileName)
        {
            return new VlqBase128Le(new KaitaiStream(fileName));
        }

        public VlqBase128Le(KaitaiStream p__io, KaitaiStruct p__parent = null, VlqBase128Le p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_len = false;
            f_signBit = false;
            f_value = false;
            f_valueSigned = false;
            _read();
        }
        private void _read()
        {
            _groups = new List<Group>();
            {
                var i = 0;
                Group M_;
                do {
                    M_ = new Group(i, (i != 0 ? Groups[i - 1].IntermValue : 0), (i != 0 ? (i == 9 ? 9223372036854775808 : Groups[i - 1].Multiplier * 128) : 1), m_io, this, m_root);
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
            public Group(int p_idx, ulong p_prevIntermValue, ulong p_multiplier, KaitaiStream p__io, VlqBase128Le p__parent = null, VlqBase128Le p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                _prevIntermValue = p_prevIntermValue;
                _multiplier = p_multiplier;
                f_intermValue = false;
                _read();
            }
            private void _read()
            {
                _hasNext = m_io.ReadBitsIntBe(1) != 0;
                if (!(_hasNext == (Idx == 9 ? false : HasNext)))
                {
                    throw new ValidationNotEqualError((Idx == 9 ? false : HasNext), _hasNext, m_io, "/types/group/seq/0");
                }
                _value = m_io.ReadBitsIntBe(7);
                if (!(_value <= ((ulong) ((Idx == 9 ? 1 : 127)))))
                {
                    throw new ValidationGreaterThanError(((ulong) ((Idx == 9 ? 1 : 127))), _value, m_io, "/types/group/seq/1");
                }
            }
            private bool f_intermValue;
            private ulong _intermValue;
            public ulong IntermValue
            {
                get
                {
                    if (f_intermValue)
                        return _intermValue;
                    f_intermValue = true;
                    _intermValue = (ulong) (((ulong) (PrevIntermValue + Value * Multiplier)));
                    return _intermValue;
                }
            }
            private bool _hasNext;
            private ulong _value;
            private int _idx;
            private ulong _prevIntermValue;
            private ulong _multiplier;
            private VlqBase128Le m_root;
            private VlqBase128Le m_parent;

            /// <summary>
            /// If `true`, then we have more bytes to read.
            /// 
            /// Since this implementation only supports serialized values up to 10
            /// bytes, this must be `false` in the 10th group (`groups[9]`).
            /// </summary>
            public bool HasNext { get { return _hasNext; } }

            /// <summary>
            /// The 7-bit (base128) numeric value chunk of this group
            /// 
            /// Since this implementation only supports integer values up to 64 bits,
            /// the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
            /// (otherwise the width of the represented value would be 65 bits or
            /// more, which is not supported).
            /// </summary>
            public ulong Value { get { return _value; } }
            public int Idx { get { return _idx; } }
            public ulong PrevIntermValue { get { return _prevIntermValue; } }
            public ulong Multiplier { get { return _multiplier; } }
            public VlqBase128Le M_Root { get { return m_root; } }
            public VlqBase128Le M_Parent { get { return m_parent; } }
        }
        private bool f_len;
        private int _len;
        public int Len
        {
            get
            {
                if (f_len)
                    return _len;
                f_len = true;
                _len = (int) (Groups.Count);
                return _len;
            }
        }
        private bool f_signBit;
        private ulong _signBit;
        public ulong SignBit
        {
            get
            {
                if (f_signBit)
                    return _signBit;
                f_signBit = true;
                _signBit = (ulong) (((ulong) ((Len == 10 ? 9223372036854775808 : Groups[Groups.Count - 1].Multiplier * 64))));
                return _signBit;
            }
        }
        private bool f_value;
        private ulong _value;

        /// <summary>
        /// Resulting unsigned value as normal integer
        /// </summary>
        public ulong Value
        {
            get
            {
                if (f_value)
                    return _value;
                f_value = true;
                _value = (ulong) (Groups[Groups.Count - 1].IntermValue);
                return _value;
            }
        }
        private bool f_valueSigned;
        private long _valueSigned;
        public long ValueSigned
        {
            get
            {
                if (f_valueSigned)
                    return _valueSigned;
                f_valueSigned = true;
                _valueSigned = (long) (( ((SignBit > 0) && (Value >= SignBit))  ? -(((long) (SignBit - (Value - SignBit)))) : ((long) (Value))));
                return _valueSigned;
            }
        }
        private List<Group> _groups;
        private VlqBase128Le m_root;
        private KaitaiStruct m_parent;
        public List<Group> Groups { get { return _groups; } }
        public VlqBase128Le M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
