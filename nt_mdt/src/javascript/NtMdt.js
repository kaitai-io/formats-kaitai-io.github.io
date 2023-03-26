// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.NtMdt = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * A native file format of NT-MDT scientific software. Usually contains
 * any of:
 * 
 * * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
 * * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
 * * results of their analysis
 * 
 * Some examples of mdt files can be downloaded at:
 * 
 * * <https://www.ntmdt-si.ru/resources/scan-gallery>
 * * <http://callistosoft.narod.ru/Resources/Mdt.zip>
 * @see {@link https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c|Source}
 */

var NtMdt = (function() {
  NtMdt.AdcMode = Object.freeze({
    HEIGHT: 0,
    DFL: 1,
    LATERAL_F: 2,
    BIAS_V: 3,
    CURRENT: 4,
    FB_OUT: 5,
    MAG: 6,
    MAG_SIN: 7,
    MAG_COS: 8,
    RMS: 9,
    CALC_MAG: 10,
    PHASE1: 11,
    PHASE2: 12,
    CALC_PHASE: 13,
    EX1: 14,
    EX2: 15,
    HV_X: 16,
    HV_Y: 17,
    SNAP_BACK: 18,
    FALSE: 255,

    0: "HEIGHT",
    1: "DFL",
    2: "LATERAL_F",
    3: "BIAS_V",
    4: "CURRENT",
    5: "FB_OUT",
    6: "MAG",
    7: "MAG_SIN",
    8: "MAG_COS",
    9: "RMS",
    10: "CALC_MAG",
    11: "PHASE1",
    12: "PHASE2",
    13: "CALC_PHASE",
    14: "EX1",
    15: "EX2",
    16: "HV_X",
    17: "HV_Y",
    18: "SNAP_BACK",
    255: "FALSE",
  });

  NtMdt.XmlScanLocation = Object.freeze({
    HLT: 0,
    HLB: 1,
    HRT: 2,
    HRB: 3,
    VLT: 4,
    VLB: 5,
    VRT: 6,
    VRB: 7,

    0: "HLT",
    1: "HLB",
    2: "HRT",
    3: "HRB",
    4: "VLT",
    5: "VLB",
    6: "VRT",
    7: "VRB",
  });

  NtMdt.DataType = Object.freeze({
    FLOATFIX: -65544,
    FLOAT80: -16138,
    FLOAT64: -13320,
    FLOAT48: -9990,
    FLOAT32: -5892,
    INT64: -8,
    INT32: -4,
    INT16: -2,
    INT8: -1,
    UNKNOWN0: 0,
    UINT8: 1,
    UINT16: 2,
    UINT32: 4,
    UINT64: 8,

    "-65544": "FLOATFIX",
    "-16138": "FLOAT80",
    "-13320": "FLOAT64",
    "-9990": "FLOAT48",
    "-5892": "FLOAT32",
    "-8": "INT64",
    "-4": "INT32",
    "-2": "INT16",
    "-1": "INT8",
    0: "UNKNOWN0",
    1: "UINT8",
    2: "UINT16",
    4: "UINT32",
    8: "UINT64",
  });

  NtMdt.XmlParamType = Object.freeze({
    NONE: 0,
    LASER_WAVELENGTH: 1,
    UNITS: 2,
    DATA_ARRAY: 255,

    0: "NONE",
    1: "LASER_WAVELENGTH",
    2: "UNITS",
    255: "DATA_ARRAY",
  });

  NtMdt.SpmMode = Object.freeze({
    CONSTANT_FORCE: 0,
    CONTACT_CONSTANT_HEIGHT: 1,
    CONTACT_ERROR: 2,
    LATERAL_FORCE: 3,
    FORCE_MODULATION: 4,
    SPREADING_RESISTANCE_IMAGING: 5,
    SEMICONTACT_TOPOGRAPHY: 6,
    SEMICONTACT_ERROR: 7,
    PHASE_CONTRAST: 8,
    AC_MAGNETIC_FORCE: 9,
    DC_MAGNETIC_FORCE: 10,
    ELECTROSTATIC_FORCE: 11,
    CAPACITANCE_CONTRAST: 12,
    KELVIN_PROBE: 13,
    CONSTANT_CURRENT: 14,
    BARRIER_HEIGHT: 15,
    CONSTANT_HEIGHT: 16,
    AFAM: 17,
    CONTACT_EFM: 18,
    SHEAR_FORCE_TOPOGRAPHY: 19,
    SFOM: 20,
    CONTACT_CAPACITANCE: 21,
    SNOM_TRANSMISSION: 22,
    SNOM_REFLECTION: 23,
    SNOM_ALL: 24,
    SNOM: 25,

    0: "CONSTANT_FORCE",
    1: "CONTACT_CONSTANT_HEIGHT",
    2: "CONTACT_ERROR",
    3: "LATERAL_FORCE",
    4: "FORCE_MODULATION",
    5: "SPREADING_RESISTANCE_IMAGING",
    6: "SEMICONTACT_TOPOGRAPHY",
    7: "SEMICONTACT_ERROR",
    8: "PHASE_CONTRAST",
    9: "AC_MAGNETIC_FORCE",
    10: "DC_MAGNETIC_FORCE",
    11: "ELECTROSTATIC_FORCE",
    12: "CAPACITANCE_CONTRAST",
    13: "KELVIN_PROBE",
    14: "CONSTANT_CURRENT",
    15: "BARRIER_HEIGHT",
    16: "CONSTANT_HEIGHT",
    17: "AFAM",
    18: "CONTACT_EFM",
    19: "SHEAR_FORCE_TOPOGRAPHY",
    20: "SFOM",
    21: "CONTACT_CAPACITANCE",
    22: "SNOM_TRANSMISSION",
    23: "SNOM_REFLECTION",
    24: "SNOM_ALL",
    25: "SNOM",
  });

  NtMdt.Unit = Object.freeze({
    RAMAN_SHIFT: -10,
    RESERVED0: -9,
    RESERVED1: -8,
    RESERVED2: -7,
    RESERVED3: -6,
    METER: -5,
    CENTI_METER: -4,
    MILLI_METER: -3,
    MICRO_METER: -2,
    NANO_METER: -1,
    ANGSTROM: 0,
    NANO_AMPERE: 1,
    VOLT: 2,
    NONE: 3,
    KILO_HERTZ: 4,
    DEGREES: 5,
    PERCENT: 6,
    CELSIUS_DEGREE: 7,
    VOLT_HIGH: 8,
    SECOND: 9,
    MILLI_SECOND: 10,
    MICRO_SECOND: 11,
    NANO_SECOND: 12,
    COUNTS: 13,
    PIXELS: 14,
    RESERVED_SFOM0: 15,
    RESERVED_SFOM1: 16,
    RESERVED_SFOM2: 17,
    RESERVED_SFOM3: 18,
    RESERVED_SFOM4: 19,
    AMPERE2: 20,
    MILLI_AMPERE: 21,
    MICRO_AMPERE: 22,
    NANO_AMPERE2: 23,
    PICO_AMPERE: 24,
    VOLT2: 25,
    MILLI_VOLT: 26,
    MICRO_VOLT: 27,
    NANO_VOLT: 28,
    PICO_VOLT: 29,
    NEWTON: 30,
    MILLI_NEWTON: 31,
    MICRO_NEWTON: 32,
    NANO_NEWTON: 33,
    PICO_NEWTON: 34,
    RESERVED_DOS0: 35,
    RESERVED_DOS1: 36,
    RESERVED_DOS2: 37,
    RESERVED_DOS3: 38,
    RESERVED_DOS4: 39,

    "-10": "RAMAN_SHIFT",
    "-9": "RESERVED0",
    "-8": "RESERVED1",
    "-7": "RESERVED2",
    "-6": "RESERVED3",
    "-5": "METER",
    "-4": "CENTI_METER",
    "-3": "MILLI_METER",
    "-2": "MICRO_METER",
    "-1": "NANO_METER",
    0: "ANGSTROM",
    1: "NANO_AMPERE",
    2: "VOLT",
    3: "NONE",
    4: "KILO_HERTZ",
    5: "DEGREES",
    6: "PERCENT",
    7: "CELSIUS_DEGREE",
    8: "VOLT_HIGH",
    9: "SECOND",
    10: "MILLI_SECOND",
    11: "MICRO_SECOND",
    12: "NANO_SECOND",
    13: "COUNTS",
    14: "PIXELS",
    15: "RESERVED_SFOM0",
    16: "RESERVED_SFOM1",
    17: "RESERVED_SFOM2",
    18: "RESERVED_SFOM3",
    19: "RESERVED_SFOM4",
    20: "AMPERE2",
    21: "MILLI_AMPERE",
    22: "MICRO_AMPERE",
    23: "NANO_AMPERE2",
    24: "PICO_AMPERE",
    25: "VOLT2",
    26: "MILLI_VOLT",
    27: "MICRO_VOLT",
    28: "NANO_VOLT",
    29: "PICO_VOLT",
    30: "NEWTON",
    31: "MILLI_NEWTON",
    32: "MICRO_NEWTON",
    33: "NANO_NEWTON",
    34: "PICO_NEWTON",
    35: "RESERVED_DOS0",
    36: "RESERVED_DOS1",
    37: "RESERVED_DOS2",
    38: "RESERVED_DOS3",
    39: "RESERVED_DOS4",
  });

  NtMdt.SpmTechnique = Object.freeze({
    CONTACT_MODE: 0,
    SEMICONTACT_MODE: 1,
    TUNNEL_CURRENT: 2,
    SNOM: 3,

    0: "CONTACT_MODE",
    1: "SEMICONTACT_MODE",
    2: "TUNNEL_CURRENT",
    3: "SNOM",
  });

  NtMdt.Consts = Object.freeze({
    FRAME_MODE_SIZE: 8,
    FRAME_HEADER_SIZE: 22,
    AXIS_SCALES_SIZE: 30,
    FILE_HEADER_SIZE: 32,
    SPECTRO_VARS_MIN_SIZE: 38,
    SCAN_VARS_MIN_SIZE: 77,

    8: "FRAME_MODE_SIZE",
    22: "FRAME_HEADER_SIZE",
    30: "AXIS_SCALES_SIZE",
    32: "FILE_HEADER_SIZE",
    38: "SPECTRO_VARS_MIN_SIZE",
    77: "SCAN_VARS_MIN_SIZE",
  });

  function NtMdt(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  NtMdt.prototype._read = function() {
    this.signature = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.signature, [1, 176, 147, 255]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([1, 176, 147, 255], this.signature, this._io, "/seq/0");
    }
    this.size = this._io.readU4le();
    this.reserved0 = this._io.readBytes(4);
    this.lastFrame = this._io.readU2le();
    this.reserved1 = this._io.readBytes(18);
    this.wrondDoc = this._io.readBytes(1);
    this._raw_frames = this._io.readBytes(this.size);
    var _io__raw_frames = new KaitaiStream(this._raw_frames);
    this.frames = new Framez(_io__raw_frames, this, this._root);
  }

  var Uuid = NtMdt.Uuid = (function() {
    function Uuid(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Uuid.prototype._read = function() {
      this.data = [];
      for (var i = 0; i < 16; i++) {
        this.data.push(this._io.readU1());
      }
    }

    return Uuid;
  })();

  var Framez = NtMdt.Framez = (function() {
    function Framez(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Framez.prototype._read = function() {
      this.frames = [];
      for (var i = 0; i < (this._root.lastFrame + 1); i++) {
        this.frames.push(new Frame(this._io, this, this._root));
      }
    }

    return Framez;
  })();

  var Frame = NtMdt.Frame = (function() {
    Frame.FrameType = Object.freeze({
      SCANNED: 0,
      SPECTROSCOPY: 1,
      TEXT: 3,
      OLD_MDA: 105,
      MDA: 106,
      PALETTE: 107,
      CURVES_NEW: 190,
      CURVES: 201,

      0: "SCANNED",
      1: "SPECTROSCOPY",
      3: "TEXT",
      105: "OLD_MDA",
      106: "MDA",
      107: "PALETTE",
      190: "CURVES_NEW",
      201: "CURVES",
    });

    function Frame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Frame.prototype._read = function() {
      this.size = this._io.readU4le();
      this._raw_main = this._io.readBytes((this.size - 4));
      var _io__raw_main = new KaitaiStream(this._raw_main);
      this.main = new FrameMain(_io__raw_main, this, this._root);
    }

    var Dots = Frame.Dots = (function() {
      function Dots(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Dots.prototype._read = function() {
        this.fmNdots = this._io.readU2le();
        if (this.fmNdots > 0) {
          this.coordHeader = new DotsHeader(this._io, this, this._root);
        }
        this.coordinates = [];
        for (var i = 0; i < this.fmNdots; i++) {
          this.coordinates.push(new DotsData(this._io, this, this._root));
        }
        this.data = [];
        for (var i = 0; i < this.fmNdots; i++) {
          this.data.push(new DataLinez(this._io, this, this._root, i));
        }
      }

      var DotsHeader = Dots.DotsHeader = (function() {
        function DotsHeader(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        DotsHeader.prototype._read = function() {
          this.headerSize = this._io.readS4le();
          this._raw_header = this._io.readBytes(this.headerSize);
          var _io__raw_header = new KaitaiStream(this._raw_header);
          this.header = new Header(_io__raw_header, this, this._root);
        }

        var Header = DotsHeader.Header = (function() {
          function Header(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          Header.prototype._read = function() {
            this.coordSize = this._io.readS4le();
            this.version = this._io.readS4le();
            this.xyunits = this._io.readS2le();
          }

          return Header;
        })();

        return DotsHeader;
      })();

      var DotsData = Dots.DotsData = (function() {
        function DotsData(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        DotsData.prototype._read = function() {
          this.coordX = this._io.readF4le();
          this.coordY = this._io.readF4le();
          this.forwardSize = this._io.readS4le();
          this.backwardSize = this._io.readS4le();
        }

        return DotsData;
      })();

      var DataLinez = Dots.DataLinez = (function() {
        function DataLinez(_io, _parent, _root, index) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;
          this.index = index;

          this._read();
        }
        DataLinez.prototype._read = function() {
          this.forward = [];
          for (var i = 0; i < this._parent.coordinates[this.index].forwardSize; i++) {
            this.forward.push(this._io.readS2le());
          }
          this.backward = [];
          for (var i = 0; i < this._parent.coordinates[this.index].backwardSize; i++) {
            this.backward.push(this._io.readS2le());
          }
        }

        return DataLinez;
      })();

      return Dots;
    })();

    var FrameMain = Frame.FrameMain = (function() {
      function FrameMain(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FrameMain.prototype._read = function() {
        this.type = this._io.readU2le();
        this.version = new Version(this._io, this, this._root);
        this.dateTime = new DateTime(this._io, this, this._root);
        this.varSize = this._io.readU2le();
        switch (this.type) {
        case NtMdt.Frame.FrameType.MDA:
          this._raw_frameData = this._io.readBytesFull();
          var _io__raw_frameData = new KaitaiStream(this._raw_frameData);
          this.frameData = new FdMetaData(_io__raw_frameData, this, this._root);
          break;
        case NtMdt.Frame.FrameType.CURVES_NEW:
          this._raw_frameData = this._io.readBytesFull();
          var _io__raw_frameData = new KaitaiStream(this._raw_frameData);
          this.frameData = new FdCurvesNew(_io__raw_frameData, this, this._root);
          break;
        case NtMdt.Frame.FrameType.CURVES:
          this._raw_frameData = this._io.readBytesFull();
          var _io__raw_frameData = new KaitaiStream(this._raw_frameData);
          this.frameData = new FdSpectroscopy(_io__raw_frameData, this, this._root);
          break;
        case NtMdt.Frame.FrameType.SPECTROSCOPY:
          this._raw_frameData = this._io.readBytesFull();
          var _io__raw_frameData = new KaitaiStream(this._raw_frameData);
          this.frameData = new FdSpectroscopy(_io__raw_frameData, this, this._root);
          break;
        case NtMdt.Frame.FrameType.SCANNED:
          this._raw_frameData = this._io.readBytesFull();
          var _io__raw_frameData = new KaitaiStream(this._raw_frameData);
          this.frameData = new FdScanned(_io__raw_frameData, this, this._root);
          break;
        default:
          this.frameData = this._io.readBytesFull();
          break;
        }
      }

      /**
       * h_what
       */

      /**
       * h_am, v6 and older only
       */

      /**
       * 
       */

      return FrameMain;
    })();

    var FdCurvesNew = Frame.FdCurvesNew = (function() {
      function FdCurvesNew(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FdCurvesNew.prototype._read = function() {
        this.blockCount = this._io.readU4le();
        this.blocksHeaders = [];
        for (var i = 0; i < this.blockCount; i++) {
          this.blocksHeaders.push(new BlockDescr(this._io, this, this._root));
        }
        this.blocksNames = [];
        for (var i = 0; i < this.blockCount; i++) {
          this.blocksNames.push(KaitaiStream.bytesToStr(this._io.readBytes(this.blocksHeaders[i].nameLen), "UTF-8"));
        }
        this.blocksData = [];
        for (var i = 0; i < this.blockCount; i++) {
          this.blocksData.push(this._io.readBytes(this.blocksHeaders[i].len));
        }
      }

      var BlockDescr = FdCurvesNew.BlockDescr = (function() {
        function BlockDescr(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        BlockDescr.prototype._read = function() {
          this.nameLen = this._io.readU4le();
          this.len = this._io.readU4le();
        }

        return BlockDescr;
      })();

      return FdCurvesNew;
    })();

    var FdMetaData = Frame.FdMetaData = (function() {
      function FdMetaData(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FdMetaData.prototype._read = function() {
        this.headSize = this._io.readU4le();
        this.totLen = this._io.readU4le();
        this.guids = [];
        for (var i = 0; i < 2; i++) {
          this.guids.push(new Uuid(this._io, this, this._root));
        }
        this.frameStatus = this._io.readBytes(4);
        this.nameSize = this._io.readU4le();
        this.commSize = this._io.readU4le();
        this.viewInfoSize = this._io.readU4le();
        this.specSize = this._io.readU4le();
        this.sourceInfoSize = this._io.readU4le();
        this.varSize = this._io.readU4le();
        this.dataOffset = this._io.readU4le();
        this.dataSize = this._io.readU4le();
        this.title = KaitaiStream.bytesToStr(this._io.readBytes(this.nameSize), "UTF-8");
        this.xml = KaitaiStream.bytesToStr(this._io.readBytes(this.commSize), "UTF-8");
        this.structLen = this._io.readU4le();
        this.arraySize = this._io.readU8le();
        this.cellSize = this._io.readU4le();
        this.nDimensions = this._io.readU4le();
        this.nMesurands = this._io.readU4le();
        this.dimensions = [];
        for (var i = 0; i < this.nDimensions; i++) {
          this.dimensions.push(new Calibration(this._io, this, this._root));
        }
        this.mesurands = [];
        for (var i = 0; i < this.nMesurands; i++) {
          this.mesurands.push(new Calibration(this._io, this, this._root));
        }
      }

      var Image = FdMetaData.Image = (function() {
        function Image(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Image.prototype._read = function() {
          this.image = [];
          var i = 0;
          while (!this._io.isEof()) {
            this.image.push(new Vec(this._io, this, this._root));
            i++;
          }
        }

        var Vec = Image.Vec = (function() {
          function Vec(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          Vec.prototype._read = function() {
            this.items = [];
            for (var i = 0; i < this._parent._parent.nMesurands; i++) {
              switch (this._parent._parent.mesurands[i].dataType) {
              case NtMdt.DataType.UINT64:
                this.items.push(this._io.readU8le());
                break;
              case NtMdt.DataType.UINT8:
                this.items.push(this._io.readU1());
                break;
              case NtMdt.DataType.FLOAT32:
                this.items.push(this._io.readF4le());
                break;
              case NtMdt.DataType.INT8:
                this.items.push(this._io.readS1());
                break;
              case NtMdt.DataType.UINT16:
                this.items.push(this._io.readU2le());
                break;
              case NtMdt.DataType.INT64:
                this.items.push(this._io.readS8le());
                break;
              case NtMdt.DataType.UINT32:
                this.items.push(this._io.readU4le());
                break;
              case NtMdt.DataType.FLOAT64:
                this.items.push(this._io.readF8le());
                break;
              case NtMdt.DataType.INT16:
                this.items.push(this._io.readS2le());
                break;
              case NtMdt.DataType.INT32:
                this.items.push(this._io.readS4le());
                break;
              }
            }
          }

          return Vec;
        })();

        return Image;
      })();

      var Calibration = FdMetaData.Calibration = (function() {
        function Calibration(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Calibration.prototype._read = function() {
          this.lenTot = this._io.readU4le();
          this.lenStruct = this._io.readU4le();
          this.lenName = this._io.readU4le();
          this.lenComment = this._io.readU4le();
          this.lenUnit = this._io.readU4le();
          this.siUnit = this._io.readU8le();
          this.accuracy = this._io.readF8le();
          this.functionIdAndDimensions = this._io.readU8le();
          this.bias = this._io.readF8le();
          this.scale = this._io.readF8le();
          this.minIndex = this._io.readU8le();
          this.maxIndex = this._io.readU8le();
          this.dataType = this._io.readS4le();
          this.lenAuthor = this._io.readU4le();
          this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.lenName), "utf-8");
          this.comment = KaitaiStream.bytesToStr(this._io.readBytes(this.lenComment), "utf-8");
          this.unit = KaitaiStream.bytesToStr(this._io.readBytes(this.lenUnit), "utf-8");
          this.author = KaitaiStream.bytesToStr(this._io.readBytes(this.lenAuthor), "utf-8");
        }
        Object.defineProperty(Calibration.prototype, 'count', {
          get: function() {
            if (this._m_count !== undefined)
              return this._m_count;
            this._m_count = ((this.maxIndex - this.minIndex) + 1);
            return this._m_count;
          }
        });

        return Calibration;
      })();
      Object.defineProperty(FdMetaData.prototype, 'image', {
        get: function() {
          if (this._m_image !== undefined)
            return this._m_image;
          var _pos = this._io.pos;
          this._io.seek(this.dataOffset);
          this._raw__m_image = this._io.readBytes(this.dataSize);
          var _io__raw__m_image = new KaitaiStream(this._raw__m_image);
          this._m_image = new Image(_io__raw__m_image, this, this._root);
          this._io.seek(_pos);
          return this._m_image;
        }
      });

      return FdMetaData;
    })();

    var FdSpectroscopy = Frame.FdSpectroscopy = (function() {
      function FdSpectroscopy(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FdSpectroscopy.prototype._read = function() {
        this._raw_vars = this._io.readBytes(this._parent.varSize);
        var _io__raw_vars = new KaitaiStream(this._raw_vars);
        this.vars = new Vars(_io__raw_vars, this, this._root);
        this.fmMode = this._io.readU2le();
        this.fmXres = this._io.readU2le();
        this.fmYres = this._io.readU2le();
        this.dots = new Dots(this._io, this, this._root);
        this.data = [];
        for (var i = 0; i < (this.fmXres * this.fmYres); i++) {
          this.data.push(this._io.readS2le());
        }
        this.title = new Title(this._io, this, this._root);
        this.xml = new Xml(this._io, this, this._root);
      }

      var Vars = FdSpectroscopy.Vars = (function() {
        function Vars(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Vars.prototype._read = function() {
          this.xScale = new AxisScale(this._io, this, this._root);
          this.yScale = new AxisScale(this._io, this, this._root);
          this.zScale = new AxisScale(this._io, this, this._root);
          this.spMode = this._io.readU2le();
          this.spFilter = this._io.readU2le();
          this.uBegin = this._io.readF4le();
          this.uEnd = this._io.readF4le();
          this.zUp = this._io.readS2le();
          this.zDown = this._io.readS2le();
          this.spAveraging = this._io.readU2le();
          this.spRepeat = this._io.readU1();
          this.spBack = this._io.readU1();
          this.sp4nx = this._io.readS2le();
          this.spOsc = this._io.readU1();
          this.spN4 = this._io.readU1();
          this.sp4x0 = this._io.readF4le();
          this.sp4xr = this._io.readF4le();
          this.sp4u = this._io.readS2le();
          this.sp4i = this._io.readS2le();
          this.spNx = this._io.readS2le();
        }

        return Vars;
      })();

      return FdSpectroscopy;
    })();

    var DateTime = Frame.DateTime = (function() {
      function DateTime(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      DateTime.prototype._read = function() {
        this.date = new Date(this._io, this, this._root);
        this.time = new Time(this._io, this, this._root);
      }

      var Date = DateTime.Date = (function() {
        function Date(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Date.prototype._read = function() {
          this.year = this._io.readU2le();
          this.month = this._io.readU2le();
          this.day = this._io.readU2le();
        }

        /**
         * h_yea
         */

        /**
         * h_mon
         */

        /**
         * h_day
         */

        return Date;
      })();

      var Time = DateTime.Time = (function() {
        function Time(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Time.prototype._read = function() {
          this.hour = this._io.readU2le();
          this.min = this._io.readU2le();
          this.sec = this._io.readU2le();
        }

        /**
         * h_h
         */

        /**
         * h_m
         */

        /**
         * h_s
         */

        return Time;
      })();

      return DateTime;
    })();

    var AxisScale = Frame.AxisScale = (function() {
      function AxisScale(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      AxisScale.prototype._read = function() {
        this.offset = this._io.readF4le();
        this.step = this._io.readF4le();
        this.unit = this._io.readS2le();
      }

      /**
       * x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
       */

      /**
       * x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
       *   g_warning("x_scale.step == 0, changing to 1");
       *   x_scale->step = 1.0;
       * }
       */

      /**
       * U
       */

      return AxisScale;
    })();

    var FdScanned = Frame.FdScanned = (function() {
      FdScanned.Mode = Object.freeze({
        STM: 0,
        AFM: 1,
        UNKNOWN2: 2,
        UNKNOWN3: 3,
        UNKNOWN4: 4,

        0: "STM",
        1: "AFM",
        2: "UNKNOWN2",
        3: "UNKNOWN3",
        4: "UNKNOWN4",
      });

      FdScanned.InputSignal = Object.freeze({
        EXTENSION_SLOT: 0,
        BIAS_V: 1,
        GROUND: 2,

        0: "EXTENSION_SLOT",
        1: "BIAS_V",
        2: "GROUND",
      });

      FdScanned.LiftMode = Object.freeze({
        STEP: 0,
        FINE: 1,
        SLOPE: 2,

        0: "STEP",
        1: "FINE",
        2: "SLOPE",
      });

      function FdScanned(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FdScanned.prototype._read = function() {
        this._raw_vars = this._io.readBytes(this._parent.varSize);
        var _io__raw_vars = new KaitaiStream(this._raw_vars);
        this.vars = new Vars(_io__raw_vars, this, this._root);
        if (false) {
          this.origFormat = this._io.readU4le();
        }
        if (false) {
          this.tune = this._io.readU4le();
        }
        if (false) {
          this.feedbackGain = this._io.readF8le();
        }
        if (false) {
          this.dacScale = this._io.readS4le();
        }
        if (false) {
          this.overscan = this._io.readS4le();
        }
        this.fmMode = this._io.readU2le();
        this.fmXres = this._io.readU2le();
        this.fmYres = this._io.readU2le();
        this.dots = new Dots(this._io, this, this._root);
        this.image = [];
        for (var i = 0; i < (this.fmXres * this.fmYres); i++) {
          this.image.push(this._io.readS2le());
        }
        this.title = new Title(this._io, this, this._root);
        this.xml = new Xml(this._io, this, this._root);
      }

      var Vars = FdScanned.Vars = (function() {
        function Vars(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Vars.prototype._read = function() {
          this.xScale = new AxisScale(this._io, this, this._root);
          this.yScale = new AxisScale(this._io, this, this._root);
          this.zScale = new AxisScale(this._io, this, this._root);
          this.channelIndex = this._io.readU1();
          this.mode = this._io.readU1();
          this.xres = this._io.readU2le();
          this.yres = this._io.readU2le();
          this.ndacq = this._io.readU2le();
          this.stepLength = this._io.readF4le();
          this.adt = this._io.readU2le();
          this.adcGainAmpLog10 = this._io.readU1();
          this.adcIndex = this._io.readU1();
          this.inputSignalOrVersion = this._io.readU1();
          this.substrPlaneOrderOrPassNum = this._io.readU1();
          this.scanDir = new ScanDir(this._io, this, this._root);
          this.powerOf2 = this._io.readU1();
          this.velocity = this._io.readF4le();
          this.setpoint = this._io.readF4le();
          this.biasVoltage = this._io.readF4le();
          this.draw = this._io.readU1();
          this.reserved = this._io.readU1();
          this.xoff = this._io.readS4le();
          this.yoff = this._io.readS4le();
          this.nlCorr = this._io.readU1();
        }

        /**
         * s_mode
         */

        /**
         * s_dev
         */

        /**
         * s_nx
         */

        /**
         * s_ny
         */

        /**
         * Step (DAC)
         */

        /**
         * s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
         */

        /**
         * s_adt
         */

        /**
         * s_adc_a
         */

        /**
         * ADC index
         */

        /**
         * MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
         */

        /**
         * s_spl or z_03
         */

        /**
         * s_xy TODO: interpretation
         */

        /**
         * s_2n (bool)
         */

        /**
         * s_vel (Angstrom/second)
         */

        /**
         * s_i0
         */

        /**
         * s_ut
         */

        /**
         * s_draw (bool)
         */

        /**
         * s_x00 (in DAC quants)
         */

        /**
         * s_y00 (in DAC quants)
         */

        /**
         * s_cor (bool)
         */

        return Vars;
      })();

      var Dot = FdScanned.Dot = (function() {
        function Dot(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Dot.prototype._read = function() {
          this.x = this._io.readS2le();
          this.y = this._io.readS2le();
        }

        return Dot;
      })();

      var ScanDir = FdScanned.ScanDir = (function() {
        function ScanDir(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        ScanDir.prototype._read = function() {
          this.unkn = this._io.readBitsIntBe(4);
          this.doublePass = this._io.readBitsIntBe(1) != 0;
          this.bottom = this._io.readBitsIntBe(1) != 0;
          this.left = this._io.readBitsIntBe(1) != 0;
          this.horizontal = this._io.readBitsIntBe(1) != 0;
        }

        /**
         * Bottom - 1 Top - 0
         */

        /**
         * Left - 1 Right - 0
         */

        /**
         * Horizontal - 1 Vertical - 0
         */

        return ScanDir;
      })();

      /**
       * s_oem
       */

      /**
       * z_tune
       */

      /**
       * s_fbg
       */

      /**
       * s_s
       */

      /**
       * s_xov (in %)
       */

      /**
       * m_mode
       */

      /**
       * m_nx
       */

      /**
       * m_ny
       */

      return FdScanned;
    })();

    /**
     * h_sz
     */

    return Frame;
  })();

  var Version = NtMdt.Version = (function() {
    function Version(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Version.prototype._read = function() {
      this.minor = this._io.readU1();
      this.major = this._io.readU1();
    }

    return Version;
  })();

  var Xml = NtMdt.Xml = (function() {
    function Xml(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Xml.prototype._read = function() {
      this.xmlLen = this._io.readU4le();
      this.xml = KaitaiStream.bytesToStr(this._io.readBytes(this.xmlLen), "UTF-16LE");
    }

    return Xml;
  })();

  var Title = NtMdt.Title = (function() {
    function Title(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Title.prototype._read = function() {
      this.titleLen = this._io.readU4le();
      this.title = KaitaiStream.bytesToStr(this._io.readBytes(this.titleLen), "cp1251");
    }

    return Title;
  })();

  /**
   * File size (w/o header)
   */

  /**
   * documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
   */

  return NtMdt;
})();
return NtMdt;
}));
