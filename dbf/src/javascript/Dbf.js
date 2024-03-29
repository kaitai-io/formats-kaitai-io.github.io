// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Dbf = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * .dbf is a relational database format introduced in DOS database
 * management system dBASE in 1982.
 * 
 * One .dbf file corresponds to one table and contains a series of headers,
 * specification of fields, and a number of fixed-size records.
 * @see {@link http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm|Source}
 */

var Dbf = (function() {
  Dbf.DeleteState = Object.freeze({
    FALSE: 32,
    TRUE: 42,

    32: "FALSE",
    42: "TRUE",
  });

  function Dbf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dbf.prototype._read = function() {
    this.header1 = new Header1(this._io, this, this._root);
    this._raw_header2 = this._io.readBytes(((this.header1.lenHeader - 12) - 1));
    var _io__raw_header2 = new KaitaiStream(this._raw_header2);
    this.header2 = new Header2(_io__raw_header2, this, this._root);
    this.headerTerminator = this._io.readBytes(1);
    if (!((KaitaiStream.byteArrayCompare(this.headerTerminator, [13]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([13], this.headerTerminator, this._io, "/seq/2");
    }
    this._raw_records = [];
    this.records = [];
    for (var i = 0; i < this.header1.numRecords; i++) {
      this._raw_records.push(this._io.readBytes(this.header1.lenRecord));
      var _io__raw_records = new KaitaiStream(this._raw_records[i]);
      this.records.push(new Record(_io__raw_records, this, this._root));
    }
  }

  var Header2 = Dbf.Header2 = (function() {
    function Header2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header2.prototype._read = function() {
      if (this._root.header1.dbaseLevel == 3) {
        this.headerDbase3 = new HeaderDbase3(this._io, this, this._root);
      }
      if (this._root.header1.dbaseLevel == 7) {
        this.headerDbase7 = new HeaderDbase7(this._io, this, this._root);
      }
      this.fields = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.fields.push(new Field(this._io, this, this._root));
        i++;
      }
    }

    return Header2;
  })();

  var Field = Dbf.Field = (function() {
    function Field(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Field.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(11), 0, false), "ASCII");
      this.datatype = this._io.readU1();
      this.dataAddress = this._io.readU4le();
      this.length = this._io.readU1();
      this.decimalCount = this._io.readU1();
      this.reserved1 = this._io.readBytes(2);
      this.workAreaId = this._io.readU1();
      this.reserved2 = this._io.readBytes(2);
      this.setFieldsFlag = this._io.readU1();
      this.reserved3 = this._io.readBytes(8);
    }

    return Field;
  })();

  /**
   * @see {@link http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm|- section 1.1}
   */

  var Header1 = Dbf.Header1 = (function() {
    function Header1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header1.prototype._read = function() {
      this.version = this._io.readU1();
      this.lastUpdateY = this._io.readU1();
      this.lastUpdateM = this._io.readU1();
      this.lastUpdateD = this._io.readU1();
      this.numRecords = this._io.readU4le();
      this.lenHeader = this._io.readU2le();
      this.lenRecord = this._io.readU2le();
    }
    Object.defineProperty(Header1.prototype, 'dbaseLevel', {
      get: function() {
        if (this._m_dbaseLevel !== undefined)
          return this._m_dbaseLevel;
        this._m_dbaseLevel = (this.version & 7);
        return this._m_dbaseLevel;
      }
    });

    return Header1;
  })();

  var HeaderDbase3 = Dbf.HeaderDbase3 = (function() {
    function HeaderDbase3(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderDbase3.prototype._read = function() {
      this.reserved1 = this._io.readBytes(3);
      this.reserved2 = this._io.readBytes(13);
      this.reserved3 = this._io.readBytes(4);
    }

    return HeaderDbase3;
  })();

  var HeaderDbase7 = Dbf.HeaderDbase7 = (function() {
    function HeaderDbase7(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderDbase7.prototype._read = function() {
      this.reserved1 = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.reserved1, [0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0], this.reserved1, this._io, "/types/header_dbase_7/seq/0");
      }
      this.hasIncompleteTransaction = this._io.readU1();
      this.dbaseIvEncryption = this._io.readU1();
      this.reserved2 = this._io.readBytes(12);
      this.productionMdx = this._io.readU1();
      this.languageDriverId = this._io.readU1();
      this.reserved3 = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.reserved3, [0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0], this.reserved3, this._io, "/types/header_dbase_7/seq/6");
      }
      this.languageDriverName = this._io.readBytes(32);
      this.reserved4 = this._io.readBytes(4);
    }

    return HeaderDbase7;
  })();

  var Record = Dbf.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.deleted = this._io.readU1();
      this.recordFields = [];
      for (var i = 0; i < this._root.header2.fields.length; i++) {
        this.recordFields.push(this._io.readBytes(this._root.header2.fields[i].length));
      }
    }

    return Record;
  })();

  return Dbf;
})();
return Dbf;
}));
