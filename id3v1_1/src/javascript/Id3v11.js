// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Id3v11 = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
 * tag is appended to the end of file and spans exactly 128 bytes.
 * 
 * This type is supposed to be used on full .mp3 files, seeking to
 * proper position automatically. If you're interesting in parsing only
 * the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
 * @see {@link https://id3.org/ID3v1|Source}
 */

var Id3v11 = (function() {
  function Id3v11(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Id3v11.prototype._read = function() {
  }

  /**
   * ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
   * several metadata fields as fixed-size strings.
   * 
   * Note that string encoding is not specified by standard, so real
   * encoding used would vary a lot from one implementation to
   * another. Most Windows-based applications tend to use "ANSI"
   * (i.e. locale-dependent encoding, usually one byte per
   * character). Some embedded applications allow selection of
   * charset.
   */

  var Id3V11Tag = Id3v11.Id3V11Tag = (function() {
    Id3V11Tag.GenreEnum = Object.freeze({
      BLUES: 0,
      CLASSIC_ROCK: 1,
      COUNTRY: 2,
      DANCE: 3,
      DISCO: 4,
      FUNK: 5,
      GRUNGE: 6,
      HIP_HOP: 7,
      JAZZ: 8,
      METAL: 9,
      NEW_AGE: 10,
      OLDIES: 11,
      OTHER: 12,
      POP: 13,
      RNB: 14,
      RAP: 15,
      REGGAE: 16,
      ROCK: 17,
      TECHNO: 18,
      INDUSTRIAL: 19,
      ALTERNATIVE: 20,
      SKA: 21,
      DEATH_METAL: 22,
      PRANKS: 23,
      SOUNDTRACK: 24,
      EURO_TECHNO: 25,
      AMBIENT: 26,
      TRIP_HOP: 27,
      VOCAL: 28,
      JAZZ_FUNK: 29,
      FUSION: 30,
      TRANCE: 31,
      CLASSICAL: 32,
      INSTRUMENTAL: 33,
      ACID: 34,
      HOUSE: 35,
      GAME: 36,
      SOUND_CLIP: 37,
      GOSPEL: 38,
      NOISE: 39,
      ALTERNROCK: 40,
      BASS: 41,
      SOUL: 42,
      PUNK: 43,
      SPACE: 44,
      MEDITATIVE: 45,
      INSTRUMENTAL_POP: 46,
      INSTRUMENTAL_ROCK: 47,
      ETHNIC: 48,
      GOTHIC: 49,
      DARKWAVE: 50,
      TECHNO_INDUSTRIAL: 51,
      ELECTRONIC: 52,
      POP_FOLK: 53,
      EURODANCE: 54,
      DREAM: 55,
      SOUTHERN_ROCK: 56,
      COMEDY: 57,
      CULT: 58,
      GANGSTA: 59,
      TOP_40: 60,
      CHRISTIAN_RAP: 61,
      POP_FUNK: 62,
      JUNGLE: 63,
      NATIVE_AMERICAN: 64,
      CABARET: 65,
      NEW_WAVE: 66,
      PSYCHADELIC: 67,
      RAVE: 68,
      SHOWTUNES: 69,
      TRAILER: 70,
      LO_FI: 71,
      TRIBAL: 72,
      ACID_PUNK: 73,
      ACID_JAZZ: 74,
      POLKA: 75,
      RETRO: 76,
      MUSICAL: 77,
      ROCK_N_ROLL: 78,
      HARD_ROCK: 79,
      FOLK: 80,
      FOLK_ROCK: 81,
      NATIONAL_FOLK: 82,
      SWING: 83,
      FAST_FUSION: 84,
      BEBOB: 85,
      LATIN: 86,
      REVIVAL: 87,
      CELTIC: 88,
      BLUEGRASS: 89,
      AVANTGARDE: 90,
      GOTHIC_ROCK: 91,
      PROGRESSIVE_ROCK: 92,
      PSYCHEDELIC_ROCK: 93,
      SYMPHONIC_ROCK: 94,
      SLOW_ROCK: 95,
      BIG_BAND: 96,
      CHORUS: 97,
      EASY_LISTENING: 98,
      ACOUSTIC: 99,
      HUMOUR: 100,
      SPEECH: 101,
      CHANSON: 102,
      OPERA: 103,
      CHAMBER_MUSIC: 104,
      SONATA: 105,
      SYMPHONY: 106,
      BOOTY_BASS: 107,
      PRIMUS: 108,
      PORN_GROOVE: 109,
      SATIRE: 110,
      SLOW_JAM: 111,
      CLUB: 112,
      TANGO: 113,
      SAMBA: 114,
      FOLKLORE: 115,
      BALLAD: 116,
      POWER_BALLAD: 117,
      RHYTHMIC_SOUL: 118,
      FREESTYLE: 119,
      DUET: 120,
      PUNK_ROCK: 121,
      DRUM_SOLO: 122,
      A_CAPELLA: 123,
      EURO_HOUSE: 124,
      DANCE_HALL: 125,

      0: "BLUES",
      1: "CLASSIC_ROCK",
      2: "COUNTRY",
      3: "DANCE",
      4: "DISCO",
      5: "FUNK",
      6: "GRUNGE",
      7: "HIP_HOP",
      8: "JAZZ",
      9: "METAL",
      10: "NEW_AGE",
      11: "OLDIES",
      12: "OTHER",
      13: "POP",
      14: "RNB",
      15: "RAP",
      16: "REGGAE",
      17: "ROCK",
      18: "TECHNO",
      19: "INDUSTRIAL",
      20: "ALTERNATIVE",
      21: "SKA",
      22: "DEATH_METAL",
      23: "PRANKS",
      24: "SOUNDTRACK",
      25: "EURO_TECHNO",
      26: "AMBIENT",
      27: "TRIP_HOP",
      28: "VOCAL",
      29: "JAZZ_FUNK",
      30: "FUSION",
      31: "TRANCE",
      32: "CLASSICAL",
      33: "INSTRUMENTAL",
      34: "ACID",
      35: "HOUSE",
      36: "GAME",
      37: "SOUND_CLIP",
      38: "GOSPEL",
      39: "NOISE",
      40: "ALTERNROCK",
      41: "BASS",
      42: "SOUL",
      43: "PUNK",
      44: "SPACE",
      45: "MEDITATIVE",
      46: "INSTRUMENTAL_POP",
      47: "INSTRUMENTAL_ROCK",
      48: "ETHNIC",
      49: "GOTHIC",
      50: "DARKWAVE",
      51: "TECHNO_INDUSTRIAL",
      52: "ELECTRONIC",
      53: "POP_FOLK",
      54: "EURODANCE",
      55: "DREAM",
      56: "SOUTHERN_ROCK",
      57: "COMEDY",
      58: "CULT",
      59: "GANGSTA",
      60: "TOP_40",
      61: "CHRISTIAN_RAP",
      62: "POP_FUNK",
      63: "JUNGLE",
      64: "NATIVE_AMERICAN",
      65: "CABARET",
      66: "NEW_WAVE",
      67: "PSYCHADELIC",
      68: "RAVE",
      69: "SHOWTUNES",
      70: "TRAILER",
      71: "LO_FI",
      72: "TRIBAL",
      73: "ACID_PUNK",
      74: "ACID_JAZZ",
      75: "POLKA",
      76: "RETRO",
      77: "MUSICAL",
      78: "ROCK_N_ROLL",
      79: "HARD_ROCK",
      80: "FOLK",
      81: "FOLK_ROCK",
      82: "NATIONAL_FOLK",
      83: "SWING",
      84: "FAST_FUSION",
      85: "BEBOB",
      86: "LATIN",
      87: "REVIVAL",
      88: "CELTIC",
      89: "BLUEGRASS",
      90: "AVANTGARDE",
      91: "GOTHIC_ROCK",
      92: "PROGRESSIVE_ROCK",
      93: "PSYCHEDELIC_ROCK",
      94: "SYMPHONIC_ROCK",
      95: "SLOW_ROCK",
      96: "BIG_BAND",
      97: "CHORUS",
      98: "EASY_LISTENING",
      99: "ACOUSTIC",
      100: "HUMOUR",
      101: "SPEECH",
      102: "CHANSON",
      103: "OPERA",
      104: "CHAMBER_MUSIC",
      105: "SONATA",
      106: "SYMPHONY",
      107: "BOOTY_BASS",
      108: "PRIMUS",
      109: "PORN_GROOVE",
      110: "SATIRE",
      111: "SLOW_JAM",
      112: "CLUB",
      113: "TANGO",
      114: "SAMBA",
      115: "FOLKLORE",
      116: "BALLAD",
      117: "POWER_BALLAD",
      118: "RHYTHMIC_SOUL",
      119: "FREESTYLE",
      120: "DUET",
      121: "PUNK_ROCK",
      122: "DRUM_SOLO",
      123: "A_CAPELLA",
      124: "EURO_HOUSE",
      125: "DANCE_HALL",
    });

    function Id3V11Tag(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Id3V11Tag.prototype._read = function() {
      this.magic = this._io.readBytes(3);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [84, 65, 71]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([84, 65, 71], this.magic, this._io, "/types/id3_v1_1_tag/seq/0");
      }
      this.title = this._io.readBytes(30);
      this.artist = this._io.readBytes(30);
      this.album = this._io.readBytes(30);
      this.year = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.comment = this._io.readBytes(30);
      this.genre = this._io.readU1();
    }

    /**
     * Song title
     */

    /**
     * Artist name
     */

    /**
     * Album title
     */

    /**
     * Year of release
     */

    /**
     * Arbitary comment
     */

    return Id3V11Tag;
  })();
  Object.defineProperty(Id3v11.prototype, 'id3v1Tag', {
    get: function() {
      if (this._m_id3v1Tag !== undefined)
        return this._m_id3v1Tag;
      var _pos = this._io.pos;
      this._io.seek((this._io.size - 128));
      this._m_id3v1Tag = new Id3V11Tag(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_id3v1Tag;
    }
  });

  return Id3v11;
})();
return Id3v11;
}));
