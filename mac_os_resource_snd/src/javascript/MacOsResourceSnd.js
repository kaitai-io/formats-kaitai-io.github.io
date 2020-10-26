// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MacOsResourceSnd = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Sound resources were introduced in Classic MacOS with the Sound Manager program.
 * They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
 * They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
 * @see {@link https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf|Source}
 */

var MacOsResourceSnd = (function() {
  MacOsResourceSnd.CmdType = Object.freeze({
    NULL_CMD: 0,
    QUIET_CMD: 3,
    FLUSH_CMD: 4,
    RE_INIT_CMD: 5,
    WAIT_CMD: 10,
    PAUSE_CMD: 11,
    RESUME_CMD: 12,
    CALL_BACK_CMD: 13,
    SYNC_CMD: 14,
    EMPTY_CMD: 15,
    AVAILABLE_CMD: 24,
    VERSION_CMD: 25,
    TOTAL_LOAD_CMD: 26,
    LOAD_CMD: 27,
    FREQ_DURATION_CMD: 40,
    REST_CMD: 41,
    FREQ_CMD: 42,
    AMP_CMD: 43,
    TIMBRE_CMD: 44,
    GET_AMP_CMD: 45,
    VOLUME_CMD: 46,
    GET_VOLUME_CMD: 47,
    WAVE_TABLE_CMD: 60,
    PHASE_CMD: 61,
    SOUND_CMD: 80,
    BUFFER_CMD: 81,
    RATE_CMD: 82,
    GET_RATE_CMD: 85,

    0: "NULL_CMD",
    3: "QUIET_CMD",
    4: "FLUSH_CMD",
    5: "RE_INIT_CMD",
    10: "WAIT_CMD",
    11: "PAUSE_CMD",
    12: "RESUME_CMD",
    13: "CALL_BACK_CMD",
    14: "SYNC_CMD",
    15: "EMPTY_CMD",
    24: "AVAILABLE_CMD",
    25: "VERSION_CMD",
    26: "TOTAL_LOAD_CMD",
    27: "LOAD_CMD",
    40: "FREQ_DURATION_CMD",
    41: "REST_CMD",
    42: "FREQ_CMD",
    43: "AMP_CMD",
    44: "TIMBRE_CMD",
    45: "GET_AMP_CMD",
    46: "VOLUME_CMD",
    47: "GET_VOLUME_CMD",
    60: "WAVE_TABLE_CMD",
    61: "PHASE_CMD",
    80: "SOUND_CMD",
    81: "BUFFER_CMD",
    82: "RATE_CMD",
    85: "GET_RATE_CMD",
  });

  MacOsResourceSnd.SoundHeaderType = Object.freeze({
    STANDARD: 0,
    COMPRESSED: 254,
    EXTENDED: 255,

    0: "STANDARD",
    254: "COMPRESSED",
    255: "EXTENDED",
  });

  MacOsResourceSnd.DataType = Object.freeze({
    SQUARE_WAVE_SYNTH: 1,
    WAVE_TABLE_SYNTH: 3,
    SAMPLED_SYNTH: 5,

    1: "SQUARE_WAVE_SYNTH",
    3: "WAVE_TABLE_SYNTH",
    5: "SAMPLED_SYNTH",
  });

  MacOsResourceSnd.WaveInitOption = Object.freeze({
    CHANNEL0: 4,
    CHANNEL1: 5,
    CHANNEL2: 6,
    CHANNEL3: 7,

    4: "CHANNEL0",
    5: "CHANNEL1",
    6: "CHANNEL2",
    7: "CHANNEL3",
  });

  MacOsResourceSnd.InitOption = Object.freeze({
    CHAN_LEFT: 2,
    CHAN_RIGHT: 3,
    NO_INTERP: 4,
    NO_DROP: 8,
    MONO: 128,
    STEREO: 192,
    MACE3: 768,
    MACE6: 1024,

    2: "CHAN_LEFT",
    3: "CHAN_RIGHT",
    4: "NO_INTERP",
    8: "NO_DROP",
    128: "MONO",
    192: "STEREO",
    768: "MACE3",
    1024: "MACE6",
  });

  MacOsResourceSnd.CompressionTypeEnum = Object.freeze({
    VARIABLE_COMPRESSION: -2,
    FIXED_COMPRESSION: -1,
    NOT_COMPRESSED: 0,
    TWO_TO_ONE: 1,
    EIGHT_TO_THREE: 2,
    THREE_TO_ONE: 3,
    SIX_TO_ONE: 4,

    "-2": "VARIABLE_COMPRESSION",
    "-1": "FIXED_COMPRESSION",
    0: "NOT_COMPRESSED",
    1: "TWO_TO_ONE",
    2: "EIGHT_TO_THREE",
    3: "THREE_TO_ONE",
    4: "SIX_TO_ONE",
  });

  function MacOsResourceSnd(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MacOsResourceSnd.prototype._read = function() {
    this.format = this._io.readU2be();
    if (this.format == 1) {
      this.numDataFormats = this._io.readU2be();
    }
    if (this.format == 1) {
      this.dataFormats = new Array(this.numDataFormats);
      for (var i = 0; i < this.numDataFormats; i++) {
        this.dataFormats[i] = new DataFormat(this._io, this, this._root);
      }
    }
    if (this.format == 2) {
      this.referenceCount = this._io.readU2be();
    }
    this.numSoundCommands = this._io.readU2be();
    this.soundCommands = new Array(this.numSoundCommands);
    for (var i = 0; i < this.numSoundCommands; i++) {
      this.soundCommands[i] = new SoundCommand(this._io, this, this._root);
    }
  }

  var Extended = MacOsResourceSnd.Extended = (function() {
    function Extended(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Extended.prototype._read = function() {
      this.instrumentChunkPtr = this._io.readU4be();
      this.aesRecordingPtr = this._io.readU4be();
    }

    /**
     * pointer to instrument info
     */

    /**
     * pointer to audio info
     */

    return Extended;
  })();

  var SoundHeader = MacOsResourceSnd.SoundHeader = (function() {
    function SoundHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SoundHeader.prototype._read = function() {
      if (this.startOfs < 0) {
        this._unnamed0 = this._io.readBytes(0);
      }
      this.samplePtr = this._io.readU4be();
      if (this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.STANDARD) {
        this.numSamples = this._io.readU4be();
      }
      if ( ((this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
        this.numChannels = this._io.readU4be();
      }
      this.sampleRate = new UnsignedFixedPoint(this._io, this, this._root);
      this.loopStart = this._io.readU4be();
      this.loopEnd = this._io.readU4be();
      this.encode = this._io.readU1();
      this.midiNote = this._io.readU1();
      if ( ((this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.EXTENDED) || (this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.COMPRESSED)) ) {
        this.extendedOrCompressed = new ExtendedOrCompressed(this._io, this, this._root);
      }
      if (this.samplePtr == 0) {
        this.sampleArea = this._io.readBytes((this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.STANDARD ? this.numSamples : (this.soundHeaderType == MacOsResourceSnd.SoundHeaderType.EXTENDED ? Math.floor(((this.extendedOrCompressed.numFrames * this.numChannels) * this.extendedOrCompressed.bitsPerSample) / 8) : (this._io.size - this._io.pos))));
      }
    }
    Object.defineProperty(SoundHeader.prototype, 'startOfs', {
      get: function() {
        if (this._m_startOfs !== undefined)
          return this._m_startOfs;
        this._m_startOfs = this._io.pos;
        return this._m_startOfs;
      }
    });

    /**
     * base frequency of sample in Hz
     * Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
     * @see {@link https://en.wikipedia.org/wiki/MIDI_tuning_standard|Source}
     */
    Object.defineProperty(SoundHeader.prototype, 'baseFreqeuncy', {
      get: function() {
        if (this._m_baseFreqeuncy !== undefined)
          return this._m_baseFreqeuncy;
        if ( ((this.midiNote >= 0) && (this.midiNote < 128)) ) {
          this._m_baseFreqeuncy = this._root.midiNoteToFrequency[this.midiNote];
        }
        return this._m_baseFreqeuncy;
      }
    });
    Object.defineProperty(SoundHeader.prototype, 'soundHeaderType', {
      get: function() {
        if (this._m_soundHeaderType !== undefined)
          return this._m_soundHeaderType;
        var _pos = this._io.pos;
        this._io.seek((this.startOfs + 20));
        this._m_soundHeaderType = this._io.readU1();
        this._io.seek(_pos);
        return this._m_soundHeaderType;
      }
    });

    /**
     * pointer to samples (or 0 if samples follow data structure)
     */

    /**
     * number of samples
     */

    /**
     * number of channels in sample
     */

    /**
     * The rate at which the sample was originally recorded.
     */

    /**
     * loop point beginning
     */

    /**
     * loop point ending
     */

    /**
     * sample's encoding option
     */

    /**
     * base frequency of sample, expressed as MIDI note values, 60 is middle C
     */

    /**
     * sampled-sound data
     */

    return SoundHeader;
  })();

  var UnsignedFixedPoint = MacOsResourceSnd.UnsignedFixedPoint = (function() {
    function UnsignedFixedPoint(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    UnsignedFixedPoint.prototype._read = function() {
      this.integerPart = this._io.readU2be();
      this.fractionPart = this._io.readU2be();
    }
    Object.defineProperty(UnsignedFixedPoint.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = (this.integerPart + (this.fractionPart / 65535.0));
        return this._m_value;
      }
    });

    return UnsignedFixedPoint;
  })();

  var SoundCommand = MacOsResourceSnd.SoundCommand = (function() {
    function SoundCommand(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SoundCommand.prototype._read = function() {
      this.isDataOffset = this._io.readBitsIntBe(1) != 0;
      this.cmd = this._io.readBitsIntBe(15);
      this._io.alignToByte();
      this.param1 = this._io.readU2be();
      this.param2 = this._io.readU4be();
    }
    Object.defineProperty(SoundCommand.prototype, 'soundHeader', {
      get: function() {
        if (this._m_soundHeader !== undefined)
          return this._m_soundHeader;
        if ( ((this.isDataOffset) && (this.cmd == MacOsResourceSnd.CmdType.BUFFER_CMD)) ) {
          var _pos = this._io.pos;
          this._io.seek(this.param2);
          this._m_soundHeader = new SoundHeader(this._io, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_soundHeader;
      }
    });

    return SoundCommand;
  })();

  var Compressed = MacOsResourceSnd.Compressed = (function() {
    function Compressed(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Compressed.prototype._read = function() {
      this.format = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.reserved = this._io.readBytes(4);
      this.stateVarsPtr = this._io.readU4be();
      this.leftOverSamplesPtr = this._io.readU4be();
      this.compressionId = this._io.readS2be();
      this.packetSize = this._io.readU2be();
      this.synthesizerId = this._io.readU2be();
    }
    Object.defineProperty(Compressed.prototype, 'compressionType', {
      get: function() {
        if (this._m_compressionType !== undefined)
          return this._m_compressionType;
        this._m_compressionType = this.compressionId;
        return this._m_compressionType;
      }
    });

    /**
     * data format type
     */

    /**
     * pointer to StateBlock
     */

    /**
     * pointer to LeftOverBlock
     */

    /**
     * ID of compression algorithm
     */

    /**
     * number of bits per packet
     */

    /**
     * Latest Sound Manager documentation specifies this field as:
     * This field is unused. You should set it to 0.
     * Inside Macintosh (Volume VI, 1991) specifies it as:
     * Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
     * @see {@link https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf|Page 22-49, absolute page number 1169 in the PDF}
     */

    return Compressed;
  })();

  var ExtendedOrCompressed = MacOsResourceSnd.ExtendedOrCompressed = (function() {
    function ExtendedOrCompressed(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtendedOrCompressed.prototype._read = function() {
      this.numFrames = this._io.readU4be();
      this.aiffSampleRate = this._io.readBytes(10);
      this.markerChunk = this._io.readU4be();
      if (this._parent.soundHeaderType == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
        this.extended = new Extended(this._io, this, this._root);
      }
      if (this._parent.soundHeaderType == MacOsResourceSnd.SoundHeaderType.COMPRESSED) {
        this.compressed = new Compressed(this._io, this, this._root);
      }
      this.bitsPerSample = this._io.readU2be();
      if (this._parent.soundHeaderType == MacOsResourceSnd.SoundHeaderType.EXTENDED) {
        this.reserved = this._io.readBytes(14);
      }
    }

    /**
     * rate of original sample (Extended80)
     */

    /**
     * reserved
     */

    /**
     * number of bits per sample
     */

    /**
     * reserved
     */

    return ExtendedOrCompressed;
  })();

  var DataFormat = MacOsResourceSnd.DataFormat = (function() {
    function DataFormat(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataFormat.prototype._read = function() {
      this.id = this._io.readU2be();
      this.options = this._io.readU4be();
    }

    /**
     * mask for right/left pan values
     */
    Object.defineProperty(DataFormat.prototype, 'initPanMask', {
      get: function() {
        if (this._m_initPanMask !== undefined)
          return this._m_initPanMask;
        this._m_initPanMask = 3;
        return this._m_initPanMask;
      }
    });

    /**
     * wave table only, Sound Manager 2.0 and earlier
     */
    Object.defineProperty(DataFormat.prototype, 'waveInitChannelMask', {
      get: function() {
        if (this._m_waveInitChannelMask !== undefined)
          return this._m_waveInitChannelMask;
        this._m_waveInitChannelMask = 7;
        return this._m_waveInitChannelMask;
      }
    });

    /**
     * mask for mono/stereo values
     */
    Object.defineProperty(DataFormat.prototype, 'initStereoMask', {
      get: function() {
        if (this._m_initStereoMask !== undefined)
          return this._m_initStereoMask;
        this._m_initStereoMask = 192;
        return this._m_initStereoMask;
      }
    });
    Object.defineProperty(DataFormat.prototype, 'waveInit', {
      get: function() {
        if (this._m_waveInit !== undefined)
          return this._m_waveInit;
        if (this.id == MacOsResourceSnd.DataType.WAVE_TABLE_SYNTH) {
          this._m_waveInit = (this.options & this.waveInitChannelMask);
        }
        return this._m_waveInit;
      }
    });
    Object.defineProperty(DataFormat.prototype, 'panInit', {
      get: function() {
        if (this._m_panInit !== undefined)
          return this._m_panInit;
        this._m_panInit = (this.options & this.initPanMask);
        return this._m_panInit;
      }
    });

    /**
     * mask for compression IDs
     */
    Object.defineProperty(DataFormat.prototype, 'initCompMask', {
      get: function() {
        if (this._m_initCompMask !== undefined)
          return this._m_initCompMask;
        this._m_initCompMask = 65280;
        return this._m_initCompMask;
      }
    });
    Object.defineProperty(DataFormat.prototype, 'stereoInit', {
      get: function() {
        if (this._m_stereoInit !== undefined)
          return this._m_stereoInit;
        this._m_stereoInit = (this.options & this.initStereoMask);
        return this._m_stereoInit;
      }
    });
    Object.defineProperty(DataFormat.prototype, 'compInit', {
      get: function() {
        if (this._m_compInit !== undefined)
          return this._m_compInit;
        this._m_compInit = (this.options & this.initCompMask);
        return this._m_compInit;
      }
    });

    /**
     * contains initialisation options for the SndNewChannel function
     */

    return DataFormat;
  })();

  /**
   * Lookup table to convert a MIDI note into a frequency in Hz
   * The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
   * @see {@link https://en.wikipedia.org/wiki/MIDI_tuning_standard|Source}
   */
  Object.defineProperty(MacOsResourceSnd.prototype, 'midiNoteToFrequency', {
    get: function() {
      if (this._m_midiNoteToFrequency !== undefined)
        return this._m_midiNoteToFrequency;
      this._m_midiNoteToFrequency = [8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85];
      return this._m_midiNoteToFrequency;
    }
  });

  return MacOsResourceSnd;
})();
return MacOsResourceSnd;
}));
