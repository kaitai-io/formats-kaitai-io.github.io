// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;
using System;

namespace Kaitai
{

    /// <summary>
    /// A serialized PHP value, in the format used by PHP's built-in `serialize` and
    /// `unserialize` functions. This format closely mirrors PHP's data model:
    /// it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
    /// associative arrays, objects, and recursive data structures using references.
    /// The only PHP values not supported by this format are *resources*,
    /// which usually correspond to native file or connection handles and cannot be
    /// meaningfully serialized.
    /// 
    /// There is no official documentation for this data format;
    /// this spec was created based on the PHP source code and the behavior of
    /// `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
    /// serialized data between PHP versions, but in practice, the format has
    /// remained fully backwards-compatible - values serialized by an older
    /// PHP version can be unserialized on any newer PHP version.
    /// This spec supports serialized values from PHP 7.3 or any earlier version.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.php.net/manual/en/function.serialize.php">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://www.php.net/manual/en/function.serialize.php#66147">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://www.php.net/manual/en/function.unserialize.php">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822">Source</a>
    /// </remarks>
    public partial class PhpSerializedValue : KaitaiStruct
    {
        public static PhpSerializedValue FromFile(string fileName)
        {
            return new PhpSerializedValue(new KaitaiStream(fileName));
        }


        public enum BoolValue
        {
            False = 48,
            True = 49,
        }

        public enum ValueType
        {
            CustomSerializedObject = 67,
            Null = 78,
            Object = 79,
            VariableReference = 82,
            Php6String = 83,
            Array = 97,
            Bool = 98,
            Float = 100,
            Int = 105,
            Php3Object = 111,
            ObjectReference = 114,
            String = 115,
        }
        public PhpSerializedValue(KaitaiStream p__io, KaitaiStruct p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _type = ((ValueType) m_io.ReadU1());
            switch (Type) {
            case ValueType.Array: {
                _contents = new ArrayContents(m_io, this, m_root);
                break;
            }
            case ValueType.Bool: {
                _contents = new BoolContents(m_io, this, m_root);
                break;
            }
            case ValueType.CustomSerializedObject: {
                _contents = new CustomSerializedObjectContents(m_io, this, m_root);
                break;
            }
            case ValueType.Float: {
                _contents = new FloatContents(m_io, this, m_root);
                break;
            }
            case ValueType.Int: {
                _contents = new IntContents(m_io, this, m_root);
                break;
            }
            case ValueType.Null: {
                _contents = new NullContents(m_io, this, m_root);
                break;
            }
            case ValueType.Object: {
                _contents = new ObjectContents(m_io, this, m_root);
                break;
            }
            case ValueType.ObjectReference: {
                _contents = new IntContents(m_io, this, m_root);
                break;
            }
            case ValueType.Php3Object: {
                _contents = new Php3ObjectContents(m_io, this, m_root);
                break;
            }
            case ValueType.Php6String: {
                _contents = new StringContents(m_io, this, m_root);
                break;
            }
            case ValueType.String: {
                _contents = new StringContents(m_io, this, m_root);
                break;
            }
            case ValueType.VariableReference: {
                _contents = new IntContents(m_io, this, m_root);
                break;
            }
            }
        }

        /// <summary>
        /// The contents of an array value.
        /// </summary>
        public partial class ArrayContents : KaitaiStruct
        {
            public static ArrayContents FromFile(string fileName)
            {
                return new ArrayContents(new KaitaiStream(fileName));
            }

            public ArrayContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon, m_io, "/types/array_contents/seq/0");
                }
                _elements = new CountPrefixedMapping(m_io, this, m_root);
            }
            private byte[] _colon;
            private CountPrefixedMapping _elements;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon { get { return _colon; } }

            /// <summary>
            /// The array's elements. Keys must be of type `int` or `string`,
            /// values may have any type.
            /// </summary>
            public CountPrefixedMapping Elements { get { return _elements; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of a boolean value (`value_type::bool`).
        /// </summary>
        public partial class BoolContents : KaitaiStruct
        {
            public static BoolContents FromFile(string fileName)
            {
                return new BoolContents(new KaitaiStream(fileName));
            }

            public BoolContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _colon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon, m_io, "/types/bool_contents/seq/0");
                }
                _valueDec = ((PhpSerializedValue.BoolValue) m_io.ReadU1());
                _semicolon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_semicolon, new byte[] { 59 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 59 }, _semicolon, m_io, "/types/bool_contents/seq/2");
                }
            }
            private bool f_value;
            private bool _value;

            /// <summary>
            /// The value of the `bool`, parsed as a boolean.
            /// </summary>
            public bool Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (bool) (ValueDec == PhpSerializedValue.BoolValue.True);
                    return _value;
                }
            }
            private byte[] _colon;
            private BoolValue _valueDec;
            private byte[] _semicolon;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon { get { return _colon; } }

            /// <summary>
            /// The value of the `bool`: `0` for `false` or `1` for `true`.
            /// </summary>
            public BoolValue ValueDec { get { return _valueDec; } }
            public byte[] Semicolon { get { return _semicolon; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A mapping (a sequence of key-value pairs) prefixed with its size.
        /// </summary>
        public partial class CountPrefixedMapping : KaitaiStruct
        {
            public static CountPrefixedMapping FromFile(string fileName)
            {
                return new CountPrefixedMapping(new KaitaiStream(fileName));
            }

            public CountPrefixedMapping(KaitaiStream p__io, KaitaiStruct p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numEntries = false;
                _read();
            }
            private void _read()
            {
                _numEntriesDec = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(58, false, true, true));
                _openingBrace = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_openingBrace, new byte[] { 123 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 123 }, _openingBrace, m_io, "/types/count_prefixed_mapping/seq/1");
                }
                _entries = new List<MappingEntry>();
                for (var i = 0; i < NumEntries; i++)
                {
                    _entries.Add(new MappingEntry(m_io, this, m_root));
                }
                _closingBrace = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_closingBrace, new byte[] { 125 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 125 }, _closingBrace, m_io, "/types/count_prefixed_mapping/seq/3");
                }
            }
            private bool f_numEntries;
            private int _numEntries;

            /// <summary>
            /// The number of key-value pairs in the mapping, parsed as an integer.
            /// </summary>
            public int NumEntries
            {
                get
                {
                    if (f_numEntries)
                        return _numEntries;
                    f_numEntries = true;
                    _numEntries = (int) (Convert.ToInt64(NumEntriesDec, 10));
                    return _numEntries;
                }
            }
            private string _numEntriesDec;
            private byte[] _openingBrace;
            private List<MappingEntry> _entries;
            private byte[] _closingBrace;
            private PhpSerializedValue m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// The number of key-value pairs in the mapping, in ASCII decimal.
            /// </summary>
            public string NumEntriesDec { get { return _numEntriesDec; } }
            public byte[] OpeningBrace { get { return _openingBrace; } }

            /// <summary>
            /// The key-value pairs contained in the mapping.
            /// </summary>
            public List<MappingEntry> Entries { get { return _entries; } }
            public byte[] ClosingBrace { get { return _closingBrace; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of an object value that implements a custom
        /// serialized format using `Serializable`.
        /// </summary>
        public partial class CustomSerializedObjectContents : KaitaiStruct
        {
            public static CustomSerializedObjectContents FromFile(string fileName)
            {
                return new CustomSerializedObjectContents(new KaitaiStream(fileName));
            }

            public CustomSerializedObjectContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenData = false;
                _read();
            }
            private void _read()
            {
                _colon1 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon1, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon1, m_io, "/types/custom_serialized_object_contents/seq/0");
                }
                _className = new LengthPrefixedQuotedString(m_io, this, m_root);
                _colon2 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon2, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon2, m_io, "/types/custom_serialized_object_contents/seq/2");
                }
                _lenDataDec = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(58, false, true, true));
                _openingBrace = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_openingBrace, new byte[] { 123 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 123 }, _openingBrace, m_io, "/types/custom_serialized_object_contents/seq/4");
                }
                _data = m_io.ReadBytes(LenData);
                _closingQuote = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_closingQuote, new byte[] { 125 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 125 }, _closingQuote, m_io, "/types/custom_serialized_object_contents/seq/6");
                }
            }
            private bool f_lenData;
            private int _lenData;

            /// <summary>
            /// The length of the serialized data in bytes, parsed as an integer.
            /// The braces are not counted in this length number.
            /// </summary>
            public int LenData
            {
                get
                {
                    if (f_lenData)
                        return _lenData;
                    f_lenData = true;
                    _lenData = (int) (Convert.ToInt64(LenDataDec, 10));
                    return _lenData;
                }
            }
            private byte[] _colon1;
            private LengthPrefixedQuotedString _className;
            private byte[] _colon2;
            private string _lenDataDec;
            private byte[] _openingBrace;
            private byte[] _data;
            private byte[] _closingQuote;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon1 { get { return _colon1; } }

            /// <summary>
            /// The name of the object's class.
            /// </summary>
            public LengthPrefixedQuotedString ClassName { get { return _className; } }
            public byte[] Colon2 { get { return _colon2; } }

            /// <summary>
            /// The length of the serialized data in bytes, in ASCII decimal.
            /// The braces are not counted in this size number.
            /// </summary>
            public string LenDataDec { get { return _lenDataDec; } }
            public byte[] OpeningBrace { get { return _openingBrace; } }

            /// <summary>
            /// The custom serialized data. The braces are not included.
            /// 
            /// Although the surrounding braces make it look like a regular
            /// serialized object, this field is actually more similar to a string:
            /// it can contain arbitrary data that is not required to follow
            /// any common structure.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public byte[] ClosingQuote { get { return _closingQuote; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of a floating-point value.
        /// </summary>
        public partial class FloatContents : KaitaiStruct
        {
            public static FloatContents FromFile(string fileName)
            {
                return new FloatContents(new KaitaiStream(fileName));
            }

            public FloatContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon, m_io, "/types/float_contents/seq/0");
                }
                _valueDec = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(59, false, true, true));
            }
            private byte[] _colon;
            private string _valueDec;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon { get { return _colon; } }

            /// <summary>
            /// The value of the `float`, in ASCII decimal, as generated by PHP's
            /// usual double-to-string conversion. In particular, this means that:
            /// 
            /// * A decimal point may not be included (for integral numbers)
            /// * The number may use exponent notation (e. g. `1.0E+16`)
            /// * Positive and negative infinity are represented as `INF`
            ///   and `-INF`, respectively
            /// * Not-a-number is represented as `NAN`
            /// </summary>
            public string ValueDec { get { return _valueDec; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of an integer-like value:
        /// either an actual integer (`value_type::int`) or a reference
        /// (`value_type::variable_reference`, `value_type::object_reference`).
        /// </summary>
        public partial class IntContents : KaitaiStruct
        {
            public static IntContents FromFile(string fileName)
            {
                return new IntContents(new KaitaiStream(fileName));
            }

            public IntContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _colon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon, m_io, "/types/int_contents/seq/0");
                }
                _valueDec = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(59, false, true, true));
            }
            private bool f_value;
            private int _value;

            /// <summary>
            /// The value of the `int`, parsed as an integer.
            /// </summary>
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (int) (Convert.ToInt64(ValueDec, 10));
                    return _value;
                }
            }
            private byte[] _colon;
            private string _valueDec;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon { get { return _colon; } }

            /// <summary>
            /// The value of the `int`, in ASCII decimal.
            /// </summary>
            public string ValueDec { get { return _valueDec; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A quoted string prefixed with its length.
        /// 
        /// Despite the quotes surrounding the string data, it can contain
        /// arbitrary bytes, which are never escaped in any way.
        /// This does not cause any ambiguities when parsing - the bounds of
        /// the string are determined only by the length field, not by the quotes.
        /// </summary>
        public partial class LengthPrefixedQuotedString : KaitaiStruct
        {
            public static LengthPrefixedQuotedString FromFile(string fileName)
            {
                return new LengthPrefixedQuotedString(new KaitaiStream(fileName));
            }

            public LengthPrefixedQuotedString(KaitaiStream p__io, KaitaiStruct p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenData = false;
                _read();
            }
            private void _read()
            {
                _lenDataDec = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(58, false, true, true));
                _openingQuote = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_openingQuote, new byte[] { 34 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 34 }, _openingQuote, m_io, "/types/length_prefixed_quoted_string/seq/1");
                }
                _data = m_io.ReadBytes(LenData);
                _closingQuote = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_closingQuote, new byte[] { 34 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 34 }, _closingQuote, m_io, "/types/length_prefixed_quoted_string/seq/3");
                }
            }
            private bool f_lenData;
            private int _lenData;

            /// <summary>
            /// The length of the string's contents in bytes, parsed as an integer.
            /// The quotes are not counted in this size number.
            /// </summary>
            public int LenData
            {
                get
                {
                    if (f_lenData)
                        return _lenData;
                    f_lenData = true;
                    _lenData = (int) (Convert.ToInt64(LenDataDec, 10));
                    return _lenData;
                }
            }
            private string _lenDataDec;
            private byte[] _openingQuote;
            private byte[] _data;
            private byte[] _closingQuote;
            private PhpSerializedValue m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// The length of the string's data in bytes, in ASCII decimal.
            /// The quotes are not counted in this length number.
            /// </summary>
            public string LenDataDec { get { return _lenDataDec; } }
            public byte[] OpeningQuote { get { return _openingQuote; } }

            /// <summary>
            /// The data contained in the string. The quotes are not included.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public byte[] ClosingQuote { get { return _closingQuote; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// A mapping entry consisting of a key and a value.
        /// </summary>
        public partial class MappingEntry : KaitaiStruct
        {
            public static MappingEntry FromFile(string fileName)
            {
                return new MappingEntry(new KaitaiStream(fileName));
            }

            public MappingEntry(KaitaiStream p__io, PhpSerializedValue.CountPrefixedMapping p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _key = new PhpSerializedValue(m_io, this, m_root);
                _value = new PhpSerializedValue(m_io, this, m_root);
            }
            private PhpSerializedValue _key;
            private PhpSerializedValue _value;
            private PhpSerializedValue m_root;
            private PhpSerializedValue.CountPrefixedMapping m_parent;

            /// <summary>
            /// The key of the entry.
            /// </summary>
            public PhpSerializedValue Key { get { return _key; } }

            /// <summary>
            /// The value of the entry.
            /// </summary>
            public PhpSerializedValue Value { get { return _value; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue.CountPrefixedMapping M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of a null value (`value_type::null`). This structure
        /// contains no actual data, since there is only a single `NULL` value.
        /// </summary>
        public partial class NullContents : KaitaiStruct
        {
            public static NullContents FromFile(string fileName)
            {
                return new NullContents(new KaitaiStream(fileName));
            }

            public NullContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _semicolon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_semicolon, new byte[] { 59 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 59 }, _semicolon, m_io, "/types/null_contents/seq/0");
                }
            }
            private byte[] _semicolon;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Semicolon { get { return _semicolon; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of an object value serialized in the default format.
        /// Unlike its PHP 3 counterpart, it contains a class name.
        /// </summary>
        public partial class ObjectContents : KaitaiStruct
        {
            public static ObjectContents FromFile(string fileName)
            {
                return new ObjectContents(new KaitaiStream(fileName));
            }

            public ObjectContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colon1 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon1, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon1, m_io, "/types/object_contents/seq/0");
                }
                _className = new LengthPrefixedQuotedString(m_io, this, m_root);
                _colon2 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon2, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon2, m_io, "/types/object_contents/seq/2");
                }
                _properties = new CountPrefixedMapping(m_io, this, m_root);
            }
            private byte[] _colon1;
            private LengthPrefixedQuotedString _className;
            private byte[] _colon2;
            private CountPrefixedMapping _properties;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon1 { get { return _colon1; } }

            /// <summary>
            /// The name of the object's class.
            /// </summary>
            public LengthPrefixedQuotedString ClassName { get { return _className; } }
            public byte[] Colon2 { get { return _colon2; } }

            /// <summary>
            /// The object's properties. Keys ust be of type `string`,
            /// values may have any type.
            /// </summary>
            public CountPrefixedMapping Properties { get { return _properties; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
        /// and above, it does not contain a class name.
        /// </summary>
        public partial class Php3ObjectContents : KaitaiStruct
        {
            public static Php3ObjectContents FromFile(string fileName)
            {
                return new Php3ObjectContents(new KaitaiStream(fileName));
            }

            public Php3ObjectContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _colon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon, m_io, "/types/php_3_object_contents/seq/0");
                }
                _properties = new CountPrefixedMapping(m_io, this, m_root);
            }
            private byte[] _colon;
            private CountPrefixedMapping _properties;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon { get { return _colon; } }

            /// <summary>
            /// The object's properties. Keys must be of type `string`,
            /// values may have any type.
            /// </summary>
            public CountPrefixedMapping Properties { get { return _properties; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The contents of a string value.
        /// 
        /// Note: PHP strings can contain arbitrary byte sequences.
        /// They are not necessarily valid text in any specific encoding.
        /// </summary>
        public partial class StringContents : KaitaiStruct
        {
            public static StringContents FromFile(string fileName)
            {
                return new StringContents(new KaitaiStream(fileName));
            }

            public StringContents(KaitaiStream p__io, PhpSerializedValue p__parent = null, PhpSerializedValue p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _colon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_colon, new byte[] { 58 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 58 }, _colon, m_io, "/types/string_contents/seq/0");
                }
                _string = new LengthPrefixedQuotedString(m_io, this, m_root);
                _semicolon = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_semicolon, new byte[] { 59 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 59 }, _semicolon, m_io, "/types/string_contents/seq/2");
                }
            }
            private bool f_value;
            private byte[] _value;

            /// <summary>
            /// The value of the string, as a byte array.
            /// </summary>
            public byte[] Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (byte[]) (String.Data);
                    return _value;
                }
            }
            private byte[] _colon;
            private LengthPrefixedQuotedString _string;
            private byte[] _semicolon;
            private PhpSerializedValue m_root;
            private PhpSerializedValue m_parent;
            public byte[] Colon { get { return _colon; } }
            public LengthPrefixedQuotedString String { get { return _string; } }
            public byte[] Semicolon { get { return _semicolon; } }
            public PhpSerializedValue M_Root { get { return m_root; } }
            public PhpSerializedValue M_Parent { get { return m_parent; } }
        }
        private ValueType _type;
        private KaitaiStruct _contents;
        private PhpSerializedValue m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// A single-character code indicating the type of the serialized value.
        /// </summary>
        public ValueType Type { get { return _type; } }

        /// <summary>
        /// The contents of the serialized value, which vary depending on the type.
        /// </summary>
        public KaitaiStruct Contents { get { return _contents; } }
        public PhpSerializedValue M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
