// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The WAVE file format is a subset of Microsoft's RIFF specification for the
 * storage of multimedia files. A RIFF file starts out with a file header
 * followed by a sequence of data chunks. A WAVE file is often just a RIFF
 * file with a single "WAVE" chunk which consists of two sub-chunks --
 * a "fmt " chunk specifying the data format and a "data" chunk containing
 * the actual sample data.
 * 
 * This Kaitai implementation was written by John Byrd of Gigantic Software
 * (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
 * @see {@link https://www.loc.gov/preservation/digital/formats/fdd/fdd000001.shtml|Source}
 */

var Wav = (function() {
  Wav.WFormatTagType = Object.freeze({
    UNKNOWN: 0,
    PCM: 1,
    ADPCM: 2,
    IEEE_FLOAT: 3,
    ALAW: 6,
    MULAW: 7,
    DVI_ADPCM: 17,
    DOLBY_AC3_SPDIF: 146,
    EXTENSIBLE: 65534,
    DEVELOPMENT: 65535,

    0: "UNKNOWN",
    1: "PCM",
    2: "ADPCM",
    3: "IEEE_FLOAT",
    6: "ALAW",
    7: "MULAW",
    17: "DVI_ADPCM",
    146: "DOLBY_AC3_SPDIF",
    65534: "EXTENSIBLE",
    65535: "DEVELOPMENT",
  });

  Wav.ChunkType = Object.freeze({
    FMT: 544501094,
    BEXT: 1650817140,
    CUE: 1668637984,
    DATA: 1684108385,
    MINF: 1835626086,
    REGN: 1919248238,
    UMID: 1970104676,

    544501094: "FMT",
    1650817140: "BEXT",
    1668637984: "CUE",
    1684108385: "DATA",
    1835626086: "MINF",
    1919248238: "REGN",
    1970104676: "UMID",
  });

  function Wav(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Wav.prototype._read = function() {
    this.riffId = this._io.ensureFixedContents([82, 73, 70, 70]);
    this.fileSize = this._io.readU4le();
    this.waveId = this._io.ensureFixedContents([87, 65, 86, 69]);
    this._raw_chunks = this._io.readBytes((this.fileSize - 5));
    var _io__raw_chunks = new KaitaiStream(this._raw_chunks);
    this.chunks = new ChunksType(_io__raw_chunks, this, this._root);
  }

  var SampleType = Wav.SampleType = (function() {
    function SampleType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SampleType.prototype._read = function() {
      this.sample = this._io.readU2le();
    }

    return SampleType;
  })();

  var FormatChunkType = Wav.FormatChunkType = (function() {
    function FormatChunkType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FormatChunkType.prototype._read = function() {
      this.wFormatTag = this._io.readU2le();
      this.nChannels = this._io.readU2le();
      this.nSamplesPerSec = this._io.readU4le();
      this.nAvgBytesPerSec = this._io.readU4le();
      this.nBlockAlign = this._io.readU2le();
      this.wBitsPerSample = this._io.readU2le();
      if (!(this.isBasicPcm)) {
        this.cbSize = this._io.readU2le();
      }
      if (this.isCbSizeMeaningful) {
        this.wValidBitsPerSample = this._io.readU2le();
      }
      if (this.isExtensible) {
        this.channelMaskAndSubformat = new ChannelMaskAndSubformatType(this._io, this, this._root);
      }
    }
    Object.defineProperty(FormatChunkType.prototype, 'isExtensible', {
      get: function() {
        if (this._m_isExtensible !== undefined)
          return this._m_isExtensible;
        this._m_isExtensible = this.wFormatTag == Wav.WFormatTagType.EXTENSIBLE;
        return this._m_isExtensible;
      }
    });
    Object.defineProperty(FormatChunkType.prototype, 'isBasicPcm', {
      get: function() {
        if (this._m_isBasicPcm !== undefined)
          return this._m_isBasicPcm;
        this._m_isBasicPcm = this.wFormatTag == Wav.WFormatTagType.PCM;
        return this._m_isBasicPcm;
      }
    });
    Object.defineProperty(FormatChunkType.prototype, 'isBasicFloat', {
      get: function() {
        if (this._m_isBasicFloat !== undefined)
          return this._m_isBasicFloat;
        this._m_isBasicFloat = this.wFormatTag == Wav.WFormatTagType.IEEE_FLOAT;
        return this._m_isBasicFloat;
      }
    });
    Object.defineProperty(FormatChunkType.prototype, 'isCbSizeMeaningful', {
      get: function() {
        if (this._m_isCbSizeMeaningful !== undefined)
          return this._m_isCbSizeMeaningful;
        this._m_isCbSizeMeaningful =  ((!(this.isBasicPcm)) && (this.cbSize != 0)) ;
        return this._m_isCbSizeMeaningful;
      }
    });

    return FormatChunkType;
  })();

  var GuidType = Wav.GuidType = (function() {
    function GuidType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    GuidType.prototype._read = function() {
      this.data1 = this._io.readU4le();
      this.data2 = this._io.readU2le();
      this.data3 = this._io.readU2le();
      this.data4 = this._io.readU4be();
      this.data4a = this._io.readU4be();
    }

    return GuidType;
  })();

  var CuePointType = Wav.CuePointType = (function() {
    function CuePointType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CuePointType.prototype._read = function() {
      this.dwName = this._io.readU4le();
      this.dwPosition = this._io.readU4le();
      this.fccChunk = this._io.readU4le();
      this.dwChunkStart = this._io.readU4le();
      this.dwBlockStart = this._io.readU4le();
      this.dwSampleOffset = this._io.readU4le();
    }

    return CuePointType;
  })();

  var DataChunkType = Wav.DataChunkType = (function() {
    function DataChunkType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataChunkType.prototype._read = function() {
      this.data = this._io.readBytesFull();
    }

    return DataChunkType;
  })();

  var SamplesType = Wav.SamplesType = (function() {
    function SamplesType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SamplesType.prototype._read = function() {
      this.samples = this._io.readU4le();
    }

    return SamplesType;
  })();

  var ChannelMaskAndSubformatType = Wav.ChannelMaskAndSubformatType = (function() {
    function ChannelMaskAndSubformatType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChannelMaskAndSubformatType.prototype._read = function() {
      this.dwChannelMask = new ChannelMaskType(this._io, this, this._root);
      this.subformat = new GuidType(this._io, this, this._root);
    }

    return ChannelMaskAndSubformatType;
  })();

  var ChunksType = Wav.ChunksType = (function() {
    function ChunksType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChunksType.prototype._read = function() {
      this.chunk = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.chunk.push(new ChunkType(this._io, this, this._root));
        i++;
      }
    }

    return ChunksType;
  })();

  var CueChunkType = Wav.CueChunkType = (function() {
    function CueChunkType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CueChunkType.prototype._read = function() {
      this.dwCuePoints = this._io.readU4le();
      if (this.dwCuePoints != 0) {
        this.cuePoints = new Array(this.dwCuePoints);
        for (var i = 0; i < this.dwCuePoints; i++) {
          this.cuePoints[i] = new CuePointType(this._io, this, this._root);
        }
      }
    }

    return CueChunkType;
  })();

  var ChannelMaskType = Wav.ChannelMaskType = (function() {
    function ChannelMaskType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChannelMaskType.prototype._read = function() {
      this.frontRightOfCenter = this._io.readBitsInt(1) != 0;
      this.frontLeftOfCenter = this._io.readBitsInt(1) != 0;
      this.backRight = this._io.readBitsInt(1) != 0;
      this.backLeft = this._io.readBitsInt(1) != 0;
      this.lowFrequency = this._io.readBitsInt(1) != 0;
      this.frontCenter = this._io.readBitsInt(1) != 0;
      this.frontRight = this._io.readBitsInt(1) != 0;
      this.frontLeft = this._io.readBitsInt(1) != 0;
      this.topCenter = this._io.readBitsInt(1) != 0;
      this.sideRight = this._io.readBitsInt(1) != 0;
      this.sideLeft = this._io.readBitsInt(1) != 0;
      this.backCenter = this._io.readBitsInt(1) != 0;
      this.topBackLeft = this._io.readBitsInt(1) != 0;
      this.topFrontRight = this._io.readBitsInt(1) != 0;
      this.topFrontCenter = this._io.readBitsInt(1) != 0;
      this.topFrontLeft = this._io.readBitsInt(1) != 0;
      this.unused1 = this._io.readBitsInt(6);
      this.topBackRight = this._io.readBitsInt(1) != 0;
      this.topBackCenter = this._io.readBitsInt(1) != 0;
      this.unused2 = this._io.readBitsInt(8);
    }

    return ChannelMaskType;
  })();

  var ChunkType = Wav.ChunkType = (function() {
    function ChunkType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChunkType.prototype._read = function() {
      this.chunkId = this._io.readU4be();
      this.len = this._io.readU4le();
      switch (this.chunkId) {
      case 1684108385:
        this._raw_data = this._io.readBytes(this.len);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new DataChunkType(_io__raw_data, this, this._root);
        break;
      case 1668637984:
        this._raw_data = this._io.readBytes(this.len);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new CueChunkType(_io__raw_data, this, this._root);
        break;
      case 1650817140:
        this._raw_data = this._io.readBytes(this.len);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new BextChunkType(_io__raw_data, this, this._root);
        break;
      case 1718449184:
        this._raw_data = this._io.readBytes(this.len);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new FormatChunkType(_io__raw_data, this, this._root);
        break;
      default:
        this.data = this._io.readBytes(this.len);
        break;
      }
    }

    return ChunkType;
  })();

  var BextChunkType = Wav.BextChunkType = (function() {
    function BextChunkType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BextChunkType.prototype._read = function() {
      this.description = KaitaiStream.bytesToStr(this._io.readBytes(256), "ASCII");
      this.originator = KaitaiStream.bytesToStr(this._io.readBytes(32), "ASCII");
      this.originatorReference = KaitaiStream.bytesToStr(this._io.readBytes(32), "ASCII");
      this.originationDate = KaitaiStream.bytesToStr(this._io.readBytes(10), "ASCII");
      this.originationTime = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      this.timeReferenceLow = this._io.readU4le();
      this.timeReferenceHigh = this._io.readU4le();
      this.version = this._io.readU2le();
      this.umid = this._io.readBytes(64);
      this.loudnessValue = this._io.readU2le();
      this.loudnessRange = this._io.readU2le();
      this.maxTruePeakLevel = this._io.readU2le();
      this.maxMomentaryLoudness = this._io.readU2le();
      this.maxShortTermLoudness = this._io.readU2le();
    }

    return BextChunkType;
  })();
  Object.defineProperty(Wav.prototype, 'formatChunk', {
    get: function() {
      if (this._m_formatChunk !== undefined)
        return this._m_formatChunk;
      this._m_formatChunk = this.chunks.chunk[0].data;
      return this._m_formatChunk;
    }
  });

  return Wav;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Wav', [], function() {
    return Wav;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Wav;
}
