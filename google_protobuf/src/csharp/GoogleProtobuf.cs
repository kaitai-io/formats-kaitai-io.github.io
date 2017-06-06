// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Google Protocol Buffers (AKA protobuf) is a popular data
    /// serialization scheme used for communication protocols, data storage,
    /// etc. There are implementations are available for almost every
    /// popular language. The focus points of this scheme are brevity (data
    /// is encoded in a very size-efficient manner) and extensibility (one
    /// can add keys to the structure, while keeping it readable in previous
    /// version of software).
    /// 
    /// Protobuf uses semi-self-describing encoding scheme for its
    /// messages. It means that it is possible to parse overall structure of
    /// the message (skipping over fields one can't understand), but to
    /// fully understand the message, one needs a protocol definition file
    /// (`.proto`). To be specific:
    /// 
    /// * &quot;Keys&quot; in key-value pairs provided in the message are identified
    ///   only with an integer &quot;field tag&quot;. `.proto` file provides info on
    ///   which symbolic field names these field tags map to.
    /// * &quot;Keys&quot; also provide something called &quot;wire type&quot;. It's not a data
    ///   type in its common sense (i.e. you can't, for example, distinguish
    ///   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
    ///   it's enough information to determine how many bytes to
    ///   parse. Interpretation of the value should be done according to the
    ///   type specified in `.proto` file.
    /// * There's no direct information on which fields are optional /
    ///   required, which fields may be repeated or constitute a map, what
    ///   restrictions are placed on fields usage in a single message, what
    ///   are the fields' default values, etc, etc.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://developers.google.com/protocol-buffers/docs/encoding">Source</a>
    /// </remarks>
    public partial class GoogleProtobuf : KaitaiStruct
    {
        public static GoogleProtobuf FromFile(string fileName)
        {
            return new GoogleProtobuf(new KaitaiStream(fileName));
        }

        public GoogleProtobuf(KaitaiStream io, KaitaiStruct parent = null, GoogleProtobuf root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _pairs = new List<Pair>();
            while (!m_io.IsEof) {
                _pairs.Add(new Pair(m_io, this, m_root));
            }
            }

        /// <summary>
        /// Key-value pair
        /// </summary>
        public partial class Pair : KaitaiStruct
        {
            public static Pair FromFile(string fileName)
            {
                return new Pair(new KaitaiStream(fileName));
            }

            public enum WireTypes
            {
                Varint = 0,
                Bit64 = 1,
                LenDelimited = 2,
                GroupStart = 3,
                GroupEnd = 4,
                Bit32 = 5,
            }

            public Pair(KaitaiStream io, GoogleProtobuf parent = null, GoogleProtobuf root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_wireType = false;
                f_fieldTag = false;
                _read();
            }
            private void _read() {
                _key = new VlqBase128Le(m_io);
                switch (WireType) {
                case WireTypes.Varint: {
                    _value = new VlqBase128Le(m_io);
                    break;
                }
                case WireTypes.LenDelimited: {
                    _value = new DelimitedBytes(m_io, this, m_root);
                    break;
                }
                case WireTypes.Bit64: {
                    _value = m_io.ReadU8le();
                    break;
                }
                case WireTypes.Bit32: {
                    _value = m_io.ReadU4le();
                    break;
                }
                }
                }
            private bool f_wireType;
            private WireTypes _wireType;

            /// <summary>
            /// &quot;Wire type&quot; is a part of the &quot;key&quot; that carries enough
            /// information to parse value from the wire, i.e. read correct
            /// amount of bytes, but there's not enough informaton to
            /// interprete in unambiguously. For example, one can't clearly
            /// distinguish 64-bit fixed-sized integers from 64-bit floats,
            /// signed zigzag-encoded varints from regular unsigned varints,
            /// arbitrary bytes from UTF-8 encoded strings, etc.
            /// </summary>
            public WireTypes WireType
            {
                get
                {
                    if (f_wireType)
                        return _wireType;
                    _wireType = (WireTypes) (((WireTypes) (Key.Value & 7)));
                    f_wireType = true;
                    return _wireType;
                }
            }
            private bool f_fieldTag;
            private int _fieldTag;

            /// <summary>
            /// Identifies a field of protocol. One can look up symbolic
            /// field name in a `.proto` file by this field tag.
            /// </summary>
            public int FieldTag
            {
                get
                {
                    if (f_fieldTag)
                        return _fieldTag;
                    _fieldTag = (int) ((Key.Value >> 3));
                    f_fieldTag = true;
                    return _fieldTag;
                }
            }
            private VlqBase128Le _key;
            private object _value;
            private GoogleProtobuf m_root;
            private GoogleProtobuf m_parent;

            /// <summary>
            /// Key is a bit-mapped variable-length integer: lower 3 bits
            /// are used for &quot;wire type&quot;, and everything higher designates
            /// an integer &quot;field tag&quot;.
            /// </summary>
            public VlqBase128Le Key { get { return _key; } }

            /// <summary>
            /// Value that corresponds to field identified by
            /// `field_tag`. Type is determined approximately: there is
            /// enough information to parse it unambiguously from a stream,
            /// but further infromation from `.proto` file is required to
            /// interprete it properly.
            /// </summary>
            public object Value { get { return _value; } }
            public GoogleProtobuf M_Root { get { return m_root; } }
            public GoogleProtobuf M_Parent { get { return m_parent; } }
        }
        public partial class DelimitedBytes : KaitaiStruct
        {
            public static DelimitedBytes FromFile(string fileName)
            {
                return new DelimitedBytes(new KaitaiStream(fileName));
            }

            public DelimitedBytes(KaitaiStream io, GoogleProtobuf.Pair parent = null, GoogleProtobuf root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _len = new VlqBase128Le(m_io);
                _body = m_io.ReadBytes(Len.Value);
                }
            private VlqBase128Le _len;
            private byte[] _body;
            private GoogleProtobuf m_root;
            private GoogleProtobuf.Pair m_parent;
            public VlqBase128Le Len { get { return _len; } }
            public byte[] Body { get { return _body; } }
            public GoogleProtobuf M_Root { get { return m_root; } }
            public GoogleProtobuf.Pair M_Parent { get { return m_parent; } }
        }
        private List<Pair> _pairs;
        private GoogleProtobuf m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Key-value pairs which constitute a message
        /// </summary>
        public List<Pair> Pairs { get { return _pairs; } }
        public GoogleProtobuf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
