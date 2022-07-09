// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Gzip = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Gzip is a popular and standard single-file archiving format. It
 * essentially provides a container that stores original file name,
 * timestamp and a few other things (like optional comment), basic
 * CRCs, etc, and a file compressed by a chosen compression algorithm.
 * 
 * As of 2019, there is actually only one working solution for
 * compression algorithms, so it's typically raw DEFLATE stream
 * (without zlib header) in all gzipped files.
 * @see {@link https://tools.ietf.org/html/rfc1952|Source}
 */

var Gzip = (function() {
  Gzip.CompressionMethods = Object.freeze({
    DEFLATE: 8,

    8: "DEFLATE",
  });

  Gzip.Oses = Object.freeze({
    FAT: 0,
    AMIGA: 1,
    VMS: 2,
    UNIX: 3,
    VM_CMS: 4,
    ATARI_TOS: 5,
    HPFS: 6,
    MACINTOSH: 7,
    Z_SYSTEM: 8,
    CP_M: 9,
    TOPS_20: 10,
    NTFS: 11,
    QDOS: 12,
    ACORN_RISCOS: 13,
    UNKNOWN: 255,

    0: "FAT",
    1: "AMIGA",
    2: "VMS",
    3: "UNIX",
    4: "VM_CMS",
    5: "ATARI_TOS",
    6: "HPFS",
    7: "MACINTOSH",
    8: "Z_SYSTEM",
    9: "CP_M",
    10: "TOPS_20",
    11: "NTFS",
    12: "QDOS",
    13: "ACORN_RISCOS",
    255: "UNKNOWN",
  });

  function Gzip(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Gzip.prototype._read = function() {
    this.magic = this._io.readBytes(2);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [31, 139]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([31, 139], this.magic, this._io, "/seq/0");
    }
    this.compressionMethod = this._io.readU1();
    this.flags = new Flags(this._io, this, this._root);
    this.modTime = this._io.readU4le();
    switch (this.compressionMethod) {
    case Gzip.CompressionMethods.DEFLATE:
      this.extraFlags = new ExtraFlagsDeflate(this._io, this, this._root);
      break;
    }
    this.os = this._io.readU1();
    if (this.flags.hasExtra) {
      this.extras = new Extras(this._io, this, this._root);
    }
    if (this.flags.hasName) {
      this.name = this._io.readBytesTerm(0, false, true, true);
    }
    if (this.flags.hasComment) {
      this.comment = this._io.readBytesTerm(0, false, true, true);
    }
    if (this.flags.hasHeaderCrc) {
      this.headerCrc16 = this._io.readU2le();
    }
    this.body = this._io.readBytes(((this._io.size - this._io.pos) - 8));
    this.bodyCrc32 = this._io.readU4le();
    this.lenUncompressed = this._io.readU4le();
  }

  var Flags = Gzip.Flags = (function() {
    function Flags(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Flags.prototype._read = function() {
      this.reserved1 = this._io.readBitsIntBe(3);
      this.hasComment = this._io.readBitsIntBe(1) != 0;
      this.hasName = this._io.readBitsIntBe(1) != 0;
      this.hasExtra = this._io.readBitsIntBe(1) != 0;
      this.hasHeaderCrc = this._io.readBitsIntBe(1) != 0;
      this.isText = this._io.readBitsIntBe(1) != 0;
    }

    /**
     * If true, optional extra fields are present in the archive.
     */

    /**
     * If true, this archive includes a CRC16 checksum for the header.
     */

    /**
     * If true, file inside this archive is a text file from
     * compressor's point of view.
     */

    return Flags;
  })();

  var ExtraFlagsDeflate = Gzip.ExtraFlagsDeflate = (function() {
    ExtraFlagsDeflate.CompressionStrengths = Object.freeze({
      BEST: 2,
      FAST: 4,

      2: "BEST",
      4: "FAST",
    });

    function ExtraFlagsDeflate(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtraFlagsDeflate.prototype._read = function() {
      this.compressionStrength = this._io.readU1();
    }

    return ExtraFlagsDeflate;
  })();

  /**
   * Container for many subfields, constrained by size of stream.
   */

  var Subfields = Gzip.Subfields = (function() {
    function Subfields(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Subfields.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Subfield(this._io, this, this._root));
        i++;
      }
    }

    return Subfields;
  })();

  /**
   * Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
   * 
   * * `id` serves role of "T"ype
   * * `len_data` serves role of "L"ength
   * * `data` serves role of "V"alue
   * 
   * This way it's possible to for arbitrary parser to skip over
   * subfields it does not support.
   */

  var Subfield = Gzip.Subfield = (function() {
    function Subfield(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Subfield.prototype._read = function() {
      this.id = this._io.readU2le();
      this.lenData = this._io.readU2le();
      this.data = this._io.readBytes(this.lenData);
    }

    /**
     * Subfield ID, typically two ASCII letters.
     */

    return Subfield;
  })();

  var Extras = Gzip.Extras = (function() {
    function Extras(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Extras.prototype._read = function() {
      this.lenSubfields = this._io.readU2le();
      this._raw_subfields = this._io.readBytes(this.lenSubfields);
      var _io__raw_subfields = new KaitaiStream(this._raw_subfields);
      this.subfields = new Subfields(_io__raw_subfields, this, this._root);
    }

    return Extras;
  })();

  /**
   * Compression method used to compress file body. In practice, only
   * one method is widely used: 8 = deflate.
   */

  /**
   * Last modification time of a file archived in UNIX timestamp format.
   */

  /**
   * Extra flags, specific to compression method chosen.
   */

  /**
   * OS used to compress this file.
   */

  /**
   * Compressed body of a file archived. Note that we don't make an
   * attempt to decompress it here.
   */

  /**
   * CRC32 checksum of an uncompressed file body
   */

  /**
   * Size of original uncompressed data in bytes (truncated to 32
   * bits).
   */

  return Gzip;
})();
return Gzip;
}));
