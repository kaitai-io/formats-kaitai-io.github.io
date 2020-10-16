// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './VlqBase128Be'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./VlqBase128Be'));
  } else {
    root.Sqlite3 = factory(root.KaitaiStream, root.VlqBase128Be);
  }
}(this, function (KaitaiStream, VlqBase128Be) {
/**
 * SQLite3 is a popular serverless SQL engine, implemented as a library
 * to be used within other applications. It keeps its databases as
 * regular disk files.
 * 
 * Every database file is segmented into pages. First page (starting at
 * the very beginning) is special: it contains a file-global header
 * which specifies some data relevant to proper parsing (i.e. format
 * versions, size of page, etc). After the header, normal contents of
 * the first page follow.
 * 
 * Each page would be of some type, and generally, they would be
 * reached via the links starting from the first page. First page type
 * (`root_page`) is always "btree_page".
 * @see {@link https://www.sqlite.org/fileformat.html|Source}
 */

var Sqlite3 = (function() {
  Sqlite3.Versions = Object.freeze({
    LEGACY: 1,
    WAL: 2,

    1: "LEGACY",
    2: "WAL",
  });

  Sqlite3.Encodings = Object.freeze({
    UTF_8: 1,
    UTF_16LE: 2,
    UTF_16BE: 3,

    1: "UTF_8",
    2: "UTF_16LE",
    3: "UTF_16BE",
  });

  function Sqlite3(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Sqlite3.prototype._read = function() {
    this.magic = this._io.readBytes(16);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0], this.magic, this._io, "/seq/0");
    }
    this.lenPageMod = this._io.readU2be();
    this.writeVersion = this._io.readU1();
    this.readVersion = this._io.readU1();
    this.reservedSpace = this._io.readU1();
    this.maxPayloadFrac = this._io.readU1();
    this.minPayloadFrac = this._io.readU1();
    this.leafPayloadFrac = this._io.readU1();
    this.fileChangeCounter = this._io.readU4be();
    this.numPages = this._io.readU4be();
    this.firstFreelistTrunkPage = this._io.readU4be();
    this.numFreelistPages = this._io.readU4be();
    this.schemaCookie = this._io.readU4be();
    this.schemaFormat = this._io.readU4be();
    this.defPageCacheSize = this._io.readU4be();
    this.largestRootPage = this._io.readU4be();
    this.textEncoding = this._io.readU4be();
    this.userVersion = this._io.readU4be();
    this.isIncrementalVacuum = this._io.readU4be();
    this.applicationId = this._io.readU4be();
    this.reserved = this._io.readBytes(20);
    this.versionValidFor = this._io.readU4be();
    this.sqliteVersionNumber = this._io.readU4be();
    this.rootPage = new BtreePage(this._io, this, this._root);
  }

  var Serial = Sqlite3.Serial = (function() {
    function Serial(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Serial.prototype._read = function() {
      this.code = new VlqBase128Be(this._io, this, null);
    }
    Object.defineProperty(Serial.prototype, 'isBlob', {
      get: function() {
        if (this._m_isBlob !== undefined)
          return this._m_isBlob;
        this._m_isBlob =  ((this.code.value >= 12) && (KaitaiStream.mod(this.code.value, 2) == 0)) ;
        return this._m_isBlob;
      }
    });
    Object.defineProperty(Serial.prototype, 'isString', {
      get: function() {
        if (this._m_isString !== undefined)
          return this._m_isString;
        this._m_isString =  ((this.code.value >= 13) && (KaitaiStream.mod(this.code.value, 2) == 1)) ;
        return this._m_isString;
      }
    });
    Object.defineProperty(Serial.prototype, 'lenContent', {
      get: function() {
        if (this._m_lenContent !== undefined)
          return this._m_lenContent;
        if (this.code.value >= 12) {
          this._m_lenContent = Math.floor((this.code.value - 12) / 2);
        }
        return this._m_lenContent;
      }
    });

    return Serial;
  })();

  var BtreePage = Sqlite3.BtreePage = (function() {
    function BtreePage(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BtreePage.prototype._read = function() {
      this.pageType = this._io.readU1();
      this.firstFreeblock = this._io.readU2be();
      this.numCells = this._io.readU2be();
      this.ofsCells = this._io.readU2be();
      this.numFragFreeBytes = this._io.readU1();
      if ( ((this.pageType == 2) || (this.pageType == 5)) ) {
        this.rightPtr = this._io.readU4be();
      }
      this.cells = new Array(this.numCells);
      for (var i = 0; i < this.numCells; i++) {
        this.cells[i] = new RefCell(this._io, this, this._root);
      }
    }

    return BtreePage;
  })();

  /**
   * @see {@link https://www.sqlite.org/fileformat.html#b_tree_pages|Source}
   */

  var CellIndexLeaf = Sqlite3.CellIndexLeaf = (function() {
    function CellIndexLeaf(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CellIndexLeaf.prototype._read = function() {
      this.lenPayload = new VlqBase128Be(this._io, this, null);
      this._raw_payload = this._io.readBytes(this.lenPayload.value);
      var _io__raw_payload = new KaitaiStream(this._raw_payload);
      this.payload = new CellPayload(_io__raw_payload, this, this._root);
    }

    return CellIndexLeaf;
  })();

  var Serials = Sqlite3.Serials = (function() {
    function Serials(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Serials.prototype._read = function() {
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new VlqBase128Be(this._io, this, null));
        i++;
      }
    }

    return Serials;
  })();

  /**
   * @see {@link https://www.sqlite.org/fileformat.html#b_tree_pages|Source}
   */

  var CellTableLeaf = Sqlite3.CellTableLeaf = (function() {
    function CellTableLeaf(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CellTableLeaf.prototype._read = function() {
      this.lenPayload = new VlqBase128Be(this._io, this, null);
      this.rowId = new VlqBase128Be(this._io, this, null);
      this._raw_payload = this._io.readBytes(this.lenPayload.value);
      var _io__raw_payload = new KaitaiStream(this._raw_payload);
      this.payload = new CellPayload(_io__raw_payload, this, this._root);
    }

    return CellTableLeaf;
  })();

  /**
   * @see {@link https://sqlite.org/fileformat2.html#record_format|Source}
   */

  var CellPayload = Sqlite3.CellPayload = (function() {
    function CellPayload(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CellPayload.prototype._read = function() {
      this.lenHeaderAndLen = new VlqBase128Be(this._io, this, null);
      this._raw_columnSerials = this._io.readBytes((this.lenHeaderAndLen.value - 1));
      var _io__raw_columnSerials = new KaitaiStream(this._raw_columnSerials);
      this.columnSerials = new Serials(_io__raw_columnSerials, this, this._root);
      this.columnContents = new Array(this.columnSerials.entries.length);
      for (var i = 0; i < this.columnSerials.entries.length; i++) {
        this.columnContents[i] = new ColumnContent(this._io, this, this._root, this.columnSerials.entries[i]);
      }
    }

    return CellPayload;
  })();

  /**
   * @see {@link https://www.sqlite.org/fileformat.html#b_tree_pages|Source}
   */

  var CellTableInterior = Sqlite3.CellTableInterior = (function() {
    function CellTableInterior(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CellTableInterior.prototype._read = function() {
      this.leftChildPage = this._io.readU4be();
      this.rowId = new VlqBase128Be(this._io, this, null);
    }

    return CellTableInterior;
  })();

  /**
   * @see {@link https://www.sqlite.org/fileformat.html#b_tree_pages|Source}
   */

  var CellIndexInterior = Sqlite3.CellIndexInterior = (function() {
    function CellIndexInterior(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CellIndexInterior.prototype._read = function() {
      this.leftChildPage = this._io.readU4be();
      this.lenPayload = new VlqBase128Be(this._io, this, null);
      this._raw_payload = this._io.readBytes(this.lenPayload.value);
      var _io__raw_payload = new KaitaiStream(this._raw_payload);
      this.payload = new CellPayload(_io__raw_payload, this, this._root);
    }

    return CellIndexInterior;
  })();

  var ColumnContent = Sqlite3.ColumnContent = (function() {
    function ColumnContent(_io, _parent, _root, ser) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.ser = ser;

      this._read();
    }
    ColumnContent.prototype._read = function() {
      if ( ((this.serialType.code.value >= 1) && (this.serialType.code.value <= 6)) ) {
        switch (this.serialType.code.value) {
        case 4:
          this.asInt = this._io.readU4be();
          break;
        case 6:
          this.asInt = this._io.readU8be();
          break;
        case 1:
          this.asInt = this._io.readU1();
          break;
        case 3:
          this.asInt = this._io.readBitsIntBe(24);
          break;
        case 5:
          this.asInt = this._io.readBitsIntBe(48);
          break;
        case 2:
          this.asInt = this._io.readU2be();
          break;
        }
      }
      if (this.serialType.code.value == 7) {
        this.asFloat = this._io.readF8be();
      }
      if (this.serialType.isBlob) {
        this.asBlob = this._io.readBytes(this.serialType.lenContent);
      }
      this.asStr = KaitaiStream.bytesToStr(this._io.readBytes(this.serialType.lenContent), "UTF-8");
    }
    Object.defineProperty(ColumnContent.prototype, 'serialType', {
      get: function() {
        if (this._m_serialType !== undefined)
          return this._m_serialType;
        this._m_serialType = this.ser;
        return this._m_serialType;
      }
    });

    return ColumnContent;
  })();

  var RefCell = Sqlite3.RefCell = (function() {
    function RefCell(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RefCell.prototype._read = function() {
      this.ofsBody = this._io.readU2be();
    }
    Object.defineProperty(RefCell.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(this.ofsBody);
        switch (this._parent.pageType) {
        case 13:
          this._m_body = new CellTableLeaf(this._io, this, this._root);
          break;
        case 5:
          this._m_body = new CellTableInterior(this._io, this, this._root);
          break;
        case 10:
          this._m_body = new CellIndexLeaf(this._io, this, this._root);
          break;
        case 2:
          this._m_body = new CellIndexInterior(this._io, this, this._root);
          break;
        }
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return RefCell;
  })();
  Object.defineProperty(Sqlite3.prototype, 'lenPage', {
    get: function() {
      if (this._m_lenPage !== undefined)
        return this._m_lenPage;
      this._m_lenPage = (this.lenPageMod == 1 ? 65536 : this.lenPageMod);
      return this._m_lenPage;
    }
  });

  /**
   * The database page size in bytes. Must be a power of two between
   * 512 and 32768 inclusive, or the value 1 representing a page size
   * of 65536.
   */

  /**
   * Bytes of unused "reserved" space at the end of each page. Usually 0.
   */

  /**
   * Maximum embedded payload fraction. Must be 64.
   */

  /**
   * Minimum embedded payload fraction. Must be 32.
   */

  /**
   * Leaf payload fraction. Must be 32.
   */

  /**
   * Size of the database file in pages. The "in-header database size".
   */

  /**
   * Page number of the first freelist trunk page.
   */

  /**
   * Total number of freelist pages.
   */

  /**
   * The schema format number. Supported schema formats are 1, 2, 3, and 4.
   */

  /**
   * Default page cache size.
   */

  /**
   * The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
   */

  /**
   * The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
   */

  /**
   * The "user version" as read and set by the user_version pragma.
   */

  /**
   * True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
   */

  /**
   * The "Application ID" set by PRAGMA application_id.
   */

  return Sqlite3;
})();
return Sqlite3;
}));
