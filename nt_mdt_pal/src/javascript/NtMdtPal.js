// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
    this.signature = this._io.ensureFixedContents([78, 84, 45, 77, 68, 84, 32, 80, 97, 108, 101, 116, 116, 101, 32, 70, 105, 108, 101, 32, 32, 49, 46, 48, 48, 33]);
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
      this.unkn0 = this._io.readBytes(7);
      this.colorsCount = this._io.readU2le();
      this.unkn1 = this._io.readBytes(5);
      this.nameSize = this._io.readU2be();
    }

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
      this.data = this._io.readBytes(4);
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
      this.title = KaitaiStream.bytesToStr(this._io.readBytes(this._root.meta[this.index].nameSize), "UTF-16");
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

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('NtMdtPal', [], function() {
    return NtMdtPal;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = NtMdtPal;
}
