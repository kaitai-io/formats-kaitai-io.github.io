// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Pcx'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Pcx'));
  } else {
    factory(root.PcxDcx || (root.PcxDcx = {}), root.KaitaiStream, root.Pcx || (root.Pcx = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (PcxDcx_, KaitaiStream, Pcx_) {
/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseded with multi-page TIFFs and PDFs since then.
 */

var PcxDcx = (function() {
  function PcxDcx(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  PcxDcx.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([177, 104, 222, 58])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([177, 104, 222, 58]), this.magic, this._io, "/seq/0");
    }
    this.files = [];
    var i = 0;
    do {
      var _ = new PcxOffset(this._io, this, this._root);
      this.files.push(_);
      i++;
    } while (!(_.ofsBody == 0));
  }

  var PcxOffset = PcxDcx.PcxOffset = (function() {
    function PcxOffset(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PcxOffset.prototype._read = function() {
      this.ofsBody = this._io.readU4le();
    }
    Object.defineProperty(PcxOffset.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        if (this.ofsBody != 0) {
          var _pos = this._io.pos;
          this._io.seek(this.ofsBody);
          this._m_body = new Pcx_.Pcx(this._io, null, null);
          this._io.seek(_pos);
        }
        return this._m_body;
      }
    });

    return PcxOffset;
  })();

  return PcxDcx;
})();
PcxDcx_.PcxDcx = PcxDcx;
});
