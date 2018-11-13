// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Dbf = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Dbf = (function() {
  function Dbf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Dbf.prototype._read = function() {
    this.header1 = new Header1(this._io, this, this._root);
    this._raw_header2 = this._io.readBytes((this.header1.lenHeader - 12));
    var _io__raw_header2 = new KaitaiStream(this._raw_header2);
    this.header2 = new Header2(_io__raw_header2, this, this._root);
    this.records = new Array(this.header1.numRecords);
    for (var i = 0; i < this.header1.numRecords; i++) {
      this.records[i] = this._io.readBytes(this.header1.lenRecord);
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
      this.fields = new Array(11);
      for (var i = 0; i < 11; i++) {
        this.fields[i] = new Field(this._io, this, this._root);
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
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(11), "ASCII");
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
      this.reserved1 = this._io.ensureFixedContents([0, 0]);
      this.hasIncompleteTransaction = this._io.readU1();
      this.dbaseIvEncryption = this._io.readU1();
      this.reserved2 = this._io.readBytes(12);
      this.productionMdx = this._io.readU1();
      this.languageDriverId = this._io.readU1();
      this.reserved3 = this._io.ensureFixedContents([0, 0]);
      this.languageDriverName = this._io.readBytes(32);
      this.reserved4 = this._io.readBytes(4);
    }

    return HeaderDbase7;
  })();

  return Dbf;
})();
return Dbf;
}));
