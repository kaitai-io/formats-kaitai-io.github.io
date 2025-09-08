// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
    /// communication protocol which supports remoteprocedure calls, event notifications
    /// and the underlying serialization/wire format.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf">Source</a>
    /// </remarks>
    public partial class SomeIp : KaitaiStruct
    {
        public static SomeIp FromFile(string fileName)
        {
            return new SomeIp(new KaitaiStream(fileName));
        }

        public SomeIp(KaitaiStream p__io, KaitaiStruct p__parent = null, SomeIp p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            switch (Header.MessageId.Value) {
            case 4294934784: {
                __raw_payload = m_io.ReadBytes(Header.Length - 8);
                var io___raw_payload = new KaitaiStream(__raw_payload);
                _payload = new SomeIpSd(io___raw_payload);
                break;
            }
            default: {
                _payload = m_io.ReadBytes(Header.Length - 8);
                break;
            }
            }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }


            public enum MessageTypeEnum
            {
                Request = 0,
                RequestNoReturn = 1,
                Notification = 2,
                RequestAck = 64,
                RequestNoReturnAck = 65,
                NotificationAck = 66,
                Response = 128,
                Error = 129,
                ResponseAck = 192,
                ErrorAck = 193,
            }

            public enum ReturnCodeEnum
            {
                Ok = 0,
                NotOk = 1,
                UnknownService = 2,
                UnknownMethod = 3,
                NotReady = 4,
                NotReachable = 5,
                TimeOut = 6,
                WrongProtocolVersion = 7,
                WrongInterfaceVersion = 8,
                MalformedMessage = 9,
                WrongMessageType = 10,
            }
            public Header(KaitaiStream p__io, SomeIp p__parent = null, SomeIp p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isValidServiceDiscovery = false;
                _read();
            }
            private void _read()
            {
                __raw_messageId = m_io.ReadBytes(4);
                var io___raw_messageId = new KaitaiStream(__raw_messageId);
                _messageId = new MessageId(io___raw_messageId, this, m_root);
                _length = m_io.ReadU4be();
                __raw_requestId = m_io.ReadBytes(4);
                var io___raw_requestId = new KaitaiStream(__raw_requestId);
                _requestId = new RequestId(io___raw_requestId, this, m_root);
                _protocolVersion = m_io.ReadU1();
                _interfaceVersion = m_io.ReadU1();
                _messageType = ((MessageTypeEnum) m_io.ReadU1());
                _returnCode = ((ReturnCodeEnum) m_io.ReadU1());
            }

            /// <summary>
            /// [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
            /// the user. However, the Message ID shall be unique for the whole
            /// system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
            /// should be handled via a comparable process.
            /// [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
            /// the ID with 2^16 services with 2^15 methods.
            /// </summary>
            /// <remarks>
            /// Reference: AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
            /// </remarks>
            public partial class MessageId : KaitaiStruct
            {
                public static MessageId FromFile(string fileName)
                {
                    return new MessageId(new KaitaiStream(fileName));
                }

                public MessageId(KaitaiStream p__io, SomeIp.Header p__parent = null, SomeIp p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_value = false;
                    _read();
                }
                private void _read()
                {
                    _serviceId = m_io.ReadU2be();
                    _subId = m_io.ReadBitsIntBe(1) != 0;
                    if (SubId == false) {
                        _methodId = m_io.ReadBitsIntBe(15);
                    }
                    if (SubId == true) {
                        _eventId = m_io.ReadBitsIntBe(15);
                    }
                }
                private bool f_value;
                private uint _value;

                /// <summary>
                /// The value provides the undissected Message ID
                /// </summary>
                public uint Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _value = m_io.ReadU4be();
                        m_io.Seek(_pos);
                        return _value;
                    }
                }
                private ushort _serviceId;
                private bool _subId;
                private ulong? _methodId;
                private ulong? _eventId;
                private SomeIp m_root;
                private SomeIp.Header m_parent;

                /// <summary>
                /// Service ID
                /// </summary>
                public ushort ServiceId { get { return _serviceId; } }

                /// <summary>
                /// Single bit to flag, if there is a Method or a Event ID
                /// </summary>
                public bool SubId { get { return _subId; } }

                /// <summary>
                /// Method ID
                /// </summary>
                /// <remarks>
                /// Reference: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1.
                /// </remarks>
                public ulong? MethodId { get { return _methodId; } }

                /// <summary>
                /// Event ID
                /// </summary>
                /// <remarks>
                /// Reference: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6
                /// </remarks>
                public ulong? EventId { get { return _eventId; } }
                public SomeIp M_Root { get { return m_root; } }
                public SomeIp.Header M_Parent { get { return m_parent; } }
            }

            /// <summary>
            /// The Request ID allows a provider and subscriber to differentiate
            /// multiple parallel usesof the same method, event, getter or setter.
            /// </summary>
            /// <remarks>
            /// Reference: AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
            /// </remarks>
            public partial class RequestId : KaitaiStruct
            {
                public static RequestId FromFile(string fileName)
                {
                    return new RequestId(new KaitaiStream(fileName));
                }

                public RequestId(KaitaiStream p__io, SomeIp.Header p__parent = null, SomeIp p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_value = false;
                    _read();
                }
                private void _read()
                {
                    _clientId = m_io.ReadU2be();
                    _sessionId = m_io.ReadU2be();
                }
                private bool f_value;
                private uint _value;

                /// <summary>
                /// The value provides the undissected Request ID
                /// </summary>
                public uint Value
                {
                    get
                    {
                        if (f_value)
                            return _value;
                        f_value = true;
                        long _pos = m_io.Pos;
                        m_io.Seek(0);
                        _value = m_io.ReadU4be();
                        m_io.Seek(_pos);
                        return _value;
                    }
                }
                private ushort _clientId;
                private ushort _sessionId;
                private SomeIp m_root;
                private SomeIp.Header m_parent;
                public ushort ClientId { get { return _clientId; } }
                public ushort SessionId { get { return _sessionId; } }
                public SomeIp M_Root { get { return m_root; } }
                public SomeIp.Header M_Parent { get { return m_parent; } }
            }
            private bool f_isValidServiceDiscovery;
            private bool _isValidServiceDiscovery;

            /// <summary>
            /// auxillary value
            /// </summary>
            /// <remarks>
            /// Reference: AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements
            /// </remarks>
            public bool IsValidServiceDiscovery
            {
                get
                {
                    if (f_isValidServiceDiscovery)
                        return _isValidServiceDiscovery;
                    f_isValidServiceDiscovery = true;
                    _isValidServiceDiscovery = (bool) ( ((MessageId.Value == 4294934784) && (ProtocolVersion == 1) && (InterfaceVersion == 1) && (MessageType == MessageTypeEnum.Notification) && (ReturnCode == ReturnCodeEnum.Ok)) );
                    return _isValidServiceDiscovery;
                }
            }
            private MessageId _messageId;
            private uint _length;
            private RequestId _requestId;
            private byte _protocolVersion;
            private byte _interfaceVersion;
            private MessageTypeEnum _messageType;
            private ReturnCodeEnum _returnCode;
            private SomeIp m_root;
            private SomeIp m_parent;
            private byte[] __raw_messageId;
            private byte[] __raw_requestId;

            /// <summary>
            /// The Message ID shall be a 32 Bit identifier that is used to identify
            /// the RPC call to a method of an application or to identify an event.
            /// </summary>
            public MessageId MessageId { get { return _messageId; } }

            /// <summary>
            /// [PRS_SOMEIP_00042] Length field shall contain the length in Byte
            /// starting from Request ID/Client ID until the end of the SOME/IP message.
            /// </summary>
            public uint Length { get { return _length; } }

            /// <summary>
            /// The Request ID allows a provider and subscriber to differentiate
            /// multiple parallel uses of the same method, event, getter or setter.
            /// </summary>
            public RequestId RequestId { get { return _requestId; } }

            /// <summary>
            /// The Protocol Version identifies the used SOME/IP Header format
            /// (not including the Payload format).
            /// </summary>
            public byte ProtocolVersion { get { return _protocolVersion; } }

            /// <summary>
            /// Interface Version shall be an 8 Bit field that contains the
            /// MajorVersion of the Service Interface.
            /// </summary>
            public byte InterfaceVersion { get { return _interfaceVersion; } }

            /// <summary>
            /// The Message Type field is used to differentiate different types of
            /// messages.
            /// </summary>
            /// <remarks>
            /// Reference: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4
            /// </remarks>
            public MessageTypeEnum MessageType { get { return _messageType; } }

            /// <summary>
            /// The Return Code shall be used to signal whether a request was
            /// successfully processed.
            /// </summary>
            /// <remarks>
            /// Reference: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5
            /// </remarks>
            public ReturnCodeEnum ReturnCode { get { return _returnCode; } }
            public SomeIp M_Root { get { return m_root; } }
            public SomeIp M_Parent { get { return m_parent; } }
            public byte[] M_RawMessageId { get { return __raw_messageId; } }
            public byte[] M_RawRequestId { get { return __raw_requestId; } }
        }
        private Header _header;
        private object _payload;
        private SomeIp m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_payload;
        public Header Header { get { return _header; } }
        public object Payload { get { return _payload; } }
        public SomeIp M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawPayload { get { return __raw_payload; } }
    }
}
