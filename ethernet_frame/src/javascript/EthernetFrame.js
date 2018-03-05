// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './Ipv6Packet', './Ipv4Packet'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./Ipv6Packet'), require('./Ipv4Packet'));
  } else {
    root.EthernetFrame = factory(root.KaitaiStream, root.Ipv6Packet, root.Ipv4Packet);
  }
}(this, function (KaitaiStream, Ipv6Packet, Ipv4Packet) {
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
      this.body = new Ipv4Packet(_io__raw_body, this, null);
      break;
    case EthernetFrame.EtherTypeEnum.IPV6:
      this._raw_body = this._io.readBytesFull();
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new Ipv6Packet(_io__raw_body, this, null);
      break;
    default:
      this.body = this._io.readBytesFull();
      break;
    }
  }

  return EthernetFrame;
})();
return EthernetFrame;
}));
