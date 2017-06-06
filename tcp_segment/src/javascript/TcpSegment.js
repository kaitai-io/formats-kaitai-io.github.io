// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
    this.b12 = this._io.readU1();
    this.b13 = this._io.readU1();
    this.windowSize = this._io.readU2be();
    this.checksum = this._io.readU2be();
    this.urgentPointer = this._io.readU2be();
    this.body = this._io.readBytesFull();
  }

  return TcpSegment;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('TcpSegment', [], function() {
    return TcpSegment;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = TcpSegment;
}
