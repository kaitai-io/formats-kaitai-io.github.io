// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Bcd || (root.Bcd = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Bcd_, KaitaiStream) {
/**
 * BCD (Binary Coded Decimals) is a common way to encode integer
 * numbers in a way that makes human-readable output somewhat
 * simpler. In this encoding scheme, every decimal digit is encoded as
 * either a single byte (8 bits), or a nibble (half of a byte, 4
 * bits). This obviously wastes a lot of bits, but it makes translation
 * into human-readable string much easier than traditional
 * binary-to-decimal conversion process, which includes lots of
 * divisions by 10.
 * 
 * For example, encoding integer 31337 in 8-digit, 8 bits per digit,
 * big endian order of digits BCD format yields
 * 
 * ```
 * 00 00 00 03 01 03 03 07
 * ```
 * 
 * Encoding the same integer as 8-digit, 4 bits per digit, little
 * endian order BCD format would yield:
 * 
 * ```
 * 73 31 30 00
 * ```
 * 
 * Using this type of encoding in Kaitai Struct is pretty
 * straightforward: one calls for this type, specifying desired
 * encoding parameters, and gets result using either `as_int` or
 * `as_str` attributes.
 */

var Bcd = (function() {
  function Bcd(_io, _parent, _root, numDigits, bitsPerDigit, isLe) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;
    this.numDigits = numDigits;
    this.bitsPerDigit = bitsPerDigit;
    this.isLe = isLe;

    this._read();
  }
  Bcd.prototype._read = function() {
    this.digits = [];
    for (var i = 0; i < this.numDigits; i++) {
      switch (this.bitsPerDigit) {
      case 4:
        this.digits.push(this._io.readBitsIntBe(4));
        break;
      case 8:
        this.digits.push(this._io.readU1());
        break;
      }
    }
  }

  /**
   * Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
   */
  Object.defineProperty(Bcd.prototype, 'asInt', {
    get: function() {
      if (this._m_asInt !== undefined)
        return this._m_asInt;
      this._m_asInt = (this.isLe ? this.asIntLe : this.asIntBe);
      return this._m_asInt;
    }
  });

  /**
   * Value of this BCD number as integer (treating digit order as big-endian).
   */
  Object.defineProperty(Bcd.prototype, 'asIntBe', {
    get: function() {
      if (this._m_asIntBe !== undefined)
        return this._m_asIntBe;
      this._m_asIntBe = this.digits[this.lastIdx] + (this.numDigits < 2 ? 0 : this.digits[this.lastIdx - 1] * 10 + (this.numDigits < 3 ? 0 : this.digits[this.lastIdx - 2] * 100 + (this.numDigits < 4 ? 0 : this.digits[this.lastIdx - 3] * 1000 + (this.numDigits < 5 ? 0 : this.digits[this.lastIdx - 4] * 10000 + (this.numDigits < 6 ? 0 : this.digits[this.lastIdx - 5] * 100000 + (this.numDigits < 7 ? 0 : this.digits[this.lastIdx - 6] * 1000000 + (this.numDigits < 8 ? 0 : this.digits[this.lastIdx - 7] * 10000000)))))));
      return this._m_asIntBe;
    }
  });

  /**
   * Value of this BCD number as integer (treating digit order as little-endian).
   */
  Object.defineProperty(Bcd.prototype, 'asIntLe', {
    get: function() {
      if (this._m_asIntLe !== undefined)
        return this._m_asIntLe;
      this._m_asIntLe = this.digits[0] + (this.numDigits < 2 ? 0 : this.digits[1] * 10 + (this.numDigits < 3 ? 0 : this.digits[2] * 100 + (this.numDigits < 4 ? 0 : this.digits[3] * 1000 + (this.numDigits < 5 ? 0 : this.digits[4] * 10000 + (this.numDigits < 6 ? 0 : this.digits[5] * 100000 + (this.numDigits < 7 ? 0 : this.digits[6] * 1000000 + (this.numDigits < 8 ? 0 : this.digits[7] * 10000000)))))));
      return this._m_asIntLe;
    }
  });

  /**
   * Index of last digit (0-based).
   */
  Object.defineProperty(Bcd.prototype, 'lastIdx', {
    get: function() {
      if (this._m_lastIdx !== undefined)
        return this._m_lastIdx;
      this._m_lastIdx = this.numDigits - 1;
      return this._m_lastIdx;
    }
  });

  /**
   * Number of digits in this BCD representation. Only values from 1 to 8 inclusive are supported.
   */

  /**
   * Number of bits per digit. Only values of 4 and 8 are supported.
   */

  /**
   * Endianness used by this BCD representation. True means little-endian, false is for big-endian.
   */

  return Bcd;
})();
Bcd_.Bcd = Bcd;
});
