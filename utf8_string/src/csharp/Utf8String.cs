// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// UTF-8 is a popular character encoding schemes that allows to represent
    /// code points defined in Unicode standard. Its features are:
    /// 
    /// * variable width (i.e. one code point might be represented by 1 to 4
    ///   bytes)
    /// * backward compatiblity with ASCII
    /// * basic validity checking (and thus distinguishing from other legacy
    ///   8-bit encodings)
    /// * maintaining sort order of codepoints if sorted as a byte array
    /// 
    /// WARNING: For vast majority of practical purposes of format definitions
    /// in Kaitai Struct, you'd likely note want to use this and rather just
    /// use `type: str` with `encoding: utf8`. That will use native string
    /// implementations, which are most likely more efficient and will give you
    /// native language strings, rather than an array of individual codepoints.
    /// This format definition is provided mostly for educational / research
    /// purposes.
    /// </summary>
    public partial class Utf8String : KaitaiStruct
    {
        public static Utf8String FromFile(string fileName)
        {
            return new Utf8String(new KaitaiStream(fileName));
        }

        public Utf8String(KaitaiStream p__io, KaitaiStruct p__parent = null, Utf8String p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _codepoints = new List<Utf8Codepoint>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _codepoints.Add(new Utf8Codepoint(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Utf8Codepoint : KaitaiStruct
        {
            public static Utf8Codepoint FromFile(string fileName)
            {
                return new Utf8Codepoint(new KaitaiStream(fileName));
            }

            public Utf8Codepoint(KaitaiStream p__io, Utf8String p__parent = null, Utf8String p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_raw1 = false;
                f_raw4 = false;
                f_raw3 = false;
                f_valueAsInt = false;
                f_raw2 = false;
                f_len = false;
                _read();
            }
            private void _read()
            {
                _byte1 = m_io.ReadU1();
                if (Len >= 2) {
                    _byte2 = m_io.ReadU1();
                }
                if (Len >= 3) {
                    _byte3 = m_io.ReadU1();
                }
                if (Len >= 4) {
                    _byte4 = m_io.ReadU1();
                }
            }
            private bool f_raw1;
            private int _raw1;
            public int Raw1
            {
                get
                {
                    if (f_raw1)
                        return _raw1;
                    _raw1 = (int) ((Byte1 & (Len == 1 ? 127 : (Len == 2 ? 31 : (Len == 3 ? 15 : (Len == 4 ? 7 : 0))))));
                    f_raw1 = true;
                    return _raw1;
                }
            }
            private bool f_raw4;
            private int? _raw4;
            public int? Raw4
            {
                get
                {
                    if (f_raw4)
                        return _raw4;
                    if (Len >= 4) {
                        _raw4 = (int) ((Byte4 & 63));
                    }
                    f_raw4 = true;
                    return _raw4;
                }
            }
            private bool f_raw3;
            private int? _raw3;
            public int? Raw3
            {
                get
                {
                    if (f_raw3)
                        return _raw3;
                    if (Len >= 3) {
                        _raw3 = (int) ((Byte3 & 63));
                    }
                    f_raw3 = true;
                    return _raw3;
                }
            }
            private bool f_valueAsInt;
            private int _valueAsInt;
            public int ValueAsInt
            {
                get
                {
                    if (f_valueAsInt)
                        return _valueAsInt;
                    _valueAsInt = (int) ((Len == 1 ? Raw1 : (Len == 2 ? ((Raw1 << 6) | Raw2) : (Len == 3 ? (((Raw1 << 12) | (Raw2 << 6)) | Raw3) : (Len == 4 ? ((((Raw1 << 18) | (Raw2 << 12)) | (Raw3 << 6)) | Raw4) : -1)))));
                    f_valueAsInt = true;
                    return _valueAsInt;
                }
            }
            private bool f_raw2;
            private int? _raw2;
            public int? Raw2
            {
                get
                {
                    if (f_raw2)
                        return _raw2;
                    if (Len >= 2) {
                        _raw2 = (int) ((Byte2 & 63));
                    }
                    f_raw2 = true;
                    return _raw2;
                }
            }
            private bool f_len;
            private int _len;
            public int Len
            {
                get
                {
                    if (f_len)
                        return _len;
                    _len = (int) (((Byte1 & 128) == 0 ? 1 : ((Byte1 & 224) == 192 ? 2 : ((Byte1 & 240) == 224 ? 3 : ((Byte1 & 248) == 240 ? 4 : -1)))));
                    f_len = true;
                    return _len;
                }
            }
            private byte _byte1;
            private byte? _byte2;
            private byte? _byte3;
            private byte? _byte4;
            private Utf8String m_root;
            private Utf8String m_parent;
            public byte Byte1 { get { return _byte1; } }
            public byte? Byte2 { get { return _byte2; } }
            public byte? Byte3 { get { return _byte3; } }
            public byte? Byte4 { get { return _byte4; } }
            public Utf8String M_Root { get { return m_root; } }
            public Utf8String M_Parent { get { return m_parent; } }
        }
        private List<Utf8Codepoint> _codepoints;
        private Utf8String m_root;
        private KaitaiStruct m_parent;
        public List<Utf8Codepoint> Codepoints { get { return _codepoints; } }
        public Utf8String M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
