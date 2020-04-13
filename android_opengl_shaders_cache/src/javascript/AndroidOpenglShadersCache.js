// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AndroidOpenglShadersCache = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Android apps using directly or indirectly OpenGL cache compiled shaders
 * into com.android.opengl.shaders_cache file.
 * @see {@link https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp|Source}
 */

var AndroidOpenglShadersCache = (function() {
  function AndroidOpenglShadersCache(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidOpenglShadersCache.prototype._read = function() {
    this.magic = this._io.ensureFixedContents([69, 71, 76, 36]);
    this.crc32 = this._io.readU4le();
    this._raw_contents = this._io.readBytesFull();
    var _io__raw_contents = new KaitaiStream(this._raw_contents);
    this.contents = new Cache(_io__raw_contents, this, this._root);
  }

  var Alignment = AndroidOpenglShadersCache.Alignment = (function() {
    function Alignment(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Alignment.prototype._read = function() {
      this.alignment = this._io.readBytes(((this._io.pos + 3) & (~3 - this._io.pos)));
    }

    /**
     * garbage from memory
     */

    return Alignment;
  })();

  var PrefixedString = AndroidOpenglShadersCache.PrefixedString = (function() {
    function PrefixedString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PrefixedString.prototype._read = function() {
      this.lenStr = this._io.readU4le();
      this.str = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(this.lenStr), 0, false), "ascii");
      this.alignment = new Alignment(this._io, this, this._root);
    }

    return PrefixedString;
  })();

  /**
   * @see {@link https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp|Source}
   */

  var Cache = AndroidOpenglShadersCache.Cache = (function() {
    function Cache(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Cache.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([36, 98, 66, 95]);
      this.version = this._io.readU4le();
      this.deviceVersion = this._io.readU4le();
      this.numEntries = this._io.readU4le();
      if (this.version >= 3) {
        this.buildId = new PrefixedString(this._io, this, this._root);
      }
      this.entries = new Array(this.numEntries);
      for (var i = 0; i < this.numEntries; i++) {
        this.entries[i] = new Entry(this._io, this, this._root);
      }
    }

    var Entry = Cache.Entry = (function() {
      function Entry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Entry.prototype._read = function() {
        this.lenKey = this._io.readU4le();
        this.lenValue = this._io.readU4le();
        this.key = this._io.readBytes(this.lenKey);
        this.value = this._io.readBytes(this.lenValue);
        this.alignment = new Alignment(this._io, this, this._root);
      }

      return Entry;
    })();

    return Cache;
  })();

  /**
   * crc32 of `contents`
   */

  return AndroidOpenglShadersCache;
})();
return AndroidOpenglShadersCache;
}));
