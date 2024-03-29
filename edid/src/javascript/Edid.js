// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Edid = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var Edid = (function() {
  function Edid(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Edid.prototype._read = function() {
    this.magic = this._io.readBytes(8);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [0, 255, 255, 255, 255, 255, 255, 0]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([0, 255, 255, 255, 255, 255, 255, 0], this.magic, this._io, "/seq/0");
    }
    this.mfgBytes = this._io.readU2be();
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
    this.chromacity = new ChromacityInfo(this._io, this, this._root);
    this.estTimings = new EstTimingsInfo(this._io, this, this._root);
    this._raw_stdTimings = [];
    this.stdTimings = [];
    for (var i = 0; i < 8; i++) {
      this._raw_stdTimings.push(this._io.readBytes(2));
      var _io__raw_stdTimings = new KaitaiStream(this._raw_stdTimings[i]);
      this.stdTimings.push(new StdTiming(_io__raw_stdTimings, this, this._root));
    }
  }

  /**
   * Chromaticity information: colorimetry and white point
   * coordinates. All coordinates are stored as fixed precision
   * 10-bit numbers, bits are shuffled for compactness.
   */

  var ChromacityInfo = Edid.ChromacityInfo = (function() {
    function ChromacityInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChromacityInfo.prototype._read = function() {
      this.redX10 = this._io.readBitsIntBe(2);
      this.redY10 = this._io.readBitsIntBe(2);
      this.greenX10 = this._io.readBitsIntBe(2);
      this.greenY10 = this._io.readBitsIntBe(2);
      this.blueX10 = this._io.readBitsIntBe(2);
      this.blueY10 = this._io.readBitsIntBe(2);
      this.whiteX10 = this._io.readBitsIntBe(2);
      this.whiteY10 = this._io.readBitsIntBe(2);
      this._io.alignToByte();
      this.redX92 = this._io.readU1();
      this.redY92 = this._io.readU1();
      this.greenX92 = this._io.readU1();
      this.greenY92 = this._io.readU1();
      this.blueX92 = this._io.readU1();
      this.blueY92 = this._io.readU1();
      this.whiteX92 = this._io.readU1();
      this.whiteY92 = this._io.readU1();
    }
    Object.defineProperty(ChromacityInfo.prototype, 'greenXInt', {
      get: function() {
        if (this._m_greenXInt !== undefined)
          return this._m_greenXInt;
        this._m_greenXInt = ((this.greenX92 << 2) | this.greenX10);
        return this._m_greenXInt;
      }
    });

    /**
     * Red Y coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'redY', {
      get: function() {
        if (this._m_redY !== undefined)
          return this._m_redY;
        this._m_redY = (this.redYInt / 1024.0);
        return this._m_redY;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'greenYInt', {
      get: function() {
        if (this._m_greenYInt !== undefined)
          return this._m_greenYInt;
        this._m_greenYInt = ((this.greenY92 << 2) | this.greenY10);
        return this._m_greenYInt;
      }
    });

    /**
     * White Y coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'whiteY', {
      get: function() {
        if (this._m_whiteY !== undefined)
          return this._m_whiteY;
        this._m_whiteY = (this.whiteYInt / 1024.0);
        return this._m_whiteY;
      }
    });

    /**
     * Red X coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'redX', {
      get: function() {
        if (this._m_redX !== undefined)
          return this._m_redX;
        this._m_redX = (this.redXInt / 1024.0);
        return this._m_redX;
      }
    });

    /**
     * White X coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'whiteX', {
      get: function() {
        if (this._m_whiteX !== undefined)
          return this._m_whiteX;
        this._m_whiteX = (this.whiteXInt / 1024.0);
        return this._m_whiteX;
      }
    });

    /**
     * Blue X coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'blueX', {
      get: function() {
        if (this._m_blueX !== undefined)
          return this._m_blueX;
        this._m_blueX = (this.blueXInt / 1024.0);
        return this._m_blueX;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'whiteXInt', {
      get: function() {
        if (this._m_whiteXInt !== undefined)
          return this._m_whiteXInt;
        this._m_whiteXInt = ((this.whiteX92 << 2) | this.whiteX10);
        return this._m_whiteXInt;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'whiteYInt', {
      get: function() {
        if (this._m_whiteYInt !== undefined)
          return this._m_whiteYInt;
        this._m_whiteYInt = ((this.whiteY92 << 2) | this.whiteY10);
        return this._m_whiteYInt;
      }
    });

    /**
     * Green X coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'greenX', {
      get: function() {
        if (this._m_greenX !== undefined)
          return this._m_greenX;
        this._m_greenX = (this.greenXInt / 1024.0);
        return this._m_greenX;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'redXInt', {
      get: function() {
        if (this._m_redXInt !== undefined)
          return this._m_redXInt;
        this._m_redXInt = ((this.redX92 << 2) | this.redX10);
        return this._m_redXInt;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'redYInt', {
      get: function() {
        if (this._m_redYInt !== undefined)
          return this._m_redYInt;
        this._m_redYInt = ((this.redY92 << 2) | this.redY10);
        return this._m_redYInt;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'blueXInt', {
      get: function() {
        if (this._m_blueXInt !== undefined)
          return this._m_blueXInt;
        this._m_blueXInt = ((this.blueX92 << 2) | this.blueX10);
        return this._m_blueXInt;
      }
    });

    /**
     * Blue Y coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'blueY', {
      get: function() {
        if (this._m_blueY !== undefined)
          return this._m_blueY;
        this._m_blueY = (this.blueYInt / 1024.0);
        return this._m_blueY;
      }
    });

    /**
     * Green Y coordinate
     */
    Object.defineProperty(ChromacityInfo.prototype, 'greenY', {
      get: function() {
        if (this._m_greenY !== undefined)
          return this._m_greenY;
        this._m_greenY = (this.greenYInt / 1024.0);
        return this._m_greenY;
      }
    });
    Object.defineProperty(ChromacityInfo.prototype, 'blueYInt', {
      get: function() {
        if (this._m_blueYInt !== undefined)
          return this._m_blueYInt;
        this._m_blueYInt = ((this.blueY92 << 2) | this.blueY10);
        return this._m_blueYInt;
      }
    });

    /**
     * Red X, bits 1..0
     */

    /**
     * Red Y, bits 1..0
     */

    /**
     * Green X, bits 1..0
     */

    /**
     * Green Y, bits 1..0
     */

    /**
     * Blue X, bits 1..0
     */

    /**
     * Blue Y, bits 1..0
     */

    /**
     * White X, bits 1..0
     */

    /**
     * White Y, bits 1..0
     */

    /**
     * Red X, bits 9..2
     */

    /**
     * Red Y, bits 9..2
     */

    /**
     * Green X, bits 9..2
     */

    /**
     * Green Y, bits 9..2
     */

    /**
     * Blue X, bits 9..2
     */

    /**
     * Blue Y, bits 9..2
     */

    /**
     * White X, bits 9..2
     */

    /**
     * White Y, bits 9..2
     */

    return ChromacityInfo;
  })();

  var EstTimingsInfo = Edid.EstTimingsInfo = (function() {
    function EstTimingsInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    EstTimingsInfo.prototype._read = function() {
      this.can720x400px70hz = this._io.readBitsIntBe(1) != 0;
      this.can720x400px88hz = this._io.readBitsIntBe(1) != 0;
      this.can640x480px60hz = this._io.readBitsIntBe(1) != 0;
      this.can640x480px67hz = this._io.readBitsIntBe(1) != 0;
      this.can640x480px72hz = this._io.readBitsIntBe(1) != 0;
      this.can640x480px75hz = this._io.readBitsIntBe(1) != 0;
      this.can800x600px56hz = this._io.readBitsIntBe(1) != 0;
      this.can800x600px60hz = this._io.readBitsIntBe(1) != 0;
      this.can800x600px72hz = this._io.readBitsIntBe(1) != 0;
      this.can800x600px75hz = this._io.readBitsIntBe(1) != 0;
      this.can832x624px75hz = this._io.readBitsIntBe(1) != 0;
      this.can1024x768px87hzI = this._io.readBitsIntBe(1) != 0;
      this.can1024x768px60hz = this._io.readBitsIntBe(1) != 0;
      this.can1024x768px70hz = this._io.readBitsIntBe(1) != 0;
      this.can1024x768px75hz = this._io.readBitsIntBe(1) != 0;
      this.can1280x1024px75hz = this._io.readBitsIntBe(1) != 0;
      this.can1152x870px75hz = this._io.readBitsIntBe(1) != 0;
      this.reserved = this._io.readBitsIntBe(7);
    }

    /**
     * Supports 720 x 400 @ 70Hz
     */

    /**
     * Supports 720 x 400 @ 88Hz
     */

    /**
     * Supports 640 x 480 @ 60Hz
     */

    /**
     * Supports 640 x 480 @ 67Hz
     */

    /**
     * Supports 640 x 480 @ 72Hz
     */

    /**
     * Supports 640 x 480 @ 75Hz
     */

    /**
     * Supports 800 x 600 @ 56Hz
     */

    /**
     * Supports 800 x 600 @ 60Hz
     */

    /**
     * Supports 800 x 600 @ 72Hz
     */

    /**
     * Supports 800 x 600 @ 75Hz
     */

    /**
     * Supports 832 x 624 @ 75Hz
     */

    /**
     * Supports 1024 x 768 @ 87Hz(I)
     */

    /**
     * Supports 1024 x 768 @ 60Hz
     */

    /**
     * Supports 1024 x 768 @ 70Hz
     */

    /**
     * Supports 1024 x 768 @ 75Hz
     */

    /**
     * Supports 1280 x 1024 @ 75Hz
     */

    /**
     * Supports 1152 x 870 @ 75Hz
     */

    return EstTimingsInfo;
  })();

  var StdTiming = Edid.StdTiming = (function() {
    StdTiming.AspectRatios = Object.freeze({
      RATIO_16_10: 0,
      RATIO_4_3: 1,
      RATIO_5_4: 2,
      RATIO_16_9: 3,

      0: "RATIO_16_10",
      1: "RATIO_4_3",
      2: "RATIO_5_4",
      3: "RATIO_16_9",
    });

    function StdTiming(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StdTiming.prototype._read = function() {
      this.horizActivePixelsMod = this._io.readU1();
      this.aspectRatio = this._io.readBitsIntBe(2);
      this.refreshRateMod = this._io.readBitsIntBe(6);
    }
    Object.defineProperty(StdTiming.prototype, 'bytesLookahead', {
      get: function() {
        if (this._m_bytesLookahead !== undefined)
          return this._m_bytesLookahead;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_bytesLookahead = this._io.readBytes(2);
        this._io.seek(_pos);
        return this._m_bytesLookahead;
      }
    });
    Object.defineProperty(StdTiming.prototype, 'isUsed', {
      get: function() {
        if (this._m_isUsed !== undefined)
          return this._m_isUsed;
        this._m_isUsed = (KaitaiStream.byteArrayCompare(this.bytesLookahead, [1, 1]) != 0);
        return this._m_isUsed;
      }
    });

    /**
     * Range of horizontal active pixels.
     */
    Object.defineProperty(StdTiming.prototype, 'horizActivePixels', {
      get: function() {
        if (this._m_horizActivePixels !== undefined)
          return this._m_horizActivePixels;
        if (this.isUsed) {
          this._m_horizActivePixels = ((this.horizActivePixelsMod + 31) * 8);
        }
        return this._m_horizActivePixels;
      }
    });

    /**
     * Vertical refresh rate, Hz.
     */
    Object.defineProperty(StdTiming.prototype, 'refreshRate', {
      get: function() {
        if (this._m_refreshRate !== undefined)
          return this._m_refreshRate;
        if (this.isUsed) {
          this._m_refreshRate = (this.refreshRateMod + 60);
        }
        return this._m_refreshRate;
      }
    });

    /**
     * Range of horizontal active pixels, written in modified form:
     * `(horiz_active_pixels / 8) - 31`. This yields an effective
     * range of 256..2288, with steps of 8 pixels.
     */

    /**
     * Aspect ratio of the image. Can be used to calculate number
     * of vertical pixels.
     */

    /**
     * Refresh rate in Hz, written in modified form: `refresh_rate
     * - 60`. This yields an effective range of 60..123 Hz.
     */

    return StdTiming;
  })();
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
      this._m_mfgIdCh1 = ((this.mfgBytes & 31744) >>> 10);
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
  Object.defineProperty(Edid.prototype, 'mfgStr', {
    get: function() {
      if (this._m_mfgStr !== undefined)
        return this._m_mfgStr;
      this._m_mfgStr = KaitaiStream.bytesToStr(new Uint8Array([(this.mfgIdCh1 + 64), (this.mfgIdCh2 + 64), (this.mfgIdCh3 + 64)]), "ASCII");
      return this._m_mfgStr;
    }
  });
  Object.defineProperty(Edid.prototype, 'mfgIdCh2', {
    get: function() {
      if (this._m_mfgIdCh2 !== undefined)
        return this._m_mfgIdCh2;
      this._m_mfgIdCh2 = ((this.mfgBytes & 992) >>> 5);
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
   * Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
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
   * Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54)
   */

  /**
   * Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
   * @see Standard, section 3.7
   */

  /**
   * Block of bit flags that indicates support of so called
   * "established timings", which is a commonly used subset of VESA
   * DMT (Discrete Monitor Timings) modes.
   * @see Standard, section 3.8
   */

  /**
   * Array of descriptions of so called "standard timings", which are
   * used to specify up to 8 additional timings not included in
   * "established timings".
   */

  return Edid;
})();
return Edid;
}));
