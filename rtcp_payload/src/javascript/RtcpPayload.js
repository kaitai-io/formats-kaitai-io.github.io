// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.RtcpPayload = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * RTCP is the Real-Time Control Protocol
 * @see {@link https://tools.ietf.org/html/rfc3550|Source}
 */

var RtcpPayload = (function() {
  RtcpPayload.PayloadType = Object.freeze({
    FIR: 192,
    NACK: 193,
    IJ: 195,
    SR: 200,
    RR: 201,
    SDES: 202,
    BYE: 203,
    APP: 204,
    RTPFB: 205,
    PSFB: 206,
    XR: 207,
    AVB: 208,
    RSI: 209,

    192: "FIR",
    193: "NACK",
    195: "IJ",
    200: "SR",
    201: "RR",
    202: "SDES",
    203: "BYE",
    204: "APP",
    205: "RTPFB",
    206: "PSFB",
    207: "XR",
    208: "AVB",
    209: "RSI",
  });

  RtcpPayload.SdesSubtype = Object.freeze({
    PAD: 0,
    CNAME: 1,
    NAME: 2,
    EMAIL: 3,
    PHONE: 4,
    LOC: 5,
    TOOL: 6,
    NOTE: 7,
    PRIV: 8,

    0: "PAD",
    1: "CNAME",
    2: "NAME",
    3: "EMAIL",
    4: "PHONE",
    5: "LOC",
    6: "TOOL",
    7: "NOTE",
    8: "PRIV",
  });

  RtcpPayload.PsfbSubtype = Object.freeze({
    PLI: 1,
    SLI: 2,
    RPSI: 3,
    FIR: 4,
    TSTR: 5,
    TSTN: 6,
    VBCM: 7,
    AFB: 15,

    1: "PLI",
    2: "SLI",
    3: "RPSI",
    4: "FIR",
    5: "TSTR",
    6: "TSTN",
    7: "VBCM",
    15: "AFB",
  });

  RtcpPayload.RtpfbSubtype = Object.freeze({
    NACK: 1,
    TMMBR: 3,
    TMMBN: 4,
    RRR: 5,
    TRANSPORT_FEEDBACK: 15,

    1: "NACK",
    3: "TMMBR",
    4: "TMMBN",
    5: "RRR",
    15: "TRANSPORT_FEEDBACK",
  });

  function RtcpPayload(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  RtcpPayload.prototype._read = function() {
    this.rtcpPackets = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.rtcpPackets.push(new RtcpPacket(this._io, this, this._root));
      i++;
    }
  }

  var PsfbAfbRembPacket = RtcpPayload.PsfbAfbRembPacket = (function() {
    function PsfbAfbRembPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PsfbAfbRembPacket.prototype._read = function() {
      this.numSsrc = this._io.readU1();
      this.brExp = this._io.readBitsInt(6);
      this.brMantissa = this._io.readBitsInt(18);
      this._io.alignToByte();
      this.ssrcList = new Array(this.numSsrc);
      for (var i = 0; i < this.numSsrc; i++) {
        this.ssrcList[i] = this._io.readU4be();
      }
    }
    Object.defineProperty(PsfbAfbRembPacket.prototype, 'maxTotalBitrate', {
      get: function() {
        if (this._m_maxTotalBitrate !== undefined)
          return this._m_maxTotalBitrate;
        this._m_maxTotalBitrate = (this.brMantissa * (1 << this.brExp));
        return this._m_maxTotalBitrate;
      }
    });

    return PsfbAfbRembPacket;
  })();

  var SrPacket = RtcpPayload.SrPacket = (function() {
    function SrPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SrPacket.prototype._read = function() {
      this.ssrc = this._io.readU4be();
      this.ntpMsw = this._io.readU4be();
      this.ntpLsw = this._io.readU4be();
      this.rtpTimestamp = this._io.readU4be();
      this.senderPacketCount = this._io.readU4be();
      this.senderOctetCount = this._io.readU4be();
      this.reportBlock = new Array(this._parent.subtype);
      for (var i = 0; i < this._parent.subtype; i++) {
        this.reportBlock[i] = new ReportBlock(this._io, this, this._root);
      }
    }
    Object.defineProperty(SrPacket.prototype, 'ntp', {
      get: function() {
        if (this._m_ntp !== undefined)
          return this._m_ntp;
        this._m_ntp = ((this.ntpMsw << 32) & this.ntpLsw);
        return this._m_ntp;
      }
    });

    return SrPacket;
  })();

  var RrPacket = RtcpPayload.RrPacket = (function() {
    function RrPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RrPacket.prototype._read = function() {
      this.ssrc = this._io.readU4be();
      this.reportBlock = new Array(this._parent.subtype);
      for (var i = 0; i < this._parent.subtype; i++) {
        this.reportBlock[i] = new ReportBlock(this._io, this, this._root);
      }
    }

    return RrPacket;
  })();

  var RtcpPacket = RtcpPayload.RtcpPacket = (function() {
    function RtcpPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RtcpPacket.prototype._read = function() {
      this.version = this._io.readBitsInt(2);
      this.padding = this._io.readBitsInt(1) != 0;
      this.subtype = this._io.readBitsInt(5);
      this._io.alignToByte();
      this.payloadType = this._io.readU1();
      this.length = this._io.readU2be();
      switch (this.payloadType) {
      case RtcpPayload.PayloadType.SR:
        this._raw_body = this._io.readBytes((4 * this.length));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SrPacket(_io__raw_body, this, this._root);
        break;
      case RtcpPayload.PayloadType.PSFB:
        this._raw_body = this._io.readBytes((4 * this.length));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new PsfbPacket(_io__raw_body, this, this._root);
        break;
      case RtcpPayload.PayloadType.RR:
        this._raw_body = this._io.readBytes((4 * this.length));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new RrPacket(_io__raw_body, this, this._root);
        break;
      case RtcpPayload.PayloadType.RTPFB:
        this._raw_body = this._io.readBytes((4 * this.length));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new RtpfbPacket(_io__raw_body, this, this._root);
        break;
      case RtcpPayload.PayloadType.SDES:
        this._raw_body = this._io.readBytes((4 * this.length));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SdesPacket(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes((4 * this.length));
        break;
      }
    }

    return RtcpPacket;
  })();

  var SdesTlv = RtcpPayload.SdesTlv = (function() {
    function SdesTlv(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SdesTlv.prototype._read = function() {
      this.type = this._io.readU1();
      if (this.type != RtcpPayload.SdesSubtype.PAD) {
        this.length = this._io.readU1();
      }
      if (this.type != RtcpPayload.SdesSubtype.PAD) {
        this.value = this._io.readBytes(this.length);
      }
    }

    return SdesTlv;
  })();

  var ReportBlock = RtcpPayload.ReportBlock = (function() {
    function ReportBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ReportBlock.prototype._read = function() {
      this.ssrcSource = this._io.readU4be();
      this.lostVal = this._io.readU1();
      this.highestSeqNumReceived = this._io.readU4be();
      this.interarrivalJitter = this._io.readU4be();
      this.lsr = this._io.readU4be();
      this.dlsr = this._io.readU4be();
    }
    Object.defineProperty(ReportBlock.prototype, 'fractionLost', {
      get: function() {
        if (this._m_fractionLost !== undefined)
          return this._m_fractionLost;
        this._m_fractionLost = (this.lostVal >>> 24);
        return this._m_fractionLost;
      }
    });
    Object.defineProperty(ReportBlock.prototype, 'cumulativePacketsLost', {
      get: function() {
        if (this._m_cumulativePacketsLost !== undefined)
          return this._m_cumulativePacketsLost;
        this._m_cumulativePacketsLost = (this.lostVal & 16777215);
        return this._m_cumulativePacketsLost;
      }
    });

    return ReportBlock;
  })();

  var RtpfbTransportFeedbackPacket = RtcpPayload.RtpfbTransportFeedbackPacket = (function() {
    function RtpfbTransportFeedbackPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RtpfbTransportFeedbackPacket.prototype._read = function() {
      this.baseSequenceNumber = this._io.readU2be();
      this.packetStatusCount = this._io.readU2be();
      this.b4 = this._io.readU4be();
      this.remaining = this._io.readBytesFull();
    }
    Object.defineProperty(RtpfbTransportFeedbackPacket.prototype, 'referenceTime', {
      get: function() {
        if (this._m_referenceTime !== undefined)
          return this._m_referenceTime;
        this._m_referenceTime = (this.b4 >>> 8);
        return this._m_referenceTime;
      }
    });
    Object.defineProperty(RtpfbTransportFeedbackPacket.prototype, 'fbPktCount', {
      get: function() {
        if (this._m_fbPktCount !== undefined)
          return this._m_fbPktCount;
        this._m_fbPktCount = (this.b4 & 255);
        return this._m_fbPktCount;
      }
    });
    Object.defineProperty(RtpfbTransportFeedbackPacket.prototype, 'packetStatus', {
      get: function() {
        if (this._m_packetStatus !== undefined)
          return this._m_packetStatus;
        this._m_packetStatus = this._io.readBytes(0);
        return this._m_packetStatus;
      }
    });
    Object.defineProperty(RtpfbTransportFeedbackPacket.prototype, 'recvDelta', {
      get: function() {
        if (this._m_recvDelta !== undefined)
          return this._m_recvDelta;
        this._m_recvDelta = this._io.readBytes(0);
        return this._m_recvDelta;
      }
    });

    return RtpfbTransportFeedbackPacket;
  })();

  var PsfbPacket = RtcpPayload.PsfbPacket = (function() {
    function PsfbPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PsfbPacket.prototype._read = function() {
      this.ssrc = this._io.readU4be();
      this.ssrcMediaSource = this._io.readU4be();
      switch (this.fmt) {
      case RtcpPayload.PsfbSubtype.AFB:
        this._raw_fciBlock = this._io.readBytesFull();
        var _io__raw_fciBlock = new KaitaiStream(this._raw_fciBlock);
        this.fciBlock = new PsfbAfbPacket(_io__raw_fciBlock, this, this._root);
        break;
      default:
        this.fciBlock = this._io.readBytesFull();
        break;
      }
    }
    Object.defineProperty(PsfbPacket.prototype, 'fmt', {
      get: function() {
        if (this._m_fmt !== undefined)
          return this._m_fmt;
        this._m_fmt = this._parent.subtype;
        return this._m_fmt;
      }
    });

    return PsfbPacket;
  })();

  var SourceChunk = RtcpPayload.SourceChunk = (function() {
    function SourceChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SourceChunk.prototype._read = function() {
      this.ssrc = this._io.readU4be();
      this.sdesTlv = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.sdesTlv.push(new SdesTlv(this._io, this, this._root));
        i++;
      }
    }

    return SourceChunk;
  })();

  var SdesPacket = RtcpPayload.SdesPacket = (function() {
    function SdesPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SdesPacket.prototype._read = function() {
      this.sourceChunk = new Array(this.sourceCount);
      for (var i = 0; i < this.sourceCount; i++) {
        this.sourceChunk[i] = new SourceChunk(this._io, this, this._root);
      }
    }
    Object.defineProperty(SdesPacket.prototype, 'sourceCount', {
      get: function() {
        if (this._m_sourceCount !== undefined)
          return this._m_sourceCount;
        this._m_sourceCount = this._parent.subtype;
        return this._m_sourceCount;
      }
    });

    return SdesPacket;
  })();

  var RtpfbPacket = RtcpPayload.RtpfbPacket = (function() {
    function RtpfbPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RtpfbPacket.prototype._read = function() {
      this.ssrc = this._io.readU4be();
      this.ssrcMediaSource = this._io.readU4be();
      switch (this.fmt) {
      case RtcpPayload.RtpfbSubtype.TRANSPORT_FEEDBACK:
        this._raw_fciBlock = this._io.readBytesFull();
        var _io__raw_fciBlock = new KaitaiStream(this._raw_fciBlock);
        this.fciBlock = new RtpfbTransportFeedbackPacket(_io__raw_fciBlock, this, this._root);
        break;
      default:
        this.fciBlock = this._io.readBytesFull();
        break;
      }
    }
    Object.defineProperty(RtpfbPacket.prototype, 'fmt', {
      get: function() {
        if (this._m_fmt !== undefined)
          return this._m_fmt;
        this._m_fmt = this._parent.subtype;
        return this._m_fmt;
      }
    });

    return RtpfbPacket;
  })();

  var PacketStatusChunk = RtcpPayload.PacketStatusChunk = (function() {
    function PacketStatusChunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PacketStatusChunk.prototype._read = function() {
      this.t = this._io.readBitsInt(1) != 0;
      if ((this.t | 0) == 0) {
        this.s2 = this._io.readBitsInt(2);
      }
      if ((this.t | 0) == 1) {
        this.s1 = this._io.readBitsInt(1) != 0;
      }
      if ((this.t | 0) == 0) {
        this.rle = this._io.readBitsInt(13);
      }
      if ((this.t | 0) == 1) {
        this.symbolList = this._io.readBitsInt(14);
      }
    }
    Object.defineProperty(PacketStatusChunk.prototype, 's', {
      get: function() {
        if (this._m_s !== undefined)
          return this._m_s;
        this._m_s = ((this.t | 0) == 0 ? this.s2 : ((this.s1 | 0) == 0 ? 1 : 0));
        return this._m_s;
      }
    });

    return PacketStatusChunk;
  })();

  var PsfbAfbPacket = RtcpPayload.PsfbAfbPacket = (function() {
    function PsfbAfbPacket(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PsfbAfbPacket.prototype._read = function() {
      this.uid = this._io.readU4be();
      switch (this.uid) {
      case 1380273474:
        this._raw_contents = this._io.readBytesFull();
        var _io__raw_contents = new KaitaiStream(this._raw_contents);
        this.contents = new PsfbAfbRembPacket(_io__raw_contents, this, this._root);
        break;
      default:
        this.contents = this._io.readBytesFull();
        break;
      }
    }

    return PsfbAfbPacket;
  })();

  return RtcpPayload;
})();
return RtcpPayload;
}));
