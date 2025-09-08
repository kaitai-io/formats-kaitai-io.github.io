// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AndroidSuper || (root.AndroidSuper = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AndroidSuper_, KaitaiStream) {
/**
 * The metadata stored by Android at the beginning of a "super" partition, which
 * is what it calls a disk partition that holds one or more Dynamic Partitions.
 * Dynamic Partitions do more or less the same thing that LVM does on Linux,
 * allowing Android to map ranges of non-contiguous extents to a single logical
 * device. This metadata holds that mapping.
 * @see {@link https://source.android.com/docs/core/ota/dynamic_partitions|Source}
 * @see {@link https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h|Source}
 */

var AndroidSuper = (function() {
  function AndroidSuper(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidSuper.prototype._read = function() {
  }

  var Geometry = AndroidSuper.Geometry = (function() {
    function Geometry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Geometry.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([103, 68, 108, 97])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([103, 68, 108, 97]), this.magic, this._io, "/types/geometry/seq/0");
      }
      this.structSize = this._io.readU4le();
      this.checksum = this._io.readBytes(32);
      this.metadataMaxSize = this._io.readU4le();
      this.metadataSlotCount = this._io.readU4le();
      this.logicalBlockSize = this._io.readU4le();
    }

    /**
     * SHA-256 hash of struct_size bytes from beginning of geometry,
     * calculated as if checksum were zeroed out
     */

    return Geometry;
  })();

  var Metadata = AndroidSuper.Metadata = (function() {
    Metadata.TableKind = Object.freeze({
      PARTITIONS: 0,
      EXTENTS: 1,
      GROUPS: 2,
      BLOCK_DEVICES: 3,

      0: "PARTITIONS",
      1: "EXTENTS",
      2: "GROUPS",
      3: "BLOCK_DEVICES",
    });

    function Metadata(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Metadata.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([48, 80, 76, 65])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([48, 80, 76, 65]), this.magic, this._io, "/types/metadata/seq/0");
      }
      this.majorVersion = this._io.readU2le();
      this.minorVersion = this._io.readU2le();
      this.headerSize = this._io.readU4le();
      this.headerChecksum = this._io.readBytes(32);
      this.tablesSize = this._io.readU4le();
      this.tablesChecksum = this._io.readBytes(32);
      this.partitions = new TableDescriptor(this._io, this, this._root, AndroidSuper.Metadata.TableKind.PARTITIONS);
      this.extents = new TableDescriptor(this._io, this, this._root, AndroidSuper.Metadata.TableKind.EXTENTS);
      this.groups = new TableDescriptor(this._io, this, this._root, AndroidSuper.Metadata.TableKind.GROUPS);
      this.blockDevices = new TableDescriptor(this._io, this, this._root, AndroidSuper.Metadata.TableKind.BLOCK_DEVICES);
    }

    var BlockDevice = Metadata.BlockDevice = (function() {
      function BlockDevice(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      BlockDevice.prototype._read = function() {
        this.firstLogicalSector = this._io.readU8le();
        this.alignment = this._io.readU4le();
        this.alignmentOffset = this._io.readU4le();
        this.size = this._io.readU8le();
        this.partitionName = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(36), 0, false), "UTF-8");
        this.flagSlotSuffixed = this._io.readBitsIntLe(1) != 0;
        this.flagsReserved = this._io.readBitsIntLe(31);
      }

      return BlockDevice;
    })();

    var Extent = Metadata.Extent = (function() {
      Extent.TargetType = Object.freeze({
        LINEAR: 0,
        ZERO: 1,

        0: "LINEAR",
        1: "ZERO",
      });

      function Extent(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Extent.prototype._read = function() {
        this.numSectors = this._io.readU8le();
        this.targetType = this._io.readU4le();
        this.targetData = this._io.readU8le();
        this.targetSource = this._io.readU4le();
      }

      return Extent;
    })();

    var Group = Metadata.Group = (function() {
      function Group(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Group.prototype._read = function() {
        this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(36), 0, false), "UTF-8");
        this.flagSlotSuffixed = this._io.readBitsIntLe(1) != 0;
        this.flagsReserved = this._io.readBitsIntLe(31);
        this._io.alignToByte();
        this.maximumSize = this._io.readU8le();
      }

      return Group;
    })();

    var Partition = Metadata.Partition = (function() {
      function Partition(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      Partition.prototype._read = function() {
        this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(36), 0, false), "UTF-8");
        this.attrReadonly = this._io.readBitsIntLe(1) != 0;
        this.attrSlotSuffixed = this._io.readBitsIntLe(1) != 0;
        this.attrUpdated = this._io.readBitsIntLe(1) != 0;
        this.attrDisabled = this._io.readBitsIntLe(1) != 0;
        this.attrsReserved = this._io.readBitsIntLe(28);
        this._io.alignToByte();
        this.firstExtentIndex = this._io.readU4le();
        this.numExtents = this._io.readU4le();
        this.groupIndex = this._io.readU4le();
      }

      return Partition;
    })();

    var TableDescriptor = Metadata.TableDescriptor = (function() {
      function TableDescriptor(_io, _parent, _root, kind) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;
        this.kind = kind;

        this._read();
      }
      TableDescriptor.prototype._read = function() {
        this.offset = this._io.readU4le();
        this.numEntries = this._io.readU4le();
        this.entrySize = this._io.readU4le();
      }
      Object.defineProperty(TableDescriptor.prototype, 'table', {
        get: function() {
          if (this._m_table !== undefined)
            return this._m_table;
          var _pos = this._io.pos;
          this._io.seek(this._parent.headerSize + this.offset);
          this._raw__m_table = [];
          this._m_table = [];
          for (var i = 0; i < this.numEntries; i++) {
            switch (this.kind) {
            case AndroidSuper.Metadata.TableKind.BLOCK_DEVICES:
              this._raw__m_table.push(this._io.readBytes(this.entrySize));
              var _io__raw__m_table = new KaitaiStream(this._raw__m_table[i]);
              this._m_table.push(new BlockDevice(_io__raw__m_table, this, this._root));
              break;
            case AndroidSuper.Metadata.TableKind.EXTENTS:
              this._raw__m_table.push(this._io.readBytes(this.entrySize));
              var _io__raw__m_table = new KaitaiStream(this._raw__m_table[i]);
              this._m_table.push(new Extent(_io__raw__m_table, this, this._root));
              break;
            case AndroidSuper.Metadata.TableKind.GROUPS:
              this._raw__m_table.push(this._io.readBytes(this.entrySize));
              var _io__raw__m_table = new KaitaiStream(this._raw__m_table[i]);
              this._m_table.push(new Group(_io__raw__m_table, this, this._root));
              break;
            case AndroidSuper.Metadata.TableKind.PARTITIONS:
              this._raw__m_table.push(this._io.readBytes(this.entrySize));
              var _io__raw__m_table = new KaitaiStream(this._raw__m_table[i]);
              this._m_table.push(new Partition(_io__raw__m_table, this, this._root));
              break;
            default:
              this._m_table.push(this._io.readBytes(this.entrySize));
              break;
            }
          }
          this._io.seek(_pos);
          return this._m_table;
        }
      });

      return TableDescriptor;
    })();

    /**
     * SHA-256 hash of header_size bytes from beginning of metadata,
     * calculated as if header_checksum were zeroed out
     */

    /**
     * SHA-256 hash of tables_size bytes from end of header
     */

    return Metadata;
  })();

  var Root = AndroidSuper.Root = (function() {
    function Root(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Root.prototype._read = function() {
      this._raw_primaryGeometry = this._io.readBytes(4096);
      var _io__raw_primaryGeometry = new KaitaiStream(this._raw_primaryGeometry);
      this.primaryGeometry = new Geometry(_io__raw_primaryGeometry, this, this._root);
      this._raw_backupGeometry = this._io.readBytes(4096);
      var _io__raw_backupGeometry = new KaitaiStream(this._raw_backupGeometry);
      this.backupGeometry = new Geometry(_io__raw_backupGeometry, this, this._root);
      this._raw_primaryMetadata = [];
      this.primaryMetadata = [];
      for (var i = 0; i < this.primaryGeometry.metadataSlotCount; i++) {
        this._raw_primaryMetadata.push(this._io.readBytes(this.primaryGeometry.metadataMaxSize));
        var _io__raw_primaryMetadata = new KaitaiStream(this._raw_primaryMetadata[i]);
        this.primaryMetadata.push(new Metadata(_io__raw_primaryMetadata, this, this._root));
      }
      this._raw_backupMetadata = [];
      this.backupMetadata = [];
      for (var i = 0; i < this.primaryGeometry.metadataSlotCount; i++) {
        this._raw_backupMetadata.push(this._io.readBytes(this.primaryGeometry.metadataMaxSize));
        var _io__raw_backupMetadata = new KaitaiStream(this._raw_backupMetadata[i]);
        this.backupMetadata.push(new Metadata(_io__raw_backupMetadata, this, this._root));
      }
    }

    return Root;
  })();
  Object.defineProperty(AndroidSuper.prototype, 'root', {
    get: function() {
      if (this._m_root !== undefined)
        return this._m_root;
      var _pos = this._io.pos;
      this._io.seek(4096);
      this._m_root = new Root(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_root;
    }
  });

  return AndroidSuper;
})();
AndroidSuper_.AndroidSuper = AndroidSuper;
});
