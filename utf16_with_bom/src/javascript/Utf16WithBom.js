// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Utf16WithBom || (root.Utf16WithBom = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Utf16WithBom_, KaitaiStream) {
/**
 * A simple wrapper which allows to read a UTF-16 encoded string that starts
 * with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
 * encoding, which can be either big-endian (BE) or little-endian (LE).
 * 
 * Use:
 * 
 * * `value` to get the string value with BOM stripped, regardless of endianness.
 * * `is_be` and `is_le` to check the endianness indicated by the BOM.
 * * `bom` to check the raw byte order mark.
 * @see - https://en.wikipedia.org/wiki/Byte_order_mark
 */

var Utf16WithBom = (function() {
  function Utf16WithBom(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Utf16WithBom.prototype._read = function() {
    this.bom = this._io.readBytes(2);
    if (!( (((KaitaiStream.byteArrayCompare(this.bom, new Uint8Array([254, 255])) == 0)) || ((KaitaiStream.byteArrayCompare(this.bom, new Uint8Array([255, 254])) == 0))) )) {
      throw new KaitaiStream.ValidationNotAnyOfError(this.bom, this._io, "/seq/0");
    }
    if (this.isBe) {
      this.strBe = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-16BE");
    }
    if (this.isLe) {
      this.strLe = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-16LE");
    }
  }

  /**
   * True if the byte order mark indicates big-endian UTF-16 encoding.
   */
  Object.defineProperty(Utf16WithBom.prototype, 'isBe', {
    get: function() {
      if (this._m_isBe !== undefined)
        return this._m_isBe;
      this._m_isBe = (KaitaiStream.byteArrayCompare(this.bom, new Uint8Array([254, 255])) == 0);
      return this._m_isBe;
    }
  });

  /**
   * True if the byte order mark indicates little-endian UTF-16 encoding.
   */
  Object.defineProperty(Utf16WithBom.prototype, 'isLe', {
    get: function() {
      if (this._m_isLe !== undefined)
        return this._m_isLe;
      this._m_isLe = (KaitaiStream.byteArrayCompare(this.bom, new Uint8Array([255, 254])) == 0);
      return this._m_isLe;
    }
  });

  /**
   * The string value with BOM stripped, regardless of endianness.
   */
  Object.defineProperty(Utf16WithBom.prototype, 'value', {
    get: function() {
      if (this._m_value !== undefined)
        return this._m_value;
      this._m_value = (this.isBe ? this.strBe : this.strLe);
      return this._m_value;
    }
  });

  /**
   * The byte order mark (BOM) is a special marker at the beginning of the
   * string that indicates the endianness of the UTF-16 encoding. The
   * character U+FEFF is used as the BOM, and its byte representation differs
   * based on endianness:
   * 
   * * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
   * * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
   * 
   * This implementation checks for the presence of a valid BOM and strips it
   * from the resulting string value.
   */

  return Utf16WithBom;
})();
Utf16WithBom_.Utf16WithBom = Utf16WithBom;
});
