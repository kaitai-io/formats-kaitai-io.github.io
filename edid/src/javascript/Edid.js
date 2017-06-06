// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Edid = (function() {
  function Edid(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Edid.prototype._read = function() {
    this.magic = this._io.ensureFixedContents([0, 255, 255, 255, 255, 255, 255, 0]);
    this.mfgBytes = this._io.readU2le();
    this.productCode = this._io.readU2le();
    this.serial = this._io.readU4le();
    this.mfgWeek = this._io.readU1();
    this.mfgYearMod = this._io.readU1();
    this.edidVersionMajor = this._io.readU1();
    this.edidVersionMinor = this._io.readU1();
    this.inputFlags = this._io.readU1();
    this.screenSizeH = this._io.readU1();
    this.screenSizeV = this._io.readU1();
    this.gammaMod = this._io.readU1();
    this.featuresFlags = this._io.readU1();
    this.chromacity = this._io.readBytes(10);
  }
  Object.defineProperty(Edid.prototype, 'mfgYear', {
    get: function() {
      if (this._m_mfgYear !== undefined)
        return this._m_mfgYear;
      this._m_mfgYear = (this.mfgYearMod + 1990);
      return this._m_mfgYear;
    }
  });
  Object.defineProperty(Edid.prototype, 'mfgIdCh1', {
    get: function() {
      if (this._m_mfgIdCh1 !== undefined)
        return this._m_mfgIdCh1;
      this._m_mfgIdCh1 = ((this.mfgBytes & 31744) >> 10);
      return this._m_mfgIdCh1;
    }
  });
  Object.defineProperty(Edid.prototype, 'mfgIdCh3', {
    get: function() {
      if (this._m_mfgIdCh3 !== undefined)
        return this._m_mfgIdCh3;
      this._m_mfgIdCh3 = (this.mfgBytes & 31);
      return this._m_mfgIdCh3;
    }
  });
  Object.defineProperty(Edid.prototype, 'gamma', {
    get: function() {
      if (this._m_gamma !== undefined)
        return this._m_gamma;
      if (this.gammaMod != 255) {
        this._m_gamma = ((this.gammaMod + 100) / 100.0);
      }
      return this._m_gamma;
    }
  });
  Object.defineProperty(Edid.prototype, 'mfgIdCh2', {
    get: function() {
      if (this._m_mfgIdCh2 !== undefined)
        return this._m_mfgIdCh2;
      this._m_mfgIdCh2 = ((this.mfgBytes & 992) >> 5);
      return this._m_mfgIdCh2;
    }
  });

  /**
   * Manufacturer product code
   */

  /**
   * Serial number
   */

  /**
   * Week of manufacture. Week numbering is not consistent between manufacturers.
   */

  /**
   * Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
   */

  /**
   * EDID version, usually 1 (for 1.3)
   */

  /**
   * EDID revision, usually 3 (for 1.3)
   */

  /**
   * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
   */

  /**
   * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
   */

  /**
   * Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
   */

  return Edid;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Edid', [], function() {
    return Edid;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Edid;
}
