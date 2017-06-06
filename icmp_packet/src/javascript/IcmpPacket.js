// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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

      0: "NET_UNREACHABLE",
      1: "HOST_UNREACHABLE",
      2: "PROTOCOL_UNREACHABLE",
      3: "PORT_UNREACHABLE",
      4: "FRAGMENTATION_NEEDED_AND_DF_SET",
      5: "SOURCE_ROUTE_FAILED",
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
      this.code = this._io.ensureFixedContents([0]);
      this.checksum = this._io.readU2be();
      this.identifier = this._io.readU2be();
      this.seqNum = this._io.readU2be();
    }

    return EchoMsg;
  })();

  return IcmpPacket;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('IcmpPacket', [], function() {
    return IcmpPacket;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = IcmpPacket;
}
