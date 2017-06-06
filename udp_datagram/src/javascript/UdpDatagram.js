// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var UdpDatagram = (function() {
  function UdpDatagram(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  UdpDatagram.prototype._read = function() {
    this.srcPort = this._io.readU2be();
    this.dstPort = this._io.readU2be();
    this.length = this._io.readU2be();
    this.checksum = this._io.readU2be();
    this.body = this._io.readBytesFull();
  }

  return UdpDatagram;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('UdpDatagram', [], function() {
    return UdpDatagram;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = UdpDatagram;
}
