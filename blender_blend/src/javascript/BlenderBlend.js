// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.BlenderBlend = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Blender is an open source suite for 3D modelling, sculpting,
 * animation, compositing, rendering, preparation of assets for its own
 * game engine and exporting to others, etc. `.blend` is its own binary
 * format that saves whole state of suite: current scene, animations,
 * all software settings, extensions, etc.
 * 
 * Internally, .blend format is a hybrid semi-self-descriptive
 * format. On top level, it contains a simple header and a sequence of
 * file blocks, which more or less follow typical [TLV
 * pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
 * block would be a structure with code `DNA1`, which is a essentially
 * a machine-readable schema of all other structures used in this file.
 */

var BlenderBlend = (function() {
  BlenderBlend.PtrSize = Object.freeze({
    BITS_64: 45,
    BITS_32: 95,

    45: "BITS_64",
    95: "BITS_32",
  });

  BlenderBlend.Endian = Object.freeze({
    BE: 86,
    LE: 118,

    86: "BE",
    118: "LE",
  });

  function BlenderBlend(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  BlenderBlend.prototype._read = function() {
    this.hdr = new Header(this._io, this, this._root);
    this.blocks = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.blocks.push(new FileBlock(this._io, this, this._root));
      i++;
    }
  }

  /**
   * DNA struct contains a `type` (type name), which is specified as
   * an index in types table, and sequence of fields.
   */

  var DnaStruct = BlenderBlend.DnaStruct = (function() {
    function DnaStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DnaStruct.prototype._read = function() {
      this.idxType = this._io.readU2le();
      this.numFields = this._io.readU2le();
      this.fields = new Array(this.numFields);
      for (var i = 0; i < this.numFields; i++) {
        this.fields[i] = new DnaField(this._io, this, this._root);
      }
    }
    Object.defineProperty(DnaStruct.prototype, 'type', {
      get: function() {
        if (this._m_type !== undefined)
          return this._m_type;
        this._m_type = this._parent.types[this.idxType];
        return this._m_type;
      }
    });

    return DnaStruct;
  })();

  var FileBlock = BlenderBlend.FileBlock = (function() {
    function FileBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileBlock.prototype._read = function() {
      this.code = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.lenBody = this._io.readU4le();
      this.memAddr = this._io.readBytes(this._root.hdr.psize);
      this.sdnaIndex = this._io.readU4le();
      this.count = this._io.readU4le();
      switch (this.code) {
      case "DNA1":
        this._raw_body = this._io.readBytes(this.lenBody);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new Dna1Body(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.lenBody);
        break;
      }
    }
    Object.defineProperty(FileBlock.prototype, 'sdnaStruct', {
      get: function() {
        if (this._m_sdnaStruct !== undefined)
          return this._m_sdnaStruct;
        if (this.sdnaIndex != 0) {
          this._m_sdnaStruct = this._root.sdnaStructs[this.sdnaIndex];
        }
        return this._m_sdnaStruct;
      }
    });

    /**
     * Identifier of the file block
     */

    /**
     * Total length of the data after the header of file block
     */

    /**
     * Memory address the structure was located when written to disk
     */

    /**
     * Index of the SDNA structure
     */

    /**
     * Number of structure located in this file-block
     */

    return FileBlock;
  })();

  /**
   * DNA1, also known as "Structure DNA", is a special block in
   * .blend file, which contains machine-readable specifications of
   * all other structures used in this .blend file.
   * 
   * Effectively, this block contains:
   * 
   * * a sequence of "names" (strings which represent field names)
   * * a sequence of "types" (strings which represent type name)
   * * a sequence of "type lengths"
   * * a sequence of "structs" (which describe contents of every
   *   structure, referring to types and names by index)
   * @see {@link https://en.blender.org/index.php/Dev:Source/Architecture/File_Format#Structure_DNA|Source}
   */

  var Dna1Body = BlenderBlend.Dna1Body = (function() {
    function Dna1Body(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Dna1Body.prototype._read = function() {
      this.id = this._io.ensureFixedContents([83, 68, 78, 65]);
      this.nameMagic = this._io.ensureFixedContents([78, 65, 77, 69]);
      this.numNames = this._io.readU4le();
      this.names = new Array(this.numNames);
      for (var i = 0; i < this.numNames; i++) {
        this.names[i] = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
      }
      this.padding1 = this._io.readBytes(KaitaiStream.mod((4 - this._io.pos), 4));
      this.typeMagic = this._io.ensureFixedContents([84, 89, 80, 69]);
      this.numTypes = this._io.readU4le();
      this.types = new Array(this.numTypes);
      for (var i = 0; i < this.numTypes; i++) {
        this.types[i] = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "UTF-8");
      }
      this.padding2 = this._io.readBytes(KaitaiStream.mod((4 - this._io.pos), 4));
      this.tlenMagic = this._io.ensureFixedContents([84, 76, 69, 78]);
      this.lengths = new Array(this.numTypes);
      for (var i = 0; i < this.numTypes; i++) {
        this.lengths[i] = this._io.readU2le();
      }
      this.padding3 = this._io.readBytes(KaitaiStream.mod((4 - this._io.pos), 4));
      this.strcMagic = this._io.ensureFixedContents([83, 84, 82, 67]);
      this.numStructs = this._io.readU4le();
      this.structs = new Array(this.numStructs);
      for (var i = 0; i < this.numStructs; i++) {
        this.structs[i] = new DnaStruct(this._io, this, this._root);
      }
    }

    return Dna1Body;
  })();

  var Header = BlenderBlend.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([66, 76, 69, 78, 68, 69, 82]);
      this.ptrSizeId = this._io.readU1();
      this.endian = this._io.readU1();
      this.version = KaitaiStream.bytesToStr(this._io.readBytes(3), "ASCII");
    }

    /**
     * Number of bytes that a pointer occupies
     */
    Object.defineProperty(Header.prototype, 'psize', {
      get: function() {
        if (this._m_psize !== undefined)
          return this._m_psize;
        this._m_psize = (this.ptrSizeId == BlenderBlend.PtrSize.BITS_64 ? 8 : 4);
        return this._m_psize;
      }
    });

    /**
     * Size of a pointer; all pointers in the file are stored in this format
     */

    /**
     * Type of byte ordering used
     */

    /**
     * Blender version used to save this file
     */

    return Header;
  })();

  var DnaField = BlenderBlend.DnaField = (function() {
    function DnaField(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DnaField.prototype._read = function() {
      this.idxType = this._io.readU2le();
      this.idxName = this._io.readU2le();
    }
    Object.defineProperty(DnaField.prototype, 'type', {
      get: function() {
        if (this._m_type !== undefined)
          return this._m_type;
        this._m_type = this._parent._parent.types[this.idxType];
        return this._m_type;
      }
    });
    Object.defineProperty(DnaField.prototype, 'name', {
      get: function() {
        if (this._m_name !== undefined)
          return this._m_name;
        this._m_name = this._parent._parent.names[this.idxName];
        return this._m_name;
      }
    });

    return DnaField;
  })();
  Object.defineProperty(BlenderBlend.prototype, 'sdnaStructs', {
    get: function() {
      if (this._m_sdnaStructs !== undefined)
        return this._m_sdnaStructs;
      this._m_sdnaStructs = this.blocks[(this.blocks.length - 2)].body.structs;
      return this._m_sdnaStructs;
    }
  });

  return BlenderBlend;
})();
return BlenderBlend;
}));
