// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.CreativeVoiceFile = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Creative Voice File is a container file format for digital audio
 * wave data. Initial revisions were able to support only unsigned
 * 8-bit PCM and ADPCM data, later versions were revised to add support
 * for 16-bit PCM and a-law / u-law formats.
 * 
 * This format was actively used in 1990s, around the advent of
 * Creative's sound cards (Sound Blaster family). It was a popular
 * choice for a digital sound container in lots of games and multimedia
 * software due to simplicity and availability of Creative's recording
 * / editing tools.
 * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice|Source}
 */

var CreativeVoiceFile = (function() {
  CreativeVoiceFile.BlockTypes = Object.freeze({
    TERMINATOR: 0,
    SOUND_DATA: 1,
    SOUND_DATA_CONT: 2,
    SILENCE: 3,
    MARKER: 4,
    TEXT: 5,
    REPEAT_START: 6,
    REPEAT_END: 7,
    EXTRA_INFO: 8,
    SOUND_DATA_NEW: 9,

    0: "TERMINATOR",
    1: "SOUND_DATA",
    2: "SOUND_DATA_CONT",
    3: "SILENCE",
    4: "MARKER",
    5: "TEXT",
    6: "REPEAT_START",
    7: "REPEAT_END",
    8: "EXTRA_INFO",
    9: "SOUND_DATA_NEW",
  });

  CreativeVoiceFile.Codecs = Object.freeze({
    PCM_8BIT_UNSIGNED: 0,
    ADPCM_4BIT: 1,
    ADPCM_2_6BIT: 2,
    ADPCM_2_BIT: 3,
    PCM_16BIT_SIGNED: 4,
    ALAW: 6,
    ULAW: 7,
    ADPCM_4_TO_16BIT: 512,

    0: "PCM_8BIT_UNSIGNED",
    1: "ADPCM_4BIT",
    2: "ADPCM_2_6BIT",
    3: "ADPCM_2_BIT",
    4: "PCM_16BIT_SIGNED",
    6: "ALAW",
    7: "ULAW",
    512: "ADPCM_4_TO_16BIT",
  });

  function CreativeVoiceFile(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  CreativeVoiceFile.prototype._read = function() {
    this.magic = this._io.ensureFixedContents([67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26]);
    this.headerSize = this._io.readU2le();
    this.version = this._io.readU2le();
    this.checksum = this._io.readU2le();
    this.blocks = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.blocks.push(new Block(this._io, this, this._root));
      i++;
    }
  }

  /**
   * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker|Source}
   */

  var BlockMarker = CreativeVoiceFile.BlockMarker = (function() {
    function BlockMarker(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockMarker.prototype._read = function() {
      this.markerId = this._io.readU2le();
    }

    /**
     * Marker ID
     */

    return BlockMarker;
  })();

  /**
   * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence|Source}
   */

  var BlockSilence = CreativeVoiceFile.BlockSilence = (function() {
    function BlockSilence(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockSilence.prototype._read = function() {
      this.durationSamples = this._io.readU2le();
      this.freqDiv = this._io.readU1();
    }
    Object.defineProperty(BlockSilence.prototype, 'sampleRate', {
      get: function() {
        if (this._m_sampleRate !== undefined)
          return this._m_sampleRate;
        this._m_sampleRate = (1000000.0 / (256 - this.freqDiv));
        return this._m_sampleRate;
      }
    });

    /**
     * Duration of silence, in seconds
     */
    Object.defineProperty(BlockSilence.prototype, 'durationSec', {
      get: function() {
        if (this._m_durationSec !== undefined)
          return this._m_durationSec;
        this._m_durationSec = (this.durationSamples / this.sampleRate);
        return this._m_durationSec;
      }
    });

    /**
     * Duration of silence, in samples
     */

    /**
     * Frequency divisor, used to determine sample rate
     */

    return BlockSilence;
  })();

  /**
   * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29|Source}
   */

  var BlockSoundDataNew = CreativeVoiceFile.BlockSoundDataNew = (function() {
    function BlockSoundDataNew(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockSoundDataNew.prototype._read = function() {
      this.sampleRate = this._io.readU4le();
      this.bitsPerSample = this._io.readU1();
      this.numChannels = this._io.readU1();
      this.codec = this._io.readU2le();
      this.reserved = this._io.readBytes(4);
      this.wave = this._io.readBytesFull();
    }

    return BlockSoundDataNew;
  })();

  var Block = CreativeVoiceFile.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.blockType = this._io.readU1();
      if (this.blockType != CreativeVoiceFile.BlockTypes.TERMINATOR) {
        this.bodySize1 = this._io.readU2le();
      }
      if (this.blockType != CreativeVoiceFile.BlockTypes.TERMINATOR) {
        this.bodySize2 = this._io.readU1();
      }
      if (this.blockType != CreativeVoiceFile.BlockTypes.TERMINATOR) {
        switch (this.blockType) {
        case CreativeVoiceFile.BlockTypes.SOUND_DATA_NEW:
          this._raw_body = this._io.readBytes(this.bodySize);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new BlockSoundDataNew(_io__raw_body, this, this._root);
          break;
        case CreativeVoiceFile.BlockTypes.REPEAT_START:
          this._raw_body = this._io.readBytes(this.bodySize);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new BlockRepeatStart(_io__raw_body, this, this._root);
          break;
        case CreativeVoiceFile.BlockTypes.MARKER:
          this._raw_body = this._io.readBytes(this.bodySize);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new BlockMarker(_io__raw_body, this, this._root);
          break;
        case CreativeVoiceFile.BlockTypes.SOUND_DATA:
          this._raw_body = this._io.readBytes(this.bodySize);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new BlockSoundData(_io__raw_body, this, this._root);
          break;
        case CreativeVoiceFile.BlockTypes.EXTRA_INFO:
          this._raw_body = this._io.readBytes(this.bodySize);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new BlockExtraInfo(_io__raw_body, this, this._root);
          break;
        case CreativeVoiceFile.BlockTypes.SILENCE:
          this._raw_body = this._io.readBytes(this.bodySize);
          var _io__raw_body = new KaitaiStream(this._raw_body);
          this.body = new BlockSilence(_io__raw_body, this, this._root);
          break;
        default:
          this.body = this._io.readBytes(this.bodySize);
          break;
        }
      }
    }

    /**
     * body_size is a 24-bit little-endian integer, so we're
     * emulating that by adding two standard-sized integers
     * (body_size1 and body_size2).
     */
    Object.defineProperty(Block.prototype, 'bodySize', {
      get: function() {
        if (this._m_bodySize !== undefined)
          return this._m_bodySize;
        if (this.blockType != CreativeVoiceFile.BlockTypes.TERMINATOR) {
          this._m_bodySize = (this.bodySize1 + (this.bodySize2 << 16));
        }
        return this._m_bodySize;
      }
    });

    /**
     * Byte that determines type of block content
     */

    /**
     * Block body, type depends on block type byte
     */

    return Block;
  })();

  /**
   * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start|Source}
   */

  var BlockRepeatStart = CreativeVoiceFile.BlockRepeatStart = (function() {
    function BlockRepeatStart(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockRepeatStart.prototype._read = function() {
      this.repeatCount1 = this._io.readU2le();
    }

    /**
     * Number of repetitions minus 1; 0xffff means infinite repetitions
     */

    return BlockRepeatStart;
  })();

  /**
   * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data|Source}
   */

  var BlockSoundData = CreativeVoiceFile.BlockSoundData = (function() {
    function BlockSoundData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockSoundData.prototype._read = function() {
      this.freqDiv = this._io.readU1();
      this.codec = this._io.readU1();
      this.wave = this._io.readBytesFull();
    }
    Object.defineProperty(BlockSoundData.prototype, 'sampleRate', {
      get: function() {
        if (this._m_sampleRate !== undefined)
          return this._m_sampleRate;
        this._m_sampleRate = (1000000.0 / (256 - this.freqDiv));
        return this._m_sampleRate;
      }
    });

    /**
     * Frequency divisor, used to determine sample rate
     */

    return BlockSoundData;
  })();

  /**
   * @see {@link https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info|Source}
   */

  var BlockExtraInfo = CreativeVoiceFile.BlockExtraInfo = (function() {
    function BlockExtraInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlockExtraInfo.prototype._read = function() {
      this.freqDiv = this._io.readU2le();
      this.codec = this._io.readU1();
      this.numChannels1 = this._io.readU1();
    }

    /**
     * Number of channels (1 = mono, 2 = stereo)
     */
    Object.defineProperty(BlockExtraInfo.prototype, 'numChannels', {
      get: function() {
        if (this._m_numChannels !== undefined)
          return this._m_numChannels;
        this._m_numChannels = (this.numChannels1 + 1);
        return this._m_numChannels;
      }
    });
    Object.defineProperty(BlockExtraInfo.prototype, 'sampleRate', {
      get: function() {
        if (this._m_sampleRate !== undefined)
          return this._m_sampleRate;
        this._m_sampleRate = (256000000.0 / (this.numChannels * (65536 - this.freqDiv)));
        return this._m_sampleRate;
      }
    });

    /**
     * Frequency divisor
     */

    /**
     * Number of channels minus 1 (0 = mono, 1 = stereo)
     */

    return BlockExtraInfo;
  })();

  /**
   * Total size of this main header (usually 0x001A)
   */

  /**
   * Checksum: this must be equal to ~version + 0x1234
   */

  /**
   * Series of blocks that contain the actual audio data
   */

  return CreativeVoiceFile;
})();
return CreativeVoiceFile;
}));
