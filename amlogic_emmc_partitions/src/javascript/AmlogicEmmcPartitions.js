// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AmlogicEmmcPartitions = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * This is an unnamed and undocumented partition table format implemented by
 * the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
 * series at least, and probably others). They appear to use this rather than GPT,
 * the industry standard, because their BootROM loads and executes the next stage
 * loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
 * header would have to start. So instead of changing their BootROM, Amlogic
 * devised this partition table, which lives at an offset of 36MiB (0x240_0000)
 * on the eMMC and so doesn't conflict. This parser expects as input just the
 * partition table from that offset. The maximum number of partitions in a table
 * is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
 * @see {@link http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef|Source}
 * @see {@link http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef|Source}
 */

var AmlogicEmmcPartitions = (function() {
  function AmlogicEmmcPartitions(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AmlogicEmmcPartitions.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [77, 80, 84, 0]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([77, 80, 84, 0], this.magic, this._io, "/seq/0");
    }
    this.version = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(12), 0, false), "UTF-8");
    this.numPartitions = this._io.readS4le();
    if (!(this.numPartitions >= 1)) {
      throw new KaitaiStream.ValidationLessThanError(1, this.numPartitions, this._io, "/seq/2");
    }
    if (!(this.numPartitions <= 32)) {
      throw new KaitaiStream.ValidationGreaterThanError(32, this.numPartitions, this._io, "/seq/2");
    }
    this.checksum = this._io.readU4le();
    this.partitions = [];
    for (var i = 0; i < this.numPartitions; i++) {
      this.partitions.push(new Partition(this._io, this, this._root));
    }
  }

  var Partition = AmlogicEmmcPartitions.Partition = (function() {
    function Partition(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Partition.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(16), 0, false), "UTF-8");
      this.size = this._io.readU8le();
      this.offset = this._io.readU8le();
      this._raw_flags = this._io.readBytes(4);
      var _io__raw_flags = new KaitaiStream(this._raw_flags);
      this.flags = new PartFlags(_io__raw_flags, this, this._root);
      this.padding = this._io.readBytes(4);
    }

    var PartFlags = Partition.PartFlags = (function() {
      function PartFlags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      PartFlags.prototype._read = function() {
        this.isCode = this._io.readBitsIntLe(1) != 0;
        this.isCache = this._io.readBitsIntLe(1) != 0;
        this.isData = this._io.readBitsIntLe(1) != 0;
      }

      return PartFlags;
    })();

    /**
     * The start of the partition relative to the start of the eMMC, in bytes
     */

    return Partition;
  })();

  /**
   * To calculate this, treat the first (and only the first) partition
   * descriptor in the table below as an array of unsigned little-endian
   * 32-bit integers. Sum all those integers mod 2^32, then multiply the
   * result by the total number of partitions, also mod 2^32. Amlogic
   * likely meant to include all the partition descriptors in the sum,
   * but their code as written instead repeatedly loops over the first
   * one, once for each partition in the table.
   */

  return AmlogicEmmcPartitions;
})();
return AmlogicEmmcPartitions;
}));
