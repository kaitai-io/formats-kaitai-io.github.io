// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.GptPartitionTable || (root.GptPartitionTable = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (GptPartitionTable_, KaitaiStream) {
/**
 * @see {@link https://en.wikipedia.org/wiki/GUID_Partition_Table|Source}
 */

var GptPartitionTable = (function() {
  function GptPartitionTable(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GptPartitionTable.prototype._read = function() {
  }

  var PartitionEntry = GptPartitionTable.PartitionEntry = (function() {
    function PartitionEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PartitionEntry.prototype._read = function() {
      this.typeGuid = this._io.readBytes(16);
      this.guid = this._io.readBytes(16);
      this.firstLba = this._io.readU8le();
      this.lastLba = this._io.readU8le();
      this.attributes = this._io.readU8le();
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(72), "UTF-16LE");
    }

    return PartitionEntry;
  })();

  var PartitionHeader = GptPartitionTable.PartitionHeader = (function() {
    function PartitionHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    PartitionHeader.prototype._read = function() {
      this.signature = this._io.readBytes(8);
      if (!((KaitaiStream.byteArrayCompare(this.signature, new Uint8Array([69, 70, 73, 32, 80, 65, 82, 84])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([69, 70, 73, 32, 80, 65, 82, 84]), this.signature, this._io, "/types/partition_header/seq/0");
      }
      this.revision = this._io.readU4le();
      this.headerSize = this._io.readU4le();
      this.crc32Header = this._io.readU4le();
      this.reserved = this._io.readU4le();
      this.currentLba = this._io.readU8le();
      this.backupLba = this._io.readU8le();
      this.firstUsableLba = this._io.readU8le();
      this.lastUsableLba = this._io.readU8le();
      this.diskGuid = this._io.readBytes(16);
      this.entriesStart = this._io.readU8le();
      this.entriesCount = this._io.readU4le();
      this.entriesSize = this._io.readU4le();
      this.crc32Array = this._io.readU4le();
    }
    Object.defineProperty(PartitionHeader.prototype, 'entries', {
      get: function() {
        if (this._m_entries !== undefined)
          return this._m_entries;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.entriesStart * this._root.sectorSize);
        this._raw__m_entries = [];
        this._m_entries = [];
        for (var i = 0; i < this.entriesCount; i++) {
          this._raw__m_entries.push(io.readBytes(this.entriesSize));
          var _io__raw__m_entries = new KaitaiStream(this._raw__m_entries[i]);
          this._m_entries.push(new PartitionEntry(_io__raw__m_entries, this, this._root));
        }
        io.seek(_pos);
        return this._m_entries;
      }
    });

    return PartitionHeader;
  })();
  Object.defineProperty(GptPartitionTable.prototype, 'backup', {
    get: function() {
      if (this._m_backup !== undefined)
        return this._m_backup;
      var io = this._root._io;
      var _pos = io.pos;
      io.seek(this._io.size - this._root.sectorSize);
      this._m_backup = new PartitionHeader(io, this, this._root);
      io.seek(_pos);
      return this._m_backup;
    }
  });
  Object.defineProperty(GptPartitionTable.prototype, 'primary', {
    get: function() {
      if (this._m_primary !== undefined)
        return this._m_primary;
      var io = this._root._io;
      var _pos = io.pos;
      io.seek(this._root.sectorSize);
      this._m_primary = new PartitionHeader(io, this, this._root);
      io.seek(_pos);
      return this._m_primary;
    }
  });
  Object.defineProperty(GptPartitionTable.prototype, 'sectorSize', {
    get: function() {
      if (this._m_sectorSize !== undefined)
        return this._m_sectorSize;
      this._m_sectorSize = 512;
      return this._m_sectorSize;
    }
  });

  return GptPartitionTable;
})();
GptPartitionTable_.GptPartitionTable = GptPartitionTable;
});
