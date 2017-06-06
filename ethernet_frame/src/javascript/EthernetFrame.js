// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

if (typeof require === 'function')
  var Ipv4Packet = require('./Ipv4Packet.js');

if (typeof require === 'function')
  var Ipv6Packet = require('./Ipv6Packet.js');

var EthernetFrame = (function() {
  EthernetFrame.EtherTypeEnum = Object.freeze({
    IPV4: 2048,
    X_75_INTERNET: 2049,
    NBS_INTERNET: 2050,
    ECMA_INTERNET: 2051,
    CHAOSNET: 2052,
    X_25_LEVEL_3: 2053,
    ARP: 2054,
    IPV6: 34525,

    2048: "IPV4",
    2049: "X_75_INTERNET",
    2050: "NBS_INTERNET",
    2051: "ECMA_INTERNET",
    2052: "CHAOSNET",
    2053: "X_25_LEVEL_3",
    2054: "ARP",
    34525: "IPV6",
  });

  function EthernetFrame(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  EthernetFrame.prototype._read = function() {
    this.dstMac = this._io.readBytes(6);
    this.srcMac = this._io.readBytes(6);
    this.etherType = this._io.readU2be();
    switch (this.etherType) {
    case EthernetFrame.EtherTypeEnum.IPV4:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new Ipv4Packet(_io__raw_body);
      break;
    case EthernetFrame.EtherTypeEnum.IPV6:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new Ipv6Packet(_io__raw_body);
      break;
    default:
      this.body = this._io.readBytesFull();
      break;
    }
  }

  return EthernetFrame;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('EthernetFrame', [], function() {
    return EthernetFrame;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = EthernetFrame;
}
