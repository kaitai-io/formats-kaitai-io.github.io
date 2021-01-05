// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './SomeIpSd'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./SomeIpSd'));
  } else {
    root.SomeIp = factory(root.KaitaiStream, root.SomeIpSd);
  }
}(this, function (KaitaiStream, SomeIpSd) {
/**
 * SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
 * communication protocol which supports remoteprocedure calls, event notifications
 * and the underlying serialization/wire format.
 * @see {@link https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf|Source}
 */

var SomeIp = (function() {
  function SomeIp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SomeIp.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    switch (this.header.messageId.value) {
    case 4294934784:
      this._raw_payload = this._io.readBytes((this.header.length - 8));
      var _io__raw_payload = new KaitaiStream(this._raw_payload);
      this.payload = new SomeIpSd(_io__raw_payload, this, null);
      break;
    default:
      this.payload = this._io.readBytes((this.header.length - 8));
      break;
    }
  }

  var Header = SomeIp.Header = (function() {
    Header.MessageTypeEnum = Object.freeze({
      REQUEST: 0,
      REQUEST_NO_RETURN: 1,
      NOTIFICATION: 2,
      REQUEST_ACK: 64,
      REQUEST_NO_RETURN_ACK: 65,
      NOTIFICATION_ACK: 66,
      RESPONSE: 128,
      ERROR: 129,
      RESPONSE_ACK: 192,
      ERROR_ACK: 193,

      0: "REQUEST",
      1: "REQUEST_NO_RETURN",
      2: "NOTIFICATION",
      64: "REQUEST_ACK",
      65: "REQUEST_NO_RETURN_ACK",
      66: "NOTIFICATION_ACK",
      128: "RESPONSE",
      129: "ERROR",
      192: "RESPONSE_ACK",
      193: "ERROR_ACK",
    });

    Header.ReturnCodeEnum = Object.freeze({
      OK: 0,
      NOT_OK: 1,
      UNKNOWN_SERVICE: 2,
      UNKNOWN_METHOD: 3,
      NOT_READY: 4,
      NOT_REACHABLE: 5,
      TIME_OUT: 6,
      WRONG_PROTOCOL_VERSION: 7,
      WRONG_INTERFACE_VERSION: 8,
      MALFORMED_MESSAGE: 9,
      WRONG_MESSAGE_TYPE: 10,

      0: "OK",
      1: "NOT_OK",
      2: "UNKNOWN_SERVICE",
      3: "UNKNOWN_METHOD",
      4: "NOT_READY",
      5: "NOT_REACHABLE",
      6: "TIME_OUT",
      7: "WRONG_PROTOCOL_VERSION",
      8: "WRONG_INTERFACE_VERSION",
      9: "MALFORMED_MESSAGE",
      10: "WRONG_MESSAGE_TYPE",
    });

    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this._raw_messageId = this._io.readBytes(4);
      var _io__raw_messageId = new KaitaiStream(this._raw_messageId);
      this.messageId = new MessageId(_io__raw_messageId, this, this._root);
      this.length = this._io.readU4be();
      this._raw_requestId = this._io.readBytes(4);
      var _io__raw_requestId = new KaitaiStream(this._raw_requestId);
      this.requestId = new RequestId(_io__raw_requestId, this, this._root);
      this.protocolVersion = this._io.readU1();
      this.interfaceVersion = this._io.readU1();
      this.messageType = this._io.readU1();
      this.returnCode = this._io.readU1();
    }

    /**
     * [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
     * the user. However, the Message ID shall be unique for the whole
     * system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
     * should be handled via a comparable process.
     * [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
     * the ID with 2^16 services with 2^15 methods.
     * @see AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
     */

    var MessageId = Header.MessageId = (function() {
      function MessageId(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      MessageId.prototype._read = function() {
        this.serviceId = this._io.readU2be();
        this.subId = this._io.readBitsIntBe(1) != 0;
        if (this.subId == false) {
          this.methodId = this._io.readBitsIntBe(15);
        }
        if (this.subId == true) {
          this.eventId = this._io.readBitsIntBe(15);
        }
      }

      /**
       * The value provides the undissected Message ID
       */
      Object.defineProperty(MessageId.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_value = this._io.readU4be();
          this._io.seek(_pos);
          return this._m_value;
        }
      });

      /**
       * Service ID
       */

      /**
       * Single bit to flag, if there is a Method or a Event ID
       */

      /**
       * Method ID
       * @see AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1.
       */

      /**
       * Event ID
       * @see AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6
       */

      return MessageId;
    })();

    /**
     * The Request ID allows a provider and subscriber to differentiate
     * multiple parallel usesof the same method, event, getter or setter.
     * @see AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
     */

    var RequestId = Header.RequestId = (function() {
      function RequestId(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      RequestId.prototype._read = function() {
        this.clientId = this._io.readU2be();
        this.sessionId = this._io.readU2be();
      }

      /**
       * The value provides the undissected Request ID
       */
      Object.defineProperty(RequestId.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          var _pos = this._io.pos;
          this._io.seek(0);
          this._m_value = this._io.readU4be();
          this._io.seek(_pos);
          return this._m_value;
        }
      });

      return RequestId;
    })();

    /**
     * auxillary value
     * @see AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements
     */
    Object.defineProperty(Header.prototype, 'isValidServiceDiscovery', {
      get: function() {
        if (this._m_isValidServiceDiscovery !== undefined)
          return this._m_isValidServiceDiscovery;
        this._m_isValidServiceDiscovery =  ((this.messageId.value == 4294934784) && (this.protocolVersion == 1) && (this.interfaceVersion == 1) && (this.messageType == SomeIp.Header.MessageTypeEnum.NOTIFICATION) && (this.returnCode == SomeIp.Header.ReturnCodeEnum.OK)) ;
        return this._m_isValidServiceDiscovery;
      }
    });

    /**
     * The Message ID shall be a 32 Bit identifier that is used to identify
     * the RPC call to a method of an application or to identify an event.
     */

    /**
     * [PRS_SOMEIP_00042] Length field shall contain the length in Byte
     * starting from Request ID/Client ID until the end of the SOME/IP message.
     */

    /**
     * The Request ID allows a provider and subscriber to differentiate
     * multiple parallel uses of the same method, event, getter or setter.
     */

    /**
     * The Protocol Version identifies the used SOME/IP Header format
     * (not including the Payload format).
     */

    /**
     * Interface Version shall be an 8 Bit field that contains the
     * MajorVersion of the Service Interface.
     */

    /**
     * The Message Type field is used to differentiate different types of
     * messages.
     * @see AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4
     */

    /**
     * The Return Code shall be used to signal whether a request was
     * successfully processed.
     * @see AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5
     */

    return Header;
  })();

  return SomeIp;
})();
return SomeIp;
}));
