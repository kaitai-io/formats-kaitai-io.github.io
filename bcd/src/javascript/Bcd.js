// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
    this.digits = new Array(this.numDigits);
    for (var i = 0; i < this.numDigits; i++) {
      switch (this.bitsPerDigit) {
      case 4:
        this.digits[i] = this._io.readBitsInt(4);
        break;
      case 8:
        this.digits[i] = this._io.readU1();
        break;
      }
    }
  }
  Object.defineProperty(Bcd.prototype, 'asInt', {
    get: function() {
      if (this._m_asInt !== undefined)
        return this._m_asInt;
      this._m_asInt = (this.isLe ? this.asIntLe : this.asIntBe);
      return this._m_asInt;
    }
  });
  Object.defineProperty(Bcd.prototype, 'asIntLe', {
    get: function() {
      if (this._m_asIntLe !== undefined)
        return this._m_asIntLe;
      this._m_asIntLe = (this.digits[0] + (this.numDigits < 2 ? 0 : ((this.digits[1] * 10) + (this.numDigits < 3 ? 0 : ((this.digits[2] * 100) + (this.numDigits < 4 ? 0 : ((this.digits[3] * 1000) + (this.numDigits < 5 ? 0 : ((this.digits[4] * 10000) + (this.numDigits < 6 ? 0 : ((this.digits[5] * 100000) + (this.numDigits < 7 ? 0 : ((this.digits[6] * 1000000) + (this.numDigits < 8 ? 0 : (this.digits[7] * 10000000)))))))))))))));
      return this._m_asIntLe;
    }
  });
  Object.defineProperty(Bcd.prototype, 'lastIdx', {
    get: function() {
      if (this._m_lastIdx !== undefined)
        return this._m_lastIdx;
      this._m_lastIdx = (this.numDigits - 1);
      return this._m_lastIdx;
    }
  });
  Object.defineProperty(Bcd.prototype, 'asIntBe', {
    get: function() {
      if (this._m_asIntBe !== undefined)
        return this._m_asIntBe;
      this._m_asIntBe = (this.digits[this.lastIdx] + (this.numDigits < 2 ? 0 : ((this.digits[(this.lastIdx - 1)] * 10) + (this.numDigits < 3 ? 0 : ((this.digits[(this.lastIdx - 2)] * 100) + (this.numDigits < 4 ? 0 : ((this.digits[(this.lastIdx - 3)] * 1000) + (this.numDigits < 5 ? 0 : ((this.digits[(this.lastIdx - 4)] * 10000) + (this.numDigits < 6 ? 0 : ((this.digits[(this.lastIdx - 5)] * 100000) + (this.numDigits < 7 ? 0 : ((this.digits[(this.lastIdx - 6)] * 1000000) + (this.numDigits < 8 ? 0 : (this.digits[(this.lastIdx - 7)] * 10000000)))))))))))))));
      return this._m_asIntBe;
    }
  });

  /**
   * Number of digits in this BCD representation. Only values from 1 to 8 inclusive are supported.
   */

  /**
   * Number of bits per digit. Only values of 4 and 8 are supported.
   */

  return Bcd;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Bcd', [], function() {
    return Bcd;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Bcd;
}
