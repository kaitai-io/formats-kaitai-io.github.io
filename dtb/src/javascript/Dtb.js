// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Dtb || (root.Dtb = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Dtb_, KaitaiStream) {
/**
 * Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
 * of data (primarily devicetree data, although other data is possible as well).
 * The data is internally stored as a tree of named nodes and properties. Nodes
 * contain properties and child nodes, while properties are name-value pairs.
 * 
 * The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
 * files (`.dts`) through the Devicetree compiler (DTC).
 * 
 * On Linux systems that support this, the blobs can be accessed in
 * `/sys/firmware/fdt`:
 * 
 * * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
 * 
 * The encoding of strings used in the `strings_block` and `structure_block` is
 * actually a subset of ASCII:
 * 
 * <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
 * 
 * Example files:
 * 
 * * <https://github.com/qemu/qemu/tree/master/pc-bios>
 * @see {@link https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html|Source}
 * @see {@link https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf|Source}
 */

var Dtb = (function() {
  Dtb.Fdt = Object.freeze({
    BEGIN_NODE: 1,
    END_NODE: 2,
    PROP: 3,
    NOP: 4,
    END: 9,

    1: "BEGIN_NODE",
    2: "END_NODE",
    3: "PROP",
    4: "NOP",
    9: "END",
  });

  function Dtb(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dtb.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([208, 13, 254, 237])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([208, 13, 254, 237]), this.magic, this._io, "/seq/0");
    }
    this.totalSize = this._io.readU4be();
    this.ofsStructureBlock = this._io.readU4be();
    this.ofsStringsBlock = this._io.readU4be();
    this.ofsMemoryReservationBlock = this._io.readU4be();
    this.version = this._io.readU4be();
    this.minCompatibleVersion = this._io.readU4be();
    if (!(this.minCompatibleVersion <= this.version)) {
      throw new KaitaiStream.ValidationGreaterThanError(this.version, this.minCompatibleVersion, this._io, "/seq/6");
    }
    this.bootCpuidPhys = this._io.readU4be();
    this.lenStringsBlock = this._io.readU4be();
    this.lenStructureBlock = this._io.readU4be();
  }

  var FdtBeginNode = Dtb.FdtBeginNode = (function() {
    function FdtBeginNode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FdtBeginNode.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII");
      this.padding = this._io.readBytes(KaitaiStream.mod(-(this._io.pos), 4));
    }

    return FdtBeginNode;
  })();

  var FdtBlock = Dtb.FdtBlock = (function() {
    function FdtBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FdtBlock.prototype._read = function() {
      this.nodes = [];
      var i = 0;
      do {
        var _ = new FdtNode(this._io, this, this._root);
        this.nodes.push(_);
        i++;
      } while (!(_.type == Dtb.Fdt.END));
    }

    return FdtBlock;
  })();

  var FdtNode = Dtb.FdtNode = (function() {
    function FdtNode(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FdtNode.prototype._read = function() {
      this.type = this._io.readU4be();
      switch (this.type) {
      case Dtb.Fdt.BEGIN_NODE:
        this.body = new FdtBeginNode(this._io, this, this._root);
        break;
      case Dtb.Fdt.PROP:
        this.body = new FdtProp(this._io, this, this._root);
        break;
      }
    }

    return FdtNode;
  })();

  var FdtProp = Dtb.FdtProp = (function() {
    function FdtProp(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    FdtProp.prototype._read = function() {
      this.lenProperty = this._io.readU4be();
      this.ofsName = this._io.readU4be();
      this.property = this._io.readBytes(this.lenProperty);
      this.padding = this._io.readBytes(KaitaiStream.mod(-(this._io.pos), 4));
    }
    Object.defineProperty(FdtProp.prototype, 'name', {
      get: function() {
        if (this._m_name !== undefined)
          return this._m_name;
        var io = this._root.stringsBlock._io;
        var _pos = io.pos;
        io.seek(this.ofsName);
        this._m_name = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, true), "ASCII");
        io.seek(_pos);
        return this._m_name;
      }
    });

    return FdtProp;
  })();

  var MemoryBlock = Dtb.MemoryBlock = (function() {
    function MemoryBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MemoryBlock.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new MemoryBlockEntry(this._io, this, this._root));
        i++;
      }
    }

    return MemoryBlock;
  })();

  var MemoryBlockEntry = Dtb.MemoryBlockEntry = (function() {
    function MemoryBlockEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MemoryBlockEntry.prototype._read = function() {
      this.address = this._io.readU8be();
      this.size = this._io.readU8be();
    }

    /**
     * physical address of a reserved memory region
     */

    /**
     * size of a reserved memory region
     */

    return MemoryBlockEntry;
  })();

  var Strings = Dtb.Strings = (function() {
    function Strings(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Strings.prototype._read = function() {
      this.strings = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.strings.push(KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, true), "ASCII"));
        i++;
      }
    }

    return Strings;
  })();
  Object.defineProperty(Dtb.prototype, 'memoryReservationBlock', {
    get: function() {
      if (this._m_memoryReservationBlock !== undefined)
        return this._m_memoryReservationBlock;
      var _pos = this._io.pos;
      this._io.seek(this.ofsMemoryReservationBlock);
      this._raw__m_memoryReservationBlock = this._io.readBytes(this.ofsStructureBlock - this.ofsMemoryReservationBlock);
      var _io__raw__m_memoryReservationBlock = new KaitaiStream(this._raw__m_memoryReservationBlock);
      this._m_memoryReservationBlock = new MemoryBlock(_io__raw__m_memoryReservationBlock, this, this._root);
      this._io.seek(_pos);
      return this._m_memoryReservationBlock;
    }
  });
  Object.defineProperty(Dtb.prototype, 'stringsBlock', {
    get: function() {
      if (this._m_stringsBlock !== undefined)
        return this._m_stringsBlock;
      var _pos = this._io.pos;
      this._io.seek(this.ofsStringsBlock);
      this._raw__m_stringsBlock = this._io.readBytes(this.lenStringsBlock);
      var _io__raw__m_stringsBlock = new KaitaiStream(this._raw__m_stringsBlock);
      this._m_stringsBlock = new Strings(_io__raw__m_stringsBlock, this, this._root);
      this._io.seek(_pos);
      return this._m_stringsBlock;
    }
  });
  Object.defineProperty(Dtb.prototype, 'structureBlock', {
    get: function() {
      if (this._m_structureBlock !== undefined)
        return this._m_structureBlock;
      var _pos = this._io.pos;
      this._io.seek(this.ofsStructureBlock);
      this._raw__m_structureBlock = this._io.readBytes(this.lenStructureBlock);
      var _io__raw__m_structureBlock = new KaitaiStream(this._raw__m_structureBlock);
      this._m_structureBlock = new FdtBlock(_io__raw__m_structureBlock, this, this._root);
      this._io.seek(_pos);
      return this._m_structureBlock;
    }
  });

  return Dtb;
})();
Dtb_.Dtb = Dtb;
});
