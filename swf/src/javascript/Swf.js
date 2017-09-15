// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Swf = (function() {
  Swf.TagType = Object.freeze({
    FILE_ATTRIBUTES: 69,
    ABC_TAG: 82,

    69: "FILE_ATTRIBUTES",
    82: "ABC_TAG",
  });

  function Swf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Swf.prototype._read = function() {
    this.junk = this._io.readBytes(4);
    this.fileSize = this._io.readU4le();
    this._raw__raw_body = this._io.readBytesFull();
    this._raw_body = KaitaiStream.processZlib(this._raw__raw_body);
    var _io__raw_body = new KaitaiStream(this._raw_body);
    this.body = new SwfBody(_io__raw_body, this, this._root);
  }

  var SwfBody = Swf.SwfBody = (function() {
    function SwfBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SwfBody.prototype._read = function() {
      this.rect = new Rect(this._io, this, this._root);
      this.frameRate = this._io.readU2le();
      this.frameCount = this._io.readU2le();
      this.tags = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.tags.push(new Tag(this._io, this, this._root));
        i++;
      }
    }

    return SwfBody;
  })();

  var Rect = Swf.Rect = (function() {
    function Rect(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Rect.prototype._read = function() {
      this.b1 = this._io.readU1();
      this.skip = this._io.readBytes(this.numBytes);
    }
    Object.defineProperty(Rect.prototype, 'numBits', {
      get: function() {
        if (this._m_numBits !== undefined)
          return this._m_numBits;
        this._m_numBits = (this.b1 >>> 3);
        return this._m_numBits;
      }
    });
    Object.defineProperty(Rect.prototype, 'numBytes', {
      get: function() {
        if (this._m_numBytes !== undefined)
          return this._m_numBytes;
        this._m_numBytes = Math.floor((((this.numBits * 4) - 3) + 7) / 8);
        return this._m_numBytes;
      }
    });

    return Rect;
  })();

  var Tag = Swf.Tag = (function() {
    function Tag(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Tag.prototype._read = function() {
      this.recordHeader = new RecordHeader(this._io, this, this._root);
      switch (this.recordHeader.tagType) {
      case Swf.TagType.ABC_TAG:
        this._raw_tagBody = this._io.readBytes(this.recordHeader.len);
        var _io__raw_tagBody = new KaitaiStream(this._raw_tagBody);
        this.tagBody = new AbcTagBody(_io__raw_tagBody, this, this._root);
        break;
      default:
        this.tagBody = this._io.readBytes(this.recordHeader.len);
        break;
      }
    }

    return Tag;
  })();

  var AbcTagBody = Swf.AbcTagBody = (function() {
    function AbcTagBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AbcTagBody.prototype._read = function() {
      this.flags = this._io.readU4le();
      this.name = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
      this.abcdata = this._io.readBytesFull();
    }

    return AbcTagBody;
  })();

  var RecordHeader = Swf.RecordHeader = (function() {
    function RecordHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordHeader.prototype._read = function() {
      this.tagCodeAndLength = this._io.readU2le();
      if (this.smallLen == 63) {
        this.bigLen = this._io.readS4le();
      }
    }
    Object.defineProperty(RecordHeader.prototype, 'tagType', {
      get: function() {
        if (this._m_tagType !== undefined)
          return this._m_tagType;
        this._m_tagType = (this.tagCodeAndLength >>> 6);
        return this._m_tagType;
      }
    });
    Object.defineProperty(RecordHeader.prototype, 'smallLen', {
      get: function() {
        if (this._m_smallLen !== undefined)
          return this._m_smallLen;
        this._m_smallLen = (this.tagCodeAndLength & 63);
        return this._m_smallLen;
      }
    });
    Object.defineProperty(RecordHeader.prototype, 'len', {
      get: function() {
        if (this._m_len !== undefined)
          return this._m_len;
        this._m_len = (this.smallLen == 63 ? this.bigLen : this.smallLen);
        return this._m_len;
      }
    });

    return RecordHeader;
  })();

  return Swf;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Swf', [], function() {
    return Swf;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Swf;
}
