// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AndroidNanoappHeader = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130|Source}
 */

var AndroidNanoappHeader = (function() {
  function AndroidNanoappHeader(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidNanoappHeader.prototype._read = function() {
    this.headerVersion = this._io.readU4le();
    if (!(this.headerVersion == 1)) {
      throw new KaitaiStream.ValidationNotEqualError(1, this.headerVersion, this._io, "/seq/0");
    }
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [78, 65, 78, 79]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([78, 65, 78, 79], this.magic, this._io, "/seq/1");
    }
    this.appId = this._io.readU8le();
    this.appVersion = this._io.readU4le();
    this.flags = this._io.readU4le();
    this.hubType = this._io.readU8le();
    this.chreApiMajorVersion = this._io.readU1();
    this.chreApiMinorVersion = this._io.readU1();
    this.reserved = this._io.readBytes(6);
    if (!((KaitaiStream.byteArrayCompare(this.reserved, [0, 0, 0, 0, 0, 0]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0, 0, 0], this.reserved, this._io, "/seq/8");
    }
  }
  Object.defineProperty(AndroidNanoappHeader.prototype, 'isSigned', {
    get: function() {
      if (this._m_isSigned !== undefined)
        return this._m_isSigned;
      this._m_isSigned = (this.flags & 1) != 0;
      return this._m_isSigned;
    }
  });
  Object.defineProperty(AndroidNanoappHeader.prototype, 'isEncrypted', {
    get: function() {
      if (this._m_isEncrypted !== undefined)
        return this._m_isEncrypted;
      this._m_isEncrypted = (this.flags & 2) != 0;
      return this._m_isEncrypted;
    }
  });
  Object.defineProperty(AndroidNanoappHeader.prototype, 'isTcmCapable', {
    get: function() {
      if (this._m_isTcmCapable !== undefined)
        return this._m_isTcmCapable;
      this._m_isTcmCapable = (this.flags & 4) != 0;
      return this._m_isTcmCapable;
    }
  });

  return AndroidNanoappHeader;
})();
return AndroidNanoappHeader;
}));
