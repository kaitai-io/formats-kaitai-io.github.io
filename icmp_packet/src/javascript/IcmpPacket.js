// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.IcmpPacket = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var IcmpPacket = (function() {
  IcmpPacket.IcmpTypeEnum = Object.freeze({
    ECHO_REPLY: 0,
    DESTINATION_UNREACHABLE: 3,
    SOURCE_QUENCH: 4,
    REDIRECT: 5,
    ECHO: 8,
    TIME_EXCEEDED: 11,

    0: "ECHO_REPLY",
    3: "DESTINATION_UNREACHABLE",
    4: "SOURCE_QUENCH",
    5: "REDIRECT",
    8: "ECHO",
    11: "TIME_EXCEEDED",
  });

  function IcmpPacket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  IcmpPacket.prototype._read = function() {
    this.icmpType = this._io.readU1();
    if (this.icmpType == IcmpPacket.IcmpTypeEnum.DESTINATION_UNREACHABLE) {
      this.destinationUnreachable = new DestinationUnreachableMsg(this._io, this, this._root);
    }
    if (this.icmpType == IcmpPacket.IcmpTypeEnum.TIME_EXCEEDED) {
      this.timeExceeded = new TimeExceededMsg(this._io, this, this._root);
    }
    if ( ((this.icmpType == IcmpPacket.IcmpTypeEnum.ECHO) || (this.icmpType == IcmpPacket.IcmpTypeEnum.ECHO_REPLY)) ) {
      this.echo = new EchoMsg(this._io, this, this._root);
    }
  }

  var DestinationUnreachableMsg = IcmpPacket.DestinationUnreachableMsg = (function() {
    DestinationUnreachableMsg.DestinationUnreachableCode = Object.freeze({
      NET_UNREACHABLE: 0,
      HOST_UNREACHABLE: 1,
      PROTOCOL_UNREACHABLE: 2,
      PORT_UNREACHABLE: 3,
      FRAGMENTATION_NEEDED_AND_DF_SET: 4,
      SOURCE_ROUTE_FAILED: 5,
      DST_NET_UNKOWN: 6,
      SDT_HOST_UNKOWN: 7,
      SRC_ISOLATED: 8,
      NET_PROHIBITED_BY_ADMIN: 9,
      HOST_PROHIBITED_BY_ADMIN: 10,
      NET_UNREACHABLE_FOR_TOS: 11,
      HOST_UNREACHABLE_FOR_TOS: 12,
      COMMUNICATION_PROHIBITED_BY_ADMIN: 13,
      HOST_PRECEDENCE_VIOLATION: 14,
      PRECEDENCE_CUTTOFF_IN_EFFECT: 15,

      0: "NET_UNREACHABLE",
      1: "HOST_UNREACHABLE",
      2: "PROTOCOL_UNREACHABLE",
      3: "PORT_UNREACHABLE",
      4: "FRAGMENTATION_NEEDED_AND_DF_SET",
      5: "SOURCE_ROUTE_FAILED",
      6: "DST_NET_UNKOWN",
      7: "SDT_HOST_UNKOWN",
      8: "SRC_ISOLATED",
      9: "NET_PROHIBITED_BY_ADMIN",
      10: "HOST_PROHIBITED_BY_ADMIN",
      11: "NET_UNREACHABLE_FOR_TOS",
      12: "HOST_UNREACHABLE_FOR_TOS",
      13: "COMMUNICATION_PROHIBITED_BY_ADMIN",
      14: "HOST_PRECEDENCE_VIOLATION",
      15: "PRECEDENCE_CUTTOFF_IN_EFFECT",
    });

    function DestinationUnreachableMsg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DestinationUnreachableMsg.prototype._read = function() {
      this.code = this._io.readU1();
      this.checksum = this._io.readU2be();
    }

    return DestinationUnreachableMsg;
  })();

  var TimeExceededMsg = IcmpPacket.TimeExceededMsg = (function() {
    TimeExceededMsg.TimeExceededCode = Object.freeze({
      TIME_TO_LIVE_EXCEEDED_IN_TRANSIT: 0,
      FRAGMENT_REASSEMBLY_TIME_EXCEEDED: 1,

      0: "TIME_TO_LIVE_EXCEEDED_IN_TRANSIT",
      1: "FRAGMENT_REASSEMBLY_TIME_EXCEEDED",
    });

    function TimeExceededMsg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TimeExceededMsg.prototype._read = function() {
      this.code = this._io.readU1();
      this.checksum = this._io.readU2be();
    }

    return TimeExceededMsg;
  })();

  var EchoMsg = IcmpPacket.EchoMsg = (function() {
    function EchoMsg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EchoMsg.prototype._read = function() {
      this.code = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.code, [0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0], this.code, this._io, "/types/echo_msg/seq/0");
      }
      this.checksum = this._io.readU2be();
      this.identifier = this._io.readU2be();
      this.seqNum = this._io.readU2be();
      this.data = this._io.readBytesFull();
    }

    return EchoMsg;
  })();

  return IcmpPacket;
})();
return IcmpPacket;
}));
