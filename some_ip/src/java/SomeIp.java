// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;


/**
 * SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
 * communication protocol which supports remoteprocedure calls, event notifications
 * and the underlying serialization/wire format.
 * @see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf">Source</a>
 */
public class SomeIp extends KaitaiStruct {
    public static SomeIp fromFile(String fileName) throws IOException {
        return new SomeIp(new ByteBufferKaitaiStream(fileName));
    }

    public SomeIp(KaitaiStream _io) {
        this(_io, null, null);
    }

    public SomeIp(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public SomeIp(KaitaiStream _io, KaitaiStruct _parent, SomeIp _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        switch (header().messageId().value()) {
        case 4294934784L: {
            this._raw_payload = this._io.readBytes((header().length() - 8));
            KaitaiStream _io__raw_payload = new ByteBufferKaitaiStream(_raw_payload);
            this.payload = new SomeIpSd(_io__raw_payload);
            break;
        }
        default: {
            this.payload = this._io.readBytes((header().length() - 8));
            break;
        }
        }
    }
    public static class Header extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this._raw_messageId = this._io.readBytes(4);
            KaitaiStream _io__raw_messageId = new ByteBufferKaitaiStream(_raw_messageId);
            this.messageId = new MessageId(_io__raw_messageId, this, _root);
            this.length = this._io.readU4be();
            this._raw_requestId = this._io.readBytes(4);
            KaitaiStream _io__raw_requestId = new ByteBufferKaitaiStream(_raw_requestId);
            this.requestId = new RequestId(_io__raw_requestId, this, _root);
            this.protocolVersion = this._io.readU1();
            this.interfaceVersion = this._io.readU1();
            this.messageType = MessageTypeEnum.byId(this._io.readU1());
            this.returnCode = ReturnCodeEnum.byId(this._io.readU1());
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
        public static class MessageId extends KaitaiStruct {
            public static MessageId fromFile(String fileName) throws IOException {
                return new MessageId(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.serviceId = this._io.readU2be();
                this.subId = this._io.readBitsIntBe(1) != 0;
                if (subId() == false) {
                    this.methodId = this._io.readBitsIntBe(15);
                }
                if (subId() == true) {
                    this.eventId = this._io.readBitsIntBe(15);
                }
            }
            private Long value;

            /**
             * The value provides the undissected Message ID
             */
            public Long value() {
                if (this.value != null)
                    return this.value;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.value = this._io.readU4be();
                this._io.seek(_pos);
                return this.value;
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

            /**
             * Single bit to flag, if there is a Method or a Event ID
             */
            public boolean subId() { return subId; }

            /**
             * Method ID
             * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1."
             */
            public Long methodId() { return methodId; }

            /**
             * Event ID
             * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6"
             */
            public Long eventId() { return eventId; }
            public SomeIp _root() { return _root; }
            public SomeIp.Header _parent() { return _parent; }
        }

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel usesof the same method, event, getter or setter.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID"
         */
        public static class RequestId extends KaitaiStruct {
            public static RequestId fromFile(String fileName) throws IOException {
                return new RequestId(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.clientId = this._io.readU2be();
                this.sessionId = this._io.readU2be();
            }
            private Long value;

            /**
             * The value provides the undissected Request ID
             */
            public Long value() {
                if (this.value != null)
                    return this.value;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.value = this._io.readU4be();
                this._io.seek(_pos);
                return this.value;
            }
            private int clientId;
            private int sessionId;
            private SomeIp _root;
            private SomeIp.Header _parent;
            public int clientId() { return clientId; }
            public int sessionId() { return sessionId; }
            public SomeIp _root() { return _root; }
            public SomeIp.Header _parent() { return _parent; }
        }
        private Boolean isValidServiceDiscovery;

        /**
         * auxillary value
         * @see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements"
         */
        public Boolean isValidServiceDiscovery() {
            if (this.isValidServiceDiscovery != null)
                return this.isValidServiceDiscovery;
            boolean _tmp = (boolean) ( ((messageId().value() == 4294934784L) && (protocolVersion() == 1) && (interfaceVersion() == 1) && (messageType() == MessageTypeEnum.NOTIFICATION) && (returnCode() == ReturnCodeEnum.OK)) );
            this.isValidServiceDiscovery = _tmp;
            return this.isValidServiceDiscovery;
        }
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

        /**
         * [PRS_SOMEIP_00042] Length field shall contain the length in Byte
         * starting from Request ID/Client ID until the end of the SOME/IP message.
         */
        public long length() { return length; }

        /**
         * The Request ID allows a provider and subscriber to differentiate
         * multiple parallel uses of the same method, event, getter or setter.
         */
        public RequestId requestId() { return requestId; }

        /**
         * The Protocol Version identifies the used SOME/IP Header format
         * (not including the Payload format).
         */
        public int protocolVersion() { return protocolVersion; }

        /**
         * Interface Version shall be an 8 Bit field that contains the
         * MajorVersion of the Service Interface.
         */
        public int interfaceVersion() { return interfaceVersion; }

        /**
         * The Message Type field is used to differentiate different types of
         * messages.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4"
         */
        public MessageTypeEnum messageType() { return messageType; }

        /**
         * The Return Code shall be used to signal whether a request was
         * successfully processed.
         * @see "AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5"
         */
        public ReturnCodeEnum returnCode() { return returnCode; }
        public SomeIp _root() { return _root; }
        public SomeIp _parent() { return _parent; }
        public byte[] _raw_messageId() { return _raw_messageId; }
        public byte[] _raw_requestId() { return _raw_requestId; }
    }
    private Header header;
    private Object payload;
    private SomeIp _root;
    private KaitaiStruct _parent;
    private byte[] _raw_payload;
    public Header header() { return header; }
    public Object payload() { return payload; }
    public SomeIp _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_payload() { return _raw_payload; }
}
