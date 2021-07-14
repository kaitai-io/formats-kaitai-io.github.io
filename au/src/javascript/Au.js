// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Au = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * The NeXT/Sun audio file format.
 * 
 * Sample files:
 * 
 * * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
 * * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
 * * <http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
 * @see {@link http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html|Source}
 * @see {@link http://soundfile.sapp.org/doc/NextFormat/|Source}
 * @see {@link http://soundfile.sapp.org/doc/NextFormat/soundstruct.h|Source}
 * @see {@link https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112|Source}
 * @see {@link https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74|Source}
 * @see {@link https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49|Source}
 * @see {@link https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96|Source}
 */

var Au = (function() {
  Au.Encodings = Object.freeze({
    MULAW_8: 1,
    LINEAR_8: 2,
    LINEAR_16: 3,
    LINEAR_24: 4,
    LINEAR_32: 5,
    FLOAT: 6,
    DOUBLE: 7,
    FRAGMENTED: 8,
    NESTED: 9,
    DSP_CORE: 10,
    FIXED_POINT_8: 11,
    FIXED_POINT_16: 12,
    FIXED_POINT_24: 13,
    FIXED_POINT_32: 14,
    DISPLAY: 16,
    MULAW_SQUELCH: 17,
    EMPHASIZED: 18,
    COMPRESSED: 19,
    COMPRESSED_EMPHASIZED: 20,
    DSP_COMMANDS: 21,
    DSP_COMMANDS_SAMPLES: 22,
    ADPCM_G721: 23,
    ADPCM_G722: 24,
    ADPCM_G723_3: 25,
    ADPCM_G723_5: 26,
    ALAW_8: 27,
    AES: 28,
    DELTA_MULAW_8: 29,

    1: "MULAW_8",
    2: "LINEAR_8",
    3: "LINEAR_16",
    4: "LINEAR_24",
    5: "LINEAR_32",
    6: "FLOAT",
    7: "DOUBLE",
    8: "FRAGMENTED",
    9: "NESTED",
    10: "DSP_CORE",
    11: "FIXED_POINT_8",
    12: "FIXED_POINT_16",
    13: "FIXED_POINT_24",
    14: "FIXED_POINT_32",
    16: "DISPLAY",
    17: "MULAW_SQUELCH",
    18: "EMPHASIZED",
    19: "COMPRESSED",
    20: "COMPRESSED_EMPHASIZED",
    21: "DSP_COMMANDS",
    22: "DSP_COMMANDS_SAMPLES",
    23: "ADPCM_G721",
    24: "ADPCM_G722",
    25: "ADPCM_G723_3",
    26: "ADPCM_G723_5",
    27: "ALAW_8",
    28: "AES",
    29: "DELTA_MULAW_8",
  });

  function Au(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Au.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [46, 115, 110, 100]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([46, 115, 110, 100], this.magic, this._io, "/seq/0");
    }
    this.ofsData = this._io.readU4be();
    this._raw_header = this._io.readBytes(((this.ofsData - 4) - 4));
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new Header(_io__raw_header, this, this._root);
  }

  var Header = Au.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.dataSize = this._io.readU4be();
      this.encoding = this._io.readU4be();
      this.sampleRate = this._io.readU4be();
      this.numChannels = this._io.readU4be();
      if (!(this.numChannels >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.numChannels, this._io, "/types/header/seq/3");
      }
      this.comment = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytesFull(), 0, false), "ASCII");
    }

    /**
     * don't read this field, access `_root.len_data` instead
     * 
     * value `0xffff_ffff` means unspecified size
     */

    /**
     * number of interleaved channels
     */

    /**
     * Most resources claim that this field must be at least 4 bytes long.
     * However, most programs don't enforce it, and [Audacity](
     * https://www.audacityteam.org/) even generates .au files with this field
     * being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
     * "NeXT files require that this chunk be at least 4 bytes (chars) long,
     * whereas this chunk may be zerolength in a Sun .au file."
     * 
     * By convention, size should be a multiple of 4 -
     * see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
     * Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
     * sound playing programs, this field must have an even byte size. So a multiple
     * of 4 is probably best for compatibility.
     * 
     * Must be null-terminated. It is usually an ASCII text string, but this space
     * might be also used to store application-specific binary (i.e. non-ASCII) data.
     */

    return Header;
  })();
  Object.defineProperty(Au.prototype, 'lenData', {
    get: function() {
      if (this._m_lenData !== undefined)
        return this._m_lenData;
      this._m_lenData = (this.header.dataSize == 4294967295 ? (this._io.size - this.ofsData) : this.header.dataSize);
      return this._m_lenData;
    }
  });

  return Au;
})();
return Au;
}));
