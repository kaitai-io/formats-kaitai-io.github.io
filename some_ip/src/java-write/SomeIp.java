// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;


/**
 * SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
 * communication protocol which supports remoteprocedure calls, event notifications
 * and the underlying serialization/wire format.
 * @see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf">Source</a>
 */
public class SomeIp extends KaitaiStruct.ReadWrite {
    public static SomeIp fromFile(String fileName) throws IOException {
        return new SomeIp(new ByteBufferKaitaiStream(fileName));
    }
    public SomeIp() {
        this(null, null, null);
    }

    public SomeIp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public SomeIp(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, SomeIp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        switch (header().messageId().value()) {
        case 4294934784L: {
            this._raw_payload = this._io.readBytes(header().length() - 8);
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(this._raw_payload);
            this.payload = new SomeIpSd(_io__raw_payload);
            ((SomeIpSd) (this.payload))._read();
            break;
        }
        default: {
            this.payload = this._io.readBytes(header().length() - 8);
            break;
        }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        switch (header().messageId().value()) {
        case 4294934784L: {
            ((SomeIpSd) (this.payload))._fetchInstances();
            break;
        }
        default: {
            break;
        }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        switch (header().messageId().value()) {
        case 4294934784L: {
            final KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(header().length() - 8);
            this._io.addChildStream(_io__raw_payload);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (header().length() - 8));
                final SomeIp _this = this;
                _io__raw_payload.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_payload = _io__raw_payload.toByteArray();
                        if (((byte[]) (_this._raw_payload)).length != header().length() - 8)
                            throw new ConsistencyError("raw(payload)", header().length() - 8, ((byte[]) (_this._raw_payload)).length);
                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_payload)))));
                    }
                });
            }
            ((SomeIpSd) (this.payload))._write_Seq(_io__raw_payload);
            break;
        }
        default: {
            this._io.writeBytes(((byte[]) (((byte[]) (this.payload)))));
            break;
        }
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        switch (header().messageId().value()) {
        case 4294934784L: {
            break;
        }
        default: {
            if (((byte[]) (this.payload)).length != header().length() - 8)
                throw new ConsistencyError("payload", header().length() - 8, ((byte[]) (this.payload)).length);
            break;
        }
        }
        _dirty = false;
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public enum MessageTypeEnum {
            REQUEST(0),
            REQUEST_NO_RETURN(1),
            NOTIFICATION(2),
            REQUEST_ACK(64),
            REQUEST_NO_RETURN_ACK(65),
            NOTIFICATION_ACK(66),
            RESPONSE(128),
            ERROR(129),
            RESPONSE_ACK(192),
            ERROR_ACK(193);

            private final long id;
            MessageTypeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MessageTypeEnum> byId = new HashMap<Long, MessageTypeEnum>(10);
            static {
                for (MessageTypeEnum e : MessageTypeEnum.values())
                    byId.put(e.id(), e);
            }
            public static MessageTypeEnum byId(long id) { return byId.get(id); }
        }

        public enum ReturnCodeEnum {
            OK(0),
            NOT_OK(1),
            UNKNOWN_SERVICE(2),
            UNKNOWN_METHOD(3),
            NOT_READY(4),
            NOT_REACHABLE(5),
            TIME_OUT(6),
            WRONG_PROTOCOL_VERSION(7),
            WRONG_INTERFACE_VERSION(8),
            MALFORMED_MESSAGE(9),
            WRONG_MESSAGE_TYPE(10);

            private final long id;
            ReturnCodeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ReturnCodeEnum> byId = new HashMap<Long, ReturnCodeEnum>(11);
            static {
                for (ReturnCodeEnum e : ReturnCodeEnum.values())
                    byId.put(e.id(), e);
            }
            public static ReturnCodeEnum byId(long id) { return byId.get(id); }
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, SomeIp _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, SomeIp _parent, SomeIp _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._raw_messageId = this._io.readBytes(4);
            KaitaiStream _io__raw_messageId = new ByteBufferKaitaiStream(this._raw_messageId);
            this.messageId = new MessageId(_io__raw_messageId, this, _root);
            this.messageId._read();
            this.length = this._io.readU4be();
            this._raw_requestId = this._io.readBytes(4);
            KaitaiStream _io__raw_requestId = new ByteBufferKaitaiStream(this._raw_requestId);
            this.requestId = new RequestId(_io__raw_requestId, this, _root);
            this.requestId._read();
            this.protocolVersion = this._io.readU1();
            this.interfaceVersion = this._io.readU1();
            this.messageType = MessageTypeEnum.byId(this._io.readU1());
            this.returnCode = ReturnCodeEnum.byId(this._io.readU1());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.messageId._fetchInstances();
            this.requestId._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_messageId = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_messageId);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final Header _this = this;
                _io__raw_messageId.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_messageId = _io__raw_messageId.toByteArray();
                        if (_this._raw_messageId.length != 4)
                            throw new ConsistencyError("raw(message_id)", 4, _this._raw_messageId.length);
                        parent.writeBytes(_this._raw_messageId);
                    }
                });
            }
            this.messageId._write_Seq(_io__raw_messageId);
            this._io.writeU4be(this.length);
            final KaitaiStream _io__raw_requestId = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_requestId);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final Header _this = this;
                _io__raw_requestId.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_requestId = _io__raw_requestId.toByteArray();
                        if (_this._raw_requestId.length != 4)
                            throw new ConsistencyError("raw(request_id)", 4, _this._raw_requestId.length);
                        parent.writeBytes(_this._raw_requestId);
                    }
                });
            }
            this.requestId._write_Seq(_io__raw_requestId);
            this._io.writeU1(this.protocolVersion);
            this._io.writeU1(this.interfaceVersion);
            this._io.writeU1(((Number) (this.messageType.id())).intValue());
            this._io.writeU1(((Number) (this.returnCode.id())).intValue());
        }

        public void _check() {
            if (!Objects.equals(this.messageId._root(), _root()))
                throw new ConsistencyError("message_id", _root(), this.messageId._root());
            if (!Objects.equals(this.messageId._parent(), this))
                throw new ConsistencyError("message_id", this, this.messageId._parent());
            if (!Objects.equals(this.requestId._root(), _root()))
                throw new ConsistencyError("request_id", _root(), this.requestId._root());
            if (!Objects.equals(this.requestId._parent(), this))
                throw new ConsistencyError("request_id", this, this.requestId._parent());
            _dirty = false;
        }

        /**
         * [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
         * the user. However, the Message ID shall be unique for the whole
         * system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
         * should be handled via a comparable process.
         * [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
         * the ID with 2^16 services with 2^15 methods.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID"
         */
        public static class MessageId extends KaitaiStruct.ReadWrite {
            public static MessageId fromFile(String fileName) throws IOException {
                return new MessageId(new ByteBufferKaitaiStream(fileName));
            }
            public MessageId() {
                this(null, null, null);
            }

            public MessageId(KaitaiStream _io) {
                this(_io, null, null);
            }

            public MessageId(KaitaiStream _io, SomeIp.Header _parent) {
                this(_io, _parent, null);
            }

            public MessageId(KaitaiStream _io, SomeIp.Header _parent, SomeIp _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.serviceId = this._io.readU2be();
                this.subId = this._io.readBitsIntBe(1) != 0;
                if (subId() == false) {
                    this.methodId = this._io.readBitsIntBe(15);
                }
                if (subId() == true) {
                    this.eventId = this._io.readBitsIntBe(15);
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (subId() == false) {
                }
                if (subId() == true) {
                }
                value();
                if (this.value != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteValue = _enabledValue;
                this._io.writeU2be(this.serviceId);
                this._io.writeBitsIntBe(1, (this.subId ? 1 : 0));
                if (subId() == false) {
                    this._io.writeBitsIntBe(15, this.methodId);
                }
                if (subId() == true) {
                    this._io.writeBitsIntBe(15, this.eventId);
                }
            }

            public void _check() {
                if (subId() == false) {
                }
                if (subId() == true) {
                }
                if (_enabledValue) {
                }
                _dirty = false;
            }
            private Long value;
            private boolean _shouldWriteValue = false;
            private boolean _enabledValue = true;

            /**
             * The value provides the undissected Message ID
             */
            public Long value() {
                if (_shouldWriteValue)
                    _writeValue();
                if (this.value != null)
                    return this.value;
                if (!_enabledValue)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.value = this._io.readU4be();
                this._io.seek(_pos);
                return this.value;
            }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

            private void _writeValue() {
                _shouldWriteValue = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                this._io.writeU4be(this.value);
                this._io.seek(_pos);
            }
            private int serviceId;
            private boolean subId;
            private Long methodId;
            private Long eventId;
            private SomeIp _root;
            private SomeIp.Header _parent;

            /**
             * Service ID
             */
            public int serviceId() { return serviceId; }
            public void setServiceId(int _v) { _dirty = true; serviceId = _v; }

            /**
             * Single bit to flag, if there is a Method or a Event ID
             */
            public boolean subId() { return subId; }
            public void setSubId(boolean _v) { _dirty = true; subId = _v; }

            /**
             * Method ID
             * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1."
             */
            public Long methodId() { return methodId; }
            public void setMethodId(Long _v) { _dirty = true; methodId = _v; }

            /**
             * Event ID
             * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6"
             */
            public Long eventId() { return eventId; }
            public void setEventId(Long _v) { _dirty = true; eventId = _v; }
            public SomeIp _root() { return _root; }
            public void set_root(SomeIp _v) { _dirty = true; _root = _v; }
            public SomeIp.Header _parent() { return _parent; }
            public void set_parent(SomeIp.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel usesof the same method, event, getter or setter.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID"
         */
        public static class RequestId extends KaitaiStruct.ReadWrite {
            public static RequestId fromFile(String fileName) throws IOException {
                return new RequestId(new ByteBufferKaitaiStream(fileName));
            }
            public RequestId() {
                this(null, null, null);
            }

            public RequestId(KaitaiStream _io) {
                this(_io, null, null);
            }

            public RequestId(KaitaiStream _io, SomeIp.Header _parent) {
                this(_io, _parent, null);
            }

            public RequestId(KaitaiStream _io, SomeIp.Header _parent, SomeIp _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.clientId = this._io.readU2be();
                this.sessionId = this._io.readU2be();
                _dirty = false;
            }

            public void _fetchInstances() {
                value();
                if (this.value != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteValue = _enabledValue;
                this._io.writeU2be(this.clientId);
                this._io.writeU2be(this.sessionId);
            }

            public void _check() {
                if (_enabledValue) {
                }
                _dirty = false;
            }
            private Long value;
            private boolean _shouldWriteValue = false;
            private boolean _enabledValue = true;

            /**
             * The value provides the undissected Request ID
             */
            public Long value() {
                if (_shouldWriteValue)
                    _writeValue();
                if (this.value != null)
                    return this.value;
                if (!_enabledValue)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.value = this._io.readU4be();
                this._io.seek(_pos);
                return this.value;
            }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public void setValue_Enabled(boolean _v) { _dirty = true; _enabledValue = _v; }

            private void _writeValue() {
                _shouldWriteValue = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                this._io.writeU4be(this.value);
                this._io.seek(_pos);
            }
            private int clientId;
            private int sessionId;
            private SomeIp _root;
            private SomeIp.Header _parent;
            public int clientId() { return clientId; }
            public void setClientId(int _v) { _dirty = true; clientId = _v; }
            public int sessionId() { return sessionId; }
            public void setSessionId(int _v) { _dirty = true; sessionId = _v; }
            public SomeIp _root() { return _root; }
            public void set_root(SomeIp _v) { _dirty = true; _root = _v; }
            public SomeIp.Header _parent() { return _parent; }
            public void set_parent(SomeIp.Header _v) { _dirty = true; _parent = _v; }
        }
        private Boolean isValidServiceDiscovery;

        /**
         * auxillary value
         * @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements"
         */
        public Boolean isValidServiceDiscovery() {
            if (this.isValidServiceDiscovery != null)
                return this.isValidServiceDiscovery;
            this.isValidServiceDiscovery =  ((messageId().value() == 4294934784L) && (protocolVersion() == 1) && (interfaceVersion() == 1) && (messageType() == MessageTypeEnum.NOTIFICATION) && (returnCode() == ReturnCodeEnum.OK)) ;
            return this.isValidServiceDiscovery;
        }
        public void _invalidateIsValidServiceDiscovery() { this.isValidServiceDiscovery = null; }
        private MessageId messageId;
        private long length;
        private RequestId requestId;
        private int protocolVersion;
        private int interfaceVersion;
        private MessageTypeEnum messageType;
        private ReturnCodeEnum returnCode;
        private SomeIp _root;
        private SomeIp _parent;
        private byte[] _raw_messageId;
        private byte[] _raw_requestId;

        /**
         * The Message ID shall be a 32 Bit identifier that is used to identify
         * the RPC call to a method of an application or to identify an event.
         */
        public MessageId messageId() { return messageId; }
        public void setMessageId(MessageId _v) { _dirty = true; messageId = _v; }

        /**
         * [PRS_SOMEIP_00042] Length field shall contain the length in Byte
         * starting from Request ID/Client ID until the end of the SOME/IP message.
         */
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel uses of the same method, event, getter or setter.
         */
        public RequestId requestId() { return requestId; }
        public void setRequestId(RequestId _v) { _dirty = true; requestId = _v; }

        /**
         * The Protocol Version identifies the used SOME/IP Header format
         * (not including the Payload format).
         */
        public int protocolVersion() { return protocolVersion; }
        public void setProtocolVersion(int _v) { _dirty = true; protocolVersion = _v; }

        /**
         * Interface Version shall be an 8 Bit field that contains the
         * MajorVersion of the Service Interface.
         */
        public int interfaceVersion() { return interfaceVersion; }
        public void setInterfaceVersion(int _v) { _dirty = true; interfaceVersion = _v; }

        /**
         * The Message Type field is used to differentiate different types of
         * messages.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4"
         */
        public MessageTypeEnum messageType() { return messageType; }
        public void setMessageType(MessageTypeEnum _v) { _dirty = true; messageType = _v; }

        /**
         * The Return Code shall be used to signal whether a request was
         * successfully processed.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5"
         */
        public ReturnCodeEnum returnCode() { return returnCode; }
        public void setReturnCode(ReturnCodeEnum _v) { _dirty = true; returnCode = _v; }
        public SomeIp _root() { return _root; }
        public void set_root(SomeIp _v) { _dirty = true; _root = _v; }
        public SomeIp _parent() { return _parent; }
        public void set_parent(SomeIp _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_messageId() { return _raw_messageId; }
        public void set_raw_MessageId(byte[] _v) { _dirty = true; _raw_messageId = _v; }
        public byte[] _raw_requestId() { return _raw_requestId; }
        public void set_raw_RequestId(byte[] _v) { _dirty = true; _raw_requestId = _v; }
    }
    private Header header;
    private Object payload;
    private SomeIp _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_payload;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public Object payload() { return payload; }
    public void setPayload(Object _v) { _dirty = true; payload = _v; }
    public SomeIp _root() { return _root; }
    public void set_root(SomeIp _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_payload() { return _raw_payload; }
    public void set_raw_Payload(byte[] _v) { _dirty = true; _raw_payload = _v; }
}
