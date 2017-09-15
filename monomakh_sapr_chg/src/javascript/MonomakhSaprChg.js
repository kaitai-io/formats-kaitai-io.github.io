// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * CHG is a container format file used by
 * [MONOMAKH-SAPR](https://www.liraland.com/mono/index.php), a software
 * package for analysis & design of reinforced concrete multi-storey
 * buildings with arbitrary configuration in plan.
 * 
 * CHG is a simple container, which bundles several project files
 * together.
 * 
 * Written and tested by Vladimir Shulzhitskiy, 2017
 */

var MonomakhSaprChg = (function() {
  function MonomakhSaprChg(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MonomakhSaprChg.prototype._read = function() {
    this.title = KaitaiStream.bytesToStr(this._io.readBytes(10), "ascii");
    this.ent = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.ent.push(new Block(this._io, this, this._root));
      i++;
    }
  }

  var Block = MonomakhSaprChg.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.header = KaitaiStream.bytesToStr(this._io.readBytes(13), "ascii");
      this.fileSize = this._io.readU8le();
      this.file = this._io.readBytes(this.fileSize);
    }

    return Block;
  })();

  return MonomakhSaprChg;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('MonomakhSaprChg', [], function() {
    return MonomakhSaprChg;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = MonomakhSaprChg;
}
