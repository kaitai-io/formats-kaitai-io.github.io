// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DcmpVariableLengthInteger = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * A variable-length integer,
 * in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
 * See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
 * 
 * This variable-length integer format can store an integer `x` in any of the following ways:
 * 
 * * In a single byte,
 *   if `0 <= x <= 0x7f`
 *   (7-bit unsigned integer)
 * * In 2 bytes,
 *   if `-0x4000 <= x <= 0x3eff`
 *   (15-bit signed integer with the highest `0x100` values unavailable)
 * * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
 *   (32-bit signed integer)
 * 
 * In practice,
 * values are always stored in the smallest possible format,
 * but technically any of the larger formats could be used as well.
 * @see {@link https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/common.py|Source}
 */

var DcmpVariableLengthInteger = (function() {
  function DcmpVariableLengthInteger(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DcmpVariableLengthInteger.prototype._read = function() {
    this.first = this._io.readU1();
    if (this.first >= 128) {
      switch (this.first) {
      case 255:
        this.more = this._io.readS4be();
        break;
      default:
        this.more = this._io.readU1();
        break;
      }
    }
  }

  /**
   * The decoded value of the variable-length integer.
   */
  Object.defineProperty(DcmpVariableLengthInteger.prototype, 'value', {
    get: function() {
      if (this._m_value !== undefined)
        return this._m_value;
      this._m_value = (this.first == 255 ? this.more : (this.first >= 128 ? (((this.first << 8) | this.more) - 49152) : this.first));
      return this._m_value;
    }
  });

  /**
   * The first byte of the variable-length integer.
   * This determines which storage format is used.
   * 
   * * For the 1-byte format,
   *   this encodes the entire value of the value.
   * * For the 2-byte format,
   *   this encodes the high 7 bits of the value,
   *   minus `0xc0`.
   *   The highest bit of the value,
   *   i. e. the second-highest bit of this field,
   *   is the sign bit.
   * * For the 5-byte format,
   *   this is always `0xff`.
   */

  /**
   * The remaining bytes of the variable-length integer.
   * 
   * * For the 1-byte format,
   *   this is not present.
   * * For the 2-byte format,
   *   this encodes the low 8 bits of the value.
   * * For the 5-byte format,
   *   this encodes the entire value.
   */

  return DcmpVariableLengthInteger;
})();
return DcmpVariableLengthInteger;
}));
