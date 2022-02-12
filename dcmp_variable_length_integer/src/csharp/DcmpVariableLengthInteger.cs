// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// A variable-length integer,
    /// in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
    /// See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
    /// 
    /// This variable-length integer format can store an integer `x` in any of the following ways:
    /// 
    /// * In a single byte,
    ///   if `0 &lt;= x &lt;= 0x7f`
    ///   (7-bit unsigned integer)
    /// * In 2 bytes,
    ///   if `-0x4000 &lt;= x &lt;= 0x3eff`
    ///   (15-bit signed integer with the highest `0x100` values unavailable)
    /// * In 5 bytes, if `-0x80000000 &lt;= x &lt;= 0x7fffffff`
    ///   (32-bit signed integer)
    /// 
    /// In practice,
    /// values are always stored in the smallest possible format,
    /// but technically any of the larger formats could be used as well.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/common.py">Source</a>
    /// </remarks>
    public partial class DcmpVariableLengthInteger : KaitaiStruct
    {
        public static DcmpVariableLengthInteger FromFile(string fileName)
        {
            return new DcmpVariableLengthInteger(new KaitaiStream(fileName));
        }

        public DcmpVariableLengthInteger(KaitaiStream p__io, KaitaiStruct p__parent = null, DcmpVariableLengthInteger p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_value = false;
            _read();
        }
        private void _read()
        {
            _first = m_io.ReadU1();
            if (First >= 128) {
                switch (First) {
                case 255: {
                    _more = m_io.ReadS4be();
                    break;
                }
                default: {
                    _more = m_io.ReadU1();
                    break;
                }
                }
            }
        }
        private bool f_value;
        private int _value;

        /// <summary>
        /// The decoded value of the variable-length integer.
        /// </summary>
        public int Value
        {
            get
            {
                if (f_value)
                    return _value;
                _value = (int) ((First == 255 ? More : (First >= 128 ? (((First << 8) | More) - 49152) : First)));
                f_value = true;
                return _value;
            }
        }
        private byte _first;
        private int _more;
        private DcmpVariableLengthInteger m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// The first byte of the variable-length integer.
        /// This determines which storage format is used.
        /// 
        /// * For the 1-byte format,
        ///   this encodes the entire value of the value.
        /// * For the 2-byte format,
        ///   this encodes the high 7 bits of the value,
        ///   minus `0xc0`.
        ///   The highest bit of the value,
        ///   i. e. the second-highest bit of this field,
        ///   is the sign bit.
        /// * For the 5-byte format,
        ///   this is always `0xff`.
        /// </summary>
        public byte First { get { return _first; } }

        /// <summary>
        /// The remaining bytes of the variable-length integer.
        /// 
        /// * For the 1-byte format,
        ///   this is not present.
        /// * For the 2-byte format,
        ///   this encodes the low 8 bits of the value.
        /// * For the 5-byte format,
        ///   this encodes the entire value.
        /// </summary>
        public int More { get { return _more; } }
        public DcmpVariableLengthInteger M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
