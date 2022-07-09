// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.ShapefileIndex = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var ShapefileIndex = (function() {
  ShapefileIndex.ShapeType = Object.freeze({
    NULL_SHAPE: 0,
    POINT: 1,
    POLY_LINE: 3,
    POLYGON: 5,
    MULTI_POINT: 8,
    POINT_Z: 11,
    POLY_LINE_Z: 13,
    POLYGON_Z: 15,
    MULTI_POINT_Z: 18,
    POINT_M: 21,
    POLY_LINE_M: 23,
    POLYGON_M: 25,
    MULTI_POINT_M: 28,
    MULTI_PATCH: 31,

    0: "NULL_SHAPE",
    1: "POINT",
    3: "POLY_LINE",
    5: "POLYGON",
    8: "MULTI_POINT",
    11: "POINT_Z",
    13: "POLY_LINE_Z",
    15: "POLYGON_Z",
    18: "MULTI_POINT_Z",
    21: "POINT_M",
    23: "POLY_LINE_M",
    25: "POLYGON_M",
    28: "MULTI_POINT_M",
    31: "MULTI_PATCH",
  });

  function ShapefileIndex(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ShapefileIndex.prototype._read = function() {
    this.header = new FileHeader(this._io, this, this._root);
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
      i++;
    }
  }

  var FileHeader = ShapefileIndex.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.fileCode = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.fileCode, [0, 0, 39, 10]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 39, 10], this.fileCode, this._io, "/types/file_header/seq/0");
      }
      this.unusedField1 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.unusedField1, [0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0], this.unusedField1, this._io, "/types/file_header/seq/1");
      }
      this.unusedField2 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.unusedField2, [0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0], this.unusedField2, this._io, "/types/file_header/seq/2");
      }
      this.unusedField3 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.unusedField3, [0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0], this.unusedField3, this._io, "/types/file_header/seq/3");
      }
      this.unusedField4 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.unusedField4, [0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0], this.unusedField4, this._io, "/types/file_header/seq/4");
      }
      this.unusedField5 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.unusedField5, [0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0], this.unusedField5, this._io, "/types/file_header/seq/5");
      }
      this.fileLength = this._io.readS4be();
      this.version = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.version, [232, 3, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([232, 3, 0, 0], this.version, this._io, "/types/file_header/seq/7");
      }
      this.shapeType = this._io.readS4le();
      this.boundingBox = new BoundingBoxXYZM(this._io, this, this._root);
    }

    /**
     * corresponds to s4be value of 9994
     */

    /**
     * corresponds to s4le value of 1000
     */

    return FileHeader;
  })();

  var Record = ShapefileIndex.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.offset = this._io.readS4be();
      this.contentLength = this._io.readS4be();
    }

    return Record;
  })();

  var BoundingBoxXYZM = ShapefileIndex.BoundingBoxXYZM = (function() {
    function BoundingBoxXYZM(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BoundingBoxXYZM.prototype._read = function() {
      this.x = new BoundsMinMax(this._io, this, this._root);
      this.y = new BoundsMinMax(this._io, this, this._root);
      this.z = new BoundsMinMax(this._io, this, this._root);
      this.m = new BoundsMinMax(this._io, this, this._root);
    }

    return BoundingBoxXYZM;
  })();

  var BoundsMinMax = ShapefileIndex.BoundsMinMax = (function() {
    function BoundsMinMax(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BoundsMinMax.prototype._read = function() {
      this.min = this._io.readF8be();
      this.max = this._io.readF8be();
    }

    return BoundsMinMax;
  })();

  /**
   * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
   */

  return ShapefileIndex;
})();
return ShapefileIndex;
}));
