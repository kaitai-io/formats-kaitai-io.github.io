// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './RtpPacket'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./RtpPacket'));
  } else {
    root.Rtpdump = factory(root.KaitaiStream, root.RtpPacket);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, RtpPacket) {
/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 * @see {@link https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h|Source}
 */

var Rtpdump = (function() {
  function Rtpdump(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Rtpdump.prototype._read = function() {
    this.fileHeader = new HeaderT(this._io, this, this._root);
    this.packets = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.packets.push(new PacketT(this._io, this, this._root));
      i++;
    }
  }

  var HeaderT = Rtpdump.HeaderT = (function() {
    function HeaderT(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderT.prototype._read = function() {
      this.shebang = this._io.readBytes(12);
      if (!((KaitaiStream.byteArrayCompare(this.shebang, [35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48], this.shebang, this._io, "/types/header_t/seq/0");
      }
      this.space = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.space, [32]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([32], this.space, this._io, "/types/header_t/seq/1");
      }
      this.ip = KaitaiStream.bytesToStr(this._io.readBytesTerm(47, false, true, true), "ascii");
      this.port = KaitaiStream.bytesToStr(this._io.readBytesTerm(10, false, true, true), "ascii");
      this.startSec = this._io.readU4be();
      this.startUsec = this._io.readU4be();
      this.ip2 = this._io.readU4be();
      this.port2 = this._io.readU2be();
      this.padding = this._io.readU2be();
    }

    /**
     * start of recording, the seconds part.
     */

    /**
     * start of recording, the microseconds part.
     */

    /**
     * network source.
     */

    /**
     * port.
     */

    /**
     * 2 bytes padding.
     */

    return HeaderT;
  })();

  var PacketT = Rtpdump.PacketT = (function() {
    function PacketT(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PacketT.prototype._read = function() {
      this.length = this._io.readU2be();
      this.lenBody = this._io.readU2be();
      this.packetUsec = this._io.readU4be();
      this._raw_body = this._io.readBytes(this.lenBody);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new RtpPacket(_io__raw_body, this, null);
    }

    /**
     * packet length (including this header).
     */

    /**
     * payload length.
     */

    /**
     * timestamp of packet since the start.
     */

    return PacketT;
  })();

  return Rtpdump;
})();
return Rtpdump;
}));
