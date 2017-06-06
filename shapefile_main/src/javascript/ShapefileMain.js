// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var ShapefileMain = (function() {
  ShapefileMain.ShapeType = Object.freeze({
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

  ShapefileMain.PartType = Object.freeze({
    TRIANGLE_STRIP: 0,
    TRIANGLE_FAN: 1,
    OUTER_RING: 2,
    INNER_RING: 3,
    FIRST_RING: 4,
    RING: 5,

    0: "TRIANGLE_STRIP",
    1: "TRIANGLE_FAN",
    2: "OUTER_RING",
    3: "INNER_RING",
    4: "FIRST_RING",
    5: "RING",
  });

  function ShapefileMain(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ShapefileMain.prototype._read = function() {
    this.header = new FileHeader(this._io, this, this._root);
    this.records = [];
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
    }
  }

  var MultiPointM = ShapefileMain.MultiPointM = (function() {
    function MultiPointM(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MultiPointM.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfPoints = this._io.readS4le();
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return MultiPointM;
  })();

  var BoundingBoxXYZM = ShapefileMain.BoundingBoxXYZM = (function() {
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

  var Point = ShapefileMain.Point = (function() {
    function Point(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Point.prototype._read = function() {
      this.x = this._io.readF8le();
      this.y = this._io.readF8le();
    }

    return Point;
  })();

  var Polygon = ShapefileMain.Polygon = (function() {
    function Polygon(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Polygon.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
    }

    return Polygon;
  })();

  var BoundsMinMax = ShapefileMain.BoundsMinMax = (function() {
    function BoundsMinMax(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BoundsMinMax.prototype._read = function() {
      this.min = this._io.readF8le();
      this.max = this._io.readF8le();
    }

    return BoundsMinMax;
  })();

  var PolyLine = ShapefileMain.PolyLine = (function() {
    function PolyLine(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolyLine.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
    }

    return PolyLine;
  })();

  var MultiPointZ = ShapefileMain.MultiPointZ = (function() {
    function MultiPointZ(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MultiPointZ.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfPoints = this._io.readS4le();
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.zRange = new BoundsMinMax(this._io, this, this._root);
      this.zValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.zValues[i] = this._io.readF8le();
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return MultiPointZ;
  })();

  var PolyLineZ = ShapefileMain.PolyLineZ = (function() {
    function PolyLineZ(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolyLineZ.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.zRange = new BoundsMinMax(this._io, this, this._root);
      this.zValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.zValues[i] = this._io.readF8le();
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return PolyLineZ;
  })();

  var PolygonZ = ShapefileMain.PolygonZ = (function() {
    function PolygonZ(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolygonZ.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.zRange = new BoundsMinMax(this._io, this, this._root);
      this.zValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.zValues[i] = this._io.readF8le();
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return PolygonZ;
  })();

  var BoundingBoxXY = ShapefileMain.BoundingBoxXY = (function() {
    function BoundingBoxXY(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BoundingBoxXY.prototype._read = function() {
      this.x = new BoundsMinMax(this._io, this, this._root);
      this.y = new BoundsMinMax(this._io, this, this._root);
    }

    return BoundingBoxXY;
  })();

  var PointM = ShapefileMain.PointM = (function() {
    function PointM(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PointM.prototype._read = function() {
      this.x = this._io.readF8le();
      this.y = this._io.readF8le();
      this.m = this._io.readF8le();
    }

    return PointM;
  })();

  var PolygonM = ShapefileMain.PolygonM = (function() {
    function PolygonM(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolygonM.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return PolygonM;
  })();

  var RecordHeader = ShapefileMain.RecordHeader = (function() {
    function RecordHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordHeader.prototype._read = function() {
      this.recordNumber = this._io.readS4be();
      this.contentLength = this._io.readS4be();
    }

    return RecordHeader;
  })();

  var MultiPoint = ShapefileMain.MultiPoint = (function() {
    function MultiPoint(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MultiPoint.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfPoints = this._io.readS4le();
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
    }

    return MultiPoint;
  })();

  var FileHeader = ShapefileMain.FileHeader = (function() {
    function FileHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileHeader.prototype._read = function() {
      this.fileCode = this._io.ensureFixedContents([0, 0, 39, 10]);
      this.unusedField1 = this._io.ensureFixedContents([0, 0, 0, 0]);
      this.unusedField2 = this._io.ensureFixedContents([0, 0, 0, 0]);
      this.unusedField3 = this._io.ensureFixedContents([0, 0, 0, 0]);
      this.unusedField4 = this._io.ensureFixedContents([0, 0, 0, 0]);
      this.unusedField5 = this._io.ensureFixedContents([0, 0, 0, 0]);
      this.fileLength = this._io.readS4be();
      this.version = this._io.ensureFixedContents([232, 3, 0, 0]);
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

  var PointZ = ShapefileMain.PointZ = (function() {
    function PointZ(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PointZ.prototype._read = function() {
      this.x = this._io.readF8le();
      this.y = this._io.readF8le();
      this.z = this._io.readF8le();
      this.m = this._io.readF8le();
    }

    return PointZ;
  })();

  var Record = ShapefileMain.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.header = new RecordHeader(this._io, this, this._root);
      this.contents = new RecordContents(this._io, this, this._root);
    }

    /**
     * the size of this contents section in bytes must equal header.content_length * 2
     */

    return Record;
  })();

  var RecordContents = ShapefileMain.RecordContents = (function() {
    function RecordContents(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordContents.prototype._read = function() {
      this.shapeType = this._io.readS4le();
      if (this.shapeType != ShapefileMain.ShapeType.NULL_SHAPE) {
        switch (this.shapeType) {
        case ShapefileMain.ShapeType.POINT_M:
          this.shapeParameters = new PointM(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POLYGON_Z:
          this.shapeParameters = new PolygonZ(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.MULTI_POINT_M:
          this.shapeParameters = new MultiPointM(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POLY_LINE_Z:
          this.shapeParameters = new PolyLineZ(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.MULTI_POINT_Z:
          this.shapeParameters = new MultiPointZ(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.MULTI_POINT:
          this.shapeParameters = new MultiPoint(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POLYGON_M:
          this.shapeParameters = new PolygonM(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POLYGON:
          this.shapeParameters = new Polygon(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POINT:
          this.shapeParameters = new Point(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POLY_LINE_M:
          this.shapeParameters = new PolyLineM(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POLY_LINE:
          this.shapeParameters = new PolyLine(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.POINT_Z:
          this.shapeParameters = new PointZ(this._io, this, this._root);
          break;
        case ShapefileMain.ShapeType.MULTI_PATCH:
          this.shapeParameters = new MultiPatch(this._io, this, this._root);
          break;
        }
      }
    }

    return RecordContents;
  })();

  var MultiPatch = ShapefileMain.MultiPatch = (function() {
    function MultiPatch(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MultiPatch.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.partTypes = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.partTypes[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.zRange = new BoundsMinMax(this._io, this, this._root);
      this.zValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.zValues[i] = this._io.readF8le();
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return MultiPatch;
  })();

  var PolyLineM = ShapefileMain.PolyLineM = (function() {
    function PolyLineM(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PolyLineM.prototype._read = function() {
      this.boundingBox = new BoundingBoxXY(this._io, this, this._root);
      this.numberOfParts = this._io.readS4le();
      this.numberOfPoints = this._io.readS4le();
      this.parts = new Array(this.numberOfParts);
      for (var i = 0; i < this.numberOfParts; i++) {
        this.parts[i] = this._io.readS4le();
      }
      this.points = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.points[i] = new Point(this._io, this, this._root);
      }
      this.mRange = new BoundsMinMax(this._io, this, this._root);
      this.mValues = new Array(this.numberOfPoints);
      for (var i = 0; i < this.numberOfPoints; i++) {
        this.mValues[i] = this._io.readF8le();
      }
    }

    return PolyLineM;
  })();

  /**
   * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
   */

  return ShapefileMain;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('ShapefileMain', [], function() {
    return ShapefileMain;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = ShapefileMain;
}
