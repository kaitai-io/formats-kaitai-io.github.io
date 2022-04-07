// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.NtMdtPal = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * It is a color scheme for visualising SPM scans.
 */

var NtMdtPal = (function() {
  function NtMdtPal(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  NtMdtPal.prototype._read = function() {
    this.signature = this._io.readBytes(26);
    if (!((KaitaiStream.byteArrayCompare(this.signature, [78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33], this.signature, this._io, "/seq/0");
    }
    this.count = this._io.readU4be();
    this.meta = new Array(this.count);
    for (var i = 0; i < this.count; i++) {
      this.meta[i] = new Meta(this._io, this, this._root);
    }
    this.something2 = this._io.readBytes(1);
    this.tables = new Array(this.count);
    for (var i = 0; i < this.count; i++) {
      this.tables[i] = new ColTable(this._io, this, this._root, i);
    }
  }

  var Meta = NtMdtPal.Meta = (function() {
    function Meta(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Meta.prototype._read = function() {
      this.unkn00 = this._io.readBytes(3);
      this.unkn01 = this._io.readBytes(2);
      this.unkn02 = this._io.readBytes(1);
      this.unkn03 = this._io.readBytes(1);
      this.colorsCount = this._io.readU2le();
      this.unkn10 = this._io.readBytes(2);
      this.unkn11 = this._io.readBytes(1);
      this.unkn12 = this._io.readBytes(2);
      this.nameSize = this._io.readU2be();
    }

    /**
     * usually 0s
     */

    /**
     * usually 0s
     */

    /**
     * usually 0s
     */

    /**
     * usually 4
     */

    /**
     * usually 0s
     */

    return Meta;
  })();

  var Color = NtMdtPal.Color = (function() {
    function Color(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Color.prototype._read = function() {
      this.red = this._io.readU1();
      this.unkn = this._io.readU1();
      this.blue = this._io.readU1();
      this.green = this._io.readU1();
    }

    return Color;
  })();

  var ColTable = NtMdtPal.ColTable = (function() {
    function ColTable(_io, _parent, _root, index) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.index = index;

      this._read();
    }
    ColTable.prototype._read = function() {
      this.size1 = this._io.readU1();
      this.unkn = this._io.readU1();
      this.title = KaitaiStream.bytesToStr(this._io.readBytes(this._root.meta[this.index].nameSize), "UTF-16LE");
      this.unkn1 = this._io.readU2be();
      this.colors = new Array((this._root.meta[this.index].colorsCount - 1));
      for (var i = 0; i < (this._root.meta[this.index].colorsCount - 1); i++) {
        this.colors[i] = new Color(this._io, this, this._root);
      }
    }

    return ColTable;
  })();

  return NtMdtPal;
})();
return NtMdtPal;
}));
