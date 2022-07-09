// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.UdpDatagram = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * UDP is a simple stateless transport layer (AKA OSI layer 4)
 * protocol, one of the core Internet protocols. It provides source and
 * destination ports, basic checksumming, but provides not guarantees
 * of delivery, order of packets, or duplicate delivery.
 */

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
    this.body = this._io.readBytes((this.length - 8));
  }

  return UdpDatagram;
})();
return UdpDatagram;
}));
