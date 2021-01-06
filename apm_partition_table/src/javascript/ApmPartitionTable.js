// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.ApmPartitionTable = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://en.wikipedia.org/wiki/Apple_Partition_Map|Source}
 */

var ApmPartitionTable = (function() {
  function ApmPartitionTable(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  ApmPartitionTable.prototype._read = function() {
  }

  var PartitionEntry = ApmPartitionTable.PartitionEntry = (function() {
    function PartitionEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PartitionEntry.prototype._read = function() {
      this.magic = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [80, 77]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([80, 77], this.magic, this._io, "/types/partition_entry/seq/0");
      }
      this.reserved1 = this._io.readBytes(2);
      this.numberOfPartitions = this._io.readU4be();
      this.partitionStart = this._io.readU4be();
      this.partitionSize = this._io.readU4be();
      this.partitionName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(32), 0, false), "ascii");
      this.partitionType = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(32), 0, false), "ascii");
      this.dataStart = this._io.readU4be();
      this.dataSize = this._io.readU4be();
      this.partitionStatus = this._io.readU4be();
      this.bootCodeStart = this._io.readU4be();
      this.bootCodeSize = this._io.readU4be();
      this.bootLoaderAddress = this._io.readU4be();
      this.reserved2 = this._io.readBytes(4);
      this.bootCodeEntry = this._io.readU4be();
      this.reserved3 = this._io.readBytes(4);
      this.bootCodeCksum = this._io.readU4be();
      this.processorType = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(16), 0, false), "ascii");
    }
    Object.defineProperty(PartitionEntry.prototype, 'partition', {
      get: function() {
        if (this._m_partition !== undefined)
          return this._m_partition;
        if ((this.partitionStatus & 1) != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((this.partitionStart * this._root.sectorSize));
          this._m_partition = io.readBytes((this.partitionSize * this._root.sectorSize));
          io.seek(_pos);
        }
        return this._m_partition;
      }
    });
    Object.defineProperty(PartitionEntry.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek((this.dataStart * this._root.sectorSize));
        this._m_data = io.readBytes((this.dataSize * this._root.sectorSize));
        io.seek(_pos);
        return this._m_data;
      }
    });
    Object.defineProperty(PartitionEntry.prototype, 'bootCode', {
      get: function() {
        if (this._m_bootCode !== undefined)
          return this._m_bootCode;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek((this.bootCodeStart * this._root.sectorSize));
        this._m_bootCode = io.readBytes(this.bootCodeSize);
        io.seek(_pos);
        return this._m_bootCode;
      }
    });

    /**
     * First sector
     */

    /**
     * Number of sectors
     */

    /**
     * First sector
     */

    /**
     * Number of sectors
     */

    /**
     * First sector
     */

    /**
     * Number of bytes
     */

    /**
     * Address of bootloader code
     */

    /**
     * Boot code entry point
     */

    /**
     * Boot code checksum
     */

    return PartitionEntry;
  })();

  /**
   * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
   * 0x800 (2048) bytes for CDROM
   */
  Object.defineProperty(ApmPartitionTable.prototype, 'sectorSize', {
    get: function() {
      if (this._m_sectorSize !== undefined)
        return this._m_sectorSize;
      this._m_sectorSize = 512;
      return this._m_sectorSize;
    }
  });

  /**
   * Every partition entry contains the number of partition entries.
   * We parse the first entry, to know how many to parse, including the first one.
   * No logic is given what to do if other entries have a different number.
   */
  Object.defineProperty(ApmPartitionTable.prototype, 'partitionLookup', {
    get: function() {
      if (this._m_partitionLookup !== undefined)
        return this._m_partitionLookup;
      var io = this._root._io;
      var _pos = io.pos;
      io.seek(this._root.sectorSize);
      this._raw__m_partitionLookup = io.readBytes(this.sectorSize);
      var _io__raw__m_partitionLookup = new KaitaiStream(this._raw__m_partitionLookup);
      this._m_partitionLookup = new PartitionEntry(_io__raw__m_partitionLookup, this, this._root);
      io.seek(_pos);
      return this._m_partitionLookup;
    }
  });
  Object.defineProperty(ApmPartitionTable.prototype, 'partitionEntries', {
    get: function() {
      if (this._m_partitionEntries !== undefined)
        return this._m_partitionEntries;
      var io = this._root._io;
      var _pos = io.pos;
      io.seek(this._root.sectorSize);
      this._raw__m_partitionEntries = new Array(this._root.partitionLookup.numberOfPartitions);
      this._m_partitionEntries = new Array(this._root.partitionLookup.numberOfPartitions);
      for (var i = 0; i < this._root.partitionLookup.numberOfPartitions; i++) {
        this._raw__m_partitionEntries[i] = io.readBytes(this.sectorSize);
        var _io__raw__m_partitionEntries = new KaitaiStream(this._raw__m_partitionEntries[i]);
        this._m_partitionEntries[i] = new PartitionEntry(_io__raw__m_partitionEntries, this, this._root);
      }
      io.seek(_pos);
      return this._m_partitionEntries;
    }
  });

  return ApmPartitionTable;
})();
return ApmPartitionTable;
}));
