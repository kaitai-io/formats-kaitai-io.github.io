// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.FasttrackerXmModule = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * XM (standing for eXtended Module) is a popular module music file
 * format, that was introduced in 1994 in FastTracker2 by Triton demo
 * group. Akin to MOD files, it bundles both digital samples
 * (instruments) and instructions on which note to play at what time
 * (patterns), which provides good audio quality with relatively small
 * file size. Audio is reproducible without relying on the sound of
 * particular hardware samplers or synths.
 * @see {@link http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
 * ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
 * |Source}
 */

var FasttrackerXmModule = (function() {
  function FasttrackerXmModule(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  FasttrackerXmModule.prototype._read = function() {
    this.preheader = new Preheader(this._io, this, this._root);
    this._raw_header = this._io.readBytes((this.preheader.headerSize - 4));
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new Header(_io__raw_header, this, this._root);
    this.patterns = [];
    for (var i = 0; i < this.header.numPatterns; i++) {
      this.patterns.push(new Pattern(this._io, this, this._root));
    }
    this.instruments = [];
    for (var i = 0; i < this.header.numInstruments; i++) {
      this.instruments.push(new Instrument(this._io, this, this._root));
    }
  }

  var Preheader = FasttrackerXmModule.Preheader = (function() {
    function Preheader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Preheader.prototype._read = function() {
      this.signature0 = this._io.readBytes(17);
      if (!((KaitaiStream.byteArrayCompare(this.signature0, [69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32], this.signature0, this._io, "/types/preheader/seq/0");
      }
      this.moduleName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(20), 0, false), "utf-8");
      this.signature1 = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.signature1, [26]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([26], this.signature1, this._io, "/types/preheader/seq/2");
      }
      this.trackerName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(20), 0, false), "utf-8");
      this.versionNumber = new Version(this._io, this, this._root);
      this.headerSize = this._io.readU4le();
    }

    var Version = Preheader.Version = (function() {
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
      Object.defineProperty(Version.prototype, 'value', {
        get: function() {
          if (this._m_value !== undefined)
            return this._m_value;
          this._m_value = ((this.major << 8) | this.minor);
          return this._m_value;
        }
      });

      /**
       * currently 0x04
       */

      /**
       * currently 0x01
       */

      return Version;
    })();

    /**
     * Module name, padded with zeroes
     */

    /**
     * Tracker name
     */

    /**
     * Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
     */

    /**
     * Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
     */

    return Preheader;
  })();

  var Pattern = FasttrackerXmModule.Pattern = (function() {
    function Pattern(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Pattern.prototype._read = function() {
      this.header = new Header(this._io, this, this._root);
      this.packedData = this._io.readBytes(this.header.main.lenPackedPattern);
    }

    var Header = Pattern.Header = (function() {
      function Header(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Header.prototype._read = function() {
        this.headerLength = this._io.readU4le();
        this._raw_main = this._io.readBytes((this.headerLength - 4));
        var _io__raw_main = new KaitaiStream(this._raw_main);
        this.main = new HeaderMain(_io__raw_main, this, this._root);
      }

      var HeaderMain = Header.HeaderMain = (function() {
        function HeaderMain(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        HeaderMain.prototype._read = function() {
          this.packingType = this._io.readU1();
          switch (this._root.preheader.versionNumber.value) {
          case 258:
            this.numRowsRaw = this._io.readU1();
            break;
          default:
            this.numRowsRaw = this._io.readU2le();
            break;
          }
          this.lenPackedPattern = this._io.readU2le();
        }
        Object.defineProperty(HeaderMain.prototype, 'numRows', {
          get: function() {
            if (this._m_numRows !== undefined)
              return this._m_numRows;
            this._m_numRows = (this.numRowsRaw + (this._root.preheader.versionNumber.value == 258 ? 1 : 0));
            return this._m_numRows;
          }
        });

        /**
         * Packing type (always 0)
         */

        /**
         * Number of rows in pattern (1..256)
         */

        /**
         * Packed pattern data size
         */

        return HeaderMain;
      })();

      /**
       * Pattern header length
       */

      return Header;
    })();

    return Pattern;
  })();

  var Flags = FasttrackerXmModule.Flags = (function() {
    function Flags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Flags.prototype._read = function() {
      this.reserved = this._io.readBitsIntBe(15);
      this.freqTableType = this._io.readBitsIntBe(1) != 0;
    }

    /**
     * 0 = Amiga frequency table (see below); 1 = Linear frequency table
     */

    return Flags;
  })();

  var Header = FasttrackerXmModule.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.songLength = this._io.readU2le();
      this.restartPosition = this._io.readU2le();
      this.numChannels = this._io.readU2le();
      this.numPatterns = this._io.readU2le();
      this.numInstruments = this._io.readU2le();
      this.flags = new Flags(this._io, this, this._root);
      this.defaultTempo = this._io.readU2le();
      this.defaultBpm = this._io.readU2le();
      this.patternOrderTable = [];
      for (var i = 0; i < 256; i++) {
        this.patternOrderTable.push(this._io.readU1());
      }
    }

    /**
     * Song length (in pattern order table)
     */

    /**
     * (2,4,6,8,10,...,32)
     */

    /**
     * (max 256)
     */

    /**
     * (max 128)
     */

    /**
     * max 256
     */

    return Header;
  })();

  /**
   * XM's notion of "instrument" typically constitutes of a
   * instrument metadata and one or several samples. Metadata
   * includes:
   * 
   * * instrument's name
   * * instruction of which sample to use for which note
   * * volume and panning envelopes and looping instructions
   * * vibrato settings
   */

  var Instrument = FasttrackerXmModule.Instrument = (function() {
    function Instrument(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Instrument.prototype._read = function() {
      this.headerSize = this._io.readU4le();
      this._raw_header = this._io.readBytes((this.headerSize - 4));
      var _io__raw_header = new KaitaiStream(this._raw_header);
      this.header = new Header(_io__raw_header, this, this._root);
      this.samplesHeaders = [];
      for (var i = 0; i < this.header.numSamples; i++) {
        this.samplesHeaders.push(new SampleHeader(this._io, this, this._root));
      }
      this.samples = [];
      for (var i = 0; i < this.header.numSamples; i++) {
        this.samples.push(new SamplesData(this._io, this, this._root, this.samplesHeaders[i]));
      }
    }

    var Header = Instrument.Header = (function() {
      function Header(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Header.prototype._read = function() {
        this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(22), 0, false), "utf-8");
        this.type = this._io.readU1();
        this.numSamples = this._io.readU2le();
        if (this.numSamples > 0) {
          this.extraHeader = new ExtraHeader(this._io, this, this._root);
        }
      }

      /**
       * Usually zero, but this seems pretty random, don't assume it's zero
       */

      return Header;
    })();

    var ExtraHeader = Instrument.ExtraHeader = (function() {
      ExtraHeader.Type = Object.freeze({
        TRUE: 0,
        SUSTAIN: 1,
        LOOP: 2,

        0: "TRUE",
        1: "SUSTAIN",
        2: "LOOP",
      });

      function ExtraHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      ExtraHeader.prototype._read = function() {
        this.lenSampleHeader = this._io.readU4le();
        this.idxSamplePerNote = [];
        for (var i = 0; i < 96; i++) {
          this.idxSamplePerNote.push(this._io.readU1());
        }
        this.volumePoints = [];
        for (var i = 0; i < 12; i++) {
          this.volumePoints.push(new EnvelopePoint(this._io, this, this._root));
        }
        this.panningPoints = [];
        for (var i = 0; i < 12; i++) {
          this.panningPoints.push(new EnvelopePoint(this._io, this, this._root));
        }
        this.numVolumePoints = this._io.readU1();
        this.numPanningPoints = this._io.readU1();
        this.volumeSustainPoint = this._io.readU1();
        this.volumeLoopStartPoint = this._io.readU1();
        this.volumeLoopEndPoint = this._io.readU1();
        this.panningSustainPoint = this._io.readU1();
        this.panningLoopStartPoint = this._io.readU1();
        this.panningLoopEndPoint = this._io.readU1();
        this.volumeType = this._io.readU1();
        this.panningType = this._io.readU1();
        this.vibratoType = this._io.readU1();
        this.vibratoSweep = this._io.readU1();
        this.vibratoDepth = this._io.readU1();
        this.vibratoRate = this._io.readU1();
        this.volumeFadeout = this._io.readU2le();
        this.reserved = this._io.readU2le();
      }

      /**
       * Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
       * BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
       * Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
       * !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
       * Of course it does not help if all instruments have the values inside FT2 supported range.
       * The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
       */

      var EnvelopePoint = ExtraHeader.EnvelopePoint = (function() {
        function EnvelopePoint(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        EnvelopePoint.prototype._read = function() {
          this.x = this._io.readU2le();
          this.y = this._io.readU2le();
        }

        /**
         * Frame number of the point
         */

        /**
         * Value of the point
         */

        return EnvelopePoint;
      })();

      /**
       * Index of sample that should be used for any particular
       * note. In the simplest case, where it's only one sample
       * is available, it's an array of full of zeroes.
       */

      /**
       * Points for volume envelope. Only `num_volume_points` will be actually used.
       */

      /**
       * Points for panning envelope. Only `num_panning_points` will be actually used.
       */

      return ExtraHeader;
    })();

    /**
     * The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
     * Pseudocode for converting the delta-coded data to normal data,
     * old = 0;
     * for i in range(data_len):
     *   new = sample[i] + old;
     *   sample[i] = new;
     *   old = new;
     */

    var SamplesData = Instrument.SamplesData = (function() {
      function SamplesData(_io, _parent, _root, header) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.header = header;

        this._read();
      }
      SamplesData.prototype._read = function() {
        this.data = this._io.readBytes((this.header.sampleLength * (this.header.type.isSampleData16Bit ? 2 : 1)));
      }

      return SamplesData;
    })();

    var SampleHeader = Instrument.SampleHeader = (function() {
      function SampleHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      SampleHeader.prototype._read = function() {
        this.sampleLength = this._io.readU4le();
        this.sampleLoopStart = this._io.readU4le();
        this.sampleLoopLength = this._io.readU4le();
        this.volume = this._io.readU1();
        this.fineTune = this._io.readS1();
        this.type = new LoopType(this._io, this, this._root);
        this.panning = this._io.readU1();
        this.relativeNoteNumber = this._io.readS1();
        this.reserved = this._io.readU1();
        this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(22), 0, false), "utf-8");
      }

      var LoopType = SampleHeader.LoopType = (function() {
        LoopType.LoopType = Object.freeze({
          NONE: 0,
          FORWARD: 1,
          PING_PONG: 2,

          0: "NONE",
          1: "FORWARD",
          2: "PING_PONG",
        });

        function LoopType(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        LoopType.prototype._read = function() {
          this.reserved0 = this._io.readBitsIntBe(3);
          this.isSampleData16Bit = this._io.readBitsIntBe(1) != 0;
          this.reserved1 = this._io.readBitsIntBe(2);
          this.loopType = this._io.readBitsIntBe(2);
        }

        return LoopType;
      })();

      /**
       * -16..+15
       */

      /**
       * (0-255)
       */

      return SampleHeader;
    })();

    /**
     * Instrument size << header that is >>
     * << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
     */

    return Instrument;
  })();

  return FasttrackerXmModule;
})();
return FasttrackerXmModule;
}));
