// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AndroidDto = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Format for Android DTB/DTBO partitions. It's kind of archive with
 * dtb/dtbo files. Used only when there is a separate unique partition
 * (dtb, dtbo) on an android device to organize device tree files.
 * The format consists of a header with info about size and number
 * of device tree entries and the entries themselves. This format
 * description could be used to extract device tree entries from a
 * partition images and decompile them with dtc (device tree compiler).
 * @see {@link https://source.android.com/devices/architecture/dto/partitions|Source}
 * @see {@link https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47|Source}
 */

var AndroidDto = (function() {
  function AndroidDto(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidDto.prototype._read = function() {
    this.header = new DtTableHeader(this._io, this, this._root);
    this.entries = new Array(this.header.dtEntryCount);
    for (var i = 0; i < this.header.dtEntryCount; i++) {
      this.entries[i] = new DtTableEntry(this._io, this, this._root);
    }
  }

  var DtTableHeader = AndroidDto.DtTableHeader = (function() {
    function DtTableHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DtTableHeader.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [215, 183, 171, 30]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([215, 183, 171, 30], this.magic, this._io, "/types/dt_table_header/seq/0");
      }
      this.totalSize = this._io.readU4be();
      this.headerSize = this._io.readU4be();
      this.dtEntrySize = this._io.readU4be();
      this.dtEntryCount = this._io.readU4be();
      this.dtEntriesOffset = this._io.readU4be();
      this.pageSize = this._io.readU4be();
      this.version = this._io.readU4be();
    }

    /**
     * includes dt_table_header + all dt_table_entry and all dtb/dtbo
     */

    /**
     * sizeof(dt_table_header)
     */

    /**
     * sizeof(dt_table_entry)
     */

    /**
     * number of dt_table_entry
     */

    /**
     * offset to the first dt_table_entry from head of dt_table_header
     */

    /**
     * flash page size
     */

    /**
     * DTBO image version
     */

    return DtTableHeader;
  })();

  var DtTableEntry = AndroidDto.DtTableEntry = (function() {
    function DtTableEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DtTableEntry.prototype._read = function() {
      this.dtSize = this._io.readU4be();
      this.dtOffset = this._io.readU4be();
      this.id = this._io.readU4be();
      this.rev = this._io.readU4be();
      this.custom = new Array(4);
      for (var i = 0; i < 4; i++) {
        this.custom[i] = this._io.readU4be();
      }
    }

    /**
     * DTB/DTBO file
     */
    Object.defineProperty(DtTableEntry.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.dtOffset);
        this._m_body = io.readBytes(this.dtSize);
        io.seek(_pos);
        return this._m_body;
      }
    });

    /**
     * size of this entry
     */

    /**
     * offset from head of dt_table_header
     */

    /**
     * optional, must be zero if unused
     */

    /**
     * optional, must be zero if unused
     */

    /**
     * optional, must be zero if unused
     */

    return DtTableEntry;
  })();

  return AndroidDto;
})();
return AndroidDto;
}));
