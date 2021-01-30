// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// UTF-8 is a popular character encoding scheme that allows to
    /// represent strings as sequence of code points defined in Unicode
    /// standard. Its features are:
    /// 
    /// * variable width (i.e. one code point might be represented by 1 to 4
    ///   bytes)
    /// * backward compatiblity with ASCII
    /// * basic validity checking (and thus distinguishing from other legacy
    ///   8-bit encodings)
    /// * maintaining sort order of codepoints if sorted as a byte array
    /// 
    /// WARNING: For the vast majority of practical purposes of format
    /// definitions in Kaitai Struct, you'd likely NOT want to use this and
    /// rather just use `type: str` with `encoding: utf-8`. That will use
    /// native string implementations, which are most likely more efficient
    /// and will give you native language strings, rather than an array of
    /// individual codepoints.  This format definition is provided mostly
    /// for educational / research purposes.
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
                    _codepoints.Add(new Utf8Codepoint(M_Io.Pos, m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Utf8Codepoint : KaitaiStruct
        {
            public Utf8Codepoint(ulong p_ofs, KaitaiStream p__io, Utf8String p__parent = null, Utf8String p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _ofs = p_ofs;
                f_raw1 = false;
                f_lenBytes = false;
                f_raw3 = false;
                f_valueAsInt = false;
                f_raw0 = false;
                f_byte0 = false;
                f_raw2 = false;
                _read();
            }
            private void _read()
            {
                _bytes = m_io.ReadBytes(LenBytes);
            }
            private bool f_raw1;
            private int? _raw1;
            public int? Raw1
            {
                get
                {
                    if (f_raw1)
                        return _raw1;
                    if (LenBytes >= 2) {
                        _raw1 = (int) ((Bytes[1] & 63));
                    }
                    f_raw1 = true;
                    return _raw1;
                }
            }
            private bool f_lenBytes;
            private int _lenBytes;
            public int LenBytes
            {
                get
                {
                    if (f_lenBytes)
                        return _lenBytes;
                    _lenBytes = (int) (((Byte0 & 128) == 0 ? 1 : ((Byte0 & 224) == 192 ? 2 : ((Byte0 & 240) == 224 ? 3 : ((Byte0 & 248) == 240 ? 4 : -1)))));
                    f_lenBytes = true;
                    return _lenBytes;
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
                    if (LenBytes >= 4) {
                        _raw3 = (int) ((Bytes[3] & 63));
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
                    _valueAsInt = (int) ((LenBytes == 1 ? Raw0 : (LenBytes == 2 ? ((Raw0 << 6) | Raw1) : (LenBytes == 3 ? (((Raw0 << 12) | (Raw1 << 6)) | Raw2) : (LenBytes == 4 ? ((((Raw0 << 18) | (Raw1 << 12)) | (Raw2 << 6)) | Raw3) : -1)))));
                    f_valueAsInt = true;
                    return _valueAsInt;
                }
            }
            private bool f_raw0;
            private int _raw0;
            public int Raw0
            {
                get
                {
                    if (f_raw0)
                        return _raw0;
                    _raw0 = (int) ((Bytes[0] & (LenBytes == 1 ? 127 : (LenBytes == 2 ? 31 : (LenBytes == 3 ? 15 : (LenBytes == 4 ? 7 : 0))))));
                    f_raw0 = true;
                    return _raw0;
                }
            }
            private bool f_byte0;
            private byte _byte0;
            public byte Byte0
            {
                get
                {
                    if (f_byte0)
                        return _byte0;
                    long _pos = m_io.Pos;
                    m_io.Seek(Ofs);
                    _byte0 = m_io.ReadU1();
                    m_io.Seek(_pos);
                    f_byte0 = true;
                    return _byte0;
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
                    if (LenBytes >= 3) {
                        _raw2 = (int) ((Bytes[2] & 63));
                    }
                    f_raw2 = true;
                    return _raw2;
                }
            }
            private byte[] _bytes;
            private ulong _ofs;
            private Utf8String m_root;
            private Utf8String m_parent;
            public byte[] Bytes { get { return _bytes; } }
            public ulong Ofs { get { return _ofs; } }
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
