// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
    /// tensor library for storing machine learning models, used for example by
    /// [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
    /// replaced the older GGML, GGMF and GGJT formats.
    /// 
    /// A GGUF file consists of a header with metadata as key-value pairs (model
    /// architecture, hyperparameters, tokenizer, etc.), a description of each
    /// tensor (name, dimensions, type and offset), and finally the tensor data.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md">Git tag "v0.27.0"</a>
    /// </remarks>
    public partial class Gguf : KaitaiStruct
    {
        public static Gguf FromFile(string fileName)
        {
            return new Gguf(new KaitaiStream(fileName));
        }


        public enum GgmlType
        {
            F32 = 0,
            F16 = 1,
            Q40 = 2,
            Q41 = 3,
            Q42 = 4,
            Q43 = 5,
            Q50 = 6,
            Q51 = 7,
            Q80 = 8,
            Q81 = 9,
            Q2K = 10,
            Q3K = 11,
            Q4K = 12,
            Q5K = 13,
            Q6K = 14,
            Q8K = 15,
            Iq2Xxs = 16,
            Iq2Xs = 17,
            Iq3Xxs = 18,
            Iq1S = 19,
            Iq4Nl = 20,
            Iq3S = 21,
            Iq2S = 22,
            Iq4Xs = 23,
            I8 = 24,
            I16 = 25,
            I32 = 26,
            I64 = 27,
            F64 = 28,
            Iq1M = 29,
            Bf16 = 30,
            Q4044 = 31,
            Q4048 = 32,
            Q4088 = 33,
            Tq10 = 34,
            Tq20 = 35,
            Iq4Nl44 = 36,
            Iq4Nl48 = 37,
            Iq4Nl88 = 38,
            Mxfp4 = 39,
            Nvfp4 = 40,
            Q10 = 41,
            Q20 = 42,
        }

        public enum GgufType
        {
            Uint8 = 0,
            Int8 = 1,
            Uint16 = 2,
            Int16 = 3,
            Uint32 = 4,
            Int32 = 5,
            Float32 = 6,
            Bool = 7,
            String = 8,
            Array = 9,
            Uint64 = 10,
            Int64 = 11,
            Float64 = 12,
        }
        public Gguf(KaitaiStream p__io, KaitaiStruct p__parent = null, Gguf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_isBigEndian = false;
            f_lenFile = false;
            f_versionLe = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 71, 71, 85, 70 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 71, 71, 85, 70 }, _magic, m_io, "/seq/0");
            }
            _body = new GgufBody(m_io, this, m_root);
        }
        public partial class GgufBody : KaitaiStruct
        {
            public static GgufBody FromFile(string fileName)
            {
                return new GgufBody(new KaitaiStream(fileName));
            }

            private bool? m_isLe;
            public GgufBody(KaitaiStream p__io, Gguf p__parent = null, Gguf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_alignment = false;
                f_ofsTensorData = false;
                _read();
            }
            private void _read()
            {
                {
                    bool on = M_Root.IsBigEndian;
                    if (on == true)
                    {
                        m_isLe = (bool) (false);
                    }
                    else if (on == false)
                    {
                        m_isLe = (bool) (true);
                    }
                }

                if (m_isLe == null) {
                    throw new UndecidedEndiannessError();
                } else if (m_isLe == true) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE()
            {
                _version = m_io.ReadU4le();
                if (!(_version >= 2))
                {
                    throw new ValidationLessThanError(2, _version, m_io, "/types/gguf_body/seq/0");
                }
                if (!(_version <= 3))
                {
                    throw new ValidationGreaterThanError(3, _version, m_io, "/types/gguf_body/seq/0");
                }
                _numTensorInfos = m_io.ReadU8le();
                _numKvPairs = m_io.ReadU8le();
                _kvPairs = new List<GgufKv>();
                for (var i = 0; i < NumKvPairs; i++)
                {
                    _kvPairs.Add(new GgufKv((i != 0 ? KvPairs[i - 1].Alignment : 32), m_io, this, m_root, m_isLe));
                }
                _tensorInfos = new List<GgufTensorInfo>();
                for (var i = 0; i < NumTensorInfos; i++)
                {
                    _tensorInfos.Add(new GgufTensorInfo((i != 0 ? TensorInfos[i - 1].ExpectedNextOffset : 0), m_io, this, m_root, m_isLe));
                }
                if (NumTensorInfos != 0) {
                    _padding = m_io.ReadBytes(KaitaiStream.Mod(Alignment - KaitaiStream.Mod(M_Io.Pos, Alignment), Alignment));
                }
                if (OfsTensorData < 0) {
                    __unnamed6 = m_io.ReadBytes(0);
                }
            }
            private void _readBE()
            {
                _version = m_io.ReadU4be();
                if (!(_version >= 2))
                {
                    throw new ValidationLessThanError(2, _version, m_io, "/types/gguf_body/seq/0");
                }
                if (!(_version <= 3))
                {
                    throw new ValidationGreaterThanError(3, _version, m_io, "/types/gguf_body/seq/0");
                }
                _numTensorInfos = m_io.ReadU8be();
                _numKvPairs = m_io.ReadU8be();
                _kvPairs = new List<GgufKv>();
                for (var i = 0; i < NumKvPairs; i++)
                {
                    _kvPairs.Add(new GgufKv((i != 0 ? KvPairs[i - 1].Alignment : 32), m_io, this, m_root, m_isLe));
                }
                _tensorInfos = new List<GgufTensorInfo>();
                for (var i = 0; i < NumTensorInfos; i++)
                {
                    _tensorInfos.Add(new GgufTensorInfo((i != 0 ? TensorInfos[i - 1].ExpectedNextOffset : 0), m_io, this, m_root, m_isLe));
                }
                if (NumTensorInfos != 0) {
                    _padding = m_io.ReadBytes(KaitaiStream.Mod(Alignment - KaitaiStream.Mod(M_Io.Pos, Alignment), Alignment));
                }
                if (OfsTensorData < 0) {
                    __unnamed6 = m_io.ReadBytes(0);
                }
            }

            /// <summary>
            /// Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
            /// they are explicitly allowed by `gguf.md` - see
            /// &lt;https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221&gt;.
            /// </summary>
            public partial class GgufArray : KaitaiStruct
            {
                public static GgufArray FromFile(string fileName)
                {
                    return new GgufArray(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufArray(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _type = ((Gguf.GgufType) m_io.ReadU4le());
                    if (!Enum.IsDefined(typeof(GgufType), _type))
                    {
                        throw new ValidationNotInEnumError(_type, m_io, "/types/gguf_body/types/gguf_array/seq/0");
                    }
                    _numElems = m_io.ReadU8le();
                    _elems = new List<GgufValue>();
                    for (var i = 0; i < NumElems; i++)
                    {
                        _elems.Add(new GgufValue(Type, m_io, this, m_root, m_isLe));
                    }
                }
                private void _readBE()
                {
                    _type = ((Gguf.GgufType) m_io.ReadU4be());
                    if (!Enum.IsDefined(typeof(GgufType), _type))
                    {
                        throw new ValidationNotInEnumError(_type, m_io, "/types/gguf_body/types/gguf_array/seq/0");
                    }
                    _numElems = m_io.ReadU8be();
                    _elems = new List<GgufValue>();
                    for (var i = 0; i < NumElems; i++)
                    {
                        _elems.Add(new GgufValue(Type, m_io, this, m_root, m_isLe));
                    }
                }
                private GgufType _type;
                private ulong _numElems;
                private List<GgufValue> _elems;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public GgufType Type { get { return _type; } }
                public ulong NumElems { get { return _numElems; } }
                public List<GgufValue> Elems { get { return _elems; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufBool : KaitaiStruct
            {
                public static GgufBool FromFile(string fileName)
                {
                    return new GgufBool(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufBool(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    f_value = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _valueRaw = m_io.ReadU1();
                    if (!(_valueRaw <= 1))
                    {
                        throw new ValidationGreaterThanError(1, _valueRaw, m_io, "/types/gguf_body/types/gguf_bool/seq/0");
                    }
                }
                private void _readBE()
                {
                    _valueRaw = m_io.ReadU1();
                    if (!(_valueRaw <= 1))
                    {
                        throw new ValidationGreaterThanError(1, _valueRaw, m_io, "/types/gguf_body/types/gguf_bool/seq/0");
                    }
                }
                private bool f_value;
                private bool _value;

                /// <remarks>
                /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321">Git tag "v0.27.0"</a>
                /// </remarks>
                public bool Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        _value = (bool) (ValueRaw != 0);
                        return _value;
                    }
                }
                private byte _valueRaw;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public byte ValueRaw { get { return _valueRaw; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufFloat32 : KaitaiStruct
            {
                public static GgufFloat32 FromFile(string fileName)
                {
                    return new GgufFloat32(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufFloat32(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadF4le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadF4be();
                }
                private float _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public float Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufFloat64 : KaitaiStruct
            {
                public static GgufFloat64 FromFile(string fileName)
                {
                    return new GgufFloat64(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufFloat64(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadF8le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadF8be();
                }
                private double _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public double Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufInt16 : KaitaiStruct
            {
                public static GgufInt16 FromFile(string fileName)
                {
                    return new GgufInt16(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufInt16(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadS2le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadS2be();
                }
                private short _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public short Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufInt32 : KaitaiStruct
            {
                public static GgufInt32 FromFile(string fileName)
                {
                    return new GgufInt32(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufInt32(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadS4le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadS4be();
                }
                private int _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public int Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufInt64 : KaitaiStruct
            {
                public static GgufInt64 FromFile(string fileName)
                {
                    return new GgufInt64(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufInt64(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadS8le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadS8be();
                }
                private long _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public long Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufInt8 : KaitaiStruct
            {
                public static GgufInt8 FromFile(string fileName)
                {
                    return new GgufInt8(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufInt8(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadS1();
                }
                private void _readBE()
                {
                    _value = m_io.ReadS1();
                }
                private sbyte _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public sbyte Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275">Git tag "v0.27.0"</a>
            /// </remarks>
            public partial class GgufKv : KaitaiStruct
            {
                private bool? m_isLe;
                public GgufKv(uint p_prevAlignment, KaitaiStream p__io, Gguf.GgufBody p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _prevAlignment = p_prevAlignment;
                    f_alignment = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _key = new GgufStr(m_io, this, m_root, m_isLe);
                    {
                        GgufStr M_ = _key;
                        if (!(M_.LenValue != 0))
                        {
                            throw new ValidationExprError(_key, m_io, "/types/gguf_body/types/gguf_kv/seq/0");
                        }
                    }
                    _type = ((Gguf.GgufType) m_io.ReadU4le());
                    if (!Enum.IsDefined(typeof(GgufType), _type))
                    {
                        throw new ValidationNotInEnumError(_type, m_io, "/types/gguf_body/types/gguf_kv/seq/1");
                    }
                    _value = new GgufValue(Type, m_io, this, m_root, m_isLe);
                    {
                        GgufValue M_ = _value;
                        if (!((Key.Value == "general.alignment" ?  ((Type == Gguf.GgufType.Uint32) && (((Gguf.GgufBody.GgufUint32) (M_.Value)).Value != 0) && ((((Gguf.GgufBody.GgufUint32) (M_.Value)).Value & ((Gguf.GgufBody.GgufUint32) (M_.Value)).Value - 1) == 0))  : true)))
                        {
                            throw new ValidationExprError(_value, m_io, "/types/gguf_body/types/gguf_kv/seq/2");
                        }
                    }
                }
                private void _readBE()
                {
                    _key = new GgufStr(m_io, this, m_root, m_isLe);
                    {
                        GgufStr M_ = _key;
                        if (!(M_.LenValue != 0))
                        {
                            throw new ValidationExprError(_key, m_io, "/types/gguf_body/types/gguf_kv/seq/0");
                        }
                    }
                    _type = ((Gguf.GgufType) m_io.ReadU4be());
                    if (!Enum.IsDefined(typeof(GgufType), _type))
                    {
                        throw new ValidationNotInEnumError(_type, m_io, "/types/gguf_body/types/gguf_kv/seq/1");
                    }
                    _value = new GgufValue(Type, m_io, this, m_root, m_isLe);
                    {
                        GgufValue M_ = _value;
                        if (!((Key.Value == "general.alignment" ?  ((Type == Gguf.GgufType.Uint32) && (((Gguf.GgufBody.GgufUint32) (M_.Value)).Value != 0) && ((((Gguf.GgufBody.GgufUint32) (M_.Value)).Value & ((Gguf.GgufBody.GgufUint32) (M_.Value)).Value - 1) == 0))  : true)))
                        {
                            throw new ValidationExprError(_value, m_io, "/types/gguf_body/types/gguf_kv/seq/2");
                        }
                    }
                }
                private bool f_alignment;
                private uint _alignment;
                public uint Alignment
                {
                    get
                    {
                        if (f_alignment)
                            return _alignment;
                        f_alignment = true;
                        _alignment = (uint) ((Key.Value == "general.alignment" ? ((Gguf.GgufBody.GgufUint32) (Value.Value)).Value : PrevAlignment));
                        return _alignment;
                    }
                }
                private GgufStr _key;
                private GgufType _type;
                private GgufValue _value;
                private uint _prevAlignment;
                private Gguf m_root;
                private Gguf.GgufBody m_parent;
                public GgufStr Key { get { return _key; } }
                public GgufType Type { get { return _type; } }
                public GgufValue Value { get { return _value; } }
                public uint PrevAlignment { get { return _prevAlignment; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237">Git tag "v0.27.0"</a>
            /// </remarks>
            public partial class GgufStr : KaitaiStruct
            {
                public static GgufStr FromFile(string fileName)
                {
                    return new GgufStr(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufStr(KaitaiStream p__io, KaitaiStruct p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _lenValue = m_io.ReadU8le();
                    _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenValue));
                }
                private void _readBE()
                {
                    _lenValue = m_io.ReadU8be();
                    _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenValue));
                }
                private ulong _lenValue;
                private string _value;
                private Gguf m_root;
                private KaitaiStruct m_parent;
                public ulong LenValue { get { return _lenValue; } }
                public string Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325">Git tag "v0.27.0"</a>
            /// </remarks>
            public partial class GgufTensorInfo : KaitaiStruct
            {
                private bool? m_isLe;
                public GgufTensorInfo(ulong p_expectedOffset, KaitaiStream p__io, Gguf.GgufBody p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _expectedOffset = p_expectedOffset;
                    f_data = false;
                    f_dumpDims = false;
                    f_expectedNextOffset = false;
                    f_lenBlock = false;
                    f_lenData = false;
                    f_lenPadding = false;
                    f_numBlocks = false;
                    f_numElements = false;
                    f_numElementsPerBlock = false;
                    f_padding = false;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _name = new GgufStr(m_io, this, m_root, m_isLe);
                    {
                        GgufStr M_ = _name;
                        if (!(M_.LenValue < 64))
                        {
                            throw new ValidationExprError(_name, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
                        }
                    }
                    _numDims = m_io.ReadU4le();
                    if (!(_numDims <= 4))
                    {
                        throw new ValidationGreaterThanError(4, _numDims, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
                    }
                    _dims = new List<long>();
                    for (var i = 0; i < NumDims; i++)
                    {
                        _dims.Add(m_io.ReadS8le());
                        if (!(_dims[i] >= 0))
                        {
                            throw new ValidationLessThanError(0, _dims[i], m_io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                        }
                    }
                    _type = ((Gguf.GgmlType) m_io.ReadU4le());
                    {
                        GgmlType M_ = _type;
                        if (!( ((((int) M_) < 43) && (NumElementsPerBlock != 0) && (KaitaiStream.Mod((NumDims > 0 ? Dims[0] : 1), NumElementsPerBlock) == 0)) ))
                        {
                            throw new ValidationExprError(_type, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
                        }
                    }
                    _offset = m_io.ReadU8le();
                    if (!(_offset == ExpectedOffset))
                    {
                        throw new ValidationNotEqualError(ExpectedOffset, _offset, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
                    }
                }
                private void _readBE()
                {
                    _name = new GgufStr(m_io, this, m_root, m_isLe);
                    {
                        GgufStr M_ = _name;
                        if (!(M_.LenValue < 64))
                        {
                            throw new ValidationExprError(_name, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
                        }
                    }
                    _numDims = m_io.ReadU4be();
                    if (!(_numDims <= 4))
                    {
                        throw new ValidationGreaterThanError(4, _numDims, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
                    }
                    _dims = new List<long>();
                    for (var i = 0; i < NumDims; i++)
                    {
                        _dims.Add(m_io.ReadS8be());
                        if (!(_dims[i] >= 0))
                        {
                            throw new ValidationLessThanError(0, _dims[i], m_io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
                        }
                    }
                    _type = ((Gguf.GgmlType) m_io.ReadU4be());
                    {
                        GgmlType M_ = _type;
                        if (!( ((((int) M_) < 43) && (NumElementsPerBlock != 0) && (KaitaiStream.Mod((NumDims > 0 ? Dims[0] : 1), NumElementsPerBlock) == 0)) ))
                        {
                            throw new ValidationExprError(_type, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
                        }
                    }
                    _offset = m_io.ReadU8be();
                    if (!(_offset == ExpectedOffset))
                    {
                        throw new ValidationNotEqualError(ExpectedOffset, _offset, m_io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
                    }
                }
                private bool f_data;
                private byte[] _data;
                public byte[] Data
                {
                    get
                    {
                        if (f_data)
                            return _data;
                        f_data = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(M_Parent.OfsTensorData + Offset);
                        if (m_isLe == true) {
                            _data = m_io.ReadBytes(LenData);
                        } else {
                            _data = m_io.ReadBytes(LenData);
                        }
                        m_io.Seek(_pos);
                        return _data;
                    }
                }
                private bool f_dumpDims;
                private string _dumpDims;

                /// <summary>
                /// `dims` joined with the string `&quot; x &quot;`. This is necessary for
                /// `-webide-representation`, which cannot format `dims` directly -
                /// see &lt;https://github.com/kaitai-io/kaitai_struct_webide/issues/160&gt;.
                /// </summary>
                public string DumpDims
                {
                    get
                    {
                        if (f_dumpDims)
                            return _dumpDims;
                        f_dumpDims = true;
                        _dumpDims = (string) ((((NumDims > 0 ? Dims[0].ToString() : "") + (NumDims > 1 ? " x " + Dims[1].ToString() : "")) + (NumDims > 2 ? " x " + Dims[2].ToString() : "")) + (NumDims > 3 ? " x " + Dims[3].ToString() : ""));
                        return _dumpDims;
                    }
                }
                private bool f_expectedNextOffset;
                private ulong _expectedNextOffset;

                /// <summary>
                /// `offset` that the next tensor must have
                /// </summary>
                public ulong ExpectedNextOffset
                {
                    get
                    {
                        if (f_expectedNextOffset)
                            return _expectedNextOffset;
                        f_expectedNextOffset = true;
                        _expectedNextOffset = (ulong) (((ulong) ((Offset + LenData) + LenPadding)));
                        return _expectedNextOffset;
                    }
                }
                private bool f_lenBlock;
                private int _lenBlock;

                /// <summary>
                /// Size of a block in bytes
                /// </summary>
                public int LenBlock
                {
                    get
                    {
                        if (f_lenBlock)
                            return _lenBlock;
                        f_lenBlock = true;
                        _lenBlock = (int) (new List<int> { 4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18 }[((int) Type)]);
                        return _lenBlock;
                    }
                }
                private bool f_lenData;
                private ulong _lenData;
                public ulong LenData
                {
                    get
                    {
                        if (f_lenData)
                            return _lenData;
                        f_lenData = true;
                        _lenData = (ulong) (((ulong) (LenBlock * NumBlocks)));
                        return _lenData;
                    }
                }
                private bool f_lenPadding;
                private int _lenPadding;

                /// <summary>
                /// Number of padding bytes after the data
                /// </summary>
                public int LenPadding
                {
                    get
                    {
                        if (f_lenPadding)
                            return _lenPadding;
                        f_lenPadding = true;
                        _lenPadding = (int) (KaitaiStream.Mod(M_Parent.Alignment - KaitaiStream.Mod(LenData, M_Parent.Alignment), M_Parent.Alignment));
                        return _lenPadding;
                    }
                }
                private bool f_numBlocks;
                private long _numBlocks;
                public long NumBlocks
                {
                    get
                    {
                        if (f_numBlocks)
                            return _numBlocks;
                        f_numBlocks = true;
                        _numBlocks = (long) (((long) (NumElements / NumElementsPerBlock)));
                        return _numBlocks;
                    }
                }
                private bool f_numElements;
                private long _numElements;
                public long NumElements
                {
                    get
                    {
                        if (f_numElements)
                            return _numElements;
                        f_numElements = true;
                        _numElements = (long) (((long) ((((NumDims > 0 ? Dims[0] : 1) * (NumDims > 1 ? Dims[1] : 1)) * (NumDims > 2 ? Dims[2] : 1)) * (NumDims > 3 ? Dims[3] : 1))));
                        return _numElements;
                    }
                }
                private bool f_numElementsPerBlock;
                private int _numElementsPerBlock;

                /// <summary>
                /// Number of elements in a block
                /// </summary>
                public int NumElementsPerBlock
                {
                    get
                    {
                        if (f_numElementsPerBlock)
                            return _numElementsPerBlock;
                        f_numElementsPerBlock = true;
                        _numElementsPerBlock = (int) (new List<int> { 1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64 }[((int) Type)]);
                        return _numElementsPerBlock;
                    }
                }
                private bool f_padding;
                private byte[] _padding;

                /// <summary>
                /// Padding after the data. ggml requires it even after the last tensor
                /// when reading the tensor data.
                /// </summary>
                /// <remarks>
                /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893">Git tag "v0.27.0"</a>
                /// </remarks>
                public byte[] Padding
                {
                    get
                    {
                        if (f_padding)
                            return _padding;
                        f_padding = true;
                        long _pos = m_io.Pos;
                        m_io.Seek((M_Parent.OfsTensorData + Offset) + LenData);
                        if (m_isLe == true) {
                            _padding = m_io.ReadBytes(LenPadding);
                        } else {
                            _padding = m_io.ReadBytes(LenPadding);
                        }
                        m_io.Seek(_pos);
                        return _padding;
                    }
                }
                private GgufStr _name;
                private uint _numDims;
                private List<long> _dims;
                private GgmlType _type;
                private ulong _offset;
                private ulong _expectedOffset;
                private Gguf m_root;
                private Gguf.GgufBody m_parent;
                public GgufStr Name { get { return _name; } }
                public uint NumDims { get { return _numDims; } }
                public List<long> Dims { get { return _dims; } }
                public GgmlType Type { get { return _type; } }

                /// <summary>
                /// Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
                /// </summary>
                public ulong Offset { get { return _offset; } }
                public ulong ExpectedOffset { get { return _expectedOffset; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody M_Parent { get { return m_parent; } }
            }
            public partial class GgufUint16 : KaitaiStruct
            {
                public static GgufUint16 FromFile(string fileName)
                {
                    return new GgufUint16(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufUint16(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadU2le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadU2be();
                }
                private ushort _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public ushort Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufUint32 : KaitaiStruct
            {
                public static GgufUint32 FromFile(string fileName)
                {
                    return new GgufUint32(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufUint32(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadU4le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadU4be();
                }
                private uint _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public uint Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufUint64 : KaitaiStruct
            {
                public static GgufUint64 FromFile(string fileName)
                {
                    return new GgufUint64(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufUint64(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadU8le();
                }
                private void _readBE()
                {
                    _value = m_io.ReadU8be();
                }
                private ulong _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public ulong Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }
            public partial class GgufUint8 : KaitaiStruct
            {
                public static GgufUint8 FromFile(string fileName)
                {
                    return new GgufUint8(new KaitaiStream(fileName));
                }

                private bool? m_isLe;
                public GgufUint8(KaitaiStream p__io, Gguf.GgufBody.GgufValue p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    _value = m_io.ReadU1();
                }
                private void _readBE()
                {
                    _value = m_io.ReadU1();
                }
                private byte _value;
                private Gguf m_root;
                private Gguf.GgufBody.GgufValue m_parent;
                public byte Value { get { return _value; } }
                public Gguf M_Root { get { return m_root; } }
                public Gguf.GgufBody.GgufValue M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260">Git tag "v0.27.0"</a>
            /// </remarks>
            public partial class GgufValue : KaitaiStruct
            {
                private bool? m_isLe;
                public GgufValue(GgufType p_type, KaitaiStream p__io, KaitaiStruct p__parent = null, Gguf p__root = null, bool? isLe = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    m_isLe = isLe;
                    _type = p_type;
                    _read();
                }
                private void _read()
                {

                    if (m_isLe == null) {
                        throw new UndecidedEndiannessError();
                    } else if (m_isLe == true) {
                        _readLE();
                    } else {
                        _readBE();
                    }
                }
                private void _readLE()
                {
                    switch (Type) {
                    case Gguf.GgufType.Array: {
                        _value = new GgufArray(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Bool: {
                        _value = new GgufBool(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Float32: {
                        _value = new GgufFloat32(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Float64: {
                        _value = new GgufFloat64(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int16: {
                        _value = new GgufInt16(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int32: {
                        _value = new GgufInt32(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int64: {
                        _value = new GgufInt64(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int8: {
                        _value = new GgufInt8(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.String: {
                        _value = new GgufStr(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint16: {
                        _value = new GgufUint16(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint32: {
                        _value = new GgufUint32(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint64: {
                        _value = new GgufUint64(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint8: {
                        _value = new GgufUint8(m_io, this, m_root, m_isLe);
                        break;
                    }
                    }
                }
                private void _readBE()
                {
                    switch (Type) {
                    case Gguf.GgufType.Array: {
                        _value = new GgufArray(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Bool: {
                        _value = new GgufBool(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Float32: {
                        _value = new GgufFloat32(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Float64: {
                        _value = new GgufFloat64(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int16: {
                        _value = new GgufInt16(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int32: {
                        _value = new GgufInt32(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int64: {
                        _value = new GgufInt64(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Int8: {
                        _value = new GgufInt8(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.String: {
                        _value = new GgufStr(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint16: {
                        _value = new GgufUint16(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint32: {
                        _value = new GgufUint32(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint64: {
                        _value = new GgufUint64(m_io, this, m_root, m_isLe);
                        break;
                    }
                    case Gguf.GgufType.Uint8: {
                        _value = new GgufUint8(m_io, this, m_root, m_isLe);
                        break;
                    }
                    }
                }
                private KaitaiStruct _value;
                private GgufType _type;
                private Gguf m_root;
                private KaitaiStruct m_parent;
                public KaitaiStruct Value { get { return _value; } }
                public GgufType Type { get { return _type; } }
                public Gguf M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            private bool f_alignment;
            private uint _alignment;

            /// <summary>
            /// Global alignment - from the `general.alignment` key, or 32 if there's no
            /// such key.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630">Git tag "v0.27.0"</a>
            /// </remarks>
            public uint Alignment
            {
                get
                {
                    if (f_alignment)
                        return _alignment;
                    f_alignment = true;
                    _alignment = (uint) ((KvPairs.Count != 0 ? KvPairs[KvPairs.Count - 1].Alignment : 32));
                    return _alignment;
                }
            }
            private bool f_ofsTensorData;
            private ulong _ofsTensorData;

            /// <summary>
            /// Offset of the tensor data. Each tensor's `offset` is relative to this
            /// position.
            /// </summary>
            public ulong OfsTensorData
            {
                get
                {
                    if (f_ofsTensorData)
                        return _ofsTensorData;
                    f_ofsTensorData = true;
                    _ofsTensorData = (ulong) (((ulong) (M_Io.Pos)));
                    return _ofsTensorData;
                }
            }
            private uint _version;
            private ulong _numTensorInfos;
            private ulong _numKvPairs;
            private List<GgufKv> _kvPairs;
            private List<GgufTensorInfo> _tensorInfos;
            private byte[] _padding;
            private byte[] __unnamed6;
            private Gguf m_root;
            private Gguf m_parent;

            /// <summary>
            /// File format version. Version 1 used 32-bit counts and lengths, which
            /// this Kaitai Struct implementation doesn't support, and neither does
            /// ggml.
            /// </summary>
            public uint Version { get { return _version; } }

            /// <summary>
            /// The number of tensors in the file
            /// </summary>
            public ulong NumTensorInfos { get { return _numTensorInfos; } }

            /// <summary>
            /// The number of key-value pairs in the file header
            /// </summary>
            public ulong NumKvPairs { get { return _numKvPairs; } }

            /// <summary>
            /// Key-value pairs. ggml (v0.27.0)
            /// [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
            /// duplicate keys, but this Kaitai Struct implementation can't detect
            /// them. If there are multiple `general.alignment` keys, the last one is
            /// used for the `alignment` value instance.
            /// </summary>
            public List<GgufKv> KvPairs { get { return _kvPairs; } }

            /// <summary>
            /// Tensor metadata. ggml (v0.27.0)
            /// [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
            /// duplicate tensor names, but this Kaitai Struct implementation can't
            /// detect them.
            /// </summary>
            public List<GgufTensorInfo> TensorInfos { get { return _tensorInfos; } }

            /// <remarks>
            /// Reference: <a href="https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785">Git tag "v0.27.0"</a>
            /// </remarks>
            public byte[] Padding { get { return _padding; } }
            public byte[] Unnamed_6 { get { return __unnamed6; } }
            public Gguf M_Root { get { return m_root; } }
            public Gguf M_Parent { get { return m_parent; } }
        }
        private bool f_isBigEndian;
        private bool _isBigEndian;
        public bool IsBigEndian
        {
            get
            {
                if (f_isBigEndian)
                    return _isBigEndian;
                f_isBigEndian = true;
                _isBigEndian = (bool) ((VersionLe & 65535) == 0);
                return _isBigEndian;
            }
        }
        private bool f_lenFile;
        private ulong _lenFile;

        /// <summary>
        /// Length of the file (computed from the header), including the padding after
        /// the last tensor's data.
        /// 
        /// This Kaitai Struct implementation stops parsing where the tensor data
        /// starts (which is read lazily, i.e. only on demand). Without reading the
        /// tensor data, you can use this expected file size to check whether the file
        /// has been truncated, to carve the file out of a larger one, etc.
        /// </summary>
        public ulong LenFile
        {
            get
            {
                if (f_lenFile)
                    return _lenFile;
                f_lenFile = true;
                _lenFile = (ulong) (((ulong) (Body.OfsTensorData + (Body.NumTensorInfos != 0 ? Body.TensorInfos[Body.TensorInfos.Count - 1].ExpectedNextOffset : 0))));
                return _lenFile;
            }
        }
        private bool f_versionLe;
        private uint _versionLe;
        public uint VersionLe
        {
            get
            {
                if (f_versionLe)
                    return _versionLe;
                f_versionLe = true;
                long _pos = m_io.Pos;
                m_io.Seek(4);
                _versionLe = m_io.ReadU4le();
                m_io.Seek(_pos);
                return _versionLe;
            }
        }
        private byte[] _magic;
        private GgufBody _body;
        private Gguf m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// GGUF file magic
        /// </summary>
        public byte[] Magic { get { return _magic; } }
        public GgufBody Body { get { return _body; } }
        public Gguf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
