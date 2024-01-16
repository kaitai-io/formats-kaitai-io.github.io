// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.TcpSegment = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */

var TcpSegment = (function() {
  function TcpSegment(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TcpSegment.prototype._read = function() {
    this.srcPort = this._io.readU2be();
    this.dstPort = this._io.readU2be();
    this.seqNum = this._io.readU4be();
    this.ackNum = this._io.readU4be();
    this.dataOffset = this._io.readBitsIntBe(4);
    this.reserved = this._io.readBitsIntBe(4);
    this._io.alignToByte();
    this.flags = new Flags(this._io, this, this._root);
    this.windowSize = this._io.readU2be();
    this.checksum = this._io.readU2be();
    this.urgentPointer = this._io.readU2be();
    if (((this.dataOffset * 4) - 20) != 0) {
      this.options = this._io.readBytes(((this.dataOffset * 4) - 20));
    }
    this.body = this._io.readBytesFull();
  }

  /**
   * TCP header flags as defined "TCP Header Flags" registry.
   */

  var Flags = TcpSegment.Flags = (function() {
    function Flags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Flags.prototype._read = function() {
      this.cwr = this._io.readBitsIntBe(1) != 0;
      this.ece = this._io.readBitsIntBe(1) != 0;
      this.urg = this._io.readBitsIntBe(1) != 0;
      this.ack = this._io.readBitsIntBe(1) != 0;
      this.psh = this._io.readBitsIntBe(1) != 0;
      this.rst = this._io.readBitsIntBe(1) != 0;
      this.syn = this._io.readBitsIntBe(1) != 0;
      this.fin = this._io.readBitsIntBe(1) != 0;
    }

    /**
     * Congestion Window Reduced
     */

    /**
     * ECN-Echo
     */

    /**
     * Urgent pointer field is significant
     */

    /**
     * Acknowledgment field is significant
     */

    /**
     * Push function
     */

    /**
     * Reset the connection
     */

    /**
     * Synchronize sequence numbers
     */

    /**
     * No more data from sender
     */

    Flags.prototype.toString = function() {
      return (this.cwr ? "|CWR" : "") + (this.ece ? "|ECE" : "") + (this.urg ? "|URG" : "") + (this.ack ? "|ACK" : "") + (this.psh ? "|PSH" : "") + (this.rst ? "|RST" : "") + (this.syn ? "|SYN" : "") + (this.fin ? "|FIN" : "");
    }

    return Flags;
  })();

  /**
   * Source port
   */

  /**
   * Destination port
   */

  /**
   * Sequence number
   */

  /**
   * Acknowledgment number
   */

  /**
   * Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
   */

  return TcpSegment;
})();
return TcpSegment;
}));
