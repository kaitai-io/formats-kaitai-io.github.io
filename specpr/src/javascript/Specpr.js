// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Specpr records are fixed format, 1536 bytes/record. Record number
 * counting starts at 0. Binary data are in IEEE format real numbers
 * and non-byte swapped integers (compatiible with all Sun
 * Microsystems, and Hewlett Packard workstations (Intel and some DEC
 * machines are byte swapped relative to Suns and HPs). Each record may
 * contain different information according to the following scheme.
 * 
 * You can get some library of spectra from
 * ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
 */

var Specpr = (function() {
  Specpr.RecordType = Object.freeze({
    DATA_INITIAL: 0,
    TEXT_INITIAL: 1,
    DATA_CONTINUATION: 2,
    TEXT_CONTINUATION: 3,

    0: "DATA_INITIAL",
    1: "TEXT_INITIAL",
    2: "DATA_CONTINUATION",
    3: "TEXT_CONTINUATION",
  });

  function Specpr(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Specpr.prototype._read = function() {
    this.records = [];
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
    }
  }

  var DataInitial = Specpr.DataInitial = (function() {
    function DataInitial(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataInitial.prototype._read = function() {
      this.ids = new Identifiers(this._io, this, this._root);
      this.iscta = new CoarseTimestamp(this._io, this, this._root);
      this.isctb = new CoarseTimestamp(this._io, this, this._root);
      this.jdatea = this._io.readS4be();
      this.jdateb = this._io.readS4be();
      this.istb = new CoarseTimestamp(this._io, this, this._root);
      this.isra = this._io.readS4be();
      this.isdec = this._io.readS4be();
      this.itchan = this._io.readS4be();
      this.irmas = this._io.readS4be();
      this.revs = this._io.readS4be();
      this.iband = new Array(2);
      for (var i = 0; i < 2; i++) {
        this.iband[i] = this._io.readS4be();
      }
      this.irwav = this._io.readS4be();
      this.irespt = this._io.readS4be();
      this.irecno = this._io.readS4be();
      this.itpntr = this._io.readS4be();
      this.ihist = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(60), 32), "ascii");
      this.mhist = new Array(4);
      for (var i = 0; i < 4; i++) {
        this.mhist[i] = KaitaiStream.bytesToStr(this._io.readBytes(74), "ascii");
      }
      this.nruns = this._io.readS4be();
      this.siangl = new IllumAngle(this._io, this, this._root);
      this.seangl = new IllumAngle(this._io, this, this._root);
      this.sphase = this._io.readS4be();
      this.iwtrns = this._io.readS4be();
      this.itimch = this._io.readS4be();
      this.xnrm = this._io.readF4be();
      this.scatim = this._io.readF4be();
      this.timint = this._io.readF4be();
      this.tempd = this._io.readF4be();
      this.data = new Array(256);
      for (var i = 0; i < 256; i++) {
        this.data[i] = this._io.readF4be();
      }
    }

    /**
     * The phase angle between iangl and eangl in seconds
     */
    Object.defineProperty(DataInitial.prototype, 'phaseAngleArcsec', {
      get: function() {
        if (this._m_phaseAngleArcsec !== undefined)
          return this._m_phaseAngleArcsec;
        this._m_phaseAngleArcsec = (this.sphase / 1500);
        return this._m_phaseAngleArcsec;
      }
    });

    /**
     * Civil or Universal time when data was last processed
     */

    /**
     * Civil or Universal time at the start of the spectral run
     */

    /**
     * Date when data was last processed. Stored as integer*4 Julian Day number *10
     */

    /**
     * Date when the spectral run began. Stored as integer*4 Julian Day number *10
     */

    /**
     * Siderial time when the spectral run started. See flag #05.
     */

    /**
     * Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
     */

    /**
     * Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
     */

    /**
     * Total number of channels in the spectrum (integer*4 value from 1 to 4852)
     */

    /**
     * The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
     */

    /**
     * The number of independent spectral scans which were added to make the spectrum (integer*4 number).
     */

    /**
     * The channel numbers which define the band normalization (scaling to unity). (integers*4).
     */

    /**
     * The record number within the file where the wavelengths are found (integer*4).
     */

    /**
     * The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
     */

    /**
     * The record number within the file where the data is located (integer*4 number).
     */

    /**
     * Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
     */

    /**
     * The program automatic 60 character history.
     */

    /**
     * Manual history. Program automatic for large history requirements.
     */

    /**
     * The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
     */

    /**
     * The angle of incidence of illuminating radiation
     *       integrating sphere = 2000000000
     *       Geometric albedo   = 2000000001
     */

    /**
     * The angle of emission of illuminating radiation
     *       integrating sphere = 2000000000
     *       Geometric albedo   = 2000000001
     */

    /**
     * The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
     *       integrating sphere = 2000000000
     */

    /**
     * Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
     */

    /**
     * The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
     */

    /**
     * The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
     */

    /**
     * The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
     */

    /**
     * Total integration time (usually=scatime * nruns) (32 bit real number).
     */

    /**
     * Temperature in degrees Kelvin (32 bit real number).
     */

    /**
     * The spectral data (256 channels of 32 bit real data numbers).
     */

    return DataInitial;
  })();

  var CoarseTimestamp = Specpr.CoarseTimestamp = (function() {
    function CoarseTimestamp(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CoarseTimestamp.prototype._read = function() {
      this.scaledSeconds = this._io.readS4be();
    }
    Object.defineProperty(CoarseTimestamp.prototype, 'seconds', {
      get: function() {
        if (this._m_seconds !== undefined)
          return this._m_seconds;
        this._m_seconds = (this.scaledSeconds * 24000);
        return this._m_seconds;
      }
    });

    return CoarseTimestamp;
  })();

  /**
   * it is big endian
   */

  var Icflag = Specpr.Icflag = (function() {
    function Icflag(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Icflag.prototype._read = function() {
      this.reserved = this._io.readBitsInt(26);
      this.isctbType = this._io.readBitsInt(1) != 0;
      this.isctaType = this._io.readBitsInt(1) != 0;
      this.coordinateMode = this._io.readBitsInt(1) != 0;
      this.errors = this._io.readBitsInt(1) != 0;
      this.text = this._io.readBitsInt(1) != 0;
      this.continuation = this._io.readBitsInt(1) != 0;
    }
    Object.defineProperty(Icflag.prototype, 'type', {
      get: function() {
        if (this._m_type !== undefined)
          return this._m_type;
        this._m_type = (((this.text | 0) * 1) + ((this.continuation | 0) * 2));
        return this._m_type;
      }
    });

    /**
     * =0 ctb is civil time
     * =1 ctb is universal time
     */

    /**
     * =0 cta is civil time
     * =1 cta is universal time
     */

    /**
     * RA, Dec / Long., Lat flag
     * =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
     * =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
     */

    /**
     * flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
     */

    /**
     * =0 the data in the array "data" is data
     * =1 the data in the array "data" is ascii text as is most of the header info.
     */

    /**
     * =0 first record of a spectrum consists of: header then 256 data channels
     * =1 continuation data record consisting of:
     *   # bit flags followed by 1532 bytes of
     *   # real data (bit 1=0) (383 channels)
     *   # or 1532 bytes of text (bit 1=1).
     *   # A maximum of 12 continuation records
     *   # are allowed for a total of 4852
     *   # channels (limited by arrays of 4864)
     *   # or 19860 characters of text (bit 1=1).
     */

    return Icflag;
  })();

  var DataContinuation = Specpr.DataContinuation = (function() {
    function DataContinuation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataContinuation.prototype._read = function() {
      this.cdata = new Array(383);
      for (var i = 0; i < 383; i++) {
        this.cdata[i] = this._io.readF4be();
      }
    }

    /**
     * The continuation of the data values (383 channels of 32 bit real numbers).
     */

    return DataContinuation;
  })();

  var Identifiers = Specpr.Identifiers = (function() {
    function Identifiers(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Identifiers.prototype._read = function() {
      this.ititle = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(40), 32), "ascii");
      this.usernm = KaitaiStream.bytesToStr(this._io.readBytes(8), "ascii");
    }

    /**
     * Title which describes the data
     */

    /**
     * The name of the user who created the data record
     */

    return Identifiers;
  })();

  var IllumAngle = Specpr.IllumAngle = (function() {
    function IllumAngle(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IllumAngle.prototype._read = function() {
      this.angl = this._io.readS4be();
    }
    Object.defineProperty(IllumAngle.prototype, 'secondsTotal', {
      get: function() {
        if (this._m_secondsTotal !== undefined)
          return this._m_secondsTotal;
        this._m_secondsTotal = Math.floor(this.angl / 6000);
        return this._m_secondsTotal;
      }
    });
    Object.defineProperty(IllumAngle.prototype, 'minutesTotal', {
      get: function() {
        if (this._m_minutesTotal !== undefined)
          return this._m_minutesTotal;
        this._m_minutesTotal = Math.floor(this.secondsTotal / 60);
        return this._m_minutesTotal;
      }
    });
    Object.defineProperty(IllumAngle.prototype, 'degreesTotal', {
      get: function() {
        if (this._m_degreesTotal !== undefined)
          return this._m_degreesTotal;
        this._m_degreesTotal = Math.floor(this.minutesTotal / 60);
        return this._m_degreesTotal;
      }
    });

    /**
     * (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
     */

    return IllumAngle;
  })();

  var TextInitial = Specpr.TextInitial = (function() {
    function TextInitial(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TextInitial.prototype._read = function() {
      this.ids = new Identifiers(this._io, this, this._root);
      this.itxtpt = this._io.readU4be();
      this.itxtch = this._io.readS4be();
      this.itext = KaitaiStream.bytesToStr(this._io.readBytes(1476), "ascii");
    }

    /**
     * Text data record pointer. This pointer points  to a data record where additional text may be may be found.
     */

    /**
     * The number of text characters (maximum= 19860).
     */

    /**
     * 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
     */

    return TextInitial;
  })();

  var Record = Specpr.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.icflag = new Icflag(this._io, this, this._root);
      switch (this.icflag.type) {
      case Specpr.RecordType.DATA_INITIAL:
        this._raw_content = this._io.readBytes((1536 - 4));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new DataInitial(_io__raw_content, this, this._root);
        break;
      case Specpr.RecordType.DATA_CONTINUATION:
        this._raw_content = this._io.readBytes((1536 - 4));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new DataContinuation(_io__raw_content, this, this._root);
        break;
      case Specpr.RecordType.TEXT_CONTINUATION:
        this._raw_content = this._io.readBytes((1536 - 4));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new TextContinuation(_io__raw_content, this, this._root);
        break;
      case Specpr.RecordType.TEXT_INITIAL:
        this._raw_content = this._io.readBytes((1536 - 4));
        var _io__raw_content = new KaitaiStream(this._raw_content);
        this.content = new TextInitial(_io__raw_content, this, this._root);
        break;
      default:
        this.content = this._io.readBytes((1536 - 4));
        break;
      }
    }

    /**
     * Total number of bytes comprising the document.
     */

    return Record;
  })();

  var TextContinuation = Specpr.TextContinuation = (function() {
    function TextContinuation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TextContinuation.prototype._read = function() {
      this.tdata = KaitaiStream.bytesToStr(this._io.readBytes(1532), "ascii");
    }

    /**
     * 1532 characters of text.
     */

    return TextContinuation;
  })();

  return Specpr;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Specpr', [], function() {
    return Specpr;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Specpr;
}
