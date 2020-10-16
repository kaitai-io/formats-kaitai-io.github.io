// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.SystemdJournal = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * systemd, a popular user-space system/service management suite on Linux,
 * offers logging functionality, storing incoming logs in a binary journal
 * format.
 * 
 * On live Linux system running systemd, these journals are typically located at:
 * 
 * * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
 * * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
 * @see {@link https://www.freedesktop.org/wiki/Software/systemd/journal-files/|Source}
 */

var SystemdJournal = (function() {
  SystemdJournal.State = Object.freeze({
    OFFLINE: 0,
    ONLINE: 1,
    ARCHIVED: 2,

    0: "OFFLINE",
    1: "ONLINE",
    2: "ARCHIVED",
  });

  function SystemdJournal(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SystemdJournal.prototype._read = function() {
    this._raw_header = this._io.readBytes(this.lenHeader);
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new Header(_io__raw_header, this, this._root);
    this.objects = new Array(this.header.numObjects);
    for (var i = 0; i < this.header.numObjects; i++) {
      this.objects[i] = new JournalObject(this._io, this, this._root);
    }
  }

  var Header = SystemdJournal.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.signature = this._io.readBytes(8);
      if (!((KaitaiStream.byteArrayCompare(this.signature, [76, 80, 75, 83, 72, 72, 82, 72]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([76, 80, 75, 83, 72, 72, 82, 72], this.signature, this._io, "/types/header/seq/0");
      }
      this.compatibleFlags = this._io.readU4le();
      this.incompatibleFlags = this._io.readU4le();
      this.state = this._io.readU1();
      this.reserved = this._io.readBytes(7);
      this.fileId = this._io.readBytes(16);
      this.machineId = this._io.readBytes(16);
      this.bootId = this._io.readBytes(16);
      this.seqnumId = this._io.readBytes(16);
      this.lenHeader = this._io.readU8le();
      this.lenArena = this._io.readU8le();
      this.ofsDataHashTable = this._io.readU8le();
      this.lenDataHashTable = this._io.readU8le();
      this.ofsFieldHashTable = this._io.readU8le();
      this.lenFieldHashTable = this._io.readU8le();
      this.ofsTailObject = this._io.readU8le();
      this.numObjects = this._io.readU8le();
      this.numEntries = this._io.readU8le();
      this.tailEntrySeqnum = this._io.readU8le();
      this.headEntrySeqnum = this._io.readU8le();
      this.ofsEntryArray = this._io.readU8le();
      this.headEntryRealtime = this._io.readU8le();
      this.tailEntryRealtime = this._io.readU8le();
      this.tailEntryMonotonic = this._io.readU8le();
      if (!(this._io.isEof())) {
        this.numData = this._io.readU8le();
      }
      if (!(this._io.isEof())) {
        this.numFields = this._io.readU8le();
      }
      if (!(this._io.isEof())) {
        this.numTags = this._io.readU8le();
      }
      if (!(this._io.isEof())) {
        this.numEntryArrays = this._io.readU8le();
      }
    }

    return Header;
  })();

  /**
   * @see {@link https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects|Source}
   */

  var JournalObject = SystemdJournal.JournalObject = (function() {
    JournalObject.ObjectTypes = Object.freeze({
      UNUSED: 0,
      DATA: 1,
      FIELD: 2,
      ENTRY: 3,
      DATA_HASH_TABLE: 4,
      FIELD_HASH_TABLE: 5,
      ENTRY_ARRAY: 6,
      TAG: 7,

      0: "UNUSED",
      1: "DATA",
      2: "FIELD",
      3: "ENTRY",
      4: "DATA_HASH_TABLE",
      5: "FIELD_HASH_TABLE",
      6: "ENTRY_ARRAY",
      7: "TAG",
    });

    function JournalObject(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    JournalObject.prototype._read = function() {
      this.padding = this._io.readBytes(KaitaiStream.mod((8 - this._io.pos), 8));
      this.objectType = this._io.readU1();
      this.flags = this._io.readU1();
      this.reserved = this._io.readBytes(6);
      this.lenObject = this._io.readU8le();
      switch (this.objectType) {
      case SystemdJournal.JournalObject.ObjectTypes.DATA:
        this._raw_payload = this._io.readBytes((this.lenObject - 16));
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new DataObject(_io__raw_payload, this, this._root);
        break;
      default:
        this.payload = this._io.readBytes((this.lenObject - 16));
        break;
      }
    }

    return JournalObject;
  })();

  /**
   * Data objects are designed to carry log payload, typically in
   * form of a "key=value" string in `payload` attribute.
   * @see {@link https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects|Source}
   */

  var DataObject = SystemdJournal.DataObject = (function() {
    function DataObject(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataObject.prototype._read = function() {
      this.hash = this._io.readU8le();
      this.ofsNextHash = this._io.readU8le();
      this.ofsHeadField = this._io.readU8le();
      this.ofsEntry = this._io.readU8le();
      this.ofsEntryArray = this._io.readU8le();
      this.numEntries = this._io.readU8le();
      this.payload = this._io.readBytesFull();
    }
    Object.defineProperty(DataObject.prototype, 'nextHash', {
      get: function() {
        if (this._m_nextHash !== undefined)
          return this._m_nextHash;
        if (this.ofsNextHash != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsNextHash);
          this._m_nextHash = new JournalObject(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_nextHash;
      }
    });
    Object.defineProperty(DataObject.prototype, 'headField', {
      get: function() {
        if (this._m_headField !== undefined)
          return this._m_headField;
        if (this.ofsHeadField != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsHeadField);
          this._m_headField = new JournalObject(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_headField;
      }
    });
    Object.defineProperty(DataObject.prototype, 'entry', {
      get: function() {
        if (this._m_entry !== undefined)
          return this._m_entry;
        if (this.ofsEntry != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsEntry);
          this._m_entry = new JournalObject(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_entry;
      }
    });
    Object.defineProperty(DataObject.prototype, 'entryArray', {
      get: function() {
        if (this._m_entryArray !== undefined)
          return this._m_entryArray;
        if (this.ofsEntryArray != 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this.ofsEntryArray);
          this._m_entryArray = new JournalObject(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_entryArray;
      }
    });

    return DataObject;
  })();

  /**
   * Header length is used to set substream size, as it thus required
   * prior to declaration of header.
   */
  Object.defineProperty(SystemdJournal.prototype, 'lenHeader', {
    get: function() {
      if (this._m_lenHeader !== undefined)
        return this._m_lenHeader;
      var _pos = this._io.pos;
      this._io.seek(88);
      this._m_lenHeader = this._io.readU8le();
      this._io.seek(_pos);
      return this._m_lenHeader;
    }
  });
  Object.defineProperty(SystemdJournal.prototype, 'dataHashTable', {
    get: function() {
      if (this._m_dataHashTable !== undefined)
        return this._m_dataHashTable;
      var _pos = this._io.pos;
      this._io.seek(this.header.ofsDataHashTable);
      this._m_dataHashTable = this._io.readBytes(this.header.lenDataHashTable);
      this._io.seek(_pos);
      return this._m_dataHashTable;
    }
  });
  Object.defineProperty(SystemdJournal.prototype, 'fieldHashTable', {
    get: function() {
      if (this._m_fieldHashTable !== undefined)
        return this._m_fieldHashTable;
      var _pos = this._io.pos;
      this._io.seek(this.header.ofsFieldHashTable);
      this._m_fieldHashTable = this._io.readBytes(this.header.lenFieldHashTable);
      this._io.seek(_pos);
      return this._m_fieldHashTable;
    }
  });

  return SystemdJournal;
})();
return SystemdJournal;
}));
