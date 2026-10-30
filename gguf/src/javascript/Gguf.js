// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Gguf || (root.Gguf = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Gguf_, KaitaiStream) {
/**
 * GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
 * tensor library for storing machine learning models, used for example by
 * [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
 * replaced the older GGML, GGMF and GGJT formats.
 * 
 * A GGUF file consists of a header with metadata as key-value pairs (model
 * architecture, hyperparameters, tokenizer, etc.), a description of each
 * tensor (name, dimensions, type and offset), and finally the tensor data.
 * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md|Git tag "v0.27.0"}
 */

var Gguf = (function() {
  Gguf.GgmlType = Object.freeze({
    F32: 0,
    F16: 1,
    Q4_0: 2,
    Q4_1: 3,
    Q4_2: 4,
    Q4_3: 5,
    Q5_0: 6,
    Q5_1: 7,
    Q8_0: 8,
    Q8_1: 9,
    Q2_K: 10,
    Q3_K: 11,
    Q4_K: 12,
    Q5_K: 13,
    Q6_K: 14,
    Q8_K: 15,
    IQ2_XXS: 16,
    IQ2_XS: 17,
    IQ3_XXS: 18,
    IQ1_S: 19,
    IQ4_NL: 20,
    IQ3_S: 21,
    IQ2_S: 22,
    IQ4_XS: 23,
    I8: 24,
    I16: 25,
    I32: 26,
    I64: 27,
    F64: 28,
    IQ1_M: 29,
    BF16: 30,
    Q4_0_4_4: 31,
    Q4_0_4_8: 32,
    Q4_0_8_8: 33,
    TQ1_0: 34,
    TQ2_0: 35,
    IQ4_NL_4_4: 36,
    IQ4_NL_4_8: 37,
    IQ4_NL_8_8: 38,
    MXFP4: 39,
    NVFP4: 40,
    Q1_0: 41,
    Q2_0: 42,

    0: "F32",
    1: "F16",
    2: "Q4_0",
    3: "Q4_1",
    4: "Q4_2",
    5: "Q4_3",
    6: "Q5_0",
    7: "Q5_1",
    8: "Q8_0",
    9: "Q8_1",
    10: "Q2_K",
    11: "Q3_K",
    12: "Q4_K",
    13: "Q5_K",
    14: "Q6_K",
    15: "Q8_K",
    16: "IQ2_XXS",
    17: "IQ2_XS",
    18: "IQ3_XXS",
    19: "IQ1_S",
    20: "IQ4_NL",
    21: "IQ3_S",
    22: "IQ2_S",
    23: "IQ4_XS",
    24: "I8",
    25: "I16",
    26: "I32",
    27: "I64",
    28: "F64",
    29: "IQ1_M",
    30: "BF16",
    31: "Q4_0_4_4",
    32: "Q4_0_4_8",
    33: "Q4_0_8_8",
    34: "TQ1_0",
    35: "TQ2_0",
    36: "IQ4_NL_4_4",
    37: "IQ4_NL_4_8",
    38: "IQ4_NL_8_8",
    39: "MXFP4",
    40: "NVFP4",
    41: "Q1_0",
    42: "Q2_0",
  });

  Gguf.GgufType = Object.freeze({
    UINT8: 0,
    INT8: 1,
    UINT16: 2,
    INT16: 3,
    UINT32: 4,
    INT32: 5,
    FLOAT32: 6,
    BOOL: 7,
    STRING: 8,
    ARRAY: 9,
    UINT64: 10,
    INT64: 11,
    FLOAT64: 12,

    0: "UINT8",
    1: "INT8",
    2: "UINT16",
    3: "INT16",
    4: "UINT32",
    5: "INT32",
    6: "FLOAT32",
    7: "BOOL",
    8: "STRING",
    9: "ARRAY",
    10: "UINT64",
    11: "INT64",
    12: "FLOAT64",
  });

  function Gguf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Gguf.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([71, 71, 85, 70])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([71, 71, 85, 70]), this.magic, this._io, "/seq/0");
    }
    this.body = new GgufBody(this._io, this, this._root);
  }

  var GgufBody = Gguf.GgufBody = (function() {
    function GgufBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GgufBody.prototype._read = function() {
      switch (this._root.isBigEndian) {
      case true:
        this._is_le = false;
        break;
      case false:
        this._is_le = true;
        break;
      }

      if (this._is_le === true) {
        this._readLE();
      } else if (this._is_le === false) {
        this._readBE();
      } else {
        throw new KaitaiStream.UndecidedEndiannessError();
      }
    }
    GgufBody.prototype._readLE = function() {
      this.version = this._io.readU4le();
      if (!(this.version >= 2)) {
        throw new KaitaiStream.ValidationLessThanError(2, this.version, this._io, "/types/gguf_body/seq/0");
      }
      if (!(this.version <= 3)) {
        throw new KaitaiStream.ValidationGreaterThanError(3, this.version, this._io, "/types/gguf_body/seq/0");
      }
      this.numTensorInfos = this._io.readU8le();
      this.numKvPairs = this._io.readU8le();
      this.kvPairs = [];
      for (var i = 0; i < this.numKvPairs; i++) {
        this.kvPairs.push(new GgufKv(this._io, this, this._root, this._is_le, (i != 0 ? this.kvPairs[i - 1].alignment : 32)));
      }
      this.tensorInfos = [];
      for (var i = 0; i < this.numTensorInfos; i++) {
        this.tensorInfos.push(new GgufTensorInfo(this._io, this, this._root, this._is_le, (i != 0 ? this.tensorInfos[i - 1].expectedNextOffset : 0)));
      }
      if (this.numTensorInfos != 0) {
        this.padding = this._io.readBytes(KaitaiStream.mod(this.alignment - KaitaiStream.mod(this._io.pos, this.alignment), this.alignment));
      }
      if (this.ofsTensorData < 0) {
        this._unnamed6 = this._io.readBytes(0);
      }
    }
    GgufBody.prototype._readBE = function() {
      this.version = this._io.readU4be();
      if (!(this.version >= 2)) {
        throw new KaitaiStream.ValidationLessThanError(2, this.version, this._io, "/types/gguf_body/seq/0");
      }
      if (!(this.version <= 3)) {
        throw new KaitaiStream.ValidationGreaterThanError(3, this.version, this._io, "/types/gguf_body/seq/0");
      }
      this.numTensorInfos = this._io.readU8be();
      this.numKvPairs = this._io.readU8be();
      this.kvPairs = [];
      for (var i = 0; i < this.numKvPairs; i++) {
        this.kvPairs.push(new GgufKv(this._io, this, this._root, this._is_le, (i != 0 ? this.kvPairs[i - 1].alignment : 32)));
      }
      this.tensorInfos = [];
      for (var i = 0; i < this.numTensorInfos; i++) {
        this.tensorInfos.push(new GgufTensorInfo(this._io, this, this._root, this._is_le, (i != 0 ? this.tensorInfos[i - 1].expectedNextOffset : 0)));
      }
      if (this.numTensorInfos != 0) {
        this.padding = this._io.readBytes(KaitaiStream.mod(this.alignment - KaitaiStream.mod(this._io.pos, this.alignment), this.alignment));
      }
      if (this.ofsTensorData < 0) {
        this._unnamed6 = this._io.readBytes(0);
      }
    }

    /**
     * Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
     * they are explicitly allowed by `gguf.md` - see
     * <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
     */

    var GgufArray = GgufBody.GgufArray = (function() {
      function GgufArray(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufArray.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufArray.prototype._readLE = function() {
        this.type = this._io.readU4le();
        if (!Object.prototype.hasOwnProperty.call(Gguf.GgufType, this.type)) {
          throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_array/seq/0");
        }
        this.numElems = this._io.readU8le();
        this.elems = [];
        for (var i = 0; i < this.numElems; i++) {
          this.elems.push(new GgufValue(this._io, this, this._root, this._is_le, this.type));
        }
      }
      GgufArray.prototype._readBE = function() {
        this.type = this._io.readU4be();
        if (!Object.prototype.hasOwnProperty.call(Gguf.GgufType, this.type)) {
          throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_array/seq/0");
        }
        this.numElems = this._io.readU8be();
        this.elems = [];
        for (var i = 0; i < this.numElems; i++) {
          this.elems.push(new GgufValue(this._io, this, this._root, this._is_le, this.type));
        }
      }

      return GgufArray;
    })();

    var GgufBool = GgufBody.GgufBool = (function() {
      function GgufBool(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufBool.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufBool.prototype._readLE = function() {
        this.valueRaw = this._io.readU1();
        if (!(this.valueRaw <= 1)) {
          throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, this._io, "/types/gguf_body/types/gguf_bool/seq/0");
        }
      }
      GgufBool.prototype._readBE = function() {
        this.valueRaw = this._io.readU1();
        if (!(this.valueRaw <= 1)) {
          throw new KaitaiStream.ValidationGreaterThanError(1, this.valueRaw, this._io, "/types/gguf_body/types/gguf_bool/seq/0");
        }
      }

      /**
       * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321|Git tag "v0.27.0"}
       */
      Object.defineProperty(GgufBool.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          this._m_value = this.valueRaw != 0;
          return this._m_value;
        }
      });

      return GgufBool;
    })();

    var GgufFloat32 = GgufBody.GgufFloat32 = (function() {
      function GgufFloat32(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufFloat32.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufFloat32.prototype._readLE = function() {
        this.value = this._io.readF4le();
      }
      GgufFloat32.prototype._readBE = function() {
        this.value = this._io.readF4be();
      }

      return GgufFloat32;
    })();

    var GgufFloat64 = GgufBody.GgufFloat64 = (function() {
      function GgufFloat64(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufFloat64.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufFloat64.prototype._readLE = function() {
        this.value = this._io.readF8le();
      }
      GgufFloat64.prototype._readBE = function() {
        this.value = this._io.readF8be();
      }

      return GgufFloat64;
    })();

    var GgufInt16 = GgufBody.GgufInt16 = (function() {
      function GgufInt16(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufInt16.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufInt16.prototype._readLE = function() {
        this.value = this._io.readS2le();
      }
      GgufInt16.prototype._readBE = function() {
        this.value = this._io.readS2be();
      }

      return GgufInt16;
    })();

    var GgufInt32 = GgufBody.GgufInt32 = (function() {
      function GgufInt32(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufInt32.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufInt32.prototype._readLE = function() {
        this.value = this._io.readS4le();
      }
      GgufInt32.prototype._readBE = function() {
        this.value = this._io.readS4be();
      }

      return GgufInt32;
    })();

    var GgufInt64 = GgufBody.GgufInt64 = (function() {
      function GgufInt64(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufInt64.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufInt64.prototype._readLE = function() {
        this.value = this._io.readS8le();
      }
      GgufInt64.prototype._readBE = function() {
        this.value = this._io.readS8be();
      }

      return GgufInt64;
    })();

    var GgufInt8 = GgufBody.GgufInt8 = (function() {
      function GgufInt8(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufInt8.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufInt8.prototype._readLE = function() {
        this.value = this._io.readS1();
      }
      GgufInt8.prototype._readBE = function() {
        this.value = this._io.readS1();
      }

      return GgufInt8;
    })();

    /**
     * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275|Git tag "v0.27.0"}
     */

    var GgufKv = GgufBody.GgufKv = (function() {
      function GgufKv(_io, _parent, _root, _is_le, prevAlignment) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;
        this.prevAlignment = prevAlignment;

        this._read();
      }
      GgufKv.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufKv.prototype._readLE = function() {
        this.key = new GgufStr(this._io, this, this._root, this._is_le);
        var _ = this.key;
        if (!(_.lenValue != 0)) {
          throw new KaitaiStream.ValidationExprError(this.key, this._io, "/types/gguf_body/types/gguf_kv/seq/0");
        }
        this.type = this._io.readU4le();
        if (!Object.prototype.hasOwnProperty.call(Gguf.GgufType, this.type)) {
          throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_kv/seq/1");
        }
        this.value = new GgufValue(this._io, this, this._root, this._is_le, this.type);
        var _ = this.value;
        if (!((this.key.value == "general.alignment" ?  ((this.type == Gguf.GgufType.UINT32) && (_.value.value != 0) && ((_.value.value & _.value.value - 1) == 0))  : true))) {
          throw new KaitaiStream.ValidationExprError(this.value, this._io, "/types/gguf_body/types/gguf_kv/seq/2");
        }
      }
      GgufKv.prototype._readBE = function() {
        this.key = new GgufStr(this._io, this, this._root, this._is_le);
        var _ = this.key;
        if (!(_.lenValue != 0)) {
          throw new KaitaiStream.ValidationExprError(this.key, this._io, "/types/gguf_body/types/gguf_kv/seq/0");
        }
        this.type = this._io.readU4be();
        if (!Object.prototype.hasOwnProperty.call(Gguf.GgufType, this.type)) {
          throw new KaitaiStream.ValidationNotInEnumError(this.type, this._io, "/types/gguf_body/types/gguf_kv/seq/1");
        }
        this.value = new GgufValue(this._io, this, this._root, this._is_le, this.type);
        var _ = this.value;
        if (!((this.key.value == "general.alignment" ?  ((this.type == Gguf.GgufType.UINT32) && (_.value.value != 0) && ((_.value.value & _.value.value - 1) == 0))  : true))) {
          throw new KaitaiStream.ValidationExprError(this.value, this._io, "/types/gguf_body/types/gguf_kv/seq/2");
        }
      }
      Object.defineProperty(GgufKv.prototype, 'alignment', {
        get: function() {
          if (this._m_alignment !== undefined)
            return this._m_alignment;
          this._m_alignment = (this.key.value == "general.alignment" ? this.value.value.value : this.prevAlignment);
          return this._m_alignment;
        }
      });

      return GgufKv;
    })();

    /**
     * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237|Git tag "v0.27.0"}
     */

    var GgufStr = GgufBody.GgufStr = (function() {
      function GgufStr(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufStr.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufStr.prototype._readLE = function() {
        this.lenValue = this._io.readU8le();
        this.value = KaitaiStream.bytesToStr(this._io.readBytes(this.lenValue), "UTF-8");
      }
      GgufStr.prototype._readBE = function() {
        this.lenValue = this._io.readU8be();
        this.value = KaitaiStream.bytesToStr(this._io.readBytes(this.lenValue), "UTF-8");
      }

      return GgufStr;
    })();

    /**
     * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325|Git tag "v0.27.0"}
     */

    var GgufTensorInfo = GgufBody.GgufTensorInfo = (function() {
      function GgufTensorInfo(_io, _parent, _root, _is_le, expectedOffset) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;
        this.expectedOffset = expectedOffset;

        this._read();
      }
      GgufTensorInfo.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufTensorInfo.prototype._readLE = function() {
        this.name = new GgufStr(this._io, this, this._root, this._is_le);
        var _ = this.name;
        if (!(_.lenValue < 64)) {
          throw new KaitaiStream.ValidationExprError(this.name, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
        }
        this.numDims = this._io.readU4le();
        if (!(this.numDims <= 4)) {
          throw new KaitaiStream.ValidationGreaterThanError(4, this.numDims, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
        }
        this.dims = [];
        for (var i = 0; i < this.numDims; i++) {
          this.dims.push(this._io.readS8le());
          if (!(this.dims[i] >= 0)) {
            throw new KaitaiStream.ValidationLessThanError(0, this.dims[i], this._io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
          }
        }
        this.type = this._io.readU4le();
        var _ = this.type;
        if (!( ((_ < 43) && (this.numElementsPerBlock != 0) && (KaitaiStream.mod((this.numDims > 0 ? this.dims[0] : 1), this.numElementsPerBlock) == 0)) )) {
          throw new KaitaiStream.ValidationExprError(this.type, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
        }
        this.offset = this._io.readU8le();
        if (!(this.offset == this.expectedOffset)) {
          throw new KaitaiStream.ValidationNotEqualError(this.expectedOffset, this.offset, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
        }
      }
      GgufTensorInfo.prototype._readBE = function() {
        this.name = new GgufStr(this._io, this, this._root, this._is_le);
        var _ = this.name;
        if (!(_.lenValue < 64)) {
          throw new KaitaiStream.ValidationExprError(this.name, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/0");
        }
        this.numDims = this._io.readU4be();
        if (!(this.numDims <= 4)) {
          throw new KaitaiStream.ValidationGreaterThanError(4, this.numDims, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/1");
        }
        this.dims = [];
        for (var i = 0; i < this.numDims; i++) {
          this.dims.push(this._io.readS8be());
          if (!(this.dims[i] >= 0)) {
            throw new KaitaiStream.ValidationLessThanError(0, this.dims[i], this._io, "/types/gguf_body/types/gguf_tensor_info/seq/2");
          }
        }
        this.type = this._io.readU4be();
        var _ = this.type;
        if (!( ((_ < 43) && (this.numElementsPerBlock != 0) && (KaitaiStream.mod((this.numDims > 0 ? this.dims[0] : 1), this.numElementsPerBlock) == 0)) )) {
          throw new KaitaiStream.ValidationExprError(this.type, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/3");
        }
        this.offset = this._io.readU8be();
        if (!(this.offset == this.expectedOffset)) {
          throw new KaitaiStream.ValidationNotEqualError(this.expectedOffset, this.offset, this._io, "/types/gguf_body/types/gguf_tensor_info/seq/4");
        }
      }
      Object.defineProperty(GgufTensorInfo.prototype, 'data', {
        get: function() {
          if (this._m_data !== undefined)
            return this._m_data;
          var _pos = this._io.pos;
          this._io.seek(this._parent.ofsTensorData + this.offset);
          if (this._is_le) {
            this._m_data = this._io.readBytes(this.lenData);
          } else {
            this._m_data = this._io.readBytes(this.lenData);
          }
          this._io.seek(_pos);
          return this._m_data;
        }
      });

      /**
       * `dims` joined with the string `" x "`. This is necessary for
       * `-webide-representation`, which cannot format `dims` directly -
       * see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
       */
      Object.defineProperty(GgufTensorInfo.prototype, 'dumpDims', {
        get: function() {
          if (this._m_dumpDims !== undefined)
            return this._m_dumpDims;
          this._m_dumpDims = (((this.numDims > 0 ? (this.dims[0]).toString() : "") + (this.numDims > 1 ? " x " + (this.dims[1]).toString() : "")) + (this.numDims > 2 ? " x " + (this.dims[2]).toString() : "")) + (this.numDims > 3 ? " x " + (this.dims[3]).toString() : "");
          return this._m_dumpDims;
        }
      });

      /**
       * `offset` that the next tensor must have
       */
      Object.defineProperty(GgufTensorInfo.prototype, 'expectedNextOffset', {
        get: function() {
          if (this._m_expectedNextOffset !== undefined)
            return this._m_expectedNextOffset;
          this._m_expectedNextOffset = ((this.offset + this.lenData) + this.lenPadding);
          return this._m_expectedNextOffset;
        }
      });

      /**
       * Size of a block in bytes
       */
      Object.defineProperty(GgufTensorInfo.prototype, 'lenBlock', {
        get: function() {
          if (this._m_lenBlock !== undefined)
            return this._m_lenBlock;
          this._m_lenBlock = [4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18][this.type];
          return this._m_lenBlock;
        }
      });
      Object.defineProperty(GgufTensorInfo.prototype, 'lenData', {
        get: function() {
          if (this._m_lenData !== undefined)
            return this._m_lenData;
          this._m_lenData = (this.lenBlock * this.numBlocks);
          return this._m_lenData;
        }
      });

      /**
       * Number of padding bytes after the data
       */
      Object.defineProperty(GgufTensorInfo.prototype, 'lenPadding', {
        get: function() {
          if (this._m_lenPadding !== undefined)
            return this._m_lenPadding;
          this._m_lenPadding = KaitaiStream.mod(this._parent.alignment - KaitaiStream.mod(this.lenData, this._parent.alignment), this._parent.alignment);
          return this._m_lenPadding;
        }
      });
      Object.defineProperty(GgufTensorInfo.prototype, 'numBlocks', {
        get: function() {
          if (this._m_numBlocks !== undefined)
            return this._m_numBlocks;
          this._m_numBlocks = Math.floor(this.numElements / this.numElementsPerBlock);
          return this._m_numBlocks;
        }
      });
      Object.defineProperty(GgufTensorInfo.prototype, 'numElements', {
        get: function() {
          if (this._m_numElements !== undefined)
            return this._m_numElements;
          this._m_numElements = ((((this.numDims > 0 ? this.dims[0] : 1) * (this.numDims > 1 ? this.dims[1] : 1)) * (this.numDims > 2 ? this.dims[2] : 1)) * (this.numDims > 3 ? this.dims[3] : 1));
          return this._m_numElements;
        }
      });

      /**
       * Number of elements in a block
       */
      Object.defineProperty(GgufTensorInfo.prototype, 'numElementsPerBlock', {
        get: function() {
          if (this._m_numElementsPerBlock !== undefined)
            return this._m_numElementsPerBlock;
          this._m_numElementsPerBlock = [1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64][this.type];
          return this._m_numElementsPerBlock;
        }
      });

      /**
       * Padding after the data. ggml requires it even after the last tensor
       * when reading the tensor data.
       * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893|Git tag "v0.27.0"}
       */
      Object.defineProperty(GgufTensorInfo.prototype, 'padding', {
        get: function() {
          if (this._m_padding !== undefined)
            return this._m_padding;
          var _pos = this._io.pos;
          this._io.seek((this._parent.ofsTensorData + this.offset) + this.lenData);
          if (this._is_le) {
            this._m_padding = this._io.readBytes(this.lenPadding);
          } else {
            this._m_padding = this._io.readBytes(this.lenPadding);
          }
          this._io.seek(_pos);
          return this._m_padding;
        }
      });

      /**
       * Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
       */

      return GgufTensorInfo;
    })();

    var GgufUint16 = GgufBody.GgufUint16 = (function() {
      function GgufUint16(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufUint16.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufUint16.prototype._readLE = function() {
        this.value = this._io.readU2le();
      }
      GgufUint16.prototype._readBE = function() {
        this.value = this._io.readU2be();
      }

      return GgufUint16;
    })();

    var GgufUint32 = GgufBody.GgufUint32 = (function() {
      function GgufUint32(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufUint32.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufUint32.prototype._readLE = function() {
        this.value = this._io.readU4le();
      }
      GgufUint32.prototype._readBE = function() {
        this.value = this._io.readU4be();
      }

      return GgufUint32;
    })();

    var GgufUint64 = GgufBody.GgufUint64 = (function() {
      function GgufUint64(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufUint64.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufUint64.prototype._readLE = function() {
        this.value = this._io.readU8le();
      }
      GgufUint64.prototype._readBE = function() {
        this.value = this._io.readU8be();
      }

      return GgufUint64;
    })();

    var GgufUint8 = GgufBody.GgufUint8 = (function() {
      function GgufUint8(_io, _parent, _root, _is_le) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;

        this._read();
      }
      GgufUint8.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufUint8.prototype._readLE = function() {
        this.value = this._io.readU1();
      }
      GgufUint8.prototype._readBE = function() {
        this.value = this._io.readU1();
      }

      return GgufUint8;
    })();

    /**
     * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260|Git tag "v0.27.0"}
     */

    var GgufValue = GgufBody.GgufValue = (function() {
      function GgufValue(_io, _parent, _root, _is_le, type) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this._is_le = _is_le;
        this.type = type;

        this._read();
      }
      GgufValue.prototype._read = function() {

        if (this._is_le === true) {
          this._readLE();
        } else if (this._is_le === false) {
          this._readBE();
        } else {
          throw new KaitaiStream.UndecidedEndiannessError();
        }
      }
      GgufValue.prototype._readLE = function() {
        switch (this.type) {
        case Gguf.GgufType.ARRAY:
          this.value = new GgufArray(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.BOOL:
          this.value = new GgufBool(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.FLOAT32:
          this.value = new GgufFloat32(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.FLOAT64:
          this.value = new GgufFloat64(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT16:
          this.value = new GgufInt16(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT32:
          this.value = new GgufInt32(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT64:
          this.value = new GgufInt64(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT8:
          this.value = new GgufInt8(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.STRING:
          this.value = new GgufStr(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT16:
          this.value = new GgufUint16(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT32:
          this.value = new GgufUint32(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT64:
          this.value = new GgufUint64(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT8:
          this.value = new GgufUint8(this._io, this, this._root, this._is_le);
          break;
        }
      }
      GgufValue.prototype._readBE = function() {
        switch (this.type) {
        case Gguf.GgufType.ARRAY:
          this.value = new GgufArray(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.BOOL:
          this.value = new GgufBool(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.FLOAT32:
          this.value = new GgufFloat32(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.FLOAT64:
          this.value = new GgufFloat64(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT16:
          this.value = new GgufInt16(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT32:
          this.value = new GgufInt32(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT64:
          this.value = new GgufInt64(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.INT8:
          this.value = new GgufInt8(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.STRING:
          this.value = new GgufStr(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT16:
          this.value = new GgufUint16(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT32:
          this.value = new GgufUint32(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT64:
          this.value = new GgufUint64(this._io, this, this._root, this._is_le);
          break;
        case Gguf.GgufType.UINT8:
          this.value = new GgufUint8(this._io, this, this._root, this._is_le);
          break;
        }
      }

      return GgufValue;
    })();

    /**
     * Global alignment - from the `general.alignment` key, or 32 if there's no
     * such key.
     * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630|Git tag "v0.27.0"}
     */
    Object.defineProperty(GgufBody.prototype, 'alignment', {
      get: function() {
        if (this._m_alignment !== undefined)
          return this._m_alignment;
        this._m_alignment = (this.kvPairs.length != 0 ? this.kvPairs[this.kvPairs.length - 1].alignment : 32);
        return this._m_alignment;
      }
    });

    /**
     * Offset of the tensor data. Each tensor's `offset` is relative to this
     * position.
     */
    Object.defineProperty(GgufBody.prototype, 'ofsTensorData', {
      get: function() {
        if (this._m_ofsTensorData !== undefined)
          return this._m_ofsTensorData;
        this._m_ofsTensorData = this._io.pos;
        return this._m_ofsTensorData;
      }
    });

    /**
     * File format version. Version 1 used 32-bit counts and lengths, which
     * this Kaitai Struct implementation doesn't support, and neither does
     * ggml.
     */

    /**
     * The number of tensors in the file
     */

    /**
     * The number of key-value pairs in the file header
     */

    /**
     * Key-value pairs. ggml (v0.27.0)
     * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
     * duplicate keys, but this Kaitai Struct implementation can't detect
     * them. If there are multiple `general.alignment` keys, the last one is
     * used for the `alignment` value instance.
     */

    /**
     * Tensor metadata. ggml (v0.27.0)
     * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
     * duplicate tensor names, but this Kaitai Struct implementation can't
     * detect them.
     */

    /**
     * @see {@link https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785|Git tag "v0.27.0"}
     */

    return GgufBody;
  })();
  Object.defineProperty(Gguf.prototype, 'isBigEndian', {
    get: function() {
      if (this._m_isBigEndian !== undefined)
        return this._m_isBigEndian;
      this._m_isBigEndian = (this.versionLe & 65535) == 0;
      return this._m_isBigEndian;
    }
  });

  /**
   * Length of the file (computed from the header), including the padding after
   * the last tensor's data.
   * 
   * This Kaitai Struct implementation stops parsing where the tensor data
   * starts (which is read lazily, i.e. only on demand). Without reading the
   * tensor data, you can use this expected file size to check whether the file
   * has been truncated, to carve the file out of a larger one, etc.
   */
  Object.defineProperty(Gguf.prototype, 'lenFile', {
    get: function() {
      if (this._m_lenFile !== undefined)
        return this._m_lenFile;
      this._m_lenFile = (this.body.ofsTensorData + (this.body.numTensorInfos != 0 ? this.body.tensorInfos[this.body.tensorInfos.length - 1].expectedNextOffset : 0));
      return this._m_lenFile;
    }
  });
  Object.defineProperty(Gguf.prototype, 'versionLe', {
    get: function() {
      if (this._m_versionLe !== undefined)
        return this._m_versionLe;
      var _pos = this._io.pos;
      this._io.seek(4);
      this._m_versionLe = this._io.readU4le();
      this._io.seek(_pos);
      return this._m_versionLe;
    }
  });

  /**
   * GGUF file magic
   */

  return Gguf;
})();
Gguf_.Gguf = Gguf;
});
