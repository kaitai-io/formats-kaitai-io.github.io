// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// A simple wrapper which allows to read a UTF-16 encoded string that starts
    /// with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
    /// encoding, which can be either big-endian (BE) or little-endian (LE).
    /// 
    /// Use:
    /// 
    /// * `value` to get the string value with BOM stripped, regardless of endianness.
    /// * `is_be` and `is_le` to check the endianness indicated by the BOM.
    /// * `bom` to check the raw byte order mark.
    /// </summary>
    /// <remarks>
    /// Reference: - https://en.wikipedia.org/wiki/Byte_order_mark
    /// </remarks>
    public partial class Utf16WithBom : KaitaiStruct
    {
        public static Utf16WithBom FromFile(string fileName)
        {
            return new Utf16WithBom(new KaitaiStream(fileName));
        }

        public Utf16WithBom(KaitaiStream p__io, KaitaiStruct p__parent = null, Utf16WithBom p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_isBe = false;
            f_isLe = false;
            f_value = false;
            _read();
        }
        private void _read()
        {
            _bom = m_io.ReadBytes(2);
            if (!( (((KaitaiStream.ByteArrayCompare(_bom, new byte[] { 254, 255 }) == 0)) || ((KaitaiStream.ByteArrayCompare(_bom, new byte[] { 255, 254 }) == 0))) ))
            {
                throw new ValidationNotAnyOfError(_bom, m_io, "/seq/0");
            }
            if (IsBe) {
                _strBe = System.Text.Encoding.GetEncoding("UTF-16BE").GetString(m_io.ReadBytesFull());
            }
            if (IsLe) {
                _strLe = System.Text.Encoding.GetEncoding("UTF-16LE").GetString(m_io.ReadBytesFull());
            }
        }
        private bool f_isBe;
        private bool _isBe;

        /// <summary>
        /// True if the byte order mark indicates big-endian UTF-16 encoding.
        /// </summary>
        public bool IsBe
        {
            get
            {
                if (f_isBe)
                    return _isBe;
                f_isBe = true;
                _isBe = (bool) ((KaitaiStream.ByteArrayCompare(Bom, new byte[] { 254, 255 }) == 0));
                return _isBe;
            }
        }
        private bool f_isLe;
        private bool _isLe;

        /// <summary>
        /// True if the byte order mark indicates little-endian UTF-16 encoding.
        /// </summary>
        public bool IsLe
        {
            get
            {
                if (f_isLe)
                    return _isLe;
                f_isLe = true;
                _isLe = (bool) ((KaitaiStream.ByteArrayCompare(Bom, new byte[] { 255, 254 }) == 0));
                return _isLe;
            }
        }
        private bool f_value;
        private string _value;

        /// <summary>
        /// The string value with BOM stripped, regardless of endianness.
        /// </summary>
        public string Value
        {
            get
            {
                if (f_value)
                    return _value;
                f_value = true;
                _value = (string) ((IsBe ? StrBe : StrLe));
                return _value;
            }
        }
        private byte[] _bom;
        private string _strBe;
        private string _strLe;
        private Utf16WithBom m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// The byte order mark (BOM) is a special marker at the beginning of the
        /// string that indicates the endianness of the UTF-16 encoding. The
        /// character U+FEFF is used as the BOM, and its byte representation differs
        /// based on endianness:
        /// 
        /// * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
        /// * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
        /// 
        /// This implementation checks for the presence of a valid BOM and strips it
        /// from the resulting string value.
        /// </summary>
        public byte[] Bom { get { return _bom; } }
        public string StrBe { get { return _strBe; } }
        public string StrLe { get { return _strLe; } }
        public Utf16WithBom M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
