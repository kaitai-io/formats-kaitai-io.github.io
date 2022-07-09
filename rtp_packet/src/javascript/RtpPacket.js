// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.RtpPacket = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * The Real-time Transport Protocol (RTP) is a widely used network
 * protocol for transmitting audio or video. It usually works with the
 * RTP Control Protocol (RTCP). The transmission can be based on
 * Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
 */

var RtpPacket = (function() {
  RtpPacket.PayloadTypeEnum = Object.freeze({
    PCMU: 0,
    RESERVED1: 1,
    RESERVED2: 2,
    GSM: 3,
    G723: 4,
    DVI4_1: 5,
    DVI4_2: 6,
    LPC: 7,
    PCMA: 8,
    G722: 9,
    L16_1: 10,
    L16_2: 11,
    QCELP: 12,
    CN: 13,
    MPA: 14,
    G728: 15,
    DVI4_3: 16,
    DVI4_4: 17,
    G729: 18,
    RESERVED19: 19,
    UNASSIGNED20: 20,
    UNASSIGNED21: 21,
    UNASSIGNED22: 22,
    UNASSIGNED23: 23,
    UNASSIGNED24: 24,
    CELB: 25,
    JPEG: 26,
    UNASSIGNED27: 27,
    NV: 28,
    UNASSIGNED29: 29,
    UNASSIGNED30: 30,
    H261: 31,
    MPV: 32,
    MP2T: 33,
    H263: 34,
    MPEG_PS: 96,

    0: "PCMU",
    1: "RESERVED1",
    2: "RESERVED2",
    3: "GSM",
    4: "G723",
    5: "DVI4_1",
    6: "DVI4_2",
    7: "LPC",
    8: "PCMA",
    9: "G722",
    10: "L16_1",
    11: "L16_2",
    12: "QCELP",
    13: "CN",
    14: "MPA",
    15: "G728",
    16: "DVI4_3",
    17: "DVI4_4",
    18: "G729",
    19: "RESERVED19",
    20: "UNASSIGNED20",
    21: "UNASSIGNED21",
    22: "UNASSIGNED22",
    23: "UNASSIGNED23",
    24: "UNASSIGNED24",
    25: "CELB",
    26: "JPEG",
    27: "UNASSIGNED27",
    28: "NV",
    29: "UNASSIGNED29",
    30: "UNASSIGNED30",
    31: "H261",
    32: "MPV",
    33: "MP2T",
    34: "H263",
    96: "MPEG_PS",
  });

  function RtpPacket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  RtpPacket.prototype._read = function() {
    this.version = this._io.readBitsIntBe(2);
    this.hasPadding = this._io.readBitsIntBe(1) != 0;
    this.hasExtension = this._io.readBitsIntBe(1) != 0;
    this.csrcCount = this._io.readBitsIntBe(4);
    this.marker = this._io.readBitsIntBe(1) != 0;
    this.payloadType = this._io.readBitsIntBe(7);
    this._io.alignToByte();
    this.sequenceNumber = this._io.readU2be();
    this.timestamp = this._io.readU4be();
    this.ssrc = this._io.readU4be();
    if (this.hasExtension) {
      this.headerExtension = new HeaderExtention(this._io, this, this._root);
    }
    this.data = this._io.readBytes(((this._io.size - this._io.pos) - this.lenPadding));
    this.padding = this._io.readBytes(this.lenPadding);
  }

  var HeaderExtention = RtpPacket.HeaderExtention = (function() {
    function HeaderExtention(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderExtention.prototype._read = function() {
      this.id = this._io.readU2be();
      this.length = this._io.readU2be();
    }

    return HeaderExtention;
  })();

  /**
   * If padding bit is enabled, last byte of data contains number of
   * bytes appended to the payload as padding.
   */
  Object.defineProperty(RtpPacket.prototype, 'lenPaddingIfExists', {
    get: function() {
      if (this._m_lenPaddingIfExists !== undefined)
        return this._m_lenPaddingIfExists;
      if (this.hasPadding) {
        var _pos = this._io.pos;
        this._io.seek((this._io.size - 1));
        this._m_lenPaddingIfExists = this._io.readU1();
        this._io.seek(_pos);
      }
      return this._m_lenPaddingIfExists;
    }
  });

  /**
   * Always returns number of padding bytes to in the payload.
   */
  Object.defineProperty(RtpPacket.prototype, 'lenPadding', {
    get: function() {
      if (this._m_lenPadding !== undefined)
        return this._m_lenPadding;
      this._m_lenPadding = (this.hasPadding ? this.lenPaddingIfExists : 0);
      return this._m_lenPadding;
    }
  });

  /**
   * Payload without padding.
   */

  return RtpPacket;
})();
return RtpPacket;
}));
