// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.ZxSpectrumTap = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * TAP files are used by emulators of ZX Spectrum computer (released in
 * 1982 by Sinclair Research). TAP file stores blocks of data as if
 * they are written to magnetic tape, which was used as primary media
 * for ZX Spectrum. Contents of this file can be viewed as a very
 * simple linear filesystem, storing named files with some basic
 * metainformation prepended as a header.
 * @see {@link https://faqwiki.zxnet.co.uk/wiki/TAP_format|Source}
 */

var ZxSpectrumTap = (function() {
  ZxSpectrumTap.FlagEnum = Object.freeze({
    HEADER: 0,
    DATA: 255,

    0: "HEADER",
    255: "DATA",
  });

  ZxSpectrumTap.HeaderTypeEnum = Object.freeze({
    PROGRAM: 0,
    NUM_ARRAY: 1,
    CHAR_ARRAY: 2,
    BYTES: 3,

    0: "PROGRAM",
    1: "NUM_ARRAY",
    2: "CHAR_ARRAY",
    3: "BYTES",
  });

  function ZxSpectrumTap(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ZxSpectrumTap.prototype._read = function() {
    this.blocks = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.blocks.push(new Block(this._io, this, this._root));
      i++;
    }
  }

  var Block = ZxSpectrumTap.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.lenBlock = this._io.readU2le();
      this.flag = this._io.readU1();
      if ( ((this.lenBlock == 19) && (this.flag == ZxSpectrumTap.FlagEnum.HEADER)) ) {
        this.header = new Header(this._io, this, this._root);
      }
      if (this.lenBlock == 19) {
        this.data = this._io.readBytes((this.header.lenData + 4));
      }
      if (this.flag == ZxSpectrumTap.FlagEnum.DATA) {
        this.headerlessData = this._io.readBytes((this.lenBlock - 1));
      }
    }

    return Block;
  })();

  var ProgramParams = ZxSpectrumTap.ProgramParams = (function() {
    function ProgramParams(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ProgramParams.prototype._read = function() {
      this.autostartLine = this._io.readU2le();
      this.lenProgram = this._io.readU2le();
    }

    return ProgramParams;
  })();

  var BytesParams = ZxSpectrumTap.BytesParams = (function() {
    function BytesParams(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BytesParams.prototype._read = function() {
      this.startAddress = this._io.readU2le();
      this.reserved = this._io.readBytes(2);
    }

    return BytesParams;
  })();

  var Header = ZxSpectrumTap.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.headerType = this._io.readU1();
      this.filename = KaitaiStream.bytesStripRight(this._io.readBytes(10), 32);
      this.lenData = this._io.readU2le();
      switch (this.headerType) {
      case ZxSpectrumTap.HeaderTypeEnum.PROGRAM:
        this.params = new ProgramParams(this._io, this, this._root);
        break;
      case ZxSpectrumTap.HeaderTypeEnum.NUM_ARRAY:
        this.params = new ArrayParams(this._io, this, this._root);
        break;
      case ZxSpectrumTap.HeaderTypeEnum.CHAR_ARRAY:
        this.params = new ArrayParams(this._io, this, this._root);
        break;
      case ZxSpectrumTap.HeaderTypeEnum.BYTES:
        this.params = new BytesParams(this._io, this, this._root);
        break;
      }
      this.checksum = this._io.readU1();
    }

    /**
     * Bitwise XOR of all bytes including the flag byte
     */

    return Header;
  })();

  var ArrayParams = ZxSpectrumTap.ArrayParams = (function() {
    function ArrayParams(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ArrayParams.prototype._read = function() {
      this.reserved = this._io.readU1();
      this.varName = this._io.readU1();
      this.reserved1 = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.reserved1, [0, 128]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 128], this.reserved1, this._io, "/types/array_params/seq/2");
      }
    }

    /**
     * Variable name (1..26 meaning A$..Z$ +192)
     */

    return ArrayParams;
  })();

  return ZxSpectrumTap;
})();
return ZxSpectrumTap;
}));
