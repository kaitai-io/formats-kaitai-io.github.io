// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Msgpack = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * MessagePack (msgpack) is a system to serialize arbitrary structured
 * data into a compact binary stream.
 * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md|Source}
 */

var Msgpack = (function() {
  function Msgpack(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Msgpack.prototype._read = function() {
    this.b1 = this._io.readU1();
    switch (this.b1) {
    case 211:
      this.intExtra = this._io.readS8be();
      break;
    case 209:
      this.intExtra = this._io.readS2be();
      break;
    case 210:
      this.intExtra = this._io.readS4be();
      break;
    case 208:
      this.intExtra = this._io.readS1();
      break;
    case 205:
      this.intExtra = this._io.readU2be();
      break;
    case 207:
      this.intExtra = this._io.readU8be();
      break;
    case 204:
      this.intExtra = this._io.readU1();
      break;
    case 206:
      this.intExtra = this._io.readU4be();
      break;
    }
    if (this.isFloat32) {
      this.float32Value = this._io.readF4be();
    }
    if (this.isFloat64) {
      this.float64Value = this._io.readF8be();
    }
    if (this.isStr8) {
      this.strLen8 = this._io.readU1();
    }
    if (this.isStr16) {
      this.strLen16 = this._io.readU2be();
    }
    if (this.isStr32) {
      this.strLen32 = this._io.readU4be();
    }
    if (this.isStr) {
      this.strValue = KaitaiStream.bytesToStr(this._io.readBytes(this.strLen), "UTF-8");
    }
    if (this.isArray16) {
      this.numArrayElements16 = this._io.readU2be();
    }
    if (this.isArray32) {
      this.numArrayElements32 = this._io.readU4be();
    }
    if (this.isArray) {
      this.arrayElements = new Array(this.numArrayElements);
      for (var i = 0; i < this.numArrayElements; i++) {
        this.arrayElements[i] = new Msgpack(this._io, this, null);
      }
    }
    if (this.isMap16) {
      this.numMapElements16 = this._io.readU2be();
    }
    if (this.isMap32) {
      this.numMapElements32 = this._io.readU4be();
    }
    if (this.isMap) {
      this.mapElements = new Array(this.numMapElements);
      for (var i = 0; i < this.numMapElements; i++) {
        this.mapElements[i] = new MapTuple(this._io, this, this._root);
      }
    }
  }

  var MapTuple = Msgpack.MapTuple = (function() {
    function MapTuple(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MapTuple.prototype._read = function() {
      this.key = new Msgpack(this._io, this, null);
      this.value = new Msgpack(this._io, this, null);
    }

    return MapTuple;
  })();

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isArray32', {
    get: function() {
      if (this._m_isArray32 !== undefined)
        return this._m_isArray32;
      this._m_isArray32 = this.b1 == 221;
      return this._m_isArray32;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'intValue', {
    get: function() {
      if (this._m_intValue !== undefined)
        return this._m_intValue;
      if (this.isInt) {
        this._m_intValue = (this.isPosInt7 ? this.posInt7Value : (this.isNegInt5 ? this.negInt5Value : 4919));
      }
      return this._m_intValue;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'strLen', {
    get: function() {
      if (this._m_strLen !== undefined)
        return this._m_strLen;
      if (this.isStr) {
        this._m_strLen = (this.isFixStr ? (this.b1 & 31) : (this.isStr8 ? this.strLen8 : (this.isStr16 ? this.strLen16 : this.strLen32)));
      }
      return this._m_strLen;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isFixArray', {
    get: function() {
      if (this._m_isFixArray !== undefined)
        return this._m_isFixArray;
      this._m_isFixArray = (this.b1 & 240) == 144;
      return this._m_isFixArray;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isMap', {
    get: function() {
      if (this._m_isMap !== undefined)
        return this._m_isMap;
      this._m_isMap =  ((this.isFixMap) || (this.isMap16) || (this.isMap32)) ;
      return this._m_isMap;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isArray', {
    get: function() {
      if (this._m_isArray !== undefined)
        return this._m_isArray;
      this._m_isArray =  ((this.isFixArray) || (this.isArray16) || (this.isArray32)) ;
      return this._m_isArray;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'isFloat', {
    get: function() {
      if (this._m_isFloat !== undefined)
        return this._m_isFloat;
      this._m_isFloat =  ((this.isFloat32) || (this.isFloat64)) ;
      return this._m_isFloat;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isStr8', {
    get: function() {
      if (this._m_isStr8 !== undefined)
        return this._m_isStr8;
      this._m_isStr8 = this.b1 == 217;
      return this._m_isStr8;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isFixMap', {
    get: function() {
      if (this._m_isFixMap !== undefined)
        return this._m_isFixMap;
      this._m_isFixMap = (this.b1 & 240) == 128;
      return this._m_isFixMap;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'isInt', {
    get: function() {
      if (this._m_isInt !== undefined)
        return this._m_isInt;
      this._m_isInt =  ((this.isPosInt7) || (this.isNegInt5)) ;
      return this._m_isInt;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'isBool', {
    get: function() {
      if (this._m_isBool !== undefined)
        return this._m_isBool;
      this._m_isBool =  ((this.b1 == 194) || (this.b1 == 195)) ;
      return this._m_isBool;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isStr16', {
    get: function() {
      if (this._m_isStr16 !== undefined)
        return this._m_isStr16;
      this._m_isStr16 = this.b1 == 218;
      return this._m_isStr16;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isFloat64', {
    get: function() {
      if (this._m_isFloat64 !== undefined)
        return this._m_isFloat64;
      this._m_isFloat64 = this.b1 == 203;
      return this._m_isFloat64;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isMap16', {
    get: function() {
      if (this._m_isMap16 !== undefined)
        return this._m_isMap16;
      this._m_isMap16 = this.b1 == 222;
      return this._m_isMap16;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'isNegInt5', {
    get: function() {
      if (this._m_isNegInt5 !== undefined)
        return this._m_isNegInt5;
      this._m_isNegInt5 = (this.b1 & 224) == 224;
      return this._m_isNegInt5;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'posInt7Value', {
    get: function() {
      if (this._m_posInt7Value !== undefined)
        return this._m_posInt7Value;
      if (this.isPosInt7) {
        this._m_posInt7Value = this.b1;
      }
      return this._m_posInt7Value;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-nil|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isNil', {
    get: function() {
      if (this._m_isNil !== undefined)
        return this._m_isNil;
      this._m_isNil = this.b1 == 192;
      return this._m_isNil;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'floatValue', {
    get: function() {
      if (this._m_floatValue !== undefined)
        return this._m_floatValue;
      if (this.isFloat) {
        this._m_floatValue = (this.isFloat32 ? this.float32Value : this.float64Value);
      }
      return this._m_floatValue;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'numArrayElements', {
    get: function() {
      if (this._m_numArrayElements !== undefined)
        return this._m_numArrayElements;
      if (this.isArray) {
        this._m_numArrayElements = (this.isFixArray ? (this.b1 & 15) : (this.isArray16 ? this.numArrayElements16 : this.numArrayElements32));
      }
      return this._m_numArrayElements;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'negInt5Value', {
    get: function() {
      if (this._m_negInt5Value !== undefined)
        return this._m_negInt5Value;
      if (this.isNegInt5) {
        this._m_negInt5Value = -((this.b1 & 31));
      }
      return this._m_negInt5Value;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-bool|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'boolValue', {
    get: function() {
      if (this._m_boolValue !== undefined)
        return this._m_boolValue;
      if (this.isBool) {
        this._m_boolValue = this.b1 == 195;
      }
      return this._m_boolValue;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'isPosInt7', {
    get: function() {
      if (this._m_isPosInt7 !== undefined)
        return this._m_isPosInt7;
      this._m_isPosInt7 = (this.b1 & 128) == 0;
      return this._m_isPosInt7;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-array|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isArray16', {
    get: function() {
      if (this._m_isArray16 !== undefined)
        return this._m_isArray16;
      this._m_isArray16 = this.b1 == 220;
      return this._m_isArray16;
    }
  });
  Object.defineProperty(Msgpack.prototype, 'isStr', {
    get: function() {
      if (this._m_isStr !== undefined)
        return this._m_isStr;
      this._m_isStr =  ((this.isFixStr) || (this.isStr8) || (this.isStr16) || (this.isStr32)) ;
      return this._m_isStr;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isFixStr', {
    get: function() {
      if (this._m_isFixStr !== undefined)
        return this._m_isFixStr;
      this._m_isFixStr = (this.b1 & 224) == 160;
      return this._m_isFixStr;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-str|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isStr32', {
    get: function() {
      if (this._m_isStr32 !== undefined)
        return this._m_isStr32;
      this._m_isStr32 = this.b1 == 219;
      return this._m_isStr32;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'numMapElements', {
    get: function() {
      if (this._m_numMapElements !== undefined)
        return this._m_numMapElements;
      if (this.isMap) {
        this._m_numMapElements = (this.isFixMap ? (this.b1 & 15) : (this.isMap16 ? this.numMapElements16 : this.numMapElements32));
      }
      return this._m_numMapElements;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-float|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isFloat32', {
    get: function() {
      if (this._m_isFloat32 !== undefined)
        return this._m_isFloat32;
      this._m_isFloat32 = this.b1 == 202;
      return this._m_isFloat32;
    }
  });

  /**
   * @see {@link https://github.com/msgpack/msgpack/blob/master/spec.md#formats-map|Source}
   */
  Object.defineProperty(Msgpack.prototype, 'isMap32', {
    get: function() {
      if (this._m_isMap32 !== undefined)
        return this._m_isMap32;
      this._m_isMap32 = this.b1 == 223;
      return this._m_isMap32;
    }
  });

  /**
   * First byte is msgpack message is either a piece of data by
   * itself or determines types of further, more complex data
   * structures.
   */

  return Msgpack;
})();
return Msgpack;
}));
