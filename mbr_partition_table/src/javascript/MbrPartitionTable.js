// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MbrPartitionTable = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * MBR (Master Boot Record) partition table is a traditional way of
 * MS-DOS to partition larger hard disc drives into distinct
 * partitions.
 * 
 * This table is stored in the end of the boot sector (first sector) of
 * the drive, after the bootstrap code. Original DOS 2.0 specification
 * allowed only 4 partitions per disc, but DOS 3.2 introduced concept
 * of "extended partitions", which work as nested extra "boot records"
 * which are pointed to by original ("primary") partitions in MBR.
 */

var MbrPartitionTable = (function() {
  function MbrPartitionTable(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MbrPartitionTable.prototype._read = function() {
    this.bootstrapCode = this._io.readBytes(446);
    this.partitions = new Array(4);
    for (var i = 0; i < 4; i++) {
      this.partitions[i] = new PartitionEntry(this._io, this, this._root);
    }
    this.bootSignature = this._io.ensureFixedContents([85, 170]);
  }

  var PartitionEntry = MbrPartitionTable.PartitionEntry = (function() {
    function PartitionEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PartitionEntry.prototype._read = function() {
      this.status = this._io.readU1();
      this.chsStart = new Chs(this._io, this, this._root);
      this.partitionType = this._io.readU1();
      this.chsEnd = new Chs(this._io, this, this._root);
      this.lbaStart = this._io.readU4le();
      this.numSectors = this._io.readU4le();
    }

    return PartitionEntry;
  })();

  var Chs = MbrPartitionTable.Chs = (function() {
    function Chs(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chs.prototype._read = function() {
      this.head = this._io.readU1();
      this.b2 = this._io.readU1();
      this.b3 = this._io.readU1();
    }
    Object.defineProperty(Chs.prototype, 'sector', {
      get: function() {
        if (this._m_sector !== undefined)
          return this._m_sector;
        this._m_sector = (this.b2 & 63);
        return this._m_sector;
      }
    });
    Object.defineProperty(Chs.prototype, 'cylinder', {
      get: function() {
        if (this._m_cylinder !== undefined)
          return this._m_cylinder;
        this._m_cylinder = (this.b3 + ((this.b2 & 192) << 2));
        return this._m_cylinder;
      }
    });

    return Chs;
  })();

  return MbrPartitionTable;
})();
return MbrPartitionTable;
}));
