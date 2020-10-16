// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Id3v23 = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Id3v23 = (function() {
  function Id3v23(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Id3v23.prototype._read = function() {
    this.tag = new Tag(this._io, this, this._root);
  }

  var U1beSynchsafe = Id3v23.U1beSynchsafe = (function() {
    function U1beSynchsafe(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    U1beSynchsafe.prototype._read = function() {
      this.padding = this._io.readBitsIntBe(1) != 0;
      this.value = this._io.readBitsIntBe(7);
    }

    return U1beSynchsafe;
  })();

  var U2beSynchsafe = Id3v23.U2beSynchsafe = (function() {
    function U2beSynchsafe(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    U2beSynchsafe.prototype._read = function() {
      this.byte0 = new U1beSynchsafe(this._io, this, this._root);
      this.byte1 = new U1beSynchsafe(this._io, this, this._root);
    }
    Object.defineProperty(U2beSynchsafe.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = ((this.byte0.value << 7) | this.byte1.value);
        return this._m_value;
      }
    });

    return U2beSynchsafe;
  })();

  var Tag = Id3v23.Tag = (function() {
    function Tag(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Tag.prototype._read = function() {
      this.header = new Header(this._io, this, this._root);
      if (this.header.flags.flagHeaderex) {
        this.headerEx = new HeaderEx(this._io, this, this._root);
      }
      this.frames = []
      var i = 0;
      do {
        var _ = new Frame(this._io, this, this._root);
        this.frames.push(_);
        i++;
      } while (!( (((this._io.pos + _.size) > this.header.size.value) || (_.isInvalid)) ));
      if (this.header.flags.flagHeaderex) {
        this.padding = this._io.readBytes((this.headerEx.paddingSize - this._io.pos));
      }
    }

    return Tag;
  })();

  var U4beSynchsafe = Id3v23.U4beSynchsafe = (function() {
    function U4beSynchsafe(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    U4beSynchsafe.prototype._read = function() {
      this.short0 = new U2beSynchsafe(this._io, this, this._root);
      this.short1 = new U2beSynchsafe(this._io, this, this._root);
    }
    Object.defineProperty(U4beSynchsafe.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = ((this.short0.value << 14) | this.short1.value);
        return this._m_value;
      }
    });

    return U4beSynchsafe;
  })();

  var Frame = Id3v23.Frame = (function() {
    function Frame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Frame.prototype._read = function() {
      this.id = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.size = this._io.readU4be();
      this.flags = new Flags(this._io, this, this._root);
      this.data = this._io.readBytes(this.size);
    }

    var Flags = Frame.Flags = (function() {
      function Flags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Flags.prototype._read = function() {
        this.flagDiscardAlterTag = this._io.readBitsIntBe(1) != 0;
        this.flagDiscardAlterFile = this._io.readBitsIntBe(1) != 0;
        this.flagReadOnly = this._io.readBitsIntBe(1) != 0;
        this.reserved1 = this._io.readBitsIntBe(5);
        this.flagCompressed = this._io.readBitsIntBe(1) != 0;
        this.flagEncrypted = this._io.readBitsIntBe(1) != 0;
        this.flagGrouping = this._io.readBitsIntBe(1) != 0;
        this.reserved2 = this._io.readBitsIntBe(5);
      }

      return Flags;
    })();
    Object.defineProperty(Frame.prototype, 'isInvalid', {
      get: function() {
        if (this._m_isInvalid !== undefined)
          return this._m_isInvalid;
        this._m_isInvalid = this.id == "\x00\x00\x00\x00";
        return this._m_isInvalid;
      }
    });

    return Frame;
  })();

  /**
   * ID3v2 extended header
   * @see Section 3.2. ID3v2 extended header
   */

  var HeaderEx = Id3v23.HeaderEx = (function() {
    function HeaderEx(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderEx.prototype._read = function() {
      this.size = this._io.readU4be();
      this.flagsEx = new FlagsEx(this._io, this, this._root);
      this.paddingSize = this._io.readU4be();
      if (this.flagsEx.flagCrc) {
        this.crc = this._io.readU4be();
      }
    }

    var FlagsEx = HeaderEx.FlagsEx = (function() {
      function FlagsEx(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FlagsEx.prototype._read = function() {
        this.flagCrc = this._io.readBitsIntBe(1) != 0;
        this.reserved = this._io.readBitsIntBe(15);
      }

      return FlagsEx;
    })();

    return HeaderEx;
  })();

  /**
   * ID3v2 fixed header
   * @see Section 3.1. ID3v2 header
   */

  var Header = Id3v23.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(3);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [73, 68, 51]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([73, 68, 51], this.magic, this._io, "/types/header/seq/0");
      }
      this.versionMajor = this._io.readU1();
      this.versionRevision = this._io.readU1();
      this.flags = new Flags(this._io, this, this._root);
      this.size = new U4beSynchsafe(this._io, this, this._root);
    }

    var Flags = Header.Flags = (function() {
      function Flags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Flags.prototype._read = function() {
        this.flagUnsynchronization = this._io.readBitsIntBe(1) != 0;
        this.flagHeaderex = this._io.readBitsIntBe(1) != 0;
        this.flagExperimental = this._io.readBitsIntBe(1) != 0;
        this.reserved = this._io.readBitsIntBe(5);
      }

      return Flags;
    })();

    return Header;
  })();

  return Id3v23;
})();
return Id3v23;
}));
