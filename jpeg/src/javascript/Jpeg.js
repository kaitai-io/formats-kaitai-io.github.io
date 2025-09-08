// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './Exif'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./Exif'));
  } else {
    factory(root.Jpeg || (root.Jpeg = {}), root.KaitaiStream, root.Exif || (root.Exif = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (Jpeg_, KaitaiStream, Exif_) {
/**
 * JPEG File Interchange Format, or JFIF, or, more colloquially known
 * as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
 * offering lossy compression which works reasonably well with
 * photographic images.
 * 
 * Format is organized as a container format, serving multiple
 * "segments", each starting with a magic and a marker. JFIF standard
 * dictates order and mandatory apperance of segments:
 * 
 * * SOI
 * * APP0 (with JFIF magic)
 * * APP0 (with JFXX magic, optional)
 * * everything else
 * * SOS
 * * JPEG-compressed stream
 * * EOI
 */

var Jpeg = (function() {
  Jpeg.ComponentId = Object.freeze({
    Y: 1,
    CB: 2,
    CR: 3,
    I: 4,
    Q: 5,

    1: "Y",
    2: "CB",
    3: "CR",
    4: "I",
    5: "Q",
  });

  function Jpeg(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Jpeg.prototype._read = function() {
    this.segments = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.segments.push(new Segment(this._io, this, this._root));
      i++;
    }
  }

  var ExifInJpeg = Jpeg.ExifInJpeg = (function() {
    function ExifInJpeg(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ExifInJpeg.prototype._read = function() {
      this.extraZero = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.extraZero, new Uint8Array([0])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([0]), this.extraZero, this._io, "/types/exif_in_jpeg/seq/0");
      }
      this._raw_data = this._io.readBytesFull();
      var _io__raw_data = new KaitaiStream(this._raw_data);
      this.data = new Exif_.Exif(_io__raw_data, null, null);
    }

    return ExifInJpeg;
  })();

  var Segment = Jpeg.Segment = (function() {
    Segment.MarkerEnum = Object.freeze({
      TEM: 1,
      SOF0: 192,
      SOF1: 193,
      SOF2: 194,
      SOF3: 195,
      DHT: 196,
      SOF5: 197,
      SOF6: 198,
      SOF7: 199,
      SOI: 216,
      EOI: 217,
      SOS: 218,
      DQT: 219,
      DNL: 220,
      DRI: 221,
      DHP: 222,
      APP0: 224,
      APP1: 225,
      APP2: 226,
      APP3: 227,
      APP4: 228,
      APP5: 229,
      APP6: 230,
      APP7: 231,
      APP8: 232,
      APP9: 233,
      APP10: 234,
      APP11: 235,
      APP12: 236,
      APP13: 237,
      APP14: 238,
      APP15: 239,
      COM: 254,

      1: "TEM",
      192: "SOF0",
      193: "SOF1",
      194: "SOF2",
      195: "SOF3",
      196: "DHT",
      197: "SOF5",
      198: "SOF6",
      199: "SOF7",
      216: "SOI",
      217: "EOI",
      218: "SOS",
      219: "DQT",
      220: "DNL",
      221: "DRI",
      222: "DHP",
      224: "APP0",
      225: "APP1",
      226: "APP2",
      227: "APP3",
      228: "APP4",
      229: "APP5",
      230: "APP6",
      231: "APP7",
      232: "APP8",
      233: "APP9",
      234: "APP10",
      235: "APP11",
      236: "APP12",
      237: "APP13",
      238: "APP14",
      239: "APP15",
      254: "COM",
    });

    function Segment(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Segment.prototype._read = function() {
      this.magic = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([255])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([255]), this.magic, this._io, "/types/segment/seq/0");
      }
      this.marker = this._io.readU1();
      if ( ((this.marker != Jpeg.Segment.MarkerEnum.SOI) && (this.marker != Jpeg.Segment.MarkerEnum.EOI)) ) {
        this.length = this._io.readU2be();
      }
      if ( ((this.marker != Jpeg.Segment.MarkerEnum.SOI) && (this.marker != Jpeg.Segment.MarkerEnum.EOI)) ) {
        switch (this.marker) {
        case Jpeg.Segment.MarkerEnum.APP0:
          this._raw_data = this._io.readBytes(this.length - 2);
          var _io__raw_data = new KaitaiStream(this._raw_data);
          this.data = new SegmentApp0(_io__raw_data, this, this._root);
          break;
        case Jpeg.Segment.MarkerEnum.APP1:
          this._raw_data = this._io.readBytes(this.length - 2);
          var _io__raw_data = new KaitaiStream(this._raw_data);
          this.data = new SegmentApp1(_io__raw_data, this, this._root);
          break;
        case Jpeg.Segment.MarkerEnum.SOF0:
          this._raw_data = this._io.readBytes(this.length - 2);
          var _io__raw_data = new KaitaiStream(this._raw_data);
          this.data = new SegmentSof0(_io__raw_data, this, this._root);
          break;
        case Jpeg.Segment.MarkerEnum.SOS:
          this._raw_data = this._io.readBytes(this.length - 2);
          var _io__raw_data = new KaitaiStream(this._raw_data);
          this.data = new SegmentSos(_io__raw_data, this, this._root);
          break;
        default:
          this.data = this._io.readBytes(this.length - 2);
          break;
        }
      }
      if (this.marker == Jpeg.Segment.MarkerEnum.SOS) {
        this.imageData = this._io.readBytesFull();
      }
    }

    return Segment;
  })();

  var SegmentApp0 = Jpeg.SegmentApp0 = (function() {
    SegmentApp0.DensityUnit = Object.freeze({
      NO_UNITS: 0,
      PIXELS_PER_INCH: 1,
      PIXELS_PER_CM: 2,

      0: "NO_UNITS",
      1: "PIXELS_PER_INCH",
      2: "PIXELS_PER_CM",
    });

    function SegmentApp0(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SegmentApp0.prototype._read = function() {
      this.magic = KaitaiStream.bytesToStr(this._io.readBytes(5), "ASCII");
      this.versionMajor = this._io.readU1();
      this.versionMinor = this._io.readU1();
      this.densityUnits = this._io.readU1();
      this.densityX = this._io.readU2be();
      this.densityY = this._io.readU2be();
      this.thumbnailX = this._io.readU1();
      this.thumbnailY = this._io.readU1();
      this.thumbnail = this._io.readBytes((this.thumbnailX * this.thumbnailY) * 3);
    }

    /**
     * Horizontal pixel density. Must not be zero.
     */

    /**
     * Vertical pixel density. Must not be zero.
     */

    /**
     * Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
     */

    /**
     * Vertical pixel count of the following embedded RGB thumbnail. May be zero.
     */

    /**
     * Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
     */

    return SegmentApp0;
  })();

  var SegmentApp1 = Jpeg.SegmentApp1 = (function() {
    function SegmentApp1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SegmentApp1.prototype._read = function() {
      this.magic = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
      switch (this.magic) {
      case "Exif":
        this.body = new ExifInJpeg(this._io, this, this._root);
        break;
      }
    }

    return SegmentApp1;
  })();

  var SegmentSof0 = Jpeg.SegmentSof0 = (function() {
    function SegmentSof0(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SegmentSof0.prototype._read = function() {
      this.bitsPerSample = this._io.readU1();
      this.imageHeight = this._io.readU2be();
      this.imageWidth = this._io.readU2be();
      this.numComponents = this._io.readU1();
      this.components = [];
      for (var i = 0; i < this.numComponents; i++) {
        this.components.push(new Component(this._io, this, this._root));
      }
    }

    var Component = SegmentSof0.Component = (function() {
      function Component(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Component.prototype._read = function() {
        this.id = this._io.readU1();
        this.samplingFactors = this._io.readU1();
        this.quantizationTableId = this._io.readU1();
      }
      Object.defineProperty(Component.prototype, 'samplingX', {
        get: function() {
          if (this._m_samplingX !== undefined)
            return this._m_samplingX;
          this._m_samplingX = (this.samplingFactors & 240) >>> 4;
          return this._m_samplingX;
        }
      });
      Object.defineProperty(Component.prototype, 'samplingY', {
        get: function() {
          if (this._m_samplingY !== undefined)
            return this._m_samplingY;
          this._m_samplingY = this.samplingFactors & 15;
          return this._m_samplingY;
        }
      });

      /**
       * Component selector
       */

      return Component;
    })();

    return SegmentSof0;
  })();

  var SegmentSos = Jpeg.SegmentSos = (function() {
    function SegmentSos(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    SegmentSos.prototype._read = function() {
      this.numComponents = this._io.readU1();
      this.components = [];
      for (var i = 0; i < this.numComponents; i++) {
        this.components.push(new Component(this._io, this, this._root));
      }
      this.startSpectralSelection = this._io.readU1();
      this.endSpectral = this._io.readU1();
      this.apprBitPos = this._io.readU1();
    }

    var Component = SegmentSos.Component = (function() {
      function Component(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Component.prototype._read = function() {
        this.id = this._io.readU1();
        this.huffmanTable = this._io.readU1();
      }

      /**
       * Scan component selector
       */

      return Component;
    })();

    /**
     * Number of components in scan
     */

    /**
     * Scan components specification
     */

    /**
     * Start of spectral selection or predictor selection
     */

    /**
     * End of spectral selection
     */

    /**
     * Successive approximation bit position high + Successive approximation bit position low or point transform
     */

    return SegmentSos;
  })();

  return Jpeg;
})();
Jpeg_.Jpeg = Jpeg;
});
