// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Id3v24 = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link http://id3.org/id3v2.4.0-structure|Source}
 * @see {@link http://id3.org/id3v2.4.0-frames|Source}
 */

var Id3v24 = (function() {
  function Id3v24(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Id3v24.prototype._read = function() {
    this.tag = new Tag(this._io, this, this._root);
  }

  var U1beSynchsafe = Id3v24.U1beSynchsafe = (function() {
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

  var U2beSynchsafe = Id3v24.U2beSynchsafe = (function() {
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

  var Tag = Id3v24.Tag = (function() {
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
      this.frames = [];
      var i = 0;
      do {
        var _ = new Frame(this._io, this, this._root);
        this.frames.push(_);
        i++;
      } while (!( (((this._io.pos + _.size.value) > this.header.size.value) || (_.isInvalid)) ));
      if (!(this.header.flags.flagFooter)) {
        this.padding = new Padding(this._io, this, this._root);
      }
      if (this.header.flags.flagFooter) {
        this.footer = new Footer(this._io, this, this._root);
      }
    }

    return Tag;
  })();

  var U4beSynchsafe = Id3v24.U4beSynchsafe = (function() {
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

  var Frame = Id3v24.Frame = (function() {
    function Frame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Frame.prototype._read = function() {
      this.id = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.size = new U4beSynchsafe(this._io, this, this._root);
      this.flagsStatus = new FlagsStatus(this._io, this, this._root);
      this.flagsFormat = new FlagsFormat(this._io, this, this._root);
      this.data = this._io.readBytes(this.size.value);
    }

    var FlagsStatus = Frame.FlagsStatus = (function() {
      function FlagsStatus(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FlagsStatus.prototype._read = function() {
        this.reserved1 = this._io.readBitsIntBe(1) != 0;
        this.flagDiscardAlterTag = this._io.readBitsIntBe(1) != 0;
        this.flagDiscardAlterFile = this._io.readBitsIntBe(1) != 0;
        this.flagReadOnly = this._io.readBitsIntBe(1) != 0;
        this.reserved2 = this._io.readBitsIntBe(4);
      }

      return FlagsStatus;
    })();

    var FlagsFormat = Frame.FlagsFormat = (function() {
      function FlagsFormat(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FlagsFormat.prototype._read = function() {
        this.reserved1 = this._io.readBitsIntBe(1) != 0;
        this.flagGrouping = this._io.readBitsIntBe(1) != 0;
        this.reserved2 = this._io.readBitsIntBe(2);
        this.flagCompressed = this._io.readBitsIntBe(1) != 0;
        this.flagEncrypted = this._io.readBitsIntBe(1) != 0;
        this.flagUnsynchronisated = this._io.readBitsIntBe(1) != 0;
        this.flagIndicator = this._io.readBitsIntBe(1) != 0;
      }

      return FlagsFormat;
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

  var HeaderEx = Id3v24.HeaderEx = (function() {
    function HeaderEx(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderEx.prototype._read = function() {
      this.size = new U4beSynchsafe(this._io, this, this._root);
      this.flagsEx = new FlagsEx(this._io, this, this._root);
      this.data = this._io.readBytes((this.size.value - 5));
    }

    var FlagsEx = HeaderEx.FlagsEx = (function() {
      function FlagsEx(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FlagsEx.prototype._read = function() {
        this.reserved1 = this._io.readBitsIntBe(1) != 0;
        this.flagUpdate = this._io.readBitsIntBe(1) != 0;
        this.flagCrc = this._io.readBitsIntBe(1) != 0;
        this.flagRestrictions = this._io.readBitsIntBe(1) != 0;
        this.reserved2 = this._io.readBitsIntBe(4);
      }

      return FlagsEx;
    })();

    return HeaderEx;
  })();

  var Header = Id3v24.Header = (function() {
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
        this.flagFooter = this._io.readBitsIntBe(1) != 0;
        this.reserved = this._io.readBitsIntBe(4);
      }

      return Flags;
    })();

    return Header;
  })();

  var Padding = Id3v24.Padding = (function() {
    function Padding(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Padding.prototype._read = function() {
      this.padding = this._io.readBytes((this._root.tag.header.size.value - this._io.pos));
    }

    return Padding;
  })();

  var Footer = Id3v24.Footer = (function() {
    function Footer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Footer.prototype._read = function() {
      this.magic = this._io.readBytes(3);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [51, 68, 73]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([51, 68, 73], this.magic, this._io, "/types/footer/seq/0");
      }
      this.versionMajor = this._io.readU1();
      this.versionRevision = this._io.readU1();
      this.flags = new Flags(this._io, this, this._root);
      this.size = new U4beSynchsafe(this._io, this, this._root);
    }

    var Flags = Footer.Flags = (function() {
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
        this.flagFooter = this._io.readBitsIntBe(1) != 0;
        this.reserved = this._io.readBitsIntBe(4);
      }

      return Flags;
    })();

    return Footer;
  })();

  return Id3v24;
})();
return Id3v24;
}));
