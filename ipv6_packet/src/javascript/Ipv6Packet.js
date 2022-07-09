// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './ProtocolBody'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./ProtocolBody'));
  } else {
    root.Ipv6Packet = factory(root.KaitaiStream, root.ProtocolBody);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, ProtocolBody) {
var Ipv6Packet = (function() {
  function Ipv6Packet(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ipv6Packet.prototype._read = function() {
    this.version = this._io.readBitsIntBe(4);
    this.trafficClass = this._io.readBitsIntBe(8);
    this.flowLabel = this._io.readBitsIntBe(20);
    this._io.alignToByte();
    this.payloadLength = this._io.readU2be();
    this.nextHeaderType = this._io.readU1();
    this.hopLimit = this._io.readU1();
    this.srcIpv6Addr = this._io.readBytes(16);
    this.dstIpv6Addr = this._io.readBytes(16);
    this.nextHeader = new ProtocolBody(this._io, this, null, this.nextHeaderType);
    this.rest = this._io.readBytesFull();
  }

  return Ipv6Packet;
})();
return Ipv6Packet;
}));
