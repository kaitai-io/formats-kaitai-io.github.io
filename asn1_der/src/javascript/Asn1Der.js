// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Asn1Der = (function() {
  Asn1Der.TypeTag = Object.freeze({
    END_OF_CONTENT: 0,
    BOOLEAN: 1,
    INTEGER: 2,
    BIT_STRING: 3,
    OCTET_STRING: 4,
    NULL_VALUE: 5,
    OBJECT_ID: 6,
    OBJECT_DESCRIPTOR: 7,
    EXTERNAL: 8,
    REAL: 9,
    ENUMERATED: 10,
    EMBEDDED_PDV: 11,
    UTF8STRING: 12,
    RELATIVE_OID: 13,
    SEQUENCE_10: 16,
    PRINTABLE_STRING: 19,
    IA5STRING: 22,
    SEQUENCE_30: 48,
    SET: 49,

    0: "END_OF_CONTENT",
    1: "BOOLEAN",
    2: "INTEGER",
    3: "BIT_STRING",
    4: "OCTET_STRING",
    5: "NULL_VALUE",
    6: "OBJECT_ID",
    7: "OBJECT_DESCRIPTOR",
    8: "EXTERNAL",
    9: "REAL",
    10: "ENUMERATED",
    11: "EMBEDDED_PDV",
    12: "UTF8STRING",
    13: "RELATIVE_OID",
    16: "SEQUENCE_10",
    19: "PRINTABLE_STRING",
    22: "IA5STRING",
    48: "SEQUENCE_30",
    49: "SET",
  });

  function Asn1Der(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Asn1Der.prototype._read = function() {
    this.typeTag = this._io.readU1();
    this.len = new LenEncoded(this._io, this, this._root);
    switch (this.typeTag) {
    case Asn1Der.TypeTag.SEQUENCE_30:
      this._raw_body = this._io.readBytes(this.len.result);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new BodySequence(_io__raw_body, this, this._root);
      break;
    case Asn1Der.TypeTag.SEQUENCE_10:
      this._raw_body = this._io.readBytes(this.len.result);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new BodySequence(_io__raw_body, this, this._root);
      break;
    case Asn1Der.TypeTag.UTF8STRING:
      this._raw_body = this._io.readBytes(this.len.result);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new BodyUtf8string(_io__raw_body, this, this._root);
      break;
    case Asn1Der.TypeTag.PRINTABLE_STRING:
      this._raw_body = this._io.readBytes(this.len.result);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new BodyPrintableString(_io__raw_body, this, this._root);
      break;
    case Asn1Der.TypeTag.SET:
      this._raw_body = this._io.readBytes(this.len.result);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new BodySequence(_io__raw_body, this, this._root);
      break;
    default:
      this.body = this._io.readBytes(this.len.result);
      break;
    }
  }

  var LenEncoded = Asn1Der.LenEncoded = (function() {
    function LenEncoded(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LenEncoded.prototype._read = function() {
      this.b1 = this._io.readU1();
      if (this.b1 == 130) {
        this.int2 = this._io.readU2be();
      }
    }
    Object.defineProperty(LenEncoded.prototype, 'result', {
      get: function() {
        if (this._m_result !== undefined)
          return this._m_result;
        this._m_result = ((this.b1 & 128) == 0 ? this.b1 : this.int2);
        return this._m_result;
      }
    });

    return LenEncoded;
  })();

  var BodySequence = Asn1Der.BodySequence = (function() {
    function BodySequence(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BodySequence.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Asn1Der(this._io, this, null));
        i++;
      }
    }

    return BodySequence;
  })();

  var BodyUtf8string = Asn1Der.BodyUtf8string = (function() {
    function BodyUtf8string(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BodyUtf8string.prototype._read = function() {
      this.str = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    return BodyUtf8string;
  })();

  var BodyPrintableString = Asn1Der.BodyPrintableString = (function() {
    function BodyPrintableString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BodyPrintableString.prototype._read = function() {
      this.str = KaitaiStream.bytesToStr(this._io.readBytesFull(), "ASCII");
    }

    return BodyPrintableString;
  })();

  return Asn1Der;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Asn1Der', [], function() {
    return Asn1Der;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Asn1Der;
}
