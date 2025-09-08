// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Websocket || (root.Websocket = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Websocket_, KaitaiStream) {
/**
 * The WebSocket protocol establishes a two-way communication channel via TCP.
 * Messages are made up of one or more dataframes, and are delineated by
 * frames with the `fin` bit set.
 */

var Websocket = (function() {
  Websocket.Opcode = Object.freeze({
    CONTINUATION: 0,
    TEXT: 1,
    BINARY: 2,
    RESERVED_3: 3,
    RESERVED_4: 4,
    RESERVED_5: 5,
    RESERVED_6: 6,
    RESERVED_7: 7,
    CLOSE: 8,
    PING: 9,
    PONG: 10,
    RESERVED_CONTROL_B: 11,
    RESERVED_CONTROL_C: 12,
    RESERVED_CONTROL_D: 13,
    RESERVED_CONTROL_E: 14,
    RESERVED_CONTROL_F: 15,

    0: "CONTINUATION",
    1: "TEXT",
    2: "BINARY",
    3: "RESERVED_3",
    4: "RESERVED_4",
    5: "RESERVED_5",
    6: "RESERVED_6",
    7: "RESERVED_7",
    8: "CLOSE",
    9: "PING",
    10: "PONG",
    11: "RESERVED_CONTROL_B",
    12: "RESERVED_CONTROL_C",
    13: "RESERVED_CONTROL_D",
    14: "RESERVED_CONTROL_E",
    15: "RESERVED_CONTROL_F",
  });

  function Websocket(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Websocket.prototype._read = function() {
    this.initialFrame = new InitialFrame(this._io, this, this._root);
    if (this.initialFrame.header.finished != true) {
      this.trailingFrames = [];
      var i = 0;
      do {
        var _ = new Dataframe(this._io, this, this._root);
        this.trailingFrames.push(_);
        i++;
      } while (!(_.header.finished));
    }
  }

  var Dataframe = Websocket.Dataframe = (function() {
    function Dataframe(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Dataframe.prototype._read = function() {
      this.header = new FrameHeader(this._io, this, this._root);
      if (this._root.initialFrame.header.opcode != Websocket.Opcode.TEXT) {
        this.payloadBytes = this._io.readBytes(this.header.lenPayload);
      }
      if (this._root.initialFrame.header.opcode == Websocket.Opcode.TEXT) {
        this.payloadText = KaitaiStream.bytesToStr(this._io.readBytes(this.header.lenPayload), "UTF-8");
      }
    }

    return Dataframe;
  })();

  var FrameHeader = Websocket.FrameHeader = (function() {
    function FrameHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FrameHeader.prototype._read = function() {
      this.finished = this._io.readBitsIntBe(1) != 0;
      this.reserved = this._io.readBitsIntBe(3);
      this.opcode = this._io.readBitsIntBe(4);
      this.isMasked = this._io.readBitsIntBe(1) != 0;
      this.lenPayloadPrimary = this._io.readBitsIntBe(7);
      this._io.alignToByte();
      if (this.lenPayloadPrimary == 126) {
        this.lenPayloadExtended1 = this._io.readU2be();
      }
      if (this.lenPayloadPrimary == 127) {
        this.lenPayloadExtended2 = this._io.readU4be();
      }
      if (this.isMasked) {
        this.maskKey = this._io.readU4be();
      }
    }
    Object.defineProperty(FrameHeader.prototype, 'lenPayload', {
      get: function() {
        if (this._m_lenPayload !== undefined)
          return this._m_lenPayload;
        this._m_lenPayload = (this.lenPayloadPrimary <= 125 ? this.lenPayloadPrimary : (this.lenPayloadPrimary == 126 ? this.lenPayloadExtended1 : this.lenPayloadExtended2));
        return this._m_lenPayload;
      }
    });

    return FrameHeader;
  })();

  var InitialFrame = Websocket.InitialFrame = (function() {
    function InitialFrame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    InitialFrame.prototype._read = function() {
      this.header = new FrameHeader(this._io, this, this._root);
      if (this.header.opcode != Websocket.Opcode.TEXT) {
        this.payloadBytes = this._io.readBytes(this.header.lenPayload);
      }
      if (this.header.opcode == Websocket.Opcode.TEXT) {
        this.payloadText = KaitaiStream.bytesToStr(this._io.readBytes(this.header.lenPayload), "UTF-8");
      }
    }

    return InitialFrame;
  })();

  return Websocket;
})();
Websocket_.Websocket = Websocket;
});
