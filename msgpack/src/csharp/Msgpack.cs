// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// MessagePack (msgpack) is a system to serialize arbitrary structured
    /// data into a compact binary stream.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md">Source</a>
    /// </remarks>
    public partial class Msgpack : KaitaiStruct
    {
        public static Msgpack FromFile(string fileName)
        {
            return new Msgpack(new KaitaiStream(fileName));
        }

        public Msgpack(KaitaiStream p__io, KaitaiStruct p__parent = null, Msgpack p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_isArray32 = false;
            f_intValue = false;
            f_strLen = false;
            f_isFixArray = false;
            f_isMap = false;
            f_isArray = false;
            f_isFloat = false;
            f_isStr8 = false;
            f_isFixMap = false;
            f_isInt = false;
            f_isBool = false;
            f_isStr16 = false;
            f_isFloat64 = false;
            f_isMap16 = false;
            f_isNegInt5 = false;
            f_posInt7Value = false;
            f_isNil = false;
            f_floatValue = false;
            f_numArrayElements = false;
            f_negInt5Value = false;
            f_boolValue = false;
            f_isPosInt7 = false;
            f_isArray16 = false;
            f_isStr = false;
            f_isFixStr = false;
            f_isStr32 = false;
            f_numMapElements = false;
            f_isFloat32 = false;
            f_isMap32 = false;
            _read();
        }
        private void _read()
        {
            _b1 = m_io.ReadU1();
            switch (B1) {
            case 211: {
                _intExtra = m_io.ReadS8be();
                break;
            }
            case 209: {
                _intExtra = m_io.ReadS2be();
                break;
            }
            case 210: {
                _intExtra = m_io.ReadS4be();
                break;
            }
            case 208: {
                _intExtra = m_io.ReadS1();
                break;
            }
            case 205: {
                _intExtra = m_io.ReadU2be();
                break;
            }
            case 207: {
                _intExtra = m_io.ReadU8be();
                break;
            }
            case 204: {
                _intExtra = m_io.ReadU1();
                break;
            }
            case 206: {
                _intExtra = m_io.ReadU4be();
                break;
            }
            }
            if (IsFloat32) {
                _float32Value = m_io.ReadF4be();
            }
            if (IsFloat64) {
                _float64Value = m_io.ReadF8be();
            }
            if (IsStr8) {
                _strLen8 = m_io.ReadU1();
            }
            if (IsStr16) {
                _strLen16 = m_io.ReadU2be();
            }
            if (IsStr32) {
                _strLen32 = m_io.ReadU4be();
            }
            if (IsStr) {
                _strValue = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(StrLen));
            }
            if (IsArray16) {
                _numArrayElements16 = m_io.ReadU2be();
            }
            if (IsArray32) {
                _numArrayElements32 = m_io.ReadU4be();
            }
            if (IsArray) {
                _arrayElements = new List<Msgpack>((int) (NumArrayElements));
                for (var i = 0; i < NumArrayElements; i++)
                {
                    _arrayElements.Add(new Msgpack(m_io));
                }
            }
            if (IsMap16) {
                _numMapElements16 = m_io.ReadU2be();
            }
            if (IsMap32) {
                _numMapElements32 = m_io.ReadU4be();
            }
            if (IsMap) {
                _mapElements = new List<MapTuple>((int) (NumMapElements));
                for (var i = 0; i < NumMapElements; i++)
                {
                    _mapElements.Add(new MapTuple(m_io, this, m_root));
                }
            }
        }
        public partial class MapTuple : KaitaiStruct
        {
            public static MapTuple FromFile(string fileName)
            {
                return new MapTuple(new KaitaiStream(fileName));
            }

            public MapTuple(KaitaiStream p__io, Msgpack p__parent = null, Msgpack p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _key = new Msgpack(m_io);
                _value = new Msgpack(m_io);
            }
            private Msgpack _key;
            private Msgpack _value;
            private Msgpack m_root;
            private Msgpack m_parent;
            public Msgpack Key { get { return _key; } }
            public Msgpack Value { get { return _value; } }
            public Msgpack M_Root { get { return m_root; } }
            public Msgpack M_Parent { get { return m_parent; } }
        }
        private bool f_isArray32;
        private bool _isArray32;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
        /// </remarks>
        public bool IsArray32
        {
            get
            {
                if (f_isArray32)
                    return _isArray32;
                _isArray32 = (bool) (B1 == 221);
                f_isArray32 = true;
                return _isArray32;
            }
        }
        private bool f_intValue;
        private int? _intValue;
        public int? IntValue
        {
            get
            {
                if (f_intValue)
                    return _intValue;
                if (IsInt) {
                    _intValue = (int) ((IsPosInt7 ? PosInt7Value : (IsNegInt5 ? NegInt5Value : 4919)));
                }
                f_intValue = true;
                return _intValue;
            }
        }
        private bool f_strLen;
        private int? _strLen;
        public int? StrLen
        {
            get
            {
                if (f_strLen)
                    return _strLen;
                if (IsStr) {
                    _strLen = (int) ((IsFixStr ? (B1 & 31) : (IsStr8 ? StrLen8 : (IsStr16 ? StrLen16 : StrLen32))));
                }
                f_strLen = true;
                return _strLen;
            }
        }
        private bool f_isFixArray;
        private bool _isFixArray;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
        /// </remarks>
        public bool IsFixArray
        {
            get
            {
                if (f_isFixArray)
                    return _isFixArray;
                _isFixArray = (bool) ((B1 & 240) == 144);
                f_isFixArray = true;
                return _isFixArray;
            }
        }
        private bool f_isMap;
        private bool _isMap;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
        /// </remarks>
        public bool IsMap
        {
            get
            {
                if (f_isMap)
                    return _isMap;
                _isMap = (bool) ( ((IsFixMap) || (IsMap16) || (IsMap32)) );
                f_isMap = true;
                return _isMap;
            }
        }
        private bool f_isArray;
        private bool _isArray;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
        /// </remarks>
        public bool IsArray
        {
            get
            {
                if (f_isArray)
                    return _isArray;
                _isArray = (bool) ( ((IsFixArray) || (IsArray16) || (IsArray32)) );
                f_isArray = true;
                return _isArray;
            }
        }
        private bool f_isFloat;
        private bool _isFloat;
        public bool IsFloat
        {
            get
            {
                if (f_isFloat)
                    return _isFloat;
                _isFloat = (bool) ( ((IsFloat32) || (IsFloat64)) );
                f_isFloat = true;
                return _isFloat;
            }
        }
        private bool f_isStr8;
        private bool _isStr8;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
        /// </remarks>
        public bool IsStr8
        {
            get
            {
                if (f_isStr8)
                    return _isStr8;
                _isStr8 = (bool) (B1 == 217);
                f_isStr8 = true;
                return _isStr8;
            }
        }
        private bool f_isFixMap;
        private bool _isFixMap;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
        /// </remarks>
        public bool IsFixMap
        {
            get
            {
                if (f_isFixMap)
                    return _isFixMap;
                _isFixMap = (bool) ((B1 & 240) == 128);
                f_isFixMap = true;
                return _isFixMap;
            }
        }
        private bool f_isInt;
        private bool _isInt;
        public bool IsInt
        {
            get
            {
                if (f_isInt)
                    return _isInt;
                _isInt = (bool) ( ((IsPosInt7) || (IsNegInt5)) );
                f_isInt = true;
                return _isInt;
            }
        }
        private bool f_isBool;
        private bool _isBool;
        public bool IsBool
        {
            get
            {
                if (f_isBool)
                    return _isBool;
                _isBool = (bool) ( ((B1 == 194) || (B1 == 195)) );
                f_isBool = true;
                return _isBool;
            }
        }
        private bool f_isStr16;
        private bool _isStr16;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
        /// </remarks>
        public bool IsStr16
        {
            get
            {
                if (f_isStr16)
                    return _isStr16;
                _isStr16 = (bool) (B1 == 218);
                f_isStr16 = true;
                return _isStr16;
            }
        }
        private bool f_isFloat64;
        private bool _isFloat64;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
        /// </remarks>
        public bool IsFloat64
        {
            get
            {
                if (f_isFloat64)
                    return _isFloat64;
                _isFloat64 = (bool) (B1 == 203);
                f_isFloat64 = true;
                return _isFloat64;
            }
        }
        private bool f_isMap16;
        private bool _isMap16;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
        /// </remarks>
        public bool IsMap16
        {
            get
            {
                if (f_isMap16)
                    return _isMap16;
                _isMap16 = (bool) (B1 == 222);
                f_isMap16 = true;
                return _isMap16;
            }
        }
        private bool f_isNegInt5;
        private bool _isNegInt5;
        public bool IsNegInt5
        {
            get
            {
                if (f_isNegInt5)
                    return _isNegInt5;
                _isNegInt5 = (bool) ((B1 & 224) == 224);
                f_isNegInt5 = true;
                return _isNegInt5;
            }
        }
        private bool f_posInt7Value;
        private byte? _posInt7Value;
        public byte? PosInt7Value
        {
            get
            {
                if (f_posInt7Value)
                    return _posInt7Value;
                if (IsPosInt7) {
                    _posInt7Value = (byte) (B1);
                }
                f_posInt7Value = true;
                return _posInt7Value;
            }
        }
        private bool f_isNil;
        private bool _isNil;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil">Source</a>
        /// </remarks>
        public bool IsNil
        {
            get
            {
                if (f_isNil)
                    return _isNil;
                _isNil = (bool) (B1 == 192);
                f_isNil = true;
                return _isNil;
            }
        }
        private bool f_floatValue;
        private double? _floatValue;
        public double? FloatValue
        {
            get
            {
                if (f_floatValue)
                    return _floatValue;
                if (IsFloat) {
                    _floatValue = (double) ((IsFloat32 ? Float32Value : Float64Value));
                }
                f_floatValue = true;
                return _floatValue;
            }
        }
        private bool f_numArrayElements;
        private int? _numArrayElements;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
        /// </remarks>
        public int? NumArrayElements
        {
            get
            {
                if (f_numArrayElements)
                    return _numArrayElements;
                if (IsArray) {
                    _numArrayElements = (int) ((IsFixArray ? (B1 & 15) : (IsArray16 ? NumArrayElements16 : NumArrayElements32)));
                }
                f_numArrayElements = true;
                return _numArrayElements;
            }
        }
        private bool f_negInt5Value;
        private int? _negInt5Value;
        public int? NegInt5Value
        {
            get
            {
                if (f_negInt5Value)
                    return _negInt5Value;
                if (IsNegInt5) {
                    _negInt5Value = (int) (-((B1 & 31)));
                }
                f_negInt5Value = true;
                return _negInt5Value;
            }
        }
        private bool f_boolValue;
        private bool? _boolValue;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool">Source</a>
        /// </remarks>
        public bool? BoolValue
        {
            get
            {
                if (f_boolValue)
                    return _boolValue;
                if (IsBool) {
                    _boolValue = (bool) (B1 == 195);
                }
                f_boolValue = true;
                return _boolValue;
            }
        }
        private bool f_isPosInt7;
        private bool _isPosInt7;
        public bool IsPosInt7
        {
            get
            {
                if (f_isPosInt7)
                    return _isPosInt7;
                _isPosInt7 = (bool) ((B1 & 128) == 0);
                f_isPosInt7 = true;
                return _isPosInt7;
            }
        }
        private bool f_isArray16;
        private bool _isArray16;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array">Source</a>
        /// </remarks>
        public bool IsArray16
        {
            get
            {
                if (f_isArray16)
                    return _isArray16;
                _isArray16 = (bool) (B1 == 220);
                f_isArray16 = true;
                return _isArray16;
            }
        }
        private bool f_isStr;
        private bool _isStr;
        public bool IsStr
        {
            get
            {
                if (f_isStr)
                    return _isStr;
                _isStr = (bool) ( ((IsFixStr) || (IsStr8) || (IsStr16) || (IsStr32)) );
                f_isStr = true;
                return _isStr;
            }
        }
        private bool f_isFixStr;
        private bool _isFixStr;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
        /// </remarks>
        public bool IsFixStr
        {
            get
            {
                if (f_isFixStr)
                    return _isFixStr;
                _isFixStr = (bool) ((B1 & 224) == 160);
                f_isFixStr = true;
                return _isFixStr;
            }
        }
        private bool f_isStr32;
        private bool _isStr32;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str">Source</a>
        /// </remarks>
        public bool IsStr32
        {
            get
            {
                if (f_isStr32)
                    return _isStr32;
                _isStr32 = (bool) (B1 == 219);
                f_isStr32 = true;
                return _isStr32;
            }
        }
        private bool f_numMapElements;
        private int? _numMapElements;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
        /// </remarks>
        public int? NumMapElements
        {
            get
            {
                if (f_numMapElements)
                    return _numMapElements;
                if (IsMap) {
                    _numMapElements = (int) ((IsFixMap ? (B1 & 15) : (IsMap16 ? NumMapElements16 : NumMapElements32)));
                }
                f_numMapElements = true;
                return _numMapElements;
            }
        }
        private bool f_isFloat32;
        private bool _isFloat32;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float">Source</a>
        /// </remarks>
        public bool IsFloat32
        {
            get
            {
                if (f_isFloat32)
                    return _isFloat32;
                _isFloat32 = (bool) (B1 == 202);
                f_isFloat32 = true;
                return _isFloat32;
            }
        }
        private bool f_isMap32;
        private bool _isMap32;

        /// <remarks>
        /// Reference: <a href="https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map">Source</a>
        /// </remarks>
        public bool IsMap32
        {
            get
            {
                if (f_isMap32)
                    return _isMap32;
                _isMap32 = (bool) (B1 == 223);
                f_isMap32 = true;
                return _isMap32;
            }
        }
        private byte _b1;
        private int _intExtra;
        private float? _float32Value;
        private double? _float64Value;
        private byte? _strLen8;
        private ushort? _strLen16;
        private uint? _strLen32;
        private string _strValue;
        private ushort? _numArrayElements16;
        private uint? _numArrayElements32;
        private List<Msgpack> _arrayElements;
        private ushort? _numMapElements16;
        private uint? _numMapElements32;
        private List<MapTuple> _mapElements;
        private Msgpack m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// First byte is msgpack message is either a piece of data by
        /// itself or determines types of further, more complex data
        /// structures.
        /// </summary>
        public byte B1 { get { return _b1; } }
        public int IntExtra { get { return _intExtra; } }
        public float? Float32Value { get { return _float32Value; } }
        public double? Float64Value { get { return _float64Value; } }
        public byte? StrLen8 { get { return _strLen8; } }
        public ushort? StrLen16 { get { return _strLen16; } }
        public uint? StrLen32 { get { return _strLen32; } }
        public string StrValue { get { return _strValue; } }
        public ushort? NumArrayElements16 { get { return _numArrayElements16; } }
        public uint? NumArrayElements32 { get { return _numArrayElements32; } }
        public List<Msgpack> ArrayElements { get { return _arrayElements; } }
        public ushort? NumMapElements16 { get { return _numMapElements16; } }
        public uint? NumMapElements32 { get { return _numMapElements32; } }
        public List<MapTuple> MapElements { get { return _mapElements; } }
        public Msgpack M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
