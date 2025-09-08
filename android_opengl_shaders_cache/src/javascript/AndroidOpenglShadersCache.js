// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AndroidOpenglShadersCache || (root.AndroidOpenglShadersCache = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AndroidOpenglShadersCache_, KaitaiStream) {
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
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([69, 71, 76, 36])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([69, 71, 76, 36]), this.magic, this._io, "/seq/0");
    }
    this.crc32 = this._io.readU4le();
    this._raw_contents = this._io.readBytesFull();
    var _io__raw_contents = new KaitaiStream(this._raw_contents);
    this.contents = new Cache(_io__raw_contents, this, this._root);
  }

  var Alignment = AndroidOpenglShadersCache.Alignment = (function() {
    function Alignment(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Alignment.prototype._read = function() {
      this.alignment = this._io.readBytes(this._io.pos + 3 & ~3 - this._io.pos);
    }

    /**
     * garbage from memory
     */

    return Alignment;
  })();

  /**
   * @see {@link https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp|Source}
   */

  var Cache = AndroidOpenglShadersCache.Cache = (function() {
    function Cache(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Cache.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([36, 98, 66, 95])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([36, 98, 66, 95]), this.magic, this._io, "/types/cache/seq/0");
      }
      this.version = this._io.readU4le();
      this.deviceVersion = this._io.readU4le();
      this.numEntries = this._io.readU4le();
      if (this.version >= 3) {
        this.buildId = new PrefixedString(this._io, this, this._root);
      }
      this.entries = [];
      for (var i = 0; i < this.numEntries; i++) {
        this.entries.push(new Entry(this._io, this, this._root));
      }
    }

    var Entry = Cache.Entry = (function() {
      function Entry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

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

  var PrefixedString = AndroidOpenglShadersCache.PrefixedString = (function() {
    function PrefixedString(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PrefixedString.prototype._read = function() {
      this.lenStr = this._io.readU4le();
      this.str = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(this.lenStr), 0, false), "ASCII");
      this.alignment = new Alignment(this._io, this, this._root);
    }

    return PrefixedString;
  })();

  /**
   * crc32 of `contents`
   */

  return AndroidOpenglShadersCache;
})();
AndroidOpenglShadersCache_.AndroidOpenglShadersCache = AndroidOpenglShadersCache;
});
