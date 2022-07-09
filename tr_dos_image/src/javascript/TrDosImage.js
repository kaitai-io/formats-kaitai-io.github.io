// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.TrDosImage = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
 * headerless and contain consequent "logical tracks", each logical track
 * consists of 16 256-byte sectors.
 * 
 * Logical tracks are defined the same way as used by TR-DOS: for single-side
 * floppies it's just a physical track number, for two-side floppies sides are
 * interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
 * 
 * So, this format definition is more for TR-DOS filesystem than for .trd files,
 * which are formatless.
 * 
 * Strings (file names, disk label, disk password) are padded with spaces and use
 * ZX Spectrum character set, including UDGs, block drawing chars and Basic
 * tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
 * replaced with (up arrow, pound, copyright symbol).
 * 
 * .trd file can be smaller than actual floppy disk, if last logical tracks are
 * empty (contain no file data) they can be omitted.
 */

var TrDosImage = (function() {
  TrDosImage.DiskType = Object.freeze({
    TYPE_80_TRACKS_DOUBLE_SIDE: 22,
    TYPE_40_TRACKS_DOUBLE_SIDE: 23,
    TYPE_80_TRACKS_SINGLE_SIDE: 24,
    TYPE_40_TRACKS_SINGLE_SIDE: 25,

    22: "TYPE_80_TRACKS_DOUBLE_SIDE",
    23: "TYPE_40_TRACKS_DOUBLE_SIDE",
    24: "TYPE_80_TRACKS_SINGLE_SIDE",
    25: "TYPE_40_TRACKS_SINGLE_SIDE",
  });

  function TrDosImage(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  TrDosImage.prototype._read = function() {
    this.files = [];
    var i = 0;
    do {
      var _ = new File(this._io, this, this._root);
      this.files.push(_);
      i++;
    } while (!(_.isTerminator));
  }

  var VolumeInfo = TrDosImage.VolumeInfo = (function() {
    function VolumeInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    VolumeInfo.prototype._read = function() {
      this.catalogEnd = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.catalogEnd, [0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0], this.catalogEnd, this._io, "/types/volume_info/seq/0");
      }
      this.unused = this._io.readBytes(224);
      this.firstFreeSectorSector = this._io.readU1();
      this.firstFreeSectorTrack = this._io.readU1();
      this.diskType = this._io.readU1();
      this.numFiles = this._io.readU1();
      this.numFreeSectors = this._io.readU2le();
      this.trDosId = this._io.readBytes(1);
      if (!((KaitaiStream.byteArrayCompare(this.trDosId, [16]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([16], this.trDosId, this._io, "/types/volume_info/seq/7");
      }
      this.unused2 = this._io.readBytes(2);
      this.password = this._io.readBytes(9);
      this.unused3 = this._io.readBytes(1);
      this.numDeletedFiles = this._io.readU1();
      this.label = this._io.readBytes(8);
      this.unused4 = this._io.readBytes(3);
    }
    Object.defineProperty(VolumeInfo.prototype, 'numTracks', {
      get: function() {
        if (this._m_numTracks !== undefined)
          return this._m_numTracks;
        this._m_numTracks = ((this.diskType & 1) != 0 ? 40 : 80);
        return this._m_numTracks;
      }
    });
    Object.defineProperty(VolumeInfo.prototype, 'numSides', {
      get: function() {
        if (this._m_numSides !== undefined)
          return this._m_numSides;
        this._m_numSides = ((this.diskType & 8) != 0 ? 1 : 2);
        return this._m_numSides;
      }
    });

    /**
     * track number is logical, for double-sided disks it's
     * (physical_track << 1) | side, the same way that tracks are stored
     * sequentially in .trd file
     */

    /**
     * Number of non-deleted files. Directory can have more than
     * number_of_files entries due to deleted files
     */

    return VolumeInfo;
  })();

  var PositionAndLengthCode = TrDosImage.PositionAndLengthCode = (function() {
    function PositionAndLengthCode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PositionAndLengthCode.prototype._read = function() {
      this.startAddress = this._io.readU2le();
      this.length = this._io.readU2le();
    }

    /**
     * Default memory address to load this byte array into
     */

    return PositionAndLengthCode;
  })();

  var Filename = TrDosImage.Filename = (function() {
    function Filename(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Filename.prototype._read = function() {
      this.name = this._io.readBytes(8);
    }
    Object.defineProperty(Filename.prototype, 'firstByte', {
      get: function() {
        if (this._m_firstByte !== undefined)
          return this._m_firstByte;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_firstByte = this._io.readU1();
        this._io.seek(_pos);
        return this._m_firstByte;
      }
    });

    return Filename;
  })();

  var PositionAndLengthPrint = TrDosImage.PositionAndLengthPrint = (function() {
    function PositionAndLengthPrint(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PositionAndLengthPrint.prototype._read = function() {
      this.extentNo = this._io.readU1();
      this.reserved = this._io.readU1();
      this.length = this._io.readU2le();
    }

    return PositionAndLengthPrint;
  })();

  var PositionAndLengthGeneric = TrDosImage.PositionAndLengthGeneric = (function() {
    function PositionAndLengthGeneric(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PositionAndLengthGeneric.prototype._read = function() {
      this.reserved = this._io.readU2le();
      this.length = this._io.readU2le();
    }

    return PositionAndLengthGeneric;
  })();

  var PositionAndLengthBasic = TrDosImage.PositionAndLengthBasic = (function() {
    function PositionAndLengthBasic(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PositionAndLengthBasic.prototype._read = function() {
      this.programAndDataLength = this._io.readU2le();
      this.programLength = this._io.readU2le();
    }

    return PositionAndLengthBasic;
  })();

  var File = TrDosImage.File = (function() {
    function File(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    File.prototype._read = function() {
      this._raw_name = this._io.readBytes(8);
      var _io__raw_name = new KaitaiStream(this._raw_name);
      this.name = new Filename(_io__raw_name, this, this._root);
      this.extension = this._io.readU1();
      switch (this.extension) {
      case 66:
        this.positionAndLength = new PositionAndLengthBasic(this._io, this, this._root);
        break;
      case 67:
        this.positionAndLength = new PositionAndLengthCode(this._io, this, this._root);
        break;
      case 35:
        this.positionAndLength = new PositionAndLengthPrint(this._io, this, this._root);
        break;
      default:
        this.positionAndLength = new PositionAndLengthGeneric(this._io, this, this._root);
        break;
      }
      this.lengthSectors = this._io.readU1();
      this.startingSector = this._io.readU1();
      this.startingTrack = this._io.readU1();
    }
    Object.defineProperty(File.prototype, 'isDeleted', {
      get: function() {
        if (this._m_isDeleted !== undefined)
          return this._m_isDeleted;
        this._m_isDeleted = this.name.firstByte == 1;
        return this._m_isDeleted;
      }
    });
    Object.defineProperty(File.prototype, 'isTerminator', {
      get: function() {
        if (this._m_isTerminator !== undefined)
          return this._m_isTerminator;
        this._m_isTerminator = this.name.firstByte == 0;
        return this._m_isTerminator;
      }
    });
    Object.defineProperty(File.prototype, 'contents', {
      get: function() {
        if (this._m_contents !== undefined)
          return this._m_contents;
        var _pos = this._io.pos;
        this._io.seek((((this.startingTrack * 256) * 16) + (this.startingSector * 256)));
        this._m_contents = this._io.readBytes((this.lengthSectors * 256));
        this._io.seek(_pos);
        return this._m_contents;
      }
    });

    return File;
  })();
  Object.defineProperty(TrDosImage.prototype, 'volumeInfo', {
    get: function() {
      if (this._m_volumeInfo !== undefined)
        return this._m_volumeInfo;
      var _pos = this._io.pos;
      this._io.seek(2048);
      this._m_volumeInfo = new VolumeInfo(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_volumeInfo;
    }
  });

  return TrDosImage;
})();
return TrDosImage;
}));
