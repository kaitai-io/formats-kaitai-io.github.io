// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// The WebSocket protocol establishes a two-way communication channel via TCP.
    /// Messages are made up of one or more dataframes, and are delineated by
    /// frames with the `fin` bit set.
    /// </summary>
    public partial class Websocket : KaitaiStruct
    {
        public static Websocket FromFile(string fileName)
        {
            return new Websocket(new KaitaiStream(fileName));
        }


        public enum Opcode
        {
            Continuation = 0,
            Text = 1,
            Binary = 2,
            Reserved3 = 3,
            Reserved4 = 4,
            Reserved5 = 5,
            Reserved6 = 6,
            Reserved7 = 7,
            Close = 8,
            Ping = 9,
            Pong = 10,
            ReservedControlB = 11,
            ReservedControlC = 12,
            ReservedControlD = 13,
            ReservedControlE = 14,
            ReservedControlF = 15,
        }
        public Websocket(KaitaiStream p__io, KaitaiStruct p__parent = null, Websocket p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _dataframes = new List<Dataframe>();
            {
                var i = 0;
                Dataframe M_;
                do {
                    M_ = new Dataframe(m_io, this, m_root);
                    _dataframes.Add(M_);
                    i++;
                } while (!(M_.Finished));
            }
        }
        public partial class Dataframe : KaitaiStruct
        {
            public static Dataframe FromFile(string fileName)
            {
                return new Dataframe(new KaitaiStream(fileName));
            }

            public Dataframe(KaitaiStream p__io, Websocket p__parent = null, Websocket p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_lenPayload = false;
                _read();
            }
            private void _read()
            {
                _finished = m_io.ReadBitsInt(1) != 0;
                _reserved = m_io.ReadBitsInt(3);
                _opcode = ((Websocket.Opcode) m_io.ReadBitsInt(4));
                _isMasked = m_io.ReadBitsInt(1) != 0;
                _lenPayloadPrimary = m_io.ReadBitsInt(7);
                m_io.AlignToByte();
                if (LenPayloadPrimary == 126) {
                    _lenPayloadExtended1 = m_io.ReadU2be();
                }
                if (LenPayloadPrimary == 127) {
                    _lenPayloadExtended2 = m_io.ReadU4be();
                }
                if (IsMasked) {
                    _maskKey = m_io.ReadU4be();
                }
                if (M_Root.Dataframes[0].Opcode != Websocket.Opcode.Text) {
                    _payloadBytes = m_io.ReadBytes(LenPayload);
                }
                if (M_Root.Dataframes[0].Opcode == Websocket.Opcode.Text) {
                    _payloadText = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenPayload));
                }
            }
            private bool f_lenPayload;
            private int _lenPayload;
            public int LenPayload
            {
                get
                {
                    if (f_lenPayload)
                        return _lenPayload;
                    _lenPayload = (int) ((LenPayloadPrimary <= 125 ? LenPayloadPrimary : (LenPayloadPrimary == 126 ? LenPayloadExtended1 : LenPayloadExtended2)));
                    f_lenPayload = true;
                    return _lenPayload;
                }
            }
            private bool _finished;
            private ulong _reserved;
            private Opcode _opcode;
            private bool _isMasked;
            private ulong _lenPayloadPrimary;
            private ushort? _lenPayloadExtended1;
            private uint? _lenPayloadExtended2;
            private uint? _maskKey;
            private byte[] _payloadBytes;
            private string _payloadText;
            private Websocket m_root;
            private Websocket m_parent;
            public bool Finished { get { return _finished; } }
            public ulong Reserved { get { return _reserved; } }
            public Opcode Opcode { get { return _opcode; } }
            public bool IsMasked { get { return _isMasked; } }
            public ulong LenPayloadPrimary { get { return _lenPayloadPrimary; } }
            public ushort? LenPayloadExtended1 { get { return _lenPayloadExtended1; } }
            public uint? LenPayloadExtended2 { get { return _lenPayloadExtended2; } }
            public uint? MaskKey { get { return _maskKey; } }
            public byte[] PayloadBytes { get { return _payloadBytes; } }
            public string PayloadText { get { return _payloadText; } }
            public Websocket M_Root { get { return m_root; } }
            public Websocket M_Parent { get { return m_parent; } }
        }
        private List<Dataframe> _dataframes;
        private Websocket m_root;
        private KaitaiStruct m_parent;
        public List<Dataframe> Dataframes { get { return _dataframes; } }
        public Websocket M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
