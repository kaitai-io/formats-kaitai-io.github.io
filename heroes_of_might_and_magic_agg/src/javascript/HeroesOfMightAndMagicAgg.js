// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.HeroesOfMightAndMagicAgg = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)|Source}
 */

var HeroesOfMightAndMagicAgg = (function() {
  function HeroesOfMightAndMagicAgg(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  HeroesOfMightAndMagicAgg.prototype._read = function() {
    this.numFiles = this._io.readU2le();
    this.entries = [];
    for (var i = 0; i < this.numFiles; i++) {
      this.entries.push(new Entry(this._io, this, this._root));
    }
  }

  var Entry = HeroesOfMightAndMagicAgg.Entry = (function() {
    function Entry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Entry.prototype._read = function() {
      this.hash = this._io.readU2le();
      this.offset = this._io.readU4le();
      this.size = this._io.readU4le();
      this.size2 = this._io.readU4le();
    }
    Object.defineProperty(Entry.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(this.offset);
        this._m_body = this._io.readBytes(this.size);
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return Entry;
  })();

  var Filename = HeroesOfMightAndMagicAgg.Filename = (function() {
    function Filename(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Filename.prototype._read = function() {
      this.str = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
    }

    return Filename;
  })();
  Object.defineProperty(HeroesOfMightAndMagicAgg.prototype, 'filenames', {
    get: function() {
      if (this._m_filenames !== undefined)
        return this._m_filenames;
      var _pos = this._io.pos;
      this._io.seek((this.entries[this.entries.length - 1].offset + this.entries[this.entries.length - 1].size));
      this._raw__m_filenames = [];
      this._m_filenames = [];
      for (var i = 0; i < this.numFiles; i++) {
        this._raw__m_filenames.push(this._io.readBytes(15));
        var _io__raw__m_filenames = new KaitaiStream(this._raw__m_filenames[i]);
        this._m_filenames.push(new Filename(_io__raw__m_filenames, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_filenames;
    }
  });

  return HeroesOfMightAndMagicAgg;
})();
return HeroesOfMightAndMagicAgg;
}));
