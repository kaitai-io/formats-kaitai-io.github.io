// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './UdpDatagram', './TcpSegment', './Ipv4Packet'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./UdpDatagram'), require('./TcpSegment'), require('./Ipv4Packet'));
  } else {
    root.Ipv6Packet = factory(root.KaitaiStream, root.UdpDatagram, root.TcpSegment, root.Ipv4Packet);
  }
}(this, function (KaitaiStream, UdpDatagram, TcpSegment, Ipv4Packet) {
var Ipv6Packet = (function() {
  function Ipv6Packet(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ipv6Packet.prototype._read = function() {
    this.version = this._io.readBitsInt(4);
    this.trafficClass = this._io.readBitsInt(8);
    this.flowLabel = this._io.readBitsInt(20);
    this._io.alignToByte();
    this.payloadLength = this._io.readU2be();
    this.nextHeaderType = this._io.readU1();
    this.hopLimit = this._io.readU1();
    this.srcIpv6Addr = this._io.readBytes(16);
    this.dstIpv6Addr = this._io.readBytes(16);
    switch (this.nextHeaderType) {
    case 17:
      this.nextHeader = new UdpDatagram(this._io, this, null);
      break;
    case 0:
      this.nextHeader = new OptionHopByHop(this._io, this, this._root);
      break;
    case 4:
      this.nextHeader = new Ipv4Packet(this._io, this, null);
      break;
    case 6:
      this.nextHeader = new TcpSegment(this._io, this, null);
      break;
    case 59:
      this.nextHeader = new NoNextHeader(this._io, this, this._root);
      break;
    }
    this.rest = this._io.readBytesFull();
  }

  var NoNextHeader = Ipv6Packet.NoNextHeader = (function() {
    function NoNextHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    NoNextHeader.prototype._read = function() {
    }

    return NoNextHeader;
  })();

  var OptionHopByHop = Ipv6Packet.OptionHopByHop = (function() {
    function OptionHopByHop(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionHopByHop.prototype._read = function() {
      this.nextHeaderType = this._io.readU1();
      this.hdrExtLen = this._io.readU1();
      this.body = this._io.readBytes((this.hdrExtLen - 1));
      switch (this.nextHeaderType) {
      case 0:
        this.nextHeader = new OptionHopByHop(this._io, this, this._root);
        break;
      case 6:
        this.nextHeader = new TcpSegment(this._io, this, null);
        break;
      case 59:
        this.nextHeader = new NoNextHeader(this._io, this, this._root);
        break;
      }
    }

    return OptionHopByHop;
  })();

  return Ipv6Packet;
})();
return Ipv6Packet;
}));
