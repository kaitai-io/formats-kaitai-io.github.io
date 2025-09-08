// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AndroidBootldrAsus || (root.AndroidBootldrAsus = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AndroidBootldrAsus_, KaitaiStream) {
/**
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 * @see {@link https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py|Source}
 */

var AndroidBootldrAsus = (function() {
  function AndroidBootldrAsus(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidBootldrAsus.prototype._read = function() {
    this.magic = this._io.readBytes(8);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([66, 79, 79, 84, 76, 68, 82, 33])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([66, 79, 79, 84, 76, 68, 82, 33]), this.magic, this._io, "/seq/0");
    }
    this.revision = this._io.readU2le();
    if (!(this.revision >= 2)) {
      throw new KaitaiStream.ValidationLessThanError(2, this.revision, this._io, "/seq/1");
    }
    this.reserved1 = this._io.readU2le();
    this.reserved2 = this._io.readU4le();
    this.images = [];
    for (var i = 0; i < 3; i++) {
      this.images.push(new Image(this._io, this, this._root));
    }
  }

  var Image = AndroidBootldrAsus.Image = (function() {
    function Image(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Image.prototype._read = function() {
      this.chunkId = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      if (!( ((this.chunkId == "IFWI!!!!") || (this.chunkId == "DROIDBT!") || (this.chunkId == "SPLASHS!")) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.chunkId, this._io, "/types/image/seq/0");
      }
      this.lenBody = this._io.readU4le();
      this.flags = this._io.readU1();
      var _ = this.flags;
      if (!((_ & 1) != 0)) {
        throw new KaitaiStream.ValidationExprError(this.flags, this._io, "/types/image/seq/2");
      }
      this.reserved1 = this._io.readU1();
      this.reserved2 = this._io.readU1();
      this.reserved3 = this._io.readU1();
      this.body = this._io.readBytes(this.lenBody);
    }
    Object.defineProperty(Image.prototype, 'fileName', {
      get: function() {
        if (this._m_fileName !== undefined)
          return this._m_fileName;
        this._m_fileName = (this.chunkId == "IFWI!!!!" ? "ifwi.bin" : (this.chunkId == "DROIDBT!" ? "droidboot.img" : (this.chunkId == "SPLASHS!" ? "splashscreen.img" : "")));
        return this._m_fileName;
      }
    });

    return Image;
  })();

  /**
   * Only three images are included: `ifwi.bin`, `droidboot.img`
   * and `splashscreen.img`
   */

  return AndroidBootldrAsus;
})();
AndroidBootldrAsus_.AndroidBootldrAsus = AndroidBootldrAsus;
});
