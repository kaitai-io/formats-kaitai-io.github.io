// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DoomWad = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var DoomWad = (function() {
  function DoomWad(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DoomWad.prototype._read = function() {
    this.magic = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
    this.numIndexEntries = this._io.readS4le();
    this.indexOffset = this._io.readS4le();
  }

  var Sectors = DoomWad.Sectors = (function() {
    function Sectors(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Sectors.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Sector(this._io, this, this._root));
        i++;
      }
    }

    return Sectors;
  })();

  var Vertex = DoomWad.Vertex = (function() {
    function Vertex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Vertex.prototype._read = function() {
      this.x = this._io.readS2le();
      this.y = this._io.readS2le();
    }

    return Vertex;
  })();

  /**
   * Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
   * combine wall patches to make wall textures. This essentially
   * provides a very simple form of image compression, allowing
   * certain elements ("patches") to be reused / recombined on
   * different textures for more variety in the game.
   * @see {@link https://doom.fandom.com/wiki/TEXTURE1_and_TEXTURE2|Source}
   */

  var Texture12 = DoomWad.Texture12 = (function() {
    function Texture12(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Texture12.prototype._read = function() {
      this.numTextures = this._io.readS4le();
      this.textures = [];
      for (var i = 0; i < this.numTextures; i++) {
        this.textures.push(new TextureIndex(this._io, this, this._root));
      }
    }

    var TextureIndex = Texture12.TextureIndex = (function() {
      function TextureIndex(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      TextureIndex.prototype._read = function() {
        this.offset = this._io.readS4le();
      }
      Object.defineProperty(TextureIndex.prototype, 'body', {
        get: function() {
          if (this._m_body !== undefined)
            return this._m_body;
          var _pos = this._io.pos;
          this._io.seek(this.offset);
          this._m_body = new TextureBody(this._io, this, this._root);
          this._io.seek(_pos);
          return this._m_body;
        }
      });

      return TextureIndex;
    })();

    var TextureBody = Texture12.TextureBody = (function() {
      function TextureBody(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      TextureBody.prototype._read = function() {
        this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 0), "ASCII");
        this.masked = this._io.readU4le();
        this.width = this._io.readU2le();
        this.height = this._io.readU2le();
        this.columnDirectory = this._io.readU4le();
        this.numPatches = this._io.readU2le();
        this.patches = [];
        for (var i = 0; i < this.numPatches; i++) {
          this.patches.push(new Patch(this._io, this, this._root));
        }
      }

      /**
       * Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
       */

      /**
       * Obsolete, ignored by all DOOM versions
       */

      /**
       * Number of patches that are used in a texture
       */

      return TextureBody;
    })();

    var Patch = Texture12.Patch = (function() {
      function Patch(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Patch.prototype._read = function() {
        this.originX = this._io.readS2le();
        this.originY = this._io.readS2le();
        this.patchId = this._io.readU2le();
        this.stepDir = this._io.readU2le();
        this.colormap = this._io.readU2le();
      }

      /**
       * X offset to draw a patch at (pixels from left boundary of a texture)
       */

      /**
       * Y offset to draw a patch at (pixels from upper boundary of a texture)
       */

      /**
       * Identifier of a patch (as listed in PNAMES lump) to draw
       */

      return Patch;
    })();

    /**
     * Number of wall textures
     */

    return Texture12;
  })();

  var Linedef = DoomWad.Linedef = (function() {
    function Linedef(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Linedef.prototype._read = function() {
      this.vertexStartIdx = this._io.readU2le();
      this.vertexEndIdx = this._io.readU2le();
      this.flags = this._io.readU2le();
      this.lineType = this._io.readU2le();
      this.sectorTag = this._io.readU2le();
      this.sidedefRightIdx = this._io.readU2le();
      this.sidedefLeftIdx = this._io.readU2le();
    }

    return Linedef;
  })();

  /**
   * @see {@link https://doom.fandom.com/wiki/PNAMES|Source}
   */

  var Pnames = DoomWad.Pnames = (function() {
    function Pnames(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Pnames.prototype._read = function() {
      this.numPatches = this._io.readU4le();
      this.names = [];
      for (var i = 0; i < this.numPatches; i++) {
        this.names.push(KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 0), "ASCII"));
      }
    }

    /**
     * Number of patches registered in this global game directory
     */

    return Pnames;
  })();

  var Thing = DoomWad.Thing = (function() {
    function Thing(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Thing.prototype._read = function() {
      this.x = this._io.readS2le();
      this.y = this._io.readS2le();
      this.angle = this._io.readU2le();
      this.type = this._io.readU2le();
      this.flags = this._io.readU2le();
    }

    return Thing;
  })();

  var Sector = DoomWad.Sector = (function() {
    Sector.SpecialSector = Object.freeze({
      NORMAL: 0,
      D_LIGHT_FLICKER: 1,
      D_LIGHT_STROBE_FAST: 2,
      D_LIGHT_STROBE_SLOW: 3,
      D_LIGHT_STROBE_HURT: 4,
      D_DAMAGE_HELLSLIME: 5,
      D_DAMAGE_NUKAGE: 7,
      D_LIGHT_GLOW: 8,
      SECRET: 9,
      D_SECTOR_DOOR_CLOSE_IN_30: 10,
      D_DAMAGE_END: 11,
      D_LIGHT_STROBE_SLOW_SYNC: 12,
      D_LIGHT_STROBE_FAST_SYNC: 13,
      D_SECTOR_DOOR_RAISE_IN_5_MINS: 14,
      D_FRICTION_LOW: 15,
      D_DAMAGE_SUPER_HELLSLIME: 16,
      D_LIGHT_FIRE_FLICKER: 17,
      D_DAMAGE_LAVA_WIMPY: 18,
      D_DAMAGE_LAVA_HEFTY: 19,
      D_SCROLL_EAST_LAVA_DAMAGE: 20,
      LIGHT_PHASED: 21,
      LIGHT_SEQUENCE_START: 22,
      LIGHT_SEQUENCE_SPECIAL1: 23,
      LIGHT_SEQUENCE_SPECIAL2: 24,

      0: "NORMAL",
      1: "D_LIGHT_FLICKER",
      2: "D_LIGHT_STROBE_FAST",
      3: "D_LIGHT_STROBE_SLOW",
      4: "D_LIGHT_STROBE_HURT",
      5: "D_DAMAGE_HELLSLIME",
      7: "D_DAMAGE_NUKAGE",
      8: "D_LIGHT_GLOW",
      9: "SECRET",
      10: "D_SECTOR_DOOR_CLOSE_IN_30",
      11: "D_DAMAGE_END",
      12: "D_LIGHT_STROBE_SLOW_SYNC",
      13: "D_LIGHT_STROBE_FAST_SYNC",
      14: "D_SECTOR_DOOR_RAISE_IN_5_MINS",
      15: "D_FRICTION_LOW",
      16: "D_DAMAGE_SUPER_HELLSLIME",
      17: "D_LIGHT_FIRE_FLICKER",
      18: "D_DAMAGE_LAVA_WIMPY",
      19: "D_DAMAGE_LAVA_HEFTY",
      20: "D_SCROLL_EAST_LAVA_DAMAGE",
      21: "LIGHT_PHASED",
      22: "LIGHT_SEQUENCE_START",
      23: "LIGHT_SEQUENCE_SPECIAL1",
      24: "LIGHT_SEQUENCE_SPECIAL2",
    });

    function Sector(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Sector.prototype._read = function() {
      this.floorZ = this._io.readS2le();
      this.ceilZ = this._io.readS2le();
      this.floorFlat = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      this.ceilFlat = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      this.light = this._io.readS2le();
      this.specialType = this._io.readU2le();
      this.tag = this._io.readU2le();
    }

    /**
     * Light level of the sector [0..255]. Original engine uses
     * COLORMAP to render lighting, so only 32 actual levels are
     * available (i.e. 0..7, 8..15, etc).
     */

    /**
     * Tag number. When the linedef with the same tag number is
     * activated, some effect will be triggered in this sector.
     */

    return Sector;
  })();

  var Vertexes = DoomWad.Vertexes = (function() {
    function Vertexes(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Vertexes.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Vertex(this._io, this, this._root));
        i++;
      }
    }

    return Vertexes;
  })();

  var Sidedef = DoomWad.Sidedef = (function() {
    function Sidedef(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Sidedef.prototype._read = function() {
      this.offsetX = this._io.readS2le();
      this.offsetY = this._io.readS2le();
      this.upperTextureName = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      this.lowerTextureName = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      this.normalTextureName = KaitaiStream.bytesToStr(this._io.readBytes(8), "ASCII");
      this.sectorId = this._io.readS2le();
    }

    return Sidedef;
  })();

  var Things = DoomWad.Things = (function() {
    function Things(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Things.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Thing(this._io, this, this._root));
        i++;
      }
    }

    return Things;
  })();

  var Linedefs = DoomWad.Linedefs = (function() {
    function Linedefs(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Linedefs.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Linedef(this._io, this, this._root));
        i++;
      }
    }

    return Linedefs;
  })();

  var IndexEntry = DoomWad.IndexEntry = (function() {
    function IndexEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    IndexEntry.prototype._read = function() {
      this.offset = this._io.readS4le();
      this.size = this._io.readS4le();
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 0), "ASCII");
    }
    Object.defineProperty(IndexEntry.prototype, 'contents', {
      get: function() {
        if (this._m_contents !== undefined)
          return this._m_contents;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.offset);
        switch (this.name) {
        case "SECTORS":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Sectors(_io__raw__m_contents, this, this._root);
          break;
        case "TEXTURE1":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Texture12(_io__raw__m_contents, this, this._root);
          break;
        case "VERTEXES":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Vertexes(_io__raw__m_contents, this, this._root);
          break;
        case "BLOCKMAP":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Blockmap(_io__raw__m_contents, this, this._root);
          break;
        case "PNAMES":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Pnames(_io__raw__m_contents, this, this._root);
          break;
        case "TEXTURE2":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Texture12(_io__raw__m_contents, this, this._root);
          break;
        case "THINGS":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Things(_io__raw__m_contents, this, this._root);
          break;
        case "LINEDEFS":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Linedefs(_io__raw__m_contents, this, this._root);
          break;
        case "SIDEDEFS":
          this._raw__m_contents = io.readBytes(this.size);
          var _io__raw__m_contents = new KaitaiStream(this._raw__m_contents);
          this._m_contents = new Sidedefs(_io__raw__m_contents, this, this._root);
          break;
        default:
          this._m_contents = io.readBytes(this.size);
          break;
        }
        io.seek(_pos);
        return this._m_contents;
      }
    });

    return IndexEntry;
  })();

  var Sidedefs = DoomWad.Sidedefs = (function() {
    function Sidedefs(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Sidedefs.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new Sidedef(this._io, this, this._root));
        i++;
      }
    }

    return Sidedefs;
  })();

  var Blockmap = DoomWad.Blockmap = (function() {
    function Blockmap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Blockmap.prototype._read = function() {
      this.originX = this._io.readS2le();
      this.originY = this._io.readS2le();
      this.numCols = this._io.readS2le();
      this.numRows = this._io.readS2le();
      this.linedefsInBlock = [];
      for (var i = 0; i < (this.numCols * this.numRows); i++) {
        this.linedefsInBlock.push(new Blocklist(this._io, this, this._root));
      }
    }

    var Blocklist = Blockmap.Blocklist = (function() {
      function Blocklist(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Blocklist.prototype._read = function() {
        this.offset = this._io.readU2le();
      }

      /**
       * List of linedefs found in this block
       */
      Object.defineProperty(Blocklist.prototype, 'linedefs', {
        get: function() {
          if (this._m_linedefs !== undefined)
            return this._m_linedefs;
          var _pos = this._io.pos;
          this._io.seek((this.offset * 2));
          this._m_linedefs = [];
          var i = 0;
          do {
            var _ = this._io.readS2le();
            this._m_linedefs.push(_);
            i++;
          } while (!(_ == -1));
          this._io.seek(_pos);
          return this._m_linedefs;
        }
      });

      /**
       * Offset to the list of linedefs
       */

      return Blocklist;
    })();

    /**
     * Grid origin, X coord
     */

    /**
     * Grid origin, Y coord
     */

    /**
     * Number of columns
     */

    /**
     * Number of rows
     */

    /**
     * Lists of linedefs for every block
     */

    return Blockmap;
  })();
  Object.defineProperty(DoomWad.prototype, 'index', {
    get: function() {
      if (this._m_index !== undefined)
        return this._m_index;
      var _pos = this._io.pos;
      this._io.seek(this.indexOffset);
      this._m_index = [];
      for (var i = 0; i < this.numIndexEntries; i++) {
        this._m_index.push(new IndexEntry(this._io, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_index;
    }
  });

  /**
   * Number of entries in the lump index
   */

  /**
   * Offset to the start of the index
   */

  return DoomWad;
})();
return DoomWad;
}));
